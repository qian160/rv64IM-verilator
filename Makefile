.PHONY : run clean test test_all build

CC	= g++
DEST	= ./obj_dir
VSRC	= $(addprefix ./verilog/, $(shell ls ./verilog | grep \.\*v))   #.v or .sv
CPPSRC	= $(addprefix ./cpp/, $(shell ls ./cpp | grep cpp))
INC 	= $(addprefix ./cpp/include/, $(shell ls ./cpp/include))
# -I is for verilog, -CFLAGS -I for cpp
VFLAGS	= --cc --exe --trace -Wno-lint --build --top top\
	-LDFLAGS -ldl \
	-O3 -Iverilog -j 8\
	-CFLAGS -I$(shell llvm-config-11 --includedir) \
	-LDFLAGS $(shell llvm-config-11 --libs)

COLOR_RED    = \033[1;31m
COLOR_GREEN  = \033[1;32m
COLOR_YELLOW = \033[1;33m
COLOR_NONE   = \033[0m

print_yellow = @printf "$(COLOR_YELLOW)$(1)$(COLOR_NONE)\n"
print_green  = @printf "$(COLOR_GREEN)$(1)$(COLOR_NONE)\n"
print_red 	 = @printf "$(COLOR_RED)$(1)$(COLOR_NONE)\n"

#usage: make run [img=xxx]
# e.g. make run img=add
run: $(CPPSRC) $(VSRC) $(INC)
ifndef img
	$(error img is not defined. usage: make run img=xxx)
endif
	$(call print_yellow,building img $(img)... )
	@make -C tests/ -f ./Makefile Makefile.$(img)
	$(call print_yellow,loading img $(img)... )
	@./utils/load tests/$(img).bin
	$(call print_green,[done])
	$(call print_yellow,start simulating... )
	@verilator $(VSRC) $(CPPSRC) $(VFLAGS) $(CPPFLAGS)
	@obj_dir/Vtop $(img)	

test_all:
	make -C tests/ test_all

clean:
	-rm  -rf obj_dir wave.vcd img*
	-find . -type f '(' -name '*.o' -o -name '*.bin' -o -name '*.elf' -o -name '*.txt' ')' -delete
