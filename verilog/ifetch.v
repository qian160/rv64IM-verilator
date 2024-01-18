/*
TODO: cache, branch-predictor?
*/
`include "define.v"
module ifetch (
    input clock,
    input reset,
    // from memory
    input  [31:0]   inst_i,
    // from id
    input  branch_i,
    input  is_compressed_i,
    input  [63:0]   branch_target_i,

    output [63:0]   pc_o,
    output [31:0]   inst_o
);
    reg [63:0] pc;
    reg [63:0] next_pc;

    always @*   begin
        // combinational logic for next_pc
        if (reset)
            next_pc = `PMEM_START;
        else if (branch_i)
            next_pc = branch_target_i;
        else if (is_compressed_i)
            next_pc = pc + 64'd2;
        else
            next_pc = pc + 64'd4;
    end

    always @(posedge clock) begin
        // sequential logic for pc's update
        pc <= next_pc;
    end

    assign pc_o = pc;
    assign inst_o = inst_i;
endmodule