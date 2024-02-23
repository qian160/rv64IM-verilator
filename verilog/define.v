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
