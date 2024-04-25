#include <stddef.h>
#include <stdint.h>
#include <string.h>
#include <stdbool.h>
#include <stdio.h>

#ifndef __TRAP_H__
#define __TRAP_H__

#define UART0 0x10000000L

//__attribute__((noinline))
void halt(int code) {
    if (code == 0) {
        asm(
            "li a0, 0\n"
            "ebreak\n"
        );
    }
    else {
        asm(
            "li a0, 1\n"
            "ebreak\n"
        );
    }
//    asm volatile("mv a0, %0; ebreak" : :"r"(code));
}

//__attribute__((noinline))
void check(_Bool cond) {
    if (!cond) halt(1);
}

void putstr(char *s) {
    while (*s)
    {
        *(char*)UART0 = *s;
        s++;
    }
    
}


size_t strlen(const char *s);
int strcmp(const char *X, const char *Y);
char *strcat(char *dst, const char *src);
char *strcpy(char *dst, const char *src);
void *memset(void *s, int c, size_t n);
int memcmp(const void *s1, const void *s2, size_t n);
void *memcpy(void *dst, const void *src, size_t n);

#endif
