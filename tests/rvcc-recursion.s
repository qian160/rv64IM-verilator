  .file 1 "recursion.c"
  .file 2 "include/trap.h"
  .file 3 "/home/s081/Downloads/projects/rvcc/include/stddef.h"
  .file 4 "/home/s081/Downloads/projects/rvcc/include/stdbool.h"
 #  寄存器传递变量x偏移量-4
 #  寄存器传递变量__alloca_size__偏移量-16
 #  GP0传递整型变量n
 #  GP1传递整型变量l
 #  寄存器传递变量偏移量-8
 #  寄存器传递变量__alloca_size__偏移量-16
 #  寄存器传递变量n偏移量-20
 #  寄存器传递变量l偏移量-24
 #  GP0传递整型变量n
 #  GP1传递整型变量l
 #  寄存器传递变量偏移量-8
 #  寄存器传递变量__alloca_size__偏移量-16
 #  寄存器传递变量n偏移量-20
 #  寄存器传递变量l偏移量-24
 #  GP0传递整型变量n
 #  GP1传递整型变量l
 #  寄存器传递变量偏移量-8
 #  寄存器传递变量__alloca_size__偏移量-16
 #  寄存器传递变量n偏移量-20
 #  寄存器传递变量l偏移量-24
 #  GP0传递整型变量n
 #  GP1传递整型变量l
 #  寄存器传递变量偏移量-8
 #  寄存器传递变量__alloca_size__偏移量-16
 #  寄存器传递变量n偏移量-20
 #  寄存器传递变量l偏移量-24
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
  .global ans
  .data
  .type ans, @object
  .size ans, 12
  .align 2
ans:
  .byte 126	# 字符：~
  .byte -107
  .byte 0
  .byte 0
  .byte -38
  .byte 0
  .byte 0
  .byte 0
  .byte 20
  .byte 0
  .byte 0
  .byte 0
  .local .L..11
  .data
  .type .L..11, @object
  .size .L..11, 3
  .align 0
.L..11:
  .byte 102	# 字符：f
  .byte 51	# 字符：3
  .byte 0
  .local .L..10
  .data
  .type .L..10, @object
  .size .L..10, 3
  .align 0
.L..10:
  .byte 102	# 字符：f
  .byte 51	# 字符：3
  .byte 0
  .local .L..9
  .data
  .type .L..9, @object
  .size .L..9, 3
  .align 0
.L..9:
  .byte 102	# 字符：f
  .byte 50	# 字符：2
  .byte 0
  .local .L..8
  .data
  .type .L..8, @object
  .size .L..8, 3
  .align 0
.L..8:
  .byte 102	# 字符：f
  .byte 50	# 字符：2
  .byte 0
  .local .L..7
  .data
  .type .L..7, @object
  .size .L..7, 3
  .align 0
.L..7:
  .byte 102	# 字符：f
  .byte 49	# 字符：1
  .byte 0
  .local .L..6
  .data
  .type .L..6, @object
  .size .L..6, 3
  .align 0
.L..6:
  .byte 102	# 字符：f
  .byte 49	# 字符：1
  .byte 0
  .local .L..5
  .data
  .type .L..5, @object
  .size .L..5, 3
  .align 0
.L..5:
  .byte 102	# 字符：f
  .byte 48	# 字符：0
  .byte 0
  .local .L..4
  .data
  .type .L..4, @object
  .size .L..4, 3
  .align 0
.L..4:
  .byte 102	# 字符：f
  .byte 48	# 字符：0
  .byte 0
  .global lvl
  .data
  .type lvl, @object
  .size lvl, 4
  .align 2
lvl:
  .byte 0
  .byte 0
  .byte 0
  .byte 0
  .global rec
  .data
  .type rec, @object
  .size rec, 4
  .align 2
rec:
  .byte 0
  .byte 0
  .byte 0
  .byte 0
  .global func
  .data
  .type func, @object
  .size func, 32
  .align 4
