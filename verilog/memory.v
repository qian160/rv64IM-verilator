`include "define.v"
import "DPI-C" function void set_mem_ptr(input logic [63:0] a[]);
module memory(
    input [63:0]        pc_i,
    output reg [31:0]   inst_o
);

    wire [63:0] pc_off;
    assign pc_off = pc_i - `PC_INIT;
    // size = 2^20 = 1MB
    reg [7:0] mem [0:((1<<20)-1)];

    initial begin
        $readmemh("./img", mem);
        set_mem_ptr(mem);
        $display("hello world!");
    end

    always @(*) begin
        inst_o = {mem[pc_off+3], mem[pc_off+2], mem[pc_off+1], mem[pc_off]};
    end
endmodule