#include <unordered_map>
#include <functional>

typedef struct{
    uint64_t gpr[32];
    uint64_t pc;
    uint64_t csr[4];
}CPU_state;

using namespace std;

// functions
int cmd_h(std::string args);
int cmd_c(std::string args);
int cmd_q(std::string args);
int cmd_s(std::string args);
int cmd_i(std::string args);
int cmd_b(std::string args);
//int cmd_x(std::string args);
//int cmd_p(std::string args);
//int cmd_w(std::string args);
//int cmd_d(std::string args);
typedef struct {
    //const std::string name;       //not needed, use map iterator's pair.first
    const std::string description;
    std::function<int(string)> handler;
    const std::string Usage;
}cmd;

static std::unordered_map<char, cmd> cmd_table = {
    {'h',   cmd{"Display this information",               cmd_h,      "help [cmd]. default all"}},
    {'c',   cmd{"Continue program, after signal or breakpoint",  cmd_c,      "no argument"}},
    {'q',   cmd{"quit the program",                       cmd_q,      "no argument"}},
    {'s',   cmd{"step program",         cmd_s,      "s [num], default 1"}},
    {'i',   cmd{"List of all registers and their contents",                       cmd_i,      "no argument"}},
    {'b',   cmd{"breakpoint",                             cmd_b,      "b addr(todo)"}},
    //{'w',   cmd{"watchpoint, add or delete",              cmd_w,      "w a expr, w d no"}}
};