func:
  # func全局变量
  .quad f0+0
  # func全局变量
  .quad f1+0
  # func全局变量
  .quad f2+0
  # func全局变量
  .quad f3+0
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
  li t0, -16
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
  .loc 1 46
  .loc 1 41
  .loc 1 41
  .loc 1 41
  .loc 1 41
  .loc 1 41
  .loc 1 41
  # 对x的内存-4(fp)清零4位
  sw zero, -4(fp)
  .loc 1 41
  addi a0, fp, -4
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 41
  .loc 1 41
  # 整型0值通过a0传递
  # 整型0值通过a1传递
  # 对齐栈边界到16字节
  addi sp, sp, -8

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 41
  .loc 1 41
  li a0, 0
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 41
  .loc 1 41
  li a0, 14371
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 41
  .loc 1 41
  .loc 1 41
  .loc 1 41
  .loc 1 41
  .loc 1 41
  li a0, 8
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 41
  .loc 1 41
  li a0, 0
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 41
  .loc 1 41
  la a0, func
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  ld a0, 0(a0)
  mv t5, a0
  # a0传递整型参数
  ld a0, 0(sp)
  addi sp, sp, 8
  # a1传递整型参数
  ld a1, 0(sp)
  addi sp, sp, 8
  # 调用函数
  jalr t5
  # 回收栈传递参数的8个字节
  addi sp, sp, 8
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
  .loc 1 42
  .loc 1 42
  # 整型0值通过a0传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 42
  .loc 1 42
  .loc 1 42
  .loc 1 42
  .loc 1 42
  .loc 1 42
  .loc 1 42
  .loc 1 42
  .loc 1 42
  li a0, 4
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 42
  .loc 1 42
  li a0, 0
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 42
  .loc 1 42
  la a0, ans
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  lw a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 42
  .loc 1 42
  addi a0, fp, -4
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  xor a0, a0, a1
  seqz a0, a0
  snez a0, a0
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 42
  la a0, check
  mv t5, a0
  # a0传递整型参数
  ld a0, 0(sp)
  addi sp, sp, 8
  # 调用函数
  jalr t5
  .loc 1 43
  .loc 1 43
  # 整型0值通过a0传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 43
  .loc 1 43
  .loc 1 43
  .loc 1 43
  .loc 1 43
  .loc 1 43
  .loc 1 43
  .loc 1 43
  .loc 1 43
  li a0, 4
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 43
  .loc 1 43
  li a0, 1
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 43
  .loc 1 43
  la a0, ans
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  lw a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 43
  .loc 1 43
  la a0, rec
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  xor a0, a0, a1
  seqz a0, a0
  snez a0, a0
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 43
  la a0, check
  mv t5, a0
  # a0传递整型参数
  ld a0, 0(sp)
  addi sp, sp, 8
  # 调用函数
  jalr t5
  .loc 1 44
  .loc 1 44
  # 整型0值通过a0传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 44
  .loc 1 44
  .loc 1 44
  .loc 1 44
  .loc 1 44
  .loc 1 44
  .loc 1 44
  .loc 1 44
  .loc 1 44
  li a0, 4
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 44
  .loc 1 44
  li a0, 2
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 44
  .loc 1 44
  la a0, ans
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  lw a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 44
  .loc 1 44
  la a0, lvl
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  xor a0, a0, a1
  seqz a0, a0
  snez a0, a0
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 44
  la a0, check
  mv t5, a0
  # a0传递整型参数
  ld a0, 0(sp)
  addi sp, sp, 8
  # 调用函数
  jalr t5
  .loc 1 45
  .loc 1 45
  .loc 1 45
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
  .global f3
  .text
# =====f3段开始===============
  .type f3, @function
f3:
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
  # 将整型形参l的寄存器a1的值压栈
  sw a1, -24(fp)
# =====f3段主体===============
  .loc 1 36
  .loc 1 33
  .loc 1 33
  .loc 1 33
  .loc 1 33
  addi a0, fp, -24
  lw a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 33
  .loc 1 33
  la a0, lvl
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  slt a0, a0, a1
  beqz a0, .L.else.1
  .loc 1 33
  .loc 1 33
  la a0, lvl
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 33
  .loc 1 33
  addi a0, fp, -24
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
  j .L.end.1
