#include "trap.h"
#include <stdint.h>
int main() {
    uint64_t t;

    asm volatile(
        "li t0, 0x114\n"
        "csrw mvendorid, t0\n"
        "csrr %0, mvendorid\n"      // t == 0x114?
        :"=r"(t)
    );
    check(t == 0x114);
}