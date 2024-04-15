`include "define.v"
import "DPI-C" function void set_mem_ptr(input logic [63:0] a[]);
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
    input   [63:0]  mcause_i,
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
    output  [63:0]  mcause_o,

    // ifetch
    output  [31:0]  inst_o
);
    wire [63:0] start = aluout_i - `PMEM_START;
    reg  [63:0] load_data;
    wire [1:0] width = funct3_i[1:0];
    wire load_unsigned = funct3_i[2];
    reg [7:0] mem [0:((1<<20)-1)];  // size = 2^20 = 1MB

    reg [63:0] rvc_sdata;
    always @(*) begin
        rvc_sdata = 0;
        case (funct5_i)
            `FCT5_AMOADD:   rvc_sdata = load_data + sdata_i;
            `FCT5_AMOAND:   rvc_sdata = load_data & sdata_i;
            `FCT5_AMOOR:    rvc_sdata = load_data | sdata_i;
            `FCT5_AMOXOR:   rvc_sdata = load_data ^ sdata_i;
            default:        rvc_sdata = sdata_i;
        endcase
    end
    wire [63:0] sdata = (rva_valid_i)? rvc_sdata: sdata_i;

    /*  ifetch  */
    wire [63:0] pc_off;
    assign pc_off = if_pc_i - `PMEM_START;
    assign inst_o = {mem[pc_off+3], mem[pc_off+2], mem[pc_off+1], mem[pc_off]};
    /*  end ifetch  */

    // rva
    reg [63:0] lr_addr;
    wire lr_valid = rva_valid_i & (funct5_i == `FCT5_LR);
    wire sc_valid = rva_valid_i & (funct5_i == `FCT5_SC);
    wire sc_success = sc_valid & (lr_addr == aluout_i);

    initial begin
        $readmemh("/home/s081/Downloads/projects/cpu/img", mem);
        set_mem_ptr(mem);
    end

    always @(posedge clock) begin
        if (lr_valid)
            lr_addr <= aluout_i;
    end

    /*  load */
    always @(*) begin
        load_data = 64'd0;
        if (load_i) begin
            case (width)
                2'd0:   load_data = (load_unsigned)? `ZEXT(mem[start], 8, 64) : `SEXT(mem[start], 8, 64);
                2'd1:   load_data = (load_unsigned)? 
                        `ZEXT({mem[start+1], mem[start]}, 16, 64):
                        `SEXT({mem[start+1], mem[start]}, 16, 64);
                2'd2:   load_data = (load_unsigned)? 
                        `ZEXT({mem[start+3], mem[start+2], mem[start+1], mem[start]}, 32, 64): 
                        `SEXT({mem[start+3], mem[start+2], mem[start+1], mem[start]}, 32, 64);
                2'd3:   load_data = {mem[start+7], mem[start+6], mem[start+5], mem[start+4], mem[start+3], mem[start+2], mem[start+1], mem[start]};
            endcase
            //$display("(%x) [x%d] <= %x [%x]", pc_i, rd_i, load_data, aluout_i);
        end
    end

    always @(posedge clock) begin
        if (store_i)    begin
            if (!sc_valid | sc_success)   begin
                case (width)
                    2'd0:   mem[start] <= sdata[7:0];
                    2'd1:   {mem[start+1], mem[start]} <= sdata[15:0];
                    2'd2:   {mem[start+3], mem[start+2], mem[start+1], mem[start]} <= sdata[31:0];
                    2'd3:   {mem[start+7], mem[start+6], mem[start+5], mem[start+4], mem[start+3], mem[start+2], mem[start+1], mem[start]} <= sdata;
                endcase
            end
            //$display("(%x) %x => Mem[%x]", pc_i, sdata, aluout_i);
        end
    end

    assign wen_o = wen_i;
    assign rd_o = rd_i;
    assign wdata_o = (sc_valid)? ((sc_success)? 0: 64'h114514):
        (load_i)? load_data: aluout_i;

    assign exception_o = exception_i;
    assign mcause_o = mcause_i;
    assign pc_o = pc_i;

    assign csr_addr_o = csr_addr_i;
    assign csr_wen_o = csr_wen_i;
    assign csr_wdata_o = csr_wdata_i;

    assign exception_o = exception_i;
endmodule