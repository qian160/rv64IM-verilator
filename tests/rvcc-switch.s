  .file 1 "switch.c"
  .file 2 "include/trap.h"
  .file 3 "/home/s081/Downloads/projects/rvcc/include/stddef.h"
  .file 4 "/home/s081/Downloads/projects/rvcc/include/stdbool.h"
 #  寄存器传递变量偏移量-8
 #  寄存器传递变量i偏移量-12
 #  寄存器传递变量__alloca_size__偏移量-24
 #  GP0传递整型变量n
 #  寄存器传递变量ret偏移量-4
 #  寄存器传递变量__alloca_size__偏移量-16
 #  寄存器传递变量n偏移量-20
 #  GP0传递整型变量cond
 #  寄存器传递变量__alloca_size__偏移量-8
 #  寄存器传递变量cond偏移量-9
 #  GP0传递整型变量code
 #  寄存器传递变量__alloca_size__偏移量-8
 #  寄存器传递变量code偏移量-12
  .local .L..22
  .data
  .type .L..22, @object
  .size .L..22, 5
  .align 0
.L..22:
  .byte 109	# 字符：m
  .byte 97	# 字符：a
  .byte 105	# 字符：i
  .byte 110	# 字符：n
  .byte 0
  .local .L..21
  .data
  .type .L..21, @object
  .size .L..21, 5
  .align 0
.L..21:
  .byte 109	# 字符：m
  .byte 97	# 字符：a
  .byte 105	# 字符：i
  .byte 110	# 字符：n
  .byte 0
  .global ans
  .data
  .type ans, @object
  .size ans, 60
  .align 4
ans:
  .byte -1
  .byte -1
  .byte -1
  .byte -1
  .byte 0
  .byte 0
  .byte 0
  .byte 0
  .byte 2
  .byte 0
  .byte 0
  .byte 0
  .byte 5
  .byte 0
  .byte 0
  .byte 0
  .byte 5
  .byte 0
  .byte 0
  .byte 0
  .byte 8
  .byte 0
  .byte 0
  .byte 0
  .byte 8
  .byte 0
  .byte 0
  .byte 0
  .byte 8
  .byte 0
  .byte 0
  .byte 0
  .byte 8
  .byte 0
  .byte 0
  .byte 0
  .byte 10
  .byte 0
  .byte 0
  .byte 0
  .byte 10
  .byte 0
  .byte 0
  .byte 0
  .byte 10
  .byte 0
  .byte 0
  .byte 0
  .byte 10
  .byte 0
  .byte 0
  .byte 0
  .byte 15
  .byte 0
  .byte 0
  .byte 0
  .byte -1
  .byte -1
  .byte -1
  .byte -1
  .local .L..5
  .data
  .type .L..5, @object
  .size .L..5, 12
  .align 0
.L..5:
  .byte 115	# 字符：s
  .byte 119	# 字符：w
  .byte 105	# 字符：i
  .byte 116	# 字符：t
  .byte 99	# 字符：c
  .byte 104	# 字符：h
  .byte 95	# 字符：_
  .byte 99	# 字符：c
  .byte 97	# 字符：a
  .byte 115	# 字符：s
  .byte 101	# 字符：e
  .byte 0
  .local .L..4
  .data
  .type .L..4, @object
  .size .L..4, 12
  .align 0
.L..4:
  .byte 115	# 字符：s
  .byte 119	# 字符：w
  .byte 105	# 字符：i
  .byte 116	# 字符：t
  .byte 99	# 字符：c
  .byte 104	# 字符：h
  .byte 95	# 字符：_
  .byte 99	# 字符：c
  .byte 97	# 字符：a
  .byte 115	# 字符：s
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
  .loc 1 29
  .loc 1 21
  .loc 1 21
  .loc 1 21
  .loc 1 22
  .loc 1 22
  .loc 1 22
  addi a0, fp, -12
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 22
  .loc 1 22
  li a0, 0
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
.L.begin.1:
  .loc 1 22
  .loc 1 22
  .loc 1 22
  li a0, 15
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 22
  .loc 1 22
  addi a0, fp, -12
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  slt a0, a0, a1
  beqz a0, .L..23
  .loc 1 24
  .loc 1 23
  .loc 1 23
  # 整型0值通过a0传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 23
  .loc 1 23
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
  addi a0, fp, -12
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 23
  .loc 1 23
  la a0, ans
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  lw a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 23
  .loc 1 23
  # 整型0值通过a0传递
  # 对齐栈边界到16字节
  addi sp, sp, -8

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
  addi a0, fp, -12
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  subw a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 23
  la a0, switch_case
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
  .loc 1 23
  la a0, check
  mv t5, a0
  # a0传递整型参数
  ld a0, 0(sp)
  addi sp, sp, 8
  # 调用函数
  jalr t5
.L..24:

# Inc语句1
  .loc 1 22
  .loc 1 22
  .loc 1 22
  .loc 1 22
  li a0, -1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 22
  .loc 1 22
  .loc 1 22
  addi a0, fp, -8
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 22
  .loc 1 22
  addi a0, fp, -12
  ld a1, 0(sp)
  addi sp, sp, 8
  sd a0, 0(a1)
  .loc 1 22
  .loc 1 22
  addi a0, fp, -8
  ld a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 22
  .loc 1 22
  .loc 1 22
  .loc 1 22
  li a0, 1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 22
  .loc 1 22
  .loc 1 22
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
  j .L.begin.1
