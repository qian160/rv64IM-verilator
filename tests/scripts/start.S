.section entry, "ax"
.globl _start
.type _start, @function

_start:
    mv s0, zero
    # set sp
    la sp, _stack_pointer
    # set mtvec
    la t0, trap_handler
    csrw mtvec, t0

    jal _trm_init
    