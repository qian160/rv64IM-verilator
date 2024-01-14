#include"include/macro.h"
#include"include/sdb.h"
#include"include/testbench.h"
#include<signal.h>
#include<iomanip>

using namespace std;

vluint64_t TIME = 0;

TestBench<Vtop> tb;
Vtop *top = tb.getModule();

extern void init_difftest();
extern void init_sdb();

void disassemble(char *str, int size, uint64_t pc, uint8_t *code, int nbyte);

typedef  struct{
	char name;
	string args;
}cmd_info;

static inline unique_ptr<cmd_info> get_cmd() 
{		
	string s;
	getline(cin, s);
	s.erase(0, s.find_first_not_of(" "));	//remove the leading spaces

	if(s.length() == 0) return nullptr;
	unique_ptr<cmd_info> info (make_unique<cmd_info>(cmd_info{
		.name = s[0],
		.args = s.substr(1, s.size()),
	}));
	return info;
}

extern Statistics statistics;

using ld = long double;
void my_exit(int sig) 
{
	double seconds = tb.time();
	char buf[128];
	sprintf(buf, "finished in %lf ms, #insts = %ld", seconds * 1000, statistics.nr_inst);

	cout << buf << endl;
	exit(0);
}

int main(int argc, char **argv) 
{
	cout << endl << endl;
	Verilated::commandArgs(argc, argv);
	signal(SIGINT, my_exit);
	string img_file("./tests/");

	if(argc < 2){
		cout << "need an argument" << endl;
		return 0;
	}

	img_file += argv[1];

	tb.reset();
	tb.trace("./wave.vcd");
	init_sdb();
	//cmd_c("-1");
	cout << "welcome" << endl;
	while(!Verilated::gotFinish()){
		cout << "(0x" << top -> pc_o << ")";
		unique_ptr<cmd_info> cmd = get_cmd();
		if(!cmd) continue;
		cmd -> name |= 0x20;
		if(cmd_table.find(cmd -> name)!= cmd_table.end())
			cmd_table[cmd -> name].handler(cmd ->args);
		else
			cout << "unsupported command " << "'" << cmd -> name << "'" << endl;
	}
	my_exit(114514);
}