`include "define.v"
/*  0     1      2       3       4
    IF  IF/ID  ID/EX   EX/MEM  MEM/WB  */
module control(
    // from combinational logic
    input   ex_div_i,           // stall
    input   id_branch_flush_i,  // flush
    input   id_load_use_i,      // stall & flush
    // to pipline registers
    output  reg [4:0]    stall_o,
    output  reg [4:0]    flush_o
);
    // combinational logic
    always @(*) begin
        if (ex_div_i)
            stall_o = 5'b00111;
        else if (id_load_use_i)
            stall_o = 5'b00011;
        else 
            stall_o = 5'b00000;
    end

    always @(*) begin
        if (id_branch_flush_i)
            flush_o = 5'b00010;     // IF/ID  
        else if (id_load_use_i)
            flush_o = 5'b00100;     // ID/EX
        else 
            flush_o = 5'b00000;
    end
    /*
    id_flush_req_i has higher priority than id_load_use_i
        bge xxx
        ld  xxx
    if the branch is taken, ld's load/use hazard will not be considered
    */

endmodule