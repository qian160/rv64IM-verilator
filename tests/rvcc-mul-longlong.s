  .file 1 "mul-longlong.c"
  .file 2 "include/trap.h"
  .file 3 "/home/s081/Downloads/projects/rvcc/include/stddef.h"
  .file 4 "/home/s081/Downloads/projects/rvcc/include/stdbool.h"
 #  寄存器传递变量偏移量-8
 #  寄存器传递变量偏移量-16
 #  寄存器传递变量偏移量-24
 #  寄存器传递变量ans_idx偏移量-28
 #  寄存器传递变量j偏移量-32
 #  寄存器传递变量i偏移量-36
 #  寄存器传递变量__alloca_size__偏移量-48
 #  GP0传递整型变量a
 #  GP1传递整型变量b
 #  寄存器传递变量ans偏移量-8
 #  寄存器传递变量__alloca_size__偏移量-16
 #  寄存器传递变量a偏移量-24
 #  寄存器传递变量b偏移量-32
 #  GP0传递整型变量cond
 #  寄存器传递变量__alloca_size__偏移量-8
 #  寄存器传递变量cond偏移量-9
 #  GP0传递整型变量code
 #  寄存器传递变量__alloca_size__偏移量-8
 #  寄存器传递变量code偏移量-12
  .local .L..7
  .data
  .type .L..7, @object
  .size .L..7, 5
  .align 0
.L..7:
  .byte 109	# 字符：m
  .byte 97	# 字符：a
  .byte 105	# 字符：i
  .byte 110	# 字符：n
  .byte 0
  .local .L..6
  .data
  .type .L..6, @object
  .size .L..6, 5
  .align 0
.L..6:
  .byte 109	# 字符：m
  .byte 97	# 字符：a
  .byte 105	# 字符：i
  .byte 110	# 字符：n
  .byte 0
  .global ans
  .data
  .type ans, @object
  .size ans, 80
  .align 4
ans:
  .byte -28
  .byte 24
  .byte 26
  .byte -37
  .byte -71
  .byte -102
  .byte -46
  .byte 25
  .byte -114
  .byte 8
  .byte -61
  .byte 58	# 字符：:
  .byte 109	# 字符：m
  .byte -104
  .byte 21
  .byte -22
  .byte 54	# 字符：6
  .byte -78
  .byte 13
  .byte -4
  .byte -128
  .byte -23
  .byte 73	# 字符：I
  .byte 38	# 字符：&
  .byte 48	# 字符：0
  .byte 125	# 字符：}
  .byte 74	# 字符：J
  .byte 10
  .byte -38
  .byte 67	# 字符：C
  .byte 76	# 字符：L
  .byte -6
  .byte 57	# 字符：9
  .byte -79
  .byte 86	# 字符：V
  .byte 44	# 字符：,
  .byte -114
  .byte -119
  .byte -103
  .byte 18
  .byte 101	# 字符：e
  .byte -98
  .byte 49	# 字符：1
  .byte 10
  .byte -43
  .byte 35	# 字符：#
  .byte -127
  .byte -33
  .byte 104	# 字符：h
  .byte -35
  .byte 21
  .byte 76	# 字符：L
  .byte -88
  .byte -33
  .byte -42
  .byte 4
  .byte -95
  .byte 87	# 字符：W
  .byte 67	# 字符：C
  .byte -98
  .byte -101
  .byte -41
  .byte -59
  .byte 56	# 字符：8
  .byte 72	# 字符：H
  .byte 66	# 字符：B
  .byte -4
  .byte 30
  .byte -53
  .byte -111
  .byte -117
  .byte -9
  .byte 64	# 字符：@
  .byte -52
  .byte -33
  .byte 127
  .byte -92
  .byte 85	# 字符：U
  .byte 66	# 字符：B
  .byte 1
  .global test_data
  .data
  .type test_data, @object
  .size test_data, 16
  .align 4
test_data:
  .byte -86
  .byte -62
  .byte -79
  .byte -82
  .byte 43	# 字符：+
  .byte -1
  .byte 0
  .byte 69	# 字符：E
  .byte -81
  .byte -112
  .byte 113	# 字符：q
  .byte -121
  .byte 56	# 字符：8
  .byte 36	# 字符：$
  .byte -12
  .byte 17
  .local .L..5
  .data
  .type .L..5, @object
  .size .L..5, 4
  .align 0
.L..5:
  .byte 109	# 字符：m
  .byte 117	# 字符：u
  .byte 108	# 字符：l
  .byte 0
  .local .L..4
  .data
  .type .L..4, @object
  .size .L..4, 4
  .align 0
