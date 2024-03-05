#include <stdint.h>
// todo: complete this module
void trap_handler() {
    uint64_t code;
    asm volatile(
        "csrr %0, mcause"
        :"=r"
        (code)
    );
    switch (code) {
        default:
            break;
    }
}