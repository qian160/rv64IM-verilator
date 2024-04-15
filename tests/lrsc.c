#include "trap.h"

int main()
{
    uint64_t addr = 0x80000000;
    asm volatile (
        "li a0, 1\n"
        "lr.w a1, (%0)\n"
        "sc.w a0, a1, (%0)\n"   // a success sc will set a0 = 0
        "ebreak\n"
        ::"r"(addr)
    );
    return 0;
}