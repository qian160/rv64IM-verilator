#include <stdint.h>
// todo: complete this module
/*
- 当处理器进入异常后，就会跳到 mtvec 寄存器定义的 PC 地址执行新的程序。
- 使用 mscratch 保存现场上下文。
- 使用 mcause 寄存器用于判断是那种异常类型。（其中包含了 12 种中断以及 16 种异常。）
- MEPC += 4。使返回时跳过发生异常的指令。
- 使用 mscratch 恢复现场上下文。
- mret。
*/

// mcause: [63] interrupt [62:0] code
// int = 1
#define SUPERVISOR_SOFTWARE_INT     (((uint64_t)1 << 63) | 1)
#define MACHINE_SOFTWARE_INT        (((uint64_t)1 << 63) | 3)
#define SUPERVISOR_TIMER_INT        (((uint64_t)1 << 63) | 5)
#define MACHINE_TIMER_INT           (((uint64_t)1 << 63) | 7)
#define SUPERVISOR_EXTERNAL_INT     (((uint64_t)1 << 63) | 9)
#define MACHINE_EXTERNAL_INT        (((uint64_t)1 << 63) | 11)
// int = 0
#define INST_ADDR_MISALIGNED     (0)
#define INST_ACCESS_FAULT        (1)
#define INST_ILLEGAL             (2)
#define BREAKPOINT               (3)
#define LOAD_ADDR_MISALIGNED     (4)
#define LOAD_ACCESS_FAULT        (5)
#define STORE_ADDR_MISALIGNED    (6)
#define STORE_ACCESS_FAULT       (7)
#define ECALL_FROM_U             (8)
#define ECALL_FROM_S             (9)
#define ECALL_FROM_M             (11)
#define INST_PAGEFAULT           (12)
#define LOAD_PAGEFAULT           (13)
#define STORE_PAGEFAULT          (15)

__attribute__((aligned(32)))
void trap_handler() {
    // save the context?
    // csrrw sp, sscratch, sp       # swap sp and sscratch. so that sp is saved in sscratch
    // sub sp ...
    // sd ..
    uint64_t code;
    asm volatile(
        "csrr %0, mcause\n"
        :"=r"(code)
    );

    uint64_t a0, mepc;
//    printf("mcause = %d\n", code);        // libc disabled
    switch (code) {
        case BREAKPOINT:
            // ebreak: check a0 and exit (this work is done by wb.v ...)
            asm volatile(
                "mv %0, a0\n"
                "csrr %1, mepc\n"
                :"=r"(a0), "=r"(mepc)
            );
            break;
        case MACHINE_TIMER_INT:
            // reset counter
            // mepc doesn't need to +4
            break;
        default:
            // mepc += 4
            asm volatile(
                "csrr t0, mepc\n"
                "addi t0, t0, 4\n"
                "csrw mepc, t0\n"
            );
            break;
    }
    // restore the context
    // csrr sp, sscratch
    // ld ...
    // add sp ..

    asm volatile("mret");
}
