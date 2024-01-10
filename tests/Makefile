.PHONY: all run gdb clean latest $(ALL) test

RESULT = .result

$(shell > $(RESULT))

COLOR_RED   = \033[1;31m
COLOR_GREEN = \033[1;32m
COLOR_NONE  = \033[0m

# *.c source test files
#ALL = $(basename $(notdir $(shell find . -name "*.c")))
ALL = $(basename $(shell ls *.c))

all: $(addprefix Makefile., $(ALL))
	@echo "" $(ALL)

$(ALL): %: Makefile.%

# usage:
# 1.make makefile.xxx
#	make -f makefile.xxx build
# 2.make all
Makefile.%: %.c $(LINKAGE)
#	@/bin/echo -e "NAME = $*\ninclude scripts/Makefile" > $@
#	@if make -s -f $@ build; then \

	@if make -s -f scripts/Makefile NAME=$* build; then \
		printf "[%14s] $(COLOR_GREEN)PASS!$(COLOR_NONE)\n" $* >> $(RESULT); \
	else \
		printf "[%14s] $(COLOR_RED)FAIL!$(COLOR_NONE)\n" $* >> $(RESULT); \
	fi
#	-@rm -f Makefile.$*

run: all
	@cat $(RESULT)
	@rm $(RESULT)

clean:
	@rm -rf *.bin *.elf *.txt
	@-find . -name "*.o" -type f -delete

