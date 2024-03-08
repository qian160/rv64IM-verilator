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
    input [63:0]    csrVal_i,
    // read after load hazard
    input           prev_is_load_i,
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
    output reg          mret_o,
    output reg [63:0]   branch_target_o,
    // write csr
    output reg          csr_wen_o,
    output reg [63:0]   csr_wdata_o,
    // control
    output reg          branch_flush_o,
    output reg          load_use_o,
    // exception
    output reg [63:0]   pc_o,
    output reg [63:0]   mcause_o,
    output reg          exception_o
);
    task error(input [63:0] pc);
        $display("unsupported instruction at pc = %x", pc);
        $finish();
    endtask

    wire [31:0] inst;
    RVCExpander e(
        .pc_i(pc_i),
        .inst_i(inst_i),
        .inst_o(inst)
    );

    wire [6:0]  opcode = inst[6:0];
    wire [6:0]  funct7 = inst[31:25];
    wire [4:0]  rs1 = inst[19:15], rs2 = inst[24:20], rd = inst[11:7];
    wire [2:0]  funct3 = inst[14:12];
    wire [63:0] immI = `SEXT(inst[31:20], 12, 64);
    wire [63:0] immJ = `SEXT({inst[31], inst[19:12], inst[20], inst[30:21], 1'b0}, 21, 64);    // shift left by 1, making immJ always a multiple of 2
    wire [63:0] immU = `SEXT({inst[31:12], 12'b0}, 32, 64);
    wire [63:0] immS = `SEXT({inst[31:25], inst[11:7]}, 12, 64);
    wire [63:0] immB = `SEXT({inst[31], inst[7], inst[30:25], inst[11:8], 1'b0}, 13, 64);      // shift left by 1

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
    assign load_use_o = prev_is_load_i & ((rf_ex_rd_i == rs1_o) | (rf_ex_rd_i == rs2_o));
    // decode
    always @* begin
        // default values
        // alu
        srcA_o = 0;
        srcB_o = 0;
        aluop_o = `ALU_ADD;
        // write regfile
        rf_wen_o = 0;
        rd_o = 5'b0;
        // write csr
        csr_wen_o = 0;
        csr_wdata_o = 0;
        csr_addr_o = 0;
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
        // exception
        exception_o = 1'b0;
        mcause_o = 64'b0;
        mret_o = 1'b0;
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
                    default:    error(pc_i);
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
                            default:    error(pc_i);
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
                            default:    error(pc_i);
                        endcase
                    end

                    7'h20: begin
                        case (funct3)
                            `FCT3_SUB:  aluop_o = `ALU_SUB;
                            `FCT3_SRA:  aluop_o = `ALU_SRA;
                            default:    error(pc_i);
                        endcase
                    end
                    default:    error(pc_i);
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
                    default:    error(pc_i);
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
                            default:    error(pc_i);
                        endcase
                    end
                    7'h01:  begin   // rv64m
                        case (funct3)
                            `FCT3_MULW: aluop_o = `ALU_MULW;
                            `FCT3_DIVW: aluop_o = `ALU_DIVW;
                            `FCT3_DIVUW:aluop_o = `ALU_DIVUW;
                            `FCT3_REMW: aluop_o = `ALU_REMW;
                            `FCT3_REMUW:aluop_o = `ALU_REMUW;
                            default:    error(pc_i);
                        endcase
                    end
                    7'h20:  begin
                        case (funct3)
                            `FCT3_SUBW: aluop_o = `ALU_SUBW;
                            `FCT3_SRAW: aluop_o = `ALU_SRAW;
                            default:    error(pc_i);
                        endcase
                    end
                    default:    error(pc_i);
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
                    default:    error(pc_i);
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
                    csr_addr_o = inst[31:20];
                end
                case (funct3)
                    `FCT3_TRAP: begin
                        case (inst[31:20])
                            `IMM_EBREAK:    begin
                                exception_o = 1'b1;
                                mcause_o = `BREAKPOINT;
                            end
                            `IMM_MRET:  mret_o = 1'b1;
                            `IMM_SRET:;
                            `IMM_URET:;
                            `IMM_ECALL:;
                            `IMM_WFI:;
                            default:    error(pc_i);
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

            default:    error(pc_i);
        endcase // opcode
    end

endmodule