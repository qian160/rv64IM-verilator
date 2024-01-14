#include <verilated_vcd_c.h>
#include "verilated_dpi.h"
#include <string>
#include <vector>
#include <iostream>
#include <memory>
#include <verilated.h>
#include <verilatedos.h>
#include "Vtop.h"
#include "debug.h"
//#include "conf.h"

template<class Module> class TestBench {
private:
	VerilatedVcdC	*m_trace;
	Module			*dut;
	vluint64_t		m_tickcount;
	clock_t			boot_time;
public:
	TestBench() noexcept {
		// According to the Verilator spec, you *must* call traceEverOn
		// before calling any of the tracing functions within Verilator.
		Verilated::traceEverOn(true);
		dut = new Module;
		m_trace = nullptr;
		m_tickcount = 0l;
	};

	virtual ~TestBench() noexcept {
		delete dut;
		dut = NULL;
	};

	virtual void reset(void) noexcept {
		dut -> reset = 1;
		dut -> clock = 0;
		dut -> eval();
		// Make sure any inheritance gets applied
		dut -> clock = 1;
		dut -> eval();
		dut -> reset = 0;

		cout << endl << "pc: reset at 0x" << hex << dut -> pc_o << endl << endl;
		boot_time = clock();		//init value
	};

	/// Open/create a trace file
	virtual	void trace(const char *vcdname) noexcept {
		if (!m_trace) {
			m_trace = new VerilatedVcdC;
			dut  -> trace(m_trace, 99);
			m_trace -> open(vcdname);
		}
	};
	// Close a trace file
	virtual void	close(void) noexcept {
		if (m_trace) {
			m_trace	-> close();
			m_trace = NULL;
		}
	};

	virtual void	tick(void) noexcept {
		// Make sure the tickcount is greater than zero before we do this
		m_tickcount++;

		//set up all the combinational logic before the rising edge
		dut	->	clock = 0;
		dut	->	eval();
		//cout << "pc = 0x" << hex << pc << endl;

		if(m_trace)
			m_trace	-> dump(10*m_tickcount-2);

		// Repeat for the positive edge of the clock
		dut	->	clock = 1;
		dut	->	eval();		//update the flip flops

		if(m_trace) 
			m_trace	-> dump(10*m_tickcount);

		if(Verilated::gotFinish())
			return;

		// Now the negative edge
		dut->clock = 0;
		dut->eval();
		if (m_trace) {
			m_trace->dump(10*m_tickcount+5);
			m_trace->flush();
		}
	};

	virtual Module*	getModule() noexcept {
		return this->dut;
	};

	virtual double time() {
		uint64_t end_time = clock();
		double seconds = ((double)end_time - (double)boot_time) / (double)CLOCKS_PER_SEC;
		return seconds;
	}
};