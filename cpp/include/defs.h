/*  put some functions here     */
#include <unordered_map>
#include <functional>
// testbench
extern TestBench<Vtop> tb;
extern char *img_file;
extern uint64_t getPC();
extern void my_exit(int sig);

// sdb
typedef struct{
    uint64_t *gpr_ptr;
    uint8_t  *mem_ptr;
    uint64_t *csr_ptr;
    vector<uint64_t> breakpoints;
}CPU_state;

typedef struct {
    uint64_t nr_cycles;
    uint64_t nr_stall;
    uint64_t nr_flush;
}Statistics;

typedef struct {
    const std::string description;
    std::function<int(string)> handler;
    const std::string Usage;
}cmd;

extern CPU_state state;
extern Statistics statistics;
extern std::unordered_map<char, cmd> cmd_table;

extern int cmd_c(string args);
void init_sdb();

// disasm
void init_disasm(const char *triple);
void disassemble(char *str, int size, uint64_t pc, uint8_t *code, int nbyte);

// device
extern uint8_t * dram_ptr;
void init_devide();
bool in_pmem(uint64_t addr);