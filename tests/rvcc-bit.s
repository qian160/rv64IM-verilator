  .file 1 "bit.c"
  .file 2 "include/trap.h"
  .file 3 "/home/s081/Downloads/projects/rvcc/include/stddef.h"
  .file 4 "/home/s081/Downloads/projects/rvcc/include/stdbool.h"
 #  寄存器传递变量buf偏移量-2
 #  寄存器传递变量__alloca_size__偏移量-16
 #  GP0传递整型变量buf
 #  GP1传递整型变量offset
 #  GP2传递整型变量bit
 #  寄存器传递变量p偏移量-8
 #  寄存器传递变量mask偏移量-9
 #  寄存器传递变量偏移量-24
 #  寄存器传递变量byte偏移量-28
 #  寄存器传递变量__alloca_size__偏移量-40
 #  寄存器传递变量buf偏移量-48
 #  寄存器传递变量offset偏移量-52
 #  寄存器传递变量bit偏移量-53
 #  GP0传递整型变量buf
 #  GP1传递整型变量offset
 #  寄存器传递变量mask偏移量-1
 #  寄存器传递变量偏移量-16
 #  寄存器传递变量byte偏移量-20
 #  寄存器传递变量__alloca_size__偏移量-32
 #  寄存器传递变量buf偏移量-40
 #  寄存器传递变量offset偏移量-44
 #  GP0传递整型变量cond
 #  寄存器传递变量__alloca_size__偏移量-8
 #  寄存器传递变量cond偏移量-9
 #  GP0传递整型变量code
 #  寄存器传递变量__alloca_size__偏移量-8
 #  寄存器传递变量code偏移量-12
  .local .L..9
  .data
  .type .L..9, @object
  .size .L..9, 5
  .align 0
.L..9:
  .byte 109	# 字符：m
  .byte 97	# 字符：a
  .byte 105	# 字符：i
  .byte 110	# 字符：n
  .byte 0
  .local .L..8
  .data
  .type .L..8, @object
  .size .L..8, 5
  .align 0
.L..8:
  .byte 109	# 字符：m
  .byte 97	# 字符：a
  .byte 105	# 字符：i
  .byte 110	# 字符：n
  .byte 0
  .local .L..7
  .data
  .type .L..7, @object
  .size .L..7, 7
  .align 0
.L..7:
  .byte 115	# 字符：s
  .byte 101	# 字符：e
  .byte 116	# 字符：t
  .byte 98	# 字符：b
  .byte 105	# 字符：i
  .byte 116	# 字符：t
  .byte 0
  .local .L..6
  .data
  .type .L..6, @object
  .size .L..6, 7
  .align 0
.L..6:
  .byte 115	# 字符：s
  .byte 101	# 字符：e
  .byte 116	# 字符：t
  .byte 98	# 字符：b
  .byte 105	# 字符：i
  .byte 116	# 字符：t
  .byte 0
  .local .L..5
  .data
  .type .L..5, @object
  .size .L..5, 7
  .align 0
.L..5:
  .byte 103	# 字符：g
  .byte 101	# 字符：e
  .byte 116	# 字符：t
  .byte 98	# 字符：b
  .byte 105	# 字符：i
  .byte 116	# 字符：t
  .byte 0
  .local .L..4
  .data
  .type .L..4, @object
  .size .L..4, 7
  .align 0
