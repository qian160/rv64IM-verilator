.PHONY: build run

CC = riscv64-linux-gnu-gcc
LD = riscv64-linux-gnu-ld
OBJCOPY = riscv64-linux-gnu-objcopy
OBJDUMP = riscv64-linux-gnu-objdump
AS = riscv64-linux-gnu-as

COMMON_FLAGS  := -fno-pic -I./include -march=rv64imc -mabi=lp64
CFLAGS        += $(COMMON_FLAGS) -static -lc -mcmodel=medany -mstrict-align -fno-asynchronous-unwind-tables -fno-builtin -fno-stack-protector
ASFLAGS       += $(COMMON_FLAGS)
LDFLAGS   	  += -T scripts/linker.ld --defsym=_pmem_start=0x80000000 --defsym=_entry_offset=0x0
LDFLAGS   	  += --gc-sections -e _start
LDFLAGS       += -melf64lriscv
LINKAGE		  += scripts/start.o scripts/trm_init.o lib/lib.o

scripts/start.o: scripts/start.S
	@$(AS) $(ASFLAGS) -c -o $@ $<

scripts/trm_init.o: scripts/trm_init.c
	@$(CC) -c $(CFLAGS) -c -o $@ $<

lib/lib.o: lib/lib.c
	@$(CC) -c $(CFLAGS) -c -o $@ $<

build: $(LINKAGE)
	$(CC) -c $(CFLAGS) $(NAME).c
	$(LD) -o $(NAME).elf $(LDFLAGS) --start-group $(NAME).o $(LINKAGE) --end-group
	$(OBJDUMP) -d $(NAME).elf -M no-aliases > $(NAME).txt
	$(OBJCOPY) -S --set-section-flags .bss=alloc,contents -O binary $(NAME).elf $(NAME).bin
run:

