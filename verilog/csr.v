/*  run on machine mode only   */
`include "define.v"
// ebreak: exception. set mepc
module CSRFile (
    input           clock,
    // exception
    input           exception_i,
    input   [63:0]  mcause_i,
    input   [63:0]  pc_i,       // from wb
    // id: read csr
    input   [11:0]  raddr_i,
    // wb: write csr
    input   [11:0]  waddr_i,
    input           wen_i,
    input   [63:0]  wdata_i,
    // read
    output  [63:0]  rdata_o,
    // exception
    output  [63:0]  mtvec_o,
    output  [63:0]  mepc_o
);
    reg [63:0] csr[0:4095];
    initial begin
        for (integer i = 0; i < 4095; i = i + 1)
            csr[i] = 0;
    end
    //                  MXL=64            M    I       C        TODU: add S/U ?
    assign csr[`MISA] = {2'd2, 36'd0, 26'b1_0001_0000_0100};

    // sequential write
    always @(posedge clock) begin
        if (wen_i)  begin
            csr[waddr_i] <= wdata_i;
        end
    end

    always @(posedge clock) begin
        if (exception_i)    begin
            csr[`MCAUSE] <= mcause_i;
            csr[`MEPC] <= pc_i;
        end
    end
    // combinatianal read
    assign rdata_o = csr[raddr_i];

    assign mtvec_o = csr[`MTVEC];
    assign mepc_o = csr[`MEPC];
endmodule