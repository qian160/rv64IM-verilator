#include "trap.h"

int main() {
    asm volatile(
        "li x1, 1\n"
        "li x2, 2\n"
        "add a0, x1, x2\n"
        "addi a0, a0, -3\n"
        "li a0, 0\n"
        "addi a0, a0, 1\n"
        "addi a0, a0, 1\n"
        "addi a0, a0, 1\n"
        "addi a0, a0, 1\n"
        "addi a0, a0, 1\n"
        "addi a0, a0, 1\n"
        "addi a0, a0, 1\n"
        "addi a0, a0, 1\n"
        "addi a0, a0, 1\n"
        "addi a0, a0, 1\n"
        "mv a1, a0\n"
        "mv a0, a1\n"
        "addi a0, a0, -10\n"
        "ebreak\n"
    );
}