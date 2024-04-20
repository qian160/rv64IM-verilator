.PHONY: build run

CC = riscv64-linux-gnu-gcc
RVCC = ../rvcc/target/rvcc		# relevent to the 'test' folder
LD = riscv64-linux-gnu-ld
OBJCOPY = riscv64-linux-gnu-objcopy
OBJDUMP = riscv64-linux-gnu-objdump
AS = riscv64-linux-gnu-as

ASMSRC = $(addprefix scripts/, $(shell ls scripts | grep \.S))
CSRC = $(addprefix scripts/, $(shell ls scripts | grep \.c))
ASMOBJS = $(ASMSRC:.S=.o)
COBJS = $(CSRC:.c=.o)

OBJS += $(ASMOBJS)
OBJS += $(COBJS)

$(ASMOBJS): %.o: %.S
$(COBJS): %.o: %.c
# when testing rvcc, disable the 'C' extension
COMMON_FLAGS  := -fno-pic -I./include -march=rv64imafdc -mabi=lp64d
CFLAGS        += $(COMMON_FLAGS) -static -mcmodel=medany -mstrict-align -fno-asynchronous-unwind-tables -fno-builtin -fno-stack-protector
ASFLAGS       += $(COMMON_FLAGS)
LDFLAGS   	  += -T scripts/linker.ld --defsym=_pmem_start=0x80000000 --defsym=_entry_offset=0x0
LDFLAGS   	  += --gc-sections -e _start
LDFLAGS       += -melf64lriscv
LINKAGE		  += $(OBJS) lib/lib.o

### Rule (compile): a single `.S` -> `.o` (as)
%.o: %.S
	@$(AS) $(ASFLAGS) -c -o $@ $<

### Rule (compile): a single `.c` -> `.o` (gcc)
%.o: %.c
	@$(CC) -c $(CFLAGS) -c -o $@ $<

lib/lib.o: lib/lib.c
	@$(CC) -c $(CFLAGS) -c -o $@ $<

build_gcc: 	$(LINKAGE)
	$(CC) -c $(CFLAGS) $(NAME).c -o gcc-$(NAME).o
	$(LD) -o gcc-$(NAME).elf $(LDFLAGS) --start-group gcc-$(NAME).o $(LINKAGE) --end-group
	$(OBJDUMP) -d gcc-$(NAME).elf -M no-aliases > gcc-$(NAME).txt
	$(OBJCOPY) -S --set-section-flags .bss=alloc,contents -O binary gcc-$(NAME).elf gcc-$(NAME).bin

build_rvcc:	$(LINKAGE)
	$(RVCC) -S $(NAME).c -o rvcc-$(NAME).s -Iinclude
	$(AS) $(ASFLAGS) rvcc-$(NAME).s  -o rvcc-$(NAME).o
	$(LD) -o rvcc-$(NAME).elf $(LDFLAGS) --start-group rvcc-$(NAME).o $(LINKAGE) --end-group
	$(OBJDUMP) -d rvcc-$(NAME).elf -M no-aliases > rvcc-$(NAME).txt
	$(OBJCOPY) -S --set-section-flags .bss=alloc,contents -O binary rvcc-$(NAME).elf rvcc-$(NAME).bin
run:

echo:
	@echo $(ASMSRC)
	@echo $(OBJS)
