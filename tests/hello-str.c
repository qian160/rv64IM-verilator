#include "trap.h"

char buf[128];

int main() {

	char *buf = "Hello world!\n";
	//sprintf(buf, "%s", "Hello world!\n");
	check(strcmp(buf, "Hello world!\n") == 0);
	buf = "1 + 1 = 2\n";
	//sprintf(buf, "%d + %d = %d\n", 1, 1, 2);
	check(strcmp(buf, "1 + 1 = 2\n") == 0);
	buf = "2 + 10 = 12\n";
	//sprintf(buf, "%d + %d = %d\n", 2, 10, 12);
	check(strcmp(buf, "2 + 10 = 12\n") == 0);

	return 0;
}
