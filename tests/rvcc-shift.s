  .file 1 "shift.c"
  .file 2 "include/trap.h"
  .file 3 "/home/s081/Downloads/projects/rvcc/include/stddef.h"
  .file 4 "/home/s081/Downloads/projects/rvcc/include/stdbool.h"
 #  寄存器传递变量偏移量-8
 #  寄存器传递变量偏移量-16
 #  寄存器传递变量偏移量-24
 #  寄存器传递变量i偏移量-28
 #  寄存器传递变量__alloca_size__偏移量-40
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
  .global srav_ans
  .data
  .type srav_ans, @object
  .size srav_ans, 32
  .align 4
srav_ans:
  .byte 103	# 字符：g
  .byte 69	# 字符：E
  .byte 35	# 字符：#
  .byte 1
  .byte -95
  .byte -78
  .byte -61
  .byte -4
  .byte 0
  .byte 0
  .byte 0
  .byte 0
  .byte 32	# 字符： 
  .byte -12
  .byte -33
  .byte -1
  .byte -1
  .byte -1
  .byte 127
  .byte 0
  .byte 0
  .byte 0
  .byte -64
  .byte -1
  .byte 0
  .byte 0
  .byte 0
  .byte 0
  .byte -1
  .byte -1
  .byte -1
  .byte -1
  .global srlv_ans
  .data
  .type srlv_ans, @object
  .size srlv_ans, 32
  .align 4
srlv_ans:
  .byte 103	# 字符：g
  .byte 69	# 字符：E
  .byte 35	# 字符：#
  .byte 1
  .byte -95
  .byte -78
  .byte -61
  .byte 4
  .byte 0
  .byte 0
  .byte 0
  .byte 0
  .byte 32	# 字符： 
  .byte -12
  .byte -33
  .byte 1
  .byte -1
  .byte -1
  .byte 127
  .byte 0
  .byte 0
  .byte 0
  .byte 64	# 字符：@
  .byte 0
  .byte 0
  .byte 0
  .byte 0
  .byte 0
  .byte -1
  .byte -1
  .byte 31
  .byte 0
  .global srl_ans
  .data
  .type srl_ans, @object
  .size srl_ans, 32
  .align 4
srl_ans:
  .byte -84
  .byte 104	# 字符：h
  .byte 36	# 字符：$
  .byte 0
  .byte -88
  .byte -20
  .byte 48	# 字符：0
  .byte 1
  .byte 0
  .byte 0
  .byte 0
  .byte 0
  .byte 32	# 字符： 
  .byte -12
  .byte -33
  .byte 1
  .byte -1
  .byte -1
  .byte -1
  .byte 0
  .byte 0
  .byte 0
  .byte 0
  .byte 1
  .byte 0
  .byte 0
  .byte 0
  .byte 0
  .byte -1
  .byte -1
  .byte -1
  .byte 1
  .global test
  .data
  .type test, @object
  .size test, 32
  .align 4
test:
  .byte 120	# 字符：x
  .byte 86	# 字符：V
  .byte 52	# 字符：4
  .byte 18
  .byte 50	# 字符：2
  .byte 84	# 字符：T
  .byte 118	# 字符：v
  .byte -104
  .byte 0
  .byte 0
  .byte 0
  .byte 0
  .byte 0
  .byte 16
  .byte -6
  .byte -17
  .byte -1
  .byte -1
  .byte -1
  .byte 127
  .byte 0
  .byte 0
  .byte 0
  .byte -128
  .byte 51	# 字符：3
  .byte 0
  .byte 0
  .byte 0
  .byte -1
  .byte -1
  .byte -1
  .byte -1
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
  li t0, -40
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
  .loc 1 36
  .loc 1 21
  .loc 1 21
  .loc 1 21
  .loc 1 23
  .loc 1 23
  .loc 1 23
  addi a0, fp, -28
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 23
  .loc 1 23
  li a0, 0
  # 转换为u32类型
  slli a0, a0, 32
  srli a0, a0, 32
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
.L.begin.1:
  .loc 1 23
  .loc 2 11
  .loc 2 11
  .loc 2 11
  .loc 2 11
  li a0, 4
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 2 11
  .loc 2 11
  li a0, 32
  ld a1, 0(sp)
  addi sp, sp, 8
  divu a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 23
  .loc 1 23
  addi a0, fp, -28
  lwu a0, 0(a0)
  # u32转换为i64类型
  slli a0, a0, 32
  srli a0, a0, 32
  ld a1, 0(sp)
  addi sp, sp, 8
  sltu a0, a0, a1
  beqz a0, .L..6
  .loc 1 25
  .loc 1 24
  .loc 1 24
  # 整型0值通过a0传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 24
  .loc 1 24
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
  addi a0, fp, -28
  lwu a0, 0(a0)
  # u32转换为i64类型
  slli a0, a0, 32
  srli a0, a0, 32
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 24
  .loc 1 24
  la a0, srl_ans
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  lwu a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 24
  .loc 1 24
  .loc 1 24
  li a0, 7
  addi sp, sp, -8
  sd a0, 0(sp)
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
  addi a0, fp, -28
  lwu a0, 0(a0)
  # u32转换为i64类型
  slli a0, a0, 32
  srli a0, a0, 32
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 24
  .loc 1 24
  la a0, test
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  lwu a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  srlw a0, a0, a1
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
  .loc 1 24
  la a0, check
  mv t5, a0
  # a0传递整型参数
  ld a0, 0(sp)
  addi sp, sp, 8
  # 调用函数
  jalr t5
