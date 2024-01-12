`include "macro.v"
module ex(
    // alu input
    input [63:0] operand1_i,
    input [63:0] operand2_i,
    input [4:0] aluop_i,
    // input from id
    input [4:0] rf_rd_i,
    input rf_wen_i,
    input [63:0]     pc_i,
    input exit_i,
    // to mem
    output [4:0] rf_rd_o,
    output rf_wen_o,
    output reg [63:0] aluout_o,
    // debug
    output [63:0]     pc_o,
    output exit_o
);

    reg [63:0] aluout;
    always @*   begin
        case (aluop_i)
            `ALU_ADD: aluout_o = operand1_i + operand2_i;
            default: aluout_o = operand1_i + operand2_i;
        endcase
    end

    assign rf_wen_o = rf_wen_i;
    assign rf_rd_o = rf_rd_i;

    assign pc_o = pc_i;
    assign exit_o = exit_i;
endmodule