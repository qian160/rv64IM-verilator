#include"include/testbench.h"
#include"include/defs.h"
#include"include/CSR.h"

CPU_state state;
Statistics statistics;
#define pmem_start  0x80000000l

extern "C" void set_gpr_ptr(const svOpenArrayHandle r) {
	state.gpr_ptr = (uint64_t*)(((VerilatedDpiOpenVar*)r)->datap());
}

extern "C" void set_csr_ptr(const svOpenArrayHandle r) {
	state.csr_ptr = (uint64_t*)(((VerilatedDpiOpenVar*)r)->datap());
}

const char *regs[] = {
    "x0",  "ra", "sp",   "gp",  "tp",  "t0",  "t1",  "t2",
    "s0",  "s1", "a0",   "a1",  "a2",  "a3",  "a4",  "a5",
    "a6",  "a7", "s2",   "s3",  "s4",  "s5",  "s6",  "s7",
    "s8",  "s9", "s10",  "s11", "t3",  "t4",  "t5",  "t6", 
};

void dump_gpr() {
	for (int i = 0; i < 32; i++) {
        printf("[%3s] = 0x%-16lx%c", regs[i], state.gpr_ptr[i], i & 0b1? '\n' : '\t');
	}
}

void dump_csr() {
    cout << "mstatus    0x" << state.csr_ptr[MSTATUS] << endl;
    cout << "mip        0x" << state.csr_ptr[MIP] << endl;
    cout << "mie        0x" << state.csr_ptr[MIE] << endl;
    cout << "mideleg    0x" << state.csr_ptr[MIDELEG] << endl;
    cout << "medeleg    0x" << state.csr_ptr[MEDELEG] << endl;
    cout << "mtvec      0x" << state.csr_ptr[MTVEC] << endl;
    cout << "stvec      0x" << state.csr_ptr[STVEC] << endl;
    cout << "mepc       0x" << state.csr_ptr[MEPC] << endl;
    cout << "sepc       0x" << state.csr_ptr[SEPC] << endl;
    cout << "mcause     0x" << state.csr_ptr[MCAUSE] << endl;
    cout << "scause     0x" << state.csr_ptr[SCAUSE] << endl;
    cout << "mtval      0x" << state.csr_ptr[MTVAL] << endl;
    cout << "stval      0x" << state.csr_ptr[STVAL] << endl;
    cout << "mscratch   0x" << state.csr_ptr[MSCRATCH] << endl;
    cout << "sscratch   0x" << state.csr_ptr[SSCRATCH] << endl;
    cout << "satp       0x" << state.csr_ptr[SATP] << endl;
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
        statistics.nr_cycles++;
    }
    return 0;
}

int cmd_c(string args) {
    //while (!Verilated::gotFinish() && !breakpoint_exists(getPC()))
    while (!Verilated::gotFinish()) // disable breakpoints to improve performance...
        cmd_s("1");
    if (!Verilated::gotFinish())
        cout << "reach breakpoint at " << getPC() << endl;
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
    cout << "Goodbye😀\n" << endl;
    my_exit(0);
    return 0;
}

int cmd_i(string arg) {
    dump_csr();
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

std::unordered_map<char, cmd> cmd_table = {
    {'h',   cmd{"Display this information",                     cmd_h,      "help [cmd]. default all"}},
    {'c',   cmd{"Continue program, after signal or breakpoint", cmd_c,      "no argument"}},
    {'q',   cmd{"quit the program",                             cmd_q,      "no argument"}},
    {'s',   cmd{"step program",                                 cmd_s,      "s [num], default 1"}},
    {'i',   cmd{"List of all registers and their contents",     cmd_i,      "no argument"}},
    {'b',   cmd{"breakpoint",                                   cmd_b,      "b addr"}},
    {'d',   cmd{"disasmble",                                    cmd_d,      "d n addr(hex)"}},
    {'x',   cmd{"examine memory",                               cmd_x,      "x nf addr(hex)"}},

    //{'w',   cmd{"watchpoint, add or delete",              cmd_w,      "w a expr, w d no"}}
};

void init_sdb() {
    init_disasm("riscv64-linux-gnu");
    state.mem_ptr = dram_ptr;
}