`include "define.v"
module ex(
    // alu input
    input [63:0] operand1_i,
    input [63:0] operand2_i,
    input [4:0]  aluop_i,
    // mem
    input load_i,
    input store_i,
    input [2:0]     funct3_i,
    input [63:0]    sdata_i,
    // wb
    input rf_wen_i,
    input exit_i,
    input [4:0]     rd_i,
    input [63:0]    pc_i,       // debug

    output load_o,
    output store_o,
    output [2:0]    funct3_o,
    output [63:0]   sdata_o,
    output rf_wen_o,
    output [4:0]    rd_o,
    output reg [63:0]   aluout_o,
    // debug
    output [63:0]       pc_o,
    output exit_o
);

    reg [63:0] aluout;
    always @*   begin
        case (aluop_i)
            `ALU_ADD: aluout_o = operand1_i + operand2_i;
            `ALU_SUB: aluout_o = operand1_i - operand2_i;
            `ALU_MUL: aluout_o = operand1_i * operand2_i;
            `ALU_DIV: aluout_o = operand1_i / operand2_i;
            `ALU_XOR: aluout_o = operand1_i ^ operand2_i;
            `ALU_OR:  aluout_o = operand1_i | operand2_i;
            `ALU_AND: aluout_o = operand1_i & operand2_i;
            `ALU_SLL: aluout_o = operand1_i << operand2_i;
            `ALU_SRL: aluout_o = operand1_i >> operand2_i;
            `ALU_SRA: aluout_o = operand1_i >>> operand2_i;
            `ALU_SLT: aluout_o = ($signed(operand1_i) < $signed(operand2_i))? 64'b1: 64'b0;
            `ALU_SLTU:  begin
                aluout_o = (operand1_i < operand2_i)? 64'b1: 64'b0;
                $display("stlu: src1 = %x, src2 = %x", operand1_i[31:0], operand2_i[31:0]);
            end
            // rv64
            `ALU_ADDW:  aluout_o = `SEXT({operand1_i[31:0] + operand2_i[31:0]}, 32, 64);
            `ALU_SUBW:  aluout_o = `SEXT({operand1_i[31:0] - operand2_i[31:0]}, 32, 64);
            `ALU_SLLW:  aluout_o = `SEXT({operand1_i[31:0] << operand2_i[4:0]}, 32, 64);
            `ALU_SRLW:  aluout_o = `SEXT({operand1_i[31:0] >> operand2_i[4:0]}, 32, 64);
            `ALU_SRAW:  aluout_o = `SEXT({operand1_i[31:0] >>> operand2_i[4:0]}, 32, 64);

            `ALU_MULW:$finish(pc_i);
            `ALU_DIVW:$finish(pc_i);
            `ALU_REMW:$finish(pc_i);
            `ALU_DIVUW:$finish(pc_i);
            `ALU_REMUW:$finish(pc_i);
            default: aluout_o = operand1_i + operand2_i;
        endcase
    end

    assign rf_wen_o = rf_wen_i;
    assign rd_o     = rd_i;

    assign pc_o     = pc_i;
    assign exit_o   = exit_i;
    assign load_o   = load_i;
    assign store_o  = store_i;
    assign funct3_o = funct3_i;
    assign sdata_o  = sdata_i;
endmodule