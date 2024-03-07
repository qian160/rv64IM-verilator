  .file 1 "matrix-mul.c"
  .file 2 "include/trap.h"
  .file 3 "/home/s081/Downloads/projects/rvcc/include/stddef.h"
  .file 4 "/home/s081/Downloads/projects/rvcc/include/stdbool.h"
 #  寄存器传递变量偏移量-8
 #  寄存器传递变量偏移量-16
 #  寄存器传递变量偏移量-24
 #  寄存器传递变量偏移量-32
 #  寄存器传递变量k偏移量-36
 #  寄存器传递变量j偏移量-40
 #  寄存器传递变量i偏移量-44
 #  寄存器传递变量__alloca_size__偏移量-56
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
  .global c
  .comm c, 400, 16
  .global ans
  .data
  .type ans, @object
  .size ans, 400
  .align 4
ans:
  .byte -37
  .byte -6
  .byte -1
  .byte -1
  .byte -117
  .byte 40	# 字符：(
  .byte 0
  .byte 0
  .byte 67	# 字符：C
  .byte -23
  .byte -1
  .byte -1
  .byte 14
  .byte -56
  .byte -1
  .byte -1
  .byte 22
  .byte -17
  .byte -1
  .byte -1
  .byte -42
  .byte -13
  .byte -1
  .byte -1
  .byte 44	# 字符：,
  .byte -39
  .byte -1
  .byte -1
  .byte 121	# 字符：y
  .byte 27
  .byte 0
  .byte 0
  .byte -91
  .byte -8
  .byte -1
  .byte -1
  .byte 117	# 字符：u
  .byte -24
  .byte -1
  .byte -1
  .byte 54	# 字符：6
  .byte -95
  .byte -1
  .byte -1
  .byte -93
  .byte -4
  .byte -1
  .byte -1
  .byte -52
  .byte 15
  .byte 0
  .byte 0
  .byte -112
  .byte -78
  .byte -1
  .byte -1
  .byte 33	# 字符：!
  .byte -1
  .byte -1
  .byte -1
  .byte 118	# 字符：v
  .byte 3
  .byte 0
  .byte 0
  .byte 44	# 字符：,
  .byte -47
  .byte -1
  .byte -1
  .byte -42
  .byte -26
  .byte -1
  .byte -1
  .byte -22
  .byte -55
  .byte -1
  .byte -1
  .byte -30
  .byte -5
  .byte -1
  .byte -1
  .byte 55	# 字符：7
  .byte 38	# 字符：&
  .byte 0
  .byte 0
  .byte 95	# 字符：_
  .byte -28
  .byte -1
  .byte -1
  .byte 106	# 字符：j
  .byte -4
  .byte -1
  .byte -1
  .byte -23
  .byte -24
  .byte -1
  .byte -1
  .byte 57	# 字符：9
  .byte -4
  .byte -1
  .byte -1
  .byte 68	# 字符：D
  .byte -28
  .byte -1
  .byte -1
  .byte 13
  .byte 57	# 字符：9
  .byte 0
  .byte 0
  .byte 124	# 字符：|
  .byte -30
  .byte -1
  .byte -1
  .byte -111
  .byte -14
  .byte -1
  .byte -1
  .byte -121
  .byte 37	# 字符：%
  .byte 0
  .byte 0
  .byte 108	# 字符：l
  .byte 62	# 字符：>
  .byte 0
  .byte 0
  .byte -8
  .byte -3
  .byte -1
  .byte -1
  .byte 15
  .byte -52
  .byte -1
  .byte -1
  .byte -61
  .byte 58	# 字符：:
  .byte 0
  .byte 0
  .byte 41	# 字符：)
  .byte 24
  .byte 0
  .byte 0
  .byte -70
  .byte -15
  .byte -1
  .byte -1
  .byte 45	# 字符：-
  .byte 5
  .byte 0
  .byte 0
  .byte 97	# 字符：a
  .byte 16
  .byte 0
  .byte 0
  .byte 29
  .byte 66	# 字符：B
  .byte 0
  .byte 0
  .byte -97
  .byte -70
  .byte -1
  .byte -1
  .byte 6
  .byte 10
  .byte 0
  .byte 0
  .byte 115	# 字符：s
  .byte 12
  .byte 0
  .byte 0
  .byte 8
  .byte 40	# 字符：(
  .byte 0
  .byte 0
  .byte -11
  .byte 30
  .byte 0
  .byte 0
  .byte -82
  .byte 24
  .byte 0
  .byte 0
  .byte -115
  .byte 5
  .byte 0
  .byte 0
  .byte 56	# 字符：8
  .byte 57	# 字符：9
  .byte 0
  .byte 0
  .byte -68
  .byte 2
  .byte 0
  .byte 0
  .byte 95	# 字符：_
  .byte -48
  .byte -1
  .byte -1
  .byte 59	# 字符：;
  .byte 4
  .byte 0
  .byte 0
  .byte -59
  .byte -50
  .byte -1
  .byte -1
  .byte 62	# 字符：>
  .byte 74	# 字符：J
  .byte 0
  .byte 0
  .byte -40
  .byte 81	# 字符：Q
  .byte 0
  .byte 0
  .byte -89
  .byte 72	# 字符：H
  .byte 0
  .byte 0
  .byte -3
  .byte -7
  .byte -1
  .byte -1
  .byte 64	# 字符：@
  .byte 20
  .byte 0
  .byte 0
  .byte 0
  .byte 68	# 字符：D
  .byte 0
  .byte 0
  .byte 84	# 字符：T
  .byte 26
  .byte 0
  .byte 0
  .byte 120	# 字符：x
  .byte 24
  .byte 0
  .byte 0
  .byte 10
  .byte 59	# 字符：;
  .byte 0
  .byte 0
  .byte 85	# 字符：U
  .byte -50
  .byte -1
  .byte -1
  .byte 17
  .byte 59	# 字符：;
  .byte 0
  .byte 0
  .byte -21
  .byte 38	# 字符：&
  .byte 0
  .byte 0
  .byte 107	# 字符：k
  .byte -54
  .byte -1
  .byte -1
  .byte 107	# 字符：k
  .byte 9
  .byte 0
  .byte 0
  .byte 108	# 字符：l
  .byte -9
  .byte -1
  .byte -1
  .byte 3
  .byte 24
  .byte 0
  .byte 0
  .byte 94	# 字符：^
  .byte -7
  .byte -1
  .byte -1
  .byte -61
  .byte -14
  .byte -1
  .byte -1
  .byte 8
  .byte 32	# 字符： 
  .byte 0
  .byte 0
  .byte -63
  .byte -75
  .byte -1
  .byte -1
  .byte -127
  .byte 48	# 字符：0
  .byte 0
  .byte 0
  .byte 91	# 字符：[
  .byte 22
  .byte 0
  .byte 0
  .byte -45
  .byte -45
  .byte -1
  .byte -1
  .byte -42
  .byte -76
  .byte -1
  .byte -1
  .byte 124	# 字符：|
  .byte 61	# 字符：=
  .byte 0
  .byte 0
  .byte 49	# 字符：1
  .byte -15
  .byte -1
  .byte -1
  .byte -109
  .byte -16
  .byte -1
  .byte -1
  .byte -74
  .byte -52
  .byte -1
  .byte -1
  .byte -21
  .byte -1
  .byte -1
  .byte -1
  .byte -13
  .byte -50
  .byte -1
  .byte -1
  .byte -82
  .byte -24
  .byte -1
  .byte -1
  .byte -50
  .byte -46
  .byte -1
  .byte -1
  .byte 55	# 字符：7
  .byte -35
  .byte -1
  .byte -1
  .byte -61
  .byte 47	# 字符：/
  .byte 0
  .byte 0
  .byte -122
  .byte 30
  .byte 0
  .byte 0
  .byte 26
  .byte -20
  .byte -1
  .byte -1
  .byte -76
  .byte 17
  .byte 0
  .byte 0
  .byte 47	# 字符：/
  .byte 4
  .byte 0
  .byte 0
  .byte -29
  .byte -6
  .byte -1
  .byte -1
  .byte 117	# 字符：u
  .byte -12
  .byte -1
  .byte -1
  .byte -91
  .byte 36	# 字符：$
  .byte 0
  .byte 0
  .byte -28
  .byte 24
  .byte 0
  .byte 0
  .byte 14
  .byte -27
  .byte -1
  .byte -1
  .byte -99
  .byte 35	# 字符：#
  .byte 0
  .byte 0
  .byte 121	# 字符：y
  .byte 22
  .byte 0
  .byte 0
  .byte 42	# 字符：*
  .byte 81	# 字符：Q
  .byte 0
  .byte 0
  .byte 75	# 字符：K
  .byte -20
  .byte -1
  .byte -1
  .byte 23
  .byte 4
  .byte 0
  .byte 0
  .byte 82	# 字符：R
  .byte 47	# 字符：/
  .byte 0
  .byte 0
  .global b
  .data
  .type b, @object
  .size b, 400
  .align 4
