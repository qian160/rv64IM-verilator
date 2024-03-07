  .file 1 "memcpy.c"
  .file 2 "include/trap.h"
  .file 3 "/home/s081/Downloads/projects/rvcc/include/stddef.h"
  .file 4 "/home/s081/Downloads/projects/rvcc/include/stdbool.h"
 #  GP0传递整型变量argc
 #  GP1传递整型变量argv
 #  寄存器传递变量params_p偏移量-24
 #  寄存器传递变量__alloca_size__偏移量-32
 #  寄存器传递变量argc偏移量-36
 #  寄存器传递变量argv偏移量-48
 #  GP0传递整型变量params_p
 #  寄存器传递变量Info偏移量-16
 #  寄存器传递变量__alloca_size__偏移量-24
 #  寄存器传递变量params_p偏移量-32
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
  .local .L..5
  .data
  .type .L..5, @object
  .size .L..5, 10
  .align 0
.L..5:
  .byte 109	# 字符：m
  .byte 121	# 字符：y
  .byte 95	# 字符：_
  .byte 109	# 字符：m
  .byte 101	# 字符：e
  .byte 109	# 字符：m
  .byte 99	# 字符：c
  .byte 112	# 字符：p
  .byte 121	# 字符：y
  .byte 0
  .local .L..4
  .data
  .type .L..4, @object
  .size .L..4, 10
  .align 0
.L..4:
  .byte 109	# 字符：m
  .byte 121	# 字符：y
  .byte 95	# 字符：_
  .byte 109	# 字符：m
  .byte 101	# 字符：e
  .byte 109	# 字符：m
  .byte 99	# 字符：c
  .byte 112	# 字符：p
  .byte 121	# 字符：y
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
  addi sp, sp, -16
  sd ra, 8(sp)
  sd fp, 0(sp)
  mv fp, sp
  addi sp, sp, -48
  # 将当前的sp值，存入到Alloca区域的底部
  li t0, -32
  add t0, t0, fp
  sd sp, 0(t0)
  # 将整型形参argc的寄存器a0的值压栈
  sw a0, -36(fp)
  # 将整型形参argv的寄存器a1的值压栈
  sd a1, -48(fp)
# =====main段主体===============
  .loc 1 59
  .loc 1 57
  .loc 1 57
  .loc 1 57
  .loc 1 58
  .loc 1 58
  .loc 1 58
  # 整型0值通过a0传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 58
  .loc 1 58
  addi a0, fp, -24
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 58
  la a0, my_memcpy
  mv t5, a0
  # a0传递整型参数
  ld a0, 0(sp)
  addi sp, sp, 8
  # 调用函数
  jalr t5
  j .L.return.main
  li a0, 0
# =====main段结束===============
.L.return.main:
  mv sp, fp
  ld fp, 0(sp)
  ld ra, 8(sp)
  addi sp, sp, 16
  ret
  .global my_memcpy
  .text
# =====my_memcpy段开始===============
  .type my_memcpy, @function
my_memcpy:
  addi sp, sp, -16
  sd ra, 8(sp)
  sd fp, 0(sp)
  mv fp, sp
  addi sp, sp, -32
  # 将当前的sp值，存入到Alloca区域的底部
  li t0, -24
  add t0, t0, fp
  sd sp, 0(t0)
  # 将整型形参params_p的寄存器a0的值压栈
  sd a0, -32(fp)
# =====my_memcpy段主体===============
  .loc 1 52
  .loc 1 49
  .loc 1 49
  .loc 1 49
  .loc 1 50
  .loc 1 50
  # 整型0值通过a0传递
  # 整型0值通过a1传递
  # 整型0值通过a2传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 50
  .loc 1 50
  li a0, 4
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 50
  .loc 1 50
  .loc 1 50
  .loc 1 50
  .loc 1 50
  .loc 1 50
  .loc 1 50
  li a0, 4
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 50
  .loc 1 50
  li a0, 0
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 50
  .loc 1 50
  .loc 1 50
  addi a0, fp, -32
  ld a0, 0(a0)
  li t0, 8
  add a0, a0, t0
  ld a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 50
  .loc 1 50
  .loc 1 50
  .loc 1 50
  .loc 1 50
  .loc 1 50
  .loc 1 50
  li a0, 4
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 50
  .loc 1 50
  li a0, 0
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 50
  .loc 1 50
  addi a0, fp, -16
  li t0, 4
  add a0, a0, t0
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 50
  la a0, memcpy
  mv t5, a0
  # a0传递整型参数
  ld a0, 0(sp)
  addi sp, sp, 8
  # a1传递整型参数
  ld a1, 0(sp)
  addi sp, sp, 8
  # a2传递整型参数
  ld a2, 0(sp)
  addi sp, sp, 8
  # 调用函数
  jalr t5
  .loc 1 51
  .loc 1 51
  .loc 1 51
  .loc 1 51
  .loc 1 51
  .loc 1 51
  .loc 1 51
  .loc 1 51
  li a0, 4
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 51
  .loc 1 51
  li a0, 0
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 51
  .loc 1 51
  addi a0, fp, -16
  li t0, 4
  add a0, a0, t0
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  li t0, 0
  add a0, a0, t0
  lwu a0, 0(a0)
  # 清除位域的成员变量（4字节）未用到的位
  slli a0, a0, 32
  srli a0, a0, 60
  # 转换为i32类型
  slli a0, a0, 32
  srai a0, a0, 32
  j .L.return.my_memcpy
# =====my_memcpy段结束===============
.L.return.my_memcpy:
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
