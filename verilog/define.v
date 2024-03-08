// see https://msyksphinz-self.github.io/riscv-isadoc/html/ and 
// https://riscv.org/wp-content/uploads/2017/05/riscv-spec-v2.2.pdf
// for details

`define EBREAK      32'h100073
`define NOP         32'h13
`define C_EBREAK    16'h9002

// init values
`define PMEM_START  64'h80000000

/*  opcode  */
`define OPCODE_ARITH_R   7'b0110011
`define OPCODE_ARITH_I   7'b0010011
`define OPCODE_LOAD      7'b0000011
`define OPCODE_STORE     7'b0100011
`define OPCODE_BRANCH    7'b1100011
`define OPCODE_JAL       7'b1101111
`define OPCODE_JALR      7'b1100111
`define OPCODE_LUI       7'b0110111
`define OPCODE_AUIPC     7'b0010111
`define OPCODE_SYS       7'b1110011
// rv64
`define OPCODE_RV64_ARITH_R  7'b0111011
`define OPCODE_RV64_ARITH_I  7'b0011011

/*  aluop   */
// some R-type and I-type instructions just use the same aluop
// e.g. addi and add: they just share aluop = add
// rv32i
`define ALU_ADD     5'd0
`define ALU_SUB     5'd1
`define ALU_SLL     5'd2
`define ALU_SRL     5'd3
`define ALU_SRA     5'd4
`define ALU_AND     5'd5
`define ALU_XOR     5'd6
`define ALU_OR      5'd7
`define ALU_SLT     5'd8
`define ALU_SLTU    5'd9
//rv32m (no mulu)
`define ALU_MUL     5'd10   // mul (low, signed)
`define ALU_MULH    5'd11   // mul high(SIGNED)
`define ALU_MULHU   5'd12   // mul high unsigned
`define ALU_MULHSU  5'd13   // mul high, rs1 signed, rs2 unsigned. strange...
`define ALU_DIV     5'd14
`define ALU_DIVU    5'd15
`define ALU_REM     5'd16
`define ALU_REMU    5'd17
//rv64i
`define ALU_ADDW    5'd18
`define ALU_SUBW    5'd19
`define ALU_SLLW    5'd20
`define ALU_SRLW    5'd21
`define ALU_SRAW    5'd22
//rv64m (no muluw)
`define ALU_MULW    5'd23
`define ALU_DIVW    5'd24
`define ALU_REMW    5'd25
`define ALU_DIVUW   5'd26
`define ALU_REMUW   5'd27

/*  funct7  */
// I haven't thought up of a good name for this, so I'll make do with "magic numbers"
// typically there are 3 kinds of funct7: 0x00, 0x01, 0x20.
// 0x01 is for M-extension. but the boundary between 0x00 and 0x20 seems to be hard to define

/*  funct3  */
//////// rv32i /////////
// arith-i
`define FCT3_ADDI       3'd0
`define FCT3_SLLI       3'd1
`define FCT3_SLTI       3'd2
`define FCT3_SLTIU      3'd3
`define FCT3_XORI       3'd4
`define FCT3_SRLI_SRAI  3'd5
`define FCT3_ORI        3'd6
`define FCT3_ANDI       3'd7
// arith-r
`define FCT3_ADD        3'd0
`define FCT3_SUB        3'd0
`define FCT3_SLL        3'd1
`define FCT3_SLT        3'd2
`define FCT3_SLTU       3'd3
`define FCT3_XOR        3'd4
`define FCT3_SRL        3'd5
`define FCT3_SRA        3'd5
`define FCT3_OR         3'd6
`define FCT3_AND        3'd7
//////// rv32m /////////
`define FCT3_MUL        3'd0
`define FCT3_MULH       3'd1
`define FCT3_MULHSU     3'd2
`define FCT3_MULHU      3'd3
`define FCT3_DIV        3'd4
`define FCT3_DIVU       3'd5
`define FCT3_REM        3'd6
`define FCT3_REMU       3'd7