.L.else.1:
.L.end.1:
  .loc 1 34
  .loc 1 34
  .loc 1 34
  .loc 1 34
  .loc 1 34
  li a0, -1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 34
  .loc 1 34
  .loc 1 34
  addi a0, fp, -8
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 34
  .loc 1 34
  la a0, rec
  ld a1, 0(sp)
  addi sp, sp, 8
  sd a0, 0(a1)
  .loc 1 34
  .loc 1 34
  addi a0, fp, -8
  ld a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 34
  .loc 1 34
  .loc 1 34
  .loc 1 34
  li a0, 1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 34
  .loc 1 34
  .loc 1 34
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
  .loc 1 35
  .loc 1 35
  .loc 1 35
  .loc 1 35
  .loc 1 35
  .loc 1 35
  li a0, 0
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 35
  .loc 1 35
  addi a0, fp, -20
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  slt a0, a1, a0
  xori a0, a0, 1
  beqz a0, .L.else.2
  .loc 1 35
  .loc 1 35
  li a0, 1
  j .L.end.2
.L.else.2:
  .loc 1 35
  .loc 1 35
  .loc 1 35
  .loc 1 35
  .loc 1 35
  .loc 1 35
  li a0, 2
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 35
  .loc 1 35
  # 整型0值通过a0传递
  # 整型0值通过a1传递
  # 对齐栈边界到16字节
  addi sp, sp, -8

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 35
  .loc 1 35
  .loc 1 35
  .loc 1 35
  li a0, 1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 35
  .loc 1 35
  addi a0, fp, -24
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  addw a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 35
  .loc 1 35
  .loc 1 35
  .loc 1 35
  li a0, 2
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 35
  .loc 1 35
  addi a0, fp, -20
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  divw a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 35
  .loc 1 35
  .loc 1 35
  .loc 1 35
  .loc 1 35
  .loc 1 35
  li a0, 8
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 35
  .loc 1 35
  li a0, 2
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 35
  .loc 1 35
  la a0, func
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  ld a0, 0(a0)
  mv t5, a0
  # a0传递整型参数
  ld a0, 0(sp)
  addi sp, sp, 8
  # a1传递整型参数
  ld a1, 0(sp)
  addi sp, sp, 8
  # 调用函数
  jalr t5
  # 回收栈传递参数的8个字节
  addi sp, sp, 8
  ld a1, 0(sp)
  addi sp, sp, 8
  mulw a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 35
  .loc 1 35
  .loc 1 35
  .loc 1 35
  li a0, 3
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 35
  .loc 1 35
  # 整型0值通过a0传递
  # 整型0值通过a1传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 35
  .loc 1 35
  .loc 1 35
  .loc 1 35
  li a0, 1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 35
  .loc 1 35
  addi a0, fp, -24
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  addw a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 35
  .loc 1 35
  .loc 1 35
  .loc 1 35
  li a0, 2
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 35
  .loc 1 35
  addi a0, fp, -20
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  divw a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 35
  .loc 1 35
  .loc 1 35
  .loc 1 35
  .loc 1 35
  .loc 1 35
  li a0, 8
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 35
  .loc 1 35
  li a0, 2
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 35
  .loc 1 35
  la a0, func
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  ld a0, 0(a0)
  mv t5, a0
  # a0传递整型参数
  ld a0, 0(sp)
  addi sp, sp, 8
  # a1传递整型参数
  ld a1, 0(sp)
  addi sp, sp, 8
  # 调用函数
  jalr t5
  ld a1, 0(sp)
  addi sp, sp, 8
  mulw a0, a0, a1
  ld a1, 0(sp)
  addi sp, sp, 8
  addw a0, a0, a1
.L.end.2:
  j .L.return.f3
# =====f3段结束===============
.L.return.f3:
  mv sp, fp
  ld fp, 0(sp)
  ld ra, 8(sp)
  addi sp, sp, 16
  ret
  .global f2
  .text
# =====f2段开始===============
  .type f2, @function
