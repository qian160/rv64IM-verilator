`include "define.v"
module if_id (
    input clock,
    input reset,
    // control
    input stall_i,
    input flush_i,
    // from ifetch
    input [31:0]    inst_i,
    input [63:0]    pc_i,
    // to ID
    output reg [31:0]   inst_o,
    output reg [63:0]   pc_o
);
///*
    always @(posedge clock) begin
        if (reset)  begin
            inst_o <= `NOP;
            pc_o   <= `PMEM_START;
        end
        else if (flush_i)   begin
            inst_o <= `NOP;
        end
        else if (~stall_i) begin
            inst_o <= inst_i;
            pc_o <= pc_i;
        end
    end
//*/
/*
    assign inst_o = inst_i;
    assign pc_o = pc_i;
*/
endmodule

module id_ex (
    input clock,
    input reset,
    input stall_i,
    input flush_i,
    // alu input
    input [63:0] srcA_i,
    input [63:0] srcB_i,
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
    input [63:0]    pc_i,
    // alu input
    output reg [63:0] srcA_o,
    output reg [63:0] srcB_o,
    output reg [4:0]  aluop_o,
    // mem
    output reg load_o,
    output reg store_o,
    output reg [2:0]     funct3_o,
    output reg [63:0]    sdata_o,
    // wb
    output reg wen_o,
    output reg exit_o,
    output reg [4:0]     rd_o,
    output reg [63:0]    pc_o
);
///*
    always @(posedge clock) begin
        if (reset | flush_i)    begin
            srcA_o <= 0;
            srcB_o <= 0;
            pc_o <= `PMEM_START;
            sdata_o <= 0;
            funct3_o <= 0;
            aluop_o <= 0;
            rd_o <= 0;
            load_o <= 0;
            store_o <= 0;
            wen_o <= 0;
            exit_o <= 0;
        end

        else if (~stall_i)      begin
            srcA_o <= srcA_i;
            srcB_o <= srcB_i;
            pc_o <= pc_i;
            sdata_o <= sdata_i;
            funct3_o <= funct3_i;
            aluop_o <= aluop_i;
            rd_o <= rd_i;
            load_o <= load_i;
            store_o <= store_i;
            wen_o <= wen_i;
            exit_o <= exit_i;
        end
    end
//*/
/*
    assign srcA_o = srcA_i;
    assign srcB_o = srcB_i;
    assign pc_o = pc_i;
    assign sdata_o = sdata_i;
    assign funct3_o = funct3_i;
    assign aluop_o = aluop_i;
    assign rd_o = rd_i;
    assign load_o = load_i;
    assign store_o = store_i;
    assign wen_o = wen_i;
    assign exit_o = exit_i;
*/
endmodule

module ex_mem (
    input   clock,
    input   reset,
    // mem
    input   store_i,
    input   load_i,
    input   [63:0]  sdata_i,
    input   [2:0]   funct3_i,
    input   [63:0]  aluout_i,     // load/store address, or data to regfile
    // wb
    input   wen_i,
    input   [4:0]   rd_i,
    input   exit_i,
    // debug
    input   [63:0]  pc_i,
    // mem
    output reg  store_o,
    output reg  load_o,
    output reg  [63:0]  sdata_o,
    output reg  [2:0]   funct3_o,
    output reg  [63:0]  aluout_o,
    // wb
    output reg  wen_o,
    output reg  [4:0]   rd_o,
    output reg  exit_o,
    // debug
    output reg  [63:0]  pc_o
);
///*
    always @(posedge clock) begin
        if (reset)  begin
            sdata_o <= 0;
            aluout_o <= 0;
            pc_o <= `PMEM_START;
            rd_o <= 0;
            funct3_o <= 0;
            load_o <= 0;
            store_o <= 0;
            wen_o <= 0;
            exit_o <= 0;
        end

        else    begin
            sdata_o <= sdata_i;
            aluout_o <= aluout_i;
            pc_o <= pc_i;
            rd_o <= rd_i;
            funct3_o <= funct3_i;
            load_o <= load_i;
            store_o <= store_i;
            wen_o <= wen_i;
            exit_o <= exit_i;
        end
    end
//*/
/*
    assign sdata_o = sdata_i;
    assign aluout_o = aluout_i;
    assign pc_o = pc_i;
    assign rd_o = rd_i;
    assign funct3_o = funct3_i;
    assign load_o = load_i;
    assign store_o = store_i;
    assign wen_o = wen_i;
    assign exit_o = exit_i; 
*/
endmodule

module mem_wb (
    input   clock,
    input   reset,
    // regfile
    input   wen_i,
    input   [4:0]     rd_i,
    input   [63:0]    wdata_i,
    // debug
    input   exit_i,
    input   [63: 0]  pc_i,
    input   [63: 0]  a0_i,

    // regfile
    output reg  wen_o,
    output reg  [4:0]     rd_o,
    output reg  [63:0]    wdata_o,
    // debug
    output reg  exit_o,
    output reg  [63: 0]  pc_o,
    output reg  [63: 0]  a0_o
);
///*
    always @(posedge clock ) begin
        if (reset)  begin
            wdata_o <= 0;
            pc_o <= `PMEM_START;
            a0_o <= 0;
            rd_o <= 0;
            wen_o <= 0;
            exit_o <= 0;
        end

        else    begin
            wdata_o <= wdata_i;
            pc_o <= pc_i;
            a0_o <= a0_i;
            rd_o <= rd_i;
            wen_o <= wen_i;
            exit_o <= exit_i;
        end
    end
//*/
/*
    assign wdata_o = wdata_i;
    assign pc_o = pc_i;
    assign a0_o = a0_i;
    assign rd_o = rd_i;
    assign wen_o = wen_i;
    assign exit_o = exit_i;
*/
endmodule