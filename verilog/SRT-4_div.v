function [5:0] clz(input [63:0] x);
    integer i;
    begin
        for (i = 63; i >= 0; i = i - 1) begin
            if (x[i] == 1'b1)   begin
                return 64'd63 - i;
            end
        end
    end
endfunction
/*
    b   range of P   q  |   b   range of P    q
    8   -12     -7  -2  |   12  -18     -10  -2
    8    -6     -3  -1  |   12  -10      -4  -1
    8    -2      1   0  |   12   -4       3   0 
    8     2      5   1  |   12    3       9   1
    8     6     11   2  |   12    9      17   2

    9   -14     -8  -2  |   13  -19     -11  -2
    9    -7     -3  -1  |   13  -10      -4  -1
    9    -3      2   0  |   13   -4       3   0
    9     2      6   1  |   13    3       9   1
    9     7     13   2  |   13   10      18   2

    10  -15     -9  -2  |   14  -20     -11  -2
    10   -8     -3  -1  |   14  -11      -4  -1
    10   -3      2   0  |   14   -4       3   0
    10    2      7   1  |   14    3      10   1
    10    8     14   2  |   14   10      19   2

    11  -16     -9  -2  |   15  -22     -12  -2
    11   -9     -3  -1  |   15  -12      -4  -1
    11   -3      2   0  |   15   -5       4   0
    11    2      8   1  |   15    3      11   1
    11    8     15   2  |   15   11      21   2
*/
module qselect (
    // check 6 bits of P and 4 bits of B
    input           [3:0]   b,
    input   signed  [5:0]   p,
    output          [2:0]   q
);
    wire b_1000 = (b == 4'b1000);
    wire b_1001 = (b == 4'b1001);
    wire b_1010 = (b == 4'b1010);
    wire b_1011 = (b == 4'b1011);
    wire b_1100 = (b == 4'b1100);
    wire b_1101 = (b == 4'b1101);
    wire b_1110 = (b == 4'b1110);
    wire b_1111 = (b == 4'b1111);

    wire p_ge_neg22 = p >= -22;
    wire p_ge_neg20 = p >= -20;
    wire p_ge_neg19 = p >= -19;
    wire p_ge_neg18 = p >= -18;
    wire p_ge_neg16 = p >= -16;
    wire p_ge_neg15 = p >= -15;
    wire p_ge_neg14 = p >= -14;
    wire p_ge_neg12 = p >= -12;
    wire p_ge_neg11 = p >= -11;
    wire p_ge_neg10 = p >= -10;

    wire p_ge_neg9 = p >= -9;
    wire p_ge_neg8 = p >= -8;
    wire p_ge_neg7 = p >= -7;
    wire p_ge_neg6 = p >= -6;
    wire p_ge_neg5 = p >= -5;
    wire p_ge_neg4 = p >= -4;
    wire p_ge_neg3 = p >= -3;
    wire p_ge_neg2 = p >= -2;

    wire p_ge_1 = p >= 1;
    wire p_ge_2 = p >= 2;
    wire p_ge_3 = p >= 3;
    wire p_ge_4 = p >= 4;
    wire p_ge_5 = p >= 5;
    wire p_ge_6 = p >= 6;
    wire p_ge_7 = p >= 7;
    wire p_ge_8 = p >= 8;
    wire p_ge_9 = p >= 9;

    wire p_ge_10 = p >= 10;
    wire p_ge_11 = p >= 11;
    wire p_ge_12 = p >= 12;
    wire p_ge_13 = p >= 13;
    wire p_ge_14 = p >= 14;
    wire p_ge_15 = p >= 15;
    wire p_ge_16 = p >= 16;
    wire p_ge_17 = p >= 17;
    wire p_ge_18 = p >= 18;
    wire p_ge_19 = p >= 19;
    wire p_ge_20 = p >= 20;
    wire p_ge_21 = p >= 21;
    wire p_ge_22 = p >= 22;
    // right bound needs to +1 (to fit in the `~` `>=` combination)
    // 8
    wire p_1000_q_neg2 = (b_1000 & p_ge_neg12 & ~p_ge_neg6);
    wire p_1000_q_neg1 = (b_1000 & p_ge_neg6 & ~p_ge_neg2);
    wire p_1000_q_0 = (b_1000 & p_ge_neg2 & ~p_ge_2);
    wire p_1000_q_1 = (b_1000 & p_ge_2 & ~p_ge_6);
    wire p_1000_q_2 = (b_1000 & p_ge_6 & ~p_ge_12);
    // 9
    wire p_1001_q_neg2 = (b_1001 & p_ge_neg14 & ~p_ge_neg7);
    wire p_1001_q_neg1 = (b_1001 & p_ge_neg7 & ~p_ge_neg2);
    wire p_1001_q_0 = (b_1001 & p_ge_neg3 & ~p_ge_3);
    wire p_1001_q_1 = (b_1001 & p_ge_2 & ~p_ge_7);
    wire p_1001_q_2 = (b_1001 & p_ge_7 & ~p_ge_14);
    // 10
    wire p_1010_q_neg2 = (b_1010 & p_ge_neg15 & ~p_ge_neg8);
    wire p_1010_q_neg1 = (b_1010 & p_ge_neg8 & ~p_ge_neg2);
    wire p_1010_q_0 = (b_1010 & p_ge_neg3 & ~p_ge_3);
    wire p_1010_q_1 = (b_1010 & p_ge_2 & ~p_ge_8);
    wire p_1010_q_2 = (b_1010 & p_ge_8 & ~p_ge_15);
    // 11
    wire p_1011_q_neg2 = (b_1011 & p_ge_neg16 & ~p_ge_neg8);
    wire p_1011_q_neg1 = (b_1011 & p_ge_neg9 & ~p_ge_neg2);
    wire p_1011_q_0 = (b_1011 & p_ge_neg3 & ~p_ge_3);
    wire p_1011_q_1 = (b_1011 & p_ge_2 & ~p_ge_9);
    wire p_1011_q_2 = (b_1011 & p_ge_8 & ~p_ge_16);
    // 12
    wire p_1100_q_neg2 = (b_1100 & p_ge_neg18 & ~p_ge_neg9);
    wire p_1100_q_neg1 = (b_1100 & p_ge_neg10 & ~p_ge_neg3);
    wire p_1100_q_0 = (b_1100 & p_ge_neg4 & ~p_ge_4);
    wire p_1100_q_1 = (b_1100 & p_ge_3 & ~p_ge_10);
    wire p_1100_q_2 = (b_1100 & p_ge_9 & ~p_ge_18);
    // 13
    wire p_1101_q_neg2 = (b_1101 & p_ge_neg19 & ~p_ge_neg10);
    wire p_1101_q_neg1 = (b_1101 & p_ge_neg10 & ~p_ge_neg3);
    wire p_1101_q_0 = (b_1101 & p_ge_neg4 & ~p_ge_4);
    wire p_1101_q_1 = (b_1101 & p_ge_3 & ~p_ge_10);
    wire p_1101_q_2 = (b_1101 & p_ge_10 & ~p_ge_19);
    // 14
    wire p_1110_q_neg2 = (b_1110 & p_ge_neg20 & ~p_ge_neg10);
    wire p_1110_q_neg1 = (b_1110 & p_ge_neg11 & ~p_ge_neg3);
    wire p_1110_q_0 = (b_1110 & p_ge_neg4 & ~p_ge_4);
    wire p_1110_q_1 = (b_1110 & p_ge_3 & ~p_ge_11);
    wire p_1110_q_2 = (b_1110 & p_ge_10 & ~p_ge_20);
    // 15
    wire p_1111_q_neg2 = (b_1111 & p_ge_neg22 & ~p_ge_neg11);
    wire p_1111_q_neg1 = (b_1111 & p_ge_neg12 & ~p_ge_neg3);
    wire p_1111_q_0 = (b_1111 & p_ge_neg5 & ~p_ge_5);
    wire p_1111_q_1 = (b_1111 & p_ge_3 & ~p_ge_12);
    wire p_1111_q_2 = (b_1111 & p_ge_11 & ~p_ge_22);

    wire q_neg2 = p_1000_q_neg2 | p_1001_q_neg2 | p_1010_q_neg2 | p_1011_q_neg2 | 
                p_1100_q_neg2 | p_1101_q_neg2 | p_1110_q_neg2 | p_1111_q_neg2;

    wire q_neg1 = p_1000_q_neg1 | p_1001_q_neg1 | p_1010_q_neg1 | p_1011_q_neg1 | 
                p_1100_q_neg1 | p_1101_q_neg1 | p_1110_q_neg1 | p_1111_q_neg1;

    wire q_0 = p_1000_q_0 | p_1001_q_0 | p_1010_q_0 | p_1011_q_0 | 
                p_1100_q_0 | p_1101_q_0 | p_1110_q_0 | p_1111_q_0;

    wire q_1 = p_1000_q_1 | p_1001_q_1 | p_1010_q_1 | p_1011_q_1 | 
                p_1100_q_1 | p_1101_q_1 | p_1110_q_1 | p_1111_q_1;

    wire q_2 = p_1000_q_2 | p_1001_q_2 | p_1010_q_2 | p_1011_q_2 | 
                p_1100_q_2 | p_1101_q_2 | p_1110_q_2 | p_1111_q_2;

    assign q = q_neg2? -2:
        q_neg1? -1:
        q_0? 0:
        q_1? 1:
        2;

endmodule
// -5 %  3 = -2
//  5 % -3 =  2
// -5 % -3 = -2
// the sign of `r`(a % b) is the same as `a`
module SRT4_div(
    input   reg         clock,
    input   reg         start,
    input   reg         is_signed,
    input   reg [63:0]  a,
    input   reg [63:0]  b,
    output  reg         ready,
    output  reg         error,
    output  reg [63:0]  q,
    output  reg [63:0]  r
);
    // signed mult: use abs(a) and abs(b), then modify the result
    reg [128:0] PA = 0;
    reg [63:0] B = 0;
    wire [63:0] abs_a = (is_signed & a[63])? ~a + 1 : a,
        abs_b = (is_signed & b[63])? ~b + 1 : b;
    reg [63:0] q_pos_acc, q_neg_acc;
    reg [4:0] cnt = 31;  // 32 iterations
    reg [1:0] state = DivFree;
    reg [1:0] next_state = DivFree;
    localparam DivFree = 2'd0, DivByZero = 2'd1, DivOn = 2'd2, DivEnd = 2'd3;
    wire signed [2:0] qi;
    qselect qs(
        .b(B[63:60]),
        .p(PA[128:123]),
        .q(qi)
    );
    // state transition logic
    always @(*)   begin
        next_state = DivFree;
        case (state)
            DivFree:    begin
                if (start & (cnt == 31))  begin
                    next_state = (b == 0)? DivByZero : DivOn;
                end
                else    begin
                    next_state = DivFree;
                end
            end
            DivByZero:  begin
                next_state = DivFree;
            end
            DivOn:      begin
                next_state = (cnt == 0)? DivEnd: DivOn;
            end
            DivEnd:     begin
                next_state = DivFree;
            end
        endcase
    end
    always @(posedge clock) begin
        state <= next_state;
    end

    // divide
    wire [128:0] B_1 = {1'b0, B, 64'b0};
    wire [128:0] B_2 = {B, 65'b0};
    wire [128:0] B_neg1 = ~B_1 + 1;
    wire [128:0] B_neg2 = B_neg1 << 1;
    always @(posedge clock) begin
        ready <= 1'b0;
        error <= 1'b0;
        case (state)
            DivFree:    begin   // preparation
                q_pos_acc <= 0;
                q_neg_acc <= 0;
                if (next_state == DivOn)    begin
                    cnt <= 31;
                    B <= (abs_b << clz(abs_b));
                    PA <= ({65'd0, abs_a}) << clz(abs_b);
                end
            end
            DivByZero:  begin
                ready <= 1'b1;
                error <= 1'b1;
            end
            DivOn:      begin
                // PA <= (PA << 2) - ((qi * {65'b0, B}) << 64); // bug
                case (qi)
                    -2: PA <= (PA << 2) - B_neg2;
                    -1: PA <= (PA << 2) - B_neg1;
                    0:  PA <= (PA << 2);
                    1:  PA <= (PA << 2) - B_1;
                    2:  PA <= (PA << 2) - B_2;
                    default:;
                endcase
                // accumulate
                case (qi)
                    // acc += abs(qi) * exp(4, cnt)
                    // exp(4, cnt) = exp(2, 2cnt)
                    -2: q_neg_acc <= q_neg_acc + (64'd2 << ({cnt, 1'b0}));
                    -1: q_neg_acc <= q_neg_acc + (64'd1 << ({cnt, 1'b0}));
                    1:  q_pos_acc <= q_pos_acc + (64'd1 << ({cnt, 1'b0}));
                    2:  q_pos_acc <= q_pos_acc + (64'd2 << ({cnt, 1'b0}));
                    default:;
                endcase
//                $display("%d: %d, %d", cnt, qi, qs.p);
                cnt <= cnt - 1;
            end
            DivEnd:     begin
                ready <= 1;
                // adjust the result
                if (PA[128])  begin
                    PA <= (PA + {1'b0, B, 64'b0}) >> clz(abs_b);
                    q_neg_acc <= q_neg_acc + 1;
                end
                else    begin
                    PA <= PA >> clz(abs_b);
                end
            end
        endcase
    end
    // final adjustments on signs
    reg [63:0] q_pos_temp, q_neg_temp, r_temp;
    always @*   begin
        q_pos_temp = q_pos_acc;
        q_neg_temp = q_neg_acc;
        r_temp = PA[127:64];
        if (ready)  begin
            if (is_signed)  begin
                case ({a[63], b[63]})
                    2'b00:;         // + vs +: no adjustments
                    2'b01:  begin   // + vs -: q -> -q, r -> r
                        q_neg_temp = q_pos_acc;
                        q_pos_temp = q_neg_acc;
                    end
                    2'b10:  begin   // - vs +: q -> -q, r -> -r
                        q_neg_temp = q_pos_acc;
                        q_pos_temp = q_neg_acc;
                        r_temp = ~r_temp + 1;
                    end
                    2'b11:  begin   // - vs -: q -> q, r -> -r
                        r_temp = ~r_temp + 1;
                    end
                endcase
            end
        end
    end

    assign q = q_pos_temp - q_neg_temp;
    assign r = r_temp;
endmodule

module srt_tb(input clock);
    reg [63:0] a = 2, b = 1, q, r;
    reg ready, start = 1;
    SRT4_div d(
        .a(a),
        .b(b),
        .q(q),
        .r(r),
        .clock(clock),
        .start(start),
        .is_signed(1'b0),
        .ready(ready)
    );

    always @(*) begin
        if (ready)
            $display("q = %d\nr = %d", q, r);
    end
endmodule