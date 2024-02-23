`include "define.v"
module mult64(
    input [63:0] a,
    input [63:0] b,
    input is_signed,
    output [127:0] result
);
    wire [63:0] pos_a = (is_signed & a[63])? (~a + 1) : a;
    wire [63:0] pos_b = (is_signed & b[63])? (~b + 1) : b;
    /*  partial products    */
    wire [127:0] pp [0:63];
    wire [127:0] pp_1[0:31];
    wire [127:0] pp_2[0:15];
    wire [127:0] pp_3[0:7];
    wire [127:0] pp_4[0:3];
    // original pp
    genvar i;
    generate
        for (i = 0; i < 64; i = i + 1)  begin
            assign pp[i] = pos_b[i]? 
                    {64'b0, pos_a} << i:
                    128'b0;
        end
    endgenerate

    // stage 1. 64 -> 32
    generate
        for (i = 0; i < 16; i = i + 1)  begin
            compressor4_2 #(64) comp_inst(
                .a(pp[4*i]),
                .b(pp[4*i+1]),
                .c(pp[4*i+2]),
                .d(pp[4*i+3]),
                .e(pp_1[2*i]),
                .f(pp_1[2*i+1])
            );
        end
    endgenerate
    // stage 2. 32 -> 16
    generate
        for (i = 0; i < 8; i = i + 1)   begin
            compressor4_2 #(64) comp_inst(
                .a(pp_1[4*i]),
                .b(pp_1[4*i+1]),
                .c(pp_1[4*i+2]),
                .d(pp_1[4*i+3]),
                .e(pp_2[2*i]),
                .f(pp_2[2*i+1])
            );
        end
    endgenerate
    // stage 3. 16 -> 8
    generate
        for (i = 0; i < 4; i = i + 1)   begin
            compressor4_2 #(64) comp_inst(
                .a(pp_2[4*i]),
                .b(pp_2[4*i+1]),
                .c(pp_2[4*i+2]),
                .d(pp_2[4*i+3]),
                .e(pp_3[2*i]),
                .f(pp_3[2*i+1])
            );
        end
    endgenerate
    // stage 4. 8 -> 4
    generate
        for (i = 0; i < 2; i = i + 1)   begin
            compressor4_2 #(64) comp_inst(
                .a(pp_3[4*i]),
                .b(pp_3[4*i+1]),
                .c(pp_3[4*i+2]),
                .d(pp_3[4*i+3]),
                .e(pp_4[2*i]),
                .f(pp_4[2*i+1])
            );
        end
    endgenerate
    // stage 5. 4 -> 2
    compressor4_2 #(64) comp_final(
        .a(pp_4[0]),
        .b(pp_4[1]),
        .c(pp_4[2]),
        .d(pp_4[3])
    );

    wire [128:0] temp = comp_final.e + comp_final.f;
    assign result = ((is_signed) & (a[63] ^ b[63]))?
        (~temp + 1): temp;

endmodule

// carry-save adder: a + b + cin = t + carry
module csa #(WIDTH = 64)(
    input  [(2*WIDTH)-1:0] a,
    input  [(2*WIDTH)-1:0] b,
    input  [(2*WIDTH)-1:0] c,
    output [(2*WIDTH)-1:0] d,
    output [(2*WIDTH)-1:0] e
);
	assign d = a ^ b ^ c;
    assign e = ((a & b) | (a & c) | (b & c)) << 1;
endmodule

// a + b + c + d = e + f
module compressor4_2 #(WIDTH=64)(
    input  [(2*WIDTH)-1:0] a,
    input  [(2*WIDTH)-1:0] b,
    input  [(2*WIDTH)-1:0] c,
    input  [(2*WIDTH)-1:0] d,
    output [(2*WIDTH)-1:0] e,
    output [(2*WIDTH)-1:0] f
);
    csa #(WIDTH) csa0(
        .a(a),
        .b(b),
        .c(c)
    );

    csa #(WIDTH) csa1(
        .a(d),
        .b(csa0.d),
        .c(csa0.e)
    );

    assign e = csa1.d;
    assign f = csa1.e;
endmodule

module mult64_tb (
    input clock
);
    // mult tb
    reg  [63:0] a, b;
    reg  [127:0] c;

    reg signed [63:0] as = $signed(a), bs = $signed(b);
    reg signed [127:0] cs = $signed(c);

    wire signed [127:0] s = $signed(a) * $signed(b);
    wire [127:0] u = a * b;

    mult64 m(
        .a(a),
        .b(b),
        .is_signed(0),
        .result(c)
    );

    always @(posedge clock) begin
        a <= $random();
        b <= $random();
//        $display("%d x %d = %d", as, bs, cs);
//        if (c != s)   begin
        if (c != u)   begin
            $display("%d * %d: expected %d, but got %d", a, b, u, c);
        end
    end
endmodule
