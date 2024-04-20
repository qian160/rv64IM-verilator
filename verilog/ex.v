`include "define.v"
module ex(
    input clock,
    input reset,
    // alu input
    input   [63:0]  srcA_i,
    input   [63:0]  srcB_i,
    input   [4:0]   aluop_i,
    // mem
    input           load_i,
    input           store_i,
    input   [2:0]   funct3_i,
    input   [63:0]  sdata_i,
    // write regfile
    input           wen_i,
    input   [4:0]   rd_i,
    // write csr
    input           csr_wen_i,
    input   [11:0]  csr_addr_i,
    input   [63:0]  csr_wdata_i,
    // rva
    input           rva_valid_i,
    input   [4:0]   funct5_i,
    // exception
    input           exception_i,
    input   [63:0]  cause_i,
    input   [63:0]  pc_i,

    output          csr_wen_o,
    output  [11:0]  csr_addr_o,
    output  [63:0]  csr_wdata_o,
    output          load_o,
    output          store_o,
    output  [2:0]   funct3_o,
    output  [63:0]  sdata_o,
    output          wen_o,
    output  [4:0]   rd_o,
    output reg [63:0]  aluout_o,
    // control
    output          div_not_ready_o,
    // rva
    output          rva_valid_o,
    output  [4:0]   funct5_o,
    // exception
    output          exception_o,
    output  [63:0]  cause_o,
    output  [63:0]  pc_o
);
    /* verilator lint_off SELRANGE */
    // mult
    wire mul_is_signed = (aluop_i == `ALU_MUL) | (aluop_i == `ALU_MULH);
    wire [127:0] mul_res;
    mult64 m(
        .a(srcA_i),
        .b(srcB_i),
        .is_signed(mul_is_signed),
        .result(mul_res)
    );

    // div
    wire signed_div =   (aluop_i == `ALU_DIV) | (aluop_i == `ALU_DIVW) |
                        (aluop_i == `ALU_REM) | (aluop_i == `ALU_REMW);
    wire unsigned_div = (aluop_i == `ALU_DIVU) | (aluop_i == `ALU_DIVUW) |
                        (aluop_i == `ALU_REMU) | (aluop_i == `ALU_REMUW);
    wire divOn = signed_div | unsigned_div;
    wire start = divOn & ~ready;
    wire [63:0] q, r;
    wire ready, error;
    assign div_not_ready_o = divOn & ~ready;
    SRT4_div div(
        .clock(clock),
        .start(start),
        .is_signed(signed_div),
        .a(srcA_i),
        .b(srcB_i),
        .ready(ready),
        .error(error),
        .q(q),
        .r(r)
    );

    // use single cycle division to debug
    // assign div_not_ready_o = 1'b0;
    // a / 0 = -1(non-standard)
    // a % 0 = a

    always @(*) begin
        if (aluop_i == `ALU_SRA)
            $display("[%x]: %x >>> %x = %x", pc_i, srcA_i, srcB_i[5:0], aluout_o);
    end
