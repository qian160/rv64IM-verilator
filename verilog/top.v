`include "define.v"
module top(
    input           clock,
    input           reset,
    output [63:0]   pc_o,
    output [31:0]   inst_o,
    output [63:0]   nr_insts_o
);

    assign inst_o = MEM.inst_o;
    assign pc_o = IF.pc_o;
    assign nr_insts_o = CONT.nr_insts_o;

    ifetch IF(
        .clock(clock),
        .reset(reset),
        // fetch
        .inst_i(MEM.inst_o),
        // next_pc
        .branch_i(ID.branch_o),
        .branch_target_i(ID.branch_target_o),
        .exception_i(WB.exception_o),
        .mtvec_i(CSR.mtvec_o),  // RAW?
        .mcause_i(WB.mcause_o),
        .mret_i(ID.mret_o),
        .mepc_i(CSR.mepc_o),
        // control
        .stall_i(CONT.stall_o[0]),
        .flush_i(CONT.flush_o[0])
    );

    if_id IF_ID(
        .clock(clock),
        .reset(reset),
        .stall_i(CONT.stall_o[1]),
        .flush_i(CONT.flush_o[1]),
        .inst_i(IF.inst_o),
        .pc_i(IF.pc_o)
    );

    id ID(
        .clock(clock),
        .reset(reset),
        // inst fetch
        .inst_i(IF_ID.inst_o),
        .pc_i(IF_ID.pc_o),
        // read regfile
        .rs1val_i(RF.rdata1_o),
        .rs2val_i(RF.rdata2_o),
        // read csr
        .csrVal_i(CSR.rdata_o),
        .prev_is_load_i(EX.load_o),
        // forward
        .rf_ex_rd_i(EX.rd_o),
        .rf_mem_rd_i(MEM.rd_o),
        .rf_wb_rd_i(WB.rd_o),
        .rf_ex_wdata_i(EX.aluout_o),
        .rf_mem_wdata_i(MEM.wdata_o),
        .rf_wb_wdata_i(WB.wdata_o),
        .csr_ex_addr_i(EX.csr_addr_o),
        .csr_mem_addr_i(MEM.csr_addr_o),
        .csr_wb_addr_i(WB.csr_addr_o),
        .csr_ex_wdata_i(EX.csr_wdata_o),
        .csr_mem_wdata_i(MEM.csr_wdata_o),
        .csr_wb_wdata_i(WB.csr_wdata_o)
    );

    id_ex ID_EX(
        .clock(clock),
        .reset(reset),
        // control
        .stall_i(CONT.stall_o[2]),
        .flush_i(CONT.flush_o[2]),
        // alu input
        .srcA_i(ID.srcA_o),
        .srcB_i(ID.srcB_o),
        .aluop_i(ID.aluop_o),
        // write regfile
        .rd_i(ID.rd_o),
        .wen_i(ID.rf_wen_o),
        // write csr
        .csr_wen_i(ID.csr_wen_o),
        .csr_addr_i(ID.csr_addr_o),
        .csr_wdata_i(ID.csr_wdata_o),
        // mem
        .load_i(ID.load_o),
        .store_i(ID.store_o),
        .funct3_i(ID.funct3_o),
        .sdata_i(ID.sdata_o),
        // exception
        .exception_i(ID.exception_o),
        .mcause_i(ID.mcause_o),
        .pc_i(ID.pc_o)
    );

    ex EX(
        .clock(clock),
        .reset(reset),
        // alu input
        .srcA_i(ID_EX.srcA_o),
        .srcB_i(ID_EX.srcB_o),
        .aluop_i(ID_EX.aluop_o),
        // write regfile
        .rd_i(ID_EX.rd_o),
        .wen_i(ID_EX.wen_o),
        // write csr
        .csr_wen_i(ID_EX.csr_wen_o),
        .csr_addr_i(ID_EX.csr_addr_o),
        .csr_wdata_i(ID_EX.csr_wdata_o),
        // mem
        .load_i(ID_EX.load_o),
        .store_i(ID_EX.store_o),
        .funct3_i(ID_EX.funct3_o),
        .sdata_i(ID_EX.sdata_o),
        // exception
        .exception_i(ID_EX.exception_o),
        .mcause_i(ID_EX.mcause_o),
        .pc_i(ID_EX.pc_o)
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
        // write regfile
        .wen_i(EX.wen_o),
        .rd_i(EX.rd_o),
        // alu output
        .aluout_i(EX.aluout_o),
        // write csr
        .csr_wen_i(EX.csr_wen_o),
        .csr_addr_i(EX.csr_addr_o),
        .csr_wdata_i(EX.csr_wdata_o),
        // exception
        .exception_i(EX.exception_o),
        .mcause_i(EX.mcause_o),
        .pc_i(EX.pc_o)
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
        // write regfile
        .wen_i(EX_MEM.wen_o),
        .rd_i(EX_MEM.rd_o),
        // alu output
        .aluout_i(EX_MEM.aluout_o),
        // write csr
        .csr_wen_i(EX_MEM.csr_wen_o),
        .csr_addr_i(EX_MEM.csr_addr_o),
        .csr_wdata_i(EX_MEM.csr_wdata_o),
        // exception
        .exception_i(EX_MEM.exception_o),
        .mcause_i(EX_MEM.mcause_o),
        .pc_i(EX_MEM.pc_o)
    );

    mem_wb MEM_WB(
        .clock(clock),
        .reset(reset),
        // write regfile
        .wen_i(MEM.wen_o),
        .rd_i(MEM.rd_o),
        .wdata_i(MEM.wdata_o),
        // write csr
        .csr_wen_i(MEM.csr_wen_o),
        .csr_addr_i(MEM.csr_addr_o),
        .csr_wdata_i(MEM.csr_wdata_o),
        // exception
        .exception_i(MEM.exception_o),
        .mcause_i(MEM.mcause_o),
        .pc_i(MEM.pc_o)
    );

    wb WB(
        .clock(clock),
        .reset(reset),
        // write regfile
        .wen_i(MEM_WB.wen_o),
        .rd_i(MEM_WB.rd_o),
        .wdata_i(MEM_WB.wdata_o),
        // write csr
        .csr_wen_i(MEM_WB.csr_wen_o),
        .csr_addr_i(MEM_WB.csr_addr_o),
        .csr_wdata_i(MEM_WB.csr_wdata_o),
        // exception
        .exception_i(MEM_WB.exception_o),
        .mcause_i(MEM_WB.mcause_o),
        .pc_i(MEM_WB.pc_o),
        // ?
        .a0_i(RF.a0_o)
    );

    regfile RF(
        .clock(clock),
        .reset(reset),
        // id: read 
        .rs1_i(ID.rs1_o),
        .rs2_i(ID.rs2_o),
        // write back
        .wen_i(WB.wen_o),
        .rd_i(WB.rd_o),
        .wdata_i(WB.wdata_o)
    );

    CSRFile CSR(
        .clock(clock),
        .exception_i(WB.exception_o),
        .mcause_i(WB.mcause_o),
        .raddr_i(ID.csr_addr_o),
        .waddr_i(WB.csr_addr_o),
        .wen_i(WB.csr_wen_o),
        .wdata_i(WB.csr_wdata_o)
    );

    control CONT(
        .clock(clock),
        .id_branch_flush_i(ID.branch_flush_o),
        .wb_exception_i(WB.exception_o),
        .ex_div_i(EX.div_not_ready_o),
        .id_load_use_i(ID.load_use_o)
    );

//    srt_tb st(.clock(clock));

endmodule