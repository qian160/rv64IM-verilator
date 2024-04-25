`include "define.v"

import "DPI-C" function longint mmio_read(input longint addr, input int len);
import "DPI-C" function void mmio_write(input longint addr, input int len, input longint wdata);

module mem(
    input   clock,
    input   reset,
    // ifetch, combinational read
    input   [63:0]  if_pc_i,
    // mem
    input           store_i,
    input           load_i,
    input   [63:0]  sdata_i,
    input   [2:0]   funct3_i,       // load/store's sign and width
    input   [63:0]  aluout_i,       // load/store address, or data to regfile
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
    // mmu
    //input   [63:0]  vm_i,
    //input   [63:0]  satp_i,

    // write regfile
    output          wen_o,
    output  [4:0]   rd_o,
    output  [63:0]  wdata_o,
    // write csr
    output          csr_wen_o,
    output  [11:0]  csr_addr_o,
    output  [63:0]  csr_wdata_o,
    // exception
    output  [63:0]  pc_o,
    output          exception_o,
    output  [63:0]  cause_o,

    // ifetch
    output  [31:0]  inst_o
);
    // ifetch
    assign inst_o = mmio_read(if_pc_i, 4);

    // rva
    reg [63:0] lr_addr;
    wire lr_valid = rva_valid_i & (funct5_i == `FCT5_LR);
    wire sc_valid = rva_valid_i & (funct5_i == `FCT5_SC);
    wire sc_success = sc_valid & (lr_addr == aluout_i);

    // rva: lr-sc
    always @(posedge clock) begin
        if (lr_valid)
            lr_addr <= aluout_i;
        else
            lr_addr <= lr_addr;
    end

    // load
    reg  [63:0] load_data;
    reg [63:0] loadVal_temp;
    wire [3:0] width = 4'b1 << funct3_i[1:0];
    wire load_unsigned = funct3_i[2];
    always @(*) begin
        loadVal_temp = 0;
        load_data = 0;
        if(load_i)  begin
            loadVal_temp = mmio_read(aluout_i, width);
            case (width)
                4'd1:   load_data = (load_unsigned)? `ZEXT(loadVal_temp[7:0],  8,  64) : `SEXT(loadVal_temp[7:0] , 8,  64);
                4'd2:   load_data = (load_unsigned)? `ZEXT(loadVal_temp[15:0], 16, 64) : `SEXT(loadVal_temp[15:0], 16, 64);
                4'd4:   load_data = (load_unsigned)? `ZEXT(loadVal_temp[31:0], 32, 64) : `SEXT(loadVal_temp[31:0], 32, 64);
                4'd8:   load_data = loadVal_temp;
            endcase
        end
    end

    // store
    reg [63:0] rva_sdata;
    always @(*) begin
        rva_sdata = 0;
        case (funct5_i)
            `FCT5_AMOADD:   rva_sdata = load_data + sdata_i;
            `FCT5_AMOAND:   rva_sdata = load_data & sdata_i;
            `FCT5_AMOOR:    rva_sdata = load_data | sdata_i;
            `FCT5_AMOXOR:   rva_sdata = load_data ^ sdata_i;
            default:        rva_sdata = sdata_i;
        endcase
    end

    wire [63:0] sdata = (rva_valid_i)? rva_sdata: sdata_i;
    always @(posedge clock) begin
        if (store_i)    begin
            if (!sc_valid | sc_success) begin
                mmio_write(aluout_i, width, sdata);
            end
        end
    end

    assign wen_o = wen_i;
    assign rd_o = rd_i;
    assign wdata_o = (sc_valid)? ((sc_success)? 0: 64'h114514):
        (load_i)? load_data: aluout_i;

    assign exception_o = exception_i;
    assign cause_o = cause_i;
    assign pc_o = pc_i;

    assign csr_addr_o = csr_addr_i;
    assign csr_wen_o = csr_wen_i;
    assign csr_wdata_o = csr_wdata_i;

    assign exception_o = exception_i;
endmodule