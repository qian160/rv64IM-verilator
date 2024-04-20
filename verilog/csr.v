import "DPI-C" function void set_csr_ptr(input logic [63:0] a[]);
`include "define.v"
/*
TODO:
    Accurate real-time clocks (RTCs) are relatively expensive to provide (requiring a crystal
    or MEMS oscillator) and have to run even when the rest of system is powered down, and so
    there is usually only one in a system located in a different frequency/voltage domain from the
    processors. Hence, the RTC must be shared by all the harts in a system and accesses to the RTC
    will potentially incur the penalty of a voltage-level-shifter and clock-domain crossing. It is thus
    more natural to expose mtime as a memory-mapped register than as a CSR.
    Lower privilege levels do not have their own timecmp registers. Instead, machine-mode
    software can implement any number of virtual timers on a hart by multiplexing the next timer
    interrupt into the mtimecmp register
*/
module CSRFile (
    input           clock,
    // exception
    input           exception_i,
    input   [63:0]  cause_i,
    input   [63:0]  pc_i,       // from wb
    // id: read csr
    input   [11:0]  raddr_i,
    // wb: write csr
    input   [11:0]  waddr_i,
    input           wen_i,
    input   [63:0]  wdata_i,
    // read
    output  [63:0]  rdata_o,
    output  [1:0]   priv_o,
    output reg [63:0]   exception_newPC_o
);

    reg [63:0] csr[0:4095];
    initial set_csr_ptr(csr);
    // privilege
    reg priv = `PRIV_M;
    reg next_priv;

    reg [63:0] mstatus;
    assign csr[`MSTATUS] = mstatus;
    // aliases
    wire [63:0] mepc = csr[`MEPC];
    wire [63:0] sepc = csr[`SEPC];
    wire [63:0] uepc = csr[`UEPC];
    wire [63:0] mtvec = csr[`MTVEC];
    wire [63:0] stvec = csr[`STVEC];
    wire [63:0] utvec = csr[`UTVEC];

    wire [63:0] xtvec = (priv == `PRIV_M)? mtvec:
                    (priv == `PRIV_S)? stvec:
                    (priv == `PRIV_U)? utvec:
                    mtvec;

    wire xtvec_addr = xtvec[0]?    // mode
            {2'b0, xtvec[63:2]} + (cause_i << 2):
            {2'b0, xtvec[63:2]};

    initial begin
        //            MXL=64            M    I       C A      TODU: add S/U ?
        csr[`MISA] = {2'b10, 36'd0, 26'b1_0001_0000_0101};    // note: rvg: g = i m a f d
        mstatus = 64'ha00000000;      // UXL = SXL = 64
    end

    always @(posedge clock) begin
        csr[`CYCLE] <= csr[`CYCLE] + 64'd1;
    end


    /*
    xret:
        xIE  <- xPIE
        priv <- xPP
        xPIE <- 1
        xPP  <- U
    ecall:

    */
    
    always @(*) begin
        exception_newPC_o = 0;
        next_priv = priv;
        if (exception_i)    begin
            case (cause_i)
                `MRET:  begin
                    next_priv = mstatus[`MSTATUS_MPP];
                    exception_newPC_o = mepc;
                    mstatus[`MSTATUS_MIE] = mstatus[`MSTATUS_MPIE];
                    mstatus[`MSTATUS_MPIE] = 1'b1;
                    mstatus[`MSTATUS_MPP] = `PRIV_U;        // MPP: 2b
                end
                `SRET:  begin
                    next_priv = mstatus[`MSTATUS_SPP];
                    exception_newPC_o = sepc;
                    mstatus[`MSTATUS_SIE] = mstatus[`MSTATUS_SPIE];
                    mstatus[`MSTATUS_SPIE] = 1'b1;
                    mstatus[`MSTATUS_SPP] = 0;              // SPP: 1b
                end
                `URET:  begin
                    next_priv = `PRIV_U;
                    exception_newPC_o = uepc;
                    mstatus[`MSTATUS_UIE] = mstatus[`MSTATUS_UPIE];
                    mstatus[`MSTATUS_UPIE] = 1'b1;
                end
                // ???
                `ECALL_FROM_M:  begin
                    exception_newPC_o = mtvec;
                    next_priv = `PRIV_M;
                    mstatus[`MSTATUS_MPP] = `PRIV_M;
                    // others?
                end
                `ECALL_FROM_S:  begin
                    exception_newPC_o = mtvec;
                    next_priv = `PRIV_M;
                    mstatus[`MSTATUS_SPP] = `PRIV_S;
                end
                `ECALL_FROM_U:  begin
                    exception_newPC_o = stvec;
                    next_priv = `PRIV_S;
                    mstatus[`MSTATUS_SPP] = `PRIV_U;
                end
                default:    begin
                    // other traps
                    // xPIE <- xIE
                    // xIE  <- 0
                    // xPP  <- priv
                end
            endcase
        end
    end

    always @(posedge clock) begin
        priv <= next_priv;
    end


    // sequential write
    always @(posedge clock) begin
        if (wen_i)  begin
            csr[waddr_i] <= wdata_i;
        end
    end

    always @(posedge clock) begin
        if (exception_i)    begin
            // todo: xpie?  xstatus?
            case (next_priv)
                `PRIV_M:    begin
                    csr[`MCAUSE] <= cause_i;
                    csr[`MEPC] <= pc_i;
                end
                `PRIV_S:    begin
                    csr[`SCAUSE] <= cause_i;
                    csr[`SEPC] <= pc_i;
                end
                `PRIV_U:    begin
                    csr[`UCAUSE] <= cause_i;
                    csr[`UEPC] <= pc_i;
                end
                default:;
            endcase
        end
    end
    // to ID
    assign rdata_o = csr[raddr_i];
    // to IF
    assign xtvec_o = (next_priv == `PRIV_M) ? csr[`MTVEC] :
                    (next_priv == `PRIV_S) ? csr[`STVEC] :
                    (next_priv == `PRIV_U) ? csr[`UTVEC] :
                    csr[`MTVEC];
    
    assign xepc_o = (next_priv == `PRIV_M) ? csr[`MEPC] :
                    (next_priv == `PRIV_S) ? csr[`SEPC] :
                    (next_priv == `PRIV_U) ? csr[`UEPC] :
                    csr[`MEPC];
endmodule