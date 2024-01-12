import "DPI-C" function void set_gpr_ptr(input logic [63:0] a[]);
module regfile(
    input clock,
    input reset,
    // wb
    input wen_i,            // write enable
    input [4:0] rd_i,
    input [63:0] wdata_i,   // write data
    // id
    input [4:0] rs1_i,
    input [4:0] rs2_i,
    output [63:0] rdata1_o, // read data1
    output [63:0] rdata2_o, // read data2
    output [63:0] a0_o
);
    reg [63:0] rf [0: 31];
    initial set_gpr_ptr(rf);

    always @(posedge clock) begin
        if (reset)
            for (int i = 0; i < 32; i++) rf[i] <= 64'h0;
        else if (wen_i && (rd_i != 5'h0))
            rf[rd_i] <= wdata_i;
    end

    assign rdata1_o = rf[rs1_i];
    assign rdata2_o = rf[rs2_i];
    assign a0_o = rf[5'd10];
endmodule