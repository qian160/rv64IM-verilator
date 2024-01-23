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
    input wen_i,
    input exit_i,
    input [4:0]     rd_i,
    input [63:0]    pc_i,       // debug

    output load_o,
    output store_o,
    output [2:0]    funct3_o,
    output [63:0]   sdata_o,
    output wen_o,
    output [4:0]    rd_o,
    output reg [63:0]   aluout_o,
    // debug
    output [63:0]       pc_o,
    output exit_o
);
    /* verilator lint_off SELRANGE */
    // what's the difference between signed & unsigned operation? ...
    always @*   begin
        case (aluop_i)
            // rv32i
            `ALU_ADD:   aluout_o = operand1_i + operand2_i;
            `ALU_SUB:   aluout_o = operand1_i - operand2_i;
            `ALU_XOR:   aluout_o = operand1_i ^ operand2_i;
            `ALU_OR:    aluout_o = operand1_i | operand2_i;
            `ALU_AND:   aluout_o = operand1_i & operand2_i;
            `ALU_SLL:   aluout_o = operand1_i << operand2_i[5:0];
            `ALU_SRL:   aluout_o = operand1_i >> operand2_i[5:0];
            `ALU_SRA:   aluout_o = $signed(operand1_i) >>> operand2_i[5:0];
            `ALU_SLT:   aluout_o = ($signed(operand1_i) < $signed(operand2_i))? 64'b1: 64'b0;
            `ALU_SLTU:  aluout_o = (operand1_i < operand2_i)? 64'b1: 64'b0;
            // rv32m
            `ALU_MUL:   aluout_o = {operand1_i * operand2_i}[63:0];
            //`ALU_MULH:  aluout_o = {$signed(operand1_i) * $signed(operand2_i)}[127:64];
            `ALU_MULH:  aluout_o = {operand1_i * operand2_i}[127:64];
            `ALU_MULHU: aluout_o = {operand1_i * operand2_i}[127:64];
            `ALU_MULHSU:aluout_o = {$signed(operand1_i) * operand2_i}[127:64];
            `ALU_DIV:   aluout_o = operand1_i / operand2_i;
            `ALU_DIVU:  aluout_o = operand1_i / operand2_i;
            `ALU_REM:   aluout_o = operand1_i % operand2_i;
            `ALU_REMU:  aluout_o = operand1_i % operand2_i;
            // rv64i
            `ALU_ADDW:  aluout_o = `SEXT({operand1_i[31:0] + operand2_i[31:0]}, 32, 64);
            `ALU_SUBW:  aluout_o = `SEXT({operand1_i[31:0] - operand2_i[31:0]}, 32, 64);
            `ALU_SLLW:  aluout_o = `SEXT({operand1_i[31:0] << operand2_i[4:0]}, 32, 64);
            `ALU_SRLW:  aluout_o = `SEXT({operand1_i[31:0] >> operand2_i[4:0]}, 32, 64);
            `ALU_SRAW:  aluout_o = `SEXT({$signed(operand1_i[31:0]) >>> operand2_i[4:0]}, 32, 64);
            // rv64m
            `ALU_MULW:  aluout_o = `SEXT({operand1_i * operand2_i}[31:0], 32, 64);
            `ALU_DIVW:  aluout_o = `SEXT({operand1_i / operand2_i}[31:0], 32, 64);
            `ALU_REMW:  aluout_o = `SEXT({operand1_i % operand2_i}[31:0], 32, 64);
            `ALU_DIVUW: aluout_o = `SEXT({operand1_i / operand2_i}[31:0], 32, 64);
            `ALU_REMUW: aluout_o = `SEXT({operand1_i % operand2_i}[31:0], 32, 64);
            default: aluout_o = operand1_i + operand2_i;
        endcase
    end

    assign wen_o = wen_i;
    assign rd_o     = rd_i;

    assign pc_o     = pc_i;
    assign exit_o   = exit_i;
    assign load_o   = load_i;
    assign store_o  = store_i;
    assign funct3_o = funct3_i;
    assign sdata_o  = sdata_i;
endmodule