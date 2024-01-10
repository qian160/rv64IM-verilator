extern int main();

/*  1. why not extern?
        some test files don't use halt, so the linking will fail
    2. why static?
        multiple defination
*/
__attribute__((noinline))
static void halt(int code) {
    asm volatile("mv a0, %0; ebreak" : :"r"(code));
}

void _trm_init() {
    int ret = main();
    halt(ret);
}
