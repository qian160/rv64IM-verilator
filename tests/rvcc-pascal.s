  .file 1 "pascal.c"
  .file 2 "include/trap.h"
  .file 3 "/home/s081/Downloads/projects/rvcc/include/stddef.h"
  .file 4 "/home/s081/Downloads/projects/rvcc/include/stdbool.h"
 #  寄存器传递变量偏移量-8
 #  寄存器传递变量偏移量-16
 #  寄存器传递变量偏移量-24
 #  寄存器传递变量t1偏移量-28
 #  寄存器传递变量t0偏移量-32
 #  寄存器传递变量j偏移量-36
 #  寄存器传递变量i偏移量-40
 #  寄存器传递变量__alloca_size__偏移量-48
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
  .global ans
  .data
  .type ans, @object
  .size ans, 124
  .align 4
ans:
  .byte 1
  .byte 0
  .byte 0
  .byte 0
  .byte 30
  .byte 0
  .byte 0
  .byte 0
  .byte -77
  .byte 1
  .byte 0
  .byte 0
  .byte -36
  .byte 15
  .byte 0
  .byte 0
  .byte 13
  .byte 107	# 字符：k
  .byte 0
  .byte 0
  .byte -86
  .byte 44	# 字符：,
  .byte 2
  .byte 0
  .byte 111	# 字符：o
  .byte 15
  .byte 9
  .byte 0
  .byte 88	# 字符：X
  .byte 16
  .byte 31
  .byte 0
  .byte -3
  .byte 78	# 字符：N
  .byte 89	# 字符：Y
  .byte 0
  .byte 78	# 字符：N
  .byte 79	# 字符：O
  .byte -38
  .byte 0
  .byte 87	# 字符：W
  .byte 115	# 字符：s
  .byte -54
  .byte 1
  .byte -28
  .byte -117
  .byte 65	# 字符：A
  .byte 3
  .byte 41	# 字符：)
  .byte -56
  .byte 39	# 字符：'
  .byte 5
  .byte -22
  .byte 99	# 字符：c
  .byte 35	# 字符：#
  .byte 7
  .byte 83	# 字符：S
  .byte -7
  .byte -86
  .byte 8
  .byte -48
  .byte -25
  .byte 62	# 字符：>
  .byte 9
  .byte 83	# 字符：S
  .byte -7
  .byte -86
  .byte 8
  .byte -22
  .byte 99	# 字符：c
  .byte 35	# 字符：#
  .byte 7
  .byte 41	# 字符：)
  .byte -56
  .byte 39	# 字符：'
  .byte 5
  .byte -28
  .byte -117
  .byte 65	# 字符：A
  .byte 3
  .byte 87	# 字符：W
  .byte 115	# 字符：s
  .byte -54
  .byte 1
  .byte 78	# 字符：N
  .byte 79	# 字符：O
  .byte -38
  .byte 0
  .byte -3
  .byte 78	# 字符：N
  .byte 89	# 字符：Y
  .byte 0
  .byte 88	# 字符：X
  .byte 16
  .byte 31
  .byte 0
  .byte 111	# 字符：o
  .byte 15
  .byte 9
  .byte 0
  .byte -86
  .byte 44	# 字符：,
  .byte 2
  .byte 0
  .byte 13
  .byte 107	# 字符：k
  .byte 0
  .byte 0
  .byte -36
  .byte 15
  .byte 0
  .byte 0
  .byte -77
  .byte 1
  .byte 0
  .byte 0
  .byte 30
  .byte 0
  .byte 0
  .byte 0
  .byte 1
  .byte 0
  .byte 0
  .byte 0
  .global a
  .comm a, 124, 16
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
  .loc 1 30
  .loc 1 9
  .loc 1 9
  .loc 1 9
  .loc 1 9
  .loc 1 9
  .loc 1 10
  .loc 1 10
  .loc 1 10
  .loc 1 10
  .loc 1 10
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
  li a0, 0
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 11
  .loc 1 11
  la a0, a
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
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
  li a0, 1
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 11
  .loc 1 11
  la a0, a
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 11
  .loc 1 11
  li a0, 1
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
  .loc 1 13
  .loc 1 13
  .loc 1 13
  addi a0, fp, -40
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 13
  .loc 1 13
  li a0, 2
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
.L.begin.1:
  .loc 1 13
  .loc 1 3
  .loc 1 3
  li a0, 31
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 13
  .loc 1 13
  addi a0, fp, -40
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  slt a0, a0, a1
  beqz a0, .L..6
  .loc 1 21
  .loc 1 14
  .loc 1 14
  addi a0, fp, -32
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 14
  .loc 1 14
  li a0, 1
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
  li a0, 1
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
.L.begin.2:
  .loc 1 15
  .loc 1 15
  .loc 1 15
  addi a0, fp, -40
  lw a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 15
  .loc 1 15
  addi a0, fp, -36
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  slt a0, a0, a1
  beqz a0, .L..8
  .loc 1 19
  .loc 1 16
  .loc 1 16
  addi a0, fp, -28
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 16
  .loc 1 16
  .loc 1 16
  .loc 1 16
  .loc 1 16
  .loc 1 16
  .loc 1 16
  li a0, 4
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 16
  .loc 1 16
  addi a0, fp, -36
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 16
  .loc 1 16
  la a0, a
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
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
  la a0, a
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 17
  .loc 1 17
  .loc 1 17
  .loc 1 17
  addi a0, fp, -28
  lw a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 17
  .loc 1 17
  addi a0, fp, -32
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  addw a0, a0, a1
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
  .loc 1 18
  .loc 1 18
  addi a0, fp, -32
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 18
  .loc 1 18
  addi a0, fp, -28
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
.L..9:

