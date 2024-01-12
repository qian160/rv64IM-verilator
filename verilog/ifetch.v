/*
TODO: cache, branch-predictor?
*/
module ifetch (
    input clock,
    input reset,
    input [31:0]    inst_i,
    output [63:0]   pc_o,
    output [31:0]   inst_o
);
    reg [63:0 ] pc;

    always @(posedge clock)   begin
        if (reset)
            pc <= `PC_INIT;
        else 
            pc <= pc + 4;
    end

    assign pc_o = pc;
    assign inst_o = inst_i;
endmodule