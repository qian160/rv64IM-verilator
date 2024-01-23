module wb(
    // regfile
    input wen_i,
    input [4:0]     rd_i,
    input [63:0]    rf_wdata_i,
    // debug
    input   exit_i,
    input   [63: 0]  pc_i,
    input   [63: 0]  a0_i,
    // to rf
    output wen_o,
    output [4:0]    rd_o,
    output [63:0]   rf_wdata_o
);

    assign rd_o     = rd_i;
    assign wen_o = wen_i;
    assign rf_wdata_o = rf_wdata_i;

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