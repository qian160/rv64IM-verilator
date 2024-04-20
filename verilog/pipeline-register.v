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

endmodule

module id_ex (
    input           clock,
    input           reset,
    input           stall_i,
    input           flush_i,
    // alu input
    input [63:0]    srcA_i,
    input [63:0]    srcB_i,
    input [4:0]     aluop_i,
    // mem
    input           load_i,
    input           store_i,
    input [2:0]     funct3_i,
    input [63:0]    sdata_i,
    // write regfile
    input           wen_i,
    input [4:0]     rd_i,
    // write csr
    input           csr_wen_i,
    input [11:0]    csr_addr_i,
    input [63:0]    csr_wdata_i,
    // rva
    input           rva_valid_i,
    input   [4:0]   funct5_i,
    /// exception
    input           exception_i,
    input [63:0]    pc_i,
    input [63:0]    cause_i,
    // alu input
    output reg [63:0]   srcA_o,
    output reg [63:0]   srcB_o,
    output reg [4:0]    aluop_o,
    // mem
    output reg          load_o,
    output reg          store_o,
    output reg [2:0]    funct3_o,
    output reg [63:0]   sdata_o,
    // write regfile
    output reg          wen_o,
    output reg [4:0]    rd_o,
    // write csr
    output reg          csr_wen_o,
    output reg [11:0]   csr_addr_o,
    output reg [63:0]   csr_wdata_o,
    // rva
    output reg          rva_valid_o,
    output reg [4:0]    funct5_o,
    // exception
    output reg          exception_o,
    output reg [63:0]   cause_o,
    output reg [63:0]   pc_o
);
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
            exception_o <= 0;
            csr_wen_o <= 0;
            csr_addr_o <= 0;
            csr_wdata_o <= 0;
            cause_o <= 0;
            rva_valid_o <= 0;
            funct5_o <= 0;
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
            exception_o <= exception_i;
            csr_wen_o <= csr_wen_i;
            csr_addr_o <= csr_addr_i;
            csr_wdata_o <= csr_wdata_i;
            cause_o <= cause_i;
            rva_valid_o <= rva_valid_i;
            funct5_o <= funct5_i;
        end
    end
endmodule

module ex_mem (
    input   clock,
    input   reset,
    input   stall_i,                // not being used in fact
    input   flush_i,
    // mem
    input           store_i,
    input           load_i,
    input   [63:0]  sdata_i,
    input   [2:0]   funct3_i,
    input   [63:0]  aluout_i,       // load/store address, or data to regfile
    // write regfile
    input           wen_i,
    input   [4:0]   rd_i,
    // write csr
    input           csr_wen_i,
    input   [11:0]  csr_addr_i,
    input   [63:0]  csr_wdata_i,
    // rva
    input           rva_valid_i,
    input   [4:0]   funct5_i,
    // exception
    input           exception_i,
    input   [63:0]  cause_i,
    input   [63:0]  pc_i,
    // mem
    output reg          store_o,
    output reg          load_o,
    output reg  [63:0]  sdata_o,
    output reg  [2:0]   funct3_o,
    output reg  [63:0]  aluout_o,
    // write regfile
    output reg          wen_o,
    output reg  [4:0]   rd_o,
    // write csr
    output reg          csr_wen_o,
    output reg  [11:0]  csr_addr_o,
    output reg  [63:0]  csr_wdata_o,
    // rva
    output reg          rva_valid_o,
    output reg  [4:0]   funct5_o,
    // exception
    output reg          exception_o,
    output reg  [63:0]  cause_o,
    output reg  [63:0]  pc_o
);
    always @(posedge clock) begin
        if (reset | flush_i)  begin
            sdata_o <= 0;
            aluout_o <= 0;
            pc_o <= `PMEM_START;
            rd_o <= 0;
            funct3_o <= 0;
            load_o <= 0;
            store_o <= 0;
            wen_o <= 0;
            exception_o <= 0;
            csr_wen_o <= 0;
            csr_addr_o <= 0;
            csr_wdata_o <= 0;
            cause_o <= 0;
            rva_valid_o <= 0;
            funct5_o <= 0;
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
            exception_o <= exception_i;
            csr_wen_o <= csr_wen_i;
            csr_addr_o <= csr_addr_i;
            csr_wdata_o <= csr_wdata_i;
            cause_o <= cause_i;
            rva_valid_o <= rva_valid_i;
            funct5_o <= funct5_i;
        end
    end
endmodule

module mem_wb (
    input   clock,
    input   reset,
    // write regfile
    input           wen_i,
    input   [4:0]   rd_i,
    input   [63:0]  wdata_i,
    // write csr
    input           csr_wen_i,
    input   [11:0]  csr_addr_i,
    input   [63:0]  csr_wdata_i,
    // exception
    input           exception_i,
    input   [63:0]  cause_i,
    input   [63:0]  pc_i,

    // write regfile
    output reg          wen_o,
    output reg  [4:0]   rd_o,
    output reg  [63:0]  wdata_o,
    // write csr
    output reg          csr_wen_o,
    output reg  [11:0]  csr_addr_o,
    output reg  [63:0]  csr_wdata_o,
    // exception
    output reg          exception_o,
    output reg  [63:0]  cause_o,
    output reg  [63:0]  pc_o
);
    always @(posedge clock ) begin
        if (reset)  begin
            wdata_o <= 0;
            pc_o <= `PMEM_START;
            rd_o <= 0;
            wen_o <= 0;
            exception_o <= 0;
            csr_wen_o <= 0;
            csr_addr_o <= 0;
            csr_wdata_o <= 0;
            cause_o <= 0;
        end

        else    begin
            wdata_o <= wdata_i;
            pc_o <= pc_i;
            rd_o <= rd_i;
            wen_o <= wen_i;
            exception_o <= exception_i;
            csr_wen_o <= csr_wen_i;
            csr_addr_o <= csr_addr_i;
            csr_wdata_o <= csr_wdata_i;
            cause_o <= cause_i;
        end
    end
endmodule