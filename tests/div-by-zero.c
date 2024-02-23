#include "trap.h"
#pragma GCC diagnostic ignored "-Wdiv-by-zero"

int main() {
    int a = 1 / 0;
    return 1;
}