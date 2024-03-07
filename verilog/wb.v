`include "define.v"
module wb(
    input           clock,
    input           reset,
    // write regfile
    input           wen_i,
    input   [4:0]   rd_i,
    input   [63:0]  wdata_i,
    // write csr
    input           csr_wen_i,
    input   [11:0]  csr_addr_i,
    input   [63:0]  csr_wdata_i,
    // debug
    input           exit_i,
    input   [63:0]  pc_i,
    input   [63:0]  a0_i,  // from regfile
    // write regfile
    output  wen_o,
    output  [4:0]   rd_o,
    output  [63:0]  wdata_o,
    // write csr
    output          csr_wen_o,
    output  [11:0]  csr_addr_o,
    output  [63:0]  csr_wdata_o
);
    assign rd_o = rd_i;
    assign wen_o = wen_i;
    assign wdata_o = wdata_i;

    assign csr_wen_o = csr_wen_i;
    assign csr_addr_o = csr_addr_i;
    assign csr_wdata_o = csr_wdata_i;

    always @* begin
        if(exit_i)   begin
            if(a0_i != 64'h0)
                $display("\n\n hit \033[1;31mbad\033[0m trap at pc = %x", pc_i);
            else
                $display("\n\n hit \033[1;32mgood\033[0m trap at pc = %x", pc_i);
            $display("\n exit value = %x\n\n", a0_i);
            $finish;
        end
    end
endmodule