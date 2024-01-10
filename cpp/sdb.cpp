#include"include/sdb.h"
#include"include/macro.h"
#include"include/testbench.h"
#include <iterator>
extern Vtop * top;
enum { DIFFTEST_TO_DUT, DIFFTEST_TO_REF };

//void get_state(CPU_state & state){
//    memcpy((void*)&state, &top->io_regs_0, 32 * sizeof(uint64_t));
//}

//extern bool (*difftest_checkregs)();
//extern void (*difftest_regcpy)(void *dut, bool direction);
//extern void (*difftest_exec)();
//extern void (*difftest_init)(const char *img_file);
CPU_state state;
extern void my_exit(int);

const char *regs[] = {    //names.. add $ prefix to make regex match easier
    "x0",  "ra", "sp",   "gp",  "tp",  "t0",  "t1",  "t2",
    "s0",  "s1", "a0",   "a1",  "a2",  "a3",  "a4",  "a5",
    "a6",  "a7", "s2",   "s3",  "s4",  "s5",  "s6",  "s7",
    "s8",  "s9", "s10",  "s11", "t3",  "t4",  "t5",  "t6", 
};

using namespace std;
//link this file to test.cpp. so in test.cpp's main loop we can call those functions
extern TestBench<Vtop> tb;
/*
bool difftest()
{
    //get dut's information about registers
    memcpy((void *)&state, (void *)&top -> io_regs_0, 32 * sizeof(uint64_t));
    state.pc = top->io_pc_o;
    difftest_regcpy(&state, DIFFTEST_TO_REF);
    return difftest_checkregs();
}
*/

uint64_t nr_inst    = 0;
uint64_t nr_stall   = 0;
uint64_t nr_flush   = 0;
int cmd_s(string steps)  {
    size_t n = atoi(steps.c_str());
    n = n? n: 1;
    while(n-- && !Verilated::gotFinish()){
        IFDEF(DIFFTEST_ENABLE, difftest_exec());                    //let ref execuate first, to get the new timer

        tb.tick();
        IFDEF(DIFFTEST_ENABLE, assert(difftest()));
        nr_inst++;
//        if(top->io_stall_o)
//            nr_stall ++;
//        if(top -> io_flush_o)
//            nr_flush ++;
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
    ostream_iterator<string> out(cout);
    cout << Green("Goodbye😀\n") << endl;
    my_exit(114514);
    return 114514;
}

int cmd_i(string arg) {
//    memcpy((void *)&state, (void *)&top -> io_regs_0, 32 * sizeof(uint64_t));
//    for(int i = 0; i < 32; i++){
//        printf("\033[1;33m[%3s] = %-16lx%c\033[0m", regs[i], state.gpr[i], i & 0b1? '\n' : '\t');
//    }
//    cout << endl << endl;;
//    cout << _pink_ << "mepc:      " << top->io_csrData_epc  <<  normal << endl;
//    cout << _pink_ << "mtvec:     " << top->io_csrData_tvec << normal << endl;
//    cout << _pink_ << "mcause:    " << top->io_csrData_cause << normal << endl;
//    cout << _pink_ << "mstatus:   " << top->io_csrData_status << normal << endl;
    cout << "TODO" << endl;
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