.L..4:
  .byte 103	# 字符：g
  .byte 101	# 字符：e
  .byte 116	# 字符：t
  .byte 98	# 字符：b
  .byte 105	# 字符：i
  .byte 116	# 字符：t
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
  .loc 1 22
  .loc 1 22
  .loc 1 22
  .loc 1 22
  .loc 1 22
  .loc 1 24
  .loc 1 24
  .loc 1 24
  .loc 1 24
  .loc 1 24
  .loc 1 24
  .loc 1 24
  li a0, 1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 24
  .loc 1 24
  li a0, 0
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 24
  .loc 1 24
  addi a0, fp, -2
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 24
  .loc 1 24
  li a0, 170
  # 转换为u8类型
  slli a0, a0, 56
  srli a0, a0, 56
  ld a1, 0(sp)
  addi sp, sp, 8
  sb a0, 0(a1)
  .loc 1 25
  .loc 1 25
  .loc 1 25
  .loc 1 25
  .loc 1 25
  .loc 1 25
  .loc 1 25
  li a0, 1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 25
  .loc 1 25
  li a0, 1
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 25
  .loc 1 25
  addi a0, fp, -2
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 25
  .loc 1 25
  li a0, 0
  # 转换为u8类型
  slli a0, a0, 56
  srli a0, a0, 56
  ld a1, 0(sp)
  addi sp, sp, 8
  sb a0, 0(a1)
  .loc 1 26
  .loc 1 26
  # 整型0值通过a0传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 26
  .loc 1 26
  .loc 1 26
  .loc 1 26
  li a0, 0
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 26
  .loc 1 26
  # 整型0值通过a0传递
  # 整型0值通过a1传递
  # 对齐栈边界到16字节
  addi sp, sp, -8

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 26
  .loc 1 26
  li a0, 0
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 26
  .loc 1 26
  addi a0, fp, -2
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 26
  la a0, getbit
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
  # 清除bool类型的高位
  slli a0, a0, 63
  srli a0, a0, 63
  # 转换为i32类型
  slli a0, a0, 32
  srai a0, a0, 32
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
  li a0, 1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 27
  .loc 1 27
  # 整型0值通过a0传递
  # 整型0值通过a1传递
  # 对齐栈边界到16字节
  addi sp, sp, -8

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 27
  .loc 1 27
  li a0, 1
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 27
  .loc 1 27
  addi a0, fp, -2
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 27
  la a0, getbit
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
  # 清除bool类型的高位
  slli a0, a0, 63
  srli a0, a0, 63
  # 转换为i32类型
  slli a0, a0, 32
  srai a0, a0, 32
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
  li a0, 0
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 28
  .loc 1 28
  # 整型0值通过a0传递
  # 整型0值通过a1传递
  # 对齐栈边界到16字节
  addi sp, sp, -8

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 28
  .loc 1 28
  li a0, 2
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 28
  .loc 1 28
  addi a0, fp, -2
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 28
  la a0, getbit
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
  # 清除bool类型的高位
  slli a0, a0, 63
  srli a0, a0, 63
  # 转换为i32类型
  slli a0, a0, 32
  srai a0, a0, 32
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
  li a0, 1
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
  li a0, 3
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 29
  .loc 1 29
  addi a0, fp, -2
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 29
  la a0, getbit
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
  # 清除bool类型的高位
  slli a0, a0, 63
  srli a0, a0, 63
  # 转换为i32类型
  slli a0, a0, 32
  srai a0, a0, 32
  ld a1, 0(sp)
  addi sp, sp, 8
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
  li a0, 0
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 30
  .loc 1 30
  # 整型0值通过a0传递
  # 整型0值通过a1传递
  # 对齐栈边界到16字节
  addi sp, sp, -8

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 30
  .loc 1 30
  li a0, 4
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 30
  .loc 1 30
  addi a0, fp, -2
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 30
  la a0, getbit
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
  # 清除bool类型的高位
  slli a0, a0, 63
  srli a0, a0, 63
  # 转换为i32类型
  slli a0, a0, 32
  srai a0, a0, 32
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
  .loc 1 31
  .loc 1 31
  # 整型0值通过a0传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 31
  .loc 1 31
  .loc 1 31
  .loc 1 31
  li a0, 1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 31
  .loc 1 31
  # 整型0值通过a0传递
  # 整型0值通过a1传递
  # 对齐栈边界到16字节
  addi sp, sp, -8

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 31
  .loc 1 31
  li a0, 5
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 31
  .loc 1 31
  addi a0, fp, -2
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 31
  la a0, getbit
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
  # 清除bool类型的高位
  slli a0, a0, 63
  srli a0, a0, 63
  # 转换为i32类型
  slli a0, a0, 32
  srai a0, a0, 32
  ld a1, 0(sp)
  addi sp, sp, 8
  xor a0, a0, a1
  seqz a0, a0
  snez a0, a0
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 31
  la a0, check
  mv t5, a0
  # a0传递整型参数
  ld a0, 0(sp)
  addi sp, sp, 8
  # 调用函数
  jalr t5
  .loc 1 32
  .loc 1 32
  # 整型0值通过a0传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 32
  .loc 1 32
  .loc 1 32
  .loc 1 32
  li a0, 0
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 32
  .loc 1 32
  # 整型0值通过a0传递
  # 整型0值通过a1传递
  # 对齐栈边界到16字节
  addi sp, sp, -8

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 32
  .loc 1 32
  li a0, 6
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 32
  .loc 1 32
  addi a0, fp, -2
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 32
  la a0, getbit
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
  # 清除bool类型的高位
  slli a0, a0, 63
  srli a0, a0, 63
  # 转换为i32类型
  slli a0, a0, 32
  srai a0, a0, 32
  ld a1, 0(sp)
  addi sp, sp, 8
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
  .loc 1 33
  .loc 1 33
  # 整型0值通过a0传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 33
  .loc 1 33
  .loc 1 33
  .loc 1 33
  li a0, 1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 33
  .loc 1 33
  # 整型0值通过a0传递
  # 整型0值通过a1传递
  # 对齐栈边界到16字节
  addi sp, sp, -8

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 33
  .loc 1 33
  li a0, 7
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 33
  .loc 1 33
  addi a0, fp, -2
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 33
  la a0, getbit
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
  # 清除bool类型的高位
  slli a0, a0, 63
  srli a0, a0, 63
  # 转换为i32类型
  slli a0, a0, 32
  srai a0, a0, 32
  ld a1, 0(sp)
  addi sp, sp, 8
  xor a0, a0, a1
  seqz a0, a0
  snez a0, a0
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 33
  la a0, check
  mv t5, a0
  # a0传递整型参数
  ld a0, 0(sp)
  addi sp, sp, 8
  # 调用函数
  jalr t5
  .loc 1 35
  .loc 1 35
  # 整型0值通过a0传递
  # 整型0值通过a1传递
  # 整型0值通过a2传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 35
  .loc 1 35
  li a0, 1
  snez a0, a0
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 35
  .loc 1 35
  li a0, 8
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 35
  .loc 1 35
  addi a0, fp, -2
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 35
  la a0, setbit
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
  .loc 1 36
  .loc 1 36
  # 整型0值通过a0传递
  # 整型0值通过a1传递
  # 整型0值通过a2传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 36
  .loc 1 36
  li a0, 0
  snez a0, a0
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 36
  .loc 1 36
  li a0, 9
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 36
  .loc 1 36
  addi a0, fp, -2
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 36
  la a0, setbit
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
  .loc 1 37
  .loc 1 37
  # 整型0值通过a0传递
  # 整型0值通过a1传递
  # 整型0值通过a2传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 37
  .loc 1 37
  li a0, 1
  snez a0, a0
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 37
  .loc 1 37
  li a0, 10
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 37
  .loc 1 37
  addi a0, fp, -2
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 37
  la a0, setbit
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
  .loc 1 38
  .loc 1 38
  # 整型0值通过a0传递
  # 整型0值通过a1传递
  # 整型0值通过a2传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 38
  .loc 1 38
  li a0, 0
  snez a0, a0
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 38
  .loc 1 38
  li a0, 11
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 38
  .loc 1 38
  addi a0, fp, -2
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 38
  la a0, setbit
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
  .loc 1 39
  .loc 1 39
  # 整型0值通过a0传递
  # 整型0值通过a1传递
  # 整型0值通过a2传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 39
  .loc 1 39
  li a0, 1
  snez a0, a0
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 39
  .loc 1 39
  li a0, 12
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 39
  .loc 1 39
  addi a0, fp, -2
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 39
  la a0, setbit
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
  .loc 1 40
  .loc 1 40
  # 整型0值通过a0传递
  # 整型0值通过a1传递
  # 整型0值通过a2传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 40
  .loc 1 40
  li a0, 0
  snez a0, a0
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 40
  .loc 1 40
  li a0, 13
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 40
  .loc 1 40
  addi a0, fp, -2
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 40
  la a0, setbit
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
  .loc 1 41
  .loc 1 41
  # 整型0值通过a0传递
  # 整型0值通过a1传递
  # 整型0值通过a2传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 41
  .loc 1 41
  li a0, 1
  snez a0, a0
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 41
  .loc 1 41
  li a0, 14
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 41
  .loc 1 41
  addi a0, fp, -2
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 41
  la a0, setbit
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
  .loc 1 42
  .loc 1 42
  # 整型0值通过a0传递
  # 整型0值通过a1传递
  # 整型0值通过a2传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 42
  .loc 1 42
  li a0, 0
  snez a0, a0
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 42
  .loc 1 42
  li a0, 15
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 42
  .loc 1 42
  addi a0, fp, -2
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 42
  la a0, setbit
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
  .loc 1 43
  .loc 1 43
  # 整型0值通过a0传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 43
  .loc 1 43
  .loc 1 43
  .loc 1 43
  li a0, 85
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 43
  .loc 1 43
  .loc 1 43
  .loc 1 43
  .loc 1 43
  .loc 1 43
  .loc 1 43
  li a0, 1
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
  addi a0, fp, -2
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  lbu a0, 0(a0)
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
  .global setbit
  .text