b:
  .byte -48
  .byte -1
  .byte -1
  .byte -1
  .byte -70
  .byte -1
  .byte -1
  .byte -1
  .byte -40
  .byte -1
  .byte -1
  .byte -1
  .byte -82
  .byte -1
  .byte -1
  .byte -1
  .byte -74
  .byte -1
  .byte -1
  .byte -1
  .byte -63
  .byte -1
  .byte -1
  .byte -1
  .byte -59
  .byte -1
  .byte -1
  .byte -1
  .byte -72
  .byte -1
  .byte -1
  .byte -1
  .byte -100
  .byte -1
  .byte -1
  .byte -1
  .byte -72
  .byte -1
  .byte -1
  .byte -1
  .byte 5
  .byte 0
  .byte 0
  .byte 0
  .byte -84
  .byte -1
  .byte -1
  .byte -1
  .byte 28
  .byte 0
  .byte 0
  .byte 0
  .byte 56	# 字符：8
  .byte 0
  .byte 0
  .byte 0
  .byte 60	# 字符：<
  .byte 0
  .byte 0
  .byte 0
  .byte -33
  .byte -1
  .byte -1
  .byte -1
  .byte -42
  .byte -1
  .byte -1
  .byte -1
  .byte -50
  .byte -1
  .byte -1
  .byte -1
  .byte -83
  .byte -1
  .byte -1
  .byte -1
  .byte -83
  .byte -1
  .byte -1
  .byte -1
  .byte -5
  .byte -1
  .byte -1
  .byte -1
  .byte 5
  .byte 0
  .byte 0
  .byte 0
  .byte 48	# 字符：0
  .byte 0
  .byte 0
  .byte 0
  .byte 75	# 字符：K
  .byte 0
  .byte 0
  .byte 0
  .byte -78
  .byte -1
  .byte -1
  .byte -1
  .byte -9
  .byte -1
  .byte -1
  .byte -1
  .byte 9
  .byte 0
  .byte 0
  .byte 0
  .byte 2
  .byte 0
  .byte 0
  .byte 0
  .byte 88	# 字符：X
  .byte 0
  .byte 0
  .byte 0
  .byte 70	# 字符：F
  .byte 0
  .byte 0
  .byte 0
  .byte 69	# 字符：E
  .byte 0
  .byte 0
  .byte 0
  .byte 23
  .byte 0
  .byte 0
  .byte 0
  .byte 66	# 字符：B
  .byte 0
  .byte 0
  .byte 0
  .byte 66	# 字符：B
  .byte 0
  .byte 0
  .byte 0
  .byte -11
  .byte -1
  .byte -1
  .byte -1
  .byte 50	# 字符：2
  .byte 0
  .byte 0
  .byte 0
  .byte 67	# 字符：C
  .byte 0
  .byte 0
  .byte 0
  .byte 18
  .byte 0
  .byte 0
  .byte 0
  .byte -58
  .byte -1
  .byte -1
  .byte -1
  .byte 76	# 字符：L
  .byte 0
  .byte 0
  .byte 0
  .byte 30
  .byte 0
  .byte 0
  .byte 0
  .byte 45	# 字符：-
  .byte 0
  .byte 0
  .byte 0
  .byte 32	# 字符： 
  .byte 0
  .byte 0
  .byte 0
  .byte 25
  .byte 0
  .byte 0
  .byte 0
  .byte -73
  .byte -1
  .byte -1
  .byte -1
  .byte 57	# 字符：9
  .byte 0
  .byte 0
  .byte 0
  .byte -67
  .byte -1
  .byte -1
  .byte -1
  .byte -14
  .byte -1
  .byte -1
  .byte -1
  .byte 53	# 字符：5
  .byte 0
  .byte 0
  .byte 0
  .byte -33
  .byte -1
  .byte -1
  .byte -1
  .byte 98	# 字符：b
  .byte 0
  .byte 0
  .byte 0
  .byte -86
  .byte -1
  .byte -1
  .byte -1
  .byte -63
  .byte -1
  .byte -1
  .byte -1
  .byte 80	# 字符：P
  .byte 0
  .byte 0
  .byte 0
  .byte -45
  .byte -1
  .byte -1
  .byte -1
  .byte -88
  .byte -1
  .byte -1
  .byte -1
  .byte 80	# 字符：P
  .byte 0
  .byte 0
  .byte 0
  .byte -64
  .byte -1
  .byte -1
  .byte -1
  .byte 58	# 字符：:
  .byte 0
  .byte 0
  .byte 0
  .byte -84
  .byte -1
  .byte -1
  .byte -1
  .byte -55
  .byte -1
  .byte -1
  .byte -1
  .byte -39
  .byte -1
  .byte -1
  .byte -1
  .byte -13
  .byte -1
  .byte -1
  .byte -1
  .byte -27
  .byte -1
  .byte -1
  .byte -1
  .byte -37
  .byte -1
  .byte -1
  .byte -1
  .byte 8
  .byte 0
  .byte 0
  .byte 0
  .byte -96
  .byte -1
  .byte -1
  .byte -1
  .byte 84	# 字符：T
  .byte 0
  .byte 0
  .byte 0
  .byte -89
  .byte -1
  .byte -1
  .byte -1
  .byte 31
  .byte 0
  .byte 0
  .byte 0
  .byte -82
  .byte -1
  .byte -1
  .byte -1
  .byte 58	# 字符：:
  .byte 0
  .byte 0
  .byte 0
  .byte 81	# 字符：Q
  .byte 0
  .byte 0
  .byte 0
  .byte -41
  .byte -1
  .byte -1
  .byte -1
  .byte -58
  .byte -1
  .byte -1
  .byte -1
  .byte 36	# 字符：$
  .byte 0
  .byte 0
  .byte 0
  .byte 76	# 字符：L
  .byte 0
  .byte 0
  .byte 0
  .byte -79
  .byte -1
  .byte -1
  .byte -1
  .byte -29
  .byte -1
  .byte -1
  .byte -1
  .byte 23
  .byte 0
  .byte 0
  .byte 0
  .byte 86	# 字符：V
  .byte 0
  .byte 0
  .byte 0
  .byte -46
  .byte -1
  .byte -1
  .byte -1
  .byte 16
  .byte 0
  .byte 0
  .byte 0
  .byte -18
  .byte -1
  .byte -1
  .byte -1
  .byte 81	# 字符：Q
  .byte 0
  .byte 0
  .byte 0
  .byte 90	# 字符：Z
  .byte 0
  .byte 0
  .byte 0
  .byte 35	# 字符：#
  .byte 0
  .byte 0
  .byte 0
  .byte -90
  .byte -1
  .byte -1
  .byte -1
  .byte 43	# 字符：+
  .byte 0
  .byte 0
  .byte 0
  .byte 55	# 字符：7
  .byte 0
  .byte 0
  .byte 0
  .byte -38
  .byte -1
  .byte -1
  .byte -1
  .byte -19
  .byte -1
  .byte -1
  .byte -1
  .byte -40
  .byte -1
  .byte -1
  .byte -1
  .byte 82	# 字符：R
  .byte 0
  .byte 0
  .byte 0
  .byte -76
  .byte -1
  .byte -1
  .byte -1
  .byte 57	# 字符：9
  .byte 0
  .byte 0
  .byte 0
  .byte -29
  .byte -1
  .byte -1
  .byte -1
  .byte -2
  .byte -1
  .byte -1
  .byte -1
  .byte 79	# 字符：O
  .byte 0
  .byte 0
  .byte 0
  .byte -48
  .byte -1
  .byte -1
  .byte -1
  .global a
  .data
  .type a, @object
  .size a, 400
  .align 4