/// rv64
//////// rv64i /////////
// rv64 arith-i
`define FCT3_ADDIW          3'd0
`define FCT3_SLLIW          3'd1
`define FCT3_SRLIW_SRAIW    3'd5
// rv64 arith-r
`define FCT3_ADDW       3'd0
`define FCT3_SUBW       3'd0
`define FCT3_SLLW       3'd1
`define FCT3_SRLW       3'd5
`define FCT3_SRAW       3'd5
//////// rv64m /////////
`define FCT3_MULW       3'd0
`define FCT3_DIVW       3'd4
`define FCT3_DIVUW      3'd5
`define FCT3_REMW       3'd6
`define FCT3_REMUW      3'd7
// load
`define FCT3_LB         3'd0
`define FCT3_LH         3'd1
`define FCT3_LW         3'd2
`define FCT3_LD         3'd3    // rv64i
`define FCT3_LBU        3'd4
`define FCT3_LHU        3'd5
`define FCT3_LWU        3'd6    // rv64i
// store
`define FCT3_SB         3'd0
`define FCT3_SH         3'd1
`define FCT3_SW         3'd2
`define FCT3_SD         3'd3    // rv64i
// branch
`define FCT3_JALR       3'd0
`define FCT3_BEQ        3'd0
`define FCT3_BNE        3'd1
`define FCT3_BLT        3'd4
`define FCT3_BGE        3'd5
`define FCT3_BLTU       3'd6
`define FCT3_BGEU       3'd7

// sys
`define FCT3_TRAP       3'd0
`define FCT3_CSRRW      3'd1    // atomic read/write
`define FCT3_CSRRS      3'd2    // atomic read/set
`define FCT3_CSRRC      3'd3    // atomic read/clear
`define FCT3_CSRRWI     3'd5
`define FCT3_CSRRSI     3'd6
`define FCT3_CSRRCI     3'd7

`define IMM_WFI             12'h105
//`define IMM_SFENCE_VMA
`define IMM_ECALL           12'h000
`define IMM_EBREAK          12'h001
`define IMM_URET            12'h002
`define IMM_SRET            12'h102
`define IMM_MRET            12'h302

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
`define MSTATUS_XS      16:15       //  the status of additional user-mode extensions and associated state
`define MSTATUS_FS      14:13       // the status of the floating-point unit state
`define MSTATUS_MPP     12:11
`define MSTATUS_VS      10:9        // the status of the vector extension state
// xPIE holds the value of the interrupt-enable bit active prior to the trap
// xPP holds the previous privilege mode
// When a trap is taken from privilege mode y into privilege mode x,
// xPIE is set to the value of x IE; x IE is set to 0; and xPP is set to y.
`define MSTATUS_SPP     8
`define MSTATUS_MPIE    7
`define MSTATUS_UBE     6
`define MSTATUS_SPIE    5
`define MSTATUS_MIE     3
`define MSTATUS_SIE     1
// mcause: [63] interrupt [62:0] code
// int = 1
`define SUPERVISOR_SOFTWARE_INT     {1'b1, 63'd1}
`define MACHINE_SOFTWARE_INT        {1'b1, 63'd3}
`define SUPERVISOR_TIMER_INT        {1'b1, 63'd5}
`define MACHINE_TIMER_INT           {1'b1, 63'd7}
`define SUPERVISOR_EXTERNAL_INT     {1'b1, 63'd9}
`define MACHINE_EXTERNAL_INT        {1'b1, 63'd11}
// int = 0
`define INST_ADDR_MISALIGNED     {1'b0, 63'd0}
`define INST_ACCESS_FAULT        {1'b0, 63'd1}
`define INST_ILLEGAL             {1'b0, 63'd2}
`define BREAKPOINT               {1'b0, 63'd3}
`define LOAD_ADDR_MISALIGNED     {1'b0, 63'd4}
`define LOAD_ACCESS_FAULT        {1'b0, 63'd5}
`define STORE_ADDR_MISALIGNED    {1'b0, 63'd6}
`define STORE_ACCESS_FAULT       {1'b0, 63'd7}
`define ECALL_FROM_U             {1'b0, 63'd8}
`define ECALL_FROM_S             {1'b0, 63'd9}
`define ECALL_FROM_M             {1'b0, 63'd11}
`define INST_PAGEFAULT           {1'b0, 63'd12}
`define LOAD_PAGEFAULT           {1'b0, 63'd13}
`define STORE_PAGEFAULT          {1'b0, 63'd15}

/*  rvc */
// ???

// macros
// sign-extend. N >= M 
`define SEXT(in, from, to) \
    {{(to-from){{in}[from-1]}}, {in}}

// zero-extend. N >= M 
`define ZEXT(in, from, to) \
    {{(to-from){1'b0}}, {in}}

`ifndef FUNCTION
`define FUNCTION

`endif
