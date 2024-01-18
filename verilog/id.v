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
    output reg rf_wen_o,
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
    output exit_o
);
    task warn(input [63:0] pc);
        $display("unsupported instruction at pc = %x", pc);
        $finish();
    endtask

    wire [6:0]  opcode = inst_i[6:0];
    wire [6:0]  funct7 = inst_i[31:25];
    // rd should be associated with rf_wen
    wire [4:0]  rs1 = inst_i[19:15], rs2 = inst_i[24:20], rd = inst_i[11:7];
    wire [2:0]  funct3 = inst_i[14:12];

    wire [63:0] immI = `SEXT(inst_i[31:20], 12, 64);
    wire [63:0] immJ = `SEXT({inst_i[31], inst_i[19:12], inst_i[20], inst_i[30:21], 1'b0}, 21, 64);    // shift left by 1, making immJ always a multiple of 2
    wire [63:0] immU = `SEXT({inst_i[31:12], 12'b0}, 32, 64);
    wire [63:0] immS = `SEXT({inst_i[31:25], inst_i[11:7]}, 12, 64);
    wire [63:0] immB = `SEXT({inst_i[31], inst_i[7], inst_i[30:25], inst_i[11:8], 1'b0}, 13, 64);      // shift left by 1

    /*  rvc */
    wire [2:0] rvc_funct3 = inst_i[15:13];
    wire [3:0] rvc_funct4 = inst_i[15:12];
//    wire [63:0] immCI = ;
//    wire [63:0] immCSS = ;
    wire [63:0] immCIW = `ZEXT({inst_i[10:7], inst_i[12:11], inst_i[5], inst_i[6], 2'b00}, 10, 64);
//    wire [63:0] immCL =  ;
//    wire [63:0] immCS = ;
//    wire [63:0] immCB = ;
//    wire [63:0] immCJ = ;

    assign pc_o = pc_i;
    assign exit_o = (inst_i == `EBREAK);
    assign is_compressed_o = inst_i[1:0] != 2'b11;

    // decode
    always @* begin
        // default values. need to be updated
        operand1_o = 0;
        operand2_o = 0;
        rf_wen_o = 0;
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
                case (rvc_funct3)
                    3'b000:     begin   // c.addi4spn
                        rf_wen_o = 1'b1;
                        rd_o    = {2'b0, inst_i[4:2]} + 5'd8;
                        rs1_o   = 5'd2;
                        operand1_o = rs1val_i;
                        operand2_o = immCIW;
                    end
                    //3'b010:; // c.lw
                    //3'b011:; // c.ld
                    //3'b110:; // c.sw
                    //3'b111:; // c.sd
                    default:;
                endcase
            end
            2'b01:  begin
                case (rvc_funct3)
                    //: 
                    default: ;
                endcase
            end
            2'b10:  begin
                case (rvc_funct3)

                    3'b100:; //jr jalr mv add
                    default:; 
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
                case (opcode)
                    `OPCODE_ARITH_I:   begin   // I-type
                        // default values
                        rf_wen_o = 1;
                        rd_o = rd;
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
                            default:    warn(pc_i);
                        endcase
                    end // arith-i

                    `OPCODE_ARITH_R:   begin
                        // rd = rs1 op rs2
                        rf_wen_o = 1;
                        rd_o = rd;
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
                                    default:    warn(pc_i);
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
                                    default:    warn(pc_i);
                                endcase
                            end

                            7'h20: begin
                                case (funct3)
                                    `FCT3_SUB:  aluop_o = `ALU_SUB;
                                    `FCT3_SRA:  aluop_o = `ALU_SRA;
                                    default:    warn(pc_i);
                                endcase
                            end
                            default:    warn(pc_i);
                        endcase // funct7
                    end // arith-r

                    `OPCODE_RV64_ARITH_I: begin
                        // rd = rs1 op rs2
                        rf_wen_o = 1'b1;
                        rd_o = rd;
                        operand1_o = rs1val_i;
                        operand2_o = immI;
                        case (funct3)
                            `FCT3_ADDIW:    aluop_o = `ALU_ADDW;
                            `FCT3_SLLIW:    aluop_o = `ALU_SLLW;
                            `FCT3_SRLIW_SRAIW:
                                aluop_o = funct7[5]? `ALU_SRAW: `ALU_SRLW;
                            default:    warn(pc_i);
                        endcase
                    end // rv64i arith-i

                    `OPCODE_RV64_ARITH_R: begin
                        // rd = rs1 op rs2
                        rf_wen_o = 1'b1;
                        rd_o = rd;
                        operand1_o = rs1val_i;
                        operand2_o = rs2val_i;
                        case (funct7)
                            7'h00:  begin
                                case (funct3)
                                    `FCT3_ADDW: aluop_o = `ALU_ADDW;
                                    `FCT3_SLLW: aluop_o = `ALU_SLLW;
                                    `FCT3_SRLW: aluop_o = `ALU_SRLW;
                                    default:    warn(pc_i);
                                endcase
                            end
                            7'h01:  begin   // rv64m
                                case (funct3)
                                    `FCT3_MULW: aluop_o = `ALU_MULW;
                                    `FCT3_DIVW: aluop_o = `ALU_DIVW;
                                    `FCT3_DIVUW:aluop_o = `ALU_DIVUW;
                                    `FCT3_REMW: aluop_o = `ALU_REMW;
                                    `FCT3_REMUW:aluop_o = `ALU_REMUW;
                                    default:    warn(pc_i);
                                endcase
                            end
                            7'h20:  begin
                                case (funct3)
                                    `FCT3_SUBW: aluop_o = `ALU_SUBW;
                                    `FCT3_SRAW: aluop_o = `ALU_SRAW;
                                    default:    warn(pc_i);
                                endcase
                            end
                            default:    warn(pc_i);
                        endcase
                    end // rv64i arith-r

                    `OPCODE_LOAD:   begin
                        // rd = M[rs1 + imm]
                        // ALU: calculate the address
                        rf_wen_o = 1'b1;
                        rd_o = rd;
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
                            default:    warn(pc_i);
                        endcase
                    end

                    `OPCODE_JAL:   begin   // J-type
                        // rd = pc + 4; pc += immJ
                        rf_wen_o = 1;
                        rd_o = rd;
                        operand1_o = pc_i;
                        operand2_o = 64'd4;
                        branch_o = 1'b1;
                        branch_target_o = pc_i + immJ;
                    end

                    `OPCODE_JALR:  begin   // I-type
                        // rd = pc + 4; pc += rs1 + immI
                        rf_wen_o = 1;
                        rd_o = rd;
                        operand1_o = pc_i;
                        operand2_o = 64'd4;
                        branch_o = 1'b1;
                        branch_target_o = rs1val_i + immI;
                    end

                    `OPCODE_AUIPC: begin   // U-type
                        // rd = pc + imm << 12
                        rf_wen_o = 1'b1;
                        rd_o = rd;
                        operand1_o = pc_i;
                        operand2_o = immU;
                    end

                    `OPCODE_LUI:   begin   // U-type
                        // rd = imm << 12
                        rf_wen_o = 1'b1;
                        rd_o = rd;
                        operand1_o = immU;
                        operand2_o = 64'b0;
                    end

                    `OPCODE_SYS:;

                    default:    warn(pc_i);
                endcase // opcode
            end     // inst[1:0] == 2'b11
        endcase
    end

endmodule