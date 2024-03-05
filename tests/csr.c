#include "trap.h"
#include <stdint.h>
int main() {
    register uint64_t mvendorid;
    asm volatile(
        "csrr %0, mvendorid"
        :"=r"
        (mvendorid)
    );

    //check(mvendorid == ?);
}