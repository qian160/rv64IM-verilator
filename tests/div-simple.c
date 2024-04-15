#include "trap.h"


int main() {
	int a = 149, b = 5;
	asm (
		"div t0, %0, %1\n"
		::"r"(a), "r"(b)
	);
	return 0;
}
