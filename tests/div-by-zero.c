#include "trap.h"
#pragma GCC diagnostic ignored "-Wdiv-by-zero"
// this file is used to test exception handling
int main() {
    int a = 1 / 0;
    return 1;
}