.L..4:
  .byte 109	# 字符：m
  .byte 117	# 字符：u
  .byte 108	# 字符：l
  .byte 0
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
  addi sp, sp, -48
  # 将当前的sp值，存入到Alloca区域的底部
  li t0, -48
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
  .loc 1 25
  .loc 1 14
  .loc 1 14
  .loc 1 14
  .loc 1 14
  .loc 1 14
  .loc 1 14
  .loc 1 14
  .loc 1 14
  .loc 1 14
  .loc 1 14
  # 对ans_idx的内存-28(fp)清零4位
  sw zero, -28(fp)
  .loc 1 14
  addi a0, fp, -28
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 14
  .loc 1 14
  li a0, 0
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
  .loc 1 15
  .loc 1 15
  .loc 1 15
  addi a0, fp, -36
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 15
  .loc 1 15
  li a0, 0
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
.L.begin.1:
  .loc 1 15
  .loc 2 11
  .loc 2 11
  .loc 2 11
  .loc 2 11
  li a0, 4
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 2 11
  .loc 2 11
  li a0, 16
  ld a1, 0(sp)
  addi sp, sp, 8
  divu a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 15
  .loc 1 15
  addi a0, fp, -36
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  sltu a0, a0, a1
  beqz a0, .L..8
  .loc 1 20
  .loc 1 16
  .loc 1 16
  .loc 1 16
  addi a0, fp, -32
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 16
  .loc 1 16
  addi a0, fp, -36
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
.L.begin.2:
  .loc 1 16
  .loc 2 11
  .loc 2 11
  .loc 2 11
  .loc 2 11
  li a0, 4
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 2 11
  .loc 2 11
  li a0, 16
  ld a1, 0(sp)
  addi sp, sp, 8
  divu a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 16
  .loc 1 16
  addi a0, fp, -32
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  sltu a0, a0, a1
  beqz a0, .L..10
  .loc 1 18
  .loc 1 17
  .loc 1 17
  # 整型0值通过a0传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 17
  .loc 1 17
  .loc 1 17
  .loc 1 17
  # 整型0值通过a0传递
  # 整型0值通过a1传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 17
  .loc 1 17
  .loc 1 17
  .loc 1 17
  .loc 1 17
  .loc 1 17
  .loc 1 17
  li a0, 4
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 17
  .loc 1 17
  addi a0, fp, -32
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 17
  .loc 1 17
  la a0, test_data
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  lw a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 17
  .loc 1 17
  .loc 1 17
  .loc 1 17
  .loc 1 17
  .loc 1 17
  .loc 1 17
  li a0, 4
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 17
  .loc 1 17
  addi a0, fp, -36
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 17
  .loc 1 17
  la a0, test_data
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  lw a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 17
  la a0, mul
  mv t5, a0
  # a0传递整型参数
  ld a0, 0(sp)
  addi sp, sp, 8
  # a1传递整型参数
  ld a1, 0(sp)
  addi sp, sp, 8
  # 调用函数
  jalr t5
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 17
  .loc 1 17
  .loc 1 17
  .loc 1 17
  .loc 1 17
  .loc 1 17
  .loc 1 17
  li a0, 8
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 17
  .loc 1 17
  .loc 1 17
  .loc 1 17
  .loc 1 17
  li a0, -1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 17
  .loc 1 17
  .loc 1 17
  addi a0, fp, -8
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 17
  .loc 1 17
  addi a0, fp, -28
  ld a1, 0(sp)
  addi sp, sp, 8
  sd a0, 0(a1)
  .loc 1 17
  .loc 1 17
  addi a0, fp, -8
  ld a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 17
  .loc 1 17
  .loc 1 17
  .loc 1 17
  li a0, 1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 17
  .loc 1 17
  .loc 1 17
  addi a0, fp, -8
  ld a0, 0(a0)
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  addw a0, a0, a1
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
  ld a1, 0(sp)
  addi sp, sp, 8
  addw a0, a0, a1
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 17
  .loc 1 17
  la a0, ans
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  ld a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  xor a0, a0, a1
  seqz a0, a0
  snez a0, a0
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 17
  la a0, check
  mv t5, a0
  # a0传递整型参数
  ld a0, 0(sp)
  addi sp, sp, 8
  # 调用函数
  jalr t5
.L..11:

# Inc语句2
  .loc 1 16
  .loc 1 16
  .loc 1 16
  .loc 1 16
  li a0, -1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 16
  .loc 1 16
  .loc 1 16
  addi a0, fp, -16
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 16
  .loc 1 16
  addi a0, fp, -32
  ld a1, 0(sp)
  addi sp, sp, 8
  sd a0, 0(a1)
  .loc 1 16
  .loc 1 16
  addi a0, fp, -16
  ld a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 16
  .loc 1 16
  .loc 1 16
  .loc 1 16
  li a0, 1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 16
  .loc 1 16
  .loc 1 16
  addi a0, fp, -16
  ld a0, 0(a0)
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  addw a0, a0, a1
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
  ld a1, 0(sp)
  addi sp, sp, 8
  addw a0, a0, a1
  j .L.begin.2
