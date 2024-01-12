#include"include/sdb.h"
#include"include/macro.h"
#include"include/testbench.h"

using namespace std;

extern Vtop * top;
extern TestBench<Vtop> tb;

extern void init_disasm(const char *triple);
extern void disassemble(char *str, int size, uint64_t pc, uint8_t *code, int nbyte);
extern void my_exit(int);

uint64_t nr_inst    = 0;
uint64_t nr_stall   = 0;
uint64_t nr_flush   = 0;

CPU_state state;

uint64_t *cpu_gpr = nullptr;
extern "C" void set_gpr_ptr(const svOpenArrayHandle r) {
	cpu_gpr = (uint64_t*)(((VerilatedDpiOpenVar*)r)->datap());
}

const char *regs[] = {    //names.. add $ prefix to make regex match easier
    "x0",  "ra", "sp",   "gp",  "tp",  "t0",  "t1",  "t2",
    "s0",  "s1", "a0",   "a1",  "a2",  "a3",  "a4",  "a5",
    "a6",  "a7", "s2",   "s3",  "s4",  "s5",  "s6",  "s7",
    "s8",  "s9", "s10",  "s11", "t3",  "t4",  "t5",  "t6", 
};

void dump_gpr() {
	for (int i = 0; i < 32; i++) {
		printf("%s =0x%lx\n", regs[i], cpu_gpr[i]);
	}
}

int cmd_s(string steps)  {
    size_t n = atoi(steps.c_str());
    n = n? n: 1;
    while(n-- && !Verilated::gotFinish()){
        tb.tick();
        nr_inst++;
    }
    return 0;
}

int cmd_c(string args) {
    cmd_s("-1");
    return 0;
}

int cmd_h(string cmd) {
    for(auto i :cmd_table){
        //cout.width(8);
        cout << i.first << " - " << i.second.description << " - " << i.second.Usage << endl;
    }
    return 0;
}
int cmd_q (string arg) {
    cout << Green("Goodbye😀\n") << endl;
    my_exit(114514);
    return 114514;
}

int cmd_i(string arg) {
    // todo
    dump_gpr();
    return 0;
}

int cmd_b(string arg) {
    uint64_t addr;
    sscanf(arg.c_str(), "%lx", &addr);
    while(1)
    {
        if(top -> pc_o == addr)
            break;
        cmd_s("1");
    }
    return 0;
}

void init_sdb() {
    init_disasm("riscv64-linux-gnu");
}