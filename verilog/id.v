`include "define.v"
module id(
    input clock,
    input reset,
    // from ifetch
    input [31:0]    inst_i,
    input [63:0]    pc_i,
    // forward-regfile
    input [4:0]     rf_ex_rd_i,
    input [4:0]     rf_mem_rd_i,
    input [4:0]     rf_wb_rd_i,
    input [63:0]    rf_ex_wdata_i,
    input [63:0]    rf_mem_wdata_i,
    input [63:0]    rf_wb_wdata_i,
    // forward-csr
    input [11:0]    csr_ex_addr_i,
    input [11:0]    csr_mem_addr_i,
    input [11:0]    csr_wb_addr_i,
    input [63:0]    csr_ex_wdata_i,
    input [63:0]    csr_mem_wdata_i,
    input [63:0]    csr_wb_wdata_i,
    // read regfile
    input [63:0]    rs1val_i,
    input [63:0]    rs2val_i,
    // read csr
    input [1:0]     priv_i,
    input [63:0]    csrVal_i,
    // special CSRs
    input [63:0]    mtvec_i,
    input [63:0]    mepc_i,
    input [63:0]    sepc_i,
    input [63:0]    uepc_i,
    // read after load hazard
    // that prev inst's data will be ready in stage MEM
    input           prev_is_load_or_rva_i,
    // to set jalr's link address
    input           is_compressed_i,
    // read regfile
    output reg [4:0]    rs1_o,
    output reg [4:0]    rs2_o,
    // read csr
    output reg [11:0]   csr_addr_o,
    // aluOp
    output reg [63:0]   srcA_o,
    output reg [63:0]   srcB_o,
    output reg [4:0]    aluop_o,
    // write regfile
    output reg          rf_wen_o,
    output reg [4:0]    rd_o,
    // mem
    output reg          load_o,
    output reg          store_o,
    output reg [2:0]    funct3_o,   // used by load/store
    output reg [63:0]   sdata_o,    // store data
    // to ifetch
    output reg          branch_o,
    output reg [63:0]   branch_target_o,
    // write csr
    output reg          csr_wen_o,
    output reg [63:0]   csr_wdata_o,
    // rva
    output reg [4:0]    funct5_o,
    output reg          rva_valid_o,
    // control
    output reg          branch_flush_o,
    output reg          load_use_o,
    output reg          fence_o,
    // exception
    output reg [63:0]   pc_o,       // debug & write xepc
    output reg [63:0]   cause_o,
    output reg          exception_o
);
    task error();
        if (pc_i != 0)    begin
            $display("unsupported instruction at pc = %x. inst = %x", pc_i, inst_i);
            $finish();
        end
    endtask

    wire [6:0]  opcode = inst_i[6:0];
    wire [6:0]  funct7 = inst_i[31:25];
    wire [4:0]  funct5 = inst_i[31:27];   // rvc
    wire aq = inst_i[26], rl = inst_i[25];  // dont care?
    wire [2:0]  funct3 = inst_i[14:12];
    wire [4:0]  rs1 = inst_i[19:15], rs2 = inst_i[24:20], rd = inst_i[11:7];
    wire [63:0] immI = `SEXT(inst_i[31:20], 12, 64);
    wire [63:0] immJ = `SEXT({inst_i[31], inst_i[19:12], inst_i[20], inst_i[30:21], 1'b0}, 21, 64);    // shift left by 1, making immJ always a multiple of 2
    wire [63:0] immU = `SEXT({inst_i[31:12], 12'b0}, 32, 64);
    wire [63:0] immS = `SEXT({inst_i[31:25], inst_i[11:7]}, 12, 64);
    wire [63:0] immB = `SEXT({inst_i[31], inst_i[7], inst_i[30:25], inst_i[11:8], 1'b0}, 13, 64);      // shift left by 1

    wire [63:0] rs1val = (rs1_o == 5'd0)? 0 :
                        (rs1_o == rf_ex_rd_i) ? rf_ex_wdata_i :
                        (rs1_o == rf_mem_rd_i)? rf_mem_wdata_i :
                        (rs1_o == rf_wb_rd_i)?  rf_wb_wdata_i:
                        rs1val_i;

    wire [63:0] rs2val = (rs2_o == 5'd0)? 0 :
                        (rs2_o == rf_ex_rd_i) ? rf_ex_wdata_i :
                        (rs2_o == rf_mem_rd_i)? rf_mem_wdata_i :
                        (rs2_o == rf_wb_rd_i)?  rf_wb_wdata_i:
                        rs2val_i;

    wire [63:0] csrVal = (csr_addr_o == csr_ex_addr_i)? csr_ex_wdata_i:
                        (csr_addr_o == csr_mem_addr_i)? csr_mem_wdata_i:
                        (csr_addr_o == csr_wb_addr_i)?  csr_wb_wdata_i:
                        csrVal_i;

    assign pc_o = pc_i;
    assign branch_flush_o = branch_o & ~load_use_o;
    assign load_use_o = prev_is_load_or_rva_i & ((rf_ex_rd_i == rs1_o) | (rf_ex_rd_i == rs2_o));
    // decode
    always @* begin
        // default values
        // alu
        srcA_o = 64'b0;
        srcB_o = 64'b0;
        aluop_o = `ALU_ADD;
        // write regfile
        rf_wen_o = 1'b0;
        rd_o = 5'b0;
        // write csr
        csr_wen_o = 1'b0;
        csr_wdata_o = 64'b0;
        csr_addr_o = 64'b0;
        // mem
        load_o = 1'b0;
        store_o = 1'b0;
        sdata_o = 64'b0;
        funct3_o = funct3;
        // branch
        branch_o = 1'b0;
        branch_target_o = 64'b0;
        rs1_o = rs1;
        rs2_o = rs2;
        // rva
        rva_valid_o = 1'b0;
        funct5_o = funct5;
        // exception
        exception_o = 1'b0;
        cause_o = 64'b0;
        fence_o = 1'b0;
        case (opcode)
            `OPCODE_ARITH_I:   begin   // I-type
                // default values
                rf_wen_o = 1;
                rd_o = rd;
                srcA_o = rs1val;
                srcB_o = immI;
                case (funct3)
                    `FCT3_ADDI: aluop_o = `ALU_ADD;
                    `FCT3_SLTI: aluop_o = `ALU_SLT;
                    `FCT3_SLTIU:aluop_o = `ALU_SLTU;
                    `FCT3_XORI: aluop_o = `ALU_XOR;
                    `FCT3_ANDI: aluop_o = `ALU_AND;
                    `FCT3_ORI:  aluop_o = `ALU_OR;
                    `FCT3_SLLI: aluop_o = `ALU_SLL;
                    `FCT3_SRLI_SRAI:    aluop_o = funct7[5]? `ALU_SRA: `ALU_SRL;
                    default:    error();
                endcase
            end // arith-i

            `OPCODE_ARITH_R:   begin
                // rd = rs1 op rs2
                rf_wen_o = 1;
                rd_o = rd;
                srcA_o = rs1val;
                srcB_o = rs2val;
                case (funct7)
                    7'h00: begin        // most instruction
                        case (funct3)
                            `FCT3_ADD:  aluop_o = `ALU_ADD;
                            `FCT3_SLL:  aluop_o = `ALU_SLL;
                            `FCT3_SLT:  aluop_o = `ALU_SLT;
                            `FCT3_SLTU: aluop_o = `ALU_SLTU;
                            `FCT3_XOR:  aluop_o = `ALU_XOR;
                            `FCT3_SRL:  aluop_o = `ALU_SRL;
                            `FCT3_OR:   aluop_o = `ALU_OR;
                            `FCT3_AND:  aluop_o = `ALU_AND;
                            default:    error();
                        endcase
                    end

                    7'h01: begin        // M-extension
                        case (funct3)
                            // low, signed
                            `FCT3_MUL:  aluop_o = `ALU_MUL;
                            `FCT3_DIV:  aluop_o = `ALU_DIV;
                            `FCT3_REM:  aluop_o = `ALU_REM;
                            // low, unsigned
                            `FCT3_DIVU: aluop_o = `ALU_DIVU;
                            `FCT3_REMU: aluop_o = `ALU_REMU;
                            // high, unsigned
                            `FCT3_MULHU:aluop_o = `ALU_MULHU;
                            // high, signed
                            `FCT3_MULH: aluop_o = `ALU_MULH;
                            // high, signed rs, unsigned rs2
                            `FCT3_MULHSU:aluop_o = `ALU_MULHSU;
                            default:    error();
                        endcase
                    end

                    7'h20: begin
                        case (funct3)
                            `FCT3_SUB:  aluop_o = `ALU_SUB;
                            `FCT3_SRA:  aluop_o = `ALU_SRA;
                            default:    error();
                        endcase
                    end
                    default:    error();
                endcase // funct7
            end // arith-r

            `OPCODE_RV64_ARITH_I: begin
                // rd = rs1 op rs2
                rf_wen_o = 1'b1;
                rd_o = rd;
                srcA_o = {32'b0, rs1val[31:0]};
                srcB_o = immI;
                case (funct3)
                    `FCT3_ADDIW:    aluop_o = `ALU_ADDW;
                    `FCT3_SLLIW:    aluop_o = `ALU_SLLW;
                    `FCT3_SRLIW_SRAIW:
                        aluop_o = funct7[5]? `ALU_SRAW: `ALU_SRLW;
                    default:    error();
                endcase
            end // rv64i arith-i

            `OPCODE_RV64_ARITH_R: begin
                // rd = rs1 op rs2
                rf_wen_o = 1'b1;
                rd_o = rd;
                srcA_o = {32'b0, rs1val};
                srcB_o = {32'b0, rs2val};
                case (funct7)
                    7'h00:  begin
                        case (funct3)
                            `FCT3_ADDW: aluop_o = `ALU_ADDW;
                            `FCT3_SLLW: aluop_o = `ALU_SLLW;
                            `FCT3_SRLW: aluop_o = `ALU_SRLW;
                            default:    error();
                        endcase
                    end
                    7'h01:  begin   // rv64m
                        case (funct3)
                            `FCT3_MULW: aluop_o = `ALU_MULW;
                            `FCT3_DIVW: aluop_o = `ALU_DIVW;
                            `FCT3_DIVUW:aluop_o = `ALU_DIVUW;
                            `FCT3_REMW: aluop_o = `ALU_REMW;
                            `FCT3_REMUW:aluop_o = `ALU_REMUW;
                            default:    error();
                        endcase
                    end
                    7'h20:  begin
                        case (funct3)
                            `FCT3_SUBW: aluop_o = `ALU_SUBW;
                            `FCT3_SRAW: aluop_o = `ALU_SRAW;
                            default:    error();
                        endcase
                    end
                    default:    error();
                endcase
            end // rv64i arith-r
            `OPCODE_LOAD:   begin
                // rd = M[rs1 + imm]
                // ALU: calculate the address
                rf_wen_o = 1'b1;
                rd_o = rd;
                load_o = 1'b1;
                srcA_o = rs1val;
                srcB_o = immI;
            end

            `OPCODE_STORE:  begin
                // M[rs1 + imm] = rs2
                // ALU: calculate the address
                store_o = 1'b1;
                srcA_o = rs1val;
                srcB_o = immS;
                sdata_o = rs2val;
            end

            `OPCODE_BRANCH: begin
                // if (rs1 op rs2) pc += imm
                branch_target_o = pc_i + immB;
                case (funct3)
                    `FCT3_BEQ:  branch_o = rs1val == rs2val;
                    `FCT3_BNE:  branch_o = rs1val != rs2val;
                    `FCT3_BLTU: branch_o = rs1val <  rs2val;
                    `FCT3_BGEU: branch_o = rs1val >= rs2val;
                    `FCT3_BLT:  branch_o = $signed(rs1val) <  $signed(rs2val);
                    `FCT3_BGE:  branch_o = $signed(rs1val) >= $signed(rs2val);
                    default:    error();
                endcase
            end

            `OPCODE_JAL:    begin   // J-type
                // rd = pc + 4; pc += immJ
                rf_wen_o = 1;
                rd_o = rd;
                srcA_o = pc_i;
                srcB_o = 64'd4;
                branch_o = 1'b1;
                branch_target_o = pc_i + immJ;
            end

            `OPCODE_JALR:   begin   // I-type
                // rd = pc + 4; pc += rs1 + immI
                rf_wen_o = 1;
                rd_o = rd;
                srcA_o = pc_i;
                srcB_o = is_compressed_i? 64'd2: 64'd4;
                branch_o = 1'b1;
                branch_target_o = rs1val + immI;
            end

            `OPCODE_AUIPC:  begin   // U-type
                // rd = pc + imm << 12
                rf_wen_o = 1'b1;
                rd_o = rd;
                srcA_o = pc_i;
                srcB_o = immU;
            end

            `OPCODE_LUI:    begin   // U-type
                // rd = imm << 12
                rf_wen_o = 1'b1;
                rd_o = rd;
                srcA_o = immU;
                srcB_o = 64'b0;
            end

            `OPCODE_AMO:    begin
                // all need to access amemory & write regfile
                rva_valid_o = 1'b1;
                load_o = (funct5 != `FCT5_SC);
                store_o = (funct5 != `FCT5_LR);
                rf_wen_o = 1'b1;
                rd_o = rd;
                srcA_o = rs1val;    // addr
                case (funct5)
                    // min/max: these sdata will be dealt in ID
                    `FCT5_AMOMAX:   sdata_o = MAX(rs1val, rs2val);
                    `FCT5_AMOMAXU:  sdata_o = MAXU(rs1val, rs2val);
                    `FCT5_AMOMIN:   sdata_o = MIN(rs1val, rs2val);
                    `FCT5_AMOMINU:  sdata_o = MINU(rs1val, rs2val);
                    default:        sdata_o = rs2val;   // need some further process in MEM
                endcase
            end

            `OPCODE_SYS:    begin
                if (funct3 != `FCT3_TRAP)   begin
                    // write regfile: x[rd] = CSRs[csr]
                    rf_wen_o = 1;
                    rd_o = rd;
                    srcA_o = csrVal;
                    srcB_o = 0;
                    aluop_o = `ALU_ADD;
                    // write csr
                    csr_wen_o = 1;
                    csr_addr_o = (funct3 == `FCT3_TRAP)? 0: inst_i[31:20];
                end
                case (funct3)
                    `FCT3_TRAP: begin
                        case (inst_i[31:20])
                            `IMM_EBREAK:    begin
                                exception_o = 1'b1;
                                cause_o = `BREAKPOINT;
                            end
                            `IMM_MRET:  begin
                                exception_o = 1'b1;
                                cause_o = `MRET;
                            end
                            `IMM_SRET:  begin
                                exception_o = 1'b1;
                                cause_o = `SRET;
                            end
                            `IMM_URET:  begin
                                exception_o = 1'b1;
                                cause_o = `URET;
                            end
                            // xv6: ecall will only be used in user mode. pc = stvec, next priv = s
                            `IMM_ECALL: begin           // pc = xtvec
                                exception_o = 1'b1;
                                cause_o = (priv_i == `PRIV_M)? `ECALL_FROM_M :
                                            (priv_i == `PRIV_S)? `ECALL_FROM_S :
                                            (priv_i == `PRIV_U)? `ECALL_FROM_U :
                                            `ECALL_FROM_M;
                            end
                            `IMM_WFI:;
                            default:    error();
                        endcase
                    end
                    // these csr-insts will write both refgile & csr
                    // write regfile could be done by alu
                    `FCT3_CSRRW:    csr_wdata_o = rs1val;
                    `FCT3_CSRRS:    csr_wdata_o = csrVal | rs1val;
                    `FCT3_CSRRC:    csr_wdata_o = csrVal & ~rs1val;
                    `FCT3_CSRRWI:   csr_wdata_o = {59'b0, rs1};
                    `FCT3_CSRRSI:   csr_wdata_o = csrVal | {59'b0, rs1};
                    `FCT3_CSRRCI:   csr_wdata_o = csrVal & ~{59'b0, rs1};
                endcase
            end

            `OPCODE_FENCE:  fence_o = 1'b1;     // insert some bubbles
            default:    error();
        endcase // opcode
    end

endmodule