`include "define.v"
module top(input clock, input reset, output [63:0] pc_o, output reg [31:0]inst_o);

    assign inst_o = MEM.inst_o;
    assign pc_o = IF.pc_o;

    ifetch IF(
        .clock(clock),
        .reset(reset),
        .inst_i(MEM.inst_o),
        .branch_i(ID.branch_o),
        .branch_target_i(ID.branch_target_o),
    );

    id ID(
        // from inst memory
        .inst_i(IF.inst_o),
        .pc_i(IF.pc_o),
        // from regfile
        .rs1val_i(RF.rdata1_o),
        .rs2val_i(RF.rdata2_o),
    );

    ex EX(
        // decode result
        .operand1_i(ID.operand1_o),
        .operand2_i(ID.operand2_o),
        .rd_i(ID.rd_o),
        .aluop_i(ID.aluop_o),
        .rf_wen_i(ID.rf_wen_o),
        // mem
        .load_i(ID.load_o),
        .store_i(ID.store_o),
        .funct3_i(ID.funct3_o),
        .sdata_i(ID.sdata_o),
        // debug
        .pc_i(ID.pc_o),
        .exit_i(ID.exit_o),
    );

    mem MEM(
        .clock(clock),
        // ifetch
        .if_pc_i(IF.pc_o),
        // write back
        .rf_wen_i(EX.rf_wen_o),
        .rd_i(EX.rd_o),
        .aluout_i(EX.aluout_o),
        // mem
        .load_i(EX.load_o),
        .store_i(EX.store_o),
        .sdata_i(EX.sdata_o),
        .funct3_i(EX.funct3_o),
        // debug
        .pc_i(EX.pc_o),
        .exit_i(EX.exit_o),
    );

    wb WB(
        // wb
        .rf_wdata_i(MEM.rf_wdata_o),
        .rf_wen_i(MEM.rf_wen_o),
        .rd_i(MEM.rd_o),
        // debug
        .exit_i(MEM.exit_o),
        .pc_i(MEM.pc_o),
        .a0_i(RF.a0_o),
    );

    regfile RF(
        .clock(clock),
        .reset(reset),
        // id
        .rs1_i(ID.rs1_o),
        .rs2_i(ID.rs2_o),
        // wb
        .wen_i(WB.rf_wen_o),
        .rd_i(WB.rd_o),
        .wdata_i(WB.rf_wdata_o),
    );

endmodule