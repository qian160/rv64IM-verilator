/**********  CSR **********/
// Currently allocated RISC-V unprivileged CSR addresses.       UFO
`define CYCLE           12'hc00     // Cycle counter for RDCYCLE instruction
`define TIME            12'hc01     // Timer for RDTIME instruction
`define INSTRET         12'hc02     // Instructions-retired counter for RDINSTRET instruction
`define HPMCOUNTER3     12'hc03     // Performance-monitoring counter
`define HPMCOUNTER4     12'hc04     // Performance-monitoring counter
// ...
`define HPMCOUNTER31    12'hc1f     // Performance-monitoring counter

// Currently allocated RISC-V supervisor-level CSR addresses.   SRW
// Supervisor Trap Setup
`define SSTATUS         12'h100     // Supervisor status register
`define SIE             12'h104     // Supervisor interrupt-enable register
`define STVEC           12'h105     // Supervisor trap handler base address
`define SCOUNTEREN      12'h106     // Supervisor counter enable
// Supervisor Configuration
`define SENVCFG         12'h10a     // Supervisor environment configuration register
// Supervisor Trap Handling
`define SSCRATCH        12'h140     // Scratch register for supervisor trap handlers
`define SEPC            12'h141     // Supervisor exception program counter
`define SCAUSE          12'h142     // Supervisor trap cause
`define STVAL           12'h143     // Supervisor bad address or instruction
`define SIP             12'h144     // Supervisor interrupt pending
// Supervisor Protection and Translation
`define SATP            12'h180     // Supervisor address translation and protection
// Debug/Trace Registers
`define SCONTEXT        12'h5a8     // Supervisor-mode context register.

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