.L..7:

# Inc语句1
  .loc 1 23
  .loc 1 23
  .loc 1 23
  .loc 1 23
  li a0, -1
  # 转换为u32类型
  slli a0, a0, 32
  srli a0, a0, 32
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 23
  .loc 1 23
  .loc 1 23
  addi a0, fp, -24
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 23
  .loc 1 23
  addi a0, fp, -28
  ld a1, 0(sp)
  addi sp, sp, 8
  sd a0, 0(a1)
  .loc 1 23
  .loc 1 23
  addi a0, fp, -24
  ld a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 23
  .loc 1 23
  .loc 1 23
  .loc 1 23
  li a0, 1
  # 转换为u32类型
  slli a0, a0, 32
  srli a0, a0, 32
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 23
  .loc 1 23
  .loc 1 23
  addi a0, fp, -24
  ld a0, 0(a0)
  lwu a0, 0(a0)
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
.L..6:
  .loc 1 27
  .loc 1 27
  .loc 1 27
  addi a0, fp, -28
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 27
  .loc 1 27
  li a0, 0
  # 转换为u32类型
  slli a0, a0, 32
  srli a0, a0, 32
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
.L.begin.2:
  .loc 1 27
  .loc 2 11
  .loc 2 11
  .loc 2 11
  .loc 2 11
  li a0, 4
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 2 11
  .loc 2 11
  li a0, 32
  ld a1, 0(sp)
  addi sp, sp, 8
  divu a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 27
  .loc 1 27
  addi a0, fp, -28
  lwu a0, 0(a0)
  # u32转换为i64类型
  slli a0, a0, 32
  srli a0, a0, 32
  ld a1, 0(sp)
  addi sp, sp, 8
  sltu a0, a0, a1
  beqz a0, .L..8
  .loc 1 29
  .loc 1 28
  .loc 1 28
  # 整型0值通过a0传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 28
  .loc 1 28
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
  addi a0, fp, -28
  lwu a0, 0(a0)
  # u32转换为i64类型
  slli a0, a0, 32
  srli a0, a0, 32
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 28
  .loc 1 28
  la a0, srav_ans
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  lwu a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 28
  .loc 1 28
  .loc 1 28
  .loc 1 28
  .loc 1 28
  .loc 1 28
  li a0, 4
  # 转换为u32类型
  slli a0, a0, 32
  srli a0, a0, 32
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 28
  .loc 1 28
  addi a0, fp, -28
  lwu a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  addw a0, a0, a1
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
  addi a0, fp, -28
  lwu a0, 0(a0)
  # u32转换为i64类型
  slli a0, a0, 32
  srli a0, a0, 32
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 28
  .loc 1 28
  la a0, test
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  lwu a0, 0(a0)
  # 转换为i32类型
  slli a0, a0, 32
  srai a0, a0, 32
  ld a1, 0(sp)
  addi sp, sp, 8
  sraw a0, a0, a1
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
  .loc 1 28
  la a0, check
  mv t5, a0
  # a0传递整型参数
  ld a0, 0(sp)
  addi sp, sp, 8
  # 调用函数
  jalr t5
.L..9:

