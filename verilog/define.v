// see https://msyksphinz-self.github.io/riscv-isadoc/html/ and 
// https://riscv.org/wp-content/uploads/2017/05/riscv-spec-v2.2.pdf
// for details
`include "csr_define.v"

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
`define OPCODE_FENCE     7'b0001111
`define OPCODE_AMO       7'b0101111     // atomic memory operation
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

// rva  inst[14:12]: 011 -> d, 010 -> w
// all these rva insts will access memory, which can cause load-use hazard in id
`define FCT5_LR         5'b00010
`define FCT5_SC         5'b00011
`define FCT5_AMOSWAP    5'b00001
`define FCT5_AMOADD     5'b00000
`define FCT5_AMOXOR     5'b00100
`define FCT5_AMOAND     5'b01100
`define FCT5_AMOOR      5'b01000
`define FCT5_AMOMIN     5'b10000
`define FCT5_AMOMAX     5'b10100
`define FCT5_AMOMINU    5'b11000
`define FCT5_AMOMAXU    5'b11100


`define IMM_WFI             12'h105
//`define IMM_SFENCE_VMA
`define IMM_ECALL           12'h000
`define IMM_EBREAK          12'h001
`define IMM_URET            12'h002
`define IMM_SRET            12'h102
`define IMM_MRET            12'h302

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
function [63:0] MAX;
    input [63:0] a;
    input [63:0] b;

    begin
        if ($signed(a) > $signed(b))
            MAX = a;
        else
            MAX = b;
    end

endfunction

function [63:0] MAXU;
    input [63:0] a;
    input [63:0] b;

    begin
        if (a > b)
            MAXU = a;
        else
            MAXU = b;
    end

endfunction

function [63:0] MIN;
    input [63:0] a;
    input [63:0] b;

    begin
        if ($signed(a) < $signed(b))
            MIN = a;
        else
            MIN = b;
    end

endfunction

function [63:0] MINU;
    input [63:0] a;
    input [63:0] b;

    begin
        if (a < b)
            MINU = a;
        else
            MINU = b;
    end

endfunction

`endif
