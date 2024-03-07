  .file 1 "goldbach.c"
  .file 2 "include/trap.h"
  .file 3 "/home/s081/Downloads/projects/rvcc/include/stddef.h"
  .file 4 "/home/s081/Downloads/projects/rvcc/include/stdbool.h"
 #  寄存器传递变量偏移量-8
 #  寄存器传递变量n偏移量-12
 #  寄存器传递变量__alloca_size__偏移量-24
 #  GP0传递整型变量n
 #  寄存器传递变量偏移量-8
 #  寄存器传递变量i偏移量-12
 #  寄存器传递变量__alloca_size__偏移量-24
 #  寄存器传递变量n偏移量-28
 #  GP0传递整型变量n
 #  寄存器传递变量偏移量-8
 #  寄存器传递变量i偏移量-12
 #  寄存器传递变量__alloca_size__偏移量-24
 #  寄存器传递变量n偏移量-28
 #  GP0传递整型变量cond
 #  寄存器传递变量__alloca_size__偏移量-8
 #  寄存器传递变量cond偏移量-9
 #  GP0传递整型变量code
 #  寄存器传递变量__alloca_size__偏移量-8
 #  寄存器传递变量code偏移量-12
  .local .L..13
  .data
  .type .L..13, @object
  .size .L..13, 5
  .align 0
.L..13:
  .byte 109	# 字符：m
  .byte 97	# 字符：a
  .byte 105	# 字符：i
  .byte 110	# 字符：n
  .byte 0
  .local .L..12
  .data
  .type .L..12, @object
  .size .L..12, 5
  .align 0
.L..12:
  .byte 109	# 字符：m
  .byte 97	# 字符：a
  .byte 105	# 字符：i
  .byte 110	# 字符：n
  .byte 0
  .local .L..9
  .data
  .type .L..9, @object
  .size .L..9, 9
  .align 0
.L..9:
  .byte 103	# 字符：g
  .byte 111	# 字符：o
  .byte 108	# 字符：l
  .byte 100	# 字符：d
  .byte 98	# 字符：b
  .byte 97	# 字符：a
  .byte 99	# 字符：c
  .byte 104	# 字符：h
  .byte 0
  .local .L..8
  .data
  .type .L..8, @object
  .size .L..8, 9
  .align 0
.L..8:
  .byte 103	# 字符：g
  .byte 111	# 字符：o
  .byte 108	# 字符：l
  .byte 100	# 字符：d
  .byte 98	# 字符：b
  .byte 97	# 字符：a
  .byte 99	# 字符：c
  .byte 104	# 字符：h
  .byte 0
  .local .L..5
  .data
  .type .L..5, @object
  .size .L..5, 9
  .align 0
.L..5:
  .byte 105	# 字符：i
  .byte 115	# 字符：s
  .byte 95	# 字符：_
  .byte 112	# 字符：p
  .byte 114	# 字符：r
  .byte 105	# 字符：i
  .byte 109	# 字符：m
  .byte 101	# 字符：e
  .byte 0
  .local .L..4
  .data
  .type .L..4, @object
  .size .L..4, 9
  .align 0
.L..4:
  .byte 105	# 字符：i
  .byte 115	# 字符：s
  .byte 95	# 字符：_
  .byte 112	# 字符：p
  .byte 114	# 字符：r
  .byte 105	# 字符：i
  .byte 109	# 字符：m
  .byte 101	# 字符：e
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
  addi sp, sp, -32
  # 将当前的sp值，存入到Alloca区域的底部
  li t0, -24
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
  .loc 1 34
  .loc 1 28
  .loc 1 28
  .loc 1 28
  .loc 1 29
  .loc 1 29
  .loc 1 29
  addi a0, fp, -12
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 29
  .loc 1 29
  li a0, 4
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
.L.begin.1:
  .loc 1 29
  .loc 1 29
  .loc 1 29
  li a0, 30
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 29
  .loc 1 29
  addi a0, fp, -12
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  slt a0, a1, a0
  xori a0, a0, 1
  beqz a0, .L..14
  .loc 1 31
  .loc 1 30
  .loc 1 30
  # 整型0值通过a0传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 30
  .loc 1 30
  .loc 1 30
  .loc 1 30
  li a0, 1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 30
  .loc 1 30
  # 整型0值通过a0传递
  # 对齐栈边界到16字节
  addi sp, sp, -8

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 30
  .loc 1 30
  addi a0, fp, -12
  lw a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 30
  la a0, goldbach
  mv t5, a0
  # a0传递整型参数
  ld a0, 0(sp)
  addi sp, sp, 8
  # 调用函数
  jalr t5
  # 回收栈传递参数的8个字节
  addi sp, sp, 8
  ld a1, 0(sp)
  addi sp, sp, 8
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
.L..15:

