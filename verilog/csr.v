/*  run on machine mode only   */

// Currently allocated RISC-V machine-level CSR addresses.
// Machine Information Registers    MRO
`define MVENVORID       12'hf11     // Vendor ID
`define MARCHID         12'hf12     // Architecture ID
`define MIMPID          12'hf13     // Implementation ID
`define MHARTID         12'hf14     // Hardware thread ID
`define MCONGIFPTR      12'hf15     // Pointer to configuration data structure
// Machine Trap Setup               MRW
`define MSTATUS         12'h300     // Machine status register
`define MISA            12'h301     // ISA and extensions
`define MEDELEG         12'h302     // Machine exception delegation register
`define MIDELEG         12'h303     // Machine interrupt delegation register
`define MIE             12'h304     // Machine interrupt-enable register
`define MTVEC           12'h305     // Machine trap-handler base address
`define MCOUNTEREN      12'h306     // Machine counter enable
`define MSTATUSH        12'h310     // Additional machine status register, RV32 only
// Machine Trap Handling            MRW
`define MSCRATCH        12'h340
`define MEPC            12'h341
`define MCAUSE          12'h342
`define MTVAL           12'h343
`define MIP             12'h344
`define MTINST          12'h34a
`define MTVAL2          12'h34b
// Machine Configuration            MRW
`define MENVCFG         12'h30a
`define MENVCFGH        12'h31a
`define MSECCFG         12'h747
`define MSECCFGH        12'h757
// Machine Counter/Timers           MRW
`define MCYCLE          12'hb00
`define MINSTRET        12'hb02
`define MHPMCOUNTER3    12'hb03
`define MHPMCOUNTER4    12'hb04
`define MHPMCOUNTER31   12'hb1f
// Machine Counter Setup            MRW
`define MCOUNTINHIBIT   12'h320
`define MHPMEVENT3      12'h323
`define MHPMEVENT4      12'h324
`define MHPMEVENT31     12'h33f

module CSRFile (
    input           clock,
    input   [11:0]  raddr_i,
    input   [11:0]  waddr_i,
    input           wen_i,
    input   [63:0]  wdata_i,

    output  [63:0]  rdata_o
);
    reg [63:0] csr[0:1023];
    initial begin
        for (integer i = 0; i < 1024; i = i + 1)
            csr[i] = 0;
    end
    // sequential write
    always @(posedge clock) begin
        if (wen_i)
            csr[waddr_i] <= wdata_i;
    end
    // combinatianal read
    assign rdata_o = csr[raddr_i];
endmodule