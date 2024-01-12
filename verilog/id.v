`include "macro.v"
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
    // debug
    output [63:0]     pc_o,
    output exit_o
);

    wire [6:0] opcode;
    wire [2:0] funct3;
    wire [6:0] funct7;
    wire [4:0] rs1, rs2, rd;
    wire [11:0] immI;

    assign opcode = inst_i[6:0];
    assign funct7 = inst_i[31:25];
    assign rs2 = inst_i[24:20];
    assign rs1 = inst_i[19:15];
    assign funct3 = inst_i[14:12];
    assign rd = inst_i[11:7];
    assign immI = inst_i[31:20];

    assign rd_o = rf_wen_o? rd : 0;
    assign rs1_o = rs1;
    assign rs2_o = rs2;

    always @* begin
        // default values
        operand1_o = 0;
        operand2_o = 0;
        rf_wen_o = 0;
        aluop_o = `ALU_ADD;

        case (opcode)
            `ARITH_I:   begin
                case (funct3)
                    3'b0:   begin   // addi
                        operand1_o = rs1val_i;
                        operand2_o = `SEXT(immI, 12, 64);
                        rf_wen_o = 1;
                        aluop_o = `ALU_ADD;
                    end
                endcase
            end

            default:    $display("unsupported instruction: %08x at pc = %x", inst_i, pc_i);
        endcase

    end

    assign pc_o = pc_i;
    assign exit_o = (inst_i == `EBREAK);
endmodule