# =====setbit段开始===============
  .type setbit, @function
setbit:
  addi sp, sp, -16
  sd ra, 8(sp)
  sd fp, 0(sp)
  mv fp, sp
  addi sp, sp, -64
  # 将当前的sp值，存入到Alloca区域的底部
  li t0, -40
  add t0, t0, fp
  sd sp, 0(t0)
  # 将整型形参buf的寄存器a0的值压栈
  sd a0, -48(fp)
  # 将整型形参offset的寄存器a1的值压栈
  sw a1, -52(fp)
  # 将整型形参bit的寄存器a2的值压栈
  sb a2, -53(fp)
# =====setbit段主体===============
  .loc 1 19
  .loc 1 13
  .loc 1 13
  .loc 1 13
  .loc 1 13
  .loc 1 13
  .loc 1 13
  # 对byte的内存-28(fp)清零4位
  sw zero, -28(fp)
  .loc 1 13
  addi a0, fp, -28
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 13
  .loc 1 13
  .loc 1 13
  li a0, 3
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 13
  addi a0, fp, -52
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  sraw a0, a0, a1
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
  .loc 1 14
  .loc 1 14
  .loc 1 14
  addi a0, fp, -24
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 14
  .loc 1 14
  addi a0, fp, -52
  ld a1, 0(sp)
  addi sp, sp, 8
  sd a0, 0(a1)
  .loc 1 14
  .loc 1 14
  addi a0, fp, -24
  ld a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 14
  .loc 1 14
  .loc 1 14
  .loc 1 14
  li a0, 7
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 14
  .loc 1 14
  .loc 1 14
  addi a0, fp, -24
  ld a0, 0(a0)
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  and a0, a0, a1
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
  .loc 1 15
  .loc 1 15
  .loc 1 15
  .loc 1 15
  .loc 1 15
  .loc 1 15
  # 对mask的内存-9(fp)清零1位
  sb zero, -9(fp)
  .loc 1 15
  addi a0, fp, -9
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 15
  .loc 1 15
  .loc 1 15
  addi a0, fp, -52
  lw a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 15
  li a0, 1
  ld a1, 0(sp)
  addi sp, sp, 8
  sllw a0, a0, a1
  # 转换为u8类型
  slli a0, a0, 56
  srli a0, a0, 56
  ld a1, 0(sp)
  addi sp, sp, 8
  sb a0, 0(a1)
  .loc 1 17
  .loc 1 17
  .loc 1 17
  .loc 1 17
  .loc 1 17
  .loc 1 17
  .loc 1 17
  .loc 1 17
  # 对p的内存-8(fp)清零8位
  sd zero, -8(fp)
  .loc 1 17
  addi a0, fp, -8
  addi sp, sp, -8
  sd a0, 0(sp)
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
  addi a0, fp, -28
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 17
  .loc 1 17
  addi a0, fp, -48
  ld a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  ld a1, 0(sp)
  addi sp, sp, 8
  sd a0, 0(a1)
  .loc 1 18
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
  .loc 1 18
  li a0, 0
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 18
  .loc 1 18
  addi a0, fp, -53
  lb a0, 0(a0)
  # 转换为i32类型
  slli a0, a0, 32
  srai a0, a0, 32
  ld a1, 0(sp)
  addi sp, sp, 8
  xor a0, a0, a1
  seqz a0, a0
  beqz a0, .L.else.1
  .loc 1 18
  .loc 1 18
  .loc 1 18
  .loc 1 18
  .loc 1 18
  addi a0, fp, -9
  lbu a0, 0(a0)
  not a0, a0
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 18
  .loc 1 18
  .loc 1 18
  addi a0, fp, -8
  ld a0, 0(a0)
  lbu a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  and a0, a0, a1
  j .L.end.1
