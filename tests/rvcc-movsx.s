  .file 1 "movsx.c"
  .file 2 "include/trap.h"
  .file 3 "/home/s081/Downloads/projects/rvcc/include/stddef.h"
  .file 4 "/home/s081/Downloads/projects/rvcc/include/stdbool.h"
 #  寄存器传递变量__alloca_size__偏移量-8
 #  GP0传递整型变量cond
 #  寄存器传递变量__alloca_size__偏移量-8
 #  寄存器传递变量cond偏移量-9
 #  GP0传递整型变量code
 #  寄存器传递变量__alloca_size__偏移量-8
 #  寄存器传递变量code偏移量-12
  .local .L..5
  .data
  .type .L..5, @object
  .size .L..5, 5
  .align 0
.L..5:
  .byte 109	# 字符：m
  .byte 97	# 字符：a
  .byte 105	# 字符：i
  .byte 110	# 字符：n
  .byte 0
  .local .L..4
  .data
  .type .L..4, @object
  .size .L..4, 5
  .align 0
.L..4:
  .byte 109	# 字符：m
  .byte 97	# 字符：a
  .byte 105	# 字符：i
  .byte 110	# 字符：n
  .byte 0
  .global C
  .comm C, 10, 1
  .global b
  .comm b, 4, 4
  .global A
  .comm A, 40, 16
  .local .L..3
  .data
  .type .L..3, @object
  .size .L..3, 6
  .align 0
.L..3:
  .byte 99	# 字符：c
  .byte 104	# 字符：h
  .byte 101	# 字符：e
  .byte 99	# 字符：c
  .byte 107	# 字符：k
  .byte 0
  .local .L..2
  .data
  .type .L..2, @object
  .size .L..2, 6
  .align 0
.L..2:
  .byte 99	# 字符：c
  .byte 104	# 字符：h
  .byte 101	# 字符：e
  .byte 99	# 字符：c
  .byte 107	# 字符：k
  .byte 0
  .local .L..1
  .data
  .type .L..1, @object
  .size .L..1, 5
  .align 0
.L..1:
  .byte 104	# 字符：h
  .byte 97	# 字符：a
  .byte 108	# 字符：l
  .byte 116	# 字符：t
  .byte 0
  .local .L..0
  .data
  .type .L..0, @object
  .size .L..0, 5
  .align 0
.L..0:
  .byte 104	# 字符：h
  .byte 97	# 字符：a
  .byte 108	# 字符：l
  .byte 116	# 字符：t
  .byte 0
  .global main
  .text
# =====main段开始===============
  .type main, @function
main:
  # VaArea的区域，大小为64
  addi sp, sp, -64
  addi sp, sp, -16
  sd ra, 8(sp)
  sd fp, 0(sp)
  mv fp, sp
  addi sp, sp, -16
  # 将当前的sp值，存入到Alloca区域的底部
  li t0, -8
  add t0, t0, fp
  sd sp, 0(t0)
  # 可变参数VaArea的偏移量为16
  sd a0, 16(fp)
  sd a1, 24(fp)
  sd a2, 32(fp)
  sd a3, 40(fp)
  sd a4, 48(fp)
  sd a5, 56(fp)
  sd a6, 64(fp)
  sd a7, 72(fp)
