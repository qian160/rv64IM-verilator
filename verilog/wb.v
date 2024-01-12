module wb(
    // regfile
    input rf_wen_i,
    input [4:0] rf_rd_i,
    input [63:0] rf_wdata_i,
    // debug
    input   exit_i,
    input   [63: 0]  pc_i,
    input   [63: 0]  a0_i,
    // to rf
    output rf_wen_o,
    output [4:0]  rf_rd_o,
    output [63:0] rf_wdata_o
);

    assign rf_rd_o = rf_rd_i;
    assign rf_wdata_o = rf_wdata_i;
    assign rf_wen_o = rf_wen_i;

    always @* begin
        if(exit_i)   begin
            if(a0_i != 64'h0)
                $display("\n\n hit \033[1;31mbad\033[0m trap at pc = %x", pc_i);
            else
                $display("\n\n hit \033[1;32mgood\033[0m trap at pc = %x", pc_i);
            $display("\nexit value = %x\n\n", a0_i);
            $finish;
        end
    end
endmodule