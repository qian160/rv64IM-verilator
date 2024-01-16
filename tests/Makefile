.PHONY: all run clean test_all $(ALL) 

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

Makefile.%: %.c $(LINKAGE)
	@if make -s -f scripts/Makefile NAME=$* build; then \
		printf "[%14s] $(COLOR_GREEN)PASS!$(COLOR_NONE)\n" $* >> $(RESULT); \
	else \
		printf "[%14s] $(COLOR_RED)FAIL!$(COLOR_NONE)\n" $* >> $(RESULT); \
	fi

run: all
	@cat $(RESULT)
	@rm $(RESULT)

test.%:	Makefile.%

test_all:

clean:
	@rm -rf *.bin *.elf *.txt
	@-find . -name "*.o" -type f -delete

