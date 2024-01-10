// warning: some test files need to be linked with libc to use the relevent functions,
// but the cflags we specify during the conpiling process seem to have some problems
// and thus the linking will fail(or maybe for other don't-know reasons...)
// so here I write some easy functions from libc to use

#include<stddef.h>

size_t strlen(const char *s) {
    size_t len = 0;
    if(!s) return 0;
    while(*s++)len++;
    return len;
    // \0 is not counted
}

// Function to implement strcmp function
int strcmp(const char *X, const char *Y)
{
    while (*X){
        // if characters differ, or end of the second string is reached
        if (*X != *Y)
            break;
        // move to the next pair of characters
        X++;
        Y++;
    }
    // return the ASCII difference after converting `char*` to `unsigned char*`
    return *(const unsigned char*)X - *(const unsigned char*)Y;
}

char *strcat(char *dst, const char *src) {
//    assert(dst);
//    assert(src);
    // make ptr point to the end of the dst string
    char* ptr = dst + strlen(dst);

    // appends characters of the src to the dst string
    while (*src != '\0') {
        *ptr++ = *src++;
    }   
    // null terminate dst string
    *ptr = '\0';

    return dst;
}

char *strcpy(char *dst, const char *src) {
    // return if no memory is allocated to the dst
    if (dst == NULL) {
        return NULL;
    }
    // take a pointer pointing to the beginning of the dst string
    char *ptr = dst;

    // copy the C-string pointed by src into the array
    // pointed by dst
    while (*src != '\0')
        *dst++ = *src++;

    // include the terminating null character
    *dst = '\0';

    // the dst is returned by standard `strcpy()`
    return ptr;
}

void *memset(void *s, int c, size_t n) {
    //seems that n can be larger than sizeof(s), no check is needed
    unsigned char * p = s;
        while(n--)
        *p++ = (unsigned char)c;
        return s;
}

int memcmp(const void *s1, const void *s2, size_t n) {
    unsigned const char *p = s1;
    unsigned const char *q = s2;
    //both pointer points to the same memory block, there is no need to compare
    if (s1 == s2)
        return 0;
    while (n--)
    {
        if (*p != *q)
            //compare the mismatching character
            return *p - *q;
        p++;
        q++;
    }
    return 0;
}