# =====main段主体===============
  .loc 1 33
  .loc 1 7
  .loc 1 7
  .loc 1 7
  .loc 1 7
  .loc 1 7
  .loc 1 7
  .loc 1 7
  li a0, 4
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 7
  .loc 1 7
  li a0, 0
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 7
  .loc 1 7
  la a0, A
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 7
  .loc 1 7
  li a0, 0
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
  .loc 1 8
  .loc 1 8
  .loc 1 8
  .loc 1 8
  .loc 1 8
  .loc 1 8
  .loc 1 8
  li a0, 4
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 8
  .loc 1 8
  li a0, 1
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 8
  .loc 1 8
  la a0, A
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 8
  .loc 1 8
  li a0, 1
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
  .loc 1 9
  .loc 1 9
  .loc 1 9
  .loc 1 9
  .loc 1 9
  .loc 1 9
  .loc 1 9
  li a0, 4
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 9
  .loc 1 9
  li a0, 2
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 9
  .loc 1 9
  la a0, A
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 9
  .loc 1 9
  li a0, 2
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
  .loc 1 10
  .loc 1 10
  .loc 1 10
  .loc 1 10
  .loc 1 10
  .loc 1 10
  .loc 1 10
  li a0, 4
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 10
  .loc 1 10
  li a0, 3
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 10
  .loc 1 10
  la a0, A
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 10
  .loc 1 10
  li a0, 3
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
  .loc 1 11
  .loc 1 11
  .loc 1 11
  .loc 1 11
  .loc 1 11
  .loc 1 11
  .loc 1 11
  li a0, 4
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 11
  .loc 1 11
  li a0, 4
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 11
  .loc 1 11
  la a0, A
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 11
  .loc 1 11
  li a0, 4
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
  .loc 1 13
  .loc 1 13
  la a0, b
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 13
  .loc 1 13
  .loc 1 13
  .loc 1 13
  .loc 1 13
  .loc 1 13
  .loc 1 13
  li a0, 4
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 13
  .loc 1 13
  li a0, 3
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 13
  .loc 1 13
  la a0, A
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
  .loc 1 14
  .loc 1 14
  .loc 1 14
  .loc 1 14
  .loc 1 14
  .loc 1 14
  .loc 1 14
  li a0, 4
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 14
  .loc 1 14
  li a0, 5
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 14
  .loc 1 14
  la a0, A
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 14
  .loc 1 14
  la a0, b
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
  .loc 1 15
  .loc 1 15
  .loc 1 15
  .loc 1 15
  .loc 1 15
  .loc 1 15
  .loc 1 15
  li a0, 1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 15
  .loc 1 15
  li a0, 0
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 15
  .loc 1 15
  la a0, C
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 15
  .loc 1 15
  li a0, 97
  # 转换为i8类型
  slli a0, a0, 56
  srai a0, a0, 56
  ld a1, 0(sp)
  addi sp, sp, 8
  sb a0, 0(a1)
  .loc 1 16
  .loc 1 16
  # 整型0值通过a0传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 16
  .loc 1 16
  .loc 1 16
  .loc 1 16
  li a0, 97
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 16
  .loc 1 16
  .loc 1 16
  .loc 1 16
  .loc 1 16
  .loc 1 16
  .loc 1 16
  li a0, 1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 16
  .loc 1 16
  li a0, 0
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 16
  .loc 1 16
  la a0, C
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  lb a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  xor a0, a0, a1
  seqz a0, a0
  snez a0, a0
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 16
  la a0, check
  mv t5, a0
  # a0传递整型参数
  ld a0, 0(sp)
  addi sp, sp, 8
  # 调用函数
  jalr t5
  .loc 1 17
  .loc 1 17
  .loc 1 17
  .loc 1 17
  .loc 1 17
  .loc 1 17
  .loc 1 17
  li a0, 1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 17
  .loc 1 17
  li a0, 1
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 17
  .loc 1 17
  la a0, C
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 17
  .loc 1 17
  .loc 1 17
  .loc 1 17
  .loc 1 17
  .loc 1 17
  .loc 1 17
  li a0, 1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 17
  .loc 1 17
  li a0, 0
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 17
  .loc 1 17
  la a0, C
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  lb a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  sb a0, 0(a1)
  .loc 1 18
  .loc 1 18
  # 整型0值通过a0传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 18
  .loc 1 18
  .loc 1 18
  .loc 1 18
  li a0, 97
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 18
  .loc 1 18
  .loc 1 18
  .loc 1 18
  .loc 1 18
  .loc 1 18
  .loc 1 18
  li a0, 1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 18
  .loc 1 18
  li a0, 1
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 18
  .loc 1 18
  la a0, C
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  lb a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  xor a0, a0, a1
  seqz a0, a0
  snez a0, a0
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 18
  la a0, check
  mv t5, a0
  # a0传递整型参数
  ld a0, 0(sp)
  addi sp, sp, 8
  # 调用函数
  jalr t5
  .loc 1 19
  .loc 1 19
  .loc 1 19
  .loc 1 19
  .loc 1 19
  .loc 1 19
  .loc 1 19
  li a0, 4
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 19
  .loc 1 19
  li a0, 0
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 19
  .loc 1 19
  la a0, A
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 19
  .loc 1 19
  .loc 1 19
  .loc 1 19
  .loc 1 19
  .loc 1 19
  .loc 1 19
  .loc 1 19
  li a0, 1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 19
  .loc 1 19
  li a0, 0
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 19
  .loc 1 19
  la a0, C
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  lb a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
  .loc 1 20
  .loc 1 20
  # 整型0值通过a0传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 20
  .loc 1 20
  .loc 1 20
  .loc 1 20
  li a0, 97
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 20
  .loc 1 20
  .loc 1 20
  .loc 1 20
  .loc 1 20
  .loc 1 20
  .loc 1 20
  li a0, 4
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 20
  .loc 1 20
  li a0, 0
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 20
  .loc 1 20
  la a0, A
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  xor a0, a0, a1
  seqz a0, a0
  snez a0, a0
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 20
  la a0, check
  mv t5, a0
  # a0传递整型参数
  ld a0, 0(sp)
  addi sp, sp, 8
  # 调用函数
  jalr t5
  .loc 1 21
  .loc 1 21
  .loc 1 21
  .loc 1 21
  .loc 1 21
  .loc 1 21
  .loc 1 21
  li a0, 1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 21
  .loc 1 21
  li a0, 1
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 21
  .loc 1 21
  la a0, C
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 21
  .loc 1 21
  li a0, 128
  # 转换为i8类型
  slli a0, a0, 56
  srai a0, a0, 56
  ld a1, 0(sp)
  addi sp, sp, 8
  sb a0, 0(a1)
  .loc 1 22
  .loc 1 22
  .loc 1 22
  .loc 1 22
  .loc 1 22
  .loc 1 22
  .loc 1 22
  li a0, 4
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 22
  .loc 1 22
  li a0, 0
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 22
  .loc 1 22
  la a0, A
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 22
  .loc 1 22
  .loc 1 22
  .loc 1 22
  .loc 1 22
  .loc 1 22
  .loc 1 22
  .loc 1 22
  li a0, 1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 22
  .loc 1 22
  li a0, 1
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 22
  .loc 1 22
  la a0, C
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  lb a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
  .loc 1 23
  .loc 1 23
  # 整型0值通过a0传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 23
  .loc 1 23
  .loc 1 23
  .loc 1 23
  li a0, 1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 23
  .loc 1 23
  .loc 1 23
  .loc 1 23
  .loc 1 23
  .loc 1 23
  .loc 1 23
  li a0, 4
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 23
  .loc 1 23
  li a0, 1
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 23
  .loc 1 23
  la a0, A
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  xor a0, a0, a1
  seqz a0, a0
  snez a0, a0
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 23
  la a0, check
  mv t5, a0
  # a0传递整型参数
  ld a0, 0(sp)
  addi sp, sp, 8
  # 调用函数
  jalr t5
  .loc 1 24
  .loc 1 24
  # 整型0值通过a0传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 24
  .loc 1 24
  .loc 1 24
  .loc 1 24
  li a0, 2
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 24
  .loc 1 24
  .loc 1 24
  .loc 1 24
  .loc 1 24
  .loc 1 24
  .loc 1 24
  li a0, 4
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 24
  .loc 1 24
  li a0, 2
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 24
  .loc 1 24
  la a0, A
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  xor a0, a0, a1
  seqz a0, a0
  snez a0, a0
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 24
  la a0, check
  mv t5, a0
  # a0传递整型参数
  ld a0, 0(sp)
  addi sp, sp, 8
  # 调用函数
  jalr t5
  .loc 1 25
  .loc 1 25
  # 整型0值通过a0传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 25
  .loc 1 25
  .loc 1 25
  .loc 1 25
  li a0, 3
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 25
  .loc 1 25
  .loc 1 25
  .loc 1 25
  .loc 1 25
  .loc 1 25
  .loc 1 25
  li a0, 4
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 25
  .loc 1 25
  li a0, 3
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 25
  .loc 1 25
  la a0, A
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  xor a0, a0, a1
  seqz a0, a0
  snez a0, a0
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 25
  la a0, check
  mv t5, a0
  # a0传递整型参数
  ld a0, 0(sp)
  addi sp, sp, 8
  # 调用函数
  jalr t5
  .loc 1 26
  .loc 1 26
  # 整型0值通过a0传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 26
  .loc 1 26
  .loc 1 26
  .loc 1 26
  li a0, 4
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 26
  .loc 1 26
  .loc 1 26
  .loc 1 26
  .loc 1 26
  .loc 1 26
  .loc 1 26
  li a0, 4
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 26
  .loc 1 26
  li a0, 4
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 26
  .loc 1 26
  la a0, A
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  xor a0, a0, a1
  seqz a0, a0
  snez a0, a0
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 26
  la a0, check
  mv t5, a0
  # a0传递整型参数
  ld a0, 0(sp)
  addi sp, sp, 8
  # 调用函数
  jalr t5
  .loc 1 27
  .loc 1 27
  # 整型0值通过a0传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 27
  .loc 1 27
  .loc 1 27
  .loc 1 27
  li a0, 3
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 27
  .loc 1 27
  la a0, b
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  xor a0, a0, a1
  seqz a0, a0
  snez a0, a0
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 27
  la a0, check
  mv t5, a0
  # a0传递整型参数
  ld a0, 0(sp)
  addi sp, sp, 8
  # 调用函数
  jalr t5
  .loc 1 28
  .loc 1 28
  # 整型0值通过a0传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 28
  .loc 1 28
  .loc 1 28
  .loc 1 28
  li a0, 3
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 28
  .loc 1 28
  .loc 1 28
  .loc 1 28
  .loc 1 28
  .loc 1 28
  .loc 1 28
  li a0, 4
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 28
  .loc 1 28
  li a0, 5
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 28
  .loc 1 28
  la a0, A
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  xor a0, a0, a1
  seqz a0, a0
  snez a0, a0
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 28
  la a0, check
  mv t5, a0
  # a0传递整型参数
  ld a0, 0(sp)
  addi sp, sp, 8
  # 调用函数
  jalr t5
  .loc 1 29
  .loc 1 29
  # 整型0值通过a0传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 29
  .loc 1 29
  .loc 1 29
  .loc 1 29
  li a0, 4294967168
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 29
  .loc 1 29
  .loc 1 29
  .loc 1 29
  .loc 1 29
  .loc 1 29
  .loc 1 29
  li a0, 1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 29
  .loc 1 29
  li a0, 1
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 29
  .loc 1 29
  la a0, C
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  lb a0, 0(a0)
  # 转换为u32类型
  slli a0, a0, 32
  srli a0, a0, 32
  ld a1, 0(sp)
  addi sp, sp, 8
  # 左部是U32类型，需要截断
