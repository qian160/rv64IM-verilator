// todo: expand 16b rvc inst to 32b so that the decoder can be reused
`include "define.v"
module RVCExpander(
    input  reg  [63:0] pc_i,
    input  reg  [31:0] inst_i,
    output reg  [31:0] inst_o
);
    task error(input [63:0] pc);
        if (pc != 0)    begin
            $display("unsupported instruction at pc = %x", pc);
            $finish();
        end
    endtask

    // consts
    wire [4:0]  x0 = 5'd0;
    wire [4:0]  ra = 5'd1;
    wire [4:0]  sp = 5'd2;
    // 3-bit rs, +8 to get wider range. p = prime'
    wire [4:0] rs1p = {2'b01, inst_i[9:7]}; // rd'
    wire [4:0] rs2p = {2'b01, inst_i[4:2]}; // rd'
    wire [4:0] rs2 = inst_i[6:2];
    wire [4:0] rd  = inst_i[11:7];          // rs1
    wire [1:0] funct2_c = inst_i[11:10];
    wire [2:0] funct3_c = inst_i[15:13];
    wire [11:0] addi4spnImm = {2'b0, inst_i[10:7], inst_i[12:11], inst_i[5], inst_i[6], 2'b00};         // zext
    wire [11:0] addi16spImm = {{3{inst_i[12]}}, inst_i[4:3], inst_i[5], inst_i[2], inst_i[6], 4'b0};    // sext
    wire [11:0] lwImm = {5'b0, inst_i[5], inst_i[12:10], inst_i[6], 2'b0};  // also c.sw
    wire [11:0] ldImm = {4'b0, inst_i[6:5], inst_i[12:10], 3'b0};           // also c.sd

    wire [11:0] lwspImm = {4'b0, inst_i[3:2], inst_i[12], inst_i[6:4], 2'b0};
    wire [11:0] ldspImm = {3'b0, inst_i[4:2], inst_i[12], inst_i[6:5], 3'b0};
    wire [11:0] swspImm = {4'b0, inst_i[8:7], inst_i[12:9], 2'b0};
    wire [11:0] sdspImm = {3'b0, inst_i[9:7], inst_i[12:10], 3'b0};
    wire [11:0] addiImm = {{7{inst_i[12]}}, inst_i[6:2]};
    //wire [19:0] luiImm = {{3{inst_i[12]}}, inst_i[6:2], 12'b0};
    wire [19:0] luiImm = {{15{inst_i[12]}}, inst_i[6:2]};
    wire [20:0] jImm = {{10{inst_i[12]}}, inst_i[8], inst_i[10:9], inst_i[6], inst_i[7], inst_i[2], inst_i[11], inst_i[5:3], 1'b0};
    wire [12:0] bImm = {{5{inst_i[12]}}, inst_i[6:5], inst_i[2], inst_i[11:10], inst_i[4:3], 1'b0};
    wire [5:0] shamt = {inst_i[12], inst_i[6:2]};

    always @(*) begin
        case (inst_i[1:0])
            2'b00:  begin
                case (funct3_c)
                    3'b000: begin   // c.addi4spn
                        // x[8+rd'] = x[2] + nzuimm
                        // addi rd',x2,nzuimm
                        inst_o = {addi4spnImm, sp, `FCT3_ADDI, rs2p, `OPCODE_ARITH_I};
                    end

                    //3'b001:;        // c.fld
                    3'b010: begin   // c.lw
                        // x[8+rd'] = sext(M[x[8+rs1'] + uimm][31:0])
                        // lw rd',offset[6:2](rs1')
                        inst_o = {lwImm, rs1p, `FCT3_LW, rs2p, `OPCODE_LOAD};
                    end
                    3'b011: begin   // c.flw(rv32fc), c.ld
                        // x[8+rd'] = M[x[8+rs1'] + uimm][63:0]
                        // ld rd', offset[7:3](rs1')
                        inst_o = {ldImm, rs1p, `FCT3_LD, rs2p, `OPCODE_LOAD};
                    end

                    //3'b010:;        // c.fsd
                    3'b110: begin   // c.sw
                        // M[x[8+rs1'] + uimm][31:0] = x[8+rs2']
                        // sw rs2',offset[6:2](rs1')
                        inst_o = {lwImm[11:5], rs2p, rs1p, `FCT3_SW, lwImm[4:0], `OPCODE_STORE};
                    end

                    3'b111: begin   // c.fsw(rv32fc), c.sd
                        // M[x[8+rs1'] + uimm][63:0] = x[8+rs2']
                        // sd rs2', offset[7:3](rs1')
                        inst_o = {ldImm[11:5], rs2p, rs1p, `FCT3_SD, ldImm[4:0], `OPCODE_STORE};
                    end
                    default:    error(pc_i);
                endcase
            end
            // inst_i[1:0]
            2'b01:  begin
                case (funct3_c)
                    3'b000: begin   // c.nop, c.addi
                        // x[rd] = x[rd] + sext(imm)
                        // addi rd, rd, nzimm[5:0]
                        inst_o = {addiImm, rd, `FCT3_ADDI, rd, `OPCODE_ARITH_I};
                    end

                    3'b001: begin   // c.jal(rv32), c.addiw
                        // x[rd] = sext((x[rd] + sext(imm))[31:0])
                        // addiw rd,rd,imm[5:0]
                        inst_o = {addiImm, rd, `FCT3_ADDIW, rd, `OPCODE_RV64_ARITH_I};
                    end

                    3'b010: begin   // c.li
                        // x[rd] = sext(imm)
                        // addi rd,x0,imm[5:0]
                        inst_o = {addiImm, 5'b0, `FCT3_ADDI, rd, `OPCODE_ARITH_I};
                    end

                    3'b011:  begin
                        case (rd)
                            5'd2:   begin   // c.addi16sp
                                // x[2] = x[2] + sext(imm)
                                // addi x2,x2, nzimm[9:4]
                                inst_o = {addi16spImm, sp, `FCT3_ADDI, sp, `OPCODE_ARITH_I};
                            end
                            default: begin  // c.lui
                                // x[rd] = sext(imm[17:12] << 12)
                                // lui rd,nzuimm[17:12]
                                inst_o = {luiImm, rd, `OPCODE_LUI};
                            end
                        endcase
                    end

                    3'b100: begin
                        case (funct2_c)
                            2'b00:  begin   // c.srli
                                // x[8+rd'] = x[8+rd'] >>u uimm
                                // srli rd',rd',shamt[5:0]
                                inst_o = {6'h00, shamt, rs1p, `FCT3_SRLI_SRAI, rs1p, `OPCODE_ARITH_I};
                            end

                            2'b01:  begin   // c.srai
                                // x[8+rd'] = x[8+rd'] >>s uimm
                                // srai rd',rd',shamt[5:0]
                                inst_o = {6'h10, shamt, rs1p, `FCT3_SRLI_SRAI, rs1p, `OPCODE_ARITH_I};
                            end

                            2'b10:  begin   // c.andi
                                // x[8+rd'] = x[8+rd'] & sext(imm)
                                // andi rd',rd',imm[5:0]
                                inst_o = {addiImm, rs1p, `FCT3_ANDI, rs1p, `OPCODE_ARITH_I};
                            end

                            2'b11:  begin
                                case (inst_i[12])
                                    // rv32
                                    1'b0:   begin
                                        case (inst_i[6:5])
                                            2'b00:  begin   // c.sub
                                                // x[8+rd'] = x[8+rd'] - x[8+rs2']
                                                // sub rd',rd',rs2'
                                                inst_o = {7'h20, rs2p, rs1p, `FCT3_SUB, rs1p, `OPCODE_ARITH_R};
                                            end
                                            2'b01:  begin   // c.xor
                                                // x[8+rd'] = x[8+rd'] ^ x[8+rs2']
                                                // xor rd',rd',rs2'
                                                inst_o = {7'h0, rs2p, rs1p, `FCT3_XOR, rs1p, `OPCODE_ARITH_R};
                                            end
                                            2'b10:  begin   // c.or
                                                // x[8+rd'] = x[8+rd'] | x[8+rs2']
                                                // or rd',rd',rs2
                                                inst_o = {7'h0, rs2p, rs1p, `FCT3_OR, rs1p, `OPCODE_ARITH_R};
                                            end
                                            2'b11:  begin   // c.and
                                                // x[8+rd'] = x[8+rd'] & x[8+rs2']
                                                // and rd',rd',rs2'
                                                inst_o = {7'h0, rs2p, rs1p, `FCT3_AND, rs1p, `OPCODE_ARITH_R};
                                            end
                                        endcase
                                    end
                                    // rv64
                                    1'b1:   begin
                                        case (inst_i[6:5])
                                            2'b00:  begin   // c.subw
                                                // x[8+rd'] = sext((x[8+rd'] - x[8+rs2'])[31:0])
                                                // subw rd',rd',rs2'
                                                inst_o = {7'h20, rs2p, rs1p, `FCT3_SUBW, rs1p, `OPCODE_RV64_ARITH_R};
                                            end
                                            2'b01:  begin   // c.addw
                                                // x[8+rd'] = sext((x[8+rd'] + x[8+rs2'])[31:0])
                                                // addw rd',rd',rs2'
                                                inst_o = {7'h00, rs2p, rs1p, `FCT3_ADDW, rs1p, `OPCODE_RV64_ARITH_R};
                                            end
                                            default: error(pc_i);
                                        endcase
                                    end
                                endcase
                            end // funct2 = 2'b11
                        endcase // funct2
                    end // funct3 = 3'b100

                    3'b101: begin   // c.j
                        // pc += sext(offset)
                        // jal x0,offset[11:1]
                        inst_o = {jImm[20], jImm[10:1], jImm[11], jImm[19:12], x0, `OPCODE_JAL};
                    end

                    3'b110: begin   // c.beqz
                        // if (x[8+rs1'] == 0) pc += sext(offset)
                        // beq rs1',x0,offset[8:1]
                        inst_o = {bImm[12], bImm[10:5], x0, rs1p, `FCT3_BEQ, bImm[4:1], bImm[11], `OPCODE_BRANCH};
                    end

                    3'b111: begin   // c.bnez
                        // if (x[8+rs1'] != 0) pc += sext(offset)
                        // bne rs1',x0,offset[8:1]
                        inst_o = {bImm[12], bImm[10:5], x0, rs1p, `FCT3_BNE, bImm[4:1], bImm[11], `OPCODE_BRANCH};
                    end
                    default: error(pc_i);
                endcase
            end
            // inst_i[1:0]
            2'b10:  begin
                case (funct3_c)
                    3'b000: begin   // c.slli
                        // x[rd] = x[rd] << uimm
                        // slli rd,rd,shamt[5:0]
                        inst_o = {6'h00, shamt, rd, `FCT3_SLLI, rd, `OPCODE_ARITH_I};
                    end

                    //3'b001:;        // c.fldsp
                    3'b010: begin   // c.lw
                        // x[rd] = sext(M[x[2] + uimm][31:0])
                        // lw rd,offset[7:2](x2)
                        inst_o = {lwspImm, sp, `FCT3_LW, rd, `OPCODE_LOAD};
                    end

                    3'b011: begin   // c.flwsp(rv32fc), c.ldsp
                        // x[rd] = M[x[2] + uimm][63:0]
                        // ld rd,offset[8:3](x2)
                        inst_o = {ldspImm, sp, `FCT3_LD, rd, `OPCODE_LOAD};
                    end

                    3'b100: begin
                        case (inst_i[12])
                            1'b0:   begin
                                case (inst_i[6:2])
                                    5'b0:   begin       // c.jr
                                        // pc = x[rs1]
                                        // jalr x0,rs1,0 (I-type)
                                        inst_o = {12'h0, rd, `FCT3_JALR, x0, `OPCODE_JALR};
                                    end
                                    default:    begin   // c.mv
                                        // x[rd] = x[rs2]
                                        // add rd, x0, rs2
                                        inst_o = {7'h0, rs2, x0, `FCT3_ADD, rd, `OPCODE_ARITH_R};
                                    end
                                endcase
                            end
                            1'b1:   begin
                                case (inst_i[11:7])
                                    5'b0:   begin               // c.ebreak
                                        inst_o = `EBREAK;
                                    end
                                    default:    begin
                                        case (inst_i[6:2])
                                            5'b0:   begin       // c.jalr
                                                // pc = x[rs1]; x[1] = pc+2; 
                                                // jalr x1,rs1,0
                                                inst_o = {12'h0, rd, `FCT3_JALR, ra, `OPCODE_JALR};
                                            end
                                            default:    begin   // c.add
                                                // x[rd] = x[rd] + x[rs2]
                                                // add rd,rd,rs2
                                                inst_o = {7'h0, rs2, rd, `FCT3_ADD, rd, `OPCODE_ARITH_R};
                                            end
                                        endcase
                                    end
                                endcase
                            end
                        endcase
                    end

                    //3'b101:;        // c.fsdsp
                    3'b110: begin   // c.swsp
                        // M[x[2] + uimm][31:0] = x[rs2]
                        // sw rs2,offset[7:2](x2)
                        inst_o = {swspImm[11:5], rs2, sp, `FCT3_SW, swspImm[4:0], `OPCODE_STORE};
                    end

                    3'b111: begin   // c.fswsp(rv32fc), c.sdsp
                        // M[x[2] + uimm][31:0] = x[rs2]
                        // sw rs2,offset[7:2](x2)
                        inst_o = {sdspImm[11:5], rs2, sp, `FCT3_SD, sdspImm[4:0], `OPCODE_STORE};
                    end
                    default:    error(pc_i); 
                endcase
            end

            2'b11:  inst_o = inst_i;
        endcase
    end
endmodule