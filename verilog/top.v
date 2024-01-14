`include "define.v"
module top(input clock, input reset, output [63:0] pc_o, output reg [31:0]inst_o);

    assign inst_o = MEMORY.inst_o;
    assign pc_o = IF.pc_o;

    ifetch IF(
        .clock(clock),
        .reset(reset),
        .inst_i(MEMORY.inst_o),
        .branch_i(ID.branch_o),
        .new_pc_i(ID.new_pc_o),
    );

    id ID(
        .inst_i(IF.inst_o),
        .pc_i(IF.pc_o),
        .rs1val_i(RF.rdata1_o),
        .rs2val_i(RF.rdata2_o),
    );

    ex EX(
        .operand1_i(ID.operand1_o),
        .operand2_i(ID.operand2_o),
        .rf_rd_i(ID.rd_o),
        .aluop_i(ID.aluop_o),
        .rf_wen_i(ID.rf_wen_o),
        .exit_i(ID.exit_o),
        .pc_i(ID.pc_o),
    );

    mem MEM(
        .rf_wen_i(EX.rf_wen_o),
        .rf_rd_i(EX.rf_rd_o),
        .aluout_i(EX.aluout_o),
        .pc_i(EX.pc_o),
        .exit_i(EX.exit_o),
        .load_data_i(0),
    );

    wb WB(
        .rf_wdata_i(MEM.rf_wdata_o),
        .rf_wen_i(MEM.rf_wen_o),
        .rf_rd_i(MEM.rf_rd_o),
        .exit_i(MEM.exit_o),
        .pc_i(MEM.pc_o),
        .a0_i(RF.a0_o),
    );

    memory MEMORY(
        .pc_i(IF.pc_o),
    );

    regfile RF(
        .clock(clock),
        .reset(reset),
        .rs1_i(ID.rs1_o),
        .rs2_i(ID.rs2_o),
        .wen_i(WB.rf_wen_o),
        .rd_i(WB.rf_rd_o),
        .wdata_i(WB.rf_wdata_o),
    );

endmodule