slli a0, a0, 32
srli a0, a0, 32
  # 右部是U32类型，需要截断
slli a1, a1, 32
srli a1, a1, 32
  xor a0, a0, a1
  seqz a0, a0
  snez a0, a0
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 29
  la a0, check
  mv t5, a0
  # a0传递整型参数
  ld a0, 0(sp)
  addi sp, sp, 8
  # 调用函数
  jalr t5
  .loc 1 30
  .loc 1 30
  # 整型0值通过a0传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 30
  .loc 1 30
  .loc 1 30
  .loc 1 30
  li a0, 4294967168
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 30
  .loc 1 30
  .loc 1 30
  .loc 1 30
  .loc 1 30
  .loc 1 30
  .loc 1 30
  li a0, 4
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 30
  .loc 1 30
  li a0, 0
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 30
  .loc 1 30
  la a0, A
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  lw a0, 0(a0)
  # 转换为u32类型
  slli a0, a0, 32
  srli a0, a0, 32
  ld a1, 0(sp)
  addi sp, sp, 8
  # 左部是U32类型，需要截断
slli a0, a0, 32
srli a0, a0, 32
  # 右部是U32类型，需要截断
slli a1, a1, 32
srli a1, a1, 32
  xor a0, a0, a1
  seqz a0, a0
  snez a0, a0
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 30
  la a0, check
  mv t5, a0
  # a0传递整型参数
  ld a0, 0(sp)
  addi sp, sp, 8
  # 调用函数
  jalr t5
  .loc 1 32
  .loc 1 32
  .loc 1 32
  li a0, 0
  j .L.return.main
  li a0, 0
