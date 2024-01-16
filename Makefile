.PHONY : clean build

VSRC	= $(addprefix ./verilog/, $(shell ls ./verilog | grep \.\*v))   #.v or .sv
CPPSRC	= $(addprefix ./cpp/, $(shell ls ./cpp | grep cpp))
INC 	= $(addprefix ./cpp/include/, $(shell ls ./cpp/include))
# -I is for verilog, -CFLAGS -I for cpp
VFLAGS	= --cc --exe --trace -Wno-lint --build --top top\
	-LDFLAGS -ldl \
	-O3 -Iverilog -j 8\
	-CFLAGS -I$(shell llvm-config-11 --includedir) \
	-LDFLAGS $(shell llvm-config-11 --libs)

build: $(CPPSRC) $(VSRC) $(INC)
	@verilator $(VSRC) $(CPPSRC) $(VFLAGS) $(CPPFLAGS)
	@echo "completed"

clean:
	-rm  -rf obj_dir wave.vcd img*
	-find . -type f '(' -name '*.o' -o -name '*.bin' -o -name '*.elf' -o -name '*.txt' ')' -delete