f2:
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
  # 将整型形参l的寄存器a1的值压栈
  sw a1, -24(fp)
# =====f2段主体===============
  .loc 1 30
  .loc 1 27
  .loc 1 27
  .loc 1 27
  .loc 1 27
  addi a0, fp, -24
  lw a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 27
  .loc 1 27
  la a0, lvl
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  slt a0, a0, a1
  beqz a0, .L.else.3
  .loc 1 27
  .loc 1 27
  la a0, lvl
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 27
  .loc 1 27
  addi a0, fp, -24
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
  j .L.end.3
.L.else.3:
.L.end.3:
  .loc 1 28
  .loc 1 28
  .loc 1 28
  .loc 1 28
  .loc 1 28
  li a0, -1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 28
  .loc 1 28
  .loc 1 28
  addi a0, fp, -8
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 28
  .loc 1 28
  la a0, rec
  ld a1, 0(sp)
  addi sp, sp, 8
  sd a0, 0(a1)
  .loc 1 28
  .loc 1 28
  addi a0, fp, -8
  ld a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 28
  .loc 1 28
  .loc 1 28
  .loc 1 28
  li a0, 1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 28
  .loc 1 28
  .loc 1 28
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
  .loc 1 29
  .loc 1 29
  .loc 1 29
  .loc 1 29
  .loc 1 29
  .loc 1 29
  li a0, 0
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 29
  .loc 1 29
  addi a0, fp, -20
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  slt a0, a1, a0
  xori a0, a0, 1
  beqz a0, .L.else.4
  .loc 1 29
  .loc 1 29
  li a0, 1
  j .L.end.4
.L.else.4:
  .loc 1 29
  .loc 1 29
  .loc 1 29
  .loc 1 29
  li a0, 9
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 29
  .loc 1 29
  # 整型0值通过a0传递
  # 整型0值通过a1传递
  # 对齐栈边界到16字节
  addi sp, sp, -8

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 29
  .loc 1 29
  .loc 1 29
  .loc 1 29
  li a0, 1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 29
  .loc 1 29
  addi a0, fp, -24
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  addw a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 29
  .loc 1 29
  addi a0, fp, -20
  lw a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 29
  .loc 1 29
  .loc 1 29
  .loc 1 29
  .loc 1 29
  .loc 1 29
  li a0, 8
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
  la a0, func
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  ld a0, 0(a0)
  mv t5, a0
  # a0传递整型参数
  ld a0, 0(sp)
  addi sp, sp, 8
  # a1传递整型参数
  ld a1, 0(sp)
  addi sp, sp, 8
  # 调用函数
  jalr t5
  # 回收栈传递参数的8个字节
  addi sp, sp, 8
  ld a1, 0(sp)
  addi sp, sp, 8
  addw a0, a0, a1
.L.end.4:
  j .L.return.f2
# =====f2段结束===============
.L.return.f2:
  mv sp, fp
  ld fp, 0(sp)
  ld ra, 8(sp)
  addi sp, sp, 16
  ret
  .global f1
  .text
# =====f1段开始===============
  .type f1, @function
f1:
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
  # 将整型形参l的寄存器a1的值压栈
  sw a1, -24(fp)
# =====f1段主体===============
  .loc 1 24
  .loc 1 21
  .loc 1 21
  .loc 1 21
  .loc 1 21
  addi a0, fp, -24
  lw a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 21
  .loc 1 21
  la a0, lvl
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  slt a0, a0, a1
  beqz a0, .L.else.5
  .loc 1 21
  .loc 1 21
  la a0, lvl
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 21
  .loc 1 21
  addi a0, fp, -24
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
  j .L.end.5
.L.else.5:
.L.end.5:
  .loc 1 22
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
  la a0, rec
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
  .loc 1 23
  .loc 1 23
  .loc 1 23
  .loc 1 23
  .loc 1 23
  .loc 1 23
  li a0, 0
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 23
  .loc 1 23
  addi a0, fp, -20
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  slt a0, a1, a0
  xori a0, a0, 1
  beqz a0, .L.else.6
  .loc 1 23
  .loc 1 23
  li a0, 1
  j .L.end.6
