#include <stddef.h>
//#include <stdarg.h>
#include <stdbool.h>
//#include <stdio.h>

#ifndef __TRAP_H__
#define __TRAP_H__

#define ROUNDUP(a, sz)      ((((uintptr_t)a) + (sz) - 1) & ~((sz) - 1))
#define ROUNDDOWN(a, sz)    ((((uintptr_t)a)) & ~((sz) - 1))
#define LENGTH(arr)         (sizeof(arr) / sizeof((arr)[0]))

#define STRINGIFY(s)        #s
#define TOSTRING(s)         STRINGIFY(s)
#define _CONCAT(x, y)       x ## y
#define CONCAT(x, y)        _CONCAT(x, y)


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

size_t strlen(const char *s);
int strcmp(const char *X, const char *Y);
char *strcat(char *dst, const char *src);
char *strcpy(char *dst, const char *src);
void *memset(void *s, int c, size_t n);
int memcmp(const void *s1, const void *s2, size_t n);
void *memcpy(void *dst, const void *src, size_t n);
#endif