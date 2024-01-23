`include "define.v"

module id(
    // from regfile
    input [63:0]  rs1val_i,
    input [63:0]  rs2val_i,
    // from ifetch
    input [31:0]  inst_i,
    input [63:0]  pc_i,
    // to regfile
    output reg [4:0] rs1_o,
    output reg [4:0] rs2_o,
    // decode result. to ex
    output reg wen_o,
    output reg [63:0] operand1_o,
    output reg [63:0] operand2_o,
    output reg [4:0]  rd_o,
    output reg [4:0]  aluop_o,
    // mem
    output reg load_o,
    output reg store_o,
    output reg [2:0]    funct3_o,   // used by load/store
    output reg [63:0]   sdata_o,    // store data
    // to ifetch
    output reg branch_o,
    output is_compressed_o,
    output reg [63:0]   branch_target_o,
    // debug
    output [63:0]   pc_o,
    output reg exit_o
);
    task error(input [63:0] pc);
        $display("unsupported instruction at pc = %x", pc);
        $finish();
    endtask

    wire [6:0]  opcode = inst_i[6:0];
    wire [6:0]  funct7 = inst_i[31:25];
    wire [4:0]  rs1 = inst_i[19:15], rs2 = inst_i[24:20], rd = inst_i[11:7];
    wire [2:0]  funct3 = inst_i[14:12];
    wire [63:0] immI = `SEXT(inst_i[31:20], 12, 64);
    wire [63:0] immJ = `SEXT({inst_i[31], inst_i[19:12], inst_i[20], inst_i[30:21], 1'b0}, 21, 64);    // shift left by 1, making immJ always a multiple of 2
    wire [63:0] immU = `SEXT({inst_i[31:12], 12'b0}, 32, 64);
    wire [63:0] immS = `SEXT({inst_i[31:25], inst_i[11:7]}, 12, 64);
    wire [63:0] immB = `SEXT({inst_i[31], inst_i[7], inst_i[30:25], inst_i[11:8], 1'b0}, 13, 64);      // shift left by 1
    /*  rvc */
    wire [2:0] funct3_c = inst_i[15:13];
    wire [3:0] funct4_c = inst_i[15:12];
    wire [1:0] funct2_c = inst_i[11:10];

    // 3-bit rs, +8 to get wider range
    wire [4:0] rs1_c = {2'b01, inst_i[9:7]}, rs2_c = {2'b01, inst_i[4:2]};
    // rvc's immediate values have various of usages...
    wire [63:0] immCI = `SEXT({inst_i[12], inst_i[6:2]}, 6, 64);
    wire [63:0] immCJ = `SEXT({inst_i[12], inst_i[8], inst_i[10:9], inst_i[6], inst_i[7], inst_i[2], inst_i[11], inst_i[5:3], 1'b0}, 12, 64);
    wire [63:0] immCB = `SEXT({inst_i[12], inst_i[6:5], inst_i[2], inst_i[11:10], inst_i[4:3], 1'b0}, 9, 64);
    // load with sp, zero-extend because our data is above sp
    wire [63:0] immCL_W = `ZEXT({inst_i[5], inst_i[12:10], inst_i[6], 2'b0}, 8, 64);
    wire [63:0] immCL_D = `ZEXT({inst_i[6:5], inst_i[12:10], 3'b0}, 8, 64);

    assign pc_o = pc_i;
    assign is_compressed_o = inst_i[1:0] != 2'b11;
    assign exit_o = (is_compressed_o && (inst_i[15:0] == `C_EBREAK)) ||
        (!is_compressed_o && (inst_i == `EBREAK));
    // decode
    always @* begin
        // default values. need to be updated
        operand1_o = 0;
        operand2_o = 0;
        wen_o = 0;
        aluop_o  = `ALU_ADD;
        load_o   = 1'b0;
        store_o  = 1'b0;
        branch_o = 1'b0;
        sdata_o  = 64'b0;
        branch_target_o = 64'b0;
        rd_o    = 5'b0;
        rs1_o   = 5'b0;
        rs2_o   = 5'b0;
        funct3_o= 3'b0;

        case (inst_i[1:0])
            2'b00:  begin
                case (funct3_c)
                    3'b000: begin   // c.addi4spn
                        wen_o = 1'b1;
                        rd_o = rs2_c;
                        rs1_o = 5'd2;
                        operand1_o = rs1val_i;
                        operand2_o = `ZEXT({inst_i[10:7], inst_i[12:11], inst_i[5], inst_i[6], 2'b00}, 10, 64);
                    end

                    3'b010: begin   // c.lw
                        load_o = 1'b1;
                        wen_o = 1'b1;
                        rd_o = rs2_c;
                        rs1_o = rs1_c;
                        funct3_o = funct3_c;
                        operand1_o = rs1val_i;
                        operand2_o = immCL_W;;
                    end
                    3'b011: begin   // c.ld
                        load_o = 1'b1;
                        wen_o = 1'b1;
                        rd_o = rs2_c;
                        rs1_o = rs1_c;
                        funct3_o = funct3_c;
                        operand1_o = rs1val_i;
                        operand2_o = immCL_D;
                    end

                    3'b110: begin   // c.sw
                        store_o = 1'b1;
                        sdata_o = rs2val_i;
                        rs1_o = rs1_c;
                        rs2_o = rs2_c;
                        funct3_o = inst_i[15:13];
                        operand1_o = rs1val_i;
                        operand2_o = immCL_W;
                    end

                    3'b111: begin   // c.sd
                        store_o = 1'b1;
                        sdata_o = rs2val_i;
                        rs1_o = rs1_c;
                        rs2_o = rs2_c;
                        funct3_o = inst_i[15:13];
                        operand1_o = rs1val_i;
                        operand2_o = immCL_D;
                    end
                    default:    error(pc_i);
                endcase
            end
            // inst_i[1:0]
            2'b01:  begin
                case (funct3_c)
                    3'b000: begin   // c.nop, c.addi
                        wen_o = 1'b1;
                        rd_o = rd;
                        rs1_o = rd;
                        operand1_o = rs1val_i;
                        operand2_o = immCI;
                    end

                    3'b001: begin   // c.jal, c.addiw
                        // c.jal is rv32 only. in rv64 funct3 == 1 will be decoded as c.addiw
                        wen_o = 1'b1;
                        rd_o = rd;
                        rs1_o = rd;
                        operand1_o = rs1val_i;
                        operand2_o = immCI;
                        aluop_o = `ALU_ADDW;
                    end

                    3'b010: begin   // c.li
                        wen_o = 1'b1;
                        rd_o = rd;
                        operand1_o = immCI;
                    end

                    3'b011:  begin
                        case (rd)
                            5'd2:   begin   // c.addi16sp
                                wen_o = 1'b1;
                                rd_o = 5'd2;
                                rs1_o = 5'd2;
                                operand1_o = rs1val_i;
                                operand2_o = `SEXT({inst_i[12], inst_i[4:3], inst_i[5], inst_i[2], inst_i[6], 4'b0}, 10, 64);
                            end
                            default: begin  // c.lui
                                wen_o = 1'b1;
                                rd_o = rd;
                                operand1_o = immCI << 12;
                            end
                        endcase
                    end

                    3'b100: begin
                        case (funct2_c)
                            2'b00:  begin   // c.srli
                                wen_o = 1'b1;
                                rs1_o = rs1_c;
                                rd_o = rs1_c;
                                operand1_o = rs1val_i;
                                operand2_o = immCI;
                                aluop_o = `ALU_SRL;
                            end

                            2'b01:  begin   // c.srai
                                wen_o = 1'b1;
                                rs1_o = rs1_c;
                                rd_o = rs1_c;
                                operand1_o = rs1val_i;
                                operand2_o = immCI;
                                aluop_o = `ALU_SRA;
                            end

                            2'b10:  begin   // c.andi
                                wen_o = 1'b1;
                                rd_o = rs1_c;
                                rs1_o = rs1_c;
                                operand1_o = rs1val_i;
                                operand2_o = immCI;
                                aluop_o = `ALU_AND;
                            end

                            2'b11:  begin
                                wen_o = 1'b1;
                                rd_o = rs1_c;
                                rs1_o = rs1_c;
                                rs2_o = rs2_c;
                                operand1_o = rs1val_i;
                                operand2_o = rs2val_i;
                                case (inst_i[12])
                                    // rv32
                                    1'b0:   begin
                                        case (inst_i[6:5])
                                            2'b00:  begin   // c.sub
                                                aluop_o = `ALU_SUB;
                                            end
                                            2'b01:  begin   // c.xor
                                                aluop_o = `ALU_XOR;
                                            end
                                            2'b10:  begin   // c.or
                                                aluop_o = `ALU_OR;
                                            end
                                            2'b11:  begin   // c.and
                                                aluop_o = `ALU_AND;
                                            end
                                        endcase
                                    end
                                    // rv64
                                    1'b1:   begin
                                        case (inst_i[6:5])
                                            2'b00:  begin   // c.subw
                                                aluop_o = `ALU_SUBW;
                                            end
                                            2'b01:  begin   // c.addw
                                                aluop_o = `ALU_ADDW;
                                            end
                                            default: error(pc_i);
                                        endcase
                                    end
                                endcase
                            end // funct2 = 2'b11
                        endcase // funct2
                    end // funct3 = 3'b100

                    3'b101: begin   // c.j
                        branch_o = 1'b1;
                        branch_target_o = pc_i + immCJ;
                    end

                    3'b110: begin   // c.beqz
                        rs1_o = rs1_c;
                        branch_o = rs1val_i == 64'b0;
                        branch_target_o = pc_i + immCB;
                    end

                    3'b111: begin   // c.bnez
                        rs1_o = rs1_c;
                        branch_o = rs1val_i != 64'b0;
                        branch_target_o = pc_i + immCB;
                    end
                    default: error(pc_i);
                endcase
            end
            // inst_i[1:0]
            2'b10:  begin
                case (funct3_c)
                    3'b000: begin   // c.slli
                        wen_o = 1'b1;
                        rd_o = rd;
                        rs1_o = rd;
                        operand1_o = rs1val_i;
                        operand2_o = immCI;
                        aluop_o = `ALU_SLL;
                    end

                    3'b010: begin   // c.lwsp
                        load_o = 1'b1;
                        funct3_o = funct3_c;
                        wen_o = 1'b1;
                        rd_o = rd;
                        rs1_o = 5'd2;
                        operand1_o = rs1val_i;
                        operand2_o = `ZEXT({inst_i[3:2], inst_i[12], inst_i[6:4], 2'b0}, 8, 64);
                    end

                    3'b011: begin   // c.ldsp
                        load_o = 1'b1;
                        funct3_o = funct3_c;
                        wen_o = 1'b1;
                        rd_o = rd;
                        rs1_o = 5'd2;
                        operand1_o = rs1val_i;
                        operand2_o = `ZEXT({inst_i[4:2], inst_i[12], inst_i[6:5], 3'b0}, 9, 64);
                    end

                    3'b100: begin
                        case (inst_i[12])
                            1'b0:   begin
                                case (inst_i[6:2])
                                    5'b0:   begin       // c.jr
                                        branch_o = 1'b1;
                                        rs1_o = rd;
                                        branch_target_o = rs1val_i;
                                    end
                                    default:    begin   // c.mv
                                        wen_o = 1'b1;
                                        rd_o = rd;
                                        rs1_o = inst_i[6:2];
                                        operand1_o = rs1val_i;
                                    end
                                endcase
                            end
                            1'b1:   begin
                                case (inst_i[11:7])
                                    5'b0:   begin               // c.ebreak
                                        //exit_o = 1'b1;
                                    end
                                    default:    begin
                                        case (inst_i[6:2])
                                            5'b0:   begin       // c.jalr
                                                wen_o = 1'b1;
                                                branch_o = 1'b1;
                                                rd_o = 5'd1;    // x[1] = ra
                                                branch_target_o = rs1val_i;
                                                rs1_o = rd;
                                                operand1_o = pc_i;
                                                operand2_o = 64'd2;
                                            end
                                            default:    begin   // c.add
                                                wen_o = 1'b1;
                                                rs1_o = rd;
                                                rs2_o = inst_i[6:2];
                                                rd_o = rd;
                                                operand1_o = rs1val_i;
                                                operand2_o = rs2val_i;
                                            end
                                        endcase
                                    end
                                endcase
                            end
                        endcase
                    end

                    3'b110: begin   // c.swsp
                        store_o = 1'b1;
                        sdata_o = rs2val_i;
                        funct3_o = funct3_c;
                        rs1_o = 2'd2;
                        rs2_o = inst_i[6:2];
                        operand1_o = rs1val_i;
                        operand2_o = `ZEXT({inst_i[8:7], inst_i[12:9], 2'b0}, 8, 64);
                    end

                    3'b111: begin   // c.sdsp
                    //pass?
                        store_o = 1'b1;
                        sdata_o = rs2val_i;
                        funct3_o = funct3_c;
                        rs1_o = 2'd2;
                        rs2_o = inst_i[6:2];
                        operand1_o = rs1val_i;
                        operand2_o = `ZEXT({inst_i[9:7], inst_i[12:10], 3'b0}, 9, 64);
                    end
                    default:    error(pc_i); 
                endcase
            end


            // rvim
            // general decoding steps: opcode -> (funct7) -> funct3
            // for I-type insts, due to the existance of imm field,
            // we can not decode funct7 at first
            2'b11:  begin
                rs1_o = rs1;
                rs2_o = rs2;
                funct3_o = funct3;
                rd_o = rd;
                case (opcode)
                    `OPCODE_ARITH_I:   begin   // I-type
                        // default values
                        wen_o = 1;
                        operand1_o = rs1val_i;
                        operand2_o = immI;
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
                        wen_o = 1;
                        operand1_o = rs1val_i;
                        operand2_o = rs2val_i;
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
                        wen_o = 1'b1;
                        operand1_o = rs1val_i;
                        operand2_o = immI;
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
                        wen_o = 1'b1;
                        operand1_o = rs1val_i;
                        operand2_o = rs2val_i;
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
                        wen_o = 1'b1;
                        load_o = 1'b1;
                        operand1_o = rs1val_i;
                        operand2_o = immI;
                    end

                    `OPCODE_STORE:  begin
                        // M[rs1 + imm] = rs2
                        // ALU: calculate the address
                        store_o = 1'b1;
                        operand1_o = rs1val_i;
                        operand2_o = immS;
                        sdata_o = rs2val_i;
                    end

                    `OPCODE_BRANCH: begin
                        // if (rs1 op rs2) pc += imm
                        branch_target_o = pc_i + immB;
                        case (funct3)
                            `FCT3_BEQ:  branch_o = rs1val_i == rs2val_i;
                            `FCT3_BNE:  branch_o = rs1val_i != rs2val_i;
                            `FCT3_BLTU: branch_o = rs1val_i <  rs2val_i;
                            `FCT3_BGEU: branch_o = rs1val_i >= rs2val_i;
                            `FCT3_BLT:  branch_o = $signed(rs1val_i) <  $signed(rs2val_i);
                            `FCT3_BGE:  branch_o = $signed(rs1val_i) >= $signed(rs2val_i);
                            default:    error(pc_i);
                        endcase
                    end

                    `OPCODE_JAL:   begin   // J-type
                        // rd = pc + 4; pc += immJ
                        wen_o = 1;
                        operand1_o = pc_i;
                        operand2_o = 64'd4;
                        branch_o = 1'b1;
                        branch_target_o = pc_i + immJ;
                    end

                    `OPCODE_JALR:  begin   // I-type
                        // rd = pc + 4; pc += rs1 + immI
                        wen_o = 1;
                        operand1_o = pc_i;
                        operand2_o = 64'd4;
                        branch_o = 1'b1;
                        branch_target_o = rs1val_i + immI;
                    end

                    `OPCODE_AUIPC: begin   // U-type
                        // rd = pc + imm << 12
                        wen_o = 1'b1;
                        operand1_o = pc_i;
                        operand2_o = immU;
                    end

                    `OPCODE_LUI:   begin   // U-type
                        // rd = imm << 12
                        wen_o = 1'b1;
                        operand1_o = immU;
                        operand2_o = 64'b0;
                    end

                    `OPCODE_SYS:;//    exit_o = inst_i == `EBREAK;

                    default:    error(pc_i);
                endcase // opcode
            end     // inst[1:0] == 2'b11
        endcase
    end

endmodule