module mem(
    // main memory
//    input   store_i,
//    input   load_i,
    input   [63:0]    aluout_i,     // load/store address, or data to regfile
    input   [63:0]    load_data_i,  // load from memory
    // ex's output
    input   rf_wen_i,
    input   [4:0] rf_rd_i,
    input   [63:0]  pc_i,
    input   exit_i,
    // to wb(regfile)
    output  rf_wen_o,
    output  [4:0] rf_rd_o,
    output  [63:0] rf_wdata_o,
    output  [63:0]  pc_o,
    output  exit_o
);

    assign rf_wen_o = rf_wen_i;
    assign rf_rd_o = rf_rd_i;
    assign rf_wdata_o = aluout_i;

    assign pc_o = pc_i;
    assign exit_o = exit_i;
endmodule