.L..23:
  .loc 1 26
  .loc 1 26
  # 整型0值通过a0传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 26
  .loc 1 26
  .loc 1 26
  .loc 1 26
  li a0, 15
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 26
  .loc 1 26
  addi a0, fp, -12
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
  .loc 1 28
  .loc 1 28
  .loc 1 28
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
  .global switch_case
  .text
# =====switch_case段开始===============
  .type switch_case, @function
switch_case:
  addi sp, sp, -16
  sd ra, 8(sp)
  sd fp, 0(sp)
  mv fp, sp
  addi sp, sp, -32
  # 将当前的sp值，存入到Alloca区域的底部
  li t0, -16
  add t0, t0, fp
  sd sp, 0(t0)
  # 将整型形参n的寄存器a0的值压栈
  sw a0, -20(fp)
# =====switch_case段主体===============
  .loc 1 16
  .loc 1 4
  .loc 1 4
  .loc 1 4
  .loc 1 5

# =====switch语句===============
  .loc 1 5
  addi a0, fp, -20
  lw a0, 0(a0)
  # 遍历跳转到值等于a0的case标签
  li t0, 12
  beq a0, t0, .L..19
  li t0, 8
  beq a0, t0, .L..15
  li t0, 9
  beq a0, t0, .L..16
  li t0, 10
  beq a0, t0, .L..17
  li t0, 11
  beq a0, t0, .L..18
  li t0, 4
  beq a0, t0, .L..11
  li t0, 5
  beq a0, t0, .L..12
  li t0, 6
  beq a0, t0, .L..13
  li t0, 7
  beq a0, t0, .L..14
  li t0, 2
  beq a0, t0, .L..9
  li t0, 3
  beq a0, t0, .L..10
  li t0, 1
  beq a0, t0, .L..8
  li t0, 0
  beq a0, t0, .L..7
  # 跳转到default标签
  j .L..20
  # 结束switch，跳转break标签
  j .L..6
  .loc 1 13
  .loc 1 6
# case标签，值为0
.L..7:
  .loc 1 6
  .loc 1 6
  addi a0, fp, -4
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 6
  .loc 1 6
  li a0, 0
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
  .loc 1 6
  j .L..6
  .loc 1 7
# case标签，值为0
.L..8:
  .loc 1 7
  .loc 1 7
  addi a0, fp, -4
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 7
  .loc 1 7
  li a0, 2
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
  .loc 1 7
  j .L..6
  .loc 1 8
# case标签，值为0
.L..9:
  .loc 1 8
# case标签，值为0
.L..10:
  .loc 1 8
  .loc 1 8
  addi a0, fp, -4
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 8
  .loc 1 8
  li a0, 5
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
  .loc 1 8
  j .L..6
  .loc 1 9
# case标签，值为0
.L..11:
  .loc 1 9
# case标签，值为0
.L..12:
  .loc 1 9
# case标签，值为0
.L..13:
  .loc 1 9
# case标签，值为0
.L..14:
  .loc 1 9
  .loc 1 9
  addi a0, fp, -4
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 9
  .loc 1 9
  li a0, 8
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
  .loc 1 9
  j .L..6
  .loc 1 10
# case标签，值为0
.L..15:
  .loc 1 10
# case标签，值为0
.L..16:
  .loc 1 10
# case标签，值为0
.L..17:
  .loc 1 10
# case标签，值为0
.L..18:
  .loc 1 10
  .loc 1 10
  addi a0, fp, -4
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 10
  .loc 1 10
  li a0, 10
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
  .loc 1 10
  j .L..6
  .loc 1 11
# case标签，值为0
.L..19:
  .loc 1 11
  .loc 1 11
  addi a0, fp, -4
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 11
  .loc 1 11
  li a0, 15
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
  .loc 1 11
  j .L..6
  .loc 1 12
# case标签，值为0
.L..20:
  .loc 1 12
  .loc 1 12
  addi a0, fp, -4
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 12
  .loc 1 12
  .loc 1 12
  .loc 1 12
  li a0, 1
  negw a0, a0
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
  .loc 1 12
  j .L..6
# switch的break标签，结束switch
.L..6:
  .loc 1 15
  .loc 1 15
  .loc 1 15
  addi a0, fp, -4
  lw a0, 0(a0)
  j .L.return.switch_case
# =====switch_case段结束===============
.L.return.switch_case:
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
  beqz a0, .L.else.2
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
  j .L.end.2
.L.else.2:
.L.end.2:
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
  beqz a0, .L.else.3
  .loc 2 26
  .loc 2 22
  # 插入的ASM代码片段
  li a0, 0
ebreak

  .loc 2 25
  j .L.end.3
.L.else.3:
  .loc 2 32
  .loc 2 28
  # 插入的ASM代码片段
  li a0, 1
ebreak

  .loc 2 31
.L.end.3:
# =====halt段结束===============
.L.return.halt:
  mv sp, fp
  ld fp, 0(sp)
  ld ra, 8(sp)
  addi sp, sp, 16
  ret
