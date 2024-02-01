#include"include/sdb.h"
#include"include/macro.h"
#include"include/testbench.h"

using namespace std;

extern Vtop * top;
extern TestBench<Vtop> tb;

extern void init_disasm(const char *triple);
extern void disassemble(char *str, int size, uint64_t pc, uint8_t *code, int nbyte);
extern void my_exit(int);

CPU_state state;
Statistics statistics;

extern "C" void set_gpr_ptr(const svOpenArrayHandle r) {
	state.cpu_gpr = (uint64_t*)(((VerilatedDpiOpenVar*)r)->datap());
}

extern "C" void set_mem_ptr(const svOpenArrayHandle r) {
	state.mem_ptr = (uint8_t*)(((VerilatedDpiOpenVar*)r)->datap());
}

const char *regs[] = {
    "x0",  "ra", "sp",   "gp",  "tp",  "t0",  "t1",  "t2",
    "s0",  "s1", "a0",   "a1",  "a2",  "a3",  "a4",  "a5",
    "a6",  "a7", "s2",   "s3",  "s4",  "s5",  "s6",  "s7",
    "s8",  "s9", "s10",  "s11", "t3",  "t4",  "t5",  "t6", 
};

bool in_pmem(uint64_t addr) {
    return (addr >= pmem_start && addr < pmem_start + (1 << 20));
}

void dump_gpr() {
	for (int i = 0; i < 32; i++) {
        printf("[%3s] = 0x%-16lx%c", regs[i], state.cpu_gpr[i], i & 0b1? '\n' : '\t');
	}
}

bool breakpoint_exists(uint64_t addr) {
    auto b = state.breakpoints;
    return std::find(b.begin(), b.end(), addr) != b.end();
}

int cmd_s(string steps)  {
    size_t n = atoi(steps.c_str());
    n = n? n: 1;
    while(n-- && !Verilated::gotFinish()){
        tb.tick();
        statistics.nr_inst++;
        if (statistics.nr_inst > 114514)
            // there must exist some bugs
            my_exit(114514);
    }
    return 0;
}

int cmd_c(string args) {
    while (!Verilated::gotFinish() && !breakpoint_exists(top->pc_o))
        cmd_s("1");
    if (!Verilated::gotFinish())
        cout << "reach breakpoint at " << top->pc_o << endl;
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

// hex addr
int cmd_b(string arg) {
    uint64_t addr = strtoll(arg.c_str(), NULL, 0);
    if (in_pmem(addr)) {
        state.breakpoints.push_back(addr);
        cout << "breakpoint set at: 0x" << addr << endl;
    }
    else 
        cout << "bad address" << endl;
    return 0;
}

// x nf addr
int cmd_x(string arg) {
    uint64_t n, addr;
    char f;
    sscanf(arg.c_str(), "%ld%c %li", &n, &f, &addr);
    if (!in_pmem(addr)) {
        cout << "bad address\n";
        return 0;
    }
    cout << "0x" << addr << ": ";
    int cnt = 0;

    switch (f) {
        case 'h':
            for (uint64_t i = 0; i < n; i++) {
                printf("%02x%c", state.mem_ptr[addr+i-pmem_start], ((i+1)%4) == 0? '\n': ' ');
                cnt ++;
                if(cnt == 4 && i != n-1) {
                    cnt = 0;
                    cout << "0x" << addr+i+1 << ": ";
                }
            }
            break;
        case 'd':
            for (uint64_t i = 0; i < n; i++) {
                printf("%02d%c", state.mem_ptr[addr+i-pmem_start], ((i+1)%4) == 0? '\n': ' ');
                cnt ++;
                if(cnt == 4 && i != n-1) {
                    cnt = 0;
                    cout << "0x" << addr+i+1 << ": ";
                }
            }
            break;
        case 'c':
            for (uint64_t i = 0; i < n; i++) {
                printf("%c%c", state.mem_ptr[addr+i-pmem_start], ((i+1)%4) == 0? '\n': ' ');
                cnt ++;
                if(cnt == 4 && i != n-1) {
                    cnt = 0;
                    cout << "0x" << addr+i+1 << ": ";
                }
            }
            break;
        default:
            printf("expect format: {d/h/c}\n");
            break;
    }
    cout << endl;
    return 0;
}

// d n addr
// compressed instruction will be expanded to its corresponding 32-bit instruction
int cmd_d(string arg) {
    uint64_t n, addr;
    if (sscanf(arg.c_str(), "%ld %li", &n, &addr)) {
        if (addr & 0b1) {
            cout << "addr should be multiple of 2" << endl;
        }
        else {
            char buf[32];
            uint64_t pc = addr;
            for (uint64_t i = 0; i < n; i++) {
                if (!in_pmem(pc)) {
                    cout << "pc out of bounds: " << pc;
                }
                uint8_t* instr_ptr = ((uint8_t *)(state.mem_ptr))+ (pc-pmem_start);
                if ((*instr_ptr & 0b11) == 0b11){
                    disassemble(buf, sizeof(buf), pc, instr_ptr , 4);
                    cout << "0x" << pc << ": " << buf << endl;
                    pc += 4;
                }
                else{
                    disassemble(buf, sizeof(buf), pc, instr_ptr , 2);
                    cout << "0x" << pc << ": " << buf << endl;
                    pc += 2;
                }
            }
        }
    }
    return 0;
}

void init_sdb() {
    init_disasm("riscv64-linux-gnu");
}