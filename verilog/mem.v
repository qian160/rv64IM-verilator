`include "define.v"
import "DPI-C" function void set_mem_ptr(input logic [63:0] a[]);
module mem(
    input   clock,
    input   reset,
    // ifetch, combinational logic. no pipeline register
    input   [63:0]  if_pc_i,
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
    // wb
    output  wen_o,
    output  [4:0]   rd_o,
    output  [63:0]  wdata_o,
    output  [63:0]  pc_o,
    // debug
    output  exit_o,
    // ifetch
    output reg [31:0]   inst_o
);
    /*  ifetch  */
    wire [63:0] pc_off;
    assign pc_off = if_pc_i - `PMEM_START;
    // size = 2^20 = 1MB
    reg [7:0] mem [0:((1<<20)-1)];

    initial begin
        $readmemh("/home/s081/Downloads/projects/cpu/img", mem);
        set_mem_ptr(mem);
        $display("hello world!");
    end

    always @(*) begin
        inst_o = {mem[pc_off+3], mem[pc_off+2], mem[pc_off+1], mem[pc_off]};
    end
    /*  end ifetch  */
    reg [63:0] load_data;
    wire [1:0] width = funct3_i[1:0];
    wire load_unsigned = funct3_i[2];
    wire [63:0] start = aluout_i - `PMEM_START;
    /*  load */
    always @(*) begin
        load_data = 64'd0;
        if (load_i) begin
            case (width)
                2'd0:   load_data = (load_unsigned)? `ZEXT(mem[start], 8, 64) : `SEXT(mem[start], 8, 64);
                2'd1:   load_data = (load_unsigned)? 
                        `ZEXT({mem[start+1], mem[start]}, 16, 64):
                        `SEXT({mem[start+1], mem[start]}, 16, 64);
                2'd2:   load_data = (load_unsigned)? 
                        `ZEXT({mem[start+3], mem[start+2], mem[start+1], mem[start]}, 32, 64): 
                        `SEXT({mem[start+3], mem[start+2], mem[start+1], mem[start]}, 32, 64);
                2'd3:   load_data = {mem[start+7], mem[start+6], mem[start+5], mem[start+4], mem[start+3], mem[start+2], mem[start+1], mem[start]};
            endcase
            //$display("(%x) [x%d] <= %x [%x]", pc_i, rd_i, load_data, aluout_i);
        end
    end

    always @(posedge clock) begin
        if (store_i)    begin
            case (width)
                2'd0:   mem[start] <= sdata_i[7:0];
                2'd1:   {mem[start+1], mem[start]} <= sdata_i[15:0];
                2'd2:   {mem[start+3], mem[start+2], mem[start+1], mem[start]} <= sdata_i[31:0];
                2'd3:   {mem[start+7], mem[start+6], mem[start+5], mem[start+4], mem[start+3], mem[start+2], mem[start+1], mem[start]} <= sdata_i;
            endcase
            //$display("(%x) %x => Mem[%x]", pc_i, sdata_i, aluout_i);
        end
    end

    assign wen_o = wen_i;
    assign rd_o = rd_i;
    assign wdata_o = load_i? load_data: aluout_i;

    assign pc_o = pc_i;
    assign exit_o = exit_i;

endmodule