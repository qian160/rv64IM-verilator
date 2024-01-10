module top(input clock, input reset, output [63:0]pc_o, output reg [31:0]inst_o);
    // low-order 4-way interleave memory
    // size = 4*2^18 = 1MB
    reg [7:0] mem0 [0:(1<<18-1)];
    reg [7:0] mem1 [0:(1<<18-1)];
    reg [7:0] mem2 [0:(1<<18-1)];
    reg [7:0] mem3 [0:(1<<18-1)];
    reg [63:0 ] pc;
    initial begin
        $readmemh("./img0", mem0);
        $readmemh("./img1", mem1);
        $readmemh("./img2", mem2);
        $readmemh("./img3", mem3);
        $display("hello world!");
    end

    always @(posedge clock)   begin
        if (reset)
            pc <= 64'h80000000;
        else 
            pc <= pc + 4;
    end

    always @(*) begin
        inst_o = {mem3[pc/4], mem2[pc/4], mem1[pc/4], mem0[pc/4]};
    end

    assign pc_o = pc;

endmodule