`include "define.v"
module top(input clock, input reset, output [63:0] pc_o, output reg [31:0]inst_o);

    assign inst_o = MEM.inst_o;
    assign pc_o = IF.pc_o;

    ifetch IF(
        .clock(clock),
        .reset(reset),
        // fetch
        .inst_i(MEM.inst_o),
        // next_pc
        .branch_i(ID.branch_o),
        .branch_target_i(ID.branch_target_o),
        // control
        .stall_i(CONT.stall_o[0]),
        .flush_i(CONT.flush_o[0]),
    );

    if_id IF_ID(
        .clock(clock),
        .reset(reset),
        .stall_i(CONT.stall_o[1]),
        .flush_i(CONT.flush_o[1]),
        .inst_i(IF.inst_o),
        .pc_i(IF.pc_o),
    );

    id ID(
        .clock(clock),
        .reset(reset),
        // from inst memory
        .inst_i(IF_ID.inst_o),
        .pc_i(IF_ID.pc_o),
        // from regfile
        .rs1val_i(RF.rdata1_o),
        .rs2val_i(RF.rdata2_o),
        //
        .prev_is_load_i(EX.load_o),
        // forward
        .ex_rd_i(EX.rd_o),
        .mem_rd_i(MEM.rd_o),
        .wb_rd_i(WB.rd_o),
        .ex_wdata_i(EX.aluout_o),
        .mem_wdata_i(MEM.wdata_o),
        .wb_wdata_i(WB.wdata_o),
    );

    id_ex ID_EX(
        .clock(clock),
        .reset(reset),
        // control
        .stall_i(CONT.stall_o[2]),
        .flush_i(CONT.flush_o[2]),
        // decode result
        .srcA_i(ID.srcA_o),
        .srcB_i(ID.srcB_o),
        .rd_i(ID.rd_o),
        .aluop_i(ID.aluop_o),
        .wen_i(ID.wen_o),
        // mem
        .load_i(ID.load_o),
        .store_i(ID.store_o),
        .funct3_i(ID.funct3_o),
        .sdata_i(ID.sdata_o),
        // debug
        .pc_i(ID.pc_o),
        .exit_i(ID.exit_o),
    );

    ex EX(
        .clock(clock),
        .reset(reset),
        // decode result
        .srcA_i(ID_EX.srcA_o),
        .srcB_i(ID_EX.srcB_o),
        .rd_i(ID_EX.rd_o),
        .aluop_i(ID_EX.aluop_o),
        .wen_i(ID_EX.wen_o),
        // mem
        .load_i(ID_EX.load_o),
        .store_i(ID_EX.store_o),
        .funct3_i(ID_EX.funct3_o),
        .sdata_i(ID_EX.sdata_o),
        // debug
        .pc_i(ID_EX.pc_o),
        .exit_i(ID_EX.exit_o),
    );

    ex_mem EX_MEM(
        .clock(clock),
        .reset(reset),
        .stall_i(CONT.stall_o[3]),
        .flush_i(CONT.flush_o[3]),
        // mem
        .load_i(EX.load_o),
        .store_i(EX.store_o),
        .sdata_i(EX.sdata_o),
        .funct3_i(EX.funct3_o),
        // write back
        .wen_i(EX.wen_o),
        .rd_i(EX.rd_o),
        .aluout_i(EX.aluout_o),
        // debug
        .pc_i(EX.pc_o),
        .exit_i(EX.exit_o),
    );

    mem MEM(
        .clock(clock),
        .reset(reset),
        // ifetch
        .if_pc_i(IF.pc_o),
        // mem
        .load_i(EX_MEM.load_o),
        .store_i(EX_MEM.store_o),
        .sdata_i(EX_MEM.sdata_o),
        .funct3_i(EX_MEM.funct3_o),
        // write back
        .wen_i(EX_MEM.wen_o),
        .rd_i(EX_MEM.rd_o),
        .aluout_i(EX_MEM.aluout_o),
        // debug
        .pc_i(EX_MEM.pc_o),
        .exit_i(EX_MEM.exit_o),
    );

    mem_wb MEM_WB(
        .clock(clock),
        .reset(reset),
        // wb
        .wen_i(MEM.wen_o),
        .rd_i(MEM.rd_o),
        .wdata_i(MEM.wdata_o),
        // debug
        .exit_i(MEM.exit_o),
        .pc_i(MEM.pc_o),
    );

    wb WB(
        .clock(clock),
        .reset(reset),
        // wb
        .wen_i(MEM_WB.wen_o),
        .rd_i(MEM_WB.rd_o),
        .wdata_i(MEM_WB.wdata_o),
        // debug
        .exit_i(MEM_WB.exit_o),
        .pc_i(MEM_WB.pc_o),
        // ?
        .a0_i(RF.a0_o),
    );

    regfile RF(
        .clock(clock),
        .reset(reset),
        // id
        .rs1_i(ID.rs1_o),
        .rs2_i(ID.rs2_o),
        // wb
        .wen_i(WB.wen_o),
        .rd_i(WB.rd_o),
        .wdata_i(WB.wdata_o),
    );

    control CONT(
        .id_branch_flush_i(ID.branch_flush_o),
        .ex_div_i(EX.div_not_ready_o),
        .id_load_use_i(ID.load_use_o),
    );

//    srt_tb st(.clock(clock));

endmodule