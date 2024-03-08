.PHONY: all run clean test_all $(ALL) 

RESULT = .result

$(shell > $(RESULT))

COLOR_RED    = \033[1;31m
COLOR_GREEN  = \033[1;32m
COLOR_YELLOW = \033[1;33m
COLOR_NONE   = \033[0m

print_yellow = @printf "$(COLOR_YELLOW)$(1)$(COLOR_NONE)\n"
print_green  = @printf "$(COLOR_GREEN)$(1)$(COLOR_NONE)\n"
print_red 	 = @printf "$(COLOR_RED)$(1)$(COLOR_NONE)\n"

# *.c source test files
#ALL = $(basename $(notdir $(shell find . -name "*.c")))
ALL = $(basename $(shell ls *.c))

all: $(addprefix gcc., $(ALL)) $(addprefix rvcc., $(ALL))
	@echo "" $(ALL)

$(ALL): %: gcc.%

# compile(vtop) -> compile(image file) -> load -> run
gcc.%: %.c $(LINKAGE)
	$(call print_yellow,====building img $*...=== )
	@make -s -f scripts/Makefile NAME=$* build_gcc
	$(call print_yellow,====loading img $*...===)
	@../utils/load $*.bin
	$(call print_green,====start simulating...===)
	@../obj_dir/Vtop 114514\
		&& printf "[%18s] $(COLOR_GREEN)PASS!$(COLOR_NONE)\n" gcc-$* >> $(RESULT)\
		|| printf "[%18s] $(COLOR_RED)FAIL!$(COLOR_NONE)\n" gcc-$* >> $(RESULT)

rvcc.%: %.c $(LINKAGE)
	$(call print_yellow,====building img $*...=== )
	@make -s -f scripts/Makefile NAME=$* build_rvcc
	$(call print_yellow,====loading img $*...===)
	@../utils/load rvcc-$*.bin
	$(call print_green,====start simulating...===)
	@../obj_dir/Vtop 114514\
		&& printf "[%20s] $(COLOR_GREEN)PASS!$(COLOR_NONE)\n" rvcc-$* >> $(RESULT)\
		|| printf "[%20s] $(COLOR_RED)FAIL!$(COLOR_NONE)\n" rvcc-$* >> $(RESULT)

#usage 1. make gcc.xxx 2. make rvcc.xxx 3. make test_all
test_all: all
	@cat $(RESULT)
	@rm $(RESULT)

build:
	make -C ../ build

clean:
	rm -rf *.bin *.elf *.txt *.s wave.vcd img
	-find . -name "*.o" -type f -delete