.L.else.6:
  .loc 1 23
  .loc 1 23
  # 整型0值通过a0传递
  # 整型0值通过a1传递

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
  addi a0, fp, -24
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  addw a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑

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
  addi a0, fp, -20
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  subw a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 23
  .loc 1 23
  .loc 1 23
  .loc 1 23
  .loc 1 23
  .loc 1 23
  li a0, 8
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 23
  .loc 1 23
  li a0, 0
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 23
  .loc 1 23
  la a0, func
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  ld a0, 0(a0)
  mv t5, a0
  # a0传递整型参数
  ld a0, 0(sp)
  addi sp, sp, 8
  # a1传递整型参数
  ld a1, 0(sp)
  addi sp, sp, 8
  # 调用函数
  jalr t5
.L.end.6:
  j .L.return.f1
# =====f1段结束===============
.L.return.f1:
  mv sp, fp
  ld fp, 0(sp)
  ld ra, 8(sp)
  addi sp, sp, 16
  ret
  .global f0
  .text
# =====f0段开始===============
  .type f0, @function
f0:
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
  # 将整型形参l的寄存器a1的值压栈
  sw a1, -24(fp)
# =====f0段主体===============
  .loc 1 18
  .loc 1 15
  .loc 1 15
  .loc 1 15
  .loc 1 15
  addi a0, fp, -24
  lw a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 15
  .loc 1 15
  la a0, lvl
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  slt a0, a0, a1
  beqz a0, .L.else.7
  .loc 1 15
  .loc 1 15
  la a0, lvl
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 15
  .loc 1 15
  addi a0, fp, -24
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
  j .L.end.7
.L.else.7:
.L.end.7:
  .loc 1 16
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
  addi a0, fp, -8
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 16
  .loc 1 16
  la a0, rec
  ld a1, 0(sp)
  addi sp, sp, 8
  sd a0, 0(a1)
  .loc 1 16
  .loc 1 16
  addi a0, fp, -8
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
  .loc 1 17
  .loc 1 17
  .loc 1 17
  .loc 1 17
  .loc 1 17
  .loc 1 17
  li a0, 0
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 17
  .loc 1 17
  addi a0, fp, -20
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  slt a0, a1, a0
  xori a0, a0, 1
  beqz a0, .L.else.8
  .loc 1 17
  .loc 1 17
  li a0, 1
  j .L.end.8
.L.else.8:
  .loc 1 17
  .loc 1 17
  # 整型0值通过a0传递
  # 整型0值通过a1传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 17
  .loc 1 17
  .loc 1 17
  .loc 1 17
  li a0, 1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 17
  .loc 1 17
  addi a0, fp, -24
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  addw a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 17
  .loc 1 17
  .loc 1 17
  .loc 1 17
  li a0, 3
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 17
  .loc 1 17
  addi a0, fp, -20
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  divw a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
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
  li a0, 3
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 17
  .loc 1 17
  la a0, func
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  ld a0, 0(a0)
  mv t5, a0
  # a0传递整型参数
  ld a0, 0(sp)
  addi sp, sp, 8
  # a1传递整型参数
  ld a1, 0(sp)
  addi sp, sp, 8
  # 调用函数
  jalr t5
.L.end.8:
  j .L.return.f0
# =====f0段结束===============
.L.return.f0:
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
  beqz a0, .L.else.9
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
  j .L.end.9
.L.else.9:
.L.end.9:
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
  beqz a0, .L.else.10
  .loc 2 26
  .loc 2 22
  # 插入的ASM代码片段
  li a0, 0
ebreak

  .loc 2 25
  j .L.end.10
.L.else.10:
  .loc 2 32
  .loc 2 28
  # 插入的ASM代码片段
  li a0, 1
ebreak

  .loc 2 31
.L.end.10:
# =====halt段结束===============
.L.return.halt:
  mv sp, fp
  ld fp, 0(sp)
  ld ra, 8(sp)
  addi sp, sp, 16
  ret