.L.else.1:
  .loc 1 18
  .loc 1 18
  .loc 1 18
  .loc 1 18
  addi a0, fp, -9
  lbu a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 18
  .loc 1 18
  .loc 1 18
  addi a0, fp, -8
  ld a0, 0(a0)
  lbu a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  or a0, a0, a1
.L.end.1:
  # 转换为u8类型
  slli a0, a0, 56
  srli a0, a0, 56
  ld a1, 0(sp)
  addi sp, sp, 8
  sb a0, 0(a1)
# =====setbit段结束===============
.L.return.setbit:
  mv sp, fp
  ld fp, 0(sp)
  ld ra, 8(sp)
  addi sp, sp, 16
  ret
  .global getbit
  .text
# =====getbit段开始===============
  .type getbit, @function
getbit:
  addi sp, sp, -16
  sd ra, 8(sp)
  sd fp, 0(sp)
  mv fp, sp
  addi sp, sp, -48
  # 将当前的sp值，存入到Alloca区域的底部
  li t0, -32
  add t0, t0, fp
  sd sp, 0(t0)
  # 将整型形参buf的寄存器a0的值压栈
  sd a0, -40(fp)
  # 将整型形参offset的寄存器a1的值压栈
  sw a1, -44(fp)
# =====getbit段主体===============
  .loc 1 10
  .loc 1 6
  .loc 1 6
  .loc 1 6
  .loc 1 6
  .loc 1 6
  .loc 1 6
  # 对byte的内存-20(fp)清零4位
  sw zero, -20(fp)
  .loc 1 6
  addi a0, fp, -20
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 6
  .loc 1 6
  .loc 1 6
  li a0, 3
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 6
  addi a0, fp, -44
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  sraw a0, a0, a1
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
  .loc 1 7
  .loc 1 7
  .loc 1 7
  addi a0, fp, -16
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 7
  .loc 1 7
  addi a0, fp, -44
  ld a1, 0(sp)
  addi sp, sp, 8
  sd a0, 0(a1)
  .loc 1 7
  .loc 1 7
  addi a0, fp, -16
  ld a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 7
  .loc 1 7
  .loc 1 7
  .loc 1 7
  li a0, 7
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 7
  .loc 1 7
  .loc 1 7
  addi a0, fp, -16
  ld a0, 0(a0)
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  and a0, a0, a1
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
  .loc 1 8
  .loc 1 8
  .loc 1 8
  .loc 1 8
  .loc 1 8
  .loc 1 8
  # 对mask的内存-1(fp)清零1位
  sb zero, -1(fp)
  .loc 1 8
  addi a0, fp, -1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 8
  .loc 1 8
  .loc 1 8
  addi a0, fp, -44
  lw a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 8
  li a0, 1
  ld a1, 0(sp)
  addi sp, sp, 8
  sllw a0, a0, a1
  # 转换为u8类型
  slli a0, a0, 56
  srli a0, a0, 56
  ld a1, 0(sp)
  addi sp, sp, 8
  sb a0, 0(a1)
  .loc 1 9
  .loc 1 9
  .loc 1 9
  .loc 1 9
  .loc 1 9
  li a0, 0
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 9
  .loc 1 9
  .loc 1 9
  .loc 1 9
  addi a0, fp, -1
  lbu a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 9
  .loc 1 9
  .loc 1 9
  .loc 1 9
  .loc 1 9
  .loc 1 9
  .loc 1 9
  li a0, 1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 9
  .loc 1 9
  addi a0, fp, -20
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 9
  .loc 1 9
  .loc 1 9
  addi a0, fp, -40
  ld a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  lbu a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  and a0, a0, a1
  ld a1, 0(sp)
  addi sp, sp, 8
  xor a0, a0, a1
  snez a0, a0
  snez a0, a0
  j .L.return.getbit
# =====getbit段结束===============
.L.return.getbit:
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