a:
  .byte 31
  .byte 0
  .byte 0
  .byte 0
  .byte -73
  .byte -1
  .byte -1
  .byte -1
  .byte -67
  .byte -1
  .byte -1
  .byte -1
  .byte -28
  .byte -1
  .byte -1
  .byte -1
  .byte 87	# 字符：W
  .byte 0
  .byte 0
  .byte 0
  .byte -17
  .byte -1
  .byte -1
  .byte -1
  .byte -15
  .byte -1
  .byte -1
  .byte -1
  .byte -35
  .byte -1
  .byte -1
  .byte -1
  .byte -53
  .byte -1
  .byte -1
  .byte -1
  .byte -54
  .byte -1
  .byte -1
  .byte -1
  .byte 52	# 字符：4
  .byte 0
  .byte 0
  .byte 0
  .byte 36	# 字符：$
  .byte 0
  .byte 0
  .byte 0
  .byte 9
  .byte 0
  .byte 0
  .byte 0
  .byte -91
  .byte -1
  .byte -1
  .byte -1
  .byte -27
  .byte -1
  .byte -1
  .byte -1
  .byte -78
  .byte -1
  .byte -1
  .byte -1
  .byte 42	# 字符：*
  .byte 0
  .byte 0
  .byte 0
  .byte 82	# 字符：R
  .byte 0
  .byte 0
  .byte 0
  .byte 19
  .byte 0
  .byte 0
  .byte 0
  .byte -6
  .byte -1
  .byte -1
  .byte -1
  .byte 41	# 字符：)
  .byte 0
  .byte 0
  .byte 0
  .byte -56
  .byte -1
  .byte -1
  .byte -1
  .byte 31
  .byte 0
  .byte 0
  .byte 0
  .byte 32	# 字符： 
  .byte 0
  .byte 0
  .byte 0
  .byte -52
  .byte -1
  .byte -1
  .byte -1
  .byte 74	# 字符：J
  .byte 0
  .byte 0
  .byte 0
  .byte 28
  .byte 0
  .byte 0
  .byte 0
  .byte 20
  .byte 0
  .byte 0
  .byte 0
  .byte 55	# 字符：7
  .byte 0
  .byte 0
  .byte 0
  .byte -72
  .byte -1
  .byte -1
  .byte -1
  .byte -59
  .byte -1
  .byte -1
  .byte -1
  .byte 2
  .byte 0
  .byte 0
  .byte 0
  .byte -79
  .byte -1
  .byte -1
  .byte -1
  .byte -8
  .byte -1
  .byte -1
  .byte -1
  .byte 44	# 字符：,
  .byte 0
  .byte 0
  .byte 0
  .byte 55	# 字符：7
  .byte 0
  .byte 0
  .byte 0
  .byte -83
  .byte -1
  .byte -1
  .byte -1
  .byte -95
  .byte -1
  .byte -1
  .byte -1
  .byte -45
  .byte -1
  .byte -1
  .byte -1
  .byte 50	# 字符：2
  .byte 0
  .byte 0
  .byte 0
  .byte -95
  .byte -1
  .byte -1
  .byte -1
  .byte 61	# 字符：=
  .byte 0
  .byte 0
  .byte 0
  .byte -63
  .byte -1
  .byte -1
  .byte -1
  .byte 62	# 字符：>
  .byte 0
  .byte 0
  .byte 0
  .byte -16
  .byte -1
  .byte -1
  .byte -1
  .byte 52	# 字符：4
  .byte 0
  .byte 0
  .byte 0
  .byte 40	# 字符：(
  .byte 0
  .byte 0
  .byte 0
  .byte 92	# 字符：\
  .byte 0
  .byte 0
  .byte 0
  .byte -32
  .byte -1
  .byte -1
  .byte -1
  .byte -26
  .byte -1
  .byte -1
  .byte -1
  .byte -99
  .byte -1
  .byte -1
  .byte -1
  .byte 52	# 字符：4
  .byte 0
  .byte 0
  .byte 0
  .byte 96	# 字符：`
  .byte 0
  .byte 0
  .byte 0
  .byte 63	# 字符：?
  .byte 0
  .byte 0
  .byte 0
  .byte -75
  .byte -1
  .byte -1
  .byte -1
  .byte -74
  .byte -1
  .byte -1
  .byte -1
  .byte -82
  .byte -1
  .byte -1
  .byte -1
  .byte 82	# 字符：R
  .byte 0
  .byte 0
  .byte 0
  .byte -95
  .byte -1
  .byte -1
  .byte -1
  .byte 42	# 字符：*
  .byte 0
  .byte 0
  .byte 0
  .byte 11
  .byte 0
  .byte 0
  .byte 0
  .byte -22
  .byte -1
  .byte -1
  .byte -1
  .byte 27
  .byte 0
  .byte 0
  .byte 0
  .byte -27
  .byte -1
  .byte -1
  .byte -1
  .byte -27
  .byte -1
  .byte -1
  .byte -1
  .byte -76
  .byte -1
  .byte -1
  .byte -1
  .byte -71
  .byte -1
  .byte -1
  .byte -1
  .byte 58	# 字符：:
  .byte 0
  .byte 0
  .byte 0
  .byte -40
  .byte -1
  .byte -1
  .byte -1
  .byte -65
  .byte -1
  .byte -1
  .byte -1
  .byte 91	# 字符：[
  .byte 0
  .byte 0
  .byte 0
  .byte -53
  .byte -1
  .byte -1
  .byte -1
  .byte -67
  .byte -1
  .byte -1
  .byte -1
  .byte 72	# 字符：H
  .byte 0
  .byte 0
  .byte 0
  .byte 36	# 字符：$
  .byte 0
  .byte 0
  .byte 0
  .byte -77
  .byte -1
  .byte -1
  .byte -1
  .byte -3
  .byte -1
  .byte -1
  .byte -1
  .byte 93	# 字符：]
  .byte 0
  .byte 0
  .byte 0
  .byte -24
  .byte -1
  .byte -1
  .byte -1
  .byte 97	# 字符：a
  .byte 0
  .byte 0
  .byte 0
  .byte -52
  .byte -1
  .byte -1
  .byte -1
  .byte -11
  .byte -1
  .byte -1
  .byte -1
  .byte -77
  .byte -1
  .byte -1
  .byte -1
  .byte -93
  .byte -1
  .byte -1
  .byte -1
  .byte -92
  .byte -1
  .byte -1
  .byte -1
  .byte -24
  .byte -1
  .byte -1
  .byte -1
  .byte 70	# 字符：F
  .byte 0
  .byte 0
  .byte 0
  .byte 18
  .byte 0
  .byte 0
  .byte 0
  .byte 56	# 字符：8
  .byte 0
  .byte 0
  .byte 0
  .byte 88	# 字符：X
  .byte 0
  .byte 0
  .byte 0
  .byte -43
  .byte -1
  .byte -1
  .byte -1
  .byte -41
  .byte -1
  .byte -1
  .byte -1
  .byte -26
  .byte -1
  .byte -1
  .byte -1
  .byte 11
  .byte 0
  .byte 0
  .byte 0
  .byte -84
  .byte -1
  .byte -1
  .byte -1
  .byte -14
  .byte -1
  .byte -1
  .byte -1
  .byte -41
  .byte -1
  .byte -1
  .byte -1
  .byte 83	# 字符：S
  .byte 0
  .byte 0
  .byte 0
  .byte 27
  .byte 0
  .byte 0
  .byte 0
  .byte -11
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
  addi sp, sp, -64
  # 将当前的sp值，存入到Alloca区域的底部
  li t0, -56
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
  .loc 1 60
  .loc 1 44
  .loc 1 44
  .loc 1 44
  .loc 1 44
  .loc 1 44
  .loc 1 44
  .loc 1 44
  .loc 1 45
  .loc 1 45
  .loc 1 45
  addi a0, fp, -44
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 45
  .loc 1 45
  li a0, 0
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
.L.begin.1:
  .loc 1 45
  .loc 1 3
  .loc 1 3
  li a0, 10
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 45
  .loc 1 45
  addi a0, fp, -44
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  slt a0, a0, a1
  beqz a0, .L..6
  .loc 1 55
  .loc 1 46
  .loc 1 46
  .loc 1 46
  addi a0, fp, -40
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 46
  .loc 1 46
  li a0, 0
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
.L.begin.2:
  .loc 1 46
  .loc 1 3
  .loc 1 3
  li a0, 10
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 46
  .loc 1 46
  addi a0, fp, -40
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  slt a0, a0, a1
  beqz a0, .L..8
  .loc 1 53
  .loc 1 47
  .loc 1 47
  .loc 1 47
  .loc 1 47
  .loc 1 47
  .loc 1 47
  .loc 1 47
  li a0, 4
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 47
  .loc 1 47
  addi a0, fp, -40
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 47
  .loc 1 47
  .loc 1 47
  .loc 1 47
  .loc 1 47
  .loc 1 47
  .loc 1 47
  li a0, 40
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 47
  .loc 1 47
  addi a0, fp, -44
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 47
  .loc 1 47
  la a0, c
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 47
  .loc 1 47
  li a0, 0
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
  .loc 1 48
  .loc 1 48
  .loc 1 48
  addi a0, fp, -36
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 48
  .loc 1 48
  li a0, 0
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
.L.begin.3:
  .loc 1 48
  .loc 1 3
  .loc 1 3
  li a0, 10
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 48
  .loc 1 48
  addi a0, fp, -36
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  slt a0, a0, a1
  beqz a0, .L..10
  .loc 1 50
  .loc 1 49
  .loc 1 49
  .loc 1 49
  addi a0, fp, -8
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 49
  .loc 1 49
  .loc 1 49
  .loc 1 49
  .loc 1 49
  .loc 1 49
  .loc 1 49
  li a0, 4
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 49
  .loc 1 49
  addi a0, fp, -40
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 49
  .loc 1 49
  .loc 1 49
  .loc 1 49
  .loc 1 49
  .loc 1 49
  .loc 1 49
  li a0, 40
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 49
  .loc 1 49
  addi a0, fp, -44
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 49
  .loc 1 49
  la a0, c
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  ld a1, 0(sp)
  addi sp, sp, 8
  sd a0, 0(a1)
  .loc 1 49
  .loc 1 49
  addi a0, fp, -8
  ld a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 49
  .loc 1 49
  .loc 1 49
  .loc 1 49
  .loc 1 49
  .loc 1 49
  .loc 1 49
  .loc 1 49
  .loc 1 49
  .loc 1 49
  .loc 1 49
  li a0, 4
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 49
  .loc 1 49
  addi a0, fp, -40
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 49
  .loc 1 49
  .loc 1 49
  .loc 1 49
  .loc 1 49
  .loc 1 49
  .loc 1 49
  li a0, 40
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 49
  .loc 1 49
  addi a0, fp, -36
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 49
  .loc 1 49
  la a0, b
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  lw a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 49
  .loc 1 49
  .loc 1 49
  .loc 1 49
  .loc 1 49
  .loc 1 49
  .loc 1 49
  li a0, 4
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 49
  .loc 1 49
  addi a0, fp, -36
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 49
  .loc 1 49
  .loc 1 49
  .loc 1 49
  .loc 1 49
  .loc 1 49
  .loc 1 49
  li a0, 40
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 49
  .loc 1 49
  addi a0, fp, -44
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 49
  .loc 1 49
  la a0, a
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  mulw a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 49
  .loc 1 49
  .loc 1 49
  addi a0, fp, -8
  ld a0, 0(a0)
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  addw a0, a0, a1
  ld a1, 0(sp)
  addi sp, sp, 8
  sw a0, 0(a1)