# Inc语句2
  .loc 1 27
  .loc 1 27
  .loc 1 27
  .loc 1 27
  li a0, -1
  # 转换为u32类型
  slli a0, a0, 32
  srli a0, a0, 32
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 27
  .loc 1 27
  .loc 1 27
  addi a0, fp, -16
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 27
  .loc 1 27
  addi a0, fp, -28
  ld a1, 0(sp)
  addi sp, sp, 8
  sd a0, 0(a1)
  .loc 1 27
  .loc 1 27
  addi a0, fp, -16
  ld a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 27
  .loc 1 27
  .loc 1 27
  .loc 1 27
  li a0, 1
  # 转换为u32类型
  slli a0, a0, 32
  srli a0, a0, 32
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 27
  .loc 1 27
  .loc 1 27
  addi a0, fp, -16
  ld a0, 0(a0)
  lwu a0, 0(a0)
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
.L..8:
  .loc 1 31
  .loc 1 31
  .loc 1 31
  addi a0, fp, -28
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 31
  .loc 1 31
  li a0, 0
  # 转换为u32类型
  slli a0, a0, 32
  srli a0, a0, 32
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
.L.begin.3:
  .loc 1 31
  .loc 2 11
  .loc 2 11
  .loc 2 11
  .loc 2 11
  li a0, 4
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 2 11
  .loc 2 11
  li a0, 32
  ld a1, 0(sp)
  addi sp, sp, 8
  divu a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 31
  .loc 1 31
  addi a0, fp, -28
  lwu a0, 0(a0)
  # u32转换为i64类型
  slli a0, a0, 32
  srli a0, a0, 32
  ld a1, 0(sp)
  addi sp, sp, 8
  sltu a0, a0, a1
  beqz a0, .L..10
  .loc 1 33
  .loc 1 32
  .loc 1 32
  # 整型0值通过a0传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 32
  .loc 1 32
  .loc 1 32
  .loc 1 32
  .loc 1 32
  .loc 1 32
  .loc 1 32
  .loc 1 32
  .loc 1 32
  li a0, 4
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 32
  .loc 1 32
  addi a0, fp, -28
  lwu a0, 0(a0)
  # u32转换为i64类型
  slli a0, a0, 32
  srli a0, a0, 32
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 32
  .loc 1 32
  la a0, srlv_ans
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  lwu a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 32
  .loc 1 32
  .loc 1 32
  .loc 1 32
  .loc 1 32
  li a0, 4
  # 转换为u32类型
  slli a0, a0, 32
  srli a0, a0, 32
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 32
  .loc 1 32
  addi a0, fp, -28
  lwu a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  addw a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 32
  .loc 1 32
  .loc 1 32
  .loc 1 32
  .loc 1 32
  .loc 1 32
  li a0, 4
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 32
  .loc 1 32
  addi a0, fp, -28
  lwu a0, 0(a0)
  # u32转换为i64类型
  slli a0, a0, 32
  srli a0, a0, 32
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 32
  .loc 1 32
  la a0, test
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  lwu a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  srlw a0, a0, a1
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
  .loc 1 32
  la a0, check
  mv t5, a0
  # a0传递整型参数
  ld a0, 0(sp)
  addi sp, sp, 8
  # 调用函数
  jalr t5
.L..11:

# Inc语句3
  .loc 1 31
  .loc 1 31
  .loc 1 31
  .loc 1 31
  li a0, -1
  # 转换为u32类型
  slli a0, a0, 32
  srli a0, a0, 32
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 31
  .loc 1 31
  .loc 1 31
  addi a0, fp, -8
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 31
  .loc 1 31
  addi a0, fp, -28
  ld a1, 0(sp)
  addi sp, sp, 8
  sd a0, 0(a1)
  .loc 1 31
  .loc 1 31
  addi a0, fp, -8
  ld a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 31
  .loc 1 31
  .loc 1 31
  .loc 1 31
  li a0, 1
  # 转换为u32类型
  slli a0, a0, 32
  srli a0, a0, 32
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 31
  .loc 1 31
  .loc 1 31
  addi a0, fp, -8
  ld a0, 0(a0)
  lwu a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  addw a0, a0, a1
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
  ld a1, 0(sp)
  addi sp, sp, 8
  addw a0, a0, a1
  j .L.begin.3
.L..10:
  .loc 1 35
  .loc 1 35
  .loc 1 35
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
  beqz a0, .L.else.4
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
  j .L.end.4
.L.else.4:
.L.end.4:
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
  beqz a0, .L.else.5
  .loc 2 26
  .loc 2 22
  # 插入的ASM代码片段
  li a0, 0
ebreak

  .loc 2 25
  j .L.end.5
.L.else.5:
  .loc 2 32
  .loc 2 28
  # 插入的ASM代码片段
  li a0, 1
ebreak

  .loc 2 31
.L.end.5:
# =====halt段结束===============
.L.return.halt:
  mv sp, fp
  ld fp, 0(sp)
  ld ra, 8(sp)
  addi sp, sp, 16
  ret