# =====main段结束===============
.L.return.main:
  mv sp, fp
  ld fp, 0(sp)
  ld ra, 8(sp)
  addi sp, sp, 16
  # 归还VaArea的区域，大小为64
  addi sp, sp, 64
  ret
  .global check
  .text
# =====check段开始===============
  .type check, @function
check:
  addi sp, sp, -16
  sd ra, 8(sp)
  sd fp, 0(sp)
  mv fp, sp
  addi sp, sp, -16
  # 将当前的sp值，存入到Alloca区域的底部
  li t0, -8
  add t0, t0, fp
  sd sp, 0(t0)
  # 将整型形参cond的寄存器a0的值压栈
  sb a0, -9(fp)
# =====check段主体===============
  .loc 2 39
  .loc 2 38
  .loc 2 38
  .loc 2 38
  addi a0, fp, -9
  lb a0, 0(a0)
  seqz a0, a0
  beqz a0, .L.else.1
  .loc 2 38
  .loc 2 38
  # 整型0值通过a0传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 2 38
  .loc 2 38
  li a0, 1
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 2 38
  la a0, halt
  mv t5, a0
  # a0传递整型参数
  ld a0, 0(sp)
  addi sp, sp, 8
  # 调用函数
  jalr t5
  j .L.end.1
.L.else.1:
.L.end.1:
# =====check段结束===============
.L.return.check:
  mv sp, fp
  ld fp, 0(sp)
  ld ra, 8(sp)
  addi sp, sp, 16
  ret
  .global halt
  .text
# =====halt段开始===============
  .type halt, @function
halt:
  addi sp, sp, -16
  sd ra, 8(sp)
  sd fp, 0(sp)
  mv fp, sp
  addi sp, sp, -16
  # 将当前的sp值，存入到Alloca区域的底部
  li t0, -8
  add t0, t0, fp
  sd sp, 0(t0)
  # 将整型形参code的寄存器a0的值压栈
  sw a0, -12(fp)
# =====halt段主体===============
  .loc 2 34
  .loc 2 21
  .loc 2 21
  .loc 2 21
  .loc 2 21
  li a0, 0
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 2 21
  .loc 2 21
  addi a0, fp, -12
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  xor a0, a0, a1
  seqz a0, a0
  beqz a0, .L.else.2
  .loc 2 26
  .loc 2 22
  # 插入的ASM代码片段
  li a0, 0
ebreak

  .loc 2 25
  j .L.end.2
.L.else.2:
  .loc 2 32
  .loc 2 28
  # 插入的ASM代码片段
  li a0, 1
ebreak

  .loc 2 31
.L.end.2:
# =====halt段结束===============
.L.return.halt:
  mv sp, fp
  ld fp, 0(sp)
  ld ra, 8(sp)
  addi sp, sp, 16
  ret