.L..10:
  .loc 1 19
  .loc 1 19
  # 整型0值通过a0传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 19
  .loc 1 19
  .loc 2 11
  .loc 2 11
  .loc 2 11
  .loc 2 11
  li a0, 4
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 2 11
  .loc 2 11
  li a0, 16
  ld a1, 0(sp)
  addi sp, sp, 8
  divu a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 19
  .loc 1 19
  addi a0, fp, -32
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  xor a0, a0, a1
  seqz a0, a0
  snez a0, a0
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 19
  la a0, check
  mv t5, a0
  # a0传递整型参数
  ld a0, 0(sp)
  addi sp, sp, 8
  # 调用函数
  jalr t5
.L..9:

# Inc语句1
  .loc 1 15
  .loc 1 15
  .loc 1 15
  .loc 1 15
  li a0, -1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 15
  .loc 1 15
  .loc 1 15
  addi a0, fp, -24
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 15
  .loc 1 15
  addi a0, fp, -36
  ld a1, 0(sp)
  addi sp, sp, 8
  sd a0, 0(a1)
  .loc 1 15
  .loc 1 15
  addi a0, fp, -24
  ld a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 15
  .loc 1 15
  .loc 1 15
  .loc 1 15
  li a0, 1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 15
  .loc 1 15
  .loc 1 15
  addi a0, fp, -24
  ld a0, 0(a0)
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  addw a0, a0, a1
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
  ld a1, 0(sp)
  addi sp, sp, 8
  addw a0, a0, a1
  j .L.begin.1
.L..8:
  .loc 1 22
  .loc 1 22
  # 整型0值通过a0传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 22
  .loc 1 22
  .loc 2 11
  .loc 2 11
  .loc 2 11
  .loc 2 11
  li a0, 4
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 2 11
  .loc 2 11
  li a0, 16
  ld a1, 0(sp)
  addi sp, sp, 8
  divu a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 22
  .loc 1 22
  addi a0, fp, -36
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  xor a0, a0, a1
  seqz a0, a0
  snez a0, a0
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 22
  la a0, check
  mv t5, a0
  # a0传递整型参数
  ld a0, 0(sp)
  addi sp, sp, 8
  # 调用函数
  jalr t5
  .loc 1 24
  .loc 1 24
  .loc 1 24
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
  .global mul
  .text
# =====mul段开始===============
  .type mul, @function
mul:
  addi sp, sp, -16
  sd ra, 8(sp)
  sd fp, 0(sp)
  mv fp, sp
  addi sp, sp, -32
  # 将当前的sp值，存入到Alloca区域的底部
  li t0, -16
  add t0, t0, fp
  sd sp, 0(t0)
  # 将整型形参a的寄存器a0的值压栈
  sd a0, -24(fp)
  # 将整型形参b的寄存器a1的值压栈
  sd a1, -32(fp)
# =====mul段主体===============
  .loc 1 6
  .loc 1 4
  .loc 1 4
  .loc 1 4
  .loc 1 4
  .loc 1 4
  .loc 1 4
  # 对ans的内存-8(fp)清零8位
  sd zero, -8(fp)
  .loc 1 4
  addi a0, fp, -8
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 4
  .loc 1 4
  .loc 1 4
  .loc 1 4
  addi a0, fp, -32
  ld a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 4
  .loc 1 4
  addi a0, fp, -24
  ld a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  ld a1, 0(sp)
  addi sp, sp, 8
  sd a0, 0(a1)
  .loc 1 5
  .loc 1 5
  .loc 1 5
  addi a0, fp, -8
  ld a0, 0(a0)
  j .L.return.mul
# =====mul段结束===============
.L.return.mul:
  mv sp, fp
  ld fp, 0(sp)
  ld ra, 8(sp)
  addi sp, sp, 16
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
  beqz a0, .L.else.3
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
  j .L.end.3
.L.else.3:
.L.end.3:
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
  beqz a0, .L.else.4
  .loc 2 26
  .loc 2 22
  # 插入的ASM代码片段
  li a0, 0
ebreak

  .loc 2 25
  j .L.end.4
.L.else.4:
  .loc 2 32
  .loc 2 28
  # 插入的ASM代码片段
  li a0, 1
ebreak

  .loc 2 31
.L.end.4:
# =====halt段结束===============
.L.return.halt:
  mv sp, fp
  ld fp, 0(sp)
  ld ra, 8(sp)
  addi sp, sp, 16
  ret
