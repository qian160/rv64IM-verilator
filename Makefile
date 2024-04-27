.PHONY : clean build
OBJCOPY = riscv64-linux-gnu-objcopy

VSRC	= $(addprefix ./verilog/, $(shell ls ./verilog | grep \.\*v))   #.v or .sv
CPPSRC	+= $(addprefix ./cpp/, $(shell ls ./cpp | grep cpp))
CPPSRC	+= $(addprefix ./cpp/device/, $(shell ls ./cpp/device | grep cpp))
# -I is for verilog, -CFLAGS -I for cpp
#Wno-unoptflat
VFLAGS	= --cc --exe --trace -Wno-lint -Wno-unoptflat --build --top top\
	-LDFLAGS -ldl \
	-O3 -Iverilog -j 8\
	-CFLAGS -I$(shell llvm-config-11 --includedir) \
	-CFLAGS -Icpp/include \
	-CFLAGS -Icpp/device/include \
	-LDFLAGS $(shell llvm-config-11 --libs)

build: $(CPPSRC) $(VSRC)
	@verilator $(VSRC) $(CPPSRC) $(VFLAGS) $(CPPFLAGS)
	@echo "completed"

xv6: build
	@make -C xv6-riscv -j8
	@$(OBJCOPY) -S --set-section-flags .bss=alloc,contents -O binary xv6-riscv/kernel/kernel kernel.bin
	obj_dir/Vtop kernel.bin


clean:
	-rm  -rf obj_dir wave.vcd img*
	-find . -type f '(' -name '*.o' -o -name '*.bin' -o -name '*.elf' ')' -delete
