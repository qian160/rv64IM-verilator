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
    output reg [63:0] operand1_o,
    output reg [63:0] operand2_o,
    output reg [4:0]  rd_o,
    output reg rf_wen_o,
    output reg [4:0]  aluop_o,
    // to ifetch(branch)
    output branch_o,
    output [63:0]   new_pc_o,
    // debug
    output [63:0]     pc_o,
    output exit_o
);
    task warn(input [63:0] pc, input [31:0] inst);
        $display("unsupported instruction: %08x at pc = %x", inst, pc);
    endtask
/*
    def imm_I(inst: UInt) = SEXT(inst(31,20), 12, 64)
    def imm_J(inst: UInt) = SEXT(Cat(inst(31), inst(19,12), inst(20), inst(30,21), 0.U(1.W)),21, 64)
    def imm_U(inst: UInt) = SEXT(inst(31,12), 20, 64) << 12
    def imm_S(inst: UInt) = SEXT(Cat(inst(31,25), inst(11,7)), 12, 64)
    def imm_B(inst: UInt) = SEXT(Cat(inst(31), inst(7), inst(30,25), inst(11,8), 0.U(1.W)), 13, 64)
*/
    wire [6:0] opcode = inst_i[6:0];
    wire [2:0] funct3 = inst_i[14:12];
    wire [6:0] funct7 = inst_i[31:25];
    wire [4:0] rs1 = inst_i[19:15], rs2 = inst_i[24:20], rd = inst_i[11:7];
    wire [11:0] immI = inst_i[31:20];
    wire [20:0] immJ = {inst_i[31], inst_i[19:12], inst_i[20], inst_i[30:21], 1'b0};    // shift left by 1, making immJ always a multiple of 2
    wire [19:0] immU = inst_i[31:12];
    wire [11:0] immS = {inst_i[31:25], inst_i[11:7]};
    wire [12:0] immB = {inst_i[31], inst_i[7], inst_i[30:25], inst_i[11:8], 1'b0};      // shift left by 1

    assign rd_o = rf_wen_o? rd : 0;
    assign rs1_o = rs1;
    assign rs2_o = rs2;

    // decode
    always @* begin
        // default values
        operand1_o = 0;
        operand2_o = 0;
        rf_wen_o = 0;
        aluop_o = `ALU_ADD;
        branch_o = 1'b0;
        new_pc_o = 64'b0;

        case (opcode)
            `ARITH_I:   begin   // I-type
                // default values
                // all the I-type insts use the same operands
                // but those shift insts's immI need to be truncated
                rf_wen_o = 1;
                operand1_o = rs1val_i;
                operand2_o = `SEXT(immI, 12, 64);
                case (funct3)
                    `FCT3_ADDI: aluop_o = `ALU_ADD;
                    `FCT3_SLTI: aluop_o = `ALU_SLT;
                    `FCT3_SLTIU:aluop_o = `ALU_SLTU;
                    `FCT3_XORI: aluop_o = `ALU_XOR;
                    `FCT3_SLLI: begin
                        aluop_o = `ALU_SLL;
                        operand2_o = immI[5:0];
                    end
                    `FCT3_SRLI_SRAI:    begin
                        case (funct7)
                            `FCT7_SRAI: begin
                                aluop_o = `ALU_SRA;
                                operand2_o = immI[5:0];
                            end
                            `FCT7_SRLI: begin
                                aluop_o = `ALU_SRL;
                                operand2_o = immI[5:0];
                            end
                            default:    $display("");
                        endcase
                    end
                    default: warn(pc_i, inst_i);
                endcase
            end // arith-i

            `ARITH_R:   begin
                rf_wen_o = 1;
                operand1_o = rs1val_i;
                operand2_o = rs2val_i;
                case (funct3)
                    `FCT3_XOR:  aluop_o = `ALU_XOR;
                    `FCT3_OR:   aluop_o = `ALU_OR;
                    `FCT3_AND:  aluop_o = `ALU_AND;
                    `FCT3_SLT:  aluop_o = `ALU_SLT;
                    `FCT3_SLTU: aluop_o = `ALU_SLTU;
                    `FCT3_SLL:  begin
                        aluop_o = `ALU_SLL;
                        operand2_o = rs2val_i[5:0];
                    end
                    `FCT3_ADD_SUB: begin
                        case (funct7)
                            `FCT7_ADD:  aluop_o = `ALU_ADD;
                            `FCT7_SUB:  aluop_o = `ALU_SUB;
                            default:    warn(pc_i, inst_i);
                        endcase
                    end
                    `FCT3_SRL_SRA:  begin
                        operand2_o = rs2val_i[5:0];
                        case (funct7)
                            `FCT7_SRL:  aluop_o = `ALU_SRL;
                            `FCT7_SRA:  aluop_o = `ALU_SRA;
                            default: warn(pc_i, inst_i);
                        endcase
                    end
                    default:    warn(pc_i, inst_i);
                endcase // funct3
            end // arith-r

            `JAL:   begin   // J-type
                // rd = pc + 4; pc += immJ
                rf_wen_o = 1;
                operand1_o = pc_i;
                operand2_o = 64'd4;
                new_pc_o = pc_i + `SEXT(immJ, 21, 64);
                branch_o = 1'b1;
            end

            `JALR:  begin   // I-type
                // rd = pc + 4; pc += rs1 + immI
                rf_wen_o = 1;
                operand1_o = pc_i;
                operand2_o = 64'd4;
                new_pc_o = rs1val_i + `SEXT(immI, 12, 64);
                branch_o = 1'b1;
            end

            `AUIPC: begin   // U-type
                // rd = pc + imm << 12
                rf_wen_o = 1'b1;
                operand1_o = pc_i;
                operand2_o = `SEXT(immU, 20, 64) << 12;
            end

            `LUI:   begin   // U-type
                // rd = imm << 12
                rf_wen_o = 1'b1;
                operand1_o = `SEXT(immU, 20, 64) << 12;
                operand2_o = 64'b0;
            end

            default:    warn(pc_i, inst_i);
        endcase

    end

    assign pc_o = pc_i;
    assign exit_o = (inst_i == `EBREAK);
endmodule