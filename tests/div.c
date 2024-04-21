#pragma GCC diagnostic ignored "-Wdiv-by-zero"
#include "trap.h"

#define N 10
int a[N];

int main() {
  int i, j;
  for(i = 0; i < N; i ++)
    a[i] = i;
  for(i = 0; i < N; i ++)
    for(j = 1; j < N + 1; j ++)
      a[i] *= j;
  for(i = 0; i < N; i ++)
    for(j = 1; j < N + 1; j ++)
      a[i] /= j;

  for(i = 0; i < N; i ++)
    check(a[i] == i);

  check((((int64_t)1 << 63) /  1) == ((int64_t)1 << 63));
  check((((int64_t)1 << 63) / -1) == ((int64_t)1 << 63));
  check((((int64_t)1 << 63) %  1) == 0);
  check((((int64_t)1 << 63) % -1) == 0);

  check(1 / 0 == -1);
  check(1 % 0 ==  1);
  return 0;
}