# Inc语句2
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
  addi a0, fp, -16
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
  addi a0, fp, -16
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
.L..8:
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
  addi a0, fp, -40
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 20
  .loc 1 20
  la a0, a
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 20
  .loc 1 20
  li a0, 1
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
.L..7:

# Inc语句1
  .loc 1 13
  .loc 1 13
  .loc 1 13
  .loc 1 13
  li a0, -1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 13
  .loc 1 13
  .loc 1 13
  addi a0, fp, -24
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 13
  .loc 1 13
  addi a0, fp, -40
  ld a1, 0(sp)
  addi sp, sp, 8
  sd a0, 0(a1)
  .loc 1 13
  .loc 1 13
  addi a0, fp, -24
  ld a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 13
  .loc 1 13
  .loc 1 13
  .loc 1 13
  li a0, 1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 13
  .loc 1 13
  .loc 1 13
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
.L..6:
  .loc 1 23
  .loc 1 23
  .loc 1 23
  addi a0, fp, -36
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 23
  .loc 1 23
  li a0, 0
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
.L.begin.3:
  .loc 1 23
  .loc 1 3
  .loc 1 3
  li a0, 31
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 23
  .loc 1 23
  addi a0, fp, -36
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  slt a0, a0, a1
  beqz a0, .L..10
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
  addi a0, fp, -36
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 24
  .loc 1 24
  la a0, ans
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  lw a0, 0(a0)
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
  addi a0, fp, -36
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 24
  .loc 1 24
  la a0, a
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
.L..11:

# Inc语句3
  .loc 1 23
  .loc 1 23
  .loc 1 23
  .loc 1 23
  li a0, -1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 23
  .loc 1 23
  .loc 1 23
  addi a0, fp, -8
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 23
  .loc 1 23
  addi a0, fp, -36
  ld a1, 0(sp)
  addi sp, sp, 8
  sd a0, 0(a1)
  .loc 1 23
  .loc 1 23
  addi a0, fp, -8
  ld a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
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
  j .L.begin.3
.L..10:
  .loc 1 27
  .loc 1 27
  # 整型0值通过a0传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 27
  .loc 1 27
  .loc 1 3
  .loc 1 3
  li a0, 31
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 27
  .loc 1 27
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
  .loc 1 27
  la a0, check
  mv t5, a0
  # a0传递整型参数
  ld a0, 0(sp)
  addi sp, sp, 8
  # 调用函数
  jalr t5
  .loc 1 29
  .loc 1 29
  .loc 1 29
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
