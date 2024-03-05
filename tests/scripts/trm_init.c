extern int main();

__attribute__((noinline))
static void halt(int code) {
    asm volatile("mv a0, %0; ebreak" : :"r"(code));
}

void _trm_init() {
    int ret = main();
    halt(ret);
}