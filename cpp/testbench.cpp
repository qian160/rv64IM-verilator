#include"include/macro.h"
#include"include/sdb.h"
#include"include/testbench.h"

// verilator's naming convention: V + top module's name(generated into obj_dir/Vxxx.h)
//#include"VTOP__Dpi.h"

#include<signal.h>
#include<iomanip>

using namespace std;

vluint64_t TIME = 0;
string img_file("./tests/");

/*
template<typename... Args>
string concat(Args&&... args) {
	return (string(args)+ ...);
}
*/
TestBench<Vtop> tb;
Vtop *top = tb.getModule();
extern void init_difftest();

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

extern int init_device();
extern uint64_t nr_inst;
extern uint64_t nr_stall;
extern uint64_t nr_flush;

using ld = long double;
uint64_t start_time;
void my_exit(int sig) 
{
	//SDL_Exit();
	double seconds = tb.time();
	char buf[128];
	sprintf(buf, "finished in %lf ms", seconds * 1000);

	cout << buf << endl;
	exit(0);
}

int main(int argc, char **argv) 
{
	cout << endl << endl;
	Verilated::commandArgs(argc, argv);
	signal(SIGINT, my_exit);
	if(argc < 2){
		cout << Yellow("no image is given, using the default one\n") << endl;
		img_file += "add.bin";
	}
	else
		img_file += argv[1];
	tb.reset();
	IFDEF(TRACE_EN, tb.trace("./wave.vcd"));		//consumes too much memory
	IFDEF(DIFFTEST_ENABLE, init_difftest());		//almost impossible to use now...
	tb.trace("./wave.vcd");
	//cmd_c("-1");
	cout << "welcome" << endl;
	while(!Verilated::gotFinish()){
		cout << "(0x" << top -> pc_o << ")" << top->inst_o;
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