.L..11:

# Inc语句3
  .loc 1 48
  .loc 1 48
  .loc 1 48
  .loc 1 48
  li a0, -1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 48
  .loc 1 48
  .loc 1 48
  addi a0, fp, -16
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 48
  .loc 1 48
  addi a0, fp, -36
  ld a1, 0(sp)
  addi sp, sp, 8
  sd a0, 0(a1)
  .loc 1 48
  .loc 1 48
  addi a0, fp, -16
  ld a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 48
  .loc 1 48
  .loc 1 48
  .loc 1 48
  li a0, 1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 48
  .loc 1 48
  .loc 1 48
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
  j .L.begin.3
.L..10:
  .loc 1 51
  .loc 1 51
  # 整型0值通过a0传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 51
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
  addi a0, fp, -40
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 51
  .loc 1 51
  .loc 1 51
  .loc 1 51
  .loc 1 51
  .loc 1 51
  .loc 1 51
  li a0, 40
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 51
  .loc 1 51
  addi a0, fp, -44
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 51
  .loc 1 51
  la a0, ans
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
  lw a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
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
  addi a0, fp, -40
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 51
  .loc 1 51
  .loc 1 51
  .loc 1 51
  .loc 1 51
  .loc 1 51
  .loc 1 51
  li a0, 40
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 51
  .loc 1 51
  addi a0, fp, -44
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  mul a0, a0, a1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 51
  .loc 1 51
  la a0, c
  ld a1, 0(sp)
  addi sp, sp, 8
  add a0, a0, a1
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
  .loc 1 51
  la a0, check
  mv t5, a0
  # a0传递整型参数
  ld a0, 0(sp)
  addi sp, sp, 8
  # 调用函数
  jalr t5
  .loc 1 52
  .loc 1 52
  # 整型0值通过a0传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 52
  .loc 1 52
  .loc 1 3
  .loc 1 3
  li a0, 10
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 52
  .loc 1 52
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
  .loc 1 52
  la a0, check
  mv t5, a0
  # a0传递整型参数
  ld a0, 0(sp)
  addi sp, sp, 8
  # 调用函数
  jalr t5
