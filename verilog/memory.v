`include "macro.v"
module memory(
    input [63:0]        pc_i,
    output reg [31:0]   inst_o
);

    wire [63:0] pc_off;
    assign pc_off = pc_i - `PC_INIT;
    // low-order 4-way interleave memory
    // size = 4*2^18 = 1MB
    reg [7:0] mem0 [0:(1<<18-1)];
    reg [7:0] mem1 [0:(1<<18-1)];
    reg [7:0] mem2 [0:(1<<18-1)];
    reg [7:0] mem3 [0:(1<<18-1)];

    initial begin
        $readmemh("./img0", mem0);
        $readmemh("./img1", mem1);
        $readmemh("./img2", mem2);
        $readmemh("./img3", mem3);
        $display("hello world!");
    end

    always @(*) begin
        inst_o = {mem3[pc_off/4], mem2[pc_off/4], mem1[pc_off/4], mem0[pc_off/4]};
    end

endmodule