# Inc语句1
  .loc 1 29
  .loc 1 29
  addi a0, fp, -8
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 29
  .loc 1 29
  addi a0, fp, -12
  ld a1, 0(sp)
  addi sp, sp, 8
  sd a0, 0(a1)
  .loc 1 29
  .loc 1 29
  addi a0, fp, -8
  ld a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 29
  .loc 1 29
  .loc 1 29
  .loc 1 29
  li a0, 2
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 29
  .loc 1 29
  .loc 1 29
  addi a0, fp, -8
  ld a0, 0(a0)
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  addw a0, a0, a1
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
  j .L.begin.1
.L..14:
  .loc 1 33
  .loc 1 33
  .loc 1 33
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
  .global goldbach
  .text
# =====goldbach段开始===============
  .type goldbach, @function
goldbach:
  addi sp, sp, -16
  sd ra, 8(sp)
  sd fp, 0(sp)
  mv fp, sp
  addi sp, sp, -32
  # 将当前的sp值，存入到Alloca区域的底部
  li t0, -24
  add t0, t0, fp
  sd sp, 0(t0)
  # 将整型形参n的寄存器a0的值压栈
  sw a0, -28(fp)
# =====goldbach段主体===============
  .loc 1 25
  .loc 1 17
  .loc 1 17
  .loc 1 17
  .loc 1 18
  .loc 1 18
  .loc 1 18
  addi a0, fp, -12
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 18
  .loc 1 18
  li a0, 2
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
.L.begin.2:
  .loc 1 18
  .loc 1 18
  .loc 1 18
  addi a0, fp, -28
  lw a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 18
  .loc 1 18
  addi a0, fp, -12
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  slt a0, a0, a1
  beqz a0, .L..10
  .loc 1 22
  .loc 1 19
  .loc 1 19
  .loc 1 19
  # 整型0值通过a0传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 19
  .loc 1 19
  addi a0, fp, -12
  lw a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 19
  la a0, is_prime
  mv t5, a0
  # a0传递整型参数
  ld a0, 0(sp)
  addi sp, sp, 8
  # 调用函数
  jalr t5
  beqz a0, .L.false.4
  .loc 1 19
  # 整型0值通过a0传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 19
  .loc 1 19
  .loc 1 19
  .loc 1 19
  addi a0, fp, -12
  lw a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 19
  .loc 1 19
  addi a0, fp, -28
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  subw a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 19
  la a0, is_prime
  mv t5, a0
  # a0传递整型参数
  ld a0, 0(sp)
  addi sp, sp, 8
  # 调用函数
  jalr t5
  beqz a0, .L.false.4
  li a0, 1
  j .L.end.4
.L.false.4:
  li a0, 0
.L.end.4:
  beqz a0, .L.else.3
  .loc 1 21
  .loc 1 20
  .loc 1 20
  .loc 1 20
  li a0, 1
  j .L.return.goldbach
  j .L.end.3
.L.else.3:
.L.end.3:
.L..11:

# Inc语句2
  .loc 1 18
  .loc 1 18
  .loc 1 18
  .loc 1 18
  li a0, -1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 18
  .loc 1 18
  .loc 1 18
  addi a0, fp, -8
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 18
  .loc 1 18
  addi a0, fp, -12
  ld a1, 0(sp)
  addi sp, sp, 8
  sd a0, 0(a1)
  .loc 1 18
  .loc 1 18
  addi a0, fp, -8
  ld a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 18
  .loc 1 18
  .loc 1 18
  .loc 1 18
  li a0, 1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 18
  .loc 1 18
  .loc 1 18
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
  j .L.begin.2