/*
    // bug: 0xffffffff80000000 >>> 1 = 0x7fffffffc0000000 ???
    assign aluout_o = (aluop_i == `ALU_ADD)?    srcA_i + srcB_i :
                    (aluop_i == `ALU_SUB)?      srcA_i - srcB_i :
                    (aluop_i == `ALU_XOR)?      srcA_i ^ srcB_i :
                    (aluop_i == `ALU_OR)?       srcA_i | srcB_i :
                    (aluop_i == `ALU_AND)?      srcA_i & srcB_i :
                    (aluop_i == `ALU_SLL)?      srcA_i << srcB_i[5:0] :
                    (aluop_i == `ALU_SRL)?      srcA_i >> srcB_i[5:0] :
                    (aluop_i == `ALU_SRA)?      $signed(srcA_i) >>> srcB_i[5:0] :
                    (aluop_i == `ALU_SLT)?      (($signed(srcA_i) < $signed(srcB_i))? 64'b1: 64'b0) :
                    (aluop_i == `ALU_SLTU)?     ((srcA_i < srcB_i)? 64'b1: 64'b0) :
                    (aluop_i == `ALU_MUL)?      mul_res[63:0] :
                    (aluop_i == `ALU_MULH)?     mul_res[127:64] :
                    (aluop_i == `ALU_MULHU)?    mul_res[127:64] :
                    (aluop_i == `ALU_MULHSU)?   {$signed(srcA_i) * srcB_i}[127:64] :
                    (aluop_i == `ALU_ADDW)?     `SEXT({srcA_i[31:0] +  srcB_i[31:0]}, 32, 64) :
                    (aluop_i == `ALU_SUBW)?     `SEXT({srcA_i[31:0] -  srcB_i[31:0]}, 32, 64) :
                    (aluop_i == `ALU_SLLW)?     `SEXT({srcA_i[31:0] << srcB_i[4:0]}, 32, 64) :
                    (aluop_i == `ALU_SRLW)?     `SEXT({srcA_i[31:0] >> srcB_i[4:0]}, 32, 64) :
                    (aluop_i == `ALU_SRAW)?     `SEXT({$signed(srcA_i[31:0]) >>> $signed(srcB_i[4:0])}, 32, 64) :
                    (aluop_i == `ALU_MULW)?     `SEXT(mul_res[31:0], 32, 64) :

//                    (aluop_i == `ALU_DIV)?      $signed(srcA_i) / $signed(srcB_i) :
//                    (aluop_i == `ALU_DIVU)?     srcA_i / srcB_i :
//                    (aluop_i == `ALU_REM)?      $signed(srcA_i) % $signed(srcB_i) :
//                    (aluop_i == `ALU_REMU)?     srcA_i % srcB_i :
//                    (aluop_i == `ALU_DIVW)?     `SEXT({$signed(srcA_i) / $signed(srcB_i)}[31:0], 32, 64) :
//                    (aluop_i == `ALU_DIVUW)?    `SEXT({srcA_i / srcB_i}[31:0], 32, 64) :
//                    (aluop_i == `ALU_REMW)?     `SEXT({$signed(srcA_i) % $signed(srcB_i)}[31:0], 32, 64) :
//                    (aluop_i == `ALU_REMUW)?    `SEXT({srcA_i % srcB_i}[31:0], 32, 64) :
                    (aluop_i == `ALU_DIV | aluop_i == `ALU_DIVU)?      ((srcB_i == 0) ? 64'hffffffffffffffff: q) :
                    (aluop_i == `ALU_REM | aluop_i == `ALU_REMU)?      ((srcB_i == 0) ? srcA_i: r) :
                    (aluop_i == `ALU_DIVW | aluop_i == `ALU_DIVUW)?    `SEXT(q[31:0], 32, 64) :
                    (aluop_i == `ALU_REMW | aluop_i == `ALU_REMUW)?    `SEXT(r[31:0], 32, 64) :
                srcA_i + srcB_i;
*/

    always @(*)   begin
        case (aluop_i)
            `ALU_ADD:   aluout_o = srcA_i + srcB_i;
            `ALU_SUB:   aluout_o = srcA_i - srcB_i;
            `ALU_XOR:   aluout_o = srcA_i ^ srcB_i;
            `ALU_OR:    aluout_o = srcA_i | srcB_i;
            `ALU_AND:   aluout_o = srcA_i & srcB_i;
            `ALU_SLL:   aluout_o = srcA_i << srcB_i[5:0];
            `ALU_SRL:   aluout_o = srcA_i >> srcB_i[5:0];
            `ALU_SRA:   aluout_o = $signed(srcA_i) >>> srcB_i[5:0];
            `ALU_SLT:   aluout_o = ($signed(srcA_i) < $signed(srcB_i))? 64'b1: 64'b0;
            `ALU_SLTU:  aluout_o = (srcA_i < srcB_i)? 64'b1: 64'b0;
            `ALU_MUL:   aluout_o = mul_res[63:0];
            `ALU_MULH:  aluout_o = mul_res[127:64];
            `ALU_MULHU: aluout_o = mul_res[127:64];
            `ALU_MULW:  aluout_o = `SEXT(mul_res[31:0], 32, 64);
            `ALU_ADDW:  aluout_o = `SEXT({srcA_i[31:0] +  srcB_i[31:0]}, 32, 64);
            `ALU_SUBW:  aluout_o = `SEXT({srcA_i[31:0] -  srcB_i[31:0]}, 32, 64);
            `ALU_SLLW:  aluout_o = `SEXT({srcA_i[31:0] << srcB_i[4:0]}, 32, 64);
            `ALU_SRLW:  aluout_o = `SEXT({srcA_i[31:0] >> srcB_i[4:0]}, 32, 64);
            `ALU_SRAW:  aluout_o = `SEXT({$signed(srcA_i[31:0]) >>> srcB_i[4:0]}, 32, 64);
            `ALU_MULHSU:aluout_o = {$signed(srcA_i) * srcB_i}[127:64];  // ???

            `ALU_DIVW, `ALU_DIVUW:  aluout_o = (srcB_i == 0)? 64'hffffffffffffffff :`SEXT(q[31:0], 32, 64);
            `ALU_REMW, `ALU_REMUW:  aluout_o = (srcB_i == 0)? srcA_i: `SEXT(r[31:0], 32, 64);
            `ALU_DIV, `ALU_DIVU:    aluout_o = (srcB_i == 0)? 64'hffffffffffffffff : q;
            `ALU_REM, `ALU_REMU:    aluout_o = (srcB_i == 0)? srcA_i : r;

//            `ALU_DIV:   aluout_o = $signed(srcA_i) / $signed(srcB_i);
//            `ALU_DIVU:  aluout_o = srcA_i / srcB_i;
//            `ALU_REM:   aluout_o = $signed(srcA_i) % $signed(srcB_i);
//            `ALU_REMU:  aluout_o = srcA_i % srcB_i;
//            `ALU_DIVW:  aluout_o = `SEXT({$signed(srcA_i) / $signed(srcB_i)}[31:0], 32, 64);
//            `ALU_REMW:  aluout_o = `SEXT({$signed(srcA_i) % $signed(srcB_i)}[31:0], 32, 64);
//            `ALU_DIVUW: aluout_o = `SEXT({srcA_i / srcB_i}[31:0], 32, 64);
//            `ALU_REMUW: aluout_o = `SEXT({srcA_i % srcB_i}[31:0], 32, 64);

