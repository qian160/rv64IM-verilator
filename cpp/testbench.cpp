#include"include/testbench.h"
#include"include/defs.h"
#include<signal.h>

TestBench<Vtop> tb;
Vtop *top = tb.getModule();
char *img_file;

typedef  struct{
	char name;
	string args;
}cmd_info;

static inline cmd_info* get_cmd() 
{		
	string s;
	getline(cin, s);
	s.erase(0, s.find_first_not_of(" "));	//remove the leading spaces

	if(s.length() == 0) return nullptr;

	cmd_info * info = new cmd_info{
		.name = s[0], 
		.args = s.substr(1, s.size()),
	};
	return info;
}

void my_exit(int sig) 
{
	double seconds = tb.time();
	char buf[128];
	uint64_t nr_cycles = statistics.nr_cycles;
	uint64_t nr_insts = top->nr_insts_o;
	double ipc = (double)nr_insts / (double)nr_cycles;
	sprintf(buf, "finished in %lf ms\n#cycles = %ld, #insts = %ld, ipc = %lf", seconds * 1000, nr_cycles, nr_insts, ipc);
	cout << buf << endl;
	cout << "simulation frequency = " << statistics.nr_cycles / seconds << " hz" << endl;
	exit(state.gpr_ptr[10]);	// x10 = a0
}

int main(int argc, char **argv) 
{
	Verilated::commandArgs(argc, argv);
	signal(SIGINT, my_exit);

	if (argc < 2) {
		cout << "need to provide an img_file!\n";
		exit(1);
	}

	img_file = argv[1];
	init_devide();
	init_sdb();
	tb.reset();
	tb.trace("./wave.vcd");

	if (argc > 2)
		cmd_c("-1");

	while(!Verilated::gotFinish()){
		cout << "(0x" << top -> pc_o << ")";
		cmd_info *cmd = get_cmd();
		if(!cmd) continue;
		cmd -> name |= 0x20;
		if(cmd_table.find(cmd -> name)!= cmd_table.end())
			cmd_table[cmd -> name].handler(cmd ->args);
		else
			cout << "unsupported command " << "'" << cmd -> name << "'" << endl;
	}
	my_exit(114514);
}