.L..9:

# Inc语句2
  .loc 1 46
  .loc 1 46
  .loc 1 46
  .loc 1 46
  li a0, -1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 46
  .loc 1 46
  .loc 1 46
  addi a0, fp, -24
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 46
  .loc 1 46
  addi a0, fp, -40
  ld a1, 0(sp)
  addi sp, sp, 8
  sd a0, 0(a1)
  .loc 1 46
  .loc 1 46
  addi a0, fp, -24
  ld a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 46
  .loc 1 46
  .loc 1 46
  .loc 1 46
  li a0, 1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 46
  .loc 1 46
  .loc 1 46
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
  j .L.begin.2
.L..8:
  .loc 1 54
  .loc 1 54
  # 整型0值通过a0传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 54
  .loc 1 54
  .loc 1 3
  .loc 1 3
  li a0, 10
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 54
  .loc 1 54
  addi a0, fp, -40
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  xor a0, a0, a1
  seqz a0, a0
  snez a0, a0
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 54
  la a0, check
  mv t5, a0
  # a0传递整型参数
  ld a0, 0(sp)
  addi sp, sp, 8
  # 调用函数
  jalr t5
.L..7:

# Inc语句1
  .loc 1 45
  .loc 1 45
  .loc 1 45
  .loc 1 45
  li a0, -1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 45
  .loc 1 45
  .loc 1 45
  addi a0, fp, -32
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 45
  .loc 1 45
  addi a0, fp, -44
  ld a1, 0(sp)
  addi sp, sp, 8
  sd a0, 0(a1)
  .loc 1 45
  .loc 1 45
  addi a0, fp, -32
  ld a0, 0(a0)
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 45
  .loc 1 45
  .loc 1 45
  .loc 1 45
  li a0, 1
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 45
  .loc 1 45
  .loc 1 45
  addi a0, fp, -32
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
  .loc 1 57
  .loc 1 57
  # 整型0值通过a0传递

  # ↓对表达式进行计算，然后压栈↓
  .loc 1 57
  .loc 1 57
  .loc 1 3
  .loc 1 3
  li a0, 10
  addi sp, sp, -8
  sd a0, 0(sp)
  .loc 1 57
  .loc 1 57
  addi a0, fp, -44
  lw a0, 0(a0)
  ld a1, 0(sp)
  addi sp, sp, 8
  xor a0, a0, a1
  seqz a0, a0
  snez a0, a0
  addi sp, sp, -8
  sd a0, 0(sp)
  # ↑结束压栈↑
  .loc 1 57
  la a0, check
  mv t5, a0
  # a0传递整型参数
  ld a0, 0(sp)
  addi sp, sp, 8
  # 调用函数
  jalr t5
  .loc 1 59
  .loc 1 59
  .loc 1 59
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