//            `ALU_MUL:   aluout_o = {$signed(srcA_i) * $signed(srcB_i)}[63:0];
//            `ALU_MULW:  aluout_o = `SEXT({$signed(srcA_i) * $signed(srcB_i)}[31:0], 32, 64);
//            `ALU_MULH:  aluout_o = {$signed(srcA_i) * $signed(srcB_i)}[127:64];
//            `ALU_MULHU: aluout_o = {srcA_i * srcB_i}[127:64];
            default:    aluout_o = srcA_i + srcB_i;
        endcase
    end


    // write regfile
    assign wen_o = wen_i;
    assign rd_o = rd_i;
    // write csr
    assign csr_addr_o = csr_addr_i;
    assign csr_wen_o = csr_wen_i;
    assign csr_wdata_o = csr_wdata_i;
    // load/store
    assign load_o = load_i;
    assign store_o = store_i;
    assign funct3_o = funct3_i;
    assign sdata_o  = sdata_i;
    // rva
    assign rva_valid_o = rva_valid_i;
    assign funct5_o = funct5_i;
    // exception
    assign exception_o = exception_i;
    assign cause_o = cause_i;
    // debug
    assign pc_o = pc_i;
endmodule


// disable bypass at the 'read after load' hazard
// ex's bypass has higher priority than mem
/*for example: (from ID's view)
            cycles  #1      #2      #3      #4      #5      #6      #7
    ld x1, 0(x2):   IF      ID      EX      MEM     WB
    mv x2, x1:              IF      ID  ->  EX(*)   MEM     WB                  EX just produced the address, not operand
    (request to be stalled, and set 'read_after_load' = 1)
    mv x2, x1:                      IF      ID(mux) EX      MEM     WB          don't choose EX's bypass

    when decoding the 'mv' for the 1st time, we set the 'read_after_load' flag = 1
        and pass it to ID/EX.
    then when decoding the 'mv' for a 2nd time, EX is also dealing with that 'mv'.
        however, since a flag is set, EX will not send the false bypass to ID

    also, notice that the 1st 'mv' will be execuated twice:
        IF  ID  EX  MEM WB
    #1      mv  ld          (hazard detected)
    #2      mv  mv  ld
    #3          mv  mv  ld
    
    and the 1st execuation will cause some bad influences

    solution: flush ID/EX, so 
        IF  ID  EX  MEM WB
    #1      mv  ld          (hazard detected)
    #2      mv  [nop] ld    (bubble)
*/