.L..10:
  .loc 1 24
  .loc 1 24
  .loc 1 24
  li a0, 0
  j .L.return.goldbach
# =====goldbach段结束===============
.L.return.goldbach:
  mv sp, fp
  ld fp, 0(sp)
  ld ra, 8(sp)
  addi sp, sp, 16
  ret
  .global is_prime
  .text
# =====is_prime段开始===============
  .type is_prime, @function
is_prime:
  addi sp, sp, -16
  sd ra, 8(sp)
  sd fp, 0(sp)
  mv fp, sp
  addi sp, sp, -32
  # 将当前的sp值，存入到Alloca区域的底部
  li t0, -24
  add t0, t0, fp
  sd sp, 0(t0)
  # 将整型形参n的寄存器a0的值压栈
  sw a0, -28(fp)
# =====is_prime段主体===============
  .loc 1 14
  .loc 1 4
  .loc 1 4
  .loc 1 4
  .loc 1 4
  li a0, 2
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 4
  .loc 1 4
  addi a0, fp, -28
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  slt a0, a0, a1
  beqz a0, .L.else.5
  .loc 1 4
  .loc 1 4
  .loc 1 4
  li a0, 0
  j .L.return.is_prime
  j .L.end.5
.L.else.5:
.L.end.5:
  .loc 1 6
  .loc 1 6
  .loc 1 6
  .loc 1 7
  .loc 1 7
  .loc 1 7
  addi a0, fp, -12
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 7
  .loc 1 7
  li a0, 2
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
.L.begin.6:
  .loc 1 7
  .loc 1 7
  .loc 1 7
  addi a0, fp, -28
  lw a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 7
  .loc 1 7
  addi a0, fp, -12
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  slt a0, a0, a1
  beqz a0, .L..6
  .loc 1 11
  .loc 1 8
  .loc 1 8
  .loc 1 8
  .loc 1 8
  li a0, 0
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 8
  .loc 1 8
  .loc 1 8
  .loc 1 8
  addi a0, fp, -12
  lw a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 8
  .loc 1 8
  addi a0, fp, -28
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  remw a0, a0, a1
  ld a1, 0(sp)
  addi sp, sp, 8
  xor a0, a0, a1
  seqz a0, a0
  beqz a0, .L.else.7
  .loc 1 10
  .loc 1 9
  .loc 1 9
  .loc 1 9
  li a0, 0
  j .L.return.is_prime
  j .L.end.7
.L.else.7:
.L.end.7:
.L..7:

# Inc语句6
  .loc 1 7
  .loc 1 7
  .loc 1 7
  .loc 1 7
  li a0, -1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 7
  .loc 1 7
  .loc 1 7
  addi a0, fp, -8
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 7
  .loc 1 7
  addi a0, fp, -12
  ld a1, 0(sp)
  addi sp, sp, 8
  sd a0, 0(a1)
  .loc 1 7
  .loc 1 7
  addi a0, fp, -8
  ld a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 7
  .loc 1 7
  .loc 1 7
  .loc 1 7
  li a0, 1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 7
  .loc 1 7
  .loc 1 7
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
  j .L.begin.6
.L..6:
  .loc 1 13
  .loc 1 13
  .loc 1 13
  li a0, 1
  j .L.return.is_prime
# =====is_prime段结束===============
.L.return.is_prime:
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
  beqz a0, .L.else.8
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
  j .L.end.8
.L.else.8:
.L.end.8:
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
  beqz a0, .L.else.9
  .loc 2 26
  .loc 2 22
  # 插入的ASM代码片段
  li a0, 0
ebreak

  .loc 2 25
  j .L.end.9
.L.else.9:
  .loc 2 32
  .loc 2 28
  # 插入的ASM代码片段
  li a0, 1
ebreak

  .loc 2 31
.L.end.9:
# =====halt段结束===============
.L.return.halt:
  mv sp, fp
  ld fp, 0(sp)
  ld ra, 8(sp)
  addi sp, sp, 16
  ret
