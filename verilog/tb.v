// for vivado
module tb();
    reg clk, rst;
    localparam CLK_PERIOD = 10;

    always #(CLK_PERIOD/2) clk=~clk;

    top t(.clock(clk), .reset(rst));
    initial begin
        #1 rst<=1'bx;clk<=1'bx;
        #(CLK_PERIOD*3) rst_n<=1;
        #(CLK_PERIOD*3) rst_n<=0;clk<=0;
    end

endmodule