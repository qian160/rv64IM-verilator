#include "trap.h"

int main() {
    asm volatile(
        "li x1, 1\n"
        "li x2, 2\n"
        "add a0, x1, x2\n"
        "addi a0, a0, -3\n"
        "ebreak\n"
    );
}