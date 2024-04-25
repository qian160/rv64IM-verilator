/*  **********CSR***********    */
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
`define MSCRATCH        12'h340     // Scratch register for machine trap handlers
`define MEPC            12'h341     // Machine exception program counter
`define MCAUSE          12'h342     // Machine trap cause
`define MTVAL           12'h343     // Machine bad address or instruction
`define MIP             12'h344     // Machine interrupt pending
`define MTINST          12'h34a     // Machine trap instruction (transformed)
`define MTVAL2          12'h34b     // Machine bad guest physical address
// Machine Configuration            MRW
`define MENVCFG         12'h30a     // Machine environment configuration register 
`define MENVCFGH        12'h31a     // Additional machine env. conf. register, RV32 only
`define MSECCFG         12'h747     // Machine security configuration register
`define MSECCFGH        12'h757     // Additional machine security conf. register, RV32 only
// Machine Counter/Timers           MRW
`define MCYCLE          12'hb00     // Machine cycle counter
`define MINSTRET        12'hb02     // Machine instructions-retired counter
`define MHPMCOUNTER3    12'hb03     // Machine performance-monitoring counter
`define MHPMCOUNTER4    12'hb04
`define MHPMCOUNTER31   12'hb1f
// Machine Counter Setup            MRW
`define MCOUNTINHIBIT   12'h320     // Machine counter-inhibit register
`define MHPMEVENT3      12'h323     // Machine performance-monitoring event selector
`define MHPMEVENT4      12'h324
`define MHPMEVENT31     12'h33f

// INDEX
`define MSTATUS_SD      63          // summarizes whether either the FS, VS, or XS fields signal the presence of some dirty state that will require saving extended user context to memory
`define MSTATUS_MBE     37          // non-instruction-fetch memory accesses from M-mode. 0: unimp/small-endian 1: big-endian
`define MSTATUS_SBE     36          // 
`define MSTATUS_SXL     35:34       // the value of XLEN for S-mode. 0: unimp, 1: 32, 2: 64, 3: 128
`define MSTATUS_UXL     33:32       // the value of XLEN for U-mode
`define MSTATUS_TSR     22          // Trap SRET
`define MSTATUS_TW      21          // Timeout Wait(wfi)
`define MSTATUS_TVM     20          // Trap Virtual Memory
`define MSTATUS_MXR     19          // Make eXecutable Readable
`define MSTATUS_SUM     18          // permit Supervisor User Memory access
`define MSTATUS_MPRIV   17          // the privilege level at which loads and stores execute. 0: normal 1: protected
`define MSTATUS_XS      16:15       // the status of additional user-mode extensions and associated state
`define MSTATUS_FS      14:13       // the status of the floating-point unit state
`define MSTATUS_MPP     12:11
`define MSTATUS_VS      10:9        // the status of the vector extension state
`define MSTATUS_SPP     8
`define MSTATUS_MPIE    7
`define MSTATUS_UBE     6
`define MSTATUS_SPIE    5
`define MSTATUS_UPIE    4
`define MSTATUS_MIE     3
`define MSTATUS_SIE     1
`define MSTATUS_UIE     0
// mcause: [63] interrupt [62:0] code
// int = 1
`define SUPERVISOR_SOFTWARE_INT     {1'b1, 63'd1}
`define MACHINE_SOFTWARE_INT        {1'b1, 63'd3}
`define SUPERVISOR_TIMER_INT        {1'b1, 63'd5}
`define MACHINE_TIMER_INT           {1'b1, 63'd7}
`define SUPERVISOR_EXTERNAL_INT     {1'b1, 63'd9}
`define MACHINE_EXTERNAL_INT        {1'b1, 63'd11}
// int = 0
`define INST_ADDR_MISALIGNED     64'd0
`define INST_ACCESS_FAULT        64'd1
`define INST_ILLEGAL             64'd2
`define BREAKPOINT               64'd3
`define LOAD_ADDR_MISALIGNED     64'd4
`define LOAD_ACCESS_FAULT        64'd5
`define STORE_ADDR_MISALIGNED    64'd6
`define STORE_ACCESS_FAULT       64'd7
`define ECALL_FROM_U             64'd8      // syscall
`define ECALL_FROM_S             64'd9
`define ECALL_FROM_M             64'd11
`define INST_PAGEFAULT           64'd12
`define LOAD_PAGEFAULT           64'd13
`define STORE_PAGEFAULT          64'd15
// non-standard
`define URET                     64'd16
`define SRET                     64'd17
`define MRET                     64'd19

// User Trap Setup
`define USTATUS     12'h000
`define UIE         12'h004
`define UTVEC       12'h005
// User Trap Handling
`define USCRATCH    12'h040
`define UEPC        12'h041
`define UCAUSE      12'h042
`define UTVAL       12'h043
`define UIP         12'h044
// User Floating-Point CSRs (disabled)
`define FFLAGS      12'h001
`define FRM         12'h002
`define FCSR        12'h003
// User Counter/Timers
`define CYCLE       12'hc00     // Cycle counter for RDCYCLE instruction
`define TIME        12'hc01     // Timer for RDTIME instruction
`define INSTRET     12'hc02     // Instructions-retired counter for RDINSTRET instruction
// ...

// Supervisor Trap Setup
`define SSTATUS     12'h100
`define SEDELEG     12'h102
`define SIDELEG     12'h103
`define SIE         12'h104
`define STVEC       12'h105
`define SCOUNTEREN  12'h106
// User Trap Handling
`define SSCRATCH    12'h140
`define SEPC        12'h141
`define SCAUSE      12'h142
`define STVAL       12'h143
`define SIP         12'h144
// Supervisor Protection and Translation
`define SATP        12'h180     // Supervisor address translation and protection


`define PRIV_M      2'd3        // 2 is reserved
`define PRIV_S      2'd1
`define PRIV_U      2'd0
