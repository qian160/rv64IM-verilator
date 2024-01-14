// see https://msyksphinz-self.github.io/riscv-isadoc/html/ for details
// special instructions
`define EBREAK  32'h100073
// init values
`define PC_INIT 64'h80000000

//opcode
`define ARITH_R   7'b0110011
`define ARITH_I   7'b0010011
`define LOAD      7'b0000011
`define STORE     7'b0100011
`define BRANCH    7'b1100011
`define JAL       7'b1101111
`define JALR      7'b1100111
`define LUI       7'b0110111
`define AUIPC     7'b0010111
`define SYS       7'b1110011
// rv64 extension
`define ARITH_64_R  7'b0111011
`define ARITH_64_I  7'b0011011

// aluop.
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
//rv32m
`define ALU_MUL     5'd10
`define ALU_MULU    5'd11
`define ALU_MULH    5'd12
`define ALU_MULSU   5'd13
`define ALU_MUHSU   5'd14
`define ALU_DIV     5'd15
`define ALU_DIVU    5'd16
`define ALU_REM     5'd17
`define ALU_REMU    5'd18
//rv64i
`define ALU_ADDW    5'd19
`define ALU_SUBW    5'd20
`define ALU_SLLW    5'd21
`define ALU_SRLW    5'd22
`define ALU_SRAW    5'd23
//rv64m (no muluw)
`define ALU_MULW    5'd24
`define ALU_DIVW    5'd25
`define ALU_REMW    5'd26
`define ALU_DIVUW   5'd27
`define ALU_REMUW   5'd28

//load op


//store op


// funct3
// arith-i
`define FCT3_ADDI       3'd0
`define FCT3_SLLI       3'd1
`define FCT3_SLTI       3'd2
`define FCT3_SLTIU      3'd3
`define FCT3_XORI       3'd4
`define FCT3_SRLI_SRAI  3'd5   // funct7 differs
`define FCT3_ORI        3'd6
`define FCT3_ANDI       3'd7
// arith-r
`define FCT3_ADD_SUB    3'd0
`define FCT3_SLL        3'd1
`define FCT3_SLT        3'd2
`define FCT3_SLTU       3'd3
`define FCT3_XOR        3'd4
`define FCT3_SRL_SRA    3'd5
`define FCT3_OR         3'd6
`define FCT3_AND        3'd7

// funct7
// arith-i
`define FCT7_SRAI   7'h20
`define FCT7_SRLI   7'h00
// arith-r
`define FCT7_ADD    7'h00
`define FCT7_SUB    7'h20
`define FCT7_SRL    7'h00
`define FCT7_SRA    7'h20
// functions
// sign-extend. N >= M 
`define SEXT(in, from, to) \
    {{(to-from){in[from-1]}}, in}

// zero-extend. N >= M 
`define ZEXT(in, from, to) \
    {{(to-from){1'b0}, in}