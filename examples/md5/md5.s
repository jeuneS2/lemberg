	.file	"md5.opt.bc"
                                        ; Start of file scope inline assembly
.stabs "_lseek is not implemented and will always fail",30,0,0,0
.stabs "_lseek",1,0,0,0

.stabs "_kill is not implemented and will always fail",30,0,0,0
.stabs "_kill",1,0,0,0

.stabs "_fstat is not implemented and will always fail",30,0,0,0
.stabs "_fstat",1,0,0,0

.stabs "_getpid is not implemented and will always fail",30,0,0,0
.stabs "_getpid",1,0,0,0

                                        ; End of file scope inline assembly
	.text
	.align	4
_md5_process:                           ; @md5_process
	.size	_md5_process_end-_md5_process
_md5_process_start:
; BB#0:                                 ; %entry
#0:	       ldiu	160 -> r3
#1:	       wb.s	r15, 40
	;;
#0:	       sub	r15, r3 -> r15
#1:	       ldiu	128 -> r3
	;;
#0:	       add	r15, r3 -> r3
	;;
#0:	       stm.s	r10, r3, 3
	;;
#0:	       stm.s	r11, r3, 2
	;;
#0:	       stm.s	r12, r3, 1
	;;
#0:	       stm.s	r13, r3, 0
#1:	       ldx	$rb, 0 -> r3
	;;
#0:	       stm.s	r14, r15, 31
	;;
#3:	       stm.s	r3.23, r15, 30
	;;
#0:	       stm.s	r3, r15, 29
#1:	       ldx	$ro, 0 -> r3
	;;
#0:	       stm.s	r3, r15, 28
	;;
#0:	       ldm.f	r0, 8
	;;
#3:	       ldx	$mem, 0 -> r3.23
#0:	       ldm.f	r0, 12
	;;
#0:	       ldx	$mem, 0 -> r10
#1:	       ldm.f	r0, 16
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       stm.s	r2, r15, 11
	;;
#0:	       ldm.f	r0, 20
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       stm.s	r2, r15, 8
	;;
#0:	       stm.s	r0, r15, 1
#1:	       and	r1, 3 -> r0
	;;
#0:	       brz ne @	r0, .BB0_2
	;;
.BB0_1:                                 ; %bb1
#0:	       br @	.BB0_3
	;;
.BB0_2:                                 ; %bb2
#0:	       s2add	r15, 8 -> r12
#1:	       callg	_memcpy
#2:	       ldi	64 -> r2
	;;
#0:	       add	r12, 16 -> r11
	;;
#0:	       or	r11, 0 -> r0
	;;
	       nop	0
	;;
#0:	       or	r11, 0 -> r1
	;;
.BB0_3:                                 ; %bb10
#0:	       ldm.s	r15, 32
#1:	       xor	r10, -1 -> r2
#2:	       ldiu	1878 -> r6
#3:	       ldiu	219 -> r7
	;;
#0:	       ldim	246 -> r6
#1:	       ldim	14 -> r7
#2:	       ldiu	1774 -> r8
#3:	       ldiu	1555 -> r9
	;;
#0:	       ldx	$mem, 0 -> r0
#1:	       ldih	1862 -> r6
#2:	       ldih	289 -> r7
#3:	       ldim	953 -> r8
	;;
#0:	       ldm.s	r15, 44
#1:	       and	r0, r2 -> r2
#2:	       ldih	1549 -> r8
#3:	       ldim	520 -> r9
	;;
#0:	       ldih	1345 -> r9
#1:	       ldiu	945 -> r1.16
#2:	       ldiu	1378 -> r2.19
	;;
#0:	       ldx	$mem, 0 -> r0
#1:	       ldim	2027 -> r1.16
#2:	       ldim	964 -> r2.19
	;;
#0:	       and	r0, r10 -> r0
#2:	       ldm.f	r1, 0
#1:	       ldiu	33 -> r1.17
	;;
#0:	       or	r2, r0 -> r2
#1:	       ldim	641 -> r1.17
#2:	       ldih	1968 -> r2.19
	;;
#0:	       ldx	$mem, 0 -> r0
#1:	       ldih	589 -> r1.17
	;;
#3:	       add	r3.23, r2 -> r2
#0:	       stm.s	r0, r15, 7
	;;
#0:	       add	r2, r0 -> r0
#1:	       ldga	697464 -> r2
#2:	       ldm.f	r1, 4
	;;
#0:	       ldih	1723 -> r2
	;;
#0:	       add	r0, r2 -> r0
	;;
#0:	       rl	r0, 7 -> r0
	;;
#0:	       add	r0, r10 -> r2
#1:	       ldx	$mem, 0 -> r0
	;;
#0:	       stm.s	r0, r15, 10
#1:	       xor	r2, -1 -> r3
#2:	       and	r2, r10 -> r5
	;;
#0:	       ldm.s	r15, 44
	;;
#3:	       ldiu	1967 -> r3.16
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       ldm.s	r15, 32
#1:	       and	r0, r3 -> r4
	;;
#3:	       ldim	158 -> r3.16
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       ldm.s	r15, 40
	;;
#3:	       ldih	1114 -> r3.16
	;;
#0:	       ldx	$mem, 0 -> r3
	;;
#0:	       add	r0, r3 -> r3
#1:	       or	r5, r4 -> r0
#2:	       ldm.f	r1, 8
	;;
#0:	       add	r3, r0 -> r0
	;;
#0:	       add	r0, r6 -> r0
	;;
#0:	       rl	r0, 12 -> r0
	;;
#0:	       add	r0, r2 -> r4
#1:	       ldx	$mem, 0 -> r0
	;;
#0:	       stm.s	r0, r15, 9
#1:	       xor	r4, -1 -> r3
#2:	       and	r4, r2 -> r6
	;;
#0:	       ldm.s	r15, 44
#1:	       and	r10, r3 -> r5
	;;
#3:	       ldiu	403 -> r3.17
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       ldm.s	r15, 36
	;;
#3:	       ldim	782 -> r3.17
	;;
#0:	       ldx	$mem, 0 -> r3
	;;
#0:	       add	r0, r3 -> r3
#1:	       or	r6, r5 -> r0
#2:	       ldm.f	r1, 12
	;;
#0:	       add	r3, r0 -> r0
	;;
#0:	       add	r0, r7 -> r0
	;;
#0:	       rl	r0, 17 -> r0
	;;
#0:	       add	r0, r4 -> r5
#1:	       ldx	$mem, 0 -> r0
	;;
#0:	       xor	r5, -1 -> r3
#1:	       and	r5, r4 -> r7
#2:	       stm.s	r0, r15, 6
	;;
#0:	       and	r2, r3 -> r6
#1:	       add	r10, r0 -> r3
#2:	       ldm.f	r1, 16
	;;
#0:	       or	r7, r6 -> r0
	;;
#0:	       add	r3, r0 -> r0
	;;
#0:	       add	r0, r8 -> r0
#1:	       ldiu	1967 -> r8
	;;
#0:	       rl	r0, 22 -> r0
#1:	       ldim	897 -> r8
	;;
#0:	       add	r0, r5 -> r3
#1:	       ldx	$mem, 0 -> r0
#2:	       ldih	1963 -> r8
	;;
#0:	       xor	r3, -1 -> r6
#1:	       and	r3, r5 -> r7
#2:	       stm.s	r0, r15, 5
#3:	       add	r0, r2 -> r2
	;;
#0:	       and	r4, r6 -> r6
#1:	       ldm.f	r1, 20
	;;
#0:	       or	r7, r6 -> r0
#1:	       ldiu	1578 -> r7
	;;
#0:	       add	r2, r0 -> r0
#1:	       ldim	248 -> r7
	;;
#0:	       add	r0, r8 -> r0
#1:	       ldx	$mem, 0 -> r8
#2:	       ldih	572 -> r7
#3:	       ldm.f	r1, 24
	;;
#0:	       rl	r0, 7 -> r0
#1:	       add	r8, r4 -> r4
	;;
#0:	       add	r0, r3 -> r2
	;;
#0:	       xor	r2, -1 -> r0
#1:	       and	r2, r3 -> r6
	;;
#0:	       and	r5, r0 -> r0
	;;
#0:	       or	r6, r0 -> r0
	;;
#0:	       add	r4, r0 -> r0
	;;
#0:	       add	r0, r7 -> r0
	;;
#0:	       rl	r0, 12 -> r0
	;;
#0:	       add	r0, r2 -> r4
#1:	       ldx	$mem, 0 -> r0
	;;
#0:	       xor	r4, -1 -> r6
#1:	       and	r4, r2 -> r7
#2:	       stm.s	r0, r15, 4
#3:	       add	r0, r5 -> r5
	;;
#0:	       and	r3, r6 -> r6
#1:	       ldm.f	r1, 28
	;;
#0:	       or	r7, r6 -> r0
#1:	       ldiu	1281 -> r6
	;;
#0:	       add	r5, r0 -> r0
#1:	       ldx	$mem, 0 -> r7
#2:	       ldim	210 -> r6
#3:	       ldm.f	r1, 32
	;;
#0:	       add	r0, r9 -> r0
#1:	       add	r7, r3 -> r3
#2:	       ldih	2026 -> r6
	;;
#0:	       rl	r0, 17 -> r0
	;;
#0:	       add	r0, r4 -> r9
	;;
#0:	       xor	r9, -1 -> r0
#1:	       and	r9, r4 -> r5
	;;
#0:	       and	r2, r0 -> r0
	;;
#0:	       or	r5, r0 -> r0
	;;
#0:	       add	r3, r0 -> r0
	;;
#0:	       add	r0, r6 -> r0
#1:	       ldx	$mem, 0 -> r6
#2:	       ldm.f	r1, 36
	;;
#0:	       rl	r0, 22 -> r0
#1:	       add	r6, r2 -> r2
	;;
#0:	       add	r0, r9 -> r3
	;;
#0:	       xor	r3, -1 -> r0
#1:	       and	r3, r9 -> r5
	;;
#0:	       and	r4, r0 -> r0
	;;
#0:	       or	r5, r0 -> r0
	;;
#0:	       add	r2, r0 -> r2
#1:	       ldga	39128 -> r0
	;;
#0:	       ldih	844 -> r0
	;;
#0:	       add	r2, r0 -> r0
#1:	       ldx	$mem, 0 -> r2
	;;
#0:	       rl	r0, 7 -> r0
#1:	       stm.s	r2, r15, 3
#2:	       add	r2, r4 -> r4
	;;
#0:	       add	r0, r3 -> r0
#1:	       ldm.f	r1, 40
	;;
#1:	       xor	r0, -1 -> r5
#0:	       and	r0, r3 -> r0.16
	;;
#0:	       and	r9, r5 -> r5
	;;
#0:	       or	r0.16, r5 -> r2
#1:	       ldx	$mem, 0 -> r5
#2:	       ldm.f	r1, 44
	;;
#0:	       add	r4, r2 -> r2
#1:	       add	r5, r9 -> r9
	;;
#3:	       add	r2, r3.16 -> r2
	;;
#0:	       rl	r2, 12 -> r2
	;;
#0:	       add	r2, r0 -> r2
	;;
#0:	       xor	r2, -1 -> r4
#2:	       and	r2, r0 -> r2.16
	;;
#0:	       and	r3, r4 -> r4
	;;
#2:	       or	r2.16, r4 -> r4
#3:	       ldiu	1982 -> r3.16
	;;
#0:	       add	r9, r4 -> r4
	;;
#1:	       add	r4, r1.16 -> r4
#3:	       ldim	922 -> r3.16
	;;
#0:	       rl	r4, 17 -> r4
#1:	       ldiu	290 -> r1.16
	;;
#0:	       add	r4, r2 -> r12
#2:	       ldx	$mem, 0 -> r4
#1:	       ldim	514 -> r1.16
	;;
#1:	       xor	r12, -1 -> r9
#0:	       and	r12, r2 -> r0.16
#2:	       stm.s	r4, r15, 2
#3:	       add	r4, r3 -> r4
	;;
#0:	       and	r0, r9 -> r9
#2:	       ldm.f	r1, 48
#1:	       ldih	860 -> r1.16
	;;
#0:	       or	r0.16, r9 -> r3
#3:	       ldih	1098 -> r3.16
	;;
#0:	       add	r4, r3 -> r3
#1:	       ldx	$mem, 0 -> r4
#2:	       ldm.f	r1, 52
	;;
#3:	       add	r3, r3.16 -> r3
#0:	       add	r4, r0 -> r9
	;;
#0:	       rl	r3, 22 -> r3
	;;
#0:	       add	r3, r12 -> r11
	;;
#0:	       xor	r11, -1 -> r3
#2:	       and	r11, r12 -> r2.16
	;;
#0:	       and	r2, r3 -> r3
	;;
#2:	       or	r2.16, r3 -> r0
#0:	       ldx	$mem, 0 -> r3
#1:	       ldm.f	r1, 56
	;;
#0:	       add	r9, r0 -> r0
#1:	       add	r3, r2 -> r2
	;;
#1:	       add	r0, r1.16 -> r0
#3:	       ldih	2028 -> r3.17
	;;
#0:	       rl	r0, 7 -> r0
	;;
#0:	       add	r0, r11 -> r9
	;;
#1:	       xor	r9, -1 -> r0
#0:	       and	r9, r11 -> r0.16
	;;
#0:	       and	r12, r0 -> r0
	;;
#0:	       or	r0.16, r0 -> r0
#3:	       ldiu	290 -> r3.16
	;;
#1:	       add	r2, r0 -> r0
#2:	       ldx	$mem, 0 -> r2
#0:	       ldiu	910 -> r0.16
#3:	       ldm.f	r1, 60
	;;
#3:	       add	r0, r3.17 -> r0
#0:	       ldim	808 -> r0.16
	;;
#1:	       rl	r0, 12 -> r0
#0:	       ldih	1331 -> r0.16
#2:	       ldx	$mem, 0 -> r1
#3:	       ldm.s	r15, 40
	;;
#0:	       add	r0, r9 -> r0
#1:	       add	r1, r11 -> r1.16
	;;
#2:	       xor	r0, -1 -> r2.17
#3:	       add	r2, r12 -> r3.17
	;;
#2:	       and	r0, r9 -> r2.18
#3:	       ldim	940 -> r3.16
	;;
#2:	       and	r11, r2.17 -> r2.16
#3:	       ldih	876 -> r3.16
	;;
#2:	       or	r2.18, r2.16 -> r12
	;;
#3:	       add	r3.17, r12 -> r12
	;;
#0:	       add	r12, r0.16 -> r0.16
	;;
#0:	       rl	r0.16, 17 -> r0.16
	;;
#0:	       add	r0.16, r0 -> r14
	;;
#0:	       xor	r14, -1 -> r0.16
#2:	       and	r14, r2.17 -> r2.16
	;;
#0:	       and	r14, r0 -> r0.18
	;;
#0:	       and	r9, r0.16 -> r0.17
	;;
#0:	       or	r0.18, r0.17 -> r11
	;;
#1:	       add	r1.16, r11 -> r1.16
#0:	       ldx	$mem, 0 -> r11
	;;
#1:	       add	r1.16, r1.17 -> r1.16
#3:	       add	r11, r9 -> r3.17
#0:	       ldm.s	r15, 16
	;;
#1:	       rl	r1.16, 22 -> r1.16
	;;
#1:	       add	r1.16, r14 -> r13
	;;
#2:	       and	r13, r0 -> r2.18
#0:	       and	r13, r0.16 -> r0.16
	;;
#2:	       or	r2.18, r2.16 -> r9
	;;
#3:	       add	r3.17, r9 -> r9
#2:	       ldiu	729 -> r2.18
	;;
#2:	       add	r9, r2.19 -> r9
	;;
#0:	       rl	r9, 5 -> r9
#2:	       ldim	480 -> r2.18
	;;
#0:	       add	r9, r13 -> r12
#1:	       ldx	$mem, 0 -> r9
	;;
#0:	       and	r12, r14 -> r0.17
#1:	       add	r9, r0 -> r9
#2:	       ldm.s	r15, 8
	;;
#0:	       or	r0.17, r0.16 -> r0
#2:	       ldih	827 -> r2.18
	;;
#1:	       add	r9, r0 -> r9
#2:	       ldga	45888 -> r0
#0:	       ldiu	593 -> r0.16
	;;
#1:	       ldih	1538 -> r0
#0:	       ldim	971 -> r0.16
	;;
#1:	       add	r9, r0 -> r0
#0:	       ldih	306 -> r0.16
	;;
#1:	       rl	r0, 9 -> r0
#0:	       ldiu	1162 -> r0.17
	;;
#1:	       add	r0, r12 -> r11
#2:	       xor	r13, -1 -> r0
#0:	       ldim	329 -> r0.17
	;;
#1:	       and	r12, r0 -> r9
#2:	       ldx	$mem, 0 -> r0
#0:	       ldih	1129 -> r0.17
	;;
#2:	       and	r11, r13 -> r2.16
#3:	       add	r0, r14 -> r3.17
#0:	       ldm.s	r15, 28
	;;
#2:	       or	r2.16, r9 -> r0
#0:	       xor	r12, -1 -> r9
	;;
#3:	       add	r3.17, r0 -> r0
#2:	       ldiu	1962 -> r2.16
#0:	       and	r11, r9 -> r14
#1:	       ldx	$mem, 0 -> r9
	;;
#0:	       add	r0, r0.16 -> r0
#2:	       ldim	728 -> r2.16
#1:	       add	r9, r13 -> r1.16
#3:	       add	r8, r12 -> r3.17
	;;
#0:	       rl	r0, 14 -> r0
#2:	       ldih	1869 -> r2.16
#1:	       ldm.s	r15, 20
	;;
#0:	       add	r0, r11 -> r0
	;;
#0:	       and	r0, r12 -> r0.16
	;;
#0:	       or	r0.16, r14 -> r9
	;;
#1:	       add	r1.16, r9 -> r9
#0:	       ldiu	93 -> r0.16
	;;
#2:	       add	r9, r2.16 -> r9
#0:	       ldim	482 -> r0.16
#1:	       add	r5, r11 -> r1.16
	;;
#1:	       rl	r9, 20 -> r9
#0:	       ldih	1713 -> r0.16
	;;
#0:	       add	r9, r0 -> r13
#1:	       xor	r11, -1 -> r9
	;;
#2:	       and	r13, r11 -> r2.16
#0:	       and	r0, r9 -> r9
	;;
#2:	       or	r2.16, r9 -> r9
	;;
#3:	       add	r3.17, r9 -> r9
#2:	       ldiu	1107 -> r2.16
	;;
#0:	       add	r9, r0.16 -> r9
#2:	       ldim	130 -> r2.16
#3:	       add	r1, r0 -> r3.17
	;;
#0:	       rl	r9, 5 -> r9
#2:	       ldih	18 -> r2.16
	;;
#0:	       add	r9, r13 -> r12
#1:	       xor	r0, -1 -> r9
	;;
#0:	       and	r12, r0 -> r0.16
#1:	       and	r13, r9 -> r9
	;;
#0:	       or	r0.16, r9 -> r9
	;;
#1:	       add	r1.16, r9 -> r9
#0:	       ldiu	1665 -> r0.16
	;;
#2:	       add	r9, r2.16 -> r9
#0:	       ldim	60 -> r0.16
	;;
#1:	       rl	r9, 9 -> r9
#0:	       ldih	1733 -> r0.16
#2:	       ldiu	1665 -> r2.16
	;;
#0:	       add	r9, r12 -> r11
#1:	       xor	r13, -1 -> r9
	;;
#2:	       and	r11, r13 -> r2.17
#0:	       and	r12, r9 -> r9
	;;
#2:	       or	r2.17, r9 -> r0
	;;
#3:	       add	r3.17, r0 -> r0
#2:	       ldim	574 -> r2.16
	;;
#0:	       add	r0, r0.16 -> r0
#2:	       ldih	1083 -> r2.16
	;;
#0:	       rl	r0, 14 -> r0
	;;
#0:	       add	r0, r11 -> r9
#1:	       xor	r12, -1 -> r0
	;;
#1:	       and	r11, r0 -> r14
#2:	       ldx	$mem, 0 -> r0
#0:	       and	r9, r12 -> r0.16
	;;
#1:	       add	r0, r13 -> r1.16
#0:	       or	r0.16, r14 -> r0
#2:	       ldm.s	r15, 12
	;;
#1:	       add	r1.16, r0 -> r13
#0:	       ldga	1309640 -> r0
	;;
#0:	       ldih	1854 -> r0
#1:	       ldiu	1510 -> r1.16
	;;
#0:	       add	r13, r0 -> r0
#1:	       ldim	57 -> r1.16
	;;
#0:	       rl	r0, 20 -> r0
#1:	       ldih	271 -> r1.16
	;;
#0:	       add	r0, r9 -> r13
#1:	       xor	r11, -1 -> r0
	;;
#0:	       and	r9, r0 -> r14
#1:	       ldx	$mem, 0 -> r0
	;;
#2:	       and	r13, r11 -> r2.17
#3:	       add	r0, r12 -> r3.17
#0:	       ldm.s	r15, 24
	;;
#2:	       or	r2.17, r14 -> r0
	;;
#3:	       add	r3.17, r0 -> r0
	;;
#1:	       add	r0, r1.16 -> r0
#3:	       ldiu	2006 -> r3.17
	;;
#0:	       rl	r0, 5 -> r0
#1:	       add	r2, r11 -> r1.16
	;;
#0:	       add	r0, r13 -> r12
#1:	       xor	r9, -1 -> r0
	;;
#0:	       and	r12, r9 -> r0.16
#1:	       and	r13, r0 -> r0
	;;
#3:	       ldim	736 -> r3.17
#0:	       or	r0.16, r0 -> r0
	;;
#1:	       add	r1.16, r0 -> r0
#3:	       ldih	1561 -> r3.17
	;;
#3:	       add	r0, r3.17 -> r0
#1:	       ldiu	1415 -> r1.16
	;;
#0:	       rl	r0, 9 -> r0
#1:	       ldim	673 -> r1.16
	;;
#0:	       add	r0, r12 -> r11
#2:	       xor	r13, -1 -> r0
#1:	       ldih	1958 -> r1.16
	;;
#0:	       and	r12, r0 -> r14
#1:	       ldx	$mem, 0 -> r0
	;;
#2:	       and	r11, r13 -> r2.17
#0:	       add	r0, r9 -> r9
#1:	       ldm.s	r15, 36
	;;
#2:	       or	r2.17, r14 -> r0
#3:	       ldiu	1261 -> r3.17
	;;
#0:	       add	r9, r0 -> r0
#1:	       add	r6, r13 -> r9
	;;
#1:	       add	r0, r1.16 -> r0
#3:	       ldim	834 -> r3.17
	;;
#0:	       rl	r0, 14 -> r0
#1:	       ldiu	261 -> r1.16
	;;
#0:	       add	r0, r11 -> r14
#2:	       xor	r12, -1 -> r0
#1:	       ldim	125 -> r1.16
	;;
#0:	       and	r14, r12 -> r0.16
#2:	       and	r11, r0 -> r0
#1:	       ldih	1359 -> r1.16
	;;
#0:	       or	r0.16, r0 -> r0
#3:	       ldih	554 -> r3.17
	;;
#0:	       add	r9, r0 -> r0
#1:	       add	r3, r12 -> r9
	;;
#3:	       add	r0, r3.17 -> r0
	;;
#0:	       rl	r0, 20 -> r0
	;;
#0:	       add	r0, r14 -> r13
#1:	       xor	r11, -1 -> r0
	;;
#2:	       and	r13, r11 -> r2.17
#0:	       and	r14, r0 -> r0
	;;
#2:	       or	r2.17, r0 -> r0
#3:	       add	r7, r14 -> r3.17
	;;
#0:	       add	r9, r0 -> r0
	;;
#1:	       add	r0, r1.16 -> r0
	;;
#0:	       rl	r0, 5 -> r0
	;;
#0:	       add	r0, r13 -> r12
#1:	       xor	r14, -1 -> r0
	;;
#1:	       and	r13, r0 -> r9
#2:	       ldx	$mem, 0 -> r0
#0:	       and	r12, r14 -> r0.16
	;;
#1:	       add	r0, r11 -> r1.16
#0:	       or	r0.16, r9 -> r0
#2:	       ldm.s	r15, 8
	;;
#1:	       add	r1.16, r0 -> r9
#0:	       ldga	1025016 -> r0
	;;
#0:	       ldih	2023 -> r0
#1:	       add	r4, r13 -> r1.16
	;;
#0:	       add	r9, r0 -> r0
#1:	       xor	r13, -1 -> r9
	;;
#0:	       rl	r0, 9 -> r0
#1:	       and	r12, r9 -> r9
	;;
#0:	       add	r0, r12 -> r0
	;;
#2:	       and	r0, r13 -> r2.17
#0:	       ldx	$mem, 0 -> r13
	;;
#2:	       or	r2.17, r9 -> r9
#0:	       ldm.s	r15, 40
	;;
#3:	       add	r3.17, r9 -> r9
	;;
#2:	       add	r9, r2.18 -> r9
#3:	       xor	r12, -1 -> r3.17
	;;
#0:	       rl	r9, 14 -> r9
	;;
#0:	       add	r9, r0 -> r9
	;;
#3:	       and	r0, r3.17 -> r11
#0:	       and	r9, r12 -> r0.16
#2:	       xor	r9, r0 -> r2.17
	;;
#0:	       or	r0.16, r11 -> r11
#3:	       add	r8, r12 -> r3.17
	;;
#1:	       add	r1.16, r11 -> r11
	;;
#0:	       add	r11, r0.17 -> r0.16
#1:	       ldiu	322 -> r1.16
	;;
#0:	       rl	r0.16, 20 -> r0.16
#1:	       ldim	1863 -> r1.16
	;;
#0:	       add	r0.16, r9 -> r11
	;;
#2:	       xor	r2.17, r11 -> r12
#0:	       xor	r11, r9 -> r0.16
	;;
#3:	       add	r3.17, r12 -> r12
#0:	       ldiu	1285 -> r0.17
	;;
#1:	       add	r12, r1.16 -> r1.16
#3:	       add	r13, r9 -> r3.17
#0:	       ldim	259 -> r0.17
	;;
#1:	       rl	r1.16, 4 -> r1.16
#0:	       ldih	36 -> r0.17
	;;
#1:	       add	r1.16, r11 -> r12
	;;
#1:	       add	r6, r0 -> r1.16
#0:	       xor	r0.16, r12 -> r0
	;;
#1:	       add	r1.16, r0 -> r0
	;;
#2:	       add	r0, r2.16 -> r0
#1:	       add	r2, r11 -> r1.16
	;;
#0:	       rl	r0, 11 -> r0
#2:	       xor	r12, r11 -> r2.16
	;;
#0:	       add	r0, r12 -> r0
	;;
#2:	       xor	r2.16, r0 -> r9
	;;
#3:	       add	r3.17, r9 -> r9
	;;
#3:	       add	r9, r3.16 -> r9
	;;
#0:	       rl	r9, 16 -> r9
	;;
#0:	       add	r9, r0 -> r13
#1:	       xor	r0, r12 -> r9
	;;
#0:	       xor	r9, r13 -> r9
#2:	       xor	r13, r0 -> r2.16
	;;
#1:	       add	r1.16, r9 -> r9
#3:	       ldiu	133 -> r3.17
	;;
#1:	       ldga	342028 -> r1.16
#3:	       ldim	486 -> r3.17
	;;
#1:	       ldih	2031 -> r1.16
#3:	       ldih	1703 -> r3.17
	;;
#1:	       add	r9, r1.16 -> r9
	;;
#0:	       rl	r9, 23 -> r9
	;;
#0:	       add	r9, r13 -> r11
#1:	       ldx	$mem, 0 -> r9
	;;
#3:	       add	r9, r12 -> r3.16
#2:	       xor	r2.16, r11 -> r9
#1:	       ldm.s	r15, 20
#0:	       xor	r11, r13 -> r0.16
	;;
#2:	       ldga	2026052 -> r2.16
#3:	       add	r3.16, r9 -> r9
	;;
#2:	       ldih	1317 -> r2.16
#0:	       ldx	$mem, 0 -> r12
	;;
#2:	       add	r9, r2.16 -> r9
#3:	       ldiu	1961 -> r3.16
#1:	       add	r12, r0 -> r1.16
#0:	       ldm.s	r15, 28
	;;
#0:	       rl	r9, 4 -> r9
	;;
#0:	       add	r9, r11 -> r9
	;;
#3:	       ldim	985 -> r3.16
#0:	       xor	r0.16, r9 -> r0
	;;
#1:	       add	r1.16, r0 -> r0
#3:	       ldih	606 -> r3.16
	;;
#3:	       add	r0, r3.16 -> r0
#1:	       add	r5, r11 -> r1.16
	;;
#0:	       rl	r0, 11 -> r0
	;;
#0:	       add	r0, r9 -> r12
#1:	       xor	r9, r11 -> r0
	;;
#3:	       add	r7, r13 -> r3.16
#0:	       xor	r0, r12 -> r0
	;;
#3:	       add	r3.16, r0 -> r3.16
#0:	       ldga	1788768 -> r0
	;;
#0:	       ldih	1973 -> r0
	;;
#3:	       add	r3.16, r0 -> r0
	;;
#0:	       rl	r0, 16 -> r0
	;;
#0:	       add	r0, r12 -> r13
#1:	       xor	r12, r9 -> r0
	;;
#0:	       xor	r0, r13 -> r0
#2:	       xor	r13, r12 -> r2.16
	;;
#1:	       add	r1.16, r0 -> r11
#0:	       ldga	2079856 -> r0
	;;
#0:	       ldih	1525 -> r0
#1:	       ldiu	1734 -> r1.16
	;;
#0:	       add	r11, r0 -> r0
#1:	       ldim	879 -> r1.16
	;;
#0:	       rl	r0, 23 -> r0
#1:	       ldih	324 -> r1.16
	;;
#0:	       add	r0, r13 -> r0
	;;
#3:	       add	r3, r9 -> r3.16
#2:	       xor	r2.16, r0 -> r9
#0:	       xor	r0, r13 -> r0.16
	;;
#3:	       add	r3.16, r9 -> r9
#2:	       ldiu	2042 -> r2.16
	;;
#1:	       add	r9, r1.16 -> r9
#2:	       ldim	36 -> r2.16
	;;
#0:	       rl	r9, 4 -> r9
#2:	       ldih	1877 -> r2.16
	;;
#0:	       add	r9, r0 -> r11
#1:	       ldx	$mem, 0 -> r9
	;;
#1:	       add	r9, r12 -> r1.16
#0:	       xor	r0.16, r11 -> r9
#2:	       ldm.s	r15, 24
	;;
#1:	       add	r1.16, r9 -> r9
	;;
#2:	       add	r9, r2.16 -> r9
	;;
#0:	       rl	r9, 11 -> r9
#2:	       xor	r11, r0 -> r2.16
	;;
#0:	       add	r9, r11 -> r12
#1:	       ldx	$mem, 0 -> r9
	;;
#3:	       add	r9, r13 -> r3.16
#2:	       xor	r2.16, r12 -> r9
#1:	       ldm.s	r15, 16
#0:	       xor	r12, r11 -> r0.16
	;;
#3:	       add	r3.16, r9 -> r9
	;;
#3:	       add	r9, r3.17 -> r9
#0:	       ldx	$mem, 0 -> r13
	;;
#0:	       rl	r9, 16 -> r9
#1:	       add	r13, r0 -> r1.16
#2:	       ldm.s	r15, 12
	;;
#0:	       add	r9, r12 -> r9
	;;
#0:	       xor	r0.16, r9 -> r0
#2:	       xor	r9, r12 -> r2.16
	;;
#1:	       add	r1.16, r0 -> r0
#0:	       ldiu	57 -> r0.16
	;;
#0:	       add	r0, r0.17 -> r0
#1:	       ldiu	57 -> r1.16
	;;
#2:	       rl	r0, 23 -> r0
#1:	       ldim	666 -> r1.16
#0:	       ldim	628 -> r0.16
	;;
#2:	       add	r0, r9 -> r13
#3:	       ldx	$mem, 0 -> r0
#1:	       ldih	1742 -> r1.16
#0:	       ldih	2020 -> r0.16
	;;
#3:	       add	r0, r11 -> r3.16
#2:	       xor	r2.16, r13 -> r0
#0:	       ldm.s	r15, 36
	;;
#3:	       add	r3.16, r0 -> r0
#2:	       ldiu	485 -> r2.16
	;;
#1:	       add	r0, r1.16 -> r0
#2:	       ldim	883 -> r2.16
#3:	       add	r1, r9 -> r3.16
	;;
#0:	       rl	r0, 4 -> r0
#1:	       add	r4, r12 -> r1.16
#2:	       ldih	1846 -> r2.16
	;;
#0:	       add	r0, r13 -> r11
#1:	       xor	r13, r9 -> r0
	;;
#0:	       xor	r0, r11 -> r0
	;;
#1:	       add	r1.16, r0 -> r0
	;;
#2:	       add	r0, r2.16 -> r0
#1:	       ldga	163064 -> r1.16
	;;
#0:	       rl	r0, 11 -> r0
#2:	       xor	r11, r13 -> r2.16
#1:	       ldih	253 -> r1.16
	;;
#0:	       add	r0, r11 -> r0
	;;
#2:	       xor	r2.16, r0 -> r9
#0:	       xor	r0, r11 -> r0.17
#1:	       add	r7, r0 -> r7
	;;
#3:	       add	r3.16, r9 -> r9
#2:	       ldiu	1637 -> r2.16
	;;
#1:	       add	r9, r1.16 -> r9
#2:	       ldim	394 -> r2.16
	;;
#0:	       rl	r9, 16 -> r9
#2:	       ldih	1573 -> r2.16
	;;
#0:	       add	r9, r0 -> r12
#1:	       ldx	$mem, 0 -> r9
	;;
#1:	       add	r9, r13 -> r1.16
#0:	       xor	r0.17, r12 -> r9
#2:	       ldm.s	r15, 28
	;;
#1:	       add	r1.16, r9 -> r9
	;;
#2:	       add	r9, r2.16 -> r9
	;;
#0:	       rl	r9, 23 -> r9
#2:	       ldga	598596 -> r2.16
	;;
#0:	       add	r9, r12 -> r13
#1:	       xor	r0, -1 -> r9
	;;
#3:	       or	r13, r9 -> r3.16
#0:	       ldx	$mem, 0 -> r9
	;;
#0:	       add	r9, r11 -> r0.17
#3:	       xor	r3.16, r12 -> r9
#2:	       ldih	1953 -> r2.16
#1:	       ldm.s	r15, 24
	;;
#0:	       add	r0.17, r9 -> r9
#3:	       xor	r12, -1 -> r3.16
	;;
#2:	       add	r9, r2.16 -> r9
#0:	       ldiu	1943 -> r0.17
	;;
#1:	       rl	r9, 6 -> r9
#0:	       ldim	351 -> r0.17
#2:	       ldiu	935 -> r2.16
	;;
#1:	       add	r9, r13 -> r9
#0:	       ldih	537 -> r0.17
#2:	       ldim	644 -> r2.16
	;;
#3:	       or	r9, r3.16 -> r3.16
#2:	       ldih	1372 -> r2.16
#0:	       add	r4, r9 -> r4
	;;
#3:	       xor	r3.16, r13 -> r0
	;;
#0:	       add	r7, r0 -> r0
#1:	       xor	r13, -1 -> r7
	;;
#0:	       add	r0, r0.17 -> r0
	;;
#0:	       rl	r0, 10 -> r0
	;;
#0:	       add	r0, r9 -> r0
	;;
#1:	       or	r0, r7 -> r1.16
#0:	       add	r2, r12 -> r7
	;;
#1:	       xor	r1.16, r9 -> r2
	;;
#0:	       add	r7, r2 -> r2
#1:	       add	r8, r13 -> r7
#2:	       ldiu	451 -> r8
	;;
#2:	       add	r2, r2.16 -> r2
#0:	       ldim	875 -> r8
	;;
#0:	       rl	r2, 15 -> r2
#1:	       ldih	810 -> r8
	;;
#0:	       add	r2, r0 -> r11
#1:	       xor	r9, -1 -> r2
#2:	       ldiu	1170 -> r9
	;;
#0:	       or	r11, r2 -> r2
#1:	       ldim	409 -> r9
	;;
#0:	       xor	r2, r0 -> r2
#1:	       ldih	1144 -> r9
	;;
#0:	       add	r7, r2 -> r2
	;;
#0:	       add	r2, r0.16 -> r2
	;;
#1:	       rl	r2, 21 -> r2
#0:	       ldiu	1489 -> r0.16
	;;
#1:	       add	r2, r11 -> r7
#2:	       xor	r0, -1 -> r2
#0:	       ldim	139 -> r0.16
	;;
#1:	       or	r7, r2 -> r2
#0:	       ldih	1068 -> r0.16
	;;
#0:	       xor	r2, r11 -> r2
	;;
#0:	       add	r4, r2 -> r2
	;;
#0:	       add	r2, r8 -> r2
	;;
#0:	       rl	r2, 6 -> r2
	;;
#0:	       add	r2, r7 -> r8
#1:	       xor	r11, -1 -> r2
	;;
#0:	       or	r8, r2 -> r4
#1:	       ldx	$mem, 0 -> r2
	;;
#0:	       add	r2, r0 -> r2
#1:	       xor	r4, r7 -> r0
#2:	       add	r5, r11 -> r4
#3:	       ldm.s	r15, 40
	;;
#0:	       add	r2, r0 -> r0
	;;
#0:	       add	r0, r9 -> r0
#1:	       ldiu	1149 -> r9
	;;
#0:	       rl	r0, 10 -> r0
#1:	       ldim	1534 -> r9
	;;
#0:	       add	r0, r8 -> r2
#1:	       xor	r7, -1 -> r0
	;;
#0:	       or	r2, r0 -> r0
#1:	       add	r1, r2 -> r1
	;;
#0:	       xor	r0, r8 -> r0
	;;
#0:	       add	r4, r0 -> r0
	;;
#0:	       add	r0, r9 -> r0
	;;
#0:	       rl	r0, 15 -> r0
	;;
#0:	       add	r0, r2 -> r4
#1:	       xor	r8, -1 -> r0
	;;
#0:	       or	r4, r0 -> r9
#1:	       ldx	$mem, 0 -> r0
	;;
#0:	       add	r0, r7 -> r5
#1:	       xor	r9, r2 -> r0
#2:	       ldiu	1615 -> r9
#3:	       ldm.s	r15, 16
	;;
#0:	       add	r5, r0 -> r0
#1:	       ldim	271 -> r9
#2:	       add	r6, r8 -> r5
	;;
#0:	       add	r0, r0.16 -> r0
#1:	       ldih	893 -> r9
	;;
#0:	       rl	r0, 21 -> r0
	;;
#0:	       add	r0, r4 -> r7
#1:	       xor	r2, -1 -> r0
	;;
#0:	       or	r7, r0 -> r0
	;;
#0:	       xor	r0, r4 -> r0
	;;
#0:	       add	r5, r0 -> r0
	;;
#0:	       add	r0, r9 -> r0
	;;
#0:	       rl	r0, 6 -> r0
	;;
#0:	       add	r0, r7 -> r5
#1:	       xor	r4, -1 -> r0
	;;
#0:	       or	r5, r0 -> r0
	;;
#0:	       xor	r0, r7 -> r0
	;;
#0:	       add	r1, r0 -> r1
#1:	       ldga	845536 -> r0
	;;
#0:	       ldih	2033 -> r0
	;;
#0:	       add	r1, r0 -> r0
	;;
#0:	       rl	r0, 10 -> r0
	;;
#0:	       add	r0, r5 -> r2
#1:	       xor	r7, -1 -> r0
	;;
#0:	       or	r2, r0 -> r6
#1:	       ldx	$mem, 0 -> r0
	;;
#0:	       add	r0, r4 -> r1
#1:	       xor	r6, r5 -> r0
#2:	       ldiu	417 -> r6
#3:	       ldm.s	r15, 20
	;;
#0:	       add	r1, r0 -> r1
#1:	       ldga	82708 -> r0
#2:	       ldim	258 -> r6
	;;
#0:	       ldih	1304 -> r0
#1:	       ldih	624 -> r6
	;;
#0:	       add	r1, r0 -> r0
#1:	       add	r3, r7 -> r1
#2:	       ldiu	1666 -> r7
	;;
#0:	       rl	r0, 15 -> r0
#1:	       ldim	623 -> r7
	;;
#0:	       add	r0, r2 -> r4
#1:	       xor	r5, -1 -> r0
#2:	       ldih	1978 -> r7
	;;
#0:	       or	r4, r0 -> r0
	;;
#0:	       xor	r0, r2 -> r0
	;;
#0:	       add	r1, r0 -> r0
	;;
#0:	       add	r0, r6 -> r0
	;;
#0:	       rl	r0, 21 -> r0
	;;
#0:	       add	r0, r4 -> r1
#1:	       xor	r2, -1 -> r0
	;;
#0:	       or	r1, r0 -> r6
#1:	       ldx	$mem, 0 -> r0
	;;
#0:	       add	r0, r5 -> r3
#1:	       xor	r6, r4 -> r0
#2:	       ldm.s	r15, 8
#3:	       ldiu	565 -> r6
	;;
#0:	       add	r3, r0 -> r0
#1:	       ldim	862 -> r6
	;;
#0:	       add	r0, r7 -> r0
#1:	       ldih	1513 -> r6
	;;
#0:	       rl	r0, 6 -> r0
	;;
#0:	       add	r0, r1 -> r3
#1:	       xor	r4, -1 -> r0
	;;
#0:	       or	r3, r0 -> r5
#1:	       ldx	$mem, 0 -> r0
	;;
#0:	       add	r0, r2 -> r2
#1:	       xor	r5, r1 -> r0
#2:	       ldm.s	r15, 36
	;;
#0:	       add	r2, r0 -> r0
	;;
#0:	       add	r0, r6 -> r0
#1:	       ldiu	699 -> r6
	;;
#0:	       rl	r0, 10 -> r0
#1:	       ldim	762 -> r6
	;;
#0:	       add	r0, r3 -> r2
#1:	       xor	r1, -1 -> r0
#2:	       ldih	342 -> r6
	;;
#0:	       or	r2, r0 -> r5
#1:	       ldx	$mem, 0 -> r0
	;;
#0:	       add	r0, r4 -> r4
#1:	       xor	r5, r3 -> r0
#2:	       ldm.s	r15, 12
	;;
#0:	       add	r4, r0 -> r0
	;;
#0:	       add	r0, r6 -> r0
#1:	       ldiu	913 -> r6
	;;
#0:	       rl	r0, 15 -> r0
#1:	       ldim	218 -> r6
	;;
#0:	       add	r0, r2 -> r4
#1:	       xor	r3, -1 -> r0
#2:	       ldih	1884 -> r6
	;;
#0:	       or	r4, r0 -> r5
#1:	       ldx	$mem, 0 -> r0
	;;
#0:	       add	r0, r1 -> r1
#1:	       xor	r5, r2 -> r0
#2:	       ldm.s	r15, 4
#3:	       add	r4, r10 -> r5
	;;
#0:	       add	r1, r0 -> r0
	;;
#0:	       add	r0, r6 -> r0
	;;
#0:	       rl	r0, 21 -> r0
	;;
#3:	       add	r3, r3.23 -> r1
#0:	       add	r5, r0 -> r3
#1:	       ldx	$mem, 0 -> r5
	;;
#0:	       stm.a	r1, r5, 2
	;;
#0:	       ldm.s	r15, 44
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       stm.a	r3, r5, 3
#1:	       add	r4, r0 -> r1
	;;
#0:	       ldm.s	r15, 32
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       add	r2, r0 -> r0
#1:	       stm.a	r1, r5, 4
	;;
#0:	       stm.a	r0, r5, 5
	;;
#0:	       ldm.s	r15, 112
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       stx	r0 -> $ro
	;;
#0:	       ldm.s	r15, 116
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       stx	r0 -> $rb
#1:	       ldiu	160 -> r0
	;;
#0:	       ldm.s	r15, 120
	;;
#3:	       ldx	$mem, 0 -> r3.23
	;;
#0:	       ldm.s	r15, 124
	;;
#0:	       ldx	$mem, 0 -> r14
	;;
#0:	       ldm.s	r15, 128
	;;
#0:	       ldx	$mem, 0 -> r13
	;;
#0:	       ldm.s	r15, 132
	;;
#0:	       ldx	$mem, 0 -> r12
	;;
#0:	       ldm.s	r15, 136
	;;
#0:	       ldx	$mem, 0 -> r11
	;;
#0:	       ldm.s	r15, 140
#1:	       add	r15, r0 -> r15
	;;
#0:	       jop	ret
#1:	       ldx	$mem, 0 -> r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
_md5_process_end:

	.align	4
_md5_append:                            ; @md5_append
	.size	_md5_append_end-_md5_append
_md5_append_start:
; BB#0:                                 ; %entry
#0:	       ldiu	56 -> r3
#1:	       wb.s	r15, 14
	;;
#0:	       sub	r15, r3 -> r15
#1:	       ldx	$rb, 0 -> r3
	;;
#0:	       stm.s	r10, r15, 9
#1:	       or	r2, 0 -> r10
	;;
#0:	       stm.s	r11, r15, 8
#1:	       cmplt	r10, 1 -> c1
	;;
#0:	       stm.s	r12, r15, 7
#1:	       or	r0, 0 -> r12
	;;
#0:	       stm.s	r13, r15, 6
	;;
#0:	       stm.s	r14, r15, 5
#1:	       or	r1, 0 -> r14
	;;
#1:	       stm.s	r1.23, r15, 4
	;;
#0:	       stm.s	r3, r15, 3
#1:	       ldx	$ro, 0 -> r3
	;;
#0:	if  c1 br	.BB1_9
#1:	       stm.s	r3, r15, 2
	;;
#0:	       ldm.f	r12, 0
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
.BB1_1:                                 ; %bb
#0:	       ldm.f	r12, 4
#1:	       sra	r10, 29 -> r0
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       add	r1, r0 -> r1
#1:	       sl	r10, 3 -> r0
	;;
#0:	       add	r2, r0 -> r0
#1:	       stm.a	r1, r12, 1
	;;
#0:	       cmpule	r2, r0 -> c1
#1:	       stm.a	r0, r12, 0
	;;
#0:	if !c1 add	r1, 1 -> r0
#1:	       ldi	63 -> r1
	;;
#0:	if !c1 stm.a	r0, r12, 1
#1:	       sr	r2, 3 -> r0
	;;
#0:	       and	r0, r1 -> r2
	;;
#0:	       brz eq @	r2, .BB1_4
	;;
.BB1_2:                                 ; %bb3
#0:	       ldi	64 -> r11
#1:	       add	r2, r10 -> r0
#2:	       or	r10, 0 -> r13
#3:	       add	r12, r2 -> r1
	;;
#0:	       callg	_memcpy
#1:	       cmplt	r11, r0 -> c1
#2:	       add	r1, 24 -> r0
#3:	       or	r14, 0 -> r1
	;;
#0:	if  c1 sub	r11, r2 -> r13
	;;
#1:	       add	r13, r2 -> r1.23
#0:	       or	r13, 0 -> r2
	;;
	       nop	0
	;;
#1:	       cmplt	r1.23, r11 -> c1
	;;
#0:	if  c1 br @	.BB1_9
	;;
.BB1_3:                                 ; %bb7
#0:	       add	r12, 24 -> r1
#1:	       or	r12, 0 -> r0
#2:	       add	r14, r13 -> r14
#3:	       sub	r10, r13 -> r10
	;;
#0:	       callg	_md5_process
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB1_4:                                 ; %bb9.preheader
#0:	       ldi	64 -> r0
	;;
#0:	       cmplt	r10, r0 -> c1
	;;
#0:	if  c1 br @	.BB1_7
	;;
.BB1_5:
#0:	       ldi	-64 -> r13
#1:	       ldi	63 -> r11
#2:	       or	r14, 0 -> r1
	;;
.BB1_6:                                 ; %bb8
                                        ; =>This Inner Loop Header: Depth=1
#0:	       or	r12, 0 -> r0
#1:	       callg	_md5_process
#2:	       s2add	r1, 16 -> r14
#3:	       add	r10, r13 -> r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       cmplt	r11, r10 -> c1
#1:	       or	r14, 0 -> r1
	;;
#0:	if  c1 br @	.BB1_6
	;;
.BB1_7:                                 ; %bb10
#0:	       brz eq @	r10, .BB1_9
	;;
.BB1_8:                                 ; %bb11
#0:	       add	r12, 24 -> r0
#1:	       callg	_memcpy
#2:	       or	r14, 0 -> r1
#3:	       or	r10, 0 -> r2
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB1_9:                                 ; %return
#0:	       ldm.s	r15, 8
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       stx	r0 -> $ro
	;;
#0:	       ldm.s	r15, 12
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       stx	r0 -> $rb
	;;
#0:	       ldm.s	r15, 16
	;;
#1:	       ldx	$mem, 0 -> r1.23
	;;
#0:	       ldm.s	r15, 20
	;;
#0:	       ldx	$mem, 0 -> r14
	;;
#0:	       ldm.s	r15, 24
	;;
#0:	       ldx	$mem, 0 -> r13
	;;
#0:	       ldm.s	r15, 28
	;;
#0:	       ldx	$mem, 0 -> r12
	;;
#0:	       ldm.s	r15, 32
	;;
#0:	       ldx	$mem, 0 -> r11
	;;
#0:	       ldm.s	r15, 36
#1:	       s2add	r15, 14 -> r15
	;;
#0:	       jop	ret
#1:	       ldx	$mem, 0 -> r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
_md5_append_end:

	.globl	_main
	.align	4
_main:                                  ; @main
	.size	_main_end-_main
_main_start:
; BB#0:                                 ; %entry
#1:	       ldiu	304 -> r0
#2:	       wb.s	r15, 76
#0:	       ldx	$ro, 0 -> r0.31
	;;
#0:	       sub	r15, r0 -> r15
#1:	       ldiu	256 -> r0
	;;
#0:	       add	r15, r0 -> r0
	;;
#0:	       stm.s	r10, r0, 7
#1:	       ldiu	1791 -> r10
	;;
#0:	       stm.s	r11, r0, 6
#1:	       ldim	991 -> r10
	;;
#0:	       stm.s	r12, r0, 5
#1:	       ldih	2039 -> r10
	;;
#0:	       stm.s	r13, r0, 4
	;;
#0:	       stm.s	r14, r0, 3
#1:	       ldi	0 -> r14
	;;
#0:	       stm.s	r0.23, r0, 2
#3:	       ldx	$rb, 0 -> r3.31
	;;
#1:	       stm.s	r1.23, r0, 1
#0:	       ldi	-4 -> r0.23
	;;
#2:	       stm.s	r2.23, r0, 0
#0:	       ldiu	128 -> r0
#1:	       ldiu	1278 -> r1.23
	;;
#0:	       add	r15, r0 -> r0
#2:	       ldiu	1142 -> r2.23
#1:	       ldim	859 -> r1.23
	;;
#3:	       stm.s	r3.23, r0, 31
#2:	       ldim	586 -> r2.23
#1:	       ldih	1221 -> r1.23
	;;
#0:	       stm.s	r0.24, r0, 30
#3:	       ldiu	769 -> r3.23
#2:	       ldih	129 -> r2.23
	;;
#1:	       stm.s	r1.24, r0, 29
#0:	       ldiu	905 -> r0.24
#3:	       ldim	164 -> r3.23
	;;
#2:	       stm.s	r2.24, r0, 28
#0:	       ldim	437 -> r0.24
#3:	       ldih	826 -> r3.23
#1:	       ldi	0 -> r1.24
	;;
#3:	       stm.s	r3.24, r0, 27
#0:	       ldih	1918 -> r0.24
	;;
#2:	       stm.s	r2.25, r0, 26
#3:	       ldiu	2047 -> r3.24
	;;
#3:	       stm.s	r3.25, r0, 25
	;;
#2:	       stm.s	r2.26, r0, 24
#3:	       ldi	63 -> r3.25
	;;
#3:	       stm.s	r3.26, r0, 23
	;;
#2:	       stm.s	r2.27, r0, 22
#3:	       ldi	0 -> r3.26
	;;
#3:	       stm.s	r3.31, r0, 21
#2:	       ldi	55 -> r2.27
	;;
#0:	       stm.s	r0.31, r0, 20
#1:	       ldga	32896 -> r0
	;;
#0:	       ldih	1028 -> r0
	;;
#3:	       ldim	2043 -> r3.24
#0:	       stm.s	r0, r15, 2
	;;
.BB2_1:                                 ; %bb.nph.i
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB2_18 Depth 2
                                        ;     Child Loop BB2_13 Depth 2
                                        ;     Child Loop BB2_11 Depth 2
                                        ;     Child Loop BB2_8 Depth 2
                                        ;     Child Loop BB2_6 Depth 2
                                        ;     Child Loop BB2_4 Depth 2
                                        ;     Child Loop BB2_30 Depth 2
                                        ;     Child Loop BB2_28 Depth 2
                                        ;     Child Loop BB2_26 Depth 2
                                        ;     Child Loop BB2_21 Depth 2
#0:	       s2add	r15, 16 -> r3
#1:	       sl	r14, 1 -> r0
#2:	       ldga	_test.2537 -> r2
	;;
#0:	       add	r3, 0 -> r12
#1:	       sl	r0, 2 -> r1
	;;
#2:	       or	r12, 4 -> r2.25
#0:	       sub	r2, r1 -> r1
#1:	       ldi	0 -> r2
	;;
#2:	       stm.a	0, r2.25, 0
#3:	       sub	r3.26, r0 -> r13
	;;
#0:	       stm.a	0, r15, 16
	;;
#3:	       stm.a	r3.23, r15, 18
	;;
#0:	       ldm.f	r1, 0
	;;
#1:	       br	.BB2_4
#2:	       ldx	$mem, 0 -> r2.24
#0:	       stm.a	r0.24, r15, 19
	;;
#1:	       stm.a	r1.23, r15, 20
	;;
#2:	       stm.a	r2.23, r15, 21
	;;
.BB2_2:                                 ; %bb.i
                                        ;   in Loop: Header=BB2_4 Depth=2
#0:	       ldm.f	r1, 0
	;;
#0:	       ldx	$membu, r1 -> r0
	;;
#0:	       brz eq @	r0, .BB2_10
	;;
.BB2_3:                                 ; %bb2.i1
                                        ;   in Loop: Header=BB2_4 Depth=2
#0:	       add	r2, 1 -> r2
	;;
.BB2_4:                                 ; %bb3.i
                                        ;   Parent Loop BB2_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#2:	       add	r2.24, r2 -> r1
	;;
#0:	       and	r1, 3 -> r0
	;;
#0:	       brz ne @	r0, .BB2_2
	;;
.BB2_5:                                 ; %bb4.i
                                        ;   in Loop: Header=BB2_1 Depth=1
#0:	       ldm.f	r1, 0
	;;
#0:	       ldx	$mem, 0 -> r3
#1:	       ldm.s	r15, 8
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       and	r3, r0 -> r2
	;;
#0:	       xor	r2, r0 -> r2
#1:	       add	r3, r10 -> r0
	;;
#0:	       and	r2, r0 -> r0
	;;
#0:	       brz ne @	r0, .BB2_7
	;;
.BB2_6:                                 ; %bb5.i3
                                        ;   Parent Loop BB2_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r1, 4
#1:	       add	r1, 4 -> r1
	;;
#0:	       ldx	$mem, 0 -> r3
#1:	       ldm.s	r15, 8
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       and	r3, r0 -> r2
	;;
#0:	       xor	r2, r0 -> r2
#1:	       add	r3, r10 -> r0
	;;
#0:	       and	r2, r0 -> r0
	;;
#0:	       brz eq @	r0, .BB2_6
	;;
.BB2_7:                                 ; %bb8.i
                                        ;   in Loop: Header=BB2_1 Depth=1
#0:	       ldm.f	r1, 0
#1:	       or	r1, 0 -> r2
	;;
#0:	       ldx	$membu, r1 -> r0
	;;
#0:	       brz eq @	r0, .BB2_9
	;;
.BB2_8:                                 ; %bb9.i5
                                        ;   Parent Loop BB2_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       add	r1, 1 -> r2
#1:	       ldm.f	r1, 1
	;;
#0:	       or	r2, 0 -> r1
	;;
#0:	       ldx	$membu, r2 -> r0
	;;
#0:	       brz ne @	r0, .BB2_8
	;;
.BB2_9:                                 ; %bb11.i6
                                        ;   in Loop: Header=BB2_1 Depth=1
#2:	       sub	r2, r2.24 -> r2
	;;
.BB2_10:                                ; %strlen.exit
                                        ;   in Loop: Header=BB2_1 Depth=1
#0:	       ldiu	160 -> r3
#1:	       callg	_md5_append
#2:	       or	r12, 0 -> r0
	;;
#0:	       add	r15, r3 -> r3
#2:	       or	r2.24, 0 -> r1
	;;
#0:	       add	r3, 24 -> r11
	;;
	       nop	0
	;;
#0:	       ldm.f	r15, 64
#1:	       ldiu	160 -> r5
#2:	       or	r11, 1 -> r1
#3:	       or	r11, 2 -> r3
	;;
#0:	       add	r15, r5 -> r5
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       sr	r0, 8 -> r2
#1:	       stmb.a	r0, r5, 24
#2:	       sr	r0, 16 -> r4
	;;
#0:	       stmb.a	r2, r1, 0
#1:	       sr	r0, 24 -> r2
#2:	       or	r11, 3 -> r1
#3:	       sr	r0, 3 -> r0
	;;
#0:	       stmb.a	r4, r3, 0
#1:	       ldiu	160 -> r4
	;;
#0:	       stmb.a	r2, r1, 0
#1:	       add	r15, r4 -> r4
	;;
#2:	       ldm.f	r2.25, 0
	;;
#2:	       sub	r2.27, r0 -> r0
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       stmb.a	r1, r4, 28
#1:	       ldiu	160 -> r4
#2:	       sr	r1, 8 -> r2
#3:	       sr	r1, 16 -> r3
	;;
#0:	       add	r15, r4 -> r4
#1:	       sr	r1, 24 -> r1
	;;
#0:	       stmb.a	r2, r4, 29
#1:	       ldiu	160 -> r4
	;;
#0:	       add	r15, r4 -> r4
	;;
#0:	       stmb.a	r3, r4, 30
#1:	       ldiu	160 -> r3
	;;
#0:	       callg	_md5_append
#1:	       add	r15, r3 -> r3
	;;
#3:	       and	r0, r3.25 -> r0
#0:	       stmb.a	r1, r3, 31
#1:	       ldga	_pad.2704 -> r1
	;;
#0:	       add	r0, 1 -> r2
#1:	       or	r12, 0 -> r0
	;;
	       nop	0
	;;
#0:	       callg	_md5_append
#1:	       or	r12, 0 -> r0
#2:	       or	r11, 0 -> r1
#3:	       ldi	8 -> r2
	;;
#2:	       ldi	0 -> r2.25
	;;
	       nop	0
	;;
	       nop	0
	;;
#2:	       or	r2.25, 0 -> r0
	;;
.BB2_11:                                ; %bb4.i39
                                        ;   Parent Loop BB2_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       and	r0, r0.23 -> r1
#1:	       add	r0, 1 -> r3
#2:	       ldi	16 -> r11
#3:	       s2add	r15, 8 -> r4
	;;
#0:	       add	r12, r1 -> r1
#1:	       cmpne	r3, r11 -> c1
	;;
#0:	       ldm.f	r1, 8
#2:	       and	r2.25, 24 -> r1
	;;
#2:	       add	r4, 16 -> r2.26
	;;
#0:	if  c1 br	.BB2_11
#1:	       ldx	$mem, 0 -> r2
#2:	       add	r2.26, r0 -> r0
	;;
#0:	       sr	r2, r1 -> r1
#2:	       add	r2.25, 8 -> r2.25
	;;
#0:	       stmb.a	r1, r0, 0
#1:	       or	r3, 0 -> r0
	;;
.BB2_12:                                ;   in Loop: Header=BB2_1 Depth=1
#0:	       add	r15, 12 -> r0
	;;
.BB2_13:                                ; %bb2.i
                                        ;   Parent Loop BB2_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#2:	       sub	r2.26, r11 -> r2
#0:	       sub	r11, 1 -> r11
#1:	       add	r0, 2 -> r12
	;;
#0:	       ldm.f	r2, 16
#1:	       add	r2, 16 -> r1
	;;
#0:	       callg	_sprintf
#1:	       ldx	$membu, r1 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz ne @	r11, .BB2_13
#1:	       or	r12, 0 -> r0
	;;
.BB2_14:                                ; %bb5.i
                                        ;   in Loop: Header=BB2_1 Depth=1
#0:	       ldga	_test.2537 -> r0
#1:	       add	r15, 12 -> r3
	;;
#0:	       s2add	r0, r13 -> r0
	;;
#0:	       ldm.f	r0, 4
	;;
#0:	       ldx	$mem, 0 -> r12
	;;
#0:	       or	r12, 0 -> r4
#1:	       and	r12, 3 -> r0
	;;
#0:	       brz eq @	r0, .BB2_18
	;;
.BB2_15:                                ; %bb5.i.bb8.preheader.i_crit_edge
                                        ;   in Loop: Header=BB2_1 Depth=1
#0:	       ldm.f	r12, 0
#1:	       br	.BB2_19
#2:	       add	r15, 12 -> r3
#3:	       or	r12, 0 -> r4
	;;
#0:	       ldx	$membu, r12 -> r1
#1:	       ldm.f	r15, 12
	;;
#0:	       ldx	$membu, r3 -> r0
	;;
.BB2_16:                                ; %bb1.i41
                                        ;   in Loop: Header=BB2_18 Depth=2
#0:	       ldm.s	r15, 8
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       and	r0, r1 -> r2
#1:	       add	r0, r10 -> r0
	;;
#0:	       xor	r2, r1 -> r1
	;;
#0:	       and	r1, r0 -> r0
	;;
#0:	       cmpne	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB2_35
	;;
.BB2_17:                                ; %bb4.i42
                                        ;   in Loop: Header=BB2_18 Depth=2
#0:	       add	r3, 4 -> r3
#1:	       add	r4, 4 -> r4
	;;
.BB2_18:                                ; %bb5.i45
                                        ;   Parent Loop BB2_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r3, 0
	;;
#0:	       ldx	$mem, 0 -> r0
#1:	       ldm.f	r4, 0
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       cmpeq	r0, r1 -> c1
	;;
#0:	if  c1 br @	.BB2_16
	;;
.BB2_19:                                ; %bb8.preheader.i
                                        ;   in Loop: Header=BB2_1 Depth=1
#0:	       bbh	zext8 r0 -> r2
#1:	       bbh	zext8 r1 -> r0
	;;
#0:	       cmpeq	r2, r0 -> c1
#1:	       cmpne	r2, 0 -> c2
	;;
#0:	       comb	and c2, c1 -> c2
	;;
#0:	if !c2 br @	.BB2_22
	;;
.BB2_20:                                ; %bb7.i47.preheader
                                        ;   in Loop: Header=BB2_1 Depth=1
#0:	       add	r3, 1 -> r1
#1:	       add	r4, 1 -> r0
	;;
.BB2_21:                                ; %bb7.i47
                                        ;   Parent Loop BB2_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r1, 0
	;;
#0:	       ldx	$membu, r1 -> r3
#1:	       ldm.f	r0, 0
#2:	       add	r1, 1 -> r1
	;;
#0:	       cmpne	r3, 0 -> c2
	;;
#0:	       ldx	$membu, r0 -> r2
#1:	       add	r0, 1 -> r0
	;;
#0:	       cmpeq	r3, r2 -> c1
	;;
#0:	       comb	and c2, c1 -> c2
	;;
#0:	if  c2 br @	.BB2_21
	;;
.BB2_22:                                ; %strcmp.exit
                                        ;   in Loop: Header=BB2_1 Depth=1
#0:	if  c1 br @	.BB2_35
	;;
.BB2_23:                                ; %bb7.i
                                        ;   in Loop: Header=BB2_1 Depth=1
#0:	       ldga	._.str15 -> r0
#1:	       callg	_printf
#2:	       or	r2.24, 0 -> r1
#3:	       ldi	0 -> r11
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       br @	.BB2_26
	;;
.BB2_24:                                ; %bb.i55
                                        ;   in Loop: Header=BB2_26 Depth=2
#0:	       ldm.f	r1, 0
	;;
#0:	       ldx	$membu, r1 -> r0
	;;
#0:	       brz eq @	r0, .BB2_32
	;;
.BB2_25:                                ; %bb2.i58
                                        ;   in Loop: Header=BB2_26 Depth=2
#0:	       add	r11, 1 -> r11
	;;
.BB2_26:                                ; %bb3.i60
                                        ;   Parent Loop BB2_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       add	r15, 12 -> r3
	;;
#0:	       add	r3, r11 -> r1
	;;
#0:	       and	r1, 3 -> r0
	;;
#0:	       brz ne @	r0, .BB2_24
	;;
.BB2_27:                                ; %bb4.i62
                                        ;   in Loop: Header=BB2_1 Depth=1
#0:	       ldm.f	r1, 0
	;;
#0:	       ldx	$mem, 0 -> r4
#1:	       ldm.s	r15, 8
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       and	r4, r0 -> r2
	;;
#0:	       xor	r2, r0 -> r2
#1:	       add	r4, r10 -> r0
	;;
#0:	       and	r2, r0 -> r0
	;;
#0:	       brz ne @	r0, .BB2_29
	;;
.BB2_28:                                ; %bb5.i72
                                        ;   Parent Loop BB2_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r1, 4
#1:	       add	r1, 4 -> r1
	;;
#0:	       ldx	$mem, 0 -> r4
#1:	       ldm.s	r15, 8
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       and	r4, r0 -> r2
	;;
#0:	       xor	r2, r0 -> r2
#1:	       add	r4, r10 -> r0
	;;
#0:	       and	r2, r0 -> r0
	;;
#0:	       brz eq @	r0, .BB2_28
	;;
.BB2_29:                                ; %bb8.i74
                                        ;   in Loop: Header=BB2_1 Depth=1
#0:	       ldm.f	r1, 0
#1:	       or	r1, 0 -> r0
	;;
#0:	       ldx	$membu, r1 -> r2
	;;
#0:	       brz eq @	r2, .BB2_31
	;;
.BB2_30:                                ; %bb9.i78
                                        ;   Parent Loop BB2_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       add	r1, 1 -> r0
#1:	       ldm.f	r1, 1
	;;
#0:	       or	r0, 0 -> r1
	;;
#0:	       ldx	$membu, r0 -> r2
	;;
#0:	       brz ne @	r2, .BB2_30
	;;
.BB2_31:                                ; %bb11.i80
                                        ;   in Loop: Header=BB2_1 Depth=1
#0:	       sub	r0, r3 -> r11
	;;
.BB2_32:                                ; %strlen.exit81
                                        ;   in Loop: Header=BB2_1 Depth=1
#0:	       ldiu	128 -> r4
#1:	       add	r11, 1 -> r1
	;;
#0:	       add	r15, r4 -> r4
	;;
#0:	       add	r4, 24 -> r2
#1:	       ldiu	128 -> r4
	;;
#0:	       add	r15, r4 -> r4
#1:	       or	r2, 4 -> r0
	;;
#0:	       stm.a	r3, r4, 6
#1:	       ldiu	128 -> r3
	;;
#0:	       stm.a	r11, r0, 0
#1:	       ldga	._.str18 -> r0
#2:	       add	r15, r3 -> r3
	;;
#0:	       stm.a	r0, r3, 8
#1:	       ldiu	128 -> r3
	;;
#0:	       add	r15, r3 -> r3
	;;
#0:	       stm.a	1, r3, 9
#1:	       ldiu	192 -> r3
	;;
#0:	       add	r15, r3 -> r3
	;;
#0:	       add	r3, 0 -> r0
#1:	       ldiu	128 -> r3
	;;
#0:	       add	r15, r3 -> r3
#1:	       or	r0, 4 -> r0
	;;
#0:	       stm.a	r1, r3, 18
#1:	       ldiu	128 -> r3
	;;
#0:	       add	r15, r3 -> r3
	;;
#0:	       stm.a	r2, r3, 16
	;;
#0:	       stm.a	2, r0, 0
	;;
#0:	       ldmg.d	_impure_data+8
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       ldm.f	r0, 12
#1:	       add	r0, 12 -> r1
	;;
#0:	       ldx	$memhu, r1 -> r1
	;;
#0:	       btest	r1, 13 -> c1
	;;
#0:	if  c1 br @	.BB2_34
	;;
.BB2_33:                                ; %bb.i.i53
                                        ;   in Loop: Header=BB2_1 Depth=1
#0:	       ldga	8192 -> r2
	;;
#0:	       or	r1, r2 -> r1
	;;
#0:	       stmh.a	r1, r0, 6
	;;
#0:	       ldmg.d	_impure_data+8
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       ldm.f	r1, 100
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#3:	       and	r0, r3.24 -> r0
	;;
#0:	       stm.a	r0, r1, 25
	;;
#0:	       ldmg.d	_impure_data+8
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
.BB2_34:                                ; %puts.exit54
                                        ;   in Loop: Header=BB2_1 Depth=1
#0:	       ldiu	192 -> r11
#1:	       callg	___sfvwrite_r
	;;
#0:	       add	r15, r11 -> r11
	;;
#0:	       add	r11, 0 -> r1
	;;
	       nop	0
	;;
#0:	       callg	_printf
#2:	       ldga	._.str16 -> r0
#3:	       or	r12, 0 -> r1
#1:	       ldi	1 -> r1.24
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB2_35:                                ; %bb9.i
                                        ;   in Loop: Header=BB2_1 Depth=1
#0:	       sub	r14, 1 -> r14
	;;
#0:	       cmpne	r14, -7 -> c1
	;;
#0:	if  c1 br @	.BB2_1
	;;
.BB2_36:                                ; %bb11.i
#0:	       ldi	-4 -> r5
#1:	       brz ne @	r1.24, .BB2_41
	;;
.BB2_37:                                ; %bb5.i24
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldga	._.str17 -> r3
#1:	       ldiu	1791 -> r4
#2:	       ldga	32896 -> r1
	;;
#0:	       sub	r3, r5 -> r0
#1:	       ldim	991 -> r4
#2:	       ldih	1028 -> r1
#3:	       sub	r5, 4 -> r5
	;;
#0:	       ldm.f	r0, 0
#1:	       ldih	2039 -> r4
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       and	r2, r1 -> r0
	;;
#0:	       xor	r0, r1 -> r1
#1:	       add	r2, r4 -> r0
	;;
#0:	       and	r1, r0 -> r0
	;;
#0:	       brz eq @	r0, .BB2_37
	;;
.BB2_38:                                ; %bb8.i26
#0:	       ldi	-41 -> r0
#1:	       sub	r3, r5 -> r2
#2:	       ldi	37 -> r4
#3:	       ldi	-4 -> r1
	;;
#0:	       cmpeq	r5, r0 -> c1
#1:	       ldiu	128 -> r5
#2:	       add	r3, r4 -> r0
	;;
#0:	       add	r15, r5 -> r5
#1:	if  c1 add	r2, r1 -> r0
	;;
#0:	       add	r5, 24 -> r4
#1:	       ldiu	128 -> r5
#2:	       sub	r0, r3 -> r2
#3:	       ldga	._.str18 -> r0
	;;
#0:	       add	r15, r5 -> r5
#1:	       or	r4, 4 -> r1
	;;
#0:	       stm.a	r3, r5, 6
#1:	       ldiu	128 -> r3
	;;
#0:	       stm.a	r2, r1, 0
#1:	       add	r15, r3 -> r3
#2:	       add	r2, 1 -> r1
	;;
#0:	       stm.a	r0, r3, 8
#1:	       ldiu	128 -> r3
	;;
#0:	       add	r15, r3 -> r3
	;;
#0:	       stm.a	1, r3, 9
#1:	       ldiu	160 -> r3
	;;
#0:	       add	r15, r3 -> r3
	;;
#0:	       add	r3, 8 -> r0
#1:	       ldiu	128 -> r3
	;;
#0:	       add	r15, r3 -> r3
#1:	       or	r0, 4 -> r0
	;;
#0:	       stm.a	r1, r3, 12
#1:	       ldiu	128 -> r3
	;;
#0:	       add	r15, r3 -> r3
	;;
#0:	       stm.a	r4, r3, 10
	;;
#0:	       stm.a	2, r0, 0
	;;
#0:	       ldmg.d	_impure_data+8
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       ldm.f	r0, 12
#1:	       add	r0, 12 -> r1
	;;
#0:	       ldx	$memhu, r1 -> r2
	;;
#0:	       btest	r2, 13 -> c1
	;;
#0:	if  c1 br @	.BB2_40
	;;
.BB2_39:                                ; %bb.i.i
#0:	       ldga	8192 -> r1
	;;
#0:	       or	r2, r1 -> r1
	;;
#0:	       stmh.a	r1, r0, 6
#1:	       ldiu	2047 -> r1
	;;
#0:	       ldmg.d	_impure_data+8
#1:	       ldim	2043 -> r1
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       ldm.f	r0, 100
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       and	r2, r1 -> r1
	;;
#0:	       stm.a	r1, r0, 25
	;;
#0:	       ldmg.d	_impure_data+8
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
.BB2_40:                                ; %puts.exit
#0:	       ldiu	160 -> r10
#1:	       callg	___sfvwrite_r
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       add	r10, 8 -> r1
	;;
	       nop	0
	;;
.BB2_41:                                ; %do_test.exit
#0:	       ldm.s	r15, 208
#1:	       ldi	0 -> r0
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       stx	r1 -> $ro
	;;
#0:	       ldm.s	r15, 212
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       stx	r1 -> $rb
#1:	       ldiu	304 -> r1
	;;
#0:	       ldm.s	r15, 216
	;;
#2:	       ldx	$mem, 0 -> r2.27
	;;
#0:	       ldm.s	r15, 220
	;;
#3:	       ldx	$mem, 0 -> r3.26
	;;
#0:	       ldm.s	r15, 224
	;;
#2:	       ldx	$mem, 0 -> r2.26
	;;
#0:	       ldm.s	r15, 228
	;;
#3:	       ldx	$mem, 0 -> r3.25
	;;
#0:	       ldm.s	r15, 232
	;;
#2:	       ldx	$mem, 0 -> r2.25
	;;
#0:	       ldm.s	r15, 236
	;;
#3:	       ldx	$mem, 0 -> r3.24
	;;
#0:	       ldm.s	r15, 240
	;;
#2:	       ldx	$mem, 0 -> r2.24
	;;
#0:	       ldm.s	r15, 244
	;;
#1:	       ldx	$mem, 0 -> r1.24
	;;
#0:	       ldm.s	r15, 248
	;;
#0:	       ldx	$mem, 0 -> r0.24
	;;
#0:	       ldm.s	r15, 252
	;;
#3:	       ldx	$mem, 0 -> r3.23
	;;
#0:	       ldm.s	r15, 256
	;;
#2:	       ldx	$mem, 0 -> r2.23
	;;
#0:	       ldm.s	r15, 260
	;;
#1:	       ldx	$mem, 0 -> r1.23
	;;
#0:	       ldm.s	r15, 264
	;;
#0:	       ldx	$mem, 0 -> r0.23
	;;
#0:	       ldm.s	r15, 268
	;;
#0:	       ldx	$mem, 0 -> r14
	;;
#0:	       ldm.s	r15, 272
	;;
#0:	       ldx	$mem, 0 -> r13
	;;
#0:	       ldm.s	r15, 276
	;;
#0:	       ldx	$mem, 0 -> r12
	;;
#0:	       ldm.s	r15, 280
	;;
#0:	       ldx	$mem, 0 -> r11
	;;
#0:	       ldm.s	r15, 284
#1:	       add	r15, r1 -> r15
	;;
#0:	       jop	ret
#1:	       ldx	$mem, 0 -> r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
_main_end:

	.globl	_memcpy
	.align	4
_memcpy:                                ; @memcpy
	.size	_memcpy_end-_memcpy
_memcpy_start:
; BB#0:                                 ; %entry
#0:	       cmpult	r2, 16 -> c1    ; memcpy.c:78
#1:	       wb.s	r15, 6          ; memcpy.c:78
#2:	       sub	r15, 24 -> r15  ; memcpy.c:78
	;;
#0:	if !c1 br @	.BB3_2
	;;
.BB3_1:
#0:	       or	r0, 0 -> r3
#1:	       br @	.BB3_9
	;;
.BB3_2:                                 ; %bb
#0:	       or	r1, r0 -> r3    ; memcpy.c:78
#1:	       ldi	0 -> r5
	;;
#0:	       and	r3, 3 -> r4     ; memcpy.c:78
#1:	       or	r0, 0 -> r3
	;;
#0:	       brz ne @	r4, .BB3_9      ; memcpy.c:78
	;;
.BB3_3:                                 ; %bb2
                                        ; =>This Inner Loop Header: Depth=1
#0:	       or	r5, 0 -> r6
#1:	       ldi	15 -> r7
	;;
#0:	       sub	r1, r6 -> r4
#1:	       sub	r0, r6 -> r8
#2:	       sub	r6, 16 -> r5
	;;
#0:	       ldm.f	r4, 0           ; memcpy.c:86
	;;
#0:	       ldx	$mem, 0 -> r3   ; memcpy.c:86
	;;
#0:	       stm.a	r3, r8, 0       ; memcpy.c:86
	;;
#0:	       ldm.f	r4, 4           ; memcpy.c:87
	;;
#0:	       ldx	$mem, 0 -> r3   ; memcpy.c:87
	;;
#0:	       stm.a	r3, r8, 1       ; memcpy.c:87
	;;
#0:	       ldm.f	r4, 8           ; memcpy.c:88
	;;
#0:	       ldx	$mem, 0 -> r3   ; memcpy.c:88
	;;
#0:	       stm.a	r3, r8, 2       ; memcpy.c:88
	;;
#0:	       ldm.f	r4, 12          ; memcpy.c:89
#1:	       add	r2, r5 -> r4
	;;
#0:	       cmpult	r7, r4 -> c1    ; memcpy.c:84
	;;
#0:	if  c1 br	.BB3_3
#1:	       ldx	$mem, 0 -> r3   ; memcpy.c:89
	;;
#0:	       stm.a	r3, r8, 3       ; memcpy.c:89
	;;
	       nop	0
	;;
.BB3_4:                                 ; %bb5.preheader
#0:	       cmpult	r4, 4 -> c1     ; memcpy.c:94
	;;
#0:	if !c1 br @	.BB3_6
	;;
.BB3_5:
#0:	       sub	r0, r5 -> r3
#1:	       br @	.BB3_9
#2:	       sub	r1, r5 -> r1
#3:	       or	r4, 0 -> r2
	;;
.BB3_6:                                 ; %bb.nph16
#0:	       ldi	0 -> r7
#2:	       add	r2, r5 -> r2.16
#1:	       ldi	3 -> r9
	;;
#0:	       or	r7, 0 -> r8
	;;
.BB3_7:                                 ; %bb4
                                        ; =>This Inner Loop Header: Depth=1
#0:	       add	r1, r7 -> r2
#1:	       add	r0, r7 -> r3
#2:	       sub	r8, 4 -> r8
	;;
#0:	       sub	r2, r6 -> r2
#1:	       sub	r3, r6 -> r3
	;;
#0:	       ldm.f	r2, 16          ; memcpy.c:96
#2:	       sub	r2.16, r7 -> r2
#1:	       add	r7, 4 -> r7
	;;
#0:	       sub	r2, 4 -> r2
	;;
#0:	       cmpult	r9, r2 -> c1    ; memcpy.c:94
#1:	       ldx	$mem, 0 -> r4   ; memcpy.c:96
	;;
#0:	if  c1 br @	.BB3_7
#1:	       stm.a	r4, r3, 4       ; memcpy.c:96
	;;
.BB3_8:                                 ; %bb5.bb6_crit_edge
#0:	       add	r0, r7 -> r3
#1:	       add	r1, r7 -> r1
	;;
#2:	       sub	r2.16, r7 -> r2
#0:	       sub	r3, r5 -> r3
#1:	       sub	r1, r5 -> r1
	;;
.BB3_9:                                 ; %bb8.preheader
#0:	       brz eq @	r2, .BB3_11     ; memcpy.c:105
	;;
.BB3_10:                                ; %bb7
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r1, 0           ; memcpy.c:106
#1:	       add	r3, 1 -> r5
#2:	       sub	r2, 1 -> r2
	;;
#0:	       brz ne	r2, .BB3_10     ; memcpy.c:105
#1:	       ldx	$membu, r1 -> r4 ; memcpy.c:106
#2:	       add	r1, 1 -> r1
	;;
#0:	       stmb.a	r4, r3, 0       ; memcpy.c:106
#1:	       or	r5, 0 -> r3
	;;
	       nop	0
	;;
.BB3_11:                                ; %bb9
#0:	       add	r15, 24 -> r15  ; memcpy.c:108
#1:	       jop	ret             ; memcpy.c:108
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
_memcpy_end:

	.globl	_memmove
	.align	4
_memmove:                               ; @memmove
	.size	_memmove_end-_memmove
_memmove_start:
; BB#0:                                 ; %entry
#0:	       cmpule	r0, r1 -> c1    ; memmove.c:92
#1:	       wb.s	r15, 6          ; memmove.c:92
#2:	       sub	r15, 24 -> r15  ; memmove.c:92
	;;
#0:	if !c1 add	r1, r2 -> r3    ; memmove.c:92
	;;
#0:	if !c1 cmpule	r3, r0 -> c1    ; memmove.c:92
	;;
#0:	if  c1 br @	.BB4_4
	;;
.BB4_1:                                 ; %bb1
#0:	       brz eq @	r2, .BB4_15     ; memmove.c:97
	;;
.BB4_2:                                 ; %bb.nph34
#0:	       ldi	0 -> r3
	;;
#0:	       sub	r3, r2 -> r2
	;;
.BB4_3:                                 ; %bb2
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sub	r1, r2 -> r4
#1:	       sub	r0, r2 -> r5
#2:	       add	r2, 1 -> r2
	;;
#0:	       brz ne	r2, .BB4_3      ; memmove.c:97
#1:	       ldm.f	r4, -1          ; memmove.c:99
#2:	       sub	r4, 1 -> r3
#3:	       sub	r5, 1 -> r4
	;;
#0:	       brz eq	r2, .BB4_15     ; memmove.c:97
#1:	       ldx	$membu, r3 -> r3 ; memmove.c:99
	;;
#0:	       stmb.a	r3, r4, 0       ; memmove.c:99
	;;
	       nop	0
	;;
.BB4_4:                                 ; %bb4
#0:	       cmpult	r2, 16 -> c1    ; memmove.c:107
	;;
#0:	if !c1 br @	.BB4_6
	;;
.BB4_5:
#0:	       or	r0, 0 -> r3
#1:	       br @	.BB4_13
	;;
.BB4_6:                                 ; %bb5
#0:	       or	r1, r0 -> r3    ; memmove.c:107
#1:	       ldi	0 -> r5
	;;
#0:	       and	r3, 3 -> r4     ; memmove.c:107
#1:	       or	r0, 0 -> r3
	;;
#0:	       brz ne @	r4, .BB4_13     ; memmove.c:107
	;;
.BB4_7:                                 ; %bb7
                                        ; =>This Inner Loop Header: Depth=1
#0:	       or	r5, 0 -> r6
#1:	       ldi	15 -> r7
	;;
#0:	       sub	r1, r6 -> r4
#1:	       sub	r0, r6 -> r8
#2:	       sub	r6, 16 -> r5
	;;
#0:	       ldm.f	r4, 0           ; memmove.c:115
	;;
#0:	       ldx	$mem, 0 -> r3   ; memmove.c:115
	;;
#0:	       stm.a	r3, r8, 0       ; memmove.c:115
	;;
#0:	       ldm.f	r4, 4           ; memmove.c:116
	;;
#0:	       ldx	$mem, 0 -> r3   ; memmove.c:116
	;;
#0:	       stm.a	r3, r8, 1       ; memmove.c:116
	;;
#0:	       ldm.f	r4, 8           ; memmove.c:117
	;;
#0:	       ldx	$mem, 0 -> r3   ; memmove.c:117
	;;
#0:	       stm.a	r3, r8, 2       ; memmove.c:117
	;;
#0:	       ldm.f	r4, 12          ; memmove.c:118
#1:	       add	r2, r5 -> r4
	;;
#0:	       cmpult	r7, r4 -> c1    ; memmove.c:113
	;;
#0:	if  c1 br	.BB4_7
#1:	       ldx	$mem, 0 -> r3   ; memmove.c:118
	;;
#0:	       stm.a	r3, r8, 3       ; memmove.c:118
	;;
	       nop	0
	;;
.BB4_8:                                 ; %bb10.preheader
#0:	       cmpult	r4, 4 -> c1     ; memmove.c:123
	;;
#0:	if !c1 br @	.BB4_10
	;;
.BB4_9:
#0:	       sub	r0, r5 -> r3
#1:	       br @	.BB4_13
#2:	       sub	r1, r5 -> r1
#3:	       or	r4, 0 -> r2
	;;
.BB4_10:                                ; %bb.nph22
#0:	       ldi	0 -> r7
#1:	       add	r2, r5 -> r1.16
#2:	       ldi	3 -> r9
	;;
#0:	       or	r7, 0 -> r8
	;;
.BB4_11:                                ; %bb9
                                        ; =>This Inner Loop Header: Depth=1
#0:	       add	r1, r7 -> r2
#1:	       add	r0, r7 -> r3
#2:	       sub	r8, 4 -> r8
	;;
#0:	       sub	r2, r6 -> r2
#1:	       sub	r3, r6 -> r3
	;;
#0:	       ldm.f	r2, 16          ; memmove.c:125
#1:	       sub	r1.16, r7 -> r2
#2:	       add	r7, 4 -> r7
	;;
#0:	       sub	r2, 4 -> r2
	;;
#0:	       cmpult	r9, r2 -> c1    ; memmove.c:123
#1:	       ldx	$mem, 0 -> r4   ; memmove.c:125
	;;
#0:	if  c1 br @	.BB4_11
#1:	       stm.a	r4, r3, 4       ; memmove.c:125
	;;
.BB4_12:                                ; %bb10.bb11_crit_edge
#0:	       add	r0, r7 -> r3
#2:	       add	r1, r7 -> r1
#1:	       sub	r1.16, r7 -> r2
	;;
#0:	       sub	r3, r5 -> r3
#1:	       sub	r1, r5 -> r1
	;;
.BB4_13:                                ; %bb13.preheader
#0:	       brz eq @	r2, .BB4_15     ; memmove.c:134
	;;
.BB4_14:                                ; %bb12
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r1, 0           ; memmove.c:136
#1:	       add	r3, 1 -> r5
#2:	       sub	r2, 1 -> r2
	;;
#0:	       brz ne	r2, .BB4_14     ; memmove.c:134
#1:	       ldx	$membu, r1 -> r4 ; memmove.c:136
#2:	       add	r1, 1 -> r1
	;;
#0:	       stmb.a	r4, r3, 0       ; memmove.c:136
#1:	       or	r5, 0 -> r3
	;;
	       nop	0
	;;
.BB4_15:                                ; %bb14
#0:	       add	r15, 24 -> r15  ; memmove.c:140
#1:	       jop	ret             ; memmove.c:140
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
_memmove_end:

	.globl	_memset
	.align	4
_memset:                                ; @memset
	.size	_memset_end-_memset
_memset_start:
; BB#0:                                 ; %entry
#0:	       wb.s	r15, 6          ; memset.c:54
#1:	       sub	r15, 24 -> r15  ; memset.c:54
#2:	       bbh	zext8 r1 -> r3  ; memset.c:54
#3:	       or	r0, 0 -> r5
	;;
#0:	       br @	.BB5_3
	;;
.BB5_1:                                 ; %bb
                                        ;   in Loop: Header=BB5_3 Depth=1
#0:	       brz eq @	r2, .BB5_13     ; memset.c:59
	;;
.BB5_2:                                 ; %bb1
                                        ;   in Loop: Header=BB5_3 Depth=1
#0:	       add	r5, 1 -> r4
#1:	       stmb.a	r1, r5, 0       ; memset.c:60
#2:	       sub	r2, 1 -> r2
	;;
#0:	       or	r4, 0 -> r5
	;;
.BB5_3:                                 ; %bb3
                                        ; =>This Inner Loop Header: Depth=1
#0:	       and	r5, 3 -> r4     ; memset.c:57
	;;
#0:	       brz ne @	r4, .BB5_1      ; memset.c:57
	;;
.BB5_4:                                 ; %bb4
#0:	       cmpult	r2, 4 -> c1     ; memset.c:65
	;;
#0:	if !c1 br @	.BB5_6
	;;
.BB5_5:
#0:	       or	r5, 0 -> r3
#1:	       br @	.BB5_11
	;;
.BB5_6:                                 ; %bb5
#0:	       sl	r3, 8 -> r4     ; memset.c:72
#1:	       cmpult	r2, 16 -> c1    ; memset.c:78
	;;
#0:	if  c1 br	.BB5_10
#1:	       or	r4, r3 -> r4    ; memset.c:72
	;;
#0:	       sl	r4, 16 -> r3    ; memset.c:73
	;;
#0:	       or	r3, r4 -> r7    ; memset.c:73
	;;
.BB5_7:
#0:	       add	r5, 12 -> r5
#1:	       ldi	15 -> r6
	;;
.BB5_8:                                 ; %bb8
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sub	r5, 12 -> r4
#1:	       sub	r2, 16 -> r2
#2:	       sub	r5, 8 -> r3
	;;
#0:	       stm.a	r7, r4, 0       ; memset.c:80
#1:	       cmpult	r6, r2 -> c1    ; memset.c:78
#2:	       sub	r5, 4 -> r4
	;;
#0:	if  c1 br	.BB5_8
#1:	       stm.a	r7, r3, 0       ; memset.c:81
#2:	       add	r5, 16 -> r3
	;;
#0:	       stm.a	r7, r4, 0       ; memset.c:82
	;;
#0:	       stm.a	r7, r5, 0       ; memset.c:83
#1:	       or	r3, 0 -> r5
	;;
.BB5_9:                                 ; %bb11.preheader
#0:	       cmpult	r2, 4 -> c1     ; memset.c:87
#1:	       sub	r3, 12 -> r5
	;;
#0:	if  c1 br @	.BB5_11
#1:	       or	r5, 0 -> r3
	;;
.BB5_10:                                ; %bb10
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sub	r2, 4 -> r2
#1:	       ldi	3 -> r4
#2:	       add	r5, 4 -> r3
#3:	       stm.a	r7, r5, 0       ; memset.c:89
	;;
#0:	       cmpult	r4, r2 -> c1    ; memset.c:87
#1:	       or	r3, 0 -> r5
	;;
#0:	if  c1 br @	.BB5_10
	;;
.BB5_11:                                ; %bb14.preheader
#0:	       brz eq @	r2, .BB5_13     ; memset.c:98
	;;
.BB5_12:                                ; %bb13
                                        ; =>This Inner Loop Header: Depth=1
#0:	       add	r3, 1 -> r4
#1:	       stmb.a	r1, r3, 0       ; memset.c:99
#2:	       sub	r2, 1 -> r2
	;;
#0:	       brz ne @	r2, .BB5_12     ; memset.c:98
#1:	       or	r4, 0 -> r3
	;;
.BB5_13:                                ; %bb16
#0:	       add	r15, 24 -> r15  ; memset.c:101
#1:	       jop	ret             ; memset.c:101
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
_memset_end:

	.align	4
_printf:                                ; @printf
	.size	_printf_end-_printf
_printf_start:
; BB#0:                                 ; %entry
#0:	       ldiu	32 -> r5
#1:	       wb.s	r15, 8
#2:	       or	r0, 0 -> r4
	;;
#0:	       sub	r15, r5 -> r15
#1:	       ldx	$rb, 0 -> r5
	;;
#0:	       stm.s	r5, r15, 3
#1:	       ldx	$ro, 0 -> r5
#2:	       add	r15, 20 -> r0
	;;
#0:	       stm.s	r5, r15, 2
	;;
#0:	       stm.a	r1, r15, 5
#1:	       or	r4, 0 -> r1     ; printf.c:52
	;;
#0:	       stm.a	r2, r15, 6
	;;
#0:	       stm.a	r3, r15, 7
	;;
#0:	       stm.a	r0, r15, 1      ; printf.c:51
	;;
#0:	       ldmg.d	_impure_data+8  ; printf.c:52
	;;
#0:	       ldx	$mem, 0 -> r0   ; printf.c:52
#1:	       ldm.f	r15, 4          ; printf.c:52
	;;
#0:	       callg	__vfprintf_r    ; printf.c:52
#1:	       ldx	$mem, 0 -> r2   ; printf.c:52
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldm.s	r15, 8
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       stx	r0 -> $ro
	;;
#0:	       ldm.s	r15, 12
#1:	       s2add	r15, 8 -> r15
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       stx	r0 -> $rb
	;;
#0:	       jop	ret
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
_printf_end:

	.align	4
_sprintf:                               ; @sprintf
	.size	_sprintf_end-_sprintf
_sprintf_start:
; BB#0:                                 ; %entry
#1:	       ldiu	512 -> r4
#2:	       wb.s	r15, 128
#0:	       ldx	$f12 -> r0.31
	;;
#0:	       sub	r15, r4 -> r15
#2:	       ldiu	384 -> r4
#1:	       ldx	$f13 -> r1.31
	;;
#0:	       add	r15, r4 -> r4
#2:	       ldx	$f10 -> r2.31
	;;
#0:	       stm.s	r10, r4, 23
	;;
#0:	       stm.s	r11, r4, 22
	;;
#0:	       stm.s	r12, r4, 21
	;;
#0:	       stm.s	r13, r4, 20
	;;
#0:	       stm.s	r14, r4, 19
	;;
#0:	       stm.s	r0.23, r4, 18
#3:	       ldx	$f11 -> r3.31
	;;
#1:	       stm.s	r1.23, r4, 17
	;;
#2:	       stm.s	r2.23, r4, 16
	;;
#3:	       stm.s	r3.23, r4, 15
	;;
#0:	       stm.s	r0.24, r4, 14
	;;
#1:	       stm.s	r1.24, r4, 13
	;;
#2:	       stm.s	r2.24, r4, 12
	;;
#3:	       stm.s	r3.24, r4, 11
	;;
#0:	       stm.s	r0.25, r4, 10
	;;
#1:	       stm.s	r1.25, r4, 9
	;;
#2:	       stm.s	r2.25, r4, 8
	;;
#3:	       stm.s	r3.25, r4, 7
	;;
#0:	       stm.s	r0.26, r4, 6
	;;
#1:	       stm.s	r1.26, r4, 5
	;;
#3:	       stm.s	r3.26, r4, 4
	;;
#0:	       stm.s	r0.27, r4, 3
	;;
#1:	       stm.s	r1.27, r4, 2
	;;
#3:	       stm.s	r3.27, r4, 1
	;;
#0:	       stm.s	r0.28, r4, 0
#1:	       ldiu	256 -> r4
	;;
#0:	       add	r15, r4 -> r4
	;;
#1:	       stm.s	r1.28, r4, 31
	;;
#3:	       stm.s	r3.28, r4, 30
	;;
#0:	       stm.s	r0.29, r4, 29
	;;
#1:	       stm.s	r1.29, r4, 28
	;;
#0:	       stm.s	r0.30, r4, 27
	;;
#2:	       stm.s	r2.31, r4, 26
	;;
#3:	       stm.s	r3.31, r4, 25
#2:	       ldx	$rb, 0 -> r2.31
	;;
#0:	       stm.s	r0.31, r4, 24
#3:	       ldx	$ro, 0 -> r3.31
	;;
#1:	       stm.s	r1.31, r4, 23
	;;
#2:	       stm.s	r2.31, r4, 22
	;;
#3:	       stm.s	r3.31, r4, 21
#0:	       ldiu	384 -> r4
	;;
#0:	       add	r15, r4 -> r4
	;;
#0:	       stm.a	r1, r4, 29
#1:	       ldiu	2047 -> r1
	;;
#0:	       stm.a	r2, r4, 30
#1:	       ldi	520 -> r2
#2:	       ldim	1023 -> r1
	;;
#0:	       stm.a	r3, r4, 31
#1:	       s2add	r15, 16 -> r3   ; sprintf.c:625
#2:	       ldih	1023 -> r1
	;;
#0:	       stmh.a	r2, r3, 14      ; sprintf.c:625
#1:	       ldiu	480 -> r3
#2:	       ldi	0 -> r2
	;;
#0:	       stm.a	r0, r15, 20     ; sprintf.c:626
#1:	       add	r15, r3 -> r3
	;;
#0:	       stm.a	r0, r15, 24     ; sprintf.c:626
#1:	       add	r3, 20 -> r0
#2:	       s2add	r15, 16 -> r3   ; sprintf.c:628
	;;
#0:	       stm.a	r1, r15, 22     ; sprintf.c:627
	;;
#0:	       stm.a	r1, r15, 25     ; sprintf.c:627
#1:	       ldga	._.str69 -> r1
	;;
#0:	       stmh.a	-1, r3, 15      ; sprintf.c:628
#1:	       ldiu	128 -> r3       ; sprintf.c:630
	;;
#0:	       add	r15, r3 -> r3   ; sprintf.c:630
	;;
#0:	       br	.BB7_3
#1:	       stm.a	r0, r3, 14      ; sprintf.c:630
	;;
#0:	       ldm.f	r15, 184        ; sprintf.c:634
	;;
#0:	       ldx	$mem, 0 -> r14  ; sprintf.c:634
	;;
.BB7_1:                                 ; %bb.i.i
                                        ;   in Loop: Header=BB7_3 Depth=1
#0:	       cmpeq	r2, 1 -> c1     ; strlen.c:68[ vfprintf.c:576[ sprintf.c:634 ] ]
#1:	       ldi	1 -> r0
	;;
#0:	if  c1 br @	.BB7_9
#1:	       stm.s	r0, r15, 8      ; strlen.c:68[ vfprintf.c:576[ sprintf.c:634 ] ]
	;;
.BB7_2:                                 ; %bb2.i.i
                                        ;   in Loop: Header=BB7_3 Depth=1
#0:	       add	r2, 1 -> r2
	;;
.BB7_3:                                 ; %bb3.i.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       add	r1, r2 -> r0
	;;
#0:	       and	r0, 3 -> r0     ; strlen.c:66[ vfprintf.c:576[ sprintf.c:634 ] ]
	;;
#0:	       brz ne @	r0, .BB7_1      ; strlen.c:66[ vfprintf.c:576[ sprintf.c:634 ] ]
	;;
.BB7_4:                                 ; %bb4.i1.i
#0:	       ldga	._.str69 -> r0
#1:	       ldiu	1791 -> r5
	;;
#0:	       add	r0, r2 -> r4
#1:	       ldga	32896 -> r2
#2:	       ldim	991 -> r5
	;;
#0:	       ldm.f	r4, 0           ; strlen.c:76[ vfprintf.c:576[ sprintf.c:634 ] ]
#1:	       ldih	1028 -> r2
#2:	       ldih	2039 -> r5
	;;
#0:	       ldx	$mem, 0 -> r3   ; strlen.c:76[ vfprintf.c:576[ sprintf.c:634 ] ]
	;;
#0:	       and	r3, r2 -> r0
	;;
#0:	       xor	r0, r2 -> r1
#1:	       add	r3, r5 -> r0
	;;
#0:	       and	r1, r0 -> r0    ; strlen.c:76[ vfprintf.c:576[ sprintf.c:634 ] ]
	;;
#0:	       brz ne @	r0, .BB7_6      ; strlen.c:76[ vfprintf.c:576[ sprintf.c:634 ] ]
	;;
.BB7_5:                                 ; %bb5.i3.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r4, 4           ; strlen.c:76[ vfprintf.c:576[ sprintf.c:634 ] ]
#1:	       add	r4, 4 -> r4
	;;
#0:	       ldx	$mem, 0 -> r3   ; strlen.c:76[ vfprintf.c:576[ sprintf.c:634 ] ]
	;;
#0:	       and	r3, r2 -> r0
	;;
#0:	       xor	r0, r2 -> r1
#1:	       add	r3, r5 -> r0
	;;
#0:	       and	r1, r0 -> r0    ; strlen.c:76[ vfprintf.c:576[ sprintf.c:634 ] ]
	;;
#0:	       brz eq @	r0, .BB7_5      ; strlen.c:76[ vfprintf.c:576[ sprintf.c:634 ] ]
	;;
.BB7_6:                                 ; %bb8.i.i
#0:	       ldm.f	r4, 0           ; strlen.c:85[ vfprintf.c:576[ sprintf.c:634 ] ]
#1:	       or	r4, 0 -> r1
	;;
#0:	       ldx	$membu, r4 -> r0 ; strlen.c:85[ vfprintf.c:576[ sprintf.c:634 ] ]
	;;
#0:	       brz eq @	r0, .BB7_8      ; strlen.c:85[ vfprintf.c:576[ sprintf.c:634 ] ]
	;;
.BB7_7:                                 ; %bb9.i5.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       add	r4, 1 -> r1
#1:	       ldm.f	r4, 1           ; strlen.c:85[ vfprintf.c:576[ sprintf.c:634 ] ]
	;;
#0:	       or	r1, 0 -> r4
	;;
#0:	       ldx	$membu, r1 -> r0 ; strlen.c:85[ vfprintf.c:576[ sprintf.c:634 ] ]
	;;
#0:	       brz ne @	r0, .BB7_7      ; strlen.c:85[ vfprintf.c:576[ sprintf.c:634 ] ]
	;;
.BB7_8:                                 ; %bb11.i.i
#0:	       ldga	._.str69 -> r0  ; strlen.c:87[ vfprintf.c:576[ sprintf.c:634 ] ]
	;;
#0:	       sub	r1, r0 -> r0    ; strlen.c:87[ vfprintf.c:576[ sprintf.c:634 ] ]
	;;
#0:	       stm.s	r0, r15, 8
	;;
.BB7_9:                                 ; %strlen.exit.i
#0:	       s2add	r15, 16 -> r1
	;;
#0:	       add	r1, 28 -> r0
#1:	       ldiu	256 -> r1       ; vfprintf.c:586[ sprintf.c:634 ]
	;;
#0:	       add	r15, r1 -> r1   ; vfprintf.c:586[ sprintf.c:634 ]
	;;
#0:	       stm.a	0, r1, 13       ; vfprintf.c:586[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r15, 92
	;;
#0:	       ldx	$memhu, r0 -> r0
	;;
#0:	       btest	r0, 7 -> c1     ; vfprintf.c:729[ sprintf.c:634 ]
	;;
#0:	if !c1 br @	.BB7_14
	;;
.BB7_10:                                ; %bb.i
#0:	       ldm.f	r15, 96         ; vfprintf.c:729[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:729[ sprintf.c:634 ]
	;;
#0:	       brz ne @	r0, .BB7_14     ; vfprintf.c:729[ sprintf.c:634 ]
	;;
.BB7_11:                                ; %bb1.i
#0:	       ldi	64 -> r0
#1:	       callg	__malloc_r      ; vfprintf.c:731[ sprintf.c:634 ]
#2:	       ldi	64 -> r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz ne	r0, .BB7_13     ; vfprintf.c:732[ sprintf.c:634 ]
#1:	       stm.a	r0, r15, 20     ; vfprintf.c:731[ sprintf.c:634 ]
	;;
#0:	       stm.a	r0, r15, 24     ; vfprintf.c:731[ sprintf.c:634 ]
	;;
	       nop	0
	;;
.BB7_12:                                ; %bb2.i
#0:	       ldga	_impure_data -> r0 ; vfprintf.c:734[ sprintf.c:634 ]
#1:	       br	.BB7_352
	;;
#0:	       stm.a	12, r0, 0       ; vfprintf.c:734[ sprintf.c:634 ]
	;;
	       nop	0
	;;
.BB7_13:                                ; %bb3.i
#0:	       stm.a	r10, r15, 25    ; vfprintf.c:737[ sprintf.c:634 ]
	;;
.BB7_14:                                ; %bb4.i
#1:	       ldiu	224 -> r1
#2:	       ldiu	288 -> r3
#3:	       fop	dzero -> d6
#0:	       ldi	31 -> r0.23
	;;
#2:	       add	r15, r1 -> r1
#3:	       add	r15, r3 -> r3
#1:	       ldi	16 -> r1.24
#0:	       ldi	128 -> r0.30
	;;
#0:	       add	r1, 8 -> r0.28
#1:	       ldiu	288 -> r1
#2:	       add	r3, 8 -> r2
#3:	       ldiu	256 -> r3       ; vfprintf.c:742[ sprintf.c:634 ]
	;;
#2:	       add	r15, r1 -> r1
#3:	       add	r15, r3 -> r3   ; vfprintf.c:742[ sprintf.c:634 ]
#1:	       ldi	-1 -> r1.29
#0:	       ldi	1 -> r0.29
	;;
#0:	       add	r1, 24 -> r0
#2:	       ldga	._.str14 -> r1
#1:	       ldi	-32 -> r1.23
#3:	       fop	dzero -> d5
	;;
#3:	       stm.s	r0, r15, 7
#0:	       or	r0, 3 -> r0.27
#2:	       ldi	88 -> r2.23
#1:	       ldi	37 -> r1.25
	;;
#0:	       stm.a	r0.28, r3, 10   ; vfprintf.c:742[ sprintf.c:634 ]
#1:	       ldiu	224 -> r3
	;;
#0:	       add	r15, r3 -> r3
	;;
#3:	       add	r3, 8 -> r3.24
#1:	       add	r3, 7 -> r1.28
#0:	       ldiu	288 -> r3
	;;
#3:	       or	r0, 2 -> r3.25
#0:	       or	r2, 4 -> r0     ; vfprintf.c:744[ sprintf.c:634 ]
#1:	       ldiu	256 -> r2       ; vfprintf.c:743[ sprintf.c:634 ]
#2:	       add	r15, r3 -> r3
	;;
#3:	       add	r3, 28 -> r3.26
#0:	       ldiu	320 -> r3
#1:	       stm.s	r0, r15, 13     ; vfprintf.c:743[ sprintf.c:634 ]
#2:	       add	r15, r2 -> r2   ; vfprintf.c:743[ sprintf.c:634 ]
	;;
#0:	       stm.a	0, r2, 12       ; vfprintf.c:743[ sprintf.c:634 ]
#1:	       add	r15, r3 -> r3
	;;
#2:	       add	r3, 19 -> r2.25
#0:	       ldiu	320 -> r3
#1:	       stm.a	0, r0, 0        ; vfprintf.c:744[ sprintf.c:634 ]
#3:	       ldi	0 -> r0
	;;
#0:	       stm.s	r0, r15, 11
#1:	       add	r15, r3 -> r3
	;;
#0:	       stm.s	r0, r15, 6
	;;
#3:	       add	r3, 18 -> r3.27
#0:	       stm.s	r0, r15, 9
	;;
#3:	       ldi	102 -> r3.28
	;;
.BB7_15:                                ; %bb6.outer.i
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB7_342 Depth 2
                                        ;     Child Loop BB7_23 Depth 2
                                        ;       Child Loop BB7_34 Depth 3
                                        ;         Child Loop BB7_43 Depth 4
                                        ;           Child Loop BB7_35 Depth 5
                                        ;           Child Loop BB7_41 Depth 5
                                        ;     Child Loop BB7_156 Depth 2
                                        ;     Child Loop BB7_154 Depth 2
                                        ;     Child Loop BB7_152 Depth 2
                                        ;     Child Loop BB7_137 Depth 2
                                        ;     Child Loop BB7_144 Depth 2
                                        ;     Child Loop BB7_140 Depth 2
                                        ;     Child Loop BB7_103 Depth 2
                                        ;     Child Loop BB7_100 Depth 2
                                        ;     Child Loop BB7_186 Depth 2
                                        ;     Child Loop BB7_177 Depth 2
                                        ;     Child Loop BB7_182 Depth 2
                                        ;     Child Loop BB7_174 Depth 2
                                        ;     Child Loop BB7_190 Depth 2
                                        ;     Child Loop BB7_188 Depth 2
                                        ;     Child Loop BB7_205 Depth 2
                                        ;     Child Loop BB7_223 Depth 2
                                        ;     Child Loop BB7_232 Depth 2
                                        ;     Child Loop BB7_290 Depth 2
                                        ;     Child Loop BB7_327 Depth 2
                                        ;     Child Loop BB7_273 Depth 2
                                        ;     Child Loop BB7_308 Depth 2
                                        ;     Child Loop BB7_254 Depth 2
#0:	       or	r0.28, 0 -> r0
#1:	       br	.BB7_23
#2:	       ldi	-1 -> r10
	;;
#0:	       stm.s	r0, r15, 15
	;;
	       nop	0
	;;
.BB7_16:                                ; %bb105.i
                                        ;   in Loop: Header=BB7_23 Depth=2
#0:	       ldm.s	r15, 68         ; vfprintf.c:1230[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1230[ sprintf.c:634 ]
	;;
#0:	       btest	r0, 4 -> c1     ; vfprintf.c:1230[ sprintf.c:634 ]
	;;
#0:	if !c1 br @	.BB7_18
	;;
.BB7_17:                                ; %bb106.i
                                        ;   in Loop: Header=BB7_23 Depth=2
#0:	       ldm.f	r14, 0          ; vfprintf.c:1231[ sprintf.c:634 ]
#1:	       add	r14, 4 -> r14   ; vfprintf.c:1231[ sprintf.c:634 ]
#2:	       ldi	-1 -> r10
	;;
#0:	       br	.BB7_23
#1:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1231[ sprintf.c:634 ]
#2:	       ldm.s	r15, 44         ; vfprintf.c:1231[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1231[ sprintf.c:634 ]
	;;
#0:	       stm.a	r0, r1, 0       ; vfprintf.c:1231[ sprintf.c:634 ]
#1:	       or	r11, 0 -> r1
	;;
.BB7_18:                                ; %bb107.i
                                        ;   in Loop: Header=BB7_23 Depth=2
#0:	       btest	r0, 6 -> c1     ; vfprintf.c:1232[ sprintf.c:634 ]
#1:	       add	r14, 4 -> r2    ; vfprintf.c:1239[ sprintf.c:634 ]
	;;
#0:	if !c1 br @	.BB7_21
	;;
.BB7_19:                                ; %bb108.i
                                        ;   in Loop: Header=BB7_23 Depth=2
#0:	       ldm.f	r14, 0          ; vfprintf.c:1233[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1233[ sprintf.c:634 ]
#1:	       ldm.s	r15, 44         ; vfprintf.c:1233[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1233[ sprintf.c:634 ]
	;;
#0:	       stmh.a	r0, r1, 0       ; vfprintf.c:1233[ sprintf.c:634 ]
	;;
.BB7_20:                                ; %bb108.i
                                        ;   in Loop: Header=BB7_23 Depth=2
#0:	       or	r11, 0 -> r1
#1:	       br @	.BB7_23
#2:	       or	r2, 0 -> r14
#3:	       ldi	-1 -> r10
	;;
.BB7_21:                                ; %bb109.i
                                        ;   in Loop: Header=BB7_23 Depth=2
#0:	       ldm.f	r14, 0          ; vfprintf.c:1239[ sprintf.c:634 ]
	;;
#0:	       br	.BB7_20
#1:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1239[ sprintf.c:634 ]
#2:	       ldm.s	r15, 44         ; vfprintf.c:1239[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1239[ sprintf.c:634 ]
	;;
#0:	       stm.a	r0, r1, 0       ; vfprintf.c:1239[ sprintf.c:634 ]
	;;
.BB7_22:                                ; %bb7.i
                                        ;   in Loop: Header=BB7_23 Depth=2
#0:	       sub	r10, 1 -> r10
	;;
.BB7_23:                                ; %bb8.i
                                        ;   Parent Loop BB7_15 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB7_34 Depth 3
                                        ;         Child Loop BB7_43 Depth 4
                                        ;           Child Loop BB7_35 Depth 5
                                        ;           Child Loop BB7_41 Depth 5
#0:	       sub	r1, r10 -> r11
	;;
#0:	       ldm.f	r11, -1         ; vfprintf.c:772[ sprintf.c:634 ]
#1:	       sub	r11, 1 -> r12
	;;
#0:	       ldx	$membu, r12 -> r0 ; vfprintf.c:772[ sprintf.c:634 ]
	;;
#0:	       brz eq @	r0, .BB7_25
	;;
.BB7_24:                                ; %bb8.i
                                        ;   in Loop: Header=BB7_23 Depth=2
#0:	       bbh	zext8 r0 -> r2
	;;
#1:	       cmpne	r2, r1.25 -> c1
	;;
#0:	if  c1 br @	.BB7_22
	;;
.BB7_25:                                ; %bb10.i
                                        ;   in Loop: Header=BB7_23 Depth=2
#0:	       cmpeq	r10, -1 -> c1
	;;
#0:	if  c1 br @	.BB7_30
	;;
.BB7_26:                                ; %bb11.i
                                        ;   in Loop: Header=BB7_23 Depth=2
#0:	       ldm.s	r15, 60         ; vfprintf.c:776[ sprintf.c:634 ]
#1:	       xor	r10, -1 -> r2
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:776[ sprintf.c:634 ]
	;;
#0:	       stm.a	r1, r0, 0       ; vfprintf.c:776[ sprintf.c:634 ]
	;;
#0:	       stm.a	r2, r0, 1       ; vfprintf.c:776[ sprintf.c:634 ]
#1:	       ldiu	256 -> r2       ; vfprintf.c:776[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r15, 304        ; vfprintf.c:776[ sprintf.c:634 ]
#1:	       add	r15, r2 -> r2   ; vfprintf.c:776[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:776[ sprintf.c:634 ]
	;;
#0:	       sub	r0, r10 -> r0
	;;
#0:	       sub	r0, 1 -> r0
	;;
#0:	       stm.a	r0, r2, 12      ; vfprintf.c:776[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 52         ; vfprintf.c:776[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:776[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:776[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:776[ sprintf.c:634 ]
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:776[ sprintf.c:634 ]
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:776[ sprintf.c:634 ]
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:776[ sprintf.c:634 ]
	;;
#0:	if !c1 br @	.BB7_28
	;;
.BB7_27:                                ;   in Loop: Header=BB7_23 Depth=2
#0:	       ldm.s	r15, 60         ; vfprintf.c:776[ sprintf.c:634 ]
	;;
#0:	       br	.BB7_29
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:776[ sprintf.c:634 ]
	;;
#0:	       add	r0, 8 -> r0     ; vfprintf.c:776[ sprintf.c:634 ]
	;;
#0:	       stm.s	r0, r15, 15
	;;
.BB7_28:                                ; %bb12.i
                                        ;   in Loop: Header=BB7_23 Depth=2
#0:	       ldiu	224 -> r13
	;;
#0:	       add	r15, r13 -> r13
	;;
#0:	       callg	___ssprint_r    ; vfprintf.c:776[ sprintf.c:634 ]
#1:	       add	r13, 8 -> r0
#2:	       s2add	r15, 16 -> r13
	;;
#0:	       stm.s	r0, r15, 15
#1:	       add	r13, 16 -> r0
#2:	       ldiu	288 -> r13
	;;
#0:	       add	r15, r13 -> r13
	;;
#0:	       add	r13, 8 -> r1
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:776[ sprintf.c:634 ]
	;;
#0:	if  c3 br @	.BB7_352        ; vfprintf.c:776[ sprintf.c:634 ]
	;;
.BB7_29:                                ; %bb15.i
                                        ;   in Loop: Header=BB7_23 Depth=2
#0:	       ldm.f	r11, -1
	;;
#0:	       ldx	$membu, r12 -> r0
#1:	       ldm.s	r15, 44
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       sub	r1, r10 -> r1
	;;
#0:	       sub	r1, 1 -> r1
	;;
#0:	       stm.s	r1, r15, 11
	;;
.BB7_30:                                ; %bb16.i
                                        ;   in Loop: Header=BB7_23 Depth=2
#0:	       bbh	zext8 r0 -> r0  ; vfprintf.c:783[ sprintf.c:634 ]
	;;
#0:	       cmpeq	r0, 0 -> c3     ; vfprintf.c:783[ sprintf.c:634 ]
	;;
#0:	if  c3 br @	.BB7_349        ; vfprintf.c:783[ sprintf.c:634 ]
	;;
.BB7_31:                                ; %bb17.i
                                        ;   in Loop: Header=BB7_23 Depth=2
#0:	       ldiu	320 -> r1       ; vfprintf.c:793[ sprintf.c:634 ]
#1:	       ldi	0 -> r0
#2:	       ldi	-1 -> r12
	;;
#0:	       stm.s	r0, r15, 14
#1:	       add	r15, r1 -> r1   ; vfprintf.c:793[ sprintf.c:634 ]
	;;
#0:	       br	.BB7_34
#1:	       stmb.a	0, r1, 8        ; vfprintf.c:793[ sprintf.c:634 ]
	;;
#0:	       stm.s	r0, r15, 17
	;;
#0:	       stm.s	r0, r15, 16
	;;
.BB7_32:                                ; %bb39.i
                                        ;   in Loop: Header=BB7_34 Depth=3
#0:	       ldm.s	r15, 68         ; vfprintf.c:977[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:977[ sprintf.c:634 ]
	;;
#0:	       or	r0, 16 -> r0    ; vfprintf.c:977[ sprintf.c:634 ]
	;;
.BB7_33:                                ; %bb39.i
                                        ;   in Loop: Header=BB7_34 Depth=3
#0:	       stm.s	r0, r15, 17     ; vfprintf.c:977[ sprintf.c:634 ]
	;;
.BB7_34:                                ; %rflag.i
                                        ;   Parent Loop BB7_15 Depth=1
                                        ;     Parent Loop BB7_23 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB7_43 Depth 4
                                        ;           Child Loop BB7_35 Depth 5
                                        ;           Child Loop BB7_41 Depth 5
#0:	       ldm.f	r11, 0          ; vfprintf.c:805[ sprintf.c:634 ]
#1:	       br	.BB7_43
	;;
#0:	       ldx	$membs, r11 -> r13 ; vfprintf.c:805[ sprintf.c:634 ]
#1:	       add	r11, 1 -> r11   ; vfprintf.c:805[ sprintf.c:634 ]
	;;
	       nop	0
	;;
.BB7_35:                                ; %bb34.i
                                        ;   Parent Loop BB7_15 Depth=1
                                        ;     Parent Loop BB7_23 Depth=2
                                        ;       Parent Loop BB7_34 Depth=3
                                        ;         Parent Loop BB7_43 Depth=4
                                        ; =>        This Inner Loop Header: Depth=5
#1:	       ldm.f	r11, 0          ; vfprintf.c:938[ sprintf.c:634 ]
#0:	       mul	r0, 10 -> $mul0.0
#2:	       ldi	-48 -> r1
	;;
#0:	       ldx	$mul0.0, r13 -> r0
	;;
#0:	       ldx	$membs, r11 -> r2 ; vfprintf.c:938[ sprintf.c:634 ]
#1:	       add	r0, r1 -> r0    ; vfprintf.c:937[ sprintf.c:634 ]
#2:	       add	r11, 1 -> r11
	;;
#0:	       add	r2, r1 -> r1
#1:	       or	r2, 0 -> r13
	;;
#0:	       cmpult	r1, 10 -> c1
	;;
#0:	if  c1 br @	.BB7_35
	;;
.BB7_36:                                ;   in Loop: Header=BB7_43 Depth=4
#0:	       or	r2, 0 -> r13
#1:	       br @	.BB7_43
#2:	       stm.s	r0, r15, 16
	;;
.BB7_37:                                ; %bb25.i
                                        ;   in Loop: Header=BB7_43 Depth=4
#0:	       ldm.f	r11, 0
#1:	       ldi	42 -> r1
#2:	       add	r11, 1 -> r3    ; vfprintf.c:880[ sprintf.c:634 ]
	;;
#0:	       ldx	$membs, r11 -> r0
	;;
#0:	       cmpeq	r0, r1 -> c1    ; vfprintf.c:880[ sprintf.c:634 ]
	;;
#0:	if  c1 br @	.BB7_54
	;;
.BB7_38:                                ; %bb30.preheader.i
                                        ;   in Loop: Header=BB7_43 Depth=4
#0:	       ldi	-48 -> r1
#1:	       ldi	9 -> r2
#2:	       ldi	0 -> r12
	;;
#0:	       add	r0, r1 -> r1
	;;
#0:	       cmpult	r2, r1 -> c1    ; vfprintf.c:919[ sprintf.c:634 ]
	;;
#0:	if !c1 br @	.BB7_40
	;;
.BB7_39:                                ;   in Loop: Header=BB7_43 Depth=4
#0:	       or	r0, 0 -> r13
#1:	       br @	.BB7_42
#2:	       or	r3, 0 -> r11
	;;
.BB7_40:                                ; %bb29.i.preheader
                                        ;   in Loop: Header=BB7_43 Depth=4
#0:	       add	r11, 1 -> r11
#1:	       ldi	0 -> r12
	;;
.BB7_41:                                ; %bb29.i
                                        ;   Parent Loop BB7_15 Depth=1
                                        ;     Parent Loop BB7_23 Depth=2
                                        ;       Parent Loop BB7_34 Depth=3
                                        ;         Parent Loop BB7_43 Depth=4
                                        ; =>        This Inner Loop Header: Depth=5
#0:	       ldm.f	r11, 0
#1:	       mul	r12, 10 -> $mul1.0
#2:	       ldi	-48 -> r1
	;;
#1:	       ldx	$mul1.0, r0 -> r0
	;;
#0:	       ldx	$membs, r11 -> r13
#1:	       add	r0, r1 -> r12   ; vfprintf.c:920[ sprintf.c:634 ]
#2:	       add	r11, 1 -> r11
	;;
#0:	       add	r13, r1 -> r0
	;;
#0:	       cmpult	r0, 10 -> c1
#1:	       or	r13, 0 -> r0
	;;
#0:	if  c1 br @	.BB7_41
	;;
.BB7_42:                                ; %bb31.i
                                        ;   in Loop: Header=BB7_43 Depth=4
#0:	       cmplt	r12, -1 -> c1
#1:	       ldi	-1 -> r0
	;;
#0:	if  c1 or	r0, 0 -> r12    ; vfprintf.c:923[ sprintf.c:634 ]
	;;
.BB7_43:                                ; %reswitch.i
                                        ;   Parent Loop BB7_15 Depth=1
                                        ;     Parent Loop BB7_23 Depth=2
                                        ;       Parent Loop BB7_34 Depth=3
                                        ; =>      This Loop Header: Depth=4
                                        ;           Child Loop BB7_35 Depth 5
                                        ;           Child Loop BB7_41 Depth 5
#0:	       cmplt	r0.23, r13 -> c1
	;;
#0:	if  c1 br @	.BB7_45
	;;
.BB7_44:                                ; %reswitch.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       cmpeq	r13, 0 -> c3
	;;
#0:	if !c3 br @	.BB7_198
#1:	if  c3 br @	.BB7_349
	;;
.BB7_45:                                ; %reswitch.i
                                        ;   in Loop: Header=BB7_43 Depth=4
#1:	       add	r13, r1.23 -> r1
	;;
#2:	       cmpult	r2.23, r1 -> c1
	;;
#0:	if  c1 br @	.BB7_198
	;;
.BB7_46:                                ; %reswitch.i
                                        ;   in Loop: Header=BB7_43 Depth=4
#0:	       ldga	.JTI7_0 -> r2
#1:	       ldi	0 -> r0
	;;
#0:	       s2add	r2, r1 -> r1
	;;
#0:	       ldm.d	r1, 0
#1:	       ldga	._.str642 -> r1
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       jop	brind	r2
	;;
.BB7_47:                                ; %bb18.i
                                        ;   in Loop: Header=BB7_34 Depth=3
#0:	       ldm.s	r15, 56         ; vfprintf.c:822[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:822[ sprintf.c:634 ]
	;;
#0:	       bbh	zext8 r0 -> r0  ; vfprintf.c:822[ sprintf.c:634 ]
	;;
#0:	       brz ne @	r0, .BB7_34     ; vfprintf.c:822[ sprintf.c:634 ]
	;;
.BB7_48:                                ; %bb19.i
                                        ;   in Loop: Header=BB7_34 Depth=3
#0:	       ldiu	320 -> r2       ; vfprintf.c:823[ sprintf.c:634 ]
#1:	       br	.BB7_34
#2:	       ldi	32 -> r0
	;;
#0:	       stm.s	r0, r15, 14     ; vfprintf.c:823[ sprintf.c:634 ]
#1:	       add	r15, r2 -> r2   ; vfprintf.c:823[ sprintf.c:634 ]
	;;
#0:	       stmb.a	r0, r2, 8       ; vfprintf.c:823[ sprintf.c:634 ]
	;;
.BB7_49:                                ; %bb20.i
                                        ;   in Loop: Header=BB7_34 Depth=3
#0:	       ldm.s	r15, 68         ; vfprintf.c:826[ sprintf.c:634 ]
#1:	       br	.BB7_33
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:826[ sprintf.c:634 ]
	;;
#0:	       or	r0, 1 -> r0     ; vfprintf.c:826[ sprintf.c:634 ]
	;;
.BB7_50:                                ; %bb21.i
                                        ;   in Loop: Header=BB7_34 Depth=3
#0:	       ldm.f	r14, 0          ; vfprintf.c:865[ sprintf.c:634 ]
#1:	       ldi	-1 -> r1
#2:	       add	r14, 4 -> r14   ; vfprintf.c:865[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:865[ sprintf.c:634 ]
	;;
#0:	       cmplt	r1, r0 -> c1
#1:	       stm.s	r0, r15, 16     ; vfprintf.c:865[ sprintf.c:634 ]
	;;
#0:	if  c1 br @	.BB7_34
	;;
.BB7_51:                                ; %bb22.i
                                        ;   in Loop: Header=BB7_34 Depth=3
#0:	       ldi	0 -> r1
	;;
#0:	       sub	r1, r0 -> r0    ; vfprintf.c:871[ sprintf.c:634 ]
	;;
#0:	       stm.s	r0, r15, 16
	;;
.BB7_52:                                ; %bb23.i
                                        ;   in Loop: Header=BB7_34 Depth=3
#0:	       ldm.s	r15, 68         ; vfprintf.c:874[ sprintf.c:634 ]
#1:	       br	.BB7_33
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:874[ sprintf.c:634 ]
	;;
#0:	       or	r0, 4 -> r0     ; vfprintf.c:874[ sprintf.c:634 ]
	;;
.BB7_53:                                ; %bb24.i
                                        ;   in Loop: Header=BB7_34 Depth=3
#0:	       ldiu	320 -> r1       ; vfprintf.c:877[ sprintf.c:634 ]
#1:	       br	.BB7_34
#2:	       ldi	43 -> r0
	;;
#0:	       stm.s	r0, r15, 14     ; vfprintf.c:877[ sprintf.c:634 ]
#1:	       add	r15, r1 -> r1   ; vfprintf.c:877[ sprintf.c:634 ]
	;;
#0:	       stmb.a	r0, r1, 8       ; vfprintf.c:877[ sprintf.c:634 ]
	;;
.BB7_54:                                ; %bb26.i
                                        ;   in Loop: Header=BB7_34 Depth=3
#0:	       ldm.f	r14, 0          ; vfprintf.c:910[ sprintf.c:634 ]
#1:	       ldi	-1 -> r0
#2:	       add	r14, 4 -> r14   ; vfprintf.c:910[ sprintf.c:634 ]
#3:	       or	r3, 0 -> r11
	;;
#0:	       ldx	$mem, 0 -> r12  ; vfprintf.c:910[ sprintf.c:634 ]
	;;
#0:	       cmplt	r0, r12 -> c1   ; vfprintf.c:914[ sprintf.c:634 ]
	;;
#0:	if  c1 br @	.BB7_34
	;;
.BB7_55:                                ; %bb27.i
                                        ;   in Loop: Header=BB7_34 Depth=3
#0:	       or	r3, 0 -> r11
#1:	       br @	.BB7_34
#2:	       ldi	-1 -> r12
	;;
.BB7_56:                                ; %bb32.i
                                        ;   in Loop: Header=BB7_34 Depth=3
#0:	       ldi	128 -> r1
	;;
.BB7_57:                                ; %bb32.i
                                        ;   in Loop: Header=BB7_34 Depth=3
#0:	       ldm.s	r15, 68         ; vfprintf.c:931[ sprintf.c:634 ]
#1:	       br	.BB7_33
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:931[ sprintf.c:634 ]
	;;
#0:	       or	r0, r1 -> r0    ; vfprintf.c:931[ sprintf.c:634 ]
	;;
.BB7_58:                                ; %bb36.i
                                        ;   in Loop: Header=BB7_34 Depth=3
#0:	       ldm.s	r15, 68         ; vfprintf.c:955[ sprintf.c:634 ]
#1:	       br	.BB7_33
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:955[ sprintf.c:634 ]
	;;
#0:	       or	r0, 8 -> r0     ; vfprintf.c:955[ sprintf.c:634 ]
	;;
.BB7_59:                                ; %bb37.i
                                        ;   in Loop: Header=BB7_34 Depth=3
#0:	       ldi	64 -> r1
#1:	       br @	.BB7_57
	;;
.BB7_60:                                ; %bb40.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#1:	       ldm.f	r14, 0          ; vfprintf.c:1036[ sprintf.c:634 ]
#2:	       ldiu	192 -> r3
#3:	       ldi	0 -> r0
#0:	       add	r14, 4 -> r0.24 ; vfprintf.c:1036[ sprintf.c:634 ]
	;;
#0:	       add	r15, r3 -> r3
#1:	       ldi	99 -> r13
#2:	       ldi	1 -> r12
	;;
#0:	       ldx	$membu, r14 -> r1 ; vfprintf.c:1036[ sprintf.c:634 ]
#1:	       stm.s	r0, r15, 14
#2:	       add	r3, 0 -> r2
	;;
#0:	       stm.s	r2, r15, 12     ; vfprintf.c:1036[ sprintf.c:634 ]
#1:	       ldiu	192 -> r2       ; vfprintf.c:1036[ sprintf.c:634 ]
	;;
#0:	       add	r15, r2 -> r2   ; vfprintf.c:1036[ sprintf.c:634 ]
	;;
#0:	       br	.BB7_149
#1:	       stmb.a	r1, r2, 0       ; vfprintf.c:1036[ sprintf.c:634 ]
#2:	       ldiu	320 -> r1       ; vfprintf.c:1039[ sprintf.c:634 ]
	;;
#0:	       add	r15, r1 -> r1   ; vfprintf.c:1039[ sprintf.c:634 ]
	;;
#0:	       stmb.a	0, r1, 8        ; vfprintf.c:1039[ sprintf.c:634 ]
	;;
.BB7_61:                                ; %bb42.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1042[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1042[ sprintf.c:634 ]
	;;
#0:	       or	r0, 16 -> r0    ; vfprintf.c:1042[ sprintf.c:634 ]
	;;
#0:	       stm.s	r0, r15, 17
	;;
.BB7_62:                                ; %bb43.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1046[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1046[ sprintf.c:634 ]
	;;
#0:	       btest	r0, 4 -> c1     ; vfprintf.c:1046[ sprintf.c:634 ]
	;;
#0:	if !c1 br @	.BB7_64
	;;
.BB7_63:                                ; %bb44.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.f	r14, 0          ; vfprintf.c:1046[ sprintf.c:634 ]
#1:	       br	.BB7_65
	;;
#0:	       ldx	$mem, 0 -> r10  ; vfprintf.c:1046[ sprintf.c:634 ]
	;;
	       nop	0
	;;
.BB7_64:                                ; %bb45.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.f	r14, 0          ; vfprintf.c:1046[ sprintf.c:634 ]
#1:	       btest	r0, 6 -> c1     ; vfprintf.c:1046[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r10  ; vfprintf.c:1046[ sprintf.c:634 ]
	;;
#0:	if  c1 bbh	sext16 r10 -> r10
	;;
.BB7_65:                                ; %bb49.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#1:	       ldi	-1 -> r0
#0:	       add	r14, 4 -> r0.24
#2:	       ldi	1 -> r2
	;;
#0:	       cmplt	r0, r10 -> c1   ; vfprintf.c:1050[ sprintf.c:634 ]
	;;
#0:	if  c1 br @	.BB7_171
	;;
.BB7_66:                                ; %bb50.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldi	0 -> r1
#1:	       ldi	45 -> r0
#2:	       ldi	1 -> r2
	;;
#0:	       br	.BB7_171
#1:	       sub	r1, r10 -> r10  ; vfprintf.c:1054[ sprintf.c:634 ]
#2:	       ldiu	320 -> r1       ; vfprintf.c:1055[ sprintf.c:634 ]
#3:	       stm.s	r0, r15, 14     ; vfprintf.c:1054[ sprintf.c:634 ]
	;;
#0:	       add	r15, r1 -> r1   ; vfprintf.c:1055[ sprintf.c:634 ]
	;;
#0:	       stmb.a	r0, r1, 8       ; vfprintf.c:1055[ sprintf.c:634 ]
	;;
.BB7_67:                                ; %bb52.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#1:	       ldm.f	r14, 0          ; vfprintf.c:1071[ sprintf.c:634 ]
#2:	       s2add	r15, 16 -> r4
#0:	       add	r14, 8 -> r0.24 ; vfprintf.c:1071[ sprintf.c:634 ]
	;;
#0:	       add	r4, 8 -> r0
	;;
#0:	       ldx	$mem, 0 -> r2   ; vfprintf.c:1071[ sprintf.c:634 ]
#1:	       ldm.f	r14, 4          ; vfprintf.c:1071[ sprintf.c:634 ]
#2:	       or	r0, 4 -> r3
	;;
#0:	       stx	r2 -> $f10      ; vfprintf.c:1071[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1071[ sprintf.c:634 ]
#1:	       ldx	$f10 -> r0
	;;
#0:	       stx	r1 -> $f0       ; vfprintf.c:1071[ sprintf.c:634 ]
	;;
#0:	       fop	fmov	f0 -> f11 ; vfprintf.c:1071[ sprintf.c:634 ]
#1:	       stm.a	r0, r15, 18
	;;
#0:	       ldx	$f11 -> r0
	;;
#0:	       stm.a	r0, r3, 0
#1:	       ldga	0 -> r0
	;;
#0:	       ldm.f	r3, 0
#1:	       ldih	1024 -> r0
	;;
#0:	       ldx	$mem, 0 -> r1
#1:	       ldm.f	r15, 72
	;;
#0:	       cmpeq	r1, r0 -> c1
	;;
#0:	if  c1 br @	.BB7_69
#1:	       ldx	$mem, 0 -> r5
	;;
.BB7_68:                                ; %bb52.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       brz ne @	r1, .BB7_70
	;;
.BB7_69:                                ; %bb1.i8.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       brz eq @	r5, .BB7_80     ; s_fpclassify.c:16[ vfprintf.c:1079[ sprintf.c:634 ] ]
	;;
.BB7_70:                                ; %bb3.i9.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldiu	0 -> r3
#1:	       ldga	1048576 -> r0
#2:	       ldiu	0 -> r6
#3:	       ldga	1048576 -> r2
	;;
#0:	       ldim	1536 -> r3
#1:	       ldih	1023 -> r0
	;;
#0:	       add	r1, r3 -> r4
#1:	       ldga	0 -> r3
#2:	       add	r1, r0 -> r0
	;;
#0:	       ldih	1023 -> r3
	;;
#0:	       cmpult	r4, r3 -> c2
#1:	       cmpult	r0, r3 -> c1
	;;
#0:	       comb	or c2, c1 -> c1
	;;
#0:	if  c1 br @	.BB7_80
	;;
.BB7_71:                                ; %bb6.i11.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldim	512 -> r6
#1:	       ldih	1024 -> r2
	;;
#0:	       cmpult	r1, r6 -> c2
#1:	       cmplt	r1, r2 -> c1
	;;
#0:	       comb	or c2, c1 -> c1
	;;
#0:	if  c1 br @	.BB7_80
	;;
.BB7_72:                                ; %bb9.i12.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldiu	2047 -> r0
	;;
#0:	       ldim	1535 -> r0
	;;
#0:	       cmplt	r0, r1 -> c1
	;;
#0:	if  c1 br @	.BB7_74
	;;
.BB7_73:                                ; %bb9.i12.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldga	0 -> r0
	;;
#0:	       ldih	1024 -> r0
	;;
#0:	       cmpeq	r1, r0 -> c1
	;;
#0:	if !c1 br @	.BB7_83
#1:	if  c1 br @	.BB7_82
	;;
.BB7_74:                                ; %bb9.i12.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldiu	0 -> r0
	;;
#0:	       ldim	1536 -> r0
	;;
#0:	       cmpeq	r1, r0 -> c1
	;;
#0:	if  c1 br @	.BB7_77
	;;
.BB7_75:                                ; %bb9.i12.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       brz eq @	r1, .BB7_82
	;;
.BB7_76:                                ; %bb9.i12.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldga	1048576 -> r0
	;;
#0:	       ldih	1023 -> r0
	;;
#0:	       cmpne	r1, r0 -> c1
	;;
#0:	if  c1 br @	.BB7_83
	;;
.BB7_77:                                ; %__fpclassifyd.exit.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       brz ne @	r5, .BB7_80     ; vfprintf.c:1079[ sprintf.c:634 ]
	;;
.BB7_78:                                ; %bb53.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       fop	dzero -> d0
#1:	       ldga	._.str26 -> r2
	;;
#0:	       fop	dcmp	d5, d0 -> f0 ; vfprintf.c:1080[ sprintf.c:634 ]
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r0       ; vfprintf.c:1080[ sprintf.c:634 ]
	;;
#0:	       btest	r0, 13 -> c1    ; vfprintf.c:1080[ sprintf.c:634 ]
	;;
#0:	if !c1 ldiu	320 -> r1       ; vfprintf.c:1081[ sprintf.c:634 ]
#1:	if !c1 ldi	45 -> r0
	;;
#0:	if !c1 stm.s	r0, r15, 14     ; vfprintf.c:1081[ sprintf.c:634 ]
#1:	if !c1 add	r15, r1 -> r1   ; vfprintf.c:1081[ sprintf.c:634 ]
	;;
#0:	if !c1 stmb.a	r0, r1, 8       ; vfprintf.c:1081[ sprintf.c:634 ]
#1:	       ldi	72 -> r0
#2:	       ldi	-129 -> r1
	;;
#0:	       cmplt	r13, r0 -> c1
#1:	       ldga	._.str127 -> r0
	;;
.BB7_79:                                ; %bb55.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	if  c1 or	r2, 0 -> r0
#1:	       ldi	3 -> r12
	;;
#0:	       stm.s	r0, r15, 12     ; vfprintf.c:1087[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 68         ; vfprintf.c:1087[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1087[ sprintf.c:634 ]
	;;
#0:	       and	r0, r1 -> r0    ; vfprintf.c:1087[ sprintf.c:634 ]
	;;
#0:	       br	.BB7_199
#1:	       stm.s	r0, r15, 17
#2:	       ldi	0 -> r0
	;;
#0:	       stm.s	r0, r15, 10
	;;
#3:	       or	r0, 0 -> r3.23
	;;
.BB7_80:                                ; %bb59.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldga	0 -> r0
	;;
#0:	       ldih	1024 -> r0
	;;
#0:	       cmpeq	r1, r0 -> c1
	;;
#0:	if  c1 br @	.BB7_82
	;;
.BB7_81:                                ; %bb59.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       brz ne @	r1, .BB7_83
	;;
.BB7_82:                                ; %bb1.i18.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       brz eq @	r5, .BB7_89     ; s_fpclassify.c:16[ vfprintf.c:1090[ sprintf.c:634 ] ]
	;;
.BB7_83:                                ; %bb3.i19.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldiu	0 -> r2
#2:	       ldga	1048576 -> r0
#1:	       ldga	0 -> r1.16
#3:	       ldiu	0 -> r4
	;;
#0:	       ldim	1536 -> r2
#2:	       ldih	1023 -> r0
#1:	       ldih	1023 -> r1.16
#3:	       ldga	1048576 -> r3
	;;
#0:	       add	r1, r2 -> r2
#1:	       add	r1, r0 -> r0
	;;
#1:	       cmpult	r2, r1.16 -> c2
	;;
#1:	       cmpult	r0, r1.16 -> c1
	;;
#0:	       comb	or c2, c1 -> c1
	;;
#0:	if  c1 br @	.BB7_89
	;;
.BB7_84:                                ; %bb6.i22.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldim	512 -> r4
#1:	       ldih	1024 -> r3
	;;
#0:	       cmpult	r1, r4 -> c2
#1:	       cmplt	r1, r3 -> c1
	;;
#0:	       comb	or c2, c1 -> c1
	;;
#0:	if  c1 br @	.BB7_89
	;;
.BB7_85:                                ; %bb9.i23.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldiu	0 -> r0
	;;
#0:	       ldim	1536 -> r0
	;;
#0:	       cmpeq	r1, r0 -> c1
	;;
#0:	if  c1 br @	.BB7_87
	;;
.BB7_86:                                ; %bb9.i23.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldga	1048576 -> r0
	;;
#0:	       ldih	1023 -> r0
	;;
#0:	       cmpne	r1, r0 -> c1
	;;
#0:	if  c1 br @	.BB7_88
	;;
.BB7_87:                                ; %__fpclassifyd.exit29.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       brz eq @	r5, .BB7_89     ; vfprintf.c:1090[ sprintf.c:634 ]
	;;
.BB7_88:                                ; %bb60.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldi	72 -> r0
#1:	       br	.BB7_79
#2:	       ldga	._.str228 -> r2
#3:	       ldi	-129 -> r1
	;;
#0:	       cmplt	r13, r0 -> c1
#1:	       ldga	._.str329 -> r0
	;;
	       nop	0
	;;
.BB7_89:                                ; %bb64.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       cmpeq	r12, -1 -> c1   ; vfprintf.c:1152[ sprintf.c:634 ]
#1:	       ldi	6 -> r10
	;;
#0:	if  c1 br @	.BB7_94
	;;
.BB7_90:                                ; %bb66.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldi	32 -> r0
#1:	       ldi	103 -> r1
	;;
#0:	       or	r13, r0 -> r0
	;;
#0:	       cmpeq	r0, r1 -> c1
	;;
#0:	if  c1 br @	.BB7_92
	;;
.BB7_91:                                ;   in Loop: Header=BB7_15 Depth=1
#0:	       or	r12, 0 -> r10
#1:	       br @	.BB7_94
	;;
.BB7_92:                                ; %bb68.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       or	r12, 0 -> r10
#1:	       brz ne @	r12, .BB7_94    ; vfprintf.c:1154[ sprintf.c:634 ]
	;;
.BB7_93:                                ; %bb69.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldi	1 -> r10
	;;
.BB7_94:                                ; %bb70.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldiu	320 -> r14
#1:	       or	r15, 0 -> r0
#2:	       or	r10, 0 -> r2
#3:	       ldi	32 -> r12
	;;
#0:	       add	r15, r14 -> r14
	;;
#1:	       add	r14, 4 -> r1.27
#0:	       ldiu	320 -> r14
	;;
#0:	       add	r15, r14 -> r14
#1:	       stm.a	r1.27, r0, 0
	;;
#0:	       add	r14, 0 -> r1
#1:	       ldiu	288 -> r14
	;;
#0:	       stm.a	r1, r0, 1
#1:	       add	r15, r14 -> r14
	;;
#0:	       stm.a	r13, r0, 2
#1:	       add	r14, 20 -> r1
	;;
#0:	       stm.a	r1, r0, 3
#1:	       ldi	256 -> r1
	;;
#0:	       ldm.s	r15, 68         ; vfprintf.c:1158[ sprintf.c:634 ]
	;;
#0:	       callg	_cvt
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1158[ sprintf.c:634 ]
	;;
#1:	       or	r0, r1 -> r1.26 ; vfprintf.c:1158[ sprintf.c:634 ]
#0:	       ldx	$f10 -> r0
	;;
#0:	       ldx	$f11 -> r1
#1:	       or	r1.26, 0 -> r3
	;;
	       nop	0
	;;
#0:	       ldi	103 -> r14
#1:	       or	r13, r12 -> r1
#2:	       stm.s	r0, r15, 12
	;;
#0:	       cmpeq	r1, r14 -> c1
	;;
#0:	if  c1 br @	.BB7_96
	;;
.BB7_95:                                ;   in Loop: Header=BB7_15 Depth=1
#0:	       or	r13, 0 -> r14
#1:	       br @	.BB7_98
	;;
.BB7_96:                                ; %bb72.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.f	r15, 320        ; vfprintf.c:1164[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1164[ sprintf.c:634 ]
	;;
#0:	       cmplt	r0, -3 -> c2
#1:	       cmplt	r10, r0 -> c1   ; vfprintf.c:1164[ sprintf.c:634 ]
#2:	       stm.s	r0, r15, 10
	;;
#0:	       comb	or c2, c1 -> c1
	;;
#0:	if !c1 br @	.BB7_117
	;;
.BB7_97:                                ; %bb74.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       sub	r13, 2 -> r14
	;;
.BB7_98:                                ; %bb76.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldi	101 -> r0
	;;
#0:	       cmplt	r0, r14 -> c1   ; vfprintf.c:1173[ sprintf.c:634 ]
	;;
#0:	if  c1 br @	.BB7_108
	;;
.BB7_99:                                ; %bb77.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.f	r15, 320        ; vfprintf.c:1174[ sprintf.c:634 ]
#1:	       ldiu	256 -> r5       ; vfprintf.c:1174[ sprintf.c:634 ]
#2:	       ldi	1 -> r1
#3:	       ldi	-1 -> r3
	;;
#0:	       add	r15, r5 -> r5   ; vfprintf.c:1174[ sprintf.c:634 ]
#1:	       ldi	45 -> r2
#2:	       ldi	0 -> r13
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1174[ sprintf.c:634 ]
	;;
#0:	       sub	r0, 1 -> r4
#1:	       sub	r1, r0 -> r10
#2:	       ldi	43 -> r1
	;;
#0:	       cmplt	r4, 0 -> c1     ; vfprintf.c:1743[ vfprintf.c:1175[ sprintf.c:634 ] ]
#1:	       stm.a	r4, r5, 16      ; vfprintf.c:1174[ sprintf.c:634 ]
	;;
#0:	if !c1 add	r0, r3 -> r10
#1:	       ldm.s	r15, 28
#2:	if  c1 or	r2, 0 -> r1
#3:	       ldiu	288 -> r2       ; vfprintf.c:1742[ vfprintf.c:1175[ sprintf.c:634 ] ]
	;;
#0:	       cmplt	r10, 10 -> c1   ; vfprintf.c:1750[ vfprintf.c:1175[ sprintf.c:634 ] ]
#1:	       add	r15, r2 -> r2   ; vfprintf.c:1742[ vfprintf.c:1175[ sprintf.c:634 ] ]
	;;
#0:	if  c1 br	.BB7_105
#1:	       ldx	$mem, 0 -> r0
	;;
#0:	       or	r0, 1 -> r0
#1:	       stmb.a	r14, r2, 24     ; vfprintf.c:1742[ vfprintf.c:1175[ sprintf.c:634 ] ]
	;;
#0:	       stmb.a	r1, r0, 0
	;;
.BB7_100:                               ; %bb4.i.i
                                        ;   Parent Loop BB7_15 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       or	r10, 0 -> r0    ; vfprintf.c:1753[ vfprintf.c:1175[ sprintf.c:634 ] ]
#1:	       callg	___divsi3       ; vfprintf.c:1753[ vfprintf.c:1175[ sprintf.c:634 ] ]
#2:	       ldi	10 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldiu	320 -> r2
#2:	       or	r0, 0 -> r2.24  ; vfprintf.c:1753[ vfprintf.c:1175[ sprintf.c:634 ] ]
#1:	       or	r10, 0 -> r0    ; vfprintf.c:1752[ vfprintf.c:1175[ sprintf.c:634 ] ]
#3:	       ldi	10 -> r1
	;;
#0:	       callg	___modsi3       ; vfprintf.c:1752[ vfprintf.c:1175[ sprintf.c:634 ] ]
#1:	       add	r15, r2 -> r2
	;;
#0:	       add	r2, 12 -> r12
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldi	99 -> r2
#1:	       add	r13, 1 -> r1
#2:	       s2add	r0, 12 -> r3    ; vfprintf.c:1752[ vfprintf.c:1175[ sprintf.c:634 ] ]
#3:	       sub	r12, r13 -> r0
	;;
#0:	       cmplt	r2, r10 -> c1
#1:	       or	r1, 0 -> r13
#2:	       stmb.a	r3, r0, 6       ; vfprintf.c:1752[ vfprintf.c:1175[ sprintf.c:634 ] ]
	;;
#0:	if  c1 br @	.BB7_100
#2:	       or	r2.24, 0 -> r10
	;;
.BB7_101:                               ; %bb5.i.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#3:	       sub	r3.27, r1 -> r2
#2:	       s2add	r2.24, 12 -> r3 ; vfprintf.c:1754[ vfprintf.c:1175[ sprintf.c:634 ] ]
	;;
#2:	       cmpule	r2.25, r2 -> c1 ; vfprintf.c:1755[ vfprintf.c:1175[ sprintf.c:634 ] ]
#0:	       stmb.a	r3, r0, 5       ; vfprintf.c:1754[ vfprintf.c:1175[ sprintf.c:634 ] ]
	;;
#0:	if  c1 br @	.BB7_106
#3:	       or	r3.25, 0 -> r0
	;;
.BB7_102:                               ;   in Loop: Header=BB7_15 Depth=1
#0:	       add	r1, 1 -> r5
#1:	       add	r1, 2 -> r4
	;;
#3:	       or	r3.25, 0 -> r0
	;;
.BB7_103:                               ; %bb6.i.i
                                        ;   Parent Loop BB7_15 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       sub	r12, r4 -> r3
#1:	       sub	r5, 1 -> r5
#2:	       sub	r4, 1 -> r4
	;;
#0:	       brz ne	r5, .BB7_103    ; vfprintf.c:1755[ vfprintf.c:1175[ sprintf.c:634 ] ]
#1:	       ldm.f	r3, 8           ; vfprintf.c:1755[ vfprintf.c:1175[ sprintf.c:634 ] ]
#2:	       add	r3, 8 -> r2
#3:	       add	r0, 1 -> r3
	;;
#0:	       ldx	$membu, r2 -> r2 ; vfprintf.c:1755[ vfprintf.c:1175[ sprintf.c:634 ] ]
	;;
#0:	       stmb.a	r2, r0, 0       ; vfprintf.c:1755[ vfprintf.c:1175[ sprintf.c:634 ] ]
#1:	       or	r3, 0 -> r0
	;;
.BB7_104:                               ; %bb7.bb10.loopexit_crit_edge.i.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       add	r0.27, r1 -> r0
#1:	       br @	.BB7_106
	;;
.BB7_105:                               ; %bb9.i.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 28
#1:	       ldi	48 -> r2
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       or	r0, 2 -> r1
#1:	       s2add	r10, 12 -> r0   ; vfprintf.c:1760[ vfprintf.c:1175[ sprintf.c:634 ] ]
	;;
#0:	       stmb.a	r2, r1, 0       ; vfprintf.c:1759[ vfprintf.c:1175[ sprintf.c:634 ] ]
	;;
#0:	       stmb.a	r0, r0.27, 0    ; vfprintf.c:1760[ vfprintf.c:1175[ sprintf.c:634 ] ]
#3:	       or	r3.26, 0 -> r0
	;;
.BB7_106:                               ; %exponent.exit.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 28         ; vfprintf.c:1762[ vfprintf.c:1175[ sprintf.c:634 ] ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1762[ vfprintf.c:1175[ sprintf.c:634 ] ]
	;;
#0:	       sub	r0, r1 -> r0    ; vfprintf.c:1762[ vfprintf.c:1175[ sprintf.c:634 ] ]
	;;
#0:	       stm.s	r0, r15, 6      ; vfprintf.c:1176[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r15, 308        ; vfprintf.c:1176[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1176[ sprintf.c:634 ]
	;;
#0:	       add	r0, r1 -> r12   ; vfprintf.c:1176[ sprintf.c:634 ]
#1:	       ldi	1 -> r0
	;;
#0:	       cmplt	r0, r1 -> c1    ; vfprintf.c:1177[ sprintf.c:634 ]
	;;
#0:	if !c1 ldi	0 -> r0
	;;
#0:	if !c1 stm.s	r0, r15, 10     ; vfprintf.c:1177[ sprintf.c:634 ]
	;;
#0:	if !c1 ldm.s	r15, 68         ; vfprintf.c:1177[ sprintf.c:634 ]
	;;
#0:	if !c1 ldx	$mem, 0 -> r0   ; vfprintf.c:1177[ sprintf.c:634 ]
	;;
#0:	if !c1 btest	r0, 0 -> c1     ; vfprintf.c:1177[ sprintf.c:634 ]
	;;
#0:	if !c1 br @	.BB7_120
	;;
.BB7_107:                               ; %bb81.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldi	0 -> r0
#1:	       br	.BB7_120
#2:	       add	r12, 1 -> r12   ; vfprintf.c:1178[ sprintf.c:634 ]
	;;
#0:	       stm.s	r0, r15, 10     ; vfprintf.c:1178[ sprintf.c:634 ]
	;;
	       nop	0
	;;
.BB7_108:                               ; %bb82.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.f	r15, 320        ; vfprintf.c:1184[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1184[ sprintf.c:634 ]
	;;
#0:	       stm.s	r0, r15, 10
#1:	       ldi	102 -> r0
	;;
#0:	       cmpne	r14, r0 -> c1   ; vfprintf.c:1183[ sprintf.c:634 ]
	;;
#0:	if  c1 br @	.BB7_117
	;;
.BB7_109:                               ; %bb83.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 40         ; vfprintf.c:1184[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1184[ sprintf.c:634 ]
	;;
#0:	       cmplt	r0, 1 -> c1     ; vfprintf.c:1184[ sprintf.c:634 ]
	;;
#0:	if  c1 br @	.BB7_114
	;;
.BB7_110:                               ; %bb84.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       brz ne @	r10, .BB7_113   ; vfprintf.c:1186[ sprintf.c:634 ]
	;;
.BB7_111:                               ; %bb85.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1186[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1186[ sprintf.c:634 ]
	;;
#0:	       btest	r0, 0 -> c1     ; vfprintf.c:1186[ sprintf.c:634 ]
	;;
#0:	if  c1 br @	.BB7_113
	;;
.BB7_112:                               ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 40
#1:	       br	.BB7_120
	;;
#0:	       ldx	$mem, 0 -> r12
	;;
	       nop	0
	;;
.BB7_113:                               ; %bb87.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 40         ; vfprintf.c:1187[ sprintf.c:634 ]
	;;
#0:	       br	.BB7_120
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1187[ sprintf.c:634 ]
	;;
#0:	       add	r10, r0 -> r0   ; vfprintf.c:1187[ sprintf.c:634 ]
	;;
#0:	       add	r0, 1 -> r12    ; vfprintf.c:1187[ sprintf.c:634 ]
	;;
.BB7_114:                               ; %bb88.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       brz ne @	r10, .BB7_116   ; vfprintf.c:1189[ sprintf.c:634 ]
	;;
.BB7_115:                               ; %bb89.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1189[ sprintf.c:634 ]
#1:	       ldi	1 -> r12
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1189[ sprintf.c:634 ]
	;;
#0:	       btest	r0, 0 -> c1     ; vfprintf.c:1189[ sprintf.c:634 ]
	;;
#0:	if !c1 br @	.BB7_120
	;;
.BB7_116:                               ; %bb91.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       add	r10, 2 -> r12   ; vfprintf.c:1189[ sprintf.c:634 ]
#1:	       br @	.BB7_120
	;;
.BB7_117:                               ; %bb94.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.f	r15, 308        ; vfprintf.c:1192[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r3   ; vfprintf.c:1192[ sprintf.c:634 ]
#1:	       ldm.s	r15, 40         ; vfprintf.c:1192[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1192[ sprintf.c:634 ]
	;;
#0:	       cmplt	r0, r3 -> c1    ; vfprintf.c:1192[ sprintf.c:634 ]
	;;
#0:	if  c1 br @	.BB7_119
	;;
.BB7_118:                               ; %bb95.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1194[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1194[ sprintf.c:634 ]
	;;
#0:	       br	.BB7_120
#1:	       ldm.s	r15, 40
#2:	       and	r0, 1 -> r1     ; vfprintf.c:1194[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       add	r0, r1 -> r12
	;;
.BB7_119:                               ; %bb98.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       cmplt	r0, 1 -> c1
#1:	       ldi	2 -> r2
#2:	       ldi	1 -> r1
	;;
#0:	if  c1 sub	r2, r0 -> r1
	;;
#0:	       add	r3, r1 -> r12   ; vfprintf.c:1197[ sprintf.c:634 ]
	;;
.BB7_120:                               ; %bb103.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.f	r15, 324        ; vfprintf.c:1220[ sprintf.c:634 ]
	;;
#1:	       ldx	$membu, r1.27 -> r0 ; vfprintf.c:1220[ sprintf.c:634 ]
	;;
#0:	       brz ne @	r0, .BB7_122    ; vfprintf.c:1220[ sprintf.c:634 ]
	;;
.BB7_121:                               ; %bb103.i.bb173.i_crit_edge
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldiu	320 -> r1
#1:	       ldm.f	r15, 328
	;;
#0:	       add	r15, r1 -> r1
	;;
#0:	       add	r1, 8 -> r0
	;;
#0:	       br	.BB7_123
#1:	       ldx	$membu, r0 -> r0
	;;
#0:	       stm.s	r0, r15, 14
	;;
#3:	       ldi	0 -> r3.23
	;;
.BB7_122:                               ; %bb104.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldiu	320 -> r1       ; vfprintf.c:1221[ sprintf.c:634 ]
#1:	       ldi	45 -> r0
	;;
#0:	       stm.s	r0, r15, 14
#1:	       add	r15, r1 -> r1   ; vfprintf.c:1221[ sprintf.c:634 ]
	;;
#3:	       ldi	0 -> r3.23
#0:	       stmb.a	r0, r1, 8       ; vfprintf.c:1221[ sprintf.c:634 ]
	;;
.BB7_123:                               ; %bb104.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#1:	       or	r1.26, 0 -> r0
#0:	       br	.BB7_199
#2:	       or	r14, 0 -> r13
	;;
#0:	       stm.s	r0, r15, 17     ; vfprintf.c:1221[ sprintf.c:634 ]
	;;
	       nop	0
	;;
.BB7_124:                               ; %bb110.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1242[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1242[ sprintf.c:634 ]
	;;
#0:	       or	r0, 16 -> r0    ; vfprintf.c:1242[ sprintf.c:634 ]
	;;
#0:	       stm.s	r0, r15, 17
	;;
.BB7_125:                               ; %bb111.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1245[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1245[ sprintf.c:634 ]
	;;
#0:	       btest	r0, 4 -> c1     ; vfprintf.c:1245[ sprintf.c:634 ]
	;;
#0:	if !c1 br @	.BB7_127
	;;
.BB7_126:                               ; %bb112.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.f	r14, 0          ; vfprintf.c:1245[ sprintf.c:634 ]
#1:	       br	.BB7_128
	;;
#0:	       ldx	$mem, 0 -> r10  ; vfprintf.c:1245[ sprintf.c:634 ]
	;;
	       nop	0
	;;
.BB7_127:                               ; %bb113.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.f	r14, 0          ; vfprintf.c:1245[ sprintf.c:634 ]
#1:	       btest	r0, 6 -> c1
#2:	       ldiu	2047 -> r1
	;;
#0:	       ldim	31 -> r1
	;;
#0:	       ldx	$mem, 0 -> r10  ; vfprintf.c:1245[ sprintf.c:634 ]
	;;
#0:	if  c1 and	r10, r1 -> r10
	;;
.BB7_128:                               ; %bb117.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       add	r14, 4 -> r0.24
#1:	       br @	.BB7_170
#2:	       ldi	0 -> r2
	;;
.BB7_129:                               ; %bb118.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.f	r14, 0          ; vfprintf.c:1260[ sprintf.c:634 ]
#1:	       ldiu	160 -> r4
#2:	       ldi	48 -> r3
#3:	       ldi	120 -> r13
	;;
#1:	       add	r15, r4 -> r4
#0:	       add	r14, 4 -> r0.24 ; vfprintf.c:1260[ sprintf.c:634 ]
#2:	       ldi	2 -> r2
	;;
#0:	       ldx	$mem, 0 -> r10  ; vfprintf.c:1260[ sprintf.c:634 ]
#1:	       ldm.s	r15, 68         ; vfprintf.c:1263[ sprintf.c:634 ]
#2:	       add	r4, 28 -> r1
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1263[ sprintf.c:634 ]
	;;
#0:	       or	r0, 2 -> r0     ; vfprintf.c:1263[ sprintf.c:634 ]
	;;
#0:	       stm.s	r0, r15, 17
#1:	       ldga	._.str440 -> r0
	;;
#0:	       stm.s	r0, r15, 9
#1:	       or	r1, 1 -> r0
#2:	       ldiu	160 -> r1       ; vfprintf.c:1264[ sprintf.c:634 ]
	;;
#0:	       br	.BB7_170
#1:	       add	r15, r1 -> r1   ; vfprintf.c:1264[ sprintf.c:634 ]
	;;
#0:	       stmb.a	r3, r1, 28      ; vfprintf.c:1264[ sprintf.c:634 ]
	;;
#0:	       stmb.a	r13, r0, 0      ; vfprintf.c:1265[ sprintf.c:634 ]
	;;
.BB7_130:                               ; %bb119.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#1:	       ldiu	320 -> r1       ; vfprintf.c:1271[ sprintf.c:634 ]
#0:	       add	r14, 4 -> r0.24 ; vfprintf.c:1272[ sprintf.c:634 ]
	;;
#0:	       add	r15, r1 -> r1   ; vfprintf.c:1271[ sprintf.c:634 ]
	;;
#0:	       stmb.a	0, r1, 8        ; vfprintf.c:1271[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r14, 0          ; vfprintf.c:1272[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1272[ sprintf.c:634 ]
	;;
#0:	       brz ne @	r0, .BB7_132    ; vfprintf.c:1278[ sprintf.c:634 ]
#1:	       stm.s	r0, r15, 12     ; vfprintf.c:1278[ sprintf.c:634 ]
	;;
.BB7_131:                               ; %bb120.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldi	6 -> r1
#1:	       ldi	0 -> r0
#2:	       ldi	115 -> r13
	;;
#0:	       br	.BB7_149
#1:	       cmpult	r1, r12 -> c1
#2:	       stm.s	r0, r15, 14
	;;
#0:	if  c1 or	r1, 0 -> r12
#1:	       ldga	._.str531 -> r1
	;;
#0:	       stm.s	r1, r15, 12
	;;
.BB7_132:                               ; %bb124.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldi	-1 -> r0
#1:	       ldi	0 -> r2
	;;
#0:	       cmplt	r0, r12 -> c1
	;;
#0:	if !c1 br @	.BB7_152
#1:	if  c1 br @	.BB7_137
	;;
.BB7_133:                               ; %bb.i1
                                        ;   in Loop: Header=BB7_137 Depth=2
#0:	       cmpeq	r12, r2 -> c1   ; memchr.c:87[ vfprintf.c:1353[ sprintf.c:634 ] ]
#1:	       ldi	0 -> r0
	;;
#0:	if !c1 br @	.BB7_135
#1:	       stm.s	r0, r15, 14     ; memchr.c:87[ vfprintf.c:1353[ sprintf.c:634 ] ]
	;;
.BB7_134:                               ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 56
#1:	       br	.BB7_149
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
	       nop	0
	;;
.BB7_135:                               ; %bb2.i2
                                        ;   in Loop: Header=BB7_137 Depth=2
#0:	       ldm.f	r1, 0           ; memchr.c:89[ vfprintf.c:1353[ sprintf.c:634 ] ]
	;;
#0:	       ldx	$membu, r1 -> r0 ; memchr.c:89[ vfprintf.c:1353[ sprintf.c:634 ] ]
	;;
#0:	       brz eq @	r0, .BB7_145    ; memchr.c:89[ vfprintf.c:1353[ sprintf.c:634 ] ]
	;;
.BB7_136:                               ; %bb4.i3
                                        ;   in Loop: Header=BB7_137 Depth=2
#0:	       add	r2, 1 -> r2
	;;
.BB7_137:                               ; %bb5.i
                                        ;   Parent Loop BB7_15 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.s	r15, 48
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       add	r0, r2 -> r1
	;;
#0:	       and	r1, 3 -> r0     ; memchr.c:85[ vfprintf.c:1353[ sprintf.c:634 ] ]
	;;
#0:	       brz ne @	r0, .BB7_133    ; memchr.c:85[ vfprintf.c:1353[ sprintf.c:634 ] ]
	;;
.BB7_138:                               ; %bb6.i4
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       sub	r12, r2 -> r3
#1:	       ldi	3 -> r5
#2:	       ldm.s	r15, 48
	;;
#0:	       cmpult	r5, r3 -> c1    ; memchr.c:94[ vfprintf.c:1353[ sprintf.c:634 ] ]
	;;
#0:	if  c1 cmpult	r5, r3 -> c1    ; memchr.c:110[ vfprintf.c:1353[ sprintf.c:634 ] ]
#1:	       ldx	$mem, 0 -> r0
	;;
#0:	if !c1 br @	.BB7_144
#1:	if  c1 br @	.BB7_140
#2:	       add	r0, r2 -> r1
	;;
.BB7_139:                               ; %bb13.i
                                        ;   in Loop: Header=BB7_140 Depth=2
#0:	       cmpult	r5, r3 -> c1    ; memchr.c:110[ vfprintf.c:1353[ sprintf.c:634 ] ]
	;;
#0:	if !c1 br @	.BB7_144
	;;
.BB7_140:                               ; %bb10.i6
                                        ;   Parent Loop BB7_15 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r1, 0           ; memchr.c:112[ vfprintf.c:1353[ sprintf.c:634 ] ]
#1:	       ldiu	1791 -> r6
#2:	       ldga	32896 -> r0
	;;
#0:	       ldim	991 -> r6
#1:	       ldih	1028 -> r0
	;;
#0:	       ldx	$mem, 0 -> r2   ; memchr.c:112[ vfprintf.c:1353[ sprintf.c:634 ] ]
#1:	       ldih	2039 -> r6
	;;
#0:	       and	r2, r0 -> r4
#1:	       add	r2, r6 -> r2
	;;
#0:	       xor	r4, r0 -> r0    ; memchr.c:112[ vfprintf.c:1353[ sprintf.c:634 ] ]
	;;
#0:	       and	r0, r2 -> r0    ; memchr.c:112[ vfprintf.c:1353[ sprintf.c:634 ] ]
	;;
#0:	       brz ne @	r0, .BB7_144    ; memchr.c:112[ vfprintf.c:1353[ sprintf.c:634 ] ]
	;;
.BB7_141:                               ; %bb12.i7
                                        ;   in Loop: Header=BB7_140 Depth=2
#0:	       add	r1, 4 -> r1
#1:	       br @	.BB7_139
#2:	       sub	r3, 4 -> r3
	;;
.BB7_142:                               ; %bb15.i9
                                        ;   in Loop: Header=BB7_144 Depth=2
#0:	       ldm.f	r1, 0           ; memchr.c:128[ vfprintf.c:1353[ sprintf.c:634 ] ]
	;;
#0:	       ldx	$membu, r1 -> r0 ; memchr.c:128[ vfprintf.c:1353[ sprintf.c:634 ] ]
	;;
#0:	       brz eq @	r0, .BB7_145    ; memchr.c:128[ vfprintf.c:1353[ sprintf.c:634 ] ]
	;;
.BB7_143:                               ; %bb17.i11
                                        ;   in Loop: Header=BB7_144 Depth=2
#0:	       add	r1, 1 -> r1
#1:	       sub	r3, 1 -> r3
	;;
.BB7_144:                               ; %bb18.i13
                                        ;   Parent Loop BB7_15 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       cmpeq	r3, 0 -> c3     ; memchr.c:126[ vfprintf.c:1353[ sprintf.c:634 ] ]
#1:	       ldi	0 -> r0
	;;
#0:	if !c3 br	.BB7_142        ; memchr.c:126[ vfprintf.c:1353[ sprintf.c:634 ] ]
#1:	if  c3 br	.BB7_199        ; memchr.c:126[ vfprintf.c:1353[ sprintf.c:634 ] ]
#2:	       stm.s	r0, r15, 14
	;;
#3:	       or	r0, 0 -> r3.23
#0:	       stm.s	r0, r15, 10
	;;
	       nop	0
	;;
.BB7_145:                               ; %memchr.exit
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       cmpeq	r1, 0 -> c3     ; vfprintf.c:1355[ sprintf.c:634 ]
#1:	       ldi	0 -> r0
	;;
#0:	if  c3 br	.BB7_199        ; vfprintf.c:1355[ sprintf.c:634 ]
#1:	       stm.s	r0, r15, 14
	;;
#3:	       or	r0, 0 -> r3.23
#0:	       stm.s	r0, r15, 10
	;;
	       nop	0
	;;
.BB7_146:                               ; %bb126.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldi	0 -> r0
	;;
#0:	       stm.s	r0, r15, 14     ; vfprintf.c:1356[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 48         ; vfprintf.c:1356[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1356[ sprintf.c:634 ]
	;;
#0:	       sub	r1, r0 -> r1    ; vfprintf.c:1356[ sprintf.c:634 ]
	;;
#0:	       cmple	r1, r12 -> c1   ; vfprintf.c:1357[ sprintf.c:634 ]
	;;
#0:	if !c1 br @	.BB7_148
	;;
.BB7_147:                               ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 56
#1:	       or	r1, 0 -> r12
	;;
#0:	       br	.BB7_199
#1:	       ldx	$mem, 0 -> r0
	;;
#0:	       stm.s	r0, r15, 10
	;;
#3:	       or	r0, 0 -> r3.23
	;;
.BB7_148:                               ; %bb127.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldi	0 -> r0
	;;
#0:	       stm.s	r0, r15, 14
	;;
.BB7_149:                               ; %bb127.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       stm.s	r0, r15, 10
#1:	       br	.BB7_199
	;;
#3:	       or	r0, 0 -> r3.23
	;;
	       nop	0
	;;
.BB7_150:                               ; %bb.i30.i
                                        ;   in Loop: Header=BB7_152 Depth=2
#0:	       ldi	0 -> r1
#1:	       or	r2, 0 -> r12
	;;
#0:	       stm.s	r1, r15, 14     ; strlen.c:68[ vfprintf.c:1362[ sprintf.c:634 ] ]
	;;
#0:	       ldm.f	r0, 0           ; strlen.c:68[ vfprintf.c:1362[ sprintf.c:634 ] ]
	;;
#3:	       or	r1, 0 -> r3.23
	;;
#0:	       ldx	$membu, r0 -> r0 ; strlen.c:68[ vfprintf.c:1362[ sprintf.c:634 ] ]
#1:	       stm.s	r1, r15, 10
	;;
#0:	       cmpeq	r0, 0 -> c3     ; strlen.c:68[ vfprintf.c:1362[ sprintf.c:634 ] ]
	;;
#0:	if  c3 br @	.BB7_199        ; strlen.c:68[ vfprintf.c:1362[ sprintf.c:634 ] ]
	;;
.BB7_151:                               ; %bb2.i33.i
                                        ;   in Loop: Header=BB7_152 Depth=2
#0:	       add	r2, 1 -> r2
	;;
.BB7_152:                               ; %bb3.i35.i
                                        ;   Parent Loop BB7_15 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.s	r15, 48
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       add	r0, r2 -> r0
	;;
#0:	       and	r0, 3 -> r1     ; strlen.c:66[ vfprintf.c:1362[ sprintf.c:634 ] ]
	;;
#0:	       brz ne @	r1, .BB7_150    ; strlen.c:66[ vfprintf.c:1362[ sprintf.c:634 ] ]
	;;
.BB7_153:                               ; %bb4.i37.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.f	r0, 0           ; strlen.c:76[ vfprintf.c:1362[ sprintf.c:634 ] ]
#1:	       ldiu	1791 -> r4
#2:	       ldga	32896 -> r3
	;;
#0:	       ldim	991 -> r4
#1:	       ldih	1028 -> r3
	;;
#0:	       ldx	$mem, 0 -> r5   ; strlen.c:76[ vfprintf.c:1362[ sprintf.c:634 ] ]
#1:	       ldih	2039 -> r4
	;;
#0:	       and	r5, r3 -> r1
	;;
#0:	       xor	r1, r3 -> r2
#1:	       add	r5, r4 -> r1
	;;
#0:	       and	r2, r1 -> r1    ; strlen.c:76[ vfprintf.c:1362[ sprintf.c:634 ] ]
	;;
#0:	       brz ne @	r1, .BB7_155    ; strlen.c:76[ vfprintf.c:1362[ sprintf.c:634 ] ]
	;;
.BB7_154:                               ; %bb5.i47.i
                                        ;   Parent Loop BB7_15 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r0, 4           ; strlen.c:76[ vfprintf.c:1362[ sprintf.c:634 ] ]
#1:	       add	r0, 4 -> r0
	;;
#0:	       ldx	$mem, 0 -> r5   ; strlen.c:76[ vfprintf.c:1362[ sprintf.c:634 ] ]
	;;
#0:	       and	r5, r3 -> r1
	;;
#0:	       xor	r1, r3 -> r2
#1:	       add	r5, r4 -> r1
	;;
#0:	       and	r2, r1 -> r1    ; strlen.c:76[ vfprintf.c:1362[ sprintf.c:634 ] ]
	;;
#0:	       brz eq @	r1, .BB7_154    ; strlen.c:76[ vfprintf.c:1362[ sprintf.c:634 ] ]
	;;
.BB7_155:                               ; %bb8.i49.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.f	r0, 0           ; strlen.c:85[ vfprintf.c:1362[ sprintf.c:634 ] ]
#1:	       or	r0, 0 -> r2
	;;
#0:	       ldx	$membu, r0 -> r1 ; strlen.c:85[ vfprintf.c:1362[ sprintf.c:634 ] ]
	;;
#0:	       brz eq @	r1, .BB7_157    ; strlen.c:85[ vfprintf.c:1362[ sprintf.c:634 ] ]
	;;
.BB7_156:                               ; %bb9.i53.i
                                        ;   Parent Loop BB7_15 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       add	r0, 1 -> r2
#1:	       ldm.f	r0, 1           ; strlen.c:85[ vfprintf.c:1362[ sprintf.c:634 ] ]
	;;
#0:	       or	r2, 0 -> r0
	;;
#0:	       ldx	$membu, r2 -> r1 ; strlen.c:85[ vfprintf.c:1362[ sprintf.c:634 ] ]
	;;
#0:	       brz ne @	r1, .BB7_156    ; strlen.c:85[ vfprintf.c:1362[ sprintf.c:634 ] ]
	;;
.BB7_157:                               ; %bb11.i55.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldi	0 -> r0
	;;
#0:	       stm.s	r0, r15, 14     ; strlen.c:87[ vfprintf.c:1362[ sprintf.c:634 ] ]
	;;
#0:	       br	.BB7_149
#1:	       ldm.s	r15, 48         ; strlen.c:87[ vfprintf.c:1362[ sprintf.c:634 ] ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; strlen.c:87[ vfprintf.c:1362[ sprintf.c:634 ] ]
	;;
#0:	       sub	r2, r1 -> r12   ; strlen.c:87[ vfprintf.c:1362[ sprintf.c:634 ] ]
	;;
.BB7_158:                               ; %bb130.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1366[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1366[ sprintf.c:634 ]
	;;
#0:	       or	r0, 16 -> r0    ; vfprintf.c:1366[ sprintf.c:634 ]
	;;
#0:	       stm.s	r0, r15, 17
	;;
.BB7_159:                               ; %bb131.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1369[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1369[ sprintf.c:634 ]
	;;
#0:	       btest	r0, 4 -> c1     ; vfprintf.c:1369[ sprintf.c:634 ]
	;;
#0:	if !c1 br @	.BB7_161
	;;
.BB7_160:                               ; %bb132.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.f	r14, 0          ; vfprintf.c:1369[ sprintf.c:634 ]
#1:	       br	.BB7_162
	;;
#0:	       ldx	$mem, 0 -> r10  ; vfprintf.c:1369[ sprintf.c:634 ]
	;;
	       nop	0
	;;
.BB7_161:                               ; %bb133.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.f	r14, 0          ; vfprintf.c:1369[ sprintf.c:634 ]
#1:	       btest	r0, 6 -> c1
#2:	       ldiu	2047 -> r1
	;;
#0:	       ldim	31 -> r1
	;;
#0:	       ldx	$mem, 0 -> r10  ; vfprintf.c:1369[ sprintf.c:634 ]
	;;
#0:	if  c1 and	r10, r1 -> r10
	;;
.BB7_162:                               ; %bb137.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       add	r14, 4 -> r0.24
#1:	       br @	.BB7_170
#2:	       ldi	1 -> r2
	;;
.BB7_163:                               ; %hex.i.loopexit
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldga	._.str440 -> r1
	;;
.BB7_164:                               ; %hex.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1377[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1377[ sprintf.c:634 ]
	;;
#0:	       btest	r0, 4 -> c1     ; vfprintf.c:1377[ sprintf.c:634 ]
	;;
#0:	if !c1 br @	.BB7_166
	;;
.BB7_165:                               ; %bb140.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.f	r14, 0          ; vfprintf.c:1377[ sprintf.c:634 ]
#1:	       br	.BB7_167
	;;
#0:	       ldx	$mem, 0 -> r10  ; vfprintf.c:1377[ sprintf.c:634 ]
	;;
	       nop	0
	;;
.BB7_166:                               ; %bb141.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.f	r14, 0          ; vfprintf.c:1377[ sprintf.c:634 ]
#1:	       btest	r0, 6 -> c1
#2:	       ldiu	2047 -> r2
	;;
#0:	       ldim	31 -> r2
	;;
#0:	       ldx	$mem, 0 -> r10  ; vfprintf.c:1377[ sprintf.c:634 ]
	;;
#0:	if  c1 and	r10, r2 -> r10
	;;
.BB7_167:                               ; %bb145.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#1:	       ldm.s	r15, 68         ; vfprintf.c:1380[ sprintf.c:634 ]
#2:	       cmpeq	r10, 0 -> c1    ; vfprintf.c:1380[ sprintf.c:634 ]
#0:	       add	r14, 4 -> r0.24
#3:	       ldi	2 -> r2
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1380[ sprintf.c:634 ]
	;;
#0:	       and	r0, 1 -> r0     ; vfprintf.c:1380[ sprintf.c:634 ]
	;;
#0:	       cmpeq	r0, 0 -> c2
	;;
#0:	       comb	or c2, c1 -> c1
	;;
#0:	if  c1 br @	.BB7_169
	;;
.BB7_168:                               ; %bb148.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1383[ sprintf.c:634 ]
#1:	       ldiu	160 -> r5
#2:	       ldi	48 -> r4
#3:	       ldi	2 -> r2
	;;
#0:	       add	r15, r5 -> r5
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1383[ sprintf.c:634 ]
#1:	       add	r5, 28 -> r3
	;;
#0:	       or	r0, 2 -> r0     ; vfprintf.c:1383[ sprintf.c:634 ]
	;;
#0:	       stm.s	r0, r15, 17
#1:	       or	r3, 1 -> r0
#2:	       ldiu	160 -> r3       ; vfprintf.c:1381[ sprintf.c:634 ]
	;;
#0:	       add	r15, r3 -> r3   ; vfprintf.c:1381[ sprintf.c:634 ]
	;;
#0:	       stmb.a	r4, r3, 28      ; vfprintf.c:1381[ sprintf.c:634 ]
	;;
#0:	       stmb.a	r13, r0, 0      ; vfprintf.c:1382[ sprintf.c:634 ]
	;;
.BB7_169:                               ; %bb148.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       stm.s	r1, r15, 9
	;;
.BB7_170:                               ; %nosign.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldi	0 -> r0
	;;
#0:	       stm.s	r0, r15, 14     ; vfprintf.c:1390[ sprintf.c:634 ]
#1:	       ldiu	320 -> r0       ; vfprintf.c:1390[ sprintf.c:634 ]
	;;
#0:	       add	r15, r0 -> r0   ; vfprintf.c:1390[ sprintf.c:634 ]
	;;
#0:	       stmb.a	0, r0, 8        ; vfprintf.c:1390[ sprintf.c:634 ]
	;;
.BB7_171:                               ; %number.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 68
#1:	       ldi	-1 -> r0
#2:	       ldi	-129 -> r1
	;;
#0:	       cmplt	r0, r12 -> c1
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	if  c1 and	r0, r1 -> r0
	;;
#0:	       stm.s	r0, r15, 17
#1:	       or	r10, r12 -> r0
	;;
#0:	       cmpeq	r0, 0 -> c3     ; vfprintf.c:1405[ sprintf.c:634 ]
	;;
#0:	if  c3 br @	.BB7_192        ; vfprintf.c:1405[ sprintf.c:634 ]
	;;
.BB7_172:                               ; %bb153.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       bbh	zext8 r2 -> r2  ; vfprintf.c:1411[ sprintf.c:634 ]
	;;
#0:	       cmpeq	r2, 2 -> c1     ; vfprintf.c:1411[ sprintf.c:634 ]
	;;
#0:	if !c1 br @	.BB7_175
	;;
.BB7_173:                               ;   in Loop: Header=BB7_15 Depth=1
#3:	       or	r3.24, 0 -> r0
	;;
#0:	       stm.s	r0, r15, 12
	;;
.BB7_174:                               ; %bb162.i
                                        ;   Parent Loop BB7_15 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.s	r15, 36         ; vfprintf.c:1459[ sprintf.c:634 ]
#1:	       and	r10, 15 -> r0   ; vfprintf.c:1459[ sprintf.c:634 ]
#2:	       sr	r10, 4 -> r10   ; vfprintf.c:1460[ sprintf.c:634 ]
	;;
#0:	       cmpeq	r10, 0 -> c3    ; vfprintf.c:1461[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1459[ sprintf.c:634 ]
	;;
#0:	       add	r1, r0 -> r0    ; vfprintf.c:1459[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1459[ sprintf.c:634 ]
	;;
#0:	       ldx	$membu, r0 -> r0 ; vfprintf.c:1459[ sprintf.c:634 ]
#1:	       ldm.s	r15, 48
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	if !c3 br	.BB7_174        ; vfprintf.c:1461[ sprintf.c:634 ]
#1:	if  c3 br	.BB7_197        ; vfprintf.c:1461[ sprintf.c:634 ]
#2:	       sub	r1, 1 -> r1
	;;
#0:	       stm.s	r1, r15, 12     ; vfprintf.c:1459[ sprintf.c:634 ]
	;;
#0:	       stmb.a	r0, r1, 0       ; vfprintf.c:1459[ sprintf.c:634 ]
	;;
.BB7_175:                               ; %bb153.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       cmpeq	r2, 1 -> c1
	;;
#0:	if  c1 br @	.BB7_180
	;;
.BB7_176:                               ; %bb153.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#3:	       or	r3.24, 0 -> r0
#0:	       brz ne	r2, .BB7_186
#1:	       ldi	0 -> r1
	;;
#0:	       stm.s	r0, r15, 12
#1:	       or	r1.28, 0 -> r0
	;;
	       nop	0
	;;
.BB7_177:                               ; %bb154.i
                                        ;   Parent Loop BB7_15 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.s	r15, 48
#1:	       and	r10, 7 -> r3    ; vfprintf.c:1414[ sprintf.c:634 ]
#2:	       ldi	48 -> r1
#3:	       sub	r0, 1 -> r4
	;;
#0:	       sr	r10, 3 -> r10   ; vfprintf.c:1415[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       brz ne	r10, .BB7_177   ; vfprintf.c:1416[ sprintf.c:634 ]
#1:	       sub	r2, 1 -> r2
	;;
#0:	       stm.s	r2, r15, 12
#1:	       or	r3, r1 -> r2
	;;
#0:	       stmb.a	r2, r0, 0       ; vfprintf.c:1414[ sprintf.c:634 ]
#1:	       or	r4, 0 -> r0
	;;
.BB7_178:                               ; %bb155.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1418[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1418[ sprintf.c:634 ]
	;;
#0:	       and	r0, 1 -> r3     ; vfprintf.c:1418[ sprintf.c:634 ]
#1:	       bbh	zext8 r2 -> r0  ; vfprintf.c:1418[ sprintf.c:634 ]
	;;
#0:	       cmpeq	r3, 0 -> c2
#1:	       cmpeq	r0, r1 -> c1    ; vfprintf.c:1418[ sprintf.c:634 ]
	;;
#0:	       comb	or c2, c1 -> c1
	;;
#0:	if  c1 br @	.BB7_197
	;;
.BB7_179:                               ; %bb158.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldi	48 -> r0
#1:	       br	.BB7_196
	;;
#0:	       stmb.a	r0, r4, 0       ; vfprintf.c:1419[ sprintf.c:634 ]
#1:	       or	r4, 0 -> r0
	;;
	       nop	0
	;;
.BB7_180:                               ; %bb159.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldi	9 -> r0.25
	;;
#0:	       cmpult	r0.25, r10 -> c1 ; vfprintf.c:1424[ sprintf.c:634 ]
	;;
#0:	if !c1 br @	.BB7_348
	;;
.BB7_181:                               ;   in Loop: Header=BB7_15 Depth=1
#3:	       or	r3.24, 0 -> r0
	;;
#0:	       stm.s	r0, r15, 12
	;;
.BB7_182:                               ; %bb161.i
                                        ;   Parent Loop BB7_15 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       or	r10, 0 -> r0    ; vfprintf.c:1453[ sprintf.c:634 ]
#1:	       callg	___udivsi3      ; vfprintf.c:1453[ sprintf.c:634 ]
#2:	       ldi	10 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#3:	       or	r0, 0 -> r3.23  ; vfprintf.c:1453[ sprintf.c:634 ]
#0:	       or	r10, 0 -> r0    ; vfprintf.c:1432[ sprintf.c:634 ]
#1:	       ldi	10 -> r1
#2:	       ldi	48 -> r14
	;;
#0:	       callg	___umodsi3      ; vfprintf.c:1432[ sprintf.c:634 ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#1:	       ldm.s	r15, 48
#0:	       cmpult	r0.25, r10 -> c1
#2:	       or	r0, r14 -> r0
	;;
#3:	       or	r3.23, 0 -> r10
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	if !c1 br	.BB7_197
#1:	if  c1 br	.BB7_182
#2:	       sub	r1, 1 -> r1
	;;
#0:	       stm.s	r1, r15, 12
	;;
#0:	       stmb.a	r0, r1, 0       ; vfprintf.c:1432[ sprintf.c:634 ]
	;;
.BB7_183:                               ; %bb.i57.i
                                        ;   in Loop: Header=BB7_186 Depth=2
#0:	       ldi	25 -> r0
	;;
#0:	       cmpeq	r1, r0 -> c1    ; strlen.c:68[ vfprintf.c:1466[ sprintf.c:634 ] ]
	;;
#0:	if !c1 br @	.BB7_185
	;;
.BB7_184:                               ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldga	._.str733 -> r0
#1:	       br	.BB7_199
	;;
#0:	       stm.s	r0, r15, 12
#1:	       ldi	0 -> r0
	;;
#3:	       or	r12, 0 -> r3.23
#0:	       stm.s	r0, r15, 10
#1:	       ldi	25 -> r12
	;;
.BB7_185:                               ; %bb2.i60.i
                                        ;   in Loop: Header=BB7_186 Depth=2
#0:	       add	r1, 1 -> r1
	;;
.BB7_186:                               ; %bb3.i62.i
                                        ;   Parent Loop BB7_15 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldga	._.str733 -> r0
	;;
#0:	       add	r0, r1 -> r2
	;;
#0:	       and	r2, 3 -> r0     ; strlen.c:66[ vfprintf.c:1466[ sprintf.c:634 ] ]
	;;
#0:	       brz ne @	r0, .BB7_183    ; strlen.c:66[ vfprintf.c:1466[ sprintf.c:634 ] ]
	;;
.BB7_187:                               ; %bb4.i64.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldiu	1791 -> r4
#1:	       ldga	32896 -> r3
#2:	       ldm.f	r2, 0           ; strlen.c:76[ vfprintf.c:1466[ sprintf.c:634 ] ]
	;;
#0:	       ldim	991 -> r4
#1:	       ldx	$mem, 0 -> r5   ; strlen.c:76[ vfprintf.c:1466[ sprintf.c:634 ] ]
#2:	       ldih	1028 -> r3
	;;
#0:	       and	r5, r3 -> r0
#1:	       ldih	2039 -> r4
	;;
#0:	       xor	r0, r3 -> r1
#1:	       add	r5, r4 -> r0
	;;
#0:	       and	r1, r0 -> r0    ; strlen.c:76[ vfprintf.c:1466[ sprintf.c:634 ] ]
	;;
#0:	       brz ne @	r0, .BB7_189    ; strlen.c:76[ vfprintf.c:1466[ sprintf.c:634 ] ]
	;;
.BB7_188:                               ; %bb5.i74.i
                                        ;   Parent Loop BB7_15 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r2, 4           ; strlen.c:76[ vfprintf.c:1466[ sprintf.c:634 ] ]
#1:	       add	r2, 4 -> r2
	;;
#0:	       ldx	$mem, 0 -> r5   ; strlen.c:76[ vfprintf.c:1466[ sprintf.c:634 ] ]
	;;
#0:	       and	r5, r3 -> r0
	;;
#0:	       xor	r0, r3 -> r1
#1:	       add	r5, r4 -> r0
	;;
#0:	       and	r1, r0 -> r0    ; strlen.c:76[ vfprintf.c:1466[ sprintf.c:634 ] ]
	;;
#0:	       brz eq @	r0, .BB7_188    ; strlen.c:76[ vfprintf.c:1466[ sprintf.c:634 ] ]
	;;
.BB7_189:                               ; %bb8.i76.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.f	r2, 0           ; strlen.c:85[ vfprintf.c:1466[ sprintf.c:634 ] ]
#1:	       or	r2, 0 -> r0
	;;
#0:	       ldx	$membu, r2 -> r1 ; strlen.c:85[ vfprintf.c:1466[ sprintf.c:634 ] ]
	;;
#0:	       brz eq @	r1, .BB7_191    ; strlen.c:85[ vfprintf.c:1466[ sprintf.c:634 ] ]
	;;
.BB7_190:                               ; %bb9.i80.i
                                        ;   Parent Loop BB7_15 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       add	r2, 1 -> r0
#1:	       ldm.f	r2, 1           ; strlen.c:85[ vfprintf.c:1466[ sprintf.c:634 ] ]
	;;
#0:	       or	r0, 0 -> r2
	;;
#0:	       ldx	$membu, r0 -> r1 ; strlen.c:85[ vfprintf.c:1466[ sprintf.c:634 ] ]
	;;
#0:	       brz ne @	r1, .BB7_190    ; strlen.c:85[ vfprintf.c:1466[ sprintf.c:634 ] ]
	;;
.BB7_191:                               ; %bb11.i82.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldga	._.str733 -> r1 ; strlen.c:87[ vfprintf.c:1466[ sprintf.c:634 ] ]
#1:	       br	.BB7_199
	;;
#0:	       stm.s	r1, r15, 12     ; strlen.c:87[ vfprintf.c:1466[ sprintf.c:634 ] ]
#1:	       sub	r0, r1 -> r1    ; strlen.c:87[ vfprintf.c:1466[ sprintf.c:634 ] ]
#2:	       ldi	0 -> r0
	;;
#3:	       or	r12, 0 -> r3.23
#0:	       stm.s	r0, r15, 10
#1:	       or	r1, 0 -> r12
	;;
.BB7_192:                               ; %bb164.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#3:	       or	r3.24, 0 -> r1
#0:	       bbh	zext8 r2 -> r0  ; vfprintf.c:1479[ sprintf.c:634 ]
	;;
#0:	       brz ne @	r0, .BB7_197    ; vfprintf.c:1479[ sprintf.c:634 ]
#1:	       stm.s	r1, r15, 12     ; vfprintf.c:1479[ sprintf.c:634 ]
	;;
.BB7_193:                               ; %bb165.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1479[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1479[ sprintf.c:634 ]
	;;
#0:	       btest	r0, 0 -> c1     ; vfprintf.c:1479[ sprintf.c:634 ]
	;;
#0:	if !c1 br	.BB7_197
#3:	       or	r3.24, 0 -> r0
	;;
#0:	       stm.s	r0, r15, 12     ; vfprintf.c:1479[ sprintf.c:634 ]
	;;
	       nop	0
	;;
.BB7_194:                               ; %bb167.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldi	48 -> r0
	;;
.BB7_195:                               ; %bb167.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldiu	224 -> r1       ; vfprintf.c:1480[ sprintf.c:634 ]
	;;
#0:	       add	r15, r1 -> r1   ; vfprintf.c:1480[ sprintf.c:634 ]
	;;
#0:	       stmb.a	r0, r1, 7       ; vfprintf.c:1480[ sprintf.c:634 ]
#1:	       or	r1.28, 0 -> r0
	;;
.BB7_196:                               ; %bb167.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       stm.s	r0, r15, 12
	;;
.BB7_197:                               ; %bb168.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldi	0 -> r0
	;;
#0:	       stm.s	r0, r15, 10     ; vfprintf.c:1482[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 48         ; vfprintf.c:1482[ sprintf.c:634 ]
	;;
#3:	       or	r12, 0 -> r3.23
	;;
#0:	       br	.BB7_199
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1482[ sprintf.c:634 ]
	;;
#3:	       sub	r3.24, r0 -> r0 ; vfprintf.c:1482[ sprintf.c:634 ]
	;;
#0:	       or	r0, 0 -> r12
	;;
.BB7_198:                               ; %bb171.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#1:	       ldiu	192 -> r2
#2:	       ldi	0 -> r0
#3:	       ldi	1 -> r12
#0:	       or	r14, 0 -> r0.24
	;;
#0:	       add	r15, r2 -> r2
#1:	       stm.s	r0, r15, 14
	;;
#0:	       add	r2, 0 -> r1
	;;
#0:	       stm.s	r1, r15, 12
#1:	       ldiu	192 -> r1       ; vfprintf.c:1490[ sprintf.c:634 ]
	;;
#0:	       add	r15, r1 -> r1   ; vfprintf.c:1490[ sprintf.c:634 ]
	;;
#0:	       stmb.a	r13, r1, 0      ; vfprintf.c:1490[ sprintf.c:634 ]
#1:	       ldiu	320 -> r1       ; vfprintf.c:1492[ sprintf.c:634 ]
	;;
#0:	       add	r15, r1 -> r1   ; vfprintf.c:1492[ sprintf.c:634 ]
	;;
#0:	       stmb.a	0, r1, 8        ; vfprintf.c:1492[ sprintf.c:634 ]
	;;
#3:	       or	r0, 0 -> r3.23
#0:	       stm.s	r0, r15, 10
	;;
.BB7_199:                               ; %bb173.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 56
	;;
#3:	       cmple	r3.23, r12 -> c1 ; vfprintf.c:1511[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       ldm.s	r15, 68
#1:	       bbh	zext8 r0 -> r0
	;;
#0:	       cmpne	r0, 0 -> c2
	;;
#3:	       or	r3.23, 0 -> r2  ; vfprintf.c:1511[ sprintf.c:634 ]
#0:	       ldx	$mem, 0 -> r0
#1:	       ldx	$c2 -> r1
	;;
#0:	if  c1 or	r12, 0 -> r2    ; vfprintf.c:1511[ sprintf.c:634 ]
#1:	       btest	r0, 1 -> c1
	;;
#0:	       add	r2, r1 -> r14
#1:	       ldi	132 -> r1
	;;
#0:	       and	r0, r1 -> r0.25 ; vfprintf.c:1518[ sprintf.c:634 ]
#1:	if  c1 add	r14, 2 -> r14
	;;
#0:	       brz ne @	r0.25, .BB7_209 ; vfprintf.c:1518[ sprintf.c:634 ]
	;;
.BB7_200:                               ; %bb179.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 64         ; vfprintf.c:1519[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1519[ sprintf.c:634 ]
	;;
#0:	       sub	r0, r14 -> r10  ; vfprintf.c:1519[ sprintf.c:634 ]
	;;
#0:	       cmplt	r10, 1 -> c1    ; vfprintf.c:1519[ sprintf.c:634 ]
	;;
#0:	if  c1 br @	.BB7_209
#1:	if !c1 br @	.BB7_205
	;;
.BB7_201:                               ; %bb180.i
                                        ;   in Loop: Header=BB7_205 Depth=2
#1:	       stm.a	r1.24, r0, 1    ; vfprintf.c:1519[ sprintf.c:634 ]
#0:	       ldiu	256 -> r2       ; vfprintf.c:1519[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r15, 304        ; vfprintf.c:1519[ sprintf.c:634 ]
#1:	       add	r15, r2 -> r2   ; vfprintf.c:1519[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1519[ sprintf.c:634 ]
	;;
#0:	       add	r0, 16 -> r0    ; vfprintf.c:1519[ sprintf.c:634 ]
	;;
#0:	       stm.a	r0, r2, 12      ; vfprintf.c:1519[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 52         ; vfprintf.c:1519[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1519[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1519[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1519[ sprintf.c:634 ]
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1519[ sprintf.c:634 ]
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1519[ sprintf.c:634 ]
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1519[ sprintf.c:634 ]
	;;
#0:	if !c1 br @	.BB7_203
	;;
.BB7_202:                               ;   in Loop: Header=BB7_205 Depth=2
#0:	       ldm.s	r15, 60         ; vfprintf.c:1519[ sprintf.c:634 ]
	;;
#0:	       br	.BB7_204
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1519[ sprintf.c:634 ]
	;;
#0:	       add	r0, 8 -> r0     ; vfprintf.c:1519[ sprintf.c:634 ]
	;;
#0:	       stm.s	r0, r15, 15
	;;
.BB7_203:                               ; %bb181.i
                                        ;   in Loop: Header=BB7_205 Depth=2
#0:	       ldiu	224 -> r2
	;;
#0:	       add	r15, r2 -> r2
	;;
#0:	       callg	___ssprint_r    ; vfprintf.c:1519[ sprintf.c:634 ]
#1:	       add	r2, 8 -> r0
#2:	       s2add	r15, 16 -> r2
	;;
#0:	       stm.s	r0, r15, 15
#1:	       add	r2, 16 -> r0
#2:	       ldiu	288 -> r2
	;;
#0:	       add	r15, r2 -> r2
	;;
#0:	       add	r2, 8 -> r1
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1519[ sprintf.c:634 ]
	;;
#0:	if  c3 br @	.BB7_352        ; vfprintf.c:1519[ sprintf.c:634 ]
	;;
.BB7_204:                               ; %bb184.i
                                        ;   in Loop: Header=BB7_205 Depth=2
#0:	       sub	r10, 16 -> r10
	;;
.BB7_205:                               ; %bb185.i
                                        ;   Parent Loop BB7_15 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#1:	       cmplt	r1.24, r10 -> c1 ; vfprintf.c:1519[ sprintf.c:634 ]
#0:	       ldm.s	r15, 60         ; vfprintf.c:1519[ sprintf.c:634 ]
#2:	       ldga	_blanks.3634 -> r1 ; vfprintf.c:1519[ sprintf.c:634 ]
	;;
#0:	if  c1 br	.BB7_201
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1519[ sprintf.c:634 ]
	;;
#0:	       stm.a	r1, r0, 0       ; vfprintf.c:1519[ sprintf.c:634 ]
	;;
	       nop	0
	;;
.BB7_206:                               ; %bb186.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 60         ; vfprintf.c:1519[ sprintf.c:634 ]
#1:	       ldiu	256 -> r3       ; vfprintf.c:1519[ sprintf.c:634 ]
	;;
#0:	       add	r15, r3 -> r3   ; vfprintf.c:1519[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1519[ sprintf.c:634 ]
	;;
#0:	       stm.a	r10, r0, 1      ; vfprintf.c:1519[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r15, 304        ; vfprintf.c:1519[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1519[ sprintf.c:634 ]
	;;
#0:	       add	r0, r10 -> r0
	;;
#0:	       stm.a	r0, r3, 12      ; vfprintf.c:1519[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 52         ; vfprintf.c:1519[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1519[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r1, 0           ; vfprintf.c:1519[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1519[ sprintf.c:634 ]
	;;
#0:	       add	r0, 1 -> r2     ; vfprintf.c:1519[ sprintf.c:634 ]
#1:	       ldi	7 -> r0
	;;
#0:	       cmplt	r0, r2 -> c1    ; vfprintf.c:1519[ sprintf.c:634 ]
#1:	       stm.a	r2, r1, 0       ; vfprintf.c:1519[ sprintf.c:634 ]
	;;
#0:	if  c1 br @	.BB7_208
	;;
.BB7_207:                               ; %bb186.bb190_crit_edge.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 60         ; vfprintf.c:1519[ sprintf.c:634 ]
	;;
#0:	       br	.BB7_209
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1519[ sprintf.c:634 ]
	;;
#0:	       add	r0, 8 -> r0     ; vfprintf.c:1519[ sprintf.c:634 ]
	;;
#0:	       stm.s	r0, r15, 15
	;;
.BB7_208:                               ; %bb187.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldiu	224 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       callg	___ssprint_r    ; vfprintf.c:1519[ sprintf.c:634 ]
#1:	       add	r10, 8 -> r0
#2:	       s2add	r15, 16 -> r10
	;;
#0:	       stm.s	r0, r15, 15
#1:	       add	r10, 16 -> r0
#2:	       ldiu	288 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       add	r10, 8 -> r1
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1519[ sprintf.c:634 ]
	;;
#0:	if  c3 br @	.BB7_352        ; vfprintf.c:1519[ sprintf.c:634 ]
	;;
.BB7_209:                               ; %bb190.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldiu	320 -> r2
#1:	       ldm.f	r15, 328        ; vfprintf.c:1522[ sprintf.c:634 ]
	;;
#0:	       add	r15, r2 -> r2
	;;
#0:	       add	r2, 8 -> r1
	;;
#0:	       ldx	$membu, r1 -> r0 ; vfprintf.c:1522[ sprintf.c:634 ]
	;;
#0:	       brz eq @	r0, .BB7_213    ; vfprintf.c:1522[ sprintf.c:634 ]
	;;
.BB7_210:                               ; %bb191.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 60         ; vfprintf.c:1523[ sprintf.c:634 ]
#1:	       ldiu	256 -> r2       ; vfprintf.c:1523[ sprintf.c:634 ]
	;;
#0:	       add	r15, r2 -> r2   ; vfprintf.c:1523[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1523[ sprintf.c:634 ]
	;;
#0:	       stm.a	r1, r0, 0       ; vfprintf.c:1523[ sprintf.c:634 ]
	;;
#0:	       stm.a	1, r0, 1        ; vfprintf.c:1523[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r15, 304        ; vfprintf.c:1523[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1523[ sprintf.c:634 ]
	;;
#0:	       add	r0, 1 -> r0     ; vfprintf.c:1523[ sprintf.c:634 ]
	;;
#0:	       stm.a	r0, r2, 12      ; vfprintf.c:1523[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 52         ; vfprintf.c:1523[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1523[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1523[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1523[ sprintf.c:634 ]
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1523[ sprintf.c:634 ]
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1523[ sprintf.c:634 ]
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1523[ sprintf.c:634 ]
	;;
#0:	if !c1 br @	.BB7_212
	;;
.BB7_211:                               ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 60         ; vfprintf.c:1523[ sprintf.c:634 ]
	;;
#0:	       br	.BB7_213
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1523[ sprintf.c:634 ]
	;;
#0:	       add	r0, 8 -> r0     ; vfprintf.c:1523[ sprintf.c:634 ]
	;;
#0:	       stm.s	r0, r15, 15
	;;
.BB7_212:                               ; %bb192.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldiu	224 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       callg	___ssprint_r    ; vfprintf.c:1523[ sprintf.c:634 ]
#1:	       add	r10, 8 -> r0
#2:	       s2add	r15, 16 -> r10
	;;
#0:	       stm.s	r0, r15, 15
#1:	       add	r10, 16 -> r0
#2:	       ldiu	288 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       add	r10, 8 -> r1
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1523[ sprintf.c:634 ]
	;;
#0:	if  c3 br @	.BB7_352        ; vfprintf.c:1523[ sprintf.c:634 ]
	;;
.BB7_213:                               ; %bb195.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1514[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1514[ sprintf.c:634 ]
	;;
#0:	       and	r0, 2 -> r0     ; vfprintf.c:1514[ sprintf.c:634 ]
	;;
#0:	       brz eq @	r0, .BB7_217    ; vfprintf.c:1524[ sprintf.c:634 ]
	;;
.BB7_214:                               ; %bb196.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 60         ; vfprintf.c:1525[ sprintf.c:634 ]
#1:	       ldiu	160 -> r2
	;;
#0:	       add	r15, r2 -> r2
	;;
#0:	       add	r2, 28 -> r1
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1525[ sprintf.c:634 ]
#2:	       ldiu	256 -> r2       ; vfprintf.c:1525[ sprintf.c:634 ]
	;;
#0:	       stm.a	r1, r0, 0       ; vfprintf.c:1525[ sprintf.c:634 ]
#1:	       add	r15, r2 -> r2   ; vfprintf.c:1525[ sprintf.c:634 ]
	;;
#0:	       stm.a	2, r0, 1        ; vfprintf.c:1525[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r15, 304        ; vfprintf.c:1525[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1525[ sprintf.c:634 ]
	;;
#0:	       add	r0, 2 -> r0     ; vfprintf.c:1525[ sprintf.c:634 ]
	;;
#0:	       stm.a	r0, r2, 12      ; vfprintf.c:1525[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 52         ; vfprintf.c:1525[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1525[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1525[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1525[ sprintf.c:634 ]
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1525[ sprintf.c:634 ]
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1525[ sprintf.c:634 ]
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1525[ sprintf.c:634 ]
	;;
#0:	if !c1 br @	.BB7_216
	;;
.BB7_215:                               ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 60         ; vfprintf.c:1525[ sprintf.c:634 ]
	;;
#0:	       br	.BB7_217
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1525[ sprintf.c:634 ]
	;;
#0:	       add	r0, 8 -> r0     ; vfprintf.c:1525[ sprintf.c:634 ]
	;;
#0:	       stm.s	r0, r15, 15
	;;
.BB7_216:                               ; %bb198.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldiu	224 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       callg	___ssprint_r    ; vfprintf.c:1525[ sprintf.c:634 ]
#1:	       add	r10, 8 -> r0
#2:	       s2add	r15, 16 -> r10
	;;
#0:	       stm.s	r0, r15, 15
#1:	       add	r10, 16 -> r0
#2:	       ldiu	288 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       add	r10, 8 -> r1
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1525[ sprintf.c:634 ]
	;;
#0:	if  c3 br @	.BB7_352        ; vfprintf.c:1525[ sprintf.c:634 ]
	;;
.BB7_217:                               ; %bb201.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       cmpne	r0.25, r0.30 -> c1 ; vfprintf.c:1528[ sprintf.c:634 ]
	;;
#0:	if  c1 br @	.BB7_227
	;;
.BB7_218:                               ; %bb202.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 64         ; vfprintf.c:1529[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1529[ sprintf.c:634 ]
	;;
#0:	       sub	r0, r14 -> r10  ; vfprintf.c:1529[ sprintf.c:634 ]
	;;
#0:	       cmplt	r10, 1 -> c1    ; vfprintf.c:1529[ sprintf.c:634 ]
	;;
#0:	if  c1 br @	.BB7_227
#1:	if !c1 br @	.BB7_223
	;;
.BB7_219:                               ; %bb203.i
                                        ;   in Loop: Header=BB7_223 Depth=2
#1:	       stm.a	r1.24, r0, 1    ; vfprintf.c:1529[ sprintf.c:634 ]
#0:	       ldiu	256 -> r2       ; vfprintf.c:1529[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r15, 304        ; vfprintf.c:1529[ sprintf.c:634 ]
#1:	       add	r15, r2 -> r2   ; vfprintf.c:1529[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1529[ sprintf.c:634 ]
	;;
#0:	       add	r0, 16 -> r0    ; vfprintf.c:1529[ sprintf.c:634 ]
	;;
#0:	       stm.a	r0, r2, 12      ; vfprintf.c:1529[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 52         ; vfprintf.c:1529[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1529[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1529[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1529[ sprintf.c:634 ]
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1529[ sprintf.c:634 ]
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1529[ sprintf.c:634 ]
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1529[ sprintf.c:634 ]
	;;
#0:	if !c1 br @	.BB7_221
	;;
.BB7_220:                               ;   in Loop: Header=BB7_223 Depth=2
#0:	       ldm.s	r15, 60         ; vfprintf.c:1529[ sprintf.c:634 ]
	;;
#0:	       br	.BB7_222
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1529[ sprintf.c:634 ]
	;;
#0:	       add	r0, 8 -> r0     ; vfprintf.c:1529[ sprintf.c:634 ]
	;;
#0:	       stm.s	r0, r15, 15
	;;
.BB7_221:                               ; %bb204.i
                                        ;   in Loop: Header=BB7_223 Depth=2
#0:	       ldiu	224 -> r2
	;;
#0:	       add	r15, r2 -> r2
	;;
#0:	       callg	___ssprint_r    ; vfprintf.c:1529[ sprintf.c:634 ]
#1:	       add	r2, 8 -> r0
#2:	       s2add	r15, 16 -> r2
	;;
#0:	       stm.s	r0, r15, 15
#1:	       add	r2, 16 -> r0
#2:	       ldiu	288 -> r2
	;;
#0:	       add	r15, r2 -> r2
	;;
#0:	       add	r2, 8 -> r1
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1529[ sprintf.c:634 ]
	;;
#0:	if  c3 br @	.BB7_352        ; vfprintf.c:1529[ sprintf.c:634 ]
	;;
.BB7_222:                               ; %bb207.i
                                        ;   in Loop: Header=BB7_223 Depth=2
#0:	       sub	r10, 16 -> r10
	;;
.BB7_223:                               ; %bb208.i
                                        ;   Parent Loop BB7_15 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#1:	       cmplt	r1.24, r10 -> c1 ; vfprintf.c:1529[ sprintf.c:634 ]
#0:	       ldm.s	r15, 60         ; vfprintf.c:1529[ sprintf.c:634 ]
#2:	       ldga	_zeroes.3635 -> r1 ; vfprintf.c:1529[ sprintf.c:634 ]
	;;
#0:	if  c1 br	.BB7_219
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1529[ sprintf.c:634 ]
	;;
#0:	       stm.a	r1, r0, 0       ; vfprintf.c:1529[ sprintf.c:634 ]
	;;
	       nop	0
	;;
.BB7_224:                               ; %bb209.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 60         ; vfprintf.c:1529[ sprintf.c:634 ]
#1:	       ldiu	256 -> r2       ; vfprintf.c:1529[ sprintf.c:634 ]
	;;
#0:	       add	r15, r2 -> r2   ; vfprintf.c:1529[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1529[ sprintf.c:634 ]
	;;
#0:	       stm.a	r10, r0, 1      ; vfprintf.c:1529[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r15, 304        ; vfprintf.c:1529[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1529[ sprintf.c:634 ]
	;;
#0:	       add	r0, r10 -> r0
	;;
#0:	       stm.a	r0, r2, 12      ; vfprintf.c:1529[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 52         ; vfprintf.c:1529[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1529[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1529[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1529[ sprintf.c:634 ]
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1529[ sprintf.c:634 ]
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1529[ sprintf.c:634 ]
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1529[ sprintf.c:634 ]
	;;
#0:	if !c1 br @	.BB7_226
	;;
.BB7_225:                               ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 60         ; vfprintf.c:1529[ sprintf.c:634 ]
	;;
#0:	       br	.BB7_227
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1529[ sprintf.c:634 ]
	;;
#0:	       add	r0, 8 -> r0     ; vfprintf.c:1529[ sprintf.c:634 ]
	;;
#0:	       stm.s	r0, r15, 15
	;;
.BB7_226:                               ; %bb210.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldiu	224 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       callg	___ssprint_r    ; vfprintf.c:1529[ sprintf.c:634 ]
#1:	       add	r10, 8 -> r0
#2:	       s2add	r15, 16 -> r10
	;;
#0:	       stm.s	r0, r15, 15
#1:	       add	r10, 16 -> r0
#2:	       ldiu	288 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       add	r10, 8 -> r1
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1529[ sprintf.c:634 ]
	;;
#0:	if  c3 br @	.BB7_352        ; vfprintf.c:1529[ sprintf.c:634 ]
	;;
.BB7_227:                               ; %bb213.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#3:	       sub	r3.23, r12 -> r10 ; vfprintf.c:1532[ sprintf.c:634 ]
	;;
#0:	       cmplt	r10, 1 -> c1    ; vfprintf.c:1532[ sprintf.c:634 ]
	;;
#0:	if  c1 br @	.BB7_236
#1:	if !c1 br @	.BB7_232
	;;
.BB7_228:                               ; %bb214.i
                                        ;   in Loop: Header=BB7_232 Depth=2
#1:	       stm.a	r1.24, r0, 1    ; vfprintf.c:1532[ sprintf.c:634 ]
#0:	       ldiu	256 -> r2       ; vfprintf.c:1532[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r15, 304        ; vfprintf.c:1532[ sprintf.c:634 ]
#1:	       add	r15, r2 -> r2   ; vfprintf.c:1532[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1532[ sprintf.c:634 ]
	;;
#0:	       add	r0, 16 -> r0    ; vfprintf.c:1532[ sprintf.c:634 ]
	;;
#0:	       stm.a	r0, r2, 12      ; vfprintf.c:1532[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 52         ; vfprintf.c:1532[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1532[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1532[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1532[ sprintf.c:634 ]
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1532[ sprintf.c:634 ]
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1532[ sprintf.c:634 ]
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1532[ sprintf.c:634 ]
	;;
#0:	if !c1 br @	.BB7_230
	;;
.BB7_229:                               ;   in Loop: Header=BB7_232 Depth=2
#0:	       ldm.s	r15, 60         ; vfprintf.c:1532[ sprintf.c:634 ]
	;;
#0:	       br	.BB7_231
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1532[ sprintf.c:634 ]
	;;
#0:	       add	r0, 8 -> r0     ; vfprintf.c:1532[ sprintf.c:634 ]
	;;
#0:	       stm.s	r0, r15, 15
	;;
.BB7_230:                               ; %bb215.i
                                        ;   in Loop: Header=BB7_232 Depth=2
#0:	       ldiu	224 -> r2
	;;
#0:	       add	r15, r2 -> r2
	;;
#0:	       callg	___ssprint_r    ; vfprintf.c:1532[ sprintf.c:634 ]
#1:	       add	r2, 8 -> r0
#2:	       s2add	r15, 16 -> r2
	;;
#0:	       stm.s	r0, r15, 15
#1:	       add	r2, 16 -> r0
#2:	       ldiu	288 -> r2
	;;
#0:	       add	r15, r2 -> r2
	;;
#0:	       add	r2, 8 -> r1
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1532[ sprintf.c:634 ]
	;;
#0:	if  c3 br @	.BB7_352        ; vfprintf.c:1532[ sprintf.c:634 ]
	;;
.BB7_231:                               ; %bb218.i
                                        ;   in Loop: Header=BB7_232 Depth=2
#0:	       sub	r10, 16 -> r10
	;;
.BB7_232:                               ; %bb219.i
                                        ;   Parent Loop BB7_15 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#1:	       cmplt	r1.24, r10 -> c1 ; vfprintf.c:1532[ sprintf.c:634 ]
#0:	       ldm.s	r15, 60         ; vfprintf.c:1532[ sprintf.c:634 ]
#2:	       ldga	_zeroes.3635 -> r1 ; vfprintf.c:1529[ sprintf.c:634 ]
	;;
#0:	if  c1 br	.BB7_228
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1532[ sprintf.c:634 ]
	;;
#0:	       stm.a	r1, r0, 0       ; vfprintf.c:1532[ sprintf.c:634 ]
	;;
	       nop	0
	;;
.BB7_233:                               ; %bb220.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 60         ; vfprintf.c:1532[ sprintf.c:634 ]
#1:	       ldiu	256 -> r3       ; vfprintf.c:1532[ sprintf.c:634 ]
	;;
#0:	       add	r15, r3 -> r3   ; vfprintf.c:1532[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1532[ sprintf.c:634 ]
	;;
#0:	       stm.a	r10, r0, 1      ; vfprintf.c:1532[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r15, 304        ; vfprintf.c:1532[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1532[ sprintf.c:634 ]
	;;
#0:	       add	r0, r10 -> r0
	;;
#0:	       stm.a	r0, r3, 12      ; vfprintf.c:1532[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 52         ; vfprintf.c:1532[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1532[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r1, 0           ; vfprintf.c:1532[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1532[ sprintf.c:634 ]
	;;
#0:	       add	r0, 1 -> r2     ; vfprintf.c:1532[ sprintf.c:634 ]
#1:	       ldi	7 -> r0
	;;
#0:	       cmplt	r0, r2 -> c1    ; vfprintf.c:1532[ sprintf.c:634 ]
#1:	       stm.a	r2, r1, 0       ; vfprintf.c:1532[ sprintf.c:634 ]
	;;
#0:	if  c1 br @	.BB7_235
	;;
.BB7_234:                               ; %bb220.bb224_crit_edge.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 60         ; vfprintf.c:1532[ sprintf.c:634 ]
	;;
#0:	       br	.BB7_236
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1532[ sprintf.c:634 ]
	;;
#0:	       add	r0, 8 -> r0     ; vfprintf.c:1532[ sprintf.c:634 ]
	;;
#0:	       stm.s	r0, r15, 15
	;;
.BB7_235:                               ; %bb221.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldiu	224 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       callg	___ssprint_r    ; vfprintf.c:1532[ sprintf.c:634 ]
#1:	       add	r10, 8 -> r0
#2:	       s2add	r15, 16 -> r10
	;;
#0:	       stm.s	r0, r15, 15
#1:	       add	r10, 16 -> r0
#2:	       ldiu	288 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       add	r10, 8 -> r1
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1532[ sprintf.c:634 ]
	;;
#0:	if  c3 br @	.BB7_352        ; vfprintf.c:1532[ sprintf.c:634 ]
	;;
.BB7_236:                               ; %bb224.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1536[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1536[ sprintf.c:634 ]
	;;
#0:	       btest	r0, 8 -> c1     ; vfprintf.c:1536[ sprintf.c:634 ]
	;;
#0:	if  c1 br @	.BB7_240
	;;
.BB7_237:                               ; %bb225.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 48         ; vfprintf.c:1537[ sprintf.c:634 ]
#1:	       ldiu	256 -> r2       ; vfprintf.c:1537[ sprintf.c:634 ]
	;;
#0:	       add	r15, r2 -> r2   ; vfprintf.c:1537[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1537[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 60         ; vfprintf.c:1537[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1537[ sprintf.c:634 ]
	;;
#0:	       stm.a	r1, r0, 0       ; vfprintf.c:1537[ sprintf.c:634 ]
	;;
#0:	       stm.a	r12, r0, 1      ; vfprintf.c:1537[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r15, 304        ; vfprintf.c:1537[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1537[ sprintf.c:634 ]
	;;
#0:	       add	r0, r12 -> r0   ; vfprintf.c:1537[ sprintf.c:634 ]
	;;
#0:	       stm.a	r0, r2, 12      ; vfprintf.c:1537[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 52         ; vfprintf.c:1537[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1537[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1537[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1537[ sprintf.c:634 ]
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1537[ sprintf.c:634 ]
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1537[ sprintf.c:634 ]
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1537[ sprintf.c:634 ]
	;;
#0:	if !c1 br @	.BB7_239
	;;
.BB7_238:                               ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 60         ; vfprintf.c:1537[ sprintf.c:634 ]
	;;
#0:	       br	.BB7_336
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1537[ sprintf.c:634 ]
	;;
#0:	       add	r0, 8 -> r0     ; vfprintf.c:1537[ sprintf.c:634 ]
	;;
#0:	       stm.s	r0, r15, 15
	;;
.BB7_239:                               ; %bb226.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldiu	224 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       callg	___ssprint_r    ; vfprintf.c:1537[ sprintf.c:634 ]
#1:	       add	r10, 8 -> r0
#2:	       s2add	r15, 16 -> r10
	;;
#0:	       stm.s	r0, r15, 15
#1:	       add	r10, 16 -> r0
#2:	       ldiu	288 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       add	r10, 8 -> r1
	;;
#0:	       cmpeq	r0, 0 -> c3     ; vfprintf.c:1537[ sprintf.c:634 ]
	;;
#0:	if !c3 br @	.BB7_352        ; vfprintf.c:1537[ sprintf.c:634 ]
#1:	if  c3 br @	.BB7_336        ; vfprintf.c:1537[ sprintf.c:634 ]
	;;
.BB7_240:                               ; %bb229.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#3:	       cmplt	r13, r3.28 -> c1 ; vfprintf.c:1539[ sprintf.c:634 ]
	;;
#0:	if  c1 br @	.BB7_311
	;;
.BB7_241:                               ; %bb230.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       fop	dcmp	d5, d6 -> f0 ; vfprintf.c:1540[ sprintf.c:634 ]
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r0       ; vfprintf.c:1540[ sprintf.c:634 ]
	;;
#0:	       btest	r0, 9 -> c1     ; vfprintf.c:1540[ sprintf.c:634 ]
	;;
#0:	if  c1 br @	.BB7_257
	;;
.BB7_242:                               ; %bb231.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 60         ; vfprintf.c:1542[ sprintf.c:634 ]
#1:	       ldga	._.str834 -> r1 ; vfprintf.c:1542[ sprintf.c:634 ]
#2:	       ldiu	256 -> r2       ; vfprintf.c:1542[ sprintf.c:634 ]
	;;
#0:	       add	r15, r2 -> r2   ; vfprintf.c:1542[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1542[ sprintf.c:634 ]
	;;
#0:	       stm.a	r1, r0, 0       ; vfprintf.c:1542[ sprintf.c:634 ]
	;;
#0:	       stm.a	1, r0, 1        ; vfprintf.c:1542[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r15, 304        ; vfprintf.c:1542[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1542[ sprintf.c:634 ]
	;;
#0:	       add	r0, 1 -> r0     ; vfprintf.c:1542[ sprintf.c:634 ]
	;;
#0:	       stm.a	r0, r2, 12      ; vfprintf.c:1542[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 52         ; vfprintf.c:1542[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1542[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1542[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1542[ sprintf.c:634 ]
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1542[ sprintf.c:634 ]
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1542[ sprintf.c:634 ]
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1542[ sprintf.c:634 ]
	;;
#0:	if !c1 br @	.BB7_244
	;;
.BB7_243:                               ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 60         ; vfprintf.c:1542[ sprintf.c:634 ]
	;;
#0:	       br	.BB7_245
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1542[ sprintf.c:634 ]
	;;
#0:	       add	r0, 8 -> r0     ; vfprintf.c:1542[ sprintf.c:634 ]
	;;
#0:	       stm.s	r0, r15, 15
	;;
.BB7_244:                               ; %bb232.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldiu	224 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       callg	___ssprint_r    ; vfprintf.c:1542[ sprintf.c:634 ]
#1:	       add	r10, 8 -> r0
#2:	       s2add	r15, 16 -> r10
	;;
#0:	       stm.s	r0, r15, 15
#1:	       add	r10, 16 -> r0
#2:	       ldiu	288 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       add	r10, 8 -> r1
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1542[ sprintf.c:634 ]
	;;
#0:	if  c3 br @	.BB7_352        ; vfprintf.c:1542[ sprintf.c:634 ]
	;;
.BB7_245:                               ; %bb235.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.f	r15, 320        ; vfprintf.c:1543[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1543[ sprintf.c:634 ]
#1:	       ldm.f	r15, 308        ; vfprintf.c:1543[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1543[ sprintf.c:634 ]
	;;
#0:	       cmplt	r1, r0 -> c1    ; vfprintf.c:1543[ sprintf.c:634 ]
	;;
#0:	if !c1 ldm.s	r15, 68         ; vfprintf.c:1543[ sprintf.c:634 ]
	;;
#0:	if !c1 ldx	$mem, 0 -> r0   ; vfprintf.c:1543[ sprintf.c:634 ]
	;;
#0:	if !c1 btest	r0, 0 -> c1     ; vfprintf.c:1543[ sprintf.c:634 ]
	;;
#0:	if !c1 br @	.BB7_336
	;;
.BB7_246:                               ; %bb238.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 60         ; vfprintf.c:1544[ sprintf.c:634 ]
#1:	       ldga	._.str69 -> r0  ; vfprintf.c:1544[ sprintf.c:634 ]
#2:	       ldiu	256 -> r2       ; vfprintf.c:1544[ sprintf.c:634 ]
	;;
#0:	       add	r15, r2 -> r2   ; vfprintf.c:1544[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1544[ sprintf.c:634 ]
	;;
#0:	       stm.a	r0, r1, 0       ; vfprintf.c:1544[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 32         ; vfprintf.c:1544[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1544[ sprintf.c:634 ]
	;;
#0:	       stm.a	r0, r1, 1       ; vfprintf.c:1544[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r15, 304        ; vfprintf.c:1544[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1544[ sprintf.c:634 ]
	;;
#0:	       add	r1, r0 -> r0    ; vfprintf.c:1544[ sprintf.c:634 ]
	;;
#0:	       stm.a	r0, r2, 12      ; vfprintf.c:1544[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 52         ; vfprintf.c:1544[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1544[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1544[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1544[ sprintf.c:634 ]
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1544[ sprintf.c:634 ]
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1544[ sprintf.c:634 ]
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1544[ sprintf.c:634 ]
	;;
#0:	if !c1 br @	.BB7_248
	;;
.BB7_247:                               ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 60         ; vfprintf.c:1544[ sprintf.c:634 ]
	;;
#0:	       br	.BB7_249
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1544[ sprintf.c:634 ]
	;;
#0:	       add	r0, 8 -> r0     ; vfprintf.c:1544[ sprintf.c:634 ]
	;;
#0:	       stm.s	r0, r15, 15
	;;
.BB7_248:                               ; %bb239.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldiu	224 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       callg	___ssprint_r    ; vfprintf.c:1544[ sprintf.c:634 ]
#1:	       add	r10, 8 -> r0
#2:	       s2add	r15, 16 -> r10
	;;
#0:	       stm.s	r0, r15, 15
#1:	       add	r10, 16 -> r0
#2:	       ldiu	288 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       add	r10, 8 -> r1
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1544[ sprintf.c:634 ]
	;;
#0:	if  c3 br @	.BB7_352        ; vfprintf.c:1544[ sprintf.c:634 ]
	;;
.BB7_249:                               ; %bb242.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.f	r15, 308        ; vfprintf.c:1545[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1545[ sprintf.c:634 ]
	;;
#0:	       sub	r0, 1 -> r10
	;;
#0:	       cmplt	r10, 1 -> c1    ; vfprintf.c:1545[ sprintf.c:634 ]
	;;
#0:	if  c1 br @	.BB7_336
#1:	if !c1 br @	.BB7_254
	;;
.BB7_250:                               ; %bb243.i
                                        ;   in Loop: Header=BB7_254 Depth=2
#1:	       stm.a	r1.24, r0, 1    ; vfprintf.c:1545[ sprintf.c:634 ]
#0:	       ldiu	256 -> r2       ; vfprintf.c:1545[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r15, 304        ; vfprintf.c:1545[ sprintf.c:634 ]
#1:	       add	r15, r2 -> r2   ; vfprintf.c:1545[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1545[ sprintf.c:634 ]
	;;
#0:	       add	r0, 16 -> r0    ; vfprintf.c:1545[ sprintf.c:634 ]
	;;
#0:	       stm.a	r0, r2, 12      ; vfprintf.c:1545[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 52         ; vfprintf.c:1545[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1545[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1545[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1545[ sprintf.c:634 ]
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1545[ sprintf.c:634 ]
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1545[ sprintf.c:634 ]
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1545[ sprintf.c:634 ]
	;;
#0:	if !c1 br @	.BB7_252
	;;
.BB7_251:                               ;   in Loop: Header=BB7_254 Depth=2
#0:	       ldm.s	r15, 60         ; vfprintf.c:1545[ sprintf.c:634 ]
	;;
#0:	       br	.BB7_253
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1545[ sprintf.c:634 ]
	;;
#0:	       add	r0, 8 -> r0     ; vfprintf.c:1545[ sprintf.c:634 ]
	;;
#0:	       stm.s	r0, r15, 15
	;;
.BB7_252:                               ; %bb244.i
                                        ;   in Loop: Header=BB7_254 Depth=2
#0:	       ldiu	224 -> r12
	;;
#0:	       add	r15, r12 -> r12
	;;
#0:	       callg	___ssprint_r    ; vfprintf.c:1545[ sprintf.c:634 ]
#1:	       add	r12, 8 -> r0
#2:	       s2add	r15, 16 -> r12
	;;
#0:	       stm.s	r0, r15, 15
#1:	       add	r12, 16 -> r0
#2:	       ldiu	288 -> r12
	;;
#0:	       add	r15, r12 -> r12
	;;
#0:	       add	r12, 8 -> r1
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1545[ sprintf.c:634 ]
	;;
#0:	if  c3 br @	.BB7_352        ; vfprintf.c:1545[ sprintf.c:634 ]
	;;
.BB7_253:                               ; %bb247.i
                                        ;   in Loop: Header=BB7_254 Depth=2
#0:	       sub	r10, 16 -> r10
	;;
.BB7_254:                               ; %bb248.i
                                        ;   Parent Loop BB7_15 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#1:	       cmplt	r1.24, r10 -> c1 ; vfprintf.c:1545[ sprintf.c:634 ]
#0:	       ldm.s	r15, 60         ; vfprintf.c:1545[ sprintf.c:634 ]
#2:	       ldga	_zeroes.3635 -> r1 ; vfprintf.c:1529[ sprintf.c:634 ]
	;;
#0:	if  c1 br	.BB7_250
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1545[ sprintf.c:634 ]
	;;
#0:	       stm.a	r1, r0, 0       ; vfprintf.c:1545[ sprintf.c:634 ]
	;;
	       nop	0
	;;
.BB7_255:                               ; %bb249.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 60         ; vfprintf.c:1545[ sprintf.c:634 ]
#1:	       ldiu	256 -> r2       ; vfprintf.c:1545[ sprintf.c:634 ]
	;;
#0:	       add	r15, r2 -> r2   ; vfprintf.c:1545[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1545[ sprintf.c:634 ]
	;;
#0:	       stm.a	r10, r0, 1      ; vfprintf.c:1545[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r15, 304        ; vfprintf.c:1545[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1545[ sprintf.c:634 ]
	;;
#0:	       add	r0, r10 -> r0
	;;
#0:	       stm.a	r0, r2, 12      ; vfprintf.c:1545[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 52         ; vfprintf.c:1545[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1545[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1545[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1545[ sprintf.c:634 ]
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1545[ sprintf.c:634 ]
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1545[ sprintf.c:634 ]
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1545[ sprintf.c:634 ]
	;;
#0:	if  c1 br @	.BB7_238
	;;
.BB7_256:                               ; %bb250.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldiu	224 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       callg	___ssprint_r    ; vfprintf.c:1545[ sprintf.c:634 ]
#1:	       add	r10, 8 -> r0
#2:	       s2add	r15, 16 -> r10
	;;
#0:	       stm.s	r0, r15, 15
#1:	       add	r10, 16 -> r0
#2:	       ldiu	288 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       add	r10, 8 -> r1
	;;
#0:	       cmpeq	r0, 0 -> c3     ; vfprintf.c:1545[ sprintf.c:634 ]
	;;
#0:	if !c3 br @	.BB7_352        ; vfprintf.c:1545[ sprintf.c:634 ]
#1:	if  c3 br @	.BB7_336        ; vfprintf.c:1545[ sprintf.c:634 ]
	;;
.BB7_257:                               ; %bb253.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.f	r15, 320        ; vfprintf.c:1547[ sprintf.c:634 ]
#1:	       ldi	0 -> r0
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1547[ sprintf.c:634 ]
	;;
#0:	       cmplt	r0, r1 -> c1    ; vfprintf.c:1547[ sprintf.c:634 ]
	;;
#0:	if  c1 br @	.BB7_280
	;;
.BB7_258:                               ; %bb254.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 60         ; vfprintf.c:1548[ sprintf.c:634 ]
#1:	       ldga	._.str834 -> r1 ; vfprintf.c:1542[ sprintf.c:634 ]
#2:	       ldiu	256 -> r2       ; vfprintf.c:1548[ sprintf.c:634 ]
	;;
#0:	       add	r15, r2 -> r2   ; vfprintf.c:1548[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1548[ sprintf.c:634 ]
	;;
#0:	       stm.a	r1, r0, 0       ; vfprintf.c:1548[ sprintf.c:634 ]
	;;
#0:	       stm.a	1, r0, 1        ; vfprintf.c:1548[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r15, 304        ; vfprintf.c:1548[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1548[ sprintf.c:634 ]
	;;
#0:	       add	r0, 1 -> r0     ; vfprintf.c:1548[ sprintf.c:634 ]
	;;
#0:	       stm.a	r0, r2, 12      ; vfprintf.c:1548[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 52         ; vfprintf.c:1548[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1548[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1548[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1548[ sprintf.c:634 ]
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1548[ sprintf.c:634 ]
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1548[ sprintf.c:634 ]
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1548[ sprintf.c:634 ]
	;;
#0:	if !c1 br @	.BB7_260
	;;
.BB7_259:                               ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 60         ; vfprintf.c:1548[ sprintf.c:634 ]
	;;
#0:	       br	.BB7_261
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1548[ sprintf.c:634 ]
	;;
#0:	       add	r0, 8 -> r0     ; vfprintf.c:1548[ sprintf.c:634 ]
	;;
#0:	       stm.s	r0, r15, 15
	;;
.BB7_260:                               ; %bb255.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldiu	224 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       callg	___ssprint_r    ; vfprintf.c:1548[ sprintf.c:634 ]
#1:	       add	r10, 8 -> r0
#2:	       s2add	r15, 16 -> r10
	;;
#0:	       stm.s	r0, r15, 15
#1:	       add	r10, 16 -> r0
#2:	       ldiu	288 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       add	r10, 8 -> r1
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1548[ sprintf.c:634 ]
	;;
#0:	if  c3 br @	.BB7_352        ; vfprintf.c:1548[ sprintf.c:634 ]
	;;
.BB7_261:                               ; %bb258.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.f	r15, 320        ; vfprintf.c:1549[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1549[ sprintf.c:634 ]
	;;
#0:	       brz ne @	r0, .BB7_264    ; vfprintf.c:1549[ sprintf.c:634 ]
	;;
.BB7_262:                               ; %bb259.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.f	r15, 308        ; vfprintf.c:1549[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1549[ sprintf.c:634 ]
	;;
#0:	       brz ne @	r0, .BB7_264    ; vfprintf.c:1549[ sprintf.c:634 ]
	;;
.BB7_263:                               ; %bb260.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1549[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1549[ sprintf.c:634 ]
	;;
#0:	       btest	r0, 0 -> c1     ; vfprintf.c:1549[ sprintf.c:634 ]
	;;
#0:	if !c1 br @	.BB7_336
	;;
.BB7_264:                               ; %bb262.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 60         ; vfprintf.c:1550[ sprintf.c:634 ]
#1:	       ldga	._.str69 -> r0  ; vfprintf.c:1544[ sprintf.c:634 ]
#2:	       ldiu	256 -> r2       ; vfprintf.c:1550[ sprintf.c:634 ]
	;;
#0:	       add	r15, r2 -> r2   ; vfprintf.c:1550[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1550[ sprintf.c:634 ]
	;;
#0:	       stm.a	r0, r1, 0       ; vfprintf.c:1550[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 32         ; vfprintf.c:1550[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1550[ sprintf.c:634 ]
	;;
#0:	       stm.a	r0, r1, 1       ; vfprintf.c:1550[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r15, 304        ; vfprintf.c:1550[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1550[ sprintf.c:634 ]
	;;
#0:	       add	r1, r0 -> r0    ; vfprintf.c:1550[ sprintf.c:634 ]
	;;
#0:	       stm.a	r0, r2, 12      ; vfprintf.c:1550[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 52         ; vfprintf.c:1550[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1550[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1550[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1550[ sprintf.c:634 ]
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1550[ sprintf.c:634 ]
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1550[ sprintf.c:634 ]
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1550[ sprintf.c:634 ]
	;;
#0:	if !c1 br @	.BB7_266
	;;
.BB7_265:                               ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 60         ; vfprintf.c:1550[ sprintf.c:634 ]
#1:	       br	.BB7_267
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1550[ sprintf.c:634 ]
	;;
#0:	       add	r0, 8 -> r10    ; vfprintf.c:1550[ sprintf.c:634 ]
	;;
.BB7_266:                               ; %bb263.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldiu	224 -> r12
	;;
#0:	       add	r15, r12 -> r12
	;;
#0:	       callg	___ssprint_r    ; vfprintf.c:1550[ sprintf.c:634 ]
#1:	       add	r12, 8 -> r10
#2:	       s2add	r15, 16 -> r12
	;;
#0:	       add	r12, 16 -> r0
#1:	       ldiu	288 -> r12
	;;
#0:	       add	r15, r12 -> r12
	;;
#0:	       add	r12, 8 -> r1
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1550[ sprintf.c:634 ]
	;;
#0:	if  c3 br @	.BB7_352        ; vfprintf.c:1550[ sprintf.c:634 ]
	;;
.BB7_267:                               ; %bb266.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.f	r15, 320        ; vfprintf.c:1551[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1551[ sprintf.c:634 ]
	;;
#1:	       cmplt	r1.29, r1 -> c1 ; vfprintf.c:1551[ sprintf.c:634 ]
	;;
#0:	if  c1 br @	.BB7_277
	;;
.BB7_268:                               ; %bb272.i.preheader
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldi	0 -> r0
#1:	       br	.BB7_273
	;;
#0:	       sub	r0, r1 -> r12
	;;
	       nop	0
	;;
.BB7_269:                               ; %bb267.i
                                        ;   in Loop: Header=BB7_273 Depth=2
#1:	       stm.a	r1.24, r10, 1   ; vfprintf.c:1551[ sprintf.c:634 ]
#0:	       ldiu	256 -> r2       ; vfprintf.c:1551[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r15, 304        ; vfprintf.c:1551[ sprintf.c:634 ]
#1:	       add	r15, r2 -> r2   ; vfprintf.c:1551[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1551[ sprintf.c:634 ]
	;;
#0:	       add	r0, 16 -> r0    ; vfprintf.c:1551[ sprintf.c:634 ]
	;;
#0:	       stm.a	r0, r2, 12      ; vfprintf.c:1551[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 52         ; vfprintf.c:1551[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1551[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1551[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1551[ sprintf.c:634 ]
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1551[ sprintf.c:634 ]
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1551[ sprintf.c:634 ]
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1551[ sprintf.c:634 ]
	;;
#0:	if !c1 br @	.BB7_271
	;;
.BB7_270:                               ;   in Loop: Header=BB7_273 Depth=2
#0:	       add	r10, 8 -> r10   ; vfprintf.c:1551[ sprintf.c:634 ]
#1:	       br @	.BB7_272
	;;
.BB7_271:                               ; %bb268.i
                                        ;   in Loop: Header=BB7_273 Depth=2
#0:	       ldiu	224 -> r13
	;;
#0:	       add	r15, r13 -> r13
	;;
#0:	       callg	___ssprint_r    ; vfprintf.c:1551[ sprintf.c:634 ]
#1:	       add	r13, 8 -> r10
#2:	       s2add	r15, 16 -> r13
	;;
#0:	       add	r13, 16 -> r0
#1:	       ldiu	288 -> r13
	;;
#0:	       add	r15, r13 -> r13
	;;
#0:	       add	r13, 8 -> r1
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1551[ sprintf.c:634 ]
	;;
#0:	if  c3 br @	.BB7_352        ; vfprintf.c:1551[ sprintf.c:634 ]
	;;
.BB7_272:                               ; %bb271.i
                                        ;   in Loop: Header=BB7_273 Depth=2
#0:	       sub	r12, 16 -> r12
	;;
.BB7_273:                               ; %bb272.i
                                        ;   Parent Loop BB7_15 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#1:	       cmplt	r1.24, r12 -> c1 ; vfprintf.c:1551[ sprintf.c:634 ]
#0:	       ldga	_zeroes.3635 -> r0 ; vfprintf.c:1529[ sprintf.c:634 ]
	;;
#0:	if  c1 br @	.BB7_269
#1:	       stm.a	r0, r10, 0      ; vfprintf.c:1551[ sprintf.c:634 ]
	;;
.BB7_274:                               ; %bb273.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       stm.a	r12, r10, 1     ; vfprintf.c:1551[ sprintf.c:634 ]
#1:	       ldiu	256 -> r2       ; vfprintf.c:1551[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r15, 304        ; vfprintf.c:1551[ sprintf.c:634 ]
#1:	       add	r15, r2 -> r2   ; vfprintf.c:1551[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1551[ sprintf.c:634 ]
	;;
#0:	       add	r0, r12 -> r0
	;;
#0:	       stm.a	r0, r2, 12      ; vfprintf.c:1551[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 52         ; vfprintf.c:1551[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1551[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1551[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1551[ sprintf.c:634 ]
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1551[ sprintf.c:634 ]
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1551[ sprintf.c:634 ]
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1551[ sprintf.c:634 ]
	;;
#0:	if !c1 br @	.BB7_276
	;;
.BB7_275:                               ;   in Loop: Header=BB7_15 Depth=1
#0:	       add	r10, 8 -> r10   ; vfprintf.c:1551[ sprintf.c:634 ]
#1:	       br @	.BB7_277
	;;
.BB7_276:                               ; %bb274.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldiu	224 -> r12
	;;
#0:	       add	r15, r12 -> r12
	;;
#0:	       callg	___ssprint_r    ; vfprintf.c:1551[ sprintf.c:634 ]
#1:	       add	r12, 8 -> r10
#2:	       s2add	r15, 16 -> r12
	;;
#0:	       add	r12, 16 -> r0
#1:	       ldiu	288 -> r12
	;;
#0:	       add	r15, r12 -> r12
	;;
#0:	       add	r12, 8 -> r1
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1551[ sprintf.c:634 ]
	;;
#0:	if  c3 br @	.BB7_352        ; vfprintf.c:1551[ sprintf.c:634 ]
	;;
.BB7_277:                               ; %bb277.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 48         ; vfprintf.c:1552[ sprintf.c:634 ]
#1:	       ldiu	256 -> r2       ; vfprintf.c:1552[ sprintf.c:634 ]
	;;
#0:	       add	r15, r2 -> r2   ; vfprintf.c:1552[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1552[ sprintf.c:634 ]
	;;
#0:	       stm.a	r0, r10, 0      ; vfprintf.c:1552[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r15, 308        ; vfprintf.c:1552[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1552[ sprintf.c:634 ]
	;;
#0:	       stm.a	r0, r10, 1      ; vfprintf.c:1552[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r15, 304        ; vfprintf.c:1552[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1552[ sprintf.c:634 ]
#1:	       ldm.f	r15, 308        ; vfprintf.c:1552[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1552[ sprintf.c:634 ]
	;;
#0:	       add	r0, r1 -> r0    ; vfprintf.c:1552[ sprintf.c:634 ]
	;;
#0:	       stm.a	r0, r2, 12      ; vfprintf.c:1552[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 52         ; vfprintf.c:1552[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1552[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1552[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1552[ sprintf.c:634 ]
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1552[ sprintf.c:634 ]
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1552[ sprintf.c:634 ]
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1552[ sprintf.c:634 ]
	;;
#0:	if !c1 br @	.BB7_279
	;;
.BB7_278:                               ;   in Loop: Header=BB7_15 Depth=1
#0:	       add	r10, 8 -> r0    ; vfprintf.c:1552[ sprintf.c:634 ]
#1:	       br	.BB7_336
	;;
#0:	       stm.s	r0, r15, 15
	;;
	       nop	0
	;;
.BB7_279:                               ; %bb278.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldiu	224 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       callg	___ssprint_r    ; vfprintf.c:1552[ sprintf.c:634 ]
#1:	       add	r10, 8 -> r0
#2:	       s2add	r15, 16 -> r10
	;;
#0:	       stm.s	r0, r15, 15
#1:	       add	r10, 16 -> r0
#2:	       ldiu	288 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       add	r10, 8 -> r1
	;;
#0:	       cmpeq	r0, 0 -> c3     ; vfprintf.c:1552[ sprintf.c:634 ]
	;;
#0:	if !c3 br @	.BB7_352        ; vfprintf.c:1552[ sprintf.c:634 ]
#1:	if  c3 br @	.BB7_336        ; vfprintf.c:1552[ sprintf.c:634 ]
	;;
.BB7_280:                               ; %bb281.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.f	r15, 308        ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r12  ; vfprintf.c:1556[ sprintf.c:634 ]
#1:	       ldm.s	r15, 40         ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       or	r12, 0 -> r10
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       cmplt	r0, r12 -> c1   ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	if  c1 or	r0, 0 -> r10
	;;
#0:	       cmplt	r10, 1 -> c1    ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	if  c1 br @	.BB7_284
	;;
.BB7_281:                               ; %bb285.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 48         ; vfprintf.c:1556[ sprintf.c:634 ]
#1:	       ldiu	256 -> r2       ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       add	r15, r2 -> r2   ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 60         ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       stm.a	r1, r0, 0       ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       stm.a	r10, r0, 1      ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r15, 304        ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       add	r0, r10 -> r0   ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       stm.a	r0, r2, 12      ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 52         ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1556[ sprintf.c:634 ]
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	if !c1 br @	.BB7_283
	;;
.BB7_282:                               ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 60         ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       br	.BB7_284
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       add	r0, 8 -> r0     ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       stm.s	r0, r15, 15
	;;
.BB7_283:                               ; %bb286.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldiu	224 -> r13
	;;
#0:	       add	r15, r13 -> r13
	;;
#0:	       callg	___ssprint_r    ; vfprintf.c:1556[ sprintf.c:634 ]
#1:	       add	r13, 8 -> r0
#2:	       s2add	r15, 16 -> r13
	;;
#0:	       stm.s	r0, r15, 15
#1:	       add	r13, 16 -> r0
#2:	       ldiu	288 -> r13
	;;
#0:	       add	r15, r13 -> r13
	;;
#0:	       add	r13, 8 -> r1
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	if  c3 br @	.BB7_352        ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
.BB7_284:                               ; %bb289.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 40         ; vfprintf.c:1556[ sprintf.c:634 ]
#1:	       cmplt	r10, 0 -> c1
#2:	       ldi	0 -> r0
	;;
#0:	if  c1 or	r0, 0 -> r10    ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       sub	r0, r10 -> r0   ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       cmplt	r0, 1 -> c1     ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	if  c1 br @	.BB7_294
	;;
.BB7_285:                               ; %bb297.preheader.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 40
#1:	       xor	r12, -1 -> r2
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       xor	r1, -1 -> r0
	;;
#0:	       cmplt	r2, r0 -> c1
#1:	       ldi	0 -> r0
	;;
#0:	if  c1 xor	r1, -1 -> r2
	;;
#0:	       xor	r2, -1 -> r3
	;;
#0:	       br	.BB7_290
#1:	       cmplt	r0, r3 -> c1
#2:	       ldi	0 -> r0
	;;
#0:	if  c1 xor	r2, -1 -> r0
	;;
#0:	       sub	r1, r0 -> r10
	;;
.BB7_286:                               ; %bb292.i
                                        ;   in Loop: Header=BB7_290 Depth=2
#1:	       stm.a	r1.24, r0, 1    ; vfprintf.c:1556[ sprintf.c:634 ]
#0:	       ldiu	256 -> r2       ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r15, 304        ; vfprintf.c:1556[ sprintf.c:634 ]
#1:	       add	r15, r2 -> r2   ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       add	r0, 16 -> r0    ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       stm.a	r0, r2, 12      ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 52         ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1556[ sprintf.c:634 ]
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	if !c1 br @	.BB7_288
	;;
.BB7_287:                               ;   in Loop: Header=BB7_290 Depth=2
#0:	       ldm.s	r15, 60         ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       br	.BB7_289
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       add	r0, 8 -> r0     ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       stm.s	r0, r15, 15
	;;
.BB7_288:                               ; %bb293.i
                                        ;   in Loop: Header=BB7_290 Depth=2
#0:	       ldiu	224 -> r12
	;;
#0:	       add	r15, r12 -> r12
	;;
#0:	       callg	___ssprint_r    ; vfprintf.c:1556[ sprintf.c:634 ]
#1:	       add	r12, 8 -> r0
#2:	       s2add	r15, 16 -> r12
	;;
#0:	       stm.s	r0, r15, 15
#1:	       add	r12, 16 -> r0
#2:	       ldiu	288 -> r12
	;;
#0:	       add	r15, r12 -> r12
	;;
#0:	       add	r12, 8 -> r1
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	if  c3 br @	.BB7_352        ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
.BB7_289:                               ; %bb296.i
                                        ;   in Loop: Header=BB7_290 Depth=2
#0:	       sub	r10, 16 -> r10
	;;
.BB7_290:                               ; %bb297.i
                                        ;   Parent Loop BB7_15 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#1:	       cmplt	r1.24, r10 -> c1 ; vfprintf.c:1556[ sprintf.c:634 ]
#0:	       ldm.s	r15, 60         ; vfprintf.c:1556[ sprintf.c:634 ]
#2:	       ldga	_zeroes.3635 -> r1 ; vfprintf.c:1529[ sprintf.c:634 ]
	;;
#0:	if  c1 br	.BB7_286
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       stm.a	r1, r0, 0       ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
	       nop	0
	;;
.BB7_291:                               ; %bb298.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 60         ; vfprintf.c:1556[ sprintf.c:634 ]
#1:	       ldiu	256 -> r3       ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       add	r15, r3 -> r3   ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       stm.a	r10, r0, 1      ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r15, 304        ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       add	r0, r10 -> r0
	;;
#0:	       stm.a	r0, r3, 12      ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 52         ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r1, 0           ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       add	r0, 1 -> r2     ; vfprintf.c:1556[ sprintf.c:634 ]
#1:	       ldi	7 -> r0
	;;
#0:	       cmplt	r0, r2 -> c1    ; vfprintf.c:1556[ sprintf.c:634 ]
#1:	       stm.a	r2, r1, 0       ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	if  c1 br @	.BB7_293
	;;
.BB7_292:                               ; %bb298.bb302_crit_edge.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 60         ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       br	.BB7_294
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       add	r0, 8 -> r0     ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	       stm.s	r0, r15, 15
	;;
.BB7_293:                               ; %bb299.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldiu	224 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       callg	___ssprint_r    ; vfprintf.c:1556[ sprintf.c:634 ]
#1:	       add	r10, 8 -> r0
#2:	       s2add	r15, 16 -> r10
	;;
#0:	       stm.s	r0, r15, 15
#1:	       add	r10, 16 -> r0
#2:	       ldiu	288 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       add	r10, 8 -> r1
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
#0:	if  c3 br @	.BB7_352        ; vfprintf.c:1556[ sprintf.c:634 ]
	;;
.BB7_294:                               ; %bb302.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.f	r15, 320        ; vfprintf.c:1577[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r3   ; vfprintf.c:1577[ sprintf.c:634 ]
#1:	       ldm.f	r15, 308        ; vfprintf.c:1577[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r2   ; vfprintf.c:1577[ sprintf.c:634 ]
#1:	       ldm.s	r15, 40         ; vfprintf.c:1558[ sprintf.c:634 ]
	;;
#0:	       cmplt	r3, r2 -> c1    ; vfprintf.c:1577[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1558[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 48         ; vfprintf.c:1558[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1558[ sprintf.c:634 ]
	;;
#1:	if !c1 ldm.s	r15, 68         ; vfprintf.c:1577[ sprintf.c:634 ]
#0:	       add	r1, r0 -> r0.26 ; vfprintf.c:1558[ sprintf.c:634 ]
	;;
#0:	if !c1 ldx	$mem, 0 -> r0   ; vfprintf.c:1577[ sprintf.c:634 ]
	;;
#0:	if !c1 btest	r0, 0 -> c1     ; vfprintf.c:1577[ sprintf.c:634 ]
	;;
#0:	if !c1 br @	.BB7_298
	;;
.BB7_295:                               ; %bb305.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 60         ; vfprintf.c:1578[ sprintf.c:634 ]
#1:	       ldga	._.str69 -> r0  ; vfprintf.c:1544[ sprintf.c:634 ]
#2:	       ldiu	256 -> r3       ; vfprintf.c:1578[ sprintf.c:634 ]
	;;
#0:	       add	r15, r3 -> r3   ; vfprintf.c:1578[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1578[ sprintf.c:634 ]
	;;
#0:	       stm.a	r0, r1, 0       ; vfprintf.c:1578[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 32         ; vfprintf.c:1578[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1578[ sprintf.c:634 ]
	;;
#0:	       stm.a	r0, r1, 1       ; vfprintf.c:1578[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r15, 304        ; vfprintf.c:1578[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1578[ sprintf.c:634 ]
	;;
#0:	       add	r1, r0 -> r0    ; vfprintf.c:1578[ sprintf.c:634 ]
	;;
#0:	       stm.a	r0, r3, 12      ; vfprintf.c:1578[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 52         ; vfprintf.c:1578[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1578[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r1, 0           ; vfprintf.c:1578[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1578[ sprintf.c:634 ]
	;;
#0:	       add	r0, 1 -> r2     ; vfprintf.c:1578[ sprintf.c:634 ]
#1:	       ldi	7 -> r0
	;;
#0:	       cmplt	r0, r2 -> c1    ; vfprintf.c:1578[ sprintf.c:634 ]
#1:	       stm.a	r2, r1, 0       ; vfprintf.c:1578[ sprintf.c:634 ]
	;;
#0:	if  c1 br @	.BB7_297
	;;
.BB7_296:                               ; %bb305.bb309_crit_edge.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 60         ; vfprintf.c:1578[ sprintf.c:634 ]
	;;
#0:	       br	.BB7_298
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1578[ sprintf.c:634 ]
	;;
#0:	       add	r0, 8 -> r0     ; vfprintf.c:1578[ sprintf.c:634 ]
	;;
#0:	       stm.s	r0, r15, 15
	;;
.BB7_297:                               ; %bb306.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldiu	224 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       callg	___ssprint_r    ; vfprintf.c:1578[ sprintf.c:634 ]
#1:	       add	r10, 8 -> r0
#2:	       s2add	r15, 16 -> r10
	;;
#0:	       stm.s	r0, r15, 15
#1:	       add	r10, 16 -> r0
#2:	       ldiu	288 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       add	r10, 8 -> r1
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1578[ sprintf.c:634 ]
	;;
#0:	if  c3 br @	.BB7_352        ; vfprintf.c:1578[ sprintf.c:634 ]
	;;
.BB7_298:                               ; %bb309.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.f	r15, 308        ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r13  ; vfprintf.c:1579[ sprintf.c:634 ]
#1:	       ldm.f	r15, 320        ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r12  ; vfprintf.c:1579[ sprintf.c:634 ]
#1:	       ldm.s	r15, 48         ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       add	r0, r13 -> r0.25 ; vfprintf.c:1579[ sprintf.c:634 ]
#1:	       sub	r13, r12 -> r0  ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       sub	r0.25, r0.26 -> r10 ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       cmplt	r0, r10 -> c1   ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	if  c1 sub	r13, r12 -> r10
	;;
#0:	       cmplt	r10, 1 -> c1    ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	if  c1 br @	.BB7_302
	;;
.BB7_299:                               ; %bb313.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 60         ; vfprintf.c:1579[ sprintf.c:634 ]
#1:	       ldiu	256 -> r3       ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       add	r15, r3 -> r3   ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       stm.a	r0.26, r0, 0    ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       stm.a	r10, r0, 1      ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r15, 304        ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       add	r0, r10 -> r0   ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       stm.a	r0, r3, 12      ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 52         ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r1, 0           ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       add	r0, 1 -> r2     ; vfprintf.c:1579[ sprintf.c:634 ]
#1:	       ldi	7 -> r0
	;;
#0:	       cmplt	r0, r2 -> c1    ; vfprintf.c:1579[ sprintf.c:634 ]
#1:	       stm.a	r2, r1, 0       ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	if  c1 br @	.BB7_301
	;;
.BB7_300:                               ; %bb313.bb317_crit_edge.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 60         ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       br	.BB7_302
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       add	r0, 8 -> r0     ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       stm.s	r0, r15, 15
	;;
.BB7_301:                               ; %bb314.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldiu	224 -> r2
	;;
#0:	       add	r15, r2 -> r2
	;;
#0:	       callg	___ssprint_r    ; vfprintf.c:1579[ sprintf.c:634 ]
#1:	       add	r2, 8 -> r0
#2:	       s2add	r15, 16 -> r2
	;;
#0:	       stm.s	r0, r15, 15
#1:	       add	r2, 16 -> r0
#2:	       ldiu	288 -> r2
	;;
#0:	       add	r15, r2 -> r2
	;;
#0:	       add	r2, 8 -> r1
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	if  c3 br @	.BB7_352        ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
.BB7_302:                               ; %bb317.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.f	r15, 308        ; vfprintf.c:1579[ sprintf.c:634 ]
#1:	       cmplt	r10, 0 -> c1
#2:	       ldi	0 -> r0
	;;
#0:	if !c1 sub	r0, r10 -> r0
	;;
#0:	       ldx	$mem, 0 -> r3   ; vfprintf.c:1579[ sprintf.c:634 ]
#1:	       ldm.f	r15, 320        ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       add	r3, r0 -> r0
	;;
#0:	       ldx	$mem, 0 -> r2   ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       sub	r0, r2 -> r0
	;;
#0:	       cmplt	r0, 1 -> c1     ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	if  c1 br @	.BB7_336
	;;
.BB7_303:                               ; %bb325.preheader.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#1:	       sub	r12, 1 -> r0
#0:	       sub	r0.26, 1 -> r4
	;;
#0:	       sub	r4, r0.25 -> r1
#1:	       sub	r0, r13 -> r0
	;;
#0:	       cmplt	r0, r1 -> c1
	;;
#0:	if  c1 sub	r4, r0.25 -> r0
	;;
#1:	       cmplt	r1.29, r0 -> c1
#0:	       add	r3, r0 -> r1
	;;
#0:	       br	.BB7_308
#1:	       sub	r1, r2 -> r2
#2:	       ldi	-1 -> r1
	;;
#0:	if  c1 or	r0, 0 -> r1
	;;
#0:	       sub	r2, r1 -> r10
	;;
.BB7_304:                               ; %bb320.i
                                        ;   in Loop: Header=BB7_308 Depth=2
#1:	       stm.a	r1.24, r0, 1    ; vfprintf.c:1579[ sprintf.c:634 ]
#0:	       ldiu	256 -> r2       ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r15, 304        ; vfprintf.c:1579[ sprintf.c:634 ]
#1:	       add	r15, r2 -> r2   ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       add	r0, 16 -> r0    ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       stm.a	r0, r2, 12      ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 52         ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1579[ sprintf.c:634 ]
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	if !c1 br @	.BB7_306
	;;
.BB7_305:                               ;   in Loop: Header=BB7_308 Depth=2
#0:	       ldm.s	r15, 60         ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       br	.BB7_307
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       add	r0, 8 -> r0     ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       stm.s	r0, r15, 15
	;;
.BB7_306:                               ; %bb321.i
                                        ;   in Loop: Header=BB7_308 Depth=2
#0:	       ldiu	224 -> r12
	;;
#0:	       add	r15, r12 -> r12
	;;
#0:	       callg	___ssprint_r    ; vfprintf.c:1579[ sprintf.c:634 ]
#1:	       add	r12, 8 -> r0
#2:	       s2add	r15, 16 -> r12
	;;
#0:	       stm.s	r0, r15, 15
#1:	       add	r12, 16 -> r0
#2:	       ldiu	288 -> r12
	;;
#0:	       add	r15, r12 -> r12
	;;
#0:	       add	r12, 8 -> r1
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	if  c3 br @	.BB7_352        ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
.BB7_307:                               ; %bb324.i
                                        ;   in Loop: Header=BB7_308 Depth=2
#0:	       sub	r10, 16 -> r10
	;;
.BB7_308:                               ; %bb325.i
                                        ;   Parent Loop BB7_15 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#1:	       cmplt	r1.24, r10 -> c1 ; vfprintf.c:1579[ sprintf.c:634 ]
#0:	       ldm.s	r15, 60         ; vfprintf.c:1579[ sprintf.c:634 ]
#2:	       ldga	_zeroes.3635 -> r1 ; vfprintf.c:1529[ sprintf.c:634 ]
	;;
#0:	if  c1 br	.BB7_304
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       stm.a	r1, r0, 0       ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
	       nop	0
	;;
.BB7_309:                               ; %bb326.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 60         ; vfprintf.c:1579[ sprintf.c:634 ]
#1:	       ldiu	256 -> r2       ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       add	r15, r2 -> r2   ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       stm.a	r10, r0, 1      ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r15, 304        ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       add	r0, r10 -> r0
	;;
#0:	       stm.a	r0, r2, 12      ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 52         ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1579[ sprintf.c:634 ]
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	if  c1 br @	.BB7_238
	;;
.BB7_310:                               ; %bb327.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldiu	224 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       callg	___ssprint_r    ; vfprintf.c:1579[ sprintf.c:634 ]
#1:	       add	r10, 8 -> r0
#2:	       s2add	r15, 16 -> r10
	;;
#0:	       stm.s	r0, r15, 15
#1:	       add	r10, 16 -> r0
#2:	       ldiu	288 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       add	r10, 8 -> r1
	;;
#0:	       cmpeq	r0, 0 -> c3     ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
#0:	if !c3 br @	.BB7_352        ; vfprintf.c:1579[ sprintf.c:634 ]
#1:	if  c3 br @	.BB7_336        ; vfprintf.c:1579[ sprintf.c:634 ]
	;;
.BB7_311:                               ; %bb330.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.f	r15, 308        ; vfprintf.c:1583[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1583[ sprintf.c:634 ]
	;;
#0:	       cmplt	r0.29, r0 -> c1 ; vfprintf.c:1583[ sprintf.c:634 ]
	;;
#0:	if !c1 ldm.s	r15, 68         ; vfprintf.c:1583[ sprintf.c:634 ]
	;;
#0:	if !c1 ldx	$mem, 0 -> r0   ; vfprintf.c:1583[ sprintf.c:634 ]
	;;
#0:	if !c1 btest	r0, 0 -> c1     ; vfprintf.c:1583[ sprintf.c:634 ]
	;;
#0:	if !c1 br @	.BB7_331
	;;
.BB7_312:                               ; %bb333.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 48         ; vfprintf.c:1584[ sprintf.c:634 ]
#1:	       ldiu	256 -> r2       ; vfprintf.c:1584[ sprintf.c:634 ]
	;;
#0:	       add	r15, r2 -> r2   ; vfprintf.c:1584[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1584[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 60         ; vfprintf.c:1584[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1584[ sprintf.c:634 ]
	;;
#0:	       stm.a	r1, r0, 0       ; vfprintf.c:1584[ sprintf.c:634 ]
	;;
#0:	       stm.a	1, r0, 1        ; vfprintf.c:1584[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r15, 304        ; vfprintf.c:1584[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1584[ sprintf.c:634 ]
	;;
#0:	       add	r0, 1 -> r0     ; vfprintf.c:1584[ sprintf.c:634 ]
	;;
#0:	       stm.a	r0, r2, 12      ; vfprintf.c:1584[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 52         ; vfprintf.c:1584[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1584[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1584[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1584[ sprintf.c:634 ]
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1584[ sprintf.c:634 ]
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1584[ sprintf.c:634 ]
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1584[ sprintf.c:634 ]
	;;
#0:	if !c1 br @	.BB7_314
	;;
.BB7_313:                               ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 60         ; vfprintf.c:1584[ sprintf.c:634 ]
#1:	       br	.BB7_315
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1584[ sprintf.c:634 ]
	;;
#0:	       add	r0, 8 -> r10    ; vfprintf.c:1584[ sprintf.c:634 ]
	;;
.BB7_314:                               ; %bb334.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldiu	224 -> r12
	;;
#0:	       add	r15, r12 -> r12
	;;
#0:	       callg	___ssprint_r    ; vfprintf.c:1584[ sprintf.c:634 ]
#1:	       add	r12, 8 -> r10
#2:	       s2add	r15, 16 -> r12
	;;
#0:	       add	r12, 16 -> r0
#1:	       ldiu	288 -> r12
	;;
#0:	       add	r15, r12 -> r12
	;;
#0:	       add	r12, 8 -> r1
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1584[ sprintf.c:634 ]
	;;
#0:	if  c3 br @	.BB7_352        ; vfprintf.c:1584[ sprintf.c:634 ]
	;;
.BB7_315:                               ; %bb337.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldga	._.str69 -> r0  ; vfprintf.c:1544[ sprintf.c:634 ]
#1:	       ldiu	256 -> r2       ; vfprintf.c:1586[ sprintf.c:634 ]
	;;
#0:	       stm.a	r0, r10, 0      ; vfprintf.c:1586[ sprintf.c:634 ]
#1:	       add	r15, r2 -> r2   ; vfprintf.c:1586[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 32         ; vfprintf.c:1586[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1586[ sprintf.c:634 ]
	;;
#0:	       stm.a	r0, r10, 1      ; vfprintf.c:1586[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r15, 304        ; vfprintf.c:1586[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1586[ sprintf.c:634 ]
	;;
#0:	       add	r1, r0 -> r0    ; vfprintf.c:1586[ sprintf.c:634 ]
	;;
#0:	       stm.a	r0, r2, 12      ; vfprintf.c:1586[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 48         ; vfprintf.c:1585[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1585[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 52         ; vfprintf.c:1586[ sprintf.c:634 ]
#1:	       add	r0, 1 -> r12    ; vfprintf.c:1585[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1586[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1586[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1586[ sprintf.c:634 ]
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1586[ sprintf.c:634 ]
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1586[ sprintf.c:634 ]
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1586[ sprintf.c:634 ]
	;;
#0:	if !c1 br @	.BB7_317
	;;
.BB7_316:                               ;   in Loop: Header=BB7_15 Depth=1
#0:	       add	r10, 8 -> r10   ; vfprintf.c:1586[ sprintf.c:634 ]
#1:	       br @	.BB7_318
	;;
.BB7_317:                               ; %bb338.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldiu	224 -> r13
	;;
#0:	       add	r15, r13 -> r13
	;;
#0:	       callg	___ssprint_r    ; vfprintf.c:1586[ sprintf.c:634 ]
#1:	       add	r13, 8 -> r10
#2:	       s2add	r15, 16 -> r13
	;;
#0:	       add	r13, 16 -> r0
#1:	       ldiu	288 -> r13
	;;
#0:	       add	r15, r13 -> r13
	;;
#0:	       add	r13, 8 -> r1
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1586[ sprintf.c:634 ]
	;;
#0:	if  c3 br @	.BB7_352        ; vfprintf.c:1586[ sprintf.c:634 ]
	;;
.BB7_318:                               ; %bb341.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       fop	dcmp	d5, d6 -> f0 ; vfprintf.c:1587[ sprintf.c:634 ]
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r0       ; vfprintf.c:1587[ sprintf.c:634 ]
	;;
#0:	       btest	r0, 0 -> c1     ; vfprintf.c:1587[ sprintf.c:634 ]
	;;
#0:	if  c1 br @	.BB7_322
	;;
.BB7_319:                               ; %bb342.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       stm.a	r12, r10, 0     ; vfprintf.c:1588[ sprintf.c:634 ]
#1:	       ldiu	256 -> r2       ; vfprintf.c:1588[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r15, 308        ; vfprintf.c:1588[ sprintf.c:634 ]
#1:	       add	r15, r2 -> r2   ; vfprintf.c:1588[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1588[ sprintf.c:634 ]
	;;
#0:	       sub	r0, 1 -> r0
	;;
#0:	       stm.a	r0, r10, 1      ; vfprintf.c:1588[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r15, 304        ; vfprintf.c:1588[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1588[ sprintf.c:634 ]
#1:	       ldm.f	r15, 308        ; vfprintf.c:1588[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1588[ sprintf.c:634 ]
	;;
#0:	       add	r1, r0 -> r0
	;;
#0:	       sub	r0, 1 -> r0     ; vfprintf.c:1588[ sprintf.c:634 ]
	;;
#0:	       stm.a	r0, r2, 12      ; vfprintf.c:1588[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 52         ; vfprintf.c:1588[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1588[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1588[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1588[ sprintf.c:634 ]
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1588[ sprintf.c:634 ]
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1588[ sprintf.c:634 ]
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1588[ sprintf.c:634 ]
	;;
#0:	if !c1 br @	.BB7_321
	;;
.BB7_320:                               ;   in Loop: Header=BB7_15 Depth=1
#0:	       add	r10, 8 -> r10   ; vfprintf.c:1588[ sprintf.c:634 ]
#1:	       br @	.BB7_334
	;;
.BB7_321:                               ; %bb343.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldiu	224 -> r12
	;;
#0:	       add	r15, r12 -> r12
	;;
#0:	       callg	___ssprint_r    ; vfprintf.c:1588[ sprintf.c:634 ]
#1:	       add	r12, 8 -> r10
#2:	       s2add	r15, 16 -> r12
	;;
#0:	       add	r12, 16 -> r0
#1:	       ldiu	288 -> r12
	;;
#0:	       add	r15, r12 -> r12
	;;
#0:	       add	r12, 8 -> r1
	;;
#0:	       brz eq @	r0, .BB7_334    ; vfprintf.c:1588[ sprintf.c:634 ]
	;;
#0:	       br @	.BB7_352        ; vfprintf.c:1588[ sprintf.c:634 ]
	;;
.BB7_322:                               ; %bb346.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.f	r15, 308        ; vfprintf.c:1591[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1591[ sprintf.c:634 ]
	;;
#0:	       sub	r0, 1 -> r12
	;;
#0:	       cmplt	r12, 1 -> c1    ; vfprintf.c:1591[ sprintf.c:634 ]
	;;
#0:	if  c1 br @	.BB7_334
#1:	if !c1 br @	.BB7_327
	;;
.BB7_323:                               ; %bb347.i
                                        ;   in Loop: Header=BB7_327 Depth=2
#1:	       stm.a	r1.24, r10, 1   ; vfprintf.c:1591[ sprintf.c:634 ]
#0:	       ldiu	256 -> r2       ; vfprintf.c:1591[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r15, 304        ; vfprintf.c:1591[ sprintf.c:634 ]
#1:	       add	r15, r2 -> r2   ; vfprintf.c:1591[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1591[ sprintf.c:634 ]
	;;
#0:	       add	r0, 16 -> r0    ; vfprintf.c:1591[ sprintf.c:634 ]
	;;
#0:	       stm.a	r0, r2, 12      ; vfprintf.c:1591[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 52         ; vfprintf.c:1591[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1591[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1591[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1591[ sprintf.c:634 ]
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1591[ sprintf.c:634 ]
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1591[ sprintf.c:634 ]
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1591[ sprintf.c:634 ]
	;;
#0:	if !c1 br @	.BB7_325
	;;
.BB7_324:                               ;   in Loop: Header=BB7_327 Depth=2
#0:	       add	r10, 8 -> r10   ; vfprintf.c:1591[ sprintf.c:634 ]
#1:	       br @	.BB7_326
	;;
.BB7_325:                               ; %bb348.i
                                        ;   in Loop: Header=BB7_327 Depth=2
#0:	       ldiu	224 -> r13
	;;
#0:	       add	r15, r13 -> r13
	;;
#0:	       callg	___ssprint_r    ; vfprintf.c:1591[ sprintf.c:634 ]
#1:	       add	r13, 8 -> r10
#2:	       s2add	r15, 16 -> r13
	;;
#0:	       add	r13, 16 -> r0
#1:	       ldiu	288 -> r13
	;;
#0:	       add	r15, r13 -> r13
	;;
#0:	       add	r13, 8 -> r1
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1591[ sprintf.c:634 ]
	;;
#0:	if  c3 br @	.BB7_352        ; vfprintf.c:1591[ sprintf.c:634 ]
	;;
.BB7_326:                               ; %bb351.i
                                        ;   in Loop: Header=BB7_327 Depth=2
#0:	       sub	r12, 16 -> r12
	;;
.BB7_327:                               ; %bb352.i
                                        ;   Parent Loop BB7_15 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#1:	       cmplt	r1.24, r12 -> c1 ; vfprintf.c:1591[ sprintf.c:634 ]
#0:	       ldga	_zeroes.3635 -> r0 ; vfprintf.c:1529[ sprintf.c:634 ]
	;;
#0:	if  c1 br @	.BB7_323
#1:	       stm.a	r0, r10, 0      ; vfprintf.c:1591[ sprintf.c:634 ]
	;;
.BB7_328:                               ; %bb353.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       stm.a	r12, r10, 1     ; vfprintf.c:1591[ sprintf.c:634 ]
#1:	       ldiu	256 -> r2       ; vfprintf.c:1591[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r15, 304        ; vfprintf.c:1591[ sprintf.c:634 ]
#1:	       add	r15, r2 -> r2   ; vfprintf.c:1591[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1591[ sprintf.c:634 ]
	;;
#0:	       add	r0, r12 -> r0
	;;
#0:	       stm.a	r0, r2, 12      ; vfprintf.c:1591[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 52         ; vfprintf.c:1591[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1591[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1591[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1591[ sprintf.c:634 ]
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1591[ sprintf.c:634 ]
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1591[ sprintf.c:634 ]
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1591[ sprintf.c:634 ]
	;;
#0:	if !c1 br @	.BB7_330
	;;
.BB7_329:                               ;   in Loop: Header=BB7_15 Depth=1
#0:	       add	r10, 8 -> r10   ; vfprintf.c:1591[ sprintf.c:634 ]
#1:	       br @	.BB7_334
	;;
.BB7_330:                               ; %bb354.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldiu	224 -> r12
	;;
#0:	       add	r15, r12 -> r12
	;;
#0:	       callg	___ssprint_r    ; vfprintf.c:1591[ sprintf.c:634 ]
#1:	       add	r12, 8 -> r10
#2:	       s2add	r15, 16 -> r12
	;;
#0:	       add	r12, 16 -> r0
#1:	       ldiu	288 -> r12
	;;
#0:	       add	r15, r12 -> r12
	;;
#0:	       add	r12, 8 -> r1
	;;
#0:	       brz eq @	r0, .BB7_334    ; vfprintf.c:1591[ sprintf.c:634 ]
	;;
#0:	       br @	.BB7_352        ; vfprintf.c:1591[ sprintf.c:634 ]
	;;
.BB7_331:                               ; %bb357.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 48         ; vfprintf.c:1593[ sprintf.c:634 ]
#1:	       ldiu	256 -> r2       ; vfprintf.c:1593[ sprintf.c:634 ]
	;;
#0:	       add	r15, r2 -> r2   ; vfprintf.c:1593[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1593[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 60         ; vfprintf.c:1593[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1593[ sprintf.c:634 ]
	;;
#0:	       stm.a	r1, r0, 0       ; vfprintf.c:1593[ sprintf.c:634 ]
	;;
#0:	       stm.a	1, r0, 1        ; vfprintf.c:1593[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r15, 304        ; vfprintf.c:1593[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1593[ sprintf.c:634 ]
	;;
#0:	       add	r0, 1 -> r0     ; vfprintf.c:1593[ sprintf.c:634 ]
	;;
#0:	       stm.a	r0, r2, 12      ; vfprintf.c:1593[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 52         ; vfprintf.c:1593[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1593[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1593[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1593[ sprintf.c:634 ]
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1593[ sprintf.c:634 ]
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1593[ sprintf.c:634 ]
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1593[ sprintf.c:634 ]
	;;
#0:	if !c1 br @	.BB7_333
	;;
.BB7_332:                               ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 60         ; vfprintf.c:1593[ sprintf.c:634 ]
#1:	       br	.BB7_334
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1593[ sprintf.c:634 ]
	;;
#0:	       add	r0, 8 -> r10    ; vfprintf.c:1593[ sprintf.c:634 ]
	;;
.BB7_333:                               ; %bb358.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldiu	224 -> r12
	;;
#0:	       add	r15, r12 -> r12
	;;
#0:	       callg	___ssprint_r    ; vfprintf.c:1593[ sprintf.c:634 ]
#1:	       add	r12, 8 -> r10
#2:	       s2add	r15, 16 -> r12
	;;
#0:	       add	r12, 16 -> r0
#1:	       ldiu	288 -> r12
	;;
#0:	       add	r15, r12 -> r12
	;;
#0:	       add	r12, 8 -> r1
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1593[ sprintf.c:634 ]
	;;
#0:	if  c3 br @	.BB7_352        ; vfprintf.c:1593[ sprintf.c:634 ]
	;;
.BB7_334:                               ; %bb361.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 28         ; vfprintf.c:1594[ sprintf.c:634 ]
#1:	       ldiu	256 -> r2       ; vfprintf.c:1594[ sprintf.c:634 ]
	;;
#0:	       add	r15, r2 -> r2   ; vfprintf.c:1594[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1594[ sprintf.c:634 ]
	;;
#0:	       stm.a	r0, r10, 0      ; vfprintf.c:1594[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 24         ; vfprintf.c:1594[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1594[ sprintf.c:634 ]
	;;
#0:	       stm.a	r0, r10, 1      ; vfprintf.c:1594[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r15, 304        ; vfprintf.c:1594[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1594[ sprintf.c:634 ]
	;;
#0:	       add	r1, r0 -> r0    ; vfprintf.c:1594[ sprintf.c:634 ]
	;;
#0:	       stm.a	r0, r2, 12      ; vfprintf.c:1594[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 52         ; vfprintf.c:1594[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1594[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1594[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1594[ sprintf.c:634 ]
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1594[ sprintf.c:634 ]
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1594[ sprintf.c:634 ]
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1594[ sprintf.c:634 ]
	;;
#0:	if  c1 br @	.BB7_278
	;;
.BB7_335:                               ; %bb363.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldiu	224 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       callg	___ssprint_r    ; vfprintf.c:1594[ sprintf.c:634 ]
#1:	       add	r10, 8 -> r0
#2:	       s2add	r15, 16 -> r10
	;;
#0:	       stm.s	r0, r15, 15
#1:	       add	r10, 16 -> r0
#2:	       ldiu	288 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       add	r10, 8 -> r1
	;;
#0:	       brz ne @	r0, .BB7_352    ; vfprintf.c:1594[ sprintf.c:634 ]
	;;
.BB7_336:                               ; %bb366.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1601[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1601[ sprintf.c:634 ]
	;;
#0:	       btest	r0, 2 -> c1     ; vfprintf.c:1601[ sprintf.c:634 ]
	;;
#0:	if !c1 br @	.BB7_345
	;;
.BB7_337:                               ; %bb367.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 64         ; vfprintf.c:1602[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1602[ sprintf.c:634 ]
	;;
#0:	       sub	r0, r14 -> r10  ; vfprintf.c:1602[ sprintf.c:634 ]
	;;
#0:	       cmplt	r10, 1 -> c1    ; vfprintf.c:1602[ sprintf.c:634 ]
	;;
#0:	if  c1 br @	.BB7_345
#1:	if !c1 br @	.BB7_342
	;;
.BB7_338:                               ; %bb368.i
                                        ;   in Loop: Header=BB7_342 Depth=2
#1:	       stm.a	r1.24, r0, 1    ; vfprintf.c:1602[ sprintf.c:634 ]
#0:	       ldiu	256 -> r2       ; vfprintf.c:1602[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r15, 304        ; vfprintf.c:1602[ sprintf.c:634 ]
#1:	       add	r15, r2 -> r2   ; vfprintf.c:1602[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1602[ sprintf.c:634 ]
	;;
#0:	       add	r0, 16 -> r0    ; vfprintf.c:1602[ sprintf.c:634 ]
	;;
#0:	       stm.a	r0, r2, 12      ; vfprintf.c:1602[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 52         ; vfprintf.c:1602[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1602[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1602[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1602[ sprintf.c:634 ]
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1602[ sprintf.c:634 ]
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1602[ sprintf.c:634 ]
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1602[ sprintf.c:634 ]
	;;
#0:	if !c1 br @	.BB7_340
	;;
.BB7_339:                               ;   in Loop: Header=BB7_342 Depth=2
#0:	       ldm.s	r15, 60         ; vfprintf.c:1602[ sprintf.c:634 ]
	;;
#0:	       br	.BB7_341
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1602[ sprintf.c:634 ]
	;;
#0:	       add	r0, 8 -> r0     ; vfprintf.c:1602[ sprintf.c:634 ]
	;;
#0:	       stm.s	r0, r15, 15
	;;
.BB7_340:                               ; %bb369.i
                                        ;   in Loop: Header=BB7_342 Depth=2
#0:	       ldiu	224 -> r12
	;;
#0:	       add	r15, r12 -> r12
	;;
#0:	       callg	___ssprint_r    ; vfprintf.c:1602[ sprintf.c:634 ]
#1:	       add	r12, 8 -> r0
#2:	       s2add	r15, 16 -> r12
	;;
#0:	       stm.s	r0, r15, 15
#1:	       add	r12, 16 -> r0
#2:	       ldiu	288 -> r12
	;;
#0:	       add	r15, r12 -> r12
	;;
#0:	       add	r12, 8 -> r1
	;;
#0:	       brz ne @	r0, .BB7_352    ; vfprintf.c:1602[ sprintf.c:634 ]
	;;
.BB7_341:                               ; %bb372.i
                                        ;   in Loop: Header=BB7_342 Depth=2
#0:	       sub	r10, 16 -> r10
	;;
.BB7_342:                               ; %bb373.i
                                        ;   Parent Loop BB7_15 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#1:	       cmplt	r1.24, r10 -> c1 ; vfprintf.c:1602[ sprintf.c:634 ]
#0:	       ldm.s	r15, 60         ; vfprintf.c:1602[ sprintf.c:634 ]
#2:	       ldga	_blanks.3634 -> r1 ; vfprintf.c:1519[ sprintf.c:634 ]
	;;
#0:	if  c1 br	.BB7_338
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1602[ sprintf.c:634 ]
	;;
#0:	       stm.a	r1, r0, 0       ; vfprintf.c:1602[ sprintf.c:634 ]
	;;
	       nop	0
	;;
.BB7_343:                               ; %bb374.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 60         ; vfprintf.c:1602[ sprintf.c:634 ]
#1:	       ldiu	256 -> r2       ; vfprintf.c:1602[ sprintf.c:634 ]
	;;
#0:	       add	r15, r2 -> r2   ; vfprintf.c:1602[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1602[ sprintf.c:634 ]
	;;
#0:	       stm.a	r10, r0, 1      ; vfprintf.c:1602[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r15, 304        ; vfprintf.c:1602[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1602[ sprintf.c:634 ]
	;;
#0:	       add	r0, r10 -> r0
	;;
#0:	       stm.a	r0, r2, 12      ; vfprintf.c:1602[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 52         ; vfprintf.c:1602[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1602[ sprintf.c:634 ]
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1602[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1602[ sprintf.c:634 ]
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1602[ sprintf.c:634 ]
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1602[ sprintf.c:634 ]
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1602[ sprintf.c:634 ]
	;;
#0:	if  c1 br @	.BB7_345
	;;
.BB7_344:                               ; %bb375.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       s2add	r15, 16 -> r10
#1:	       callg	___ssprint_r    ; vfprintf.c:1602[ sprintf.c:634 ]
	;;
#0:	       add	r10, 16 -> r0
#1:	       ldiu	288 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       add	r10, 8 -> r1
	;;
#0:	       brz ne @	r0, .BB7_352    ; vfprintf.c:1602[ sprintf.c:634 ]
	;;
.BB7_345:                               ; %bb378.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.f	r15, 304        ; vfprintf.c:1607[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1607[ sprintf.c:634 ]
	;;
#0:	       brz eq @	r0, .BB7_347    ; vfprintf.c:1607[ sprintf.c:634 ]
	;;
.BB7_346:                               ; %bb381.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       s2add	r15, 16 -> r10
#1:	       callg	___ssprint_r    ; vfprintf.c:1607[ sprintf.c:634 ]
	;;
#0:	       add	r10, 16 -> r0
#1:	       ldiu	288 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       add	r10, 8 -> r1
	;;
#0:	       brz ne @	r0, .BB7_352    ; vfprintf.c:1607[ sprintf.c:634 ]
	;;
.BB7_347:                               ; %bb382.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.s	r15, 64         ; vfprintf.c:1605[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1605[ sprintf.c:634 ]
	;;
#0:	       ldm.s	r15, 44         ; vfprintf.c:1605[ sprintf.c:634 ]
#1:	       cmple	r0, r14 -> c1   ; vfprintf.c:1605[ sprintf.c:634 ]
	;;
#1:	if  c1 or	r14, 0 -> r0    ; vfprintf.c:1605[ sprintf.c:634 ]
#0:	       or	r0.24, 0 -> r14
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1605[ sprintf.c:634 ]
	;;
#0:	       add	r0, r1 -> r1    ; vfprintf.c:1605[ sprintf.c:634 ]
	;;
#0:	       stm.s	r1, r15, 11     ; vfprintf.c:1607[ sprintf.c:634 ]
#1:	       or	r11, 0 -> r1
	;;
#0:	       br	.BB7_15
#1:	       ldm.s	r15, 52         ; vfprintf.c:1607[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1607[ sprintf.c:634 ]
	;;
#0:	       stm.a	0, r0, 0        ; vfprintf.c:1607[ sprintf.c:634 ]
	;;
.BB7_348:                               ; %bb160.i
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       s2add	r10, 12 -> r0   ; vfprintf.c:1425[ sprintf.c:634 ]
#1:	       br @	.BB7_195
	;;
.BB7_349:                               ; %done.i
#0:	       ldm.f	r15, 304        ; vfprintf.c:1615[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1615[ sprintf.c:634 ]
	;;
#0:	       brz eq @	r0, .BB7_351    ; vfprintf.c:1615[ sprintf.c:634 ]
	;;
.BB7_350:                               ; %bb385.i
#0:	       s2add	r15, 16 -> r10
#1:	       callg	___ssprint_r    ; vfprintf.c:1615[ sprintf.c:634 ]
	;;
#0:	       add	r10, 16 -> r0
#1:	       ldiu	288 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       add	r10, 8 -> r1
	;;
#0:	       brz ne @	r0, .BB7_352    ; vfprintf.c:1615[ sprintf.c:634 ]
	;;
.BB7_351:                               ; %bb386.i
#0:	       ldm.s	r15, 52         ; vfprintf.c:1615[ sprintf.c:634 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1615[ sprintf.c:634 ]
	;;
#0:	       stm.a	0, r0, 0        ; vfprintf.c:1615[ sprintf.c:634 ]
	;;
.BB7_352:                               ; %_svfprintf_r.exit
#0:	       ldm.f	r15, 80         ; sprintf.c:636
	;;
#0:	       ldx	$mem, 0 -> r0   ; sprintf.c:636
	;;
#0:	       stmb.a	0, r0, 0        ; sprintf.c:636
	;;
#0:	       ldm.s	r15, 340
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       stx	r0 -> $ro
	;;
#0:	       ldm.s	r15, 344
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       stx	r0 -> $rb
	;;
#0:	       ldm.s	r15, 348
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       stx	r0 -> $f13
	;;
#0:	       ldm.s	r15, 352
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       stx	r0 -> $f12
	;;
#0:	       ldm.s	r15, 356
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       stx	r0 -> $f11
	;;
#0:	       ldm.s	r15, 360
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       stx	r0 -> $f10
#1:	       ldiu	512 -> r0
	;;
#0:	       ldm.s	r15, 364
	;;
#0:	       ldx	$mem, 0 -> r0.30
	;;
#0:	       ldm.s	r15, 368
	;;
#1:	       ldx	$mem, 0 -> r1.29
	;;
#0:	       ldm.s	r15, 372
	;;
#0:	       ldx	$mem, 0 -> r0.29
	;;
#0:	       ldm.s	r15, 376
	;;
#3:	       ldx	$mem, 0 -> r3.28
	;;
#0:	       ldm.s	r15, 380
	;;
#1:	       ldx	$mem, 0 -> r1.28
	;;
#0:	       ldm.s	r15, 384
	;;
#0:	       ldx	$mem, 0 -> r0.28
	;;
#0:	       ldm.s	r15, 388
	;;
#3:	       ldx	$mem, 0 -> r3.27
	;;
#0:	       ldm.s	r15, 392
	;;
#1:	       ldx	$mem, 0 -> r1.27
	;;
#0:	       ldm.s	r15, 396
	;;
#0:	       ldx	$mem, 0 -> r0.27
	;;
#0:	       ldm.s	r15, 400
	;;
#3:	       ldx	$mem, 0 -> r3.26
	;;
#0:	       ldm.s	r15, 404
	;;
#1:	       ldx	$mem, 0 -> r1.26
	;;
#0:	       ldm.s	r15, 408
	;;
#0:	       ldx	$mem, 0 -> r0.26
	;;
#0:	       ldm.s	r15, 412
	;;
#3:	       ldx	$mem, 0 -> r3.25
	;;
#0:	       ldm.s	r15, 416
	;;
#2:	       ldx	$mem, 0 -> r2.25
	;;
#0:	       ldm.s	r15, 420
	;;
#1:	       ldx	$mem, 0 -> r1.25
	;;
#0:	       ldm.s	r15, 424
	;;
#0:	       ldx	$mem, 0 -> r0.25
	;;
#0:	       ldm.s	r15, 428
	;;
#3:	       ldx	$mem, 0 -> r3.24
	;;
#0:	       ldm.s	r15, 432
	;;
#2:	       ldx	$mem, 0 -> r2.24
	;;
#0:	       ldm.s	r15, 436
	;;
#1:	       ldx	$mem, 0 -> r1.24
	;;
#0:	       ldm.s	r15, 440
	;;
#0:	       ldx	$mem, 0 -> r0.24
	;;
#0:	       ldm.s	r15, 444
	;;
#3:	       ldx	$mem, 0 -> r3.23
	;;
#0:	       ldm.s	r15, 448
	;;
#2:	       ldx	$mem, 0 -> r2.23
	;;
#0:	       ldm.s	r15, 452
	;;
#1:	       ldx	$mem, 0 -> r1.23
	;;
#0:	       ldm.s	r15, 456
	;;
#0:	       ldx	$mem, 0 -> r0.23
	;;
#0:	       ldm.s	r15, 460
	;;
#0:	       ldx	$mem, 0 -> r14
	;;
#0:	       ldm.s	r15, 464
	;;
#0:	       ldx	$mem, 0 -> r13
	;;
#0:	       ldm.s	r15, 468
	;;
#0:	       ldx	$mem, 0 -> r12
	;;
#0:	       ldm.s	r15, 472
	;;
#0:	       ldx	$mem, 0 -> r11
	;;
#0:	       ldm.s	r15, 476
#1:	       add	r15, r0 -> r15
	;;
#0:	       jop	ret
#1:	       ldx	$mem, 0 -> r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
_sprintf_end:
	.section	.rodata,"a",@progbits
	.align	4
.JTI7_0:
	.long	.BB7_47-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_49-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_50-_sprintf_start
	.long	.BB7_53-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_52-_sprintf_start
	.long	.BB7_37-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_56-_sprintf_start
	.long	.BB7_35-_sprintf_start
	.long	.BB7_35-_sprintf_start
	.long	.BB7_35-_sprintf_start
	.long	.BB7_35-_sprintf_start
	.long	.BB7_35-_sprintf_start
	.long	.BB7_35-_sprintf_start
	.long	.BB7_35-_sprintf_start
	.long	.BB7_35-_sprintf_start
	.long	.BB7_35-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_61-_sprintf_start
	.long	.BB7_67-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_67-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_58-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_124-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_158-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_164-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_60-_sprintf_start
	.long	.BB7_62-_sprintf_start
	.long	.BB7_67-_sprintf_start
	.long	.BB7_67-_sprintf_start
	.long	.BB7_67-_sprintf_start
	.long	.BB7_59-_sprintf_start
	.long	.BB7_62-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_32-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_16-_sprintf_start
	.long	.BB7_125-_sprintf_start
	.long	.BB7_129-_sprintf_start
	.long	.BB7_32-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_130-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_159-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_198-_sprintf_start
	.long	.BB7_163-_sprintf_start

	.text
	.align	4
___sfvwrite_r:                          ; @__sfvwrite_r
	.size	___sfvwrite_r_end-___sfvwrite_r
___sfvwrite_r_start:
; BB#0:                                 ; %entry
#0:	       ldiu	96 -> r2
#1:	       wb.s	r15, 24
	;;
#0:	       sub	r15, r2 -> r15
#1:	       ldx	$rb, 0 -> r2
	;;
#0:	       stm.s	r10, r15, 19
	;;
#0:	       stm.s	r11, r15, 18
	;;
#0:	       stm.s	r12, r15, 17
#1:	       or	r0, 0 -> r12
	;;
#0:	       stm.s	r13, r15, 16
	;;
#0:	       stm.s	r14, r15, 15
	;;
#0:	       stm.s	r0.23, r15, 14
	;;
#1:	       stm.s	r1.23, r15, 13
	;;
#2:	       stm.s	r2.23, r15, 12
	;;
#3:	       stm.s	r3.23, r15, 11
	;;
#0:	       stm.s	r0.24, r15, 10
#3:	       or	r1, 0 -> r3.23
	;;
#1:	       stm.s	r1.24, r15, 9
	;;
#2:	       stm.s	r2.24, r15, 8
	;;
#3:	       stm.s	r3.24, r15, 7
	;;
#2:	       stm.s	r2.25, r15, 6
	;;
#3:	       stm.s	r3.25, r15, 5
	;;
#3:	       stm.s	r3.26, r15, 4
	;;
#0:	       stm.s	r2, r15, 3
#1:	       ldx	$ro, 0 -> r2
	;;
#0:	       stm.s	r2, r15, 2
	;;
#3:	       ldm.f	r3.23, 8        ; fvwrite.c:59
	;;
#0:	       ldx	$mem, 0 -> r0   ; fvwrite.c:59
	;;
#0:	       cmpeq	r0, 0 -> c3     ; fvwrite.c:59
	;;
#0:	if  c3 br @	.BB8_64         ; fvwrite.c:59
	;;
.BB8_1:                                 ; %bb1
#0:	       ldm.f	r12, 12         ; fvwrite.c:63
#1:	       add	r12, 12 -> r10  ; fvwrite.c:63
	;;
#0:	       ldx	$memhu, r10 -> r1 ; fvwrite.c:63
	;;
#0:	       btest	r1, 3 -> c1     ; fvwrite.c:63
	;;
#0:	if !c1 br @	.BB8_3
	;;
.BB8_2:                                 ; %bb2
#0:	       ldm.f	r12, 16         ; fvwrite.c:63
	;;
#0:	       ldx	$mem, 0 -> r0   ; fvwrite.c:63
	;;
#0:	       brz ne @	r0, .BB8_7      ; fvwrite.c:63
	;;
.BB8_3:                                 ; %bb3
#0:	       or	r12, 0 -> r0    ; fvwrite.c:63
#1:	       callg	___swsetup_r    ; fvwrite.c:63
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz eq	r0, .BB8_7      ; fvwrite.c:63
#1:	       ldm.f	r12, 12
	;;
#0:	       ldx	$memhu, r10 -> r1
	;;
	       nop	0
	;;
.BB8_4:                                 ; %bb4
#0:	       ldi	64 -> r0
	;;
#0:	       or	r1, r0 -> r1    ; fvwrite.c:65
#1:	       ldga	_impure_data -> r0 ; fvwrite.c:66
	;;
#0:	       stmh.a	r1, r12, 6      ; fvwrite.c:65
	;;
#0:	       stm.a	9, r0, 0        ; fvwrite.c:66
	;;
.BB8_5:                                 ; %bb4
#0:	       ldi	-1 -> r0
	;;
.BB8_6:                                 ; %bb4
#0:	       ldm.s	r15, 8          ; fvwrite.c:270
	;;
#0:	       ldx	$mem, 0 -> r1   ; fvwrite.c:270
	;;
#0:	       stx	r1 -> $ro       ; fvwrite.c:270
	;;
#0:	       ldm.s	r15, 12         ; fvwrite.c:270
	;;
#0:	       ldx	$mem, 0 -> r1   ; fvwrite.c:270
	;;
#0:	       stx	r1 -> $rb       ; fvwrite.c:270
	;;
#0:	       ldm.s	r15, 16         ; fvwrite.c:270
	;;
#3:	       ldx	$mem, 0 -> r3.26 ; fvwrite.c:270
	;;
#0:	       ldm.s	r15, 20         ; fvwrite.c:270
	;;
#3:	       ldx	$mem, 0 -> r3.25 ; fvwrite.c:270
	;;
#0:	       ldm.s	r15, 24         ; fvwrite.c:270
	;;
#2:	       ldx	$mem, 0 -> r2.25 ; fvwrite.c:270
	;;
#0:	       ldm.s	r15, 28         ; fvwrite.c:270
	;;
#3:	       ldx	$mem, 0 -> r3.24 ; fvwrite.c:270
	;;
#0:	       ldm.s	r15, 32         ; fvwrite.c:270
	;;
#2:	       ldx	$mem, 0 -> r2.24 ; fvwrite.c:270
	;;
#0:	       ldm.s	r15, 36         ; fvwrite.c:270
	;;
#1:	       ldx	$mem, 0 -> r1.24 ; fvwrite.c:270
	;;
#0:	       ldm.s	r15, 40         ; fvwrite.c:270
	;;
#0:	       ldx	$mem, 0 -> r0.24 ; fvwrite.c:270
	;;
#0:	       ldm.s	r15, 44         ; fvwrite.c:270
	;;
#3:	       ldx	$mem, 0 -> r3.23 ; fvwrite.c:270
	;;
#0:	       ldm.s	r15, 48         ; fvwrite.c:270
	;;
#2:	       ldx	$mem, 0 -> r2.23 ; fvwrite.c:270
	;;
#0:	       ldm.s	r15, 52         ; fvwrite.c:270
	;;
#1:	       ldx	$mem, 0 -> r1.23 ; fvwrite.c:270
	;;
#0:	       ldm.s	r15, 56         ; fvwrite.c:270
	;;
#0:	       ldx	$mem, 0 -> r0.23 ; fvwrite.c:270
	;;
#0:	       ldm.s	r15, 60         ; fvwrite.c:270
	;;
#0:	       ldx	$mem, 0 -> r14  ; fvwrite.c:270
	;;
#0:	       ldm.s	r15, 64         ; fvwrite.c:270
	;;
#0:	       ldx	$mem, 0 -> r13  ; fvwrite.c:270
	;;
#0:	       ldm.s	r15, 68         ; fvwrite.c:270
	;;
#0:	       ldx	$mem, 0 -> r12  ; fvwrite.c:270
	;;
#0:	       ldm.s	r15, 72         ; fvwrite.c:270
	;;
#0:	       ldx	$mem, 0 -> r11  ; fvwrite.c:270
	;;
#0:	       ldm.s	r15, 76         ; fvwrite.c:270
#1:	       s2add	r15, 24 -> r15  ; fvwrite.c:270
	;;
#0:	       jop	ret             ; fvwrite.c:270
#1:	       ldx	$mem, 0 -> r10  ; fvwrite.c:270
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB8_7:                                 ; %bb5
#0:	       btest	r1, 1 -> c1     ; fvwrite.c:93
	;;
#0:	if !c1 br	.BB8_13
#3:	       ldm.f	r3.23, 0        ; fvwrite.c:70
	;;
#0:	       ldx	$mem, 0 -> r2   ; fvwrite.c:70
	;;
	       nop	0
	;;
.BB8_8:                                 ; %bb7.preheader
#2:	       ldi	0 -> r2.23
#0:	       br	.BB8_10
#1:	       add	r2, 4 -> r13
#3:	       ldiu	1024 -> r14
	;;
#2:	       or	r2.23, 0 -> r11
	;;
	       nop	0
	;;
.BB8_9:                                 ; %bb6
                                        ;   in Loop: Header=BB8_10 Depth=1
#0:	       ldm.f	r13, -4         ; fvwrite.c:100
	;;
#2:	       ldx	$mem, 0 -> r2.23 ; fvwrite.c:100
#0:	       ldm.f	r13, 0          ; fvwrite.c:100
#1:	       add	r13, 8 -> r13
	;;
#0:	       ldx	$mem, 0 -> r11  ; fvwrite.c:100
	;;
.BB8_10:                                ; %bb7
                                        ; =>This Inner Loop Header: Depth=1
#0:	       brz eq @	r11, .BB8_9     ; fvwrite.c:100
	;;
.BB8_11:                                ; %bb8
                                        ;   in Loop: Header=BB8_10 Depth=1
#0:	       ldm.f	r12, 36         ; fvwrite.c:101
#1:	       cmpult	r14, r11 -> c1
#2:	       or	r11, 0 -> r3    ; fvwrite.c:101
#3:	       ldga	_impure_data -> r0 ; fvwrite.c:101
	;;
#0:	if  c1 or	r14, 0 -> r3    ; fvwrite.c:101
#2:	       or	r2.23, 0 -> r2  ; fvwrite.c:101
	;;
#0:	       ldx	$mem, 0 -> r4   ; fvwrite.c:101
#1:	       ldm.f	r12, 28         ; fvwrite.c:101
	;;
#0:	       ldx	$mem, 0 -> r1   ; fvwrite.c:101
	;;
#0:	       jop	call	r4      ; fvwrite.c:101
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       cmplt	r0, 1 -> c1
	;;
#0:	if  c1 br @	.BB8_59
	;;
.BB8_12:                                ; %bb10
                                        ;   in Loop: Header=BB8_10 Depth=1
#3:	       ldm.f	r3.23, 8        ; fvwrite.c:107
#2:	       add	r2.23, r0 -> r2.23 ; fvwrite.c:104
#0:	       sub	r11, r0 -> r11  ; fvwrite.c:105
	;;
#0:	       ldx	$mem, 0 -> r2   ; fvwrite.c:107
	;;
#0:	       cmpeq	r2, r0 -> c1
#1:	       sub	r2, r0 -> r1    ; fvwrite.c:107
	;;
#0:	if  c1 br @	.BB8_64
#1:	if !c1 br @	.BB8_10
#3:	       stm.a	r1, r3.23, 2    ; fvwrite.c:107
	;;
.BB8_13:                                ; %bb11
#0:	       bbh	zext16 r1 -> r0
	;;
#0:	       btest	r0, 0 -> c1     ; fvwrite.c:109
	;;
#0:	if  c1 br @	.BB8_15
	;;
.BB8_14:                                ; %bb13.preheader
#2:	       ldiu	895 -> r2.23
#3:	       br	.BB8_17
#0:	       ldi	0 -> r0.23
#1:	       ldi	128 -> r1.23
	;;
#0:	       add	r2, 4 -> r0.24
#2:	       ldiu	1152 -> r2.24
	;;
#2:	       ldim	31 -> r2.23
#0:	       or	r0.23, 0 -> r14
	;;
.BB8_15:                                ; %bb38.preheader
#3:	       ldiu	522 -> r3.25
#1:	       ldiu	1791 -> r1.23
#0:	       ldga	32896 -> r0
	;;
#2:	       ldi	0 -> r2.23
#3:	       ldim	321 -> r3.25
#1:	       ldim	991 -> r1.23
#0:	       ldih	1028 -> r0
	;;
#0:	       br	.BB8_37
#3:	       add	r2, 4 -> r3.24
#2:	       ldi	3 -> r2.24
#1:	       stm.s	r0, r15, 1
	;;
#3:	       ldih	80 -> r3.25
#1:	       ldih	2039 -> r1.23
#2:	       or	r2.23, 0 -> r14
	;;
#2:	       or	r2.23, 0 -> r2.25
	;;
.BB8_16:                                ; %bb12
                                        ;   in Loop: Header=BB8_17 Depth=1
#0:	       ldm.f	r0.24, -4       ; fvwrite.c:126
	;;
#0:	       ldx	$mem, 0 -> r0.23 ; fvwrite.c:126
	;;
#0:	       ldm.f	r0.24, 0        ; fvwrite.c:126
	;;
#0:	       add	r0.24, 8 -> r0.24
	;;
#0:	       ldx	$mem, 0 -> r14  ; fvwrite.c:126
	;;
.BB8_17:                                ; %bb13
                                        ; =>This Inner Loop Header: Depth=1
#0:	       brz eq @	r14, .BB8_16    ; fvwrite.c:126
	;;
.BB8_18:                                ; %bb14
                                        ;   in Loop: Header=BB8_17 Depth=1
#0:	       ldm.f	r12, 12
	;;
#0:	       ldx	$memhu, r10 -> r4
#1:	       ldm.f	r12, 8          ; fvwrite.c:127
	;;
#0:	       btest	r4, 9 -> c1     ; fvwrite.c:128
	;;
#0:	if !c1 br @	.BB8_29
#1:	       ldx	$mem, 0 -> r11  ; fvwrite.c:127
	;;
.BB8_19:                                ; %bb15
                                        ;   in Loop: Header=BB8_17 Depth=1
#0:	       cmpult	r14, r11 -> c1  ; fvwrite.c:130
	;;
#0:	if  c1 br @	.BB8_28
	;;
.BB8_20:                                ; %bb16
                                        ;   in Loop: Header=BB8_17 Depth=1
#2:	       and	r4, r2.24 -> r0 ; fvwrite.c:130
	;;
#0:	       brz eq @	r0, .BB8_28     ; fvwrite.c:130
	;;
.BB8_21:                                ; %bb17
                                        ;   in Loop: Header=BB8_17 Depth=1
#0:	       ldm.f	r12, 20         ; fvwrite.c:141
	;;
#0:	       ldx	$mem, 0 -> r2   ; fvwrite.c:141
#1:	       ldm.f	r12, 16         ; fvwrite.c:133
	;;
#0:	       mul	r2, 3 -> $mul0.0 ; fvwrite.c:141
	;;
#0:	       ldx	$mem, 0 -> r0   ; fvwrite.c:133
#1:	       ldm.f	r12, 0          ; fvwrite.c:133
	;;
#0:	       ldx	$mem, 0 -> r1   ; fvwrite.c:133
	;;
#1:	       sub	r1, r0 -> r13   ; fvwrite.c:133
#0:	       ldx	$mul0.0, 0 -> r1 ; fvwrite.c:141
	;;
#0:	       sr	r1, 31 -> r1    ; fvwrite.c:141
#1:	       add	r14, r13 -> r3  ; fvwrite.c:142
	;;
#0:	       ldx	$mul0.0, r1 -> r1 ; fvwrite.c:141
#1:	       add	r3, 1 -> r2     ; fvwrite.c:142
	;;
#0:	       sra	r1, 1 -> r11    ; fvwrite.c:141
	;;
#0:	       cmpult	r11, r2 -> c1   ; fvwrite.c:142
	;;
#0:	if  c1 add	r3, 1 -> r11
#1:	       btest	r4, 10 -> c1    ; fvwrite.c:144
	;;
#0:	if !c1 br @	.BB8_24
	;;
.BB8_22:                                ; %bb20
                                        ;   in Loop: Header=BB8_17 Depth=1
#0:	       or	r11, 0 -> r0    ; fvwrite.c:147
#1:	       callg	__malloc_r      ; fvwrite.c:147
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz ne @	r0, .BB8_26     ; fvwrite.c:148
	;;
.BB8_23:                                ; %bb21
#0:	       ldga	_impure_data -> r0 ; fvwrite.c:150
#1:	       br	.BB8_59
	;;
#0:	       stm.a	12, r0, 0       ; fvwrite.c:150
	;;
	       nop	0
	;;
.BB8_24:                                ; %bb23
                                        ;   in Loop: Header=BB8_17 Depth=1
#0:	       or	r11, 0 -> r1    ; fvwrite.c:158
#1:	       callg	__realloc_r     ; fvwrite.c:158
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz ne @	r0, .BB8_27     ; fvwrite.c:160
	;;
.BB8_25:                                ; %bb24
#0:	       ldm.f	r12, 16         ; fvwrite.c:163
	;;
#0:	       callg	__free_r        ; fvwrite.c:163
#1:	       ldx	$mem, 0 -> r0   ; fvwrite.c:163
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       br @	.BB8_23
	;;
.BB8_26:                                ; %bb22
                                        ;   in Loop: Header=BB8_17 Depth=1
#0:	       ldm.f	r12, 16         ; fvwrite.c:153
#2:	       or	r13, 0 -> r2    ; fvwrite.c:153
#1:	       or	r0, 0 -> r1.24  ; fvwrite.c:147
	;;
#0:	       callg	_memcpy         ; fvwrite.c:153
#1:	       ldx	$mem, 0 -> r1   ; fvwrite.c:153
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldm.f	r12, 12         ; fvwrite.c:154
	;;
#0:	       ldx	$memhu, r10 -> r0 ; fvwrite.c:154
	;;
#2:	       and	r0, r2.23 -> r0 ; fvwrite.c:154
	;;
#1:	       or	r0, r1.23 -> r0 ; fvwrite.c:154
	;;
#0:	       stmh.a	r0, r12, 6      ; fvwrite.c:154
#1:	       or	r1.24, 0 -> r0
	;;
.BB8_27:                                ; %bb25
                                        ;   in Loop: Header=BB8_17 Depth=1
#0:	       add	r0, r13 -> r1   ; fvwrite.c:170
#1:	       stm.a	r0, r12, 4      ; fvwrite.c:169
#2:	       sub	r11, r13 -> r0  ; fvwrite.c:173
	;;
#0:	       stm.a	r1, r12, 0      ; fvwrite.c:170
	;;
#0:	       stm.a	r11, r12, 5     ; fvwrite.c:171
#1:	       or	r14, 0 -> r11
	;;
#0:	       stm.a	r0, r12, 2      ; fvwrite.c:173
	;;
.BB8_28:                                ; %bb26
                                        ;   in Loop: Header=BB8_17 Depth=1
#1:	       cmpult	r14, r11 -> c1  ; fvwrite.c:175
#2:	       ldm.f	r12, 0          ; fvwrite.c:177
#0:	       or	r0.23, 0 -> r1  ; fvwrite.c:177
	;;
#0:	if  c1 or	r14, 0 -> r11
	;;
#0:	       callg	_memmove        ; fvwrite.c:177
#1:	       ldx	$mem, 0 -> r0   ; fvwrite.c:177
#2:	       or	r11, 0 -> r2    ; fvwrite.c:177
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldm.f	r12, 8          ; fvwrite.c:178
	;;
#0:	       ldx	$mem, 0 -> r0   ; fvwrite.c:178
	;;
#0:	       sub	r0, r11 -> r0   ; fvwrite.c:178
	;;
#0:	       stm.a	r0, r12, 2      ; fvwrite.c:178
	;;
#0:	       br	.BB8_34
#1:	       ldm.f	r12, 0          ; fvwrite.c:179
	;;
#0:	       ldx	$mem, 0 -> r0   ; fvwrite.c:179
	;;
#0:	       add	r0, r11 -> r0   ; fvwrite.c:179
	;;
.BB8_29:                                ; %bb29
                                        ;   in Loop: Header=BB8_17 Depth=1
#0:	       ldm.f	r12, 0          ; fvwrite.c:182
#1:	       cmpult	r11, r14 -> c2  ; fvwrite.c:182
	;;
#0:	       ldx	$mem, 0 -> r0   ; fvwrite.c:182
#1:	       ldm.f	r12, 16         ; fvwrite.c:182
	;;
#0:	       ldx	$mem, 0 -> r1   ; fvwrite.c:182
	;;
#0:	       cmpult	r1, r0 -> c1    ; fvwrite.c:182
	;;
#0:	       comb	and c1, c2 -> c1
	;;
#0:	if !c1 br @	.BB8_31
	;;
.BB8_30:                                ; %bb31
                                        ;   in Loop: Header=BB8_17 Depth=1
#0:	       or	r0.23, 0 -> r1  ; fvwrite.c:185
#1:	       callg	_memmove        ; fvwrite.c:185
#2:	       or	r11, 0 -> r2    ; fvwrite.c:185
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldm.f	r12, 0          ; fvwrite.c:187
	;;
#0:	       callg	__fflush_r      ; fvwrite.c:188
#1:	       ldx	$mem, 0 -> r0   ; fvwrite.c:187
	;;
#0:	       add	r0, r11 -> r0   ; fvwrite.c:187
	;;
#0:	       stm.a	r0, r12, 0      ; fvwrite.c:187
#1:	       or	r12, 0 -> r0    ; fvwrite.c:188
	;;
	       nop	0
	;;
#0:	       brz eq @	r0, .BB8_35     ; fvwrite.c:188
	;;
#0:	       br @	.BB8_59         ; fvwrite.c:188
	;;
.BB8_31:                                ; %bb32
                                        ;   in Loop: Header=BB8_17 Depth=1
#0:	       ldm.f	r12, 20         ; fvwrite.c:191
	;;
#0:	       ldx	$mem, 0 -> r3   ; fvwrite.c:191
	;;
#0:	       cmpult	r14, r3 -> c1   ; fvwrite.c:191
	;;
#0:	if  c1 br @	.BB8_33
	;;
.BB8_32:                                ; %bb33
                                        ;   in Loop: Header=BB8_17 Depth=1
#1:	       ldm.f	r12, 36         ; fvwrite.c:194
#2:	       ldga	_impure_data -> r0 ; fvwrite.c:194
#0:	       or	r0.23, 0 -> r2  ; fvwrite.c:194
	;;
#0:	       ldx	$mem, 0 -> r4   ; fvwrite.c:194
#1:	       ldm.f	r12, 28         ; fvwrite.c:194
	;;
#0:	       ldx	$mem, 0 -> r1   ; fvwrite.c:194
	;;
#0:	       jop	call	r4      ; fvwrite.c:194
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       cmplt	r0, 1 -> c1
#1:	       or	r0, 0 -> r11
	;;
#0:	if  c1 br @	.BB8_59
#1:	if !c1 br @	.BB8_35
	;;
.BB8_33:                                ; %bb34
                                        ;   in Loop: Header=BB8_17 Depth=1
#0:	       or	r0.23, 0 -> r1  ; fvwrite.c:202
#1:	       callg	_memmove        ; fvwrite.c:202
#2:	       or	r14, 0 -> r2    ; fvwrite.c:202
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldm.f	r12, 8          ; fvwrite.c:203
	;;
#0:	       ldx	$mem, 0 -> r0   ; fvwrite.c:203
	;;
#0:	       sub	r0, r14 -> r0   ; fvwrite.c:203
	;;
#0:	       stm.a	r0, r12, 2      ; fvwrite.c:203
	;;
#0:	       ldm.f	r12, 0          ; fvwrite.c:204
	;;
#0:	       ldx	$mem, 0 -> r0   ; fvwrite.c:204
	;;
#0:	       add	r0, r14 -> r0   ; fvwrite.c:204
	;;
.BB8_34:                                ; %bb34
                                        ;   in Loop: Header=BB8_17 Depth=1
#0:	       or	r14, 0 -> r11
#1:	       stm.a	r0, r12, 0      ; fvwrite.c:204
	;;
.BB8_35:                                ; %bb35
                                        ;   in Loop: Header=BB8_17 Depth=1
#3:	       ldm.f	r3.23, 8        ; fvwrite.c:209
#0:	       add	r0.23, r11 -> r0.23 ; fvwrite.c:206
#1:	       sub	r14, r11 -> r14 ; fvwrite.c:207
	;;
#0:	       ldx	$mem, 0 -> r1   ; fvwrite.c:209
	;;
#0:	       cmpeq	r1, r11 -> c1
#1:	       sub	r1, r11 -> r0   ; fvwrite.c:209
	;;
#0:	if  c1 br @	.BB8_64
#1:	if !c1 br @	.BB8_17
#3:	       stm.a	r0, r3.23, 2    ; fvwrite.c:209
	;;
.BB8_36:                                ; %bb37
                                        ;   in Loop: Header=BB8_37 Depth=1
#3:	       ldm.f	r3.24, -4       ; fvwrite.c:224
	;;
#2:	       ldx	$mem, 0 -> r2.23 ; fvwrite.c:224
#3:	       ldm.f	r3.24, 0        ; fvwrite.c:224
	;;
#3:	       add	r3.24, 8 -> r3.24
	;;
#0:	       ldx	$mem, 0 -> r14  ; fvwrite.c:224
	;;
.BB8_37:                                ; %bb38.outer
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB8_38 Depth 2
                                        ;       Child Loop BB8_43 Depth 3
                                        ;       Child Loop BB8_50 Depth 3
                                        ;       Child Loop BB8_46 Depth 3
#3:	       ldi	0 -> r3.26
	;;
.BB8_38:                                ; %bb38
                                        ;   Parent Loop BB8_37 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB8_43 Depth 3
                                        ;       Child Loop BB8_50 Depth 3
                                        ;       Child Loop BB8_46 Depth 3
#0:	       brz eq @	r14, .BB8_36    ; fvwrite.c:224
	;;
.BB8_39:                                ; %bb39
                                        ;   in Loop: Header=BB8_38 Depth=2
#0:	       ldi	0 -> r2
#3:	       brz ne @	r3.26, .BB8_55  ; fvwrite.c:225
	;;
#3:	       brz eq @	r3.26, .BB8_43  ; fvwrite.c:225
	;;
.BB8_40:                                ; %bb.i
                                        ;   in Loop: Header=BB8_43 Depth=3
#0:	       cmpeq	r14, r2 -> c1   ; memchr.c:87[ fvwrite.c:227 ]
	;;
#0:	if  c1 br @	.BB8_53
	;;
.BB8_41:                                ; %bb2.i
                                        ;   in Loop: Header=BB8_43 Depth=3
#0:	       ldm.f	r1, 0           ; memchr.c:89[ fvwrite.c:227 ]
	;;
#0:	       ldx	$membu, r1 -> r0 ; memchr.c:89[ fvwrite.c:227 ]
	;;
#0:	       cmpeq	r0, 10 -> c1    ; memchr.c:89[ fvwrite.c:227 ]
	;;
#0:	if  c1 br @	.BB8_51
	;;
.BB8_42:                                ; %bb4.i
                                        ;   in Loop: Header=BB8_43 Depth=3
#0:	       add	r2, 1 -> r2
	;;
.BB8_43:                                ; %bb5.i
                                        ;   Parent Loop BB8_37 Depth=1
                                        ;     Parent Loop BB8_38 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
#2:	       add	r2.23, r2 -> r1
	;;
#0:	       and	r1, 3 -> r0     ; memchr.c:85[ fvwrite.c:227 ]
	;;
#0:	       brz ne @	r0, .BB8_40     ; memchr.c:85[ fvwrite.c:227 ]
	;;
.BB8_44:                                ; %bb6.i
                                        ;   in Loop: Header=BB8_38 Depth=2
#0:	       sub	r14, r2 -> r5
#2:	       add	r2.23, r2 -> r1
	;;
#2:	       cmpult	r2.24, r5 -> c1 ; memchr.c:94[ fvwrite.c:227 ]
	;;
#2:	if  c1 cmpult	r2.24, r5 -> c1 ; memchr.c:110[ fvwrite.c:227 ]
	;;
#0:	if !c1 br @	.BB8_50
#1:	if  c1 br @	.BB8_46
	;;
.BB8_45:                                ; %bb13.i
                                        ;   in Loop: Header=BB8_46 Depth=3
#2:	       cmpult	r2.24, r5 -> c1 ; memchr.c:110[ fvwrite.c:227 ]
	;;
#0:	if !c1 br @	.BB8_50
	;;
.BB8_46:                                ; %bb10.i
                                        ;   Parent Loop BB8_37 Depth=1
                                        ;     Parent Loop BB8_38 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
#0:	       ldm.f	r1, 0           ; memchr.c:112[ fvwrite.c:227 ]
	;;
#0:	       ldx	$mem, 0 -> r2   ; memchr.c:112[ fvwrite.c:227 ]
#1:	       ldm.s	r15, 4
	;;
#3:	       xor	r2, r3.25 -> r3 ; memchr.c:112[ fvwrite.c:227 ]
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       and	r2, r0 -> r4
	;;
#0:	       xor	r4, r0 -> r2    ; memchr.c:112[ fvwrite.c:227 ]
#1:	       add	r3, r1.23 -> r0
	;;
#0:	       and	r2, r0 -> r0    ; memchr.c:112[ fvwrite.c:227 ]
	;;
#0:	       brz ne @	r0, .BB8_50     ; memchr.c:112[ fvwrite.c:227 ]
	;;
.BB8_47:                                ; %bb12.i
                                        ;   in Loop: Header=BB8_46 Depth=3
#0:	       add	r1, 4 -> r1
#1:	       br @	.BB8_45
#2:	       sub	r5, 4 -> r5
	;;
.BB8_48:                                ; %bb15.i
                                        ;   in Loop: Header=BB8_50 Depth=3
#0:	       ldm.f	r1, 0           ; memchr.c:128[ fvwrite.c:227 ]
	;;
#0:	       ldx	$membu, r1 -> r0 ; memchr.c:128[ fvwrite.c:227 ]
	;;
#0:	       cmpeq	r0, 10 -> c1    ; memchr.c:128[ fvwrite.c:227 ]
	;;
#0:	if  c1 br @	.BB8_51
	;;
.BB8_49:                                ; %bb17.i
                                        ;   in Loop: Header=BB8_50 Depth=3
#0:	       add	r1, 1 -> r1
#1:	       sub	r5, 1 -> r5
	;;
.BB8_50:                                ; %bb18.i
                                        ;   Parent Loop BB8_37 Depth=1
                                        ;     Parent Loop BB8_38 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
#0:	       brz ne @	r5, .BB8_48     ; memchr.c:126[ fvwrite.c:227 ]
	;;
#0:	       brz eq @	r5, .BB8_53     ; memchr.c:126[ fvwrite.c:227 ]
	;;
.BB8_51:                                ; %memchr.exit
                                        ;   in Loop: Header=BB8_38 Depth=2
#0:	       brz eq @	r1, .BB8_53     ; fvwrite.c:228
	;;
.BB8_52:                                ; %bb41
                                        ;   in Loop: Header=BB8_38 Depth=2
#0:	       add	r1, 1 -> r0     ; fvwrite.c:228
#1:	       br	.BB8_54
	;;
#2:	       sub	r0, r2.23 -> r2.25 ; fvwrite.c:228
	;;
	       nop	0
	;;
.BB8_53:                                ; %bb42
                                        ;   in Loop: Header=BB8_38 Depth=2
#2:	       add	r14, 1 -> r2.25 ; fvwrite.c:228
	;;
.BB8_54:                                ; %bb42
                                        ;   in Loop: Header=BB8_38 Depth=2
#3:	       ldi	1 -> r3.26
	;;
.BB8_55:                                ; %bb44
                                        ;   in Loop: Header=BB8_38 Depth=2
#0:	       ldm.f	r12, 20         ; fvwrite.c:232
#2:	       cmpule	r2.25, r14 -> c1 ; fvwrite.c:231
#1:	       or	r14, 0 -> r13   ; fvwrite.c:231
	;;
#2:	if  c1 or	r2.25, 0 -> r13 ; fvwrite.c:231
	;;
#0:	       ldx	$mem, 0 -> r3   ; fvwrite.c:232
#1:	       ldm.f	r12, 8          ; fvwrite.c:232
	;;
#0:	       ldx	$mem, 0 -> r1   ; fvwrite.c:232
#1:	       ldm.f	r12, 0          ; fvwrite.c:233
	;;
#0:	       add	r3, r1 -> r11   ; fvwrite.c:232
	;;
#0:	       ldx	$mem, 0 -> r0   ; fvwrite.c:233
#1:	       ldm.f	r12, 16         ; fvwrite.c:233
#2:	       cmplt	r11, r13 -> c1  ; fvwrite.c:233
	;;
#0:	       ldx	$mem, 0 -> r2   ; fvwrite.c:233
	;;
#0:	       cmpult	r2, r0 -> c2    ; fvwrite.c:233
	;;
#0:	       comb	and c2, c1 -> c1
	;;
#0:	if !c1 br @	.BB8_57
	;;
.BB8_56:                                ; %bb48
                                        ;   in Loop: Header=BB8_38 Depth=2
#2:	       or	r2.23, 0 -> r1  ; fvwrite.c:235
#0:	       callg	_memmove        ; fvwrite.c:235
#1:	       or	r11, 0 -> r2    ; fvwrite.c:235
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldm.f	r12, 0          ; fvwrite.c:237
	;;
#0:	       callg	__fflush_r      ; fvwrite.c:238
#1:	       ldx	$mem, 0 -> r0   ; fvwrite.c:237
	;;
#0:	       add	r0, r11 -> r0   ; fvwrite.c:237
	;;
#0:	       stm.a	r0, r12, 0      ; fvwrite.c:237
#1:	       or	r12, 0 -> r0    ; fvwrite.c:238
	;;
	       nop	0
	;;
#0:	       brz ne @	r0, .BB8_59     ; fvwrite.c:238
	;;
#0:	       brz eq @	r0, .BB8_61     ; fvwrite.c:238
	;;
.BB8_57:                                ; %bb49
                                        ;   in Loop: Header=BB8_38 Depth=2
#0:	       cmplt	r13, r3 -> c1   ; fvwrite.c:241
	;;
#0:	if  c1 br @	.BB8_60
	;;
.BB8_58:                                ; %bb50
                                        ;   in Loop: Header=BB8_38 Depth=2
#0:	       ldm.f	r12, 36         ; fvwrite.c:243
#1:	       ldga	_impure_data -> r0 ; fvwrite.c:243
	;;
#2:	       or	r2.23, 0 -> r2  ; fvwrite.c:243
	;;
#0:	       ldx	$mem, 0 -> r4   ; fvwrite.c:243
#1:	       ldm.f	r12, 28         ; fvwrite.c:243
	;;
#0:	       ldx	$mem, 0 -> r1   ; fvwrite.c:243
	;;
#0:	       jop	call	r4      ; fvwrite.c:243
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       cmplt	r0, 1 -> c1
#1:	       or	r0, 0 -> r11
	;;
#0:	if !c1 br @	.BB8_61
	;;
.BB8_59:                                ; %err
#0:	       ldm.f	r12, 12         ; fvwrite.c:269
#1:	       ldi	64 -> r0
	;;
#0:	       br	.BB8_5
#1:	       ldx	$memhu, r10 -> r1 ; fvwrite.c:269
	;;
#0:	       or	r1, r0 -> r0    ; fvwrite.c:269
	;;
#0:	       stmh.a	r0, r12, 6      ; fvwrite.c:269
	;;
.BB8_60:                                ; %bb51
                                        ;   in Loop: Header=BB8_38 Depth=2
#2:	       or	r2.23, 0 -> r1  ; fvwrite.c:250
#0:	       callg	_memmove        ; fvwrite.c:250
#1:	       or	r13, 0 -> r2    ; fvwrite.c:250
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldm.f	r12, 8          ; fvwrite.c:251
#1:	       or	r13, 0 -> r11
	;;
#0:	       ldx	$mem, 0 -> r0   ; fvwrite.c:251
	;;
#0:	       sub	r0, r13 -> r0   ; fvwrite.c:251
	;;
#0:	       stm.a	r0, r12, 2      ; fvwrite.c:251
	;;
#0:	       ldm.f	r12, 0          ; fvwrite.c:252
	;;
#0:	       ldx	$mem, 0 -> r0   ; fvwrite.c:252
	;;
#0:	       add	r0, r13 -> r0   ; fvwrite.c:252
	;;
#0:	       stm.a	r0, r12, 0      ; fvwrite.c:252
	;;
.BB8_61:                                ; %bb52
                                        ;   in Loop: Header=BB8_38 Depth=2
#2:	       cmpne	r2.25, r11 -> c1 ; fvwrite.c:254
	;;
#0:	if  c1 br @	.BB8_63
	;;
.BB8_62:                                ; %bb53
                                        ;   in Loop: Header=BB8_38 Depth=2
#0:	       or	r12, 0 -> r0    ; fvwrite.c:257
#1:	       callg	__fflush_r      ; fvwrite.c:257
	;;
#3:	       ldi	0 -> r3.26
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz ne @	r0, .BB8_59     ; fvwrite.c:257
	;;
.BB8_63:                                ; %bb55
                                        ;   in Loop: Header=BB8_38 Depth=2
#3:	       ldm.f	r3.23, 8        ; fvwrite.c:264
#2:	       sub	r2.25, r11 -> r2.25 ; fvwrite.c:254
#0:	       sub	r14, r11 -> r14 ; fvwrite.c:262
	;;
#2:	       add	r2.23, r11 -> r2.23 ; fvwrite.c:261
	;;
#0:	       ldx	$mem, 0 -> r1   ; fvwrite.c:264
	;;
#0:	       cmpeq	r1, r11 -> c1
#1:	       sub	r1, r11 -> r0   ; fvwrite.c:264
	;;
#0:	if !c1 br @	.BB8_38
#3:	       stm.a	r0, r3.23, 2    ; fvwrite.c:264
	;;
.BB8_64:                                ; %bb57
#0:	       ldi	0 -> r0
#1:	       br @	.BB8_6
	;;
	.align	4
___sfvwrite_r_end:

	.align	4
_cvt:                                   ; @cvt
	.size	_cvt_end-_cvt
_cvt_start:
; BB#0:                                 ; %entry
#0:	       ldiu	112 -> r4
#1:	       wb.s	r15, 28
#2:	       ldx	$f10 -> r5
	;;
#0:	       sub	r15, r4 -> r15
#1:	       stx	r1 -> $f0
	;;
#0:	       stm.s	r10, r15, 19
#1:	       or	r2, 0 -> r10
#2:	       add	r15, 24 -> r2
	;;
#0:	       stm.s	r11, r15, 18
#1:	       or	r2, 4 -> r2
	;;
#0:	       stm.s	r12, r15, 17
	;;
#0:	       stm.s	r13, r15, 16
	;;
#0:	       stm.s	r14, r15, 15
	;;
#0:	       stm.s	r0.23, r15, 14
	;;
#1:	       stm.s	r5, r15, 13
#2:	       ldx	$f11 -> r5
#0:	       or	r3, 0 -> r0.23
#3:	       ldi	0 -> r3
	;;
#0:	       stm.s	r5, r15, 12
#1:	       ldx	$rb, 0 -> r5
#2:	       stx	r0 -> $f10
	;;
#0:	       stm.s	r5, r15, 11
#1:	       ldx	$ro, 0 -> r5
#2:	       ldx	$f10 -> r0
	;;
#0:	       stm.s	r5, r15, 10
#1:	       fop	fmov	f0 -> f11
	;;
#0:	       stm.a	r0, r15, 6
#1:	       ldx	$f11 -> r0
	;;
#0:	       ldm.f	r15, 112
	;;
#0:	       ldx	$mem, 0 -> r4
#1:	       stm.a	r0, r2, 0
#2:	       ldi	-1 -> r0
	;;
#0:	       ldm.f	r15, 116
	;;
#0:	       ldx	$mem, 0 -> r13
#1:	       ldm.f	r15, 120
	;;
#0:	       ldx	$mem, 0 -> r12
#1:	       ldm.f	r15, 124
	;;
#0:	       ldx	$mem, 0 -> r11
#1:	       ldm.f	r2, 0
#2:	       ldi	3 -> r2
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       cmplt	r0, r1 -> c1    ; vfprintf.c:1646
#1:	       ldi	100 -> r0
	;;
#0:	if !c1 fop	dneg	d5 -> d5 ; vfprintf.c:1647
#1:	if !c1 ldi	45 -> r3
#2:	       cmplt	r0, r12 -> c1
	;;
#0:	if  c1 br @	.BB9_3
#1:	       stmb.a	r3, r4, 0
	;;
.BB9_1:                                 ; %bb2
#0:	       ldi	69 -> r0
	;;
#0:	       cmpeq	r12, r0 -> c1
	;;
#0:	if  c1 br @	.BB9_5
	;;
.BB9_2:                                 ; %bb2
#0:	       ldi	70 -> r0
#1:	       br	.BB9_7
	;;
#0:	       cmpeq	r12, r0 -> c1
	;;
#0:	if !c1 ldi	2 -> r2
	;;
.BB9_3:                                 ; %bb2
#0:	       ldi	102 -> r0
	;;
#0:	       cmpeq	r12, r0 -> c1
	;;
#0:	if  c1 br @	.BB9_7
	;;
.BB9_4:                                 ; %bb2
#0:	       ldi	101 -> r0
#1:	       br	.BB9_6
	;;
#0:	       cmpne	r12, r0 -> c1
	;;
#0:	if !c1 add	r10, 1 -> r10   ; vfprintf.c:1707
	;;
.BB9_5:                                 ; %bb7
#0:	       add	r10, 1 -> r10   ; vfprintf.c:1707
	;;
.BB9_6:                                 ; %bb8
#0:	       ldi	2 -> r2
	;;
.BB9_7:                                 ; %bb9
#0:	       s2add	r15, 8 -> r4
#1:	       or	r15, 0 -> r1    ; vfprintf.c:1712
#2:	       or	r10, 0 -> r3    ; vfprintf.c:1712
#3:	       ldi	101 -> r14
	;;
#0:	       add	r4, 4 -> r0
#1:	       stm.a	r13, r1, 0      ; vfprintf.c:1712
#2:	       s2add	r15, 8 -> r4
	;;
#0:	       stm.a	r0, r1, 1       ; vfprintf.c:1712
#1:	       add	r4, 0 -> r0
	;;
#0:	       stm.a	r0, r1, 2       ; vfprintf.c:1712
#1:	       ldx	$f10 -> r0      ; vfprintf.c:1712
	;;
#0:	       callg	__dtoa_r        ; vfprintf.c:1712
#1:	       ldx	$f11 -> r1      ; vfprintf.c:1712
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       cmplt	r14, r12 -> c1
	;;
#0:	if  c1 br @	.BB9_10
	;;
.BB9_8:                                 ; %bb9
#0:	       ldi	70 -> r1
	;;
#0:	       cmpeq	r12, r1 -> c1
	;;
#0:	if  c1 br @	.BB9_15
	;;
.BB9_9:                                 ; %bb9
#0:	       ldi	71 -> r1
	;;
#0:	       cmpeq	r12, r1 -> c1
	;;
#0:	if !c1 br @	.BB9_19
#1:	if  c1 br @	.BB9_12
	;;
.BB9_10:                                ; %bb9
#0:	       ldi	102 -> r1
	;;
#0:	       cmpeq	r12, r1 -> c1
	;;
#0:	if  c1 br @	.BB9_15
	;;
.BB9_11:                                ; %bb9
#0:	       ldi	103 -> r1
	;;
#0:	       cmpne	r12, r1 -> c1
	;;
#0:	if  c1 br @	.BB9_19
	;;
.BB9_12:                                ; %bb11
#0:	       btest	r0.23, 0 -> c1  ; vfprintf.c:1714
	;;
#0:	if  c1 br @	.BB9_14
	;;
.BB9_13:                                ; %bb11.bb22_crit_edge
#0:	       ldm.f	r15, 32
#1:	       br	.BB9_25
	;;
#0:	       ldx	$mem, 0 -> r6
	;;
	       nop	0
	;;
.BB9_14:                                ; %bb12
#0:	       ldi	32 -> r1
	;;
#0:	       or	r12, r1 -> r2
#1:	       ldi	102 -> r1
	;;
#0:	       cmpeq	r2, r1 -> c1
	;;
#0:	if !c1 br @	.BB9_19
	;;
.BB9_15:                                ; %bb14
#0:	       fop	dzero -> d0
#1:	       ldi	48 -> r2
	;;
#0:	       fop	dcmp	d5, d0 -> f0 ; vfprintf.c:1717
#1:	       ldm.f	r0, 0           ; vfprintf.c:1717
	;;
	       nop	0
	;;
#0:	       ldx	$membu, r0 -> r3 ; vfprintf.c:1717
	;;
#0:	       ldx	$f0 -> r1       ; vfprintf.c:1717
#1:	       cmpeq	r3, r2 -> c2    ; vfprintf.c:1717
	;;
#0:	       btest	r1, 9 -> c1     ; vfprintf.c:1717
	;;
#0:	       comb	and c2, c1 -> c1
	;;
#0:	if  c1 br @	.BB9_17
	;;
.BB9_16:                                ; %bb14.bb17_crit_edge
#0:	       ldm.f	r13, 0
#1:	       br	.BB9_18
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
	       nop	0
	;;
.BB9_17:                                ; %bb16
#0:	       ldi	1 -> r1
	;;
#0:	       sub	r1, r10 -> r1   ; vfprintf.c:1718
	;;
#0:	       stm.a	r1, r13, 0      ; vfprintf.c:1718
	;;
.BB9_18:                                ; %bb17
#0:	       add	r1, r10 -> r10
	;;
.BB9_19:                                ; %bb18
#0:	       fop	dzero -> d0
#1:	       add	r0, r10 -> r6
	;;
#0:	       fop	dcmp	d5, d0 -> f0 ; vfprintf.c:1721
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r1       ; vfprintf.c:1721
	;;
#0:	       btest	r1, 9 -> c1     ; vfprintf.c:1721
	;;
#0:	if  c1 br @	.BB9_21
	;;
.BB9_20:                                ; %bb21.preheader.thread
#0:	       stm.a	r6, r15, 8      ; vfprintf.c:1722
#1:	       br @	.BB9_25
	;;
.BB9_21:                                ; %bb21.preheader
#0:	       ldm.f	r15, 32
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       cmpule	r6, r2 -> c1    ; vfprintf.c:1723
	;;
#0:	if !c1 br @	.BB9_23
	;;
.BB9_22:
#0:	       or	r2, 0 -> r6
#1:	       br @	.BB9_25
	;;
.BB9_23:                                ; %bb20.preheader
#0:	       sub	r10, r2 -> r1
#1:	       ldi	48 -> r3
	;;
#0:	       add	r0, r1 -> r5
#1:	       add	r2, 1 -> r1
	;;
.BB9_24:                                ; %bb20
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sub	r1, 1 -> r2
#1:	       add	r1, 1 -> r4
#2:	       sub	r5, 1 -> r5
	;;
#0:	       brz ne	r5, .BB9_24     ; vfprintf.c:1723
#1:	       stmb.a	r3, r2, 0       ; vfprintf.c:1724
	;;
#0:	       stm.a	r1, r15, 8      ; vfprintf.c:1724
#1:	       or	r4, 0 -> r1
	;;
	       nop	0
	;;
.BB9_25:                                ; %bb22
#0:	       sub	r6, r0 -> r1    ; vfprintf.c:1726
	;;
#0:	       stm.a	r1, r11, 0      ; vfprintf.c:1726
	;;
#0:	       ldm.s	r15, 40         ; vfprintf.c:1727
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1727
	;;
#0:	       stx	r1 -> $ro       ; vfprintf.c:1727
	;;
#0:	       ldm.s	r15, 44         ; vfprintf.c:1727
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1727
	;;
#0:	       stx	r1 -> $rb       ; vfprintf.c:1727
	;;
#0:	       ldm.s	r15, 48         ; vfprintf.c:1727
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1727
	;;
#0:	       stx	r1 -> $f11      ; vfprintf.c:1727
	;;
#0:	       ldm.s	r15, 52         ; vfprintf.c:1727
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1727
	;;
#0:	       stx	r1 -> $f10      ; vfprintf.c:1727
	;;
#0:	       ldm.s	r15, 56         ; vfprintf.c:1727
	;;
#0:	       ldx	$mem, 0 -> r0.23 ; vfprintf.c:1727
	;;
#0:	       ldm.s	r15, 60         ; vfprintf.c:1727
	;;
#0:	       ldx	$mem, 0 -> r14  ; vfprintf.c:1727
	;;
#0:	       ldm.s	r15, 64         ; vfprintf.c:1727
	;;
#0:	       ldx	$mem, 0 -> r13  ; vfprintf.c:1727
	;;
#0:	       ldm.s	r15, 68         ; vfprintf.c:1727
	;;
#0:	       ldx	$mem, 0 -> r12  ; vfprintf.c:1727
	;;
#0:	       ldm.s	r15, 72         ; vfprintf.c:1727
	;;
#0:	       ldx	$mem, 0 -> r11  ; vfprintf.c:1727
	;;
#0:	       ldm.s	r15, 76         ; vfprintf.c:1727
#1:	       s2add	r15, 28 -> r15  ; vfprintf.c:1727
	;;
#0:	       jop	ret             ; vfprintf.c:1727
#1:	       ldx	$mem, 0 -> r10  ; vfprintf.c:1727
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
_cvt_end:

	.align	4
_cvt45:                                 ; @cvt45
	.size	_cvt45_end-_cvt45
_cvt45_start:
; BB#0:                                 ; %entry
#0:	       ldiu	112 -> r4
#1:	       wb.s	r15, 28
#2:	       ldx	$f10 -> r5
	;;
#0:	       sub	r15, r4 -> r15
#1:	       stx	r1 -> $f0
	;;
#0:	       stm.s	r10, r15, 19
#1:	       or	r2, 0 -> r10
#2:	       add	r15, 24 -> r2
	;;
#0:	       stm.s	r11, r15, 18
#1:	       or	r2, 4 -> r2
	;;
#0:	       stm.s	r12, r15, 17
	;;
#0:	       stm.s	r13, r15, 16
	;;
#0:	       stm.s	r14, r15, 15
	;;
#0:	       stm.s	r0.23, r15, 14
	;;
#1:	       stm.s	r5, r15, 13
#2:	       ldx	$f11 -> r5
#0:	       or	r3, 0 -> r0.23
#3:	       ldi	0 -> r3
	;;
#0:	       stm.s	r5, r15, 12
#1:	       ldx	$rb, 0 -> r5
#2:	       stx	r0 -> $f10
	;;
#0:	       stm.s	r5, r15, 11
#1:	       ldx	$ro, 0 -> r5
#2:	       ldx	$f10 -> r0
	;;
#0:	       stm.s	r5, r15, 10
#1:	       fop	fmov	f0 -> f11
	;;
#0:	       stm.a	r0, r15, 6
#1:	       ldx	$f11 -> r0
	;;
#0:	       ldm.f	r15, 112
	;;
#0:	       ldx	$mem, 0 -> r4
#1:	       stm.a	r0, r2, 0
#2:	       ldi	-1 -> r0
	;;
#0:	       ldm.f	r15, 116
	;;
#0:	       ldx	$mem, 0 -> r13
#1:	       ldm.f	r15, 120
	;;
#0:	       ldx	$mem, 0 -> r12
#1:	       ldm.f	r15, 124
	;;
#0:	       ldx	$mem, 0 -> r11
#1:	       ldm.f	r2, 0
#2:	       ldi	3 -> r2
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       cmplt	r0, r1 -> c1    ; vfprintf.c:1646
#1:	       ldi	100 -> r0
	;;
#0:	if !c1 fop	dneg	d5 -> d5 ; vfprintf.c:1647
#1:	if !c1 ldi	45 -> r3
#2:	       cmplt	r0, r12 -> c1
	;;
#0:	if  c1 br @	.BB10_3
#1:	       stmb.a	r3, r4, 0
	;;
.BB10_1:                                ; %bb2
#0:	       ldi	69 -> r0
	;;
#0:	       cmpeq	r12, r0 -> c1
	;;
#0:	if  c1 br @	.BB10_5
	;;
.BB10_2:                                ; %bb2
#0:	       ldi	70 -> r0
#1:	       br	.BB10_7
	;;
#0:	       cmpeq	r12, r0 -> c1
	;;
#0:	if !c1 ldi	2 -> r2
	;;
.BB10_3:                                ; %bb2
#0:	       ldi	102 -> r0
	;;
#0:	       cmpeq	r12, r0 -> c1
	;;
#0:	if  c1 br @	.BB10_7
	;;
.BB10_4:                                ; %bb2
#0:	       ldi	101 -> r0
#1:	       br	.BB10_6
	;;
#0:	       cmpne	r12, r0 -> c1
	;;
#0:	if !c1 add	r10, 1 -> r10   ; vfprintf.c:1707
	;;
.BB10_5:                                ; %bb7
#0:	       add	r10, 1 -> r10   ; vfprintf.c:1707
	;;
.BB10_6:                                ; %bb8
#0:	       ldi	2 -> r2
	;;
.BB10_7:                                ; %bb9
#0:	       s2add	r15, 8 -> r4
#1:	       or	r15, 0 -> r1    ; vfprintf.c:1712
#2:	       or	r10, 0 -> r3    ; vfprintf.c:1712
#3:	       ldi	101 -> r14
	;;
#0:	       add	r4, 4 -> r0
#1:	       stm.a	r13, r1, 0      ; vfprintf.c:1712
#2:	       s2add	r15, 8 -> r4
	;;
#0:	       stm.a	r0, r1, 1       ; vfprintf.c:1712
#1:	       add	r4, 0 -> r0
	;;
#0:	       stm.a	r0, r1, 2       ; vfprintf.c:1712
#1:	       ldx	$f10 -> r0      ; vfprintf.c:1712
	;;
#0:	       callg	__dtoa_r        ; vfprintf.c:1712
#1:	       ldx	$f11 -> r1      ; vfprintf.c:1712
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       cmplt	r14, r12 -> c1
	;;
#0:	if  c1 br @	.BB10_10
	;;
.BB10_8:                                ; %bb9
#0:	       ldi	70 -> r1
	;;
#0:	       cmpeq	r12, r1 -> c1
	;;
#0:	if  c1 br @	.BB10_15
	;;
.BB10_9:                                ; %bb9
#0:	       ldi	71 -> r1
	;;
#0:	       cmpeq	r12, r1 -> c1
	;;
#0:	if !c1 br @	.BB10_19
#1:	if  c1 br @	.BB10_12
	;;
.BB10_10:                               ; %bb9
#0:	       ldi	102 -> r1
	;;
#0:	       cmpeq	r12, r1 -> c1
	;;
#0:	if  c1 br @	.BB10_15
	;;
.BB10_11:                               ; %bb9
#0:	       ldi	103 -> r1
	;;
#0:	       cmpne	r12, r1 -> c1
	;;
#0:	if  c1 br @	.BB10_19
	;;
.BB10_12:                               ; %bb11
#0:	       btest	r0.23, 0 -> c1  ; vfprintf.c:1714
	;;
#0:	if  c1 br @	.BB10_14
	;;
.BB10_13:                               ; %bb11.bb22_crit_edge
#0:	       ldm.f	r15, 32
#1:	       br	.BB10_25
	;;
#0:	       ldx	$mem, 0 -> r6
	;;
	       nop	0
	;;
.BB10_14:                               ; %bb12
#0:	       ldi	32 -> r1
	;;
#0:	       or	r12, r1 -> r2
#1:	       ldi	102 -> r1
	;;
#0:	       cmpeq	r2, r1 -> c1
	;;
#0:	if !c1 br @	.BB10_19
	;;
.BB10_15:                               ; %bb14
#0:	       fop	dzero -> d0
#1:	       ldi	48 -> r2
	;;
#0:	       fop	dcmp	d5, d0 -> f0 ; vfprintf.c:1717
#1:	       ldm.f	r0, 0           ; vfprintf.c:1717
	;;
	       nop	0
	;;
#0:	       ldx	$membu, r0 -> r3 ; vfprintf.c:1717
	;;
#0:	       ldx	$f0 -> r1       ; vfprintf.c:1717
#1:	       cmpeq	r3, r2 -> c2    ; vfprintf.c:1717
	;;
#0:	       btest	r1, 9 -> c1     ; vfprintf.c:1717
	;;
#0:	       comb	and c2, c1 -> c1
	;;
#0:	if  c1 br @	.BB10_17
	;;
.BB10_16:                               ; %bb14.bb17_crit_edge
#0:	       ldm.f	r13, 0
#1:	       br	.BB10_18
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
	       nop	0
	;;
.BB10_17:                               ; %bb16
#0:	       ldi	1 -> r1
	;;
#0:	       sub	r1, r10 -> r1   ; vfprintf.c:1718
	;;
#0:	       stm.a	r1, r13, 0      ; vfprintf.c:1718
	;;
.BB10_18:                               ; %bb17
#0:	       add	r1, r10 -> r10
	;;
.BB10_19:                               ; %bb18
#0:	       fop	dzero -> d0
#1:	       add	r0, r10 -> r6
	;;
#0:	       fop	dcmp	d5, d0 -> f0 ; vfprintf.c:1721
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r1       ; vfprintf.c:1721
	;;
#0:	       btest	r1, 9 -> c1     ; vfprintf.c:1721
	;;
#0:	if  c1 br @	.BB10_21
	;;
.BB10_20:                               ; %bb21.preheader.thread
#0:	       stm.a	r6, r15, 8      ; vfprintf.c:1722
#1:	       br @	.BB10_25
	;;
.BB10_21:                               ; %bb21.preheader
#0:	       ldm.f	r15, 32
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       cmpule	r6, r2 -> c1    ; vfprintf.c:1723
	;;
#0:	if !c1 br @	.BB10_23
	;;
.BB10_22:
#0:	       or	r2, 0 -> r6
#1:	       br @	.BB10_25
	;;
.BB10_23:                               ; %bb20.preheader
#0:	       sub	r10, r2 -> r1
#1:	       ldi	48 -> r3
	;;
#0:	       add	r0, r1 -> r5
#1:	       add	r2, 1 -> r1
	;;
.BB10_24:                               ; %bb20
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sub	r1, 1 -> r2
#1:	       add	r1, 1 -> r4
#2:	       sub	r5, 1 -> r5
	;;
#0:	       brz ne	r5, .BB10_24    ; vfprintf.c:1723
#1:	       stmb.a	r3, r2, 0       ; vfprintf.c:1724
	;;
#0:	       stm.a	r1, r15, 8      ; vfprintf.c:1724
#1:	       or	r4, 0 -> r1
	;;
	       nop	0
	;;
.BB10_25:                               ; %bb22
#0:	       sub	r6, r0 -> r1    ; vfprintf.c:1726
	;;
#0:	       stm.a	r1, r11, 0      ; vfprintf.c:1726
	;;
#0:	       ldm.s	r15, 40         ; vfprintf.c:1727
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1727
	;;
#0:	       stx	r1 -> $ro       ; vfprintf.c:1727
	;;
#0:	       ldm.s	r15, 44         ; vfprintf.c:1727
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1727
	;;
#0:	       stx	r1 -> $rb       ; vfprintf.c:1727
	;;
#0:	       ldm.s	r15, 48         ; vfprintf.c:1727
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1727
	;;
#0:	       stx	r1 -> $f11      ; vfprintf.c:1727
	;;
#0:	       ldm.s	r15, 52         ; vfprintf.c:1727
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1727
	;;
#0:	       stx	r1 -> $f10      ; vfprintf.c:1727
	;;
#0:	       ldm.s	r15, 56         ; vfprintf.c:1727
	;;
#0:	       ldx	$mem, 0 -> r0.23 ; vfprintf.c:1727
	;;
#0:	       ldm.s	r15, 60         ; vfprintf.c:1727
	;;
#0:	       ldx	$mem, 0 -> r14  ; vfprintf.c:1727
	;;
#0:	       ldm.s	r15, 64         ; vfprintf.c:1727
	;;
#0:	       ldx	$mem, 0 -> r13  ; vfprintf.c:1727
	;;
#0:	       ldm.s	r15, 68         ; vfprintf.c:1727
	;;
#0:	       ldx	$mem, 0 -> r12  ; vfprintf.c:1727
	;;
#0:	       ldm.s	r15, 72         ; vfprintf.c:1727
	;;
#0:	       ldx	$mem, 0 -> r11  ; vfprintf.c:1727
	;;
#0:	       ldm.s	r15, 76         ; vfprintf.c:1727
#1:	       s2add	r15, 28 -> r15  ; vfprintf.c:1727
	;;
#0:	       jop	ret             ; vfprintf.c:1727
#1:	       ldx	$mem, 0 -> r10  ; vfprintf.c:1727
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
_cvt45_end:

	.align	4
__vfprintf_r:                           ; @_vfprintf_r
	.size	__vfprintf_r_end-__vfprintf_r
__vfprintf_r_start:
; BB#0:                                 ; %entry
#1:	       ldiu	1536 -> r3
#2:	       wb.s	r15, 384
#3:	       ldiu	1280 -> r4
#0:	       ldx	$f13 -> r0.31
	;;
#0:	       sub	r15, r3 -> r15
#2:	       ldiu	1408 -> r3
#1:	       ldx	$f10 -> r1.31
	;;
#0:	       add	r15, r3 -> r3
#1:	       add	r15, r4 -> r4
	;;
#0:	       stm.s	r10, r3, 23
#2:	       ldx	$f11 -> r2.31
	;;
#0:	       stm.s	r11, r3, 22
	;;
#0:	       stm.s	r12, r3, 21
	;;
#0:	       stm.s	r13, r3, 20
#1:	       or	r1, 0 -> r13
#2:	       ldga	._.str69 -> r1
	;;
#0:	       stm.s	r14, r3, 19
#1:	       or	r2, 0 -> r14
	;;
#0:	       stm.s	r0.23, r3, 18
#3:	       ldx	$f12 -> r3.31
	;;
#1:	       stm.s	r1.23, r3, 17
	;;
#2:	       stm.s	r2.23, r3, 16
	;;
#3:	       stm.s	r3.23, r3, 15
	;;
#0:	       stm.s	r0.24, r3, 14
	;;
#1:	       stm.s	r1.24, r3, 13
	;;
#2:	       stm.s	r2.24, r3, 12
	;;
#0:	       stm.s	r0.25, r3, 11
	;;
#1:	       stm.s	r1.25, r3, 10
	;;
#2:	       stm.s	r2.25, r3, 9
	;;
#0:	       stm.s	r0.26, r3, 8
	;;
#1:	       stm.s	r1.26, r3, 7
	;;
#2:	       stm.s	r2.26, r3, 6
	;;
#0:	       stm.s	r0.27, r3, 5
	;;
#1:	       stm.s	r1.27, r3, 4
	;;
#2:	       stm.s	r2.27, r3, 3
	;;
#1:	       stm.s	r1.28, r3, 2
	;;
#2:	       stm.s	r2.28, r3, 1
	;;
#1:	       stm.s	r1.29, r3, 0
#0:	       ldi	0 -> r3
	;;
#2:	       stm.s	r2.29, r4, 31
	;;
#1:	       stm.s	r1.30, r4, 30
	;;
#1:	       stm.s	r1.31, r4, 29
	;;
#2:	       stm.s	r2.31, r4, 28
#1:	       ldx	$rb, 0 -> r1.31
	;;
#3:	       stm.s	r3.31, r4, 27
#2:	       ldx	$ro, 0 -> r2.31
	;;
#0:	       stm.s	r0.31, r4, 26
	;;
#0:	       br	.BB11_3
#1:	       stm.s	r1.31, r4, 25
	;;
#2:	       stm.s	r2.31, r4, 24
	;;
#0:	       stm.s	r0, r15, 15
	;;
.BB11_1:                                ; %bb.i1
                                        ;   in Loop: Header=BB11_3 Depth=1
#0:	       cmpeq	r3, 1 -> c1     ; strlen.c:68[ vfprintf.c:576 ]
#1:	       ldi	1 -> r0
	;;
#0:	if  c1 br @	.BB11_9
#1:	       stm.s	r0, r15, 9      ; strlen.c:68[ vfprintf.c:576 ]
	;;
.BB11_2:                                ; %bb2.i2
                                        ;   in Loop: Header=BB11_3 Depth=1
#0:	       add	r3, 1 -> r3
	;;
.BB11_3:                                ; %bb3.i3
                                        ; =>This Inner Loop Header: Depth=1
#0:	       add	r1, r3 -> r0
	;;
#0:	       and	r0, 3 -> r0     ; strlen.c:66[ vfprintf.c:576 ]
	;;
#0:	       brz ne @	r0, .BB11_1     ; strlen.c:66[ vfprintf.c:576 ]
	;;
.BB11_4:                                ; %bb4.i4
#0:	       ldga	._.str69 -> r0
#1:	       ldiu	1791 -> r5
#2:	       ldga	32896 -> r2
	;;
#0:	       add	r0, r3 -> r3
#1:	       ldim	991 -> r5
#2:	       ldih	1028 -> r2
	;;
#0:	       ldm.f	r3, 0           ; strlen.c:76[ vfprintf.c:576 ]
#1:	       ldih	2039 -> r5
	;;
#0:	       ldx	$mem, 0 -> r4   ; strlen.c:76[ vfprintf.c:576 ]
	;;
#0:	       and	r4, r2 -> r0
	;;
#0:	       xor	r0, r2 -> r1
#1:	       add	r4, r5 -> r0
	;;
#0:	       and	r1, r0 -> r0    ; strlen.c:76[ vfprintf.c:576 ]
	;;
#0:	       brz ne @	r0, .BB11_6     ; strlen.c:76[ vfprintf.c:576 ]
	;;
.BB11_5:                                ; %bb5.i6
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r3, 4           ; strlen.c:76[ vfprintf.c:576 ]
#1:	       add	r3, 4 -> r3
	;;
#0:	       ldx	$mem, 0 -> r4   ; strlen.c:76[ vfprintf.c:576 ]
	;;
#0:	       and	r4, r2 -> r0
	;;
#0:	       xor	r0, r2 -> r1
#1:	       add	r4, r5 -> r0
	;;
#0:	       and	r1, r0 -> r0    ; strlen.c:76[ vfprintf.c:576 ]
	;;
#0:	       brz eq @	r0, .BB11_5     ; strlen.c:76[ vfprintf.c:576 ]
	;;
.BB11_6:                                ; %bb8.i
#0:	       ldm.f	r3, 0           ; strlen.c:85[ vfprintf.c:576 ]
#1:	       or	r3, 0 -> r1
	;;
#0:	       ldx	$membu, r3 -> r0 ; strlen.c:85[ vfprintf.c:576 ]
	;;
#0:	       brz eq @	r0, .BB11_8     ; strlen.c:85[ vfprintf.c:576 ]
	;;
.BB11_7:                                ; %bb9.i8
                                        ; =>This Inner Loop Header: Depth=1
#0:	       add	r3, 1 -> r1
#1:	       ldm.f	r3, 1           ; strlen.c:85[ vfprintf.c:576 ]
	;;
#0:	       or	r1, 0 -> r3
	;;
#0:	       ldx	$membu, r1 -> r0 ; strlen.c:85[ vfprintf.c:576 ]
	;;
#0:	       brz ne @	r0, .BB11_7     ; strlen.c:85[ vfprintf.c:576 ]
	;;
.BB11_8:                                ; %bb11.i
#0:	       ldga	._.str69 -> r0  ; strlen.c:87[ vfprintf.c:576 ]
	;;
#0:	       sub	r1, r0 -> r0    ; strlen.c:87[ vfprintf.c:576 ]
	;;
#0:	       stm.s	r0, r15, 9
	;;
.BB11_9:                                ; %bb
#0:	       ldiu	128 -> r1       ; vfprintf.c:586
	;;
#0:	       add	r15, r1 -> r1   ; vfprintf.c:586
	;;
#0:	       stm.a	0, r1, 22       ; vfprintf.c:586
	;;
#0:	       ldmg.d	_impure_data+56 ; vfprintf.c:710
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:710
	;;
#0:	       brz ne @	r0, .BB11_11    ; vfprintf.c:710
	;;
.BB11_10:                               ; %bb1
#0:	       callg	___sinit        ; vfprintf.c:710
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB11_11:                               ; %bb2
#0:	       ldm.s	r15, 60         ; vfprintf.c:713
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:713
	;;
#0:	       add	r1, 12 -> r0    ; vfprintf.c:713
	;;
#0:	       stm.s	r0, r15, 6      ; vfprintf.c:713
	;;
#0:	       ldm.f	r1, 12          ; vfprintf.c:713
	;;
#0:	       ldx	$memhu, r0 -> r3 ; vfprintf.c:713
	;;
#0:	       btest	r3, 13 -> c1    ; vfprintf.c:713
	;;
#0:	if  c1 br @	.BB11_13
	;;
.BB11_12:                               ; %bb3
#0:	       ldga	8192 -> r0
#1:	       or	r1, 0 -> r2     ; vfprintf.c:713
	;;
#0:	       or	r3, r0 -> r3    ; vfprintf.c:713
#1:	       ldiu	2047 -> r0
	;;
#0:	       stmh.a	r3, r2, 6       ; vfprintf.c:713
#1:	       ldim	2043 -> r0
	;;
#0:	       ldm.f	r2, 100         ; vfprintf.c:713
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:713
	;;
#0:	       and	r1, r0 -> r0    ; vfprintf.c:713
	;;
#0:	       stm.a	r0, r2, 25      ; vfprintf.c:713
	;;
.BB11_13:                               ; %bb4
#0:	       btest	r3, 3 -> c1     ; vfprintf.c:716
	;;
#0:	if !c1 br @	.BB11_15
	;;
.BB11_14:                               ; %bb5
#0:	       ldm.s	r15, 60         ; vfprintf.c:716
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:716
	;;
#0:	       ldm.f	r0, 16          ; vfprintf.c:716
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:716
	;;
#0:	       brz ne @	r0, .BB11_17    ; vfprintf.c:716
	;;
.BB11_15:                               ; %bb6
#0:	       ldm.s	r15, 60         ; vfprintf.c:716
#1:	       ldi	-1 -> r10
	;;
#0:	       callg	___swsetup_r    ; vfprintf.c:716
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:716
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz ne @	r0, .BB11_23    ; vfprintf.c:716
	;;
.BB11_16:                               ; %bb6.bb8_crit_edge
#0:	       ldm.s	r15, 60
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       ldm.f	r0, 12
#1:	       ldiu	lo11{ ___mem_emergency } -> r0
	;;
#0:	       ldx	$mem, 0 -> r0.31
	;;
#0:	       stm.a	r0.31, r0, 0
	;;
#0:	       ldm.s	r15, 24
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       ldmg.d	___mem_emergency
	;;
#0:	       ldx	$memhu, r0 -> r3
	;;
.BB11_17:                               ; %bb8
#0:	       and	r3, 26 -> r0    ; vfprintf.c:722
	;;
#0:	       cmpne	r0, 10 -> c1    ; vfprintf.c:722
	;;
#0:	if !c1 ldm.s	r15, 60         ; vfprintf.c:722
	;;
#0:	if !c1 ldx	$mem, 0 -> r0   ; vfprintf.c:722
	;;
#0:	if !c1 ldm.f	r0, 14          ; vfprintf.c:722
#1:	if !c1 add	r0, 14 -> r1    ; vfprintf.c:722
	;;
#0:	if !c1 ldx	$memhs, r1 -> r1 ; vfprintf.c:722
	;;
#0:	if !c1 cmplt	r1, 0 -> c1     ; vfprintf.c:722
	;;
#0:	if  c1 br @	.BB11_25
	;;
.BB11_18:                               ; %bb10
#0:	       ldiu	2045 -> r0
#1:	       ldiu	1280 -> r5      ; vfprintf.c:349[ vfprintf.c:725 ]
#2:	       ldiu	1280 -> r11     ; vfprintf.c:351[ vfprintf.c:725 ]
	;;
#0:	       ldim	31 -> r0
#1:	       add	r15, r5 -> r5   ; vfprintf.c:349[ vfprintf.c:725 ]
#2:	       add	r15, r11 -> r11 ; vfprintf.c:351[ vfprintf.c:725 ]
	;;
#0:	       and	r3, r0 -> r0    ; vfprintf.c:349[ vfprintf.c:725 ]
#1:	       ldiu	1024 -> r3
	;;
#0:	       stmh.a	r0, r5, 2       ; vfprintf.c:349[ vfprintf.c:725 ]
#1:	       ldiu	224 -> r5
	;;
#0:	       ldm.s	r15, 60         ; vfprintf.c:350[ vfprintf.c:725 ]
#1:	       add	r15, r5 -> r5
	;;
#0:	       add	r5, 24 -> r4
#1:	       ldiu	1280 -> r5      ; vfprintf.c:350[ vfprintf.c:725 ]
	;;
#0:	       ldx	$mem, 0 -> r2   ; vfprintf.c:350[ vfprintf.c:725 ]
#1:	       add	r15, r5 -> r5   ; vfprintf.c:350[ vfprintf.c:725 ]
	;;
#0:	       ldm.f	r2, 100         ; vfprintf.c:350[ vfprintf.c:725 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:350[ vfprintf.c:725 ]
	;;
#0:	       stm.a	r0, r5, 23      ; vfprintf.c:350[ vfprintf.c:725 ]
#1:	       ldiu	1248 -> r5
	;;
#0:	       stmh.a	r1, r11, 3      ; vfprintf.c:351[ vfprintf.c:725 ]
#1:	       ldiu	1280 -> r11     ; vfprintf.c:352[ vfprintf.c:725 ]
#2:	       add	r15, r5 -> r5
	;;
#0:	       ldm.f	r2, 28          ; vfprintf.c:352[ vfprintf.c:725 ]
#1:	       add	r15, r11 -> r11 ; vfprintf.c:352[ vfprintf.c:725 ]
#2:	       add	r5, 24 -> r0
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:352[ vfprintf.c:725 ]
	;;
#0:	       stm.a	r1, r11, 5      ; vfprintf.c:352[ vfprintf.c:725 ]
#1:	       ldiu	1280 -> r11     ; vfprintf.c:353[ vfprintf.c:725 ]
	;;
#0:	       ldm.f	r2, 36          ; vfprintf.c:353[ vfprintf.c:725 ]
#1:	       add	r15, r11 -> r11 ; vfprintf.c:353[ vfprintf.c:725 ]
#2:	       or	r14, 0 -> r2    ; vfprintf.c:364[ vfprintf.c:725 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:353[ vfprintf.c:725 ]
	;;
#0:	       stm.a	r1, r11, 7      ; vfprintf.c:353[ vfprintf.c:725 ]
#1:	       ldiu	1152 -> r11     ; vfprintf.c:356[ vfprintf.c:725 ]
#2:	       or	r13, 0 -> r1    ; vfprintf.c:364[ vfprintf.c:725 ]
	;;
#0:	       add	r15, r11 -> r11 ; vfprintf.c:356[ vfprintf.c:725 ]
	;;
#0:	       stm.a	r4, r11, 30     ; vfprintf.c:356[ vfprintf.c:725 ]
#1:	       ldiu	1280 -> r11     ; vfprintf.c:356[ vfprintf.c:725 ]
	;;
#0:	       add	r15, r11 -> r11 ; vfprintf.c:356[ vfprintf.c:725 ]
	;;
#0:	       stm.a	r4, r11, 2      ; vfprintf.c:356[ vfprintf.c:725 ]
	;;
#0:	       stm.a	r3, r11, 0      ; vfprintf.c:357[ vfprintf.c:725 ]
	;;
#0:	       stm.a	r3, r11, 3      ; vfprintf.c:357[ vfprintf.c:725 ]
	;;
#0:	       stm.a	0, r11, 4       ; vfprintf.c:358[ vfprintf.c:725 ]
	;;
#0:	       callg	__vfprintf_r    ; vfprintf.c:364[ vfprintf.c:725 ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       cmplt	r0, 0 -> c1     ; vfprintf.c:365[ vfprintf.c:725 ]
#1:	       or	r0, 0 -> r10    ; vfprintf.c:364[ vfprintf.c:725 ]
	;;
#0:	if  c1 br @	.BB11_21
	;;
.BB11_19:                               ; %bb.i
#0:	       ldiu	1248 -> r11
#1:	       callg	__fflush_r      ; vfprintf.c:365[ vfprintf.c:725 ]
	;;
#0:	       add	r15, r11 -> r11
	;;
#0:	       add	r11, 24 -> r0
	;;
	       nop	0
	;;
#0:	       brz eq @	r0, .BB11_21    ; vfprintf.c:365[ vfprintf.c:725 ]
	;;
.BB11_20:                               ; %bb2.i
#0:	       ldi	-1 -> r10
	;;
.BB11_21:                               ; %bb3.i
#0:	       ldiu	1280 -> r1
	;;
#0:	       add	r15, r1 -> r1
	;;
#0:	       add	r1, 4 -> r0
#1:	       ldga	2048 -> r1
	;;
#0:	       add	r15, r1 -> r1
	;;
#0:	       ldm.f	r1, -764
	;;
#0:	       ldx	$memhu, r0 -> r0
	;;
#0:	       btest	r0, 6 -> c1     ; vfprintf.c:367[ vfprintf.c:725 ]
	;;
#0:	if !c1 br @	.BB11_23
	;;
.BB11_22:                               ; %bb4.i403
#0:	       ldm.s	r15, 60         ; vfprintf.c:368[ vfprintf.c:725 ]
#1:	       ldiu	lo11{ ___mem_emergency } -> r1 ; vfprintf.c:368[ vfprintf.c:725 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:368[ vfprintf.c:725 ]
	;;
#0:	       ldm.f	r0, 12          ; vfprintf.c:368[ vfprintf.c:725 ]
	;;
#1:	       ldx	$mem, 0 -> r1.31 ; vfprintf.c:368[ vfprintf.c:725 ]
	;;
#1:	       stm.a	r1.31, r1, 0    ; vfprintf.c:368[ vfprintf.c:725 ]
	;;
#0:	       ldm.s	r15, 24         ; vfprintf.c:368[ vfprintf.c:725 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:368[ vfprintf.c:725 ]
	;;
#0:	       ldmg.d	___mem_emergency ; vfprintf.c:368[ vfprintf.c:725 ]
	;;
#0:	       ldx	$memhu, r1 -> r2 ; vfprintf.c:368[ vfprintf.c:725 ]
#1:	       ldi	64 -> r1
	;;
#0:	       or	r2, r1 -> r1    ; vfprintf.c:368[ vfprintf.c:725 ]
	;;
#0:	       stmh.a	r1, r0, 6       ; vfprintf.c:368[ vfprintf.c:725 ]
	;;
.BB11_23:                               ; %__sbprintf.exit
#0:	       or	r10, 0 -> r0
	;;
.BB11_24:                               ; %__sbprintf.exit
#0:	       ldga	2048 -> r1      ; vfprintf.c:1622
	;;
#0:	       add	r15, r1 -> r1   ; vfprintf.c:1622
	;;
#0:	       ldm.s	r1, -672        ; vfprintf.c:1622
	;;
#3:	       ldx	$mem, 0 -> r3.31 ; vfprintf.c:1622
	;;
#3:	       stx	r3.31 -> $ro    ; vfprintf.c:1622
	;;
#0:	       ldm.s	r1, -668        ; vfprintf.c:1622
	;;
#0:	       ldx	$mem, 0 -> r0.31 ; vfprintf.c:1622
	;;
#0:	       stx	r0.31 -> $rb    ; vfprintf.c:1622
	;;
#0:	       ldm.s	r1, -664        ; vfprintf.c:1622
	;;
#1:	       ldx	$mem, 0 -> r1.31 ; vfprintf.c:1622
	;;
#1:	       stx	r1.31 -> $f13   ; vfprintf.c:1622
	;;
#0:	       ldm.s	r1, -660        ; vfprintf.c:1622
	;;
#2:	       ldx	$mem, 0 -> r2.31 ; vfprintf.c:1622
	;;
#2:	       stx	r2.31 -> $f12   ; vfprintf.c:1622
	;;
#0:	       ldm.s	r1, -656        ; vfprintf.c:1622
	;;
#3:	       ldx	$mem, 0 -> r3.31 ; vfprintf.c:1622
	;;
#3:	       stx	r3.31 -> $f11   ; vfprintf.c:1622
	;;
#0:	       ldm.s	r1, -652        ; vfprintf.c:1622
	;;
#0:	       ldx	$mem, 0 -> r0.31 ; vfprintf.c:1622
	;;
#0:	       stx	r0.31 -> $f10   ; vfprintf.c:1622
	;;
#0:	       ldm.s	r1, -648        ; vfprintf.c:1622
	;;
#1:	       ldx	$mem, 0 -> r1.30 ; vfprintf.c:1622
	;;
#0:	       ldm.s	r1, -644        ; vfprintf.c:1622
	;;
#2:	       ldx	$mem, 0 -> r2.29 ; vfprintf.c:1622
	;;
#0:	       ldm.s	r1, -640        ; vfprintf.c:1622
	;;
#1:	       ldx	$mem, 0 -> r1.29 ; vfprintf.c:1622
	;;
#0:	       ldm.s	r1, -636        ; vfprintf.c:1622
	;;
#2:	       ldx	$mem, 0 -> r2.28 ; vfprintf.c:1622
	;;
#0:	       ldm.s	r1, -632        ; vfprintf.c:1622
	;;
#1:	       ldx	$mem, 0 -> r1.28 ; vfprintf.c:1622
	;;
#0:	       ldm.s	r1, -628        ; vfprintf.c:1622
	;;
#2:	       ldx	$mem, 0 -> r2.27 ; vfprintf.c:1622
	;;
#0:	       ldm.s	r1, -624        ; vfprintf.c:1622
	;;
#1:	       ldx	$mem, 0 -> r1.27 ; vfprintf.c:1622
	;;
#0:	       ldm.s	r1, -620        ; vfprintf.c:1622
	;;
#0:	       ldx	$mem, 0 -> r0.27 ; vfprintf.c:1622
	;;
#0:	       ldm.s	r1, -616        ; vfprintf.c:1622
	;;
#2:	       ldx	$mem, 0 -> r2.26 ; vfprintf.c:1622
	;;
#0:	       ldm.s	r1, -612        ; vfprintf.c:1622
	;;
#1:	       ldx	$mem, 0 -> r1.26 ; vfprintf.c:1622
	;;
#0:	       ldm.s	r1, -608        ; vfprintf.c:1622
	;;
#0:	       ldx	$mem, 0 -> r0.26 ; vfprintf.c:1622
	;;
#0:	       ldm.s	r1, -604        ; vfprintf.c:1622
	;;
#2:	       ldx	$mem, 0 -> r2.25 ; vfprintf.c:1622
	;;
#0:	       ldm.s	r1, -600        ; vfprintf.c:1622
	;;
#1:	       ldx	$mem, 0 -> r1.25 ; vfprintf.c:1622
	;;
#0:	       ldm.s	r1, -596        ; vfprintf.c:1622
	;;
#0:	       ldx	$mem, 0 -> r0.25 ; vfprintf.c:1622
	;;
#0:	       ldm.s	r1, -592        ; vfprintf.c:1622
	;;
#2:	       ldx	$mem, 0 -> r2.24 ; vfprintf.c:1622
	;;
#0:	       ldm.s	r1, -588        ; vfprintf.c:1622
	;;
#1:	       ldx	$mem, 0 -> r1.24 ; vfprintf.c:1622
	;;
#0:	       ldm.s	r1, -584        ; vfprintf.c:1622
	;;
#0:	       ldx	$mem, 0 -> r0.24 ; vfprintf.c:1622
	;;
#0:	       ldm.s	r1, -580        ; vfprintf.c:1622
	;;
#3:	       ldx	$mem, 0 -> r3.23 ; vfprintf.c:1622
	;;
#0:	       ldm.s	r1, -576        ; vfprintf.c:1622
	;;
#2:	       ldx	$mem, 0 -> r2.23 ; vfprintf.c:1622
	;;
#0:	       ldm.s	r1, -572        ; vfprintf.c:1622
	;;
#1:	       ldx	$mem, 0 -> r1.23 ; vfprintf.c:1622
	;;
#0:	       ldm.s	r1, -568        ; vfprintf.c:1622
	;;
#0:	       ldx	$mem, 0 -> r0.23 ; vfprintf.c:1622
	;;
#0:	       ldm.s	r1, -564        ; vfprintf.c:1622
	;;
#0:	       ldx	$mem, 0 -> r14  ; vfprintf.c:1622
	;;
#0:	       ldm.s	r1, -560        ; vfprintf.c:1622
	;;
#0:	       ldx	$mem, 0 -> r13  ; vfprintf.c:1622
	;;
#0:	       ldm.s	r1, -556        ; vfprintf.c:1622
	;;
#0:	       ldx	$mem, 0 -> r12  ; vfprintf.c:1622
	;;
#0:	       ldm.s	r1, -552        ; vfprintf.c:1622
	;;
#0:	       ldx	$mem, 0 -> r11  ; vfprintf.c:1622
	;;
#0:	       ldm.s	r1, -548        ; vfprintf.c:1622
#1:	       ldiu	1536 -> r1      ; vfprintf.c:1622
	;;
#0:	       add	r15, r1 -> r15  ; vfprintf.c:1622
	;;
#0:	       jop	ret             ; vfprintf.c:1622
#1:	       ldx	$mem, 0 -> r10  ; vfprintf.c:1622
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB11_25:                               ; %bb11
#2:	       ldiu	128 -> r2
#3:	       fop	dzero -> d6
#0:	       ldi	31 -> r0.23
#1:	       ldi	1 -> r1.30
	;;
#3:	       add	r15, r2 -> r2
#0:	       ldi	102 -> r0.27
#2:	       ldi	-1 -> r2.29
#1:	       ldi	-32 -> r1.23
	;;
#1:	       add	r2, 8 -> r1.28
#0:	       ldiu	192 -> r2
#2:	       ldi	88 -> r2.23
#3:	       fop	dzero -> d5
	;;
#0:	       add	r15, r2 -> r2
#1:	       ldi	37 -> r1.24
	;;
#0:	       add	r2, 28 -> r0
#1:	       ldiu	192 -> r2
	;;
#2:	       add	r15, r2 -> r2
#3:	       stm.s	r0, r15, 8
#0:	       or	r0, 2 -> r0.26
#1:	       or	r0, 3 -> r1.27
	;;
#0:	       add	r2, 8 -> r1
#1:	       ldiu	128 -> r2       ; vfprintf.c:742
	;;
#0:	       add	r15, r2 -> r2   ; vfprintf.c:742
#1:	       or	r1, 4 -> r0     ; vfprintf.c:744
#2:	       ldiu	128 -> r1       ; vfprintf.c:743
	;;
#1:	       stm.a	r1.28, r2, 18   ; vfprintf.c:742
#2:	       add	r2, 8 -> r2.26
#0:	       add	r2, 7 -> r0.25
#3:	       ldiu	224 -> r2
	;;
#0:	       stm.s	r0, r15, 14     ; vfprintf.c:743
#1:	       add	r15, r1 -> r1   ; vfprintf.c:743
#2:	       add	r15, r2 -> r2
	;;
#0:	       stm.a	0, r1, 20       ; vfprintf.c:743
#2:	       add	r2, 0 -> r2.27
#1:	       add	r2, 23 -> r1.29
#3:	       ldiu	224 -> r2
	;;
#0:	       stm.a	0, r0, 0        ; vfprintf.c:744
#1:	       ldi	0 -> r0
#2:	       add	r15, r2 -> r2
	;;
#0:	       stm.s	r0, r15, 12
#2:	       add	r2, 22 -> r2.28
	;;
#0:	       stm.s	r0, r15, 7
	;;
#0:	       stm.s	r0, r15, 10
	;;
.BB11_26:                               ; %bb13.outer
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB11_354 Depth 2
                                        ;     Child Loop BB11_34 Depth 2
                                        ;       Child Loop BB11_45 Depth 3
                                        ;         Child Loop BB11_54 Depth 4
                                        ;           Child Loop BB11_46 Depth 5
                                        ;           Child Loop BB11_52 Depth 5
                                        ;     Child Loop BB11_167 Depth 2
                                        ;     Child Loop BB11_165 Depth 2
                                        ;     Child Loop BB11_163 Depth 2
                                        ;     Child Loop BB11_148 Depth 2
                                        ;     Child Loop BB11_155 Depth 2
                                        ;     Child Loop BB11_151 Depth 2
                                        ;     Child Loop BB11_114 Depth 2
                                        ;     Child Loop BB11_111 Depth 2
                                        ;     Child Loop BB11_197 Depth 2
                                        ;     Child Loop BB11_188 Depth 2
                                        ;     Child Loop BB11_193 Depth 2
                                        ;     Child Loop BB11_185 Depth 2
                                        ;     Child Loop BB11_201 Depth 2
                                        ;     Child Loop BB11_199 Depth 2
                                        ;     Child Loop BB11_216 Depth 2
                                        ;     Child Loop BB11_234 Depth 2
                                        ;     Child Loop BB11_243 Depth 2
                                        ;     Child Loop BB11_301 Depth 2
                                        ;     Child Loop BB11_338 Depth 2
                                        ;     Child Loop BB11_284 Depth 2
                                        ;     Child Loop BB11_319 Depth 2
                                        ;     Child Loop BB11_265 Depth 2
#1:	       or	r1.28, 0 -> r0
#0:	       br	.BB11_34
#2:	       ldi	-1 -> r10
	;;
#0:	       stm.s	r0, r15, 17
	;;
	       nop	0
	;;
.BB11_27:                               ; %bb112
                                        ;   in Loop: Header=BB11_34 Depth=2
#0:	       ldm.s	r15, 76         ; vfprintf.c:1230
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1230
	;;
#0:	       btest	r0, 4 -> c1     ; vfprintf.c:1230
	;;
#0:	if !c1 br @	.BB11_29
	;;
.BB11_28:                               ; %bb113
                                        ;   in Loop: Header=BB11_34 Depth=2
#0:	       ldm.f	r14, 0          ; vfprintf.c:1231
#1:	       add	r14, 4 -> r14   ; vfprintf.c:1231
#2:	       or	r11, 0 -> r13
#3:	       ldi	-1 -> r10
	;;
#0:	       br	.BB11_34
#1:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1231
#2:	       ldm.s	r15, 48         ; vfprintf.c:1231
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1231
	;;
#0:	       stm.a	r0, r1, 0       ; vfprintf.c:1231
	;;
.BB11_29:                               ; %bb114
                                        ;   in Loop: Header=BB11_34 Depth=2
#0:	       btest	r0, 6 -> c1     ; vfprintf.c:1232
#1:	       add	r14, 4 -> r2    ; vfprintf.c:1239
	;;
#0:	if !c1 br @	.BB11_32
	;;
.BB11_30:                               ; %bb115
                                        ;   in Loop: Header=BB11_34 Depth=2
#0:	       ldm.f	r14, 0          ; vfprintf.c:1233
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1233
#1:	       ldm.s	r15, 48         ; vfprintf.c:1233
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1233
	;;
#0:	       stmh.a	r0, r1, 0       ; vfprintf.c:1233
	;;
.BB11_31:                               ; %bb115
                                        ;   in Loop: Header=BB11_34 Depth=2
#0:	       or	r11, 0 -> r13
#1:	       br @	.BB11_34
#2:	       or	r2, 0 -> r14
#3:	       ldi	-1 -> r10
	;;
.BB11_32:                               ; %bb116
                                        ;   in Loop: Header=BB11_34 Depth=2
#0:	       ldm.f	r14, 0          ; vfprintf.c:1239
	;;
#0:	       br	.BB11_31
#1:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1239
#2:	       ldm.s	r15, 48         ; vfprintf.c:1239
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1239
	;;
#0:	       stm.a	r0, r1, 0       ; vfprintf.c:1239
	;;
.BB11_33:                               ; %bb14
                                        ;   in Loop: Header=BB11_34 Depth=2
#0:	       sub	r10, 1 -> r10
	;;
.BB11_34:                               ; %bb15
                                        ;   Parent Loop BB11_26 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB11_45 Depth 3
                                        ;         Child Loop BB11_54 Depth 4
                                        ;           Child Loop BB11_46 Depth 5
                                        ;           Child Loop BB11_52 Depth 5
#0:	       sub	r13, r10 -> r11
	;;
#0:	       ldm.f	r11, -1         ; vfprintf.c:772
#1:	       sub	r11, 1 -> r12
	;;
#0:	       ldx	$membu, r12 -> r0 ; vfprintf.c:772
	;;
#0:	       brz eq @	r0, .BB11_36
	;;
.BB11_35:                               ; %bb15
                                        ;   in Loop: Header=BB11_34 Depth=2
#0:	       bbh	zext8 r0 -> r1
	;;
#1:	       cmpne	r1, r1.24 -> c1
	;;
#0:	if  c1 br @	.BB11_33
	;;
.BB11_36:                               ; %bb17
                                        ;   in Loop: Header=BB11_34 Depth=2
#0:	       cmpeq	r10, -1 -> c1
	;;
#0:	if  c1 br @	.BB11_41
	;;
.BB11_37:                               ; %bb18
                                        ;   in Loop: Header=BB11_34 Depth=2
#0:	       ldm.s	r15, 68         ; vfprintf.c:776
#1:	       xor	r10, -1 -> r1
#2:	       ldiu	128 -> r2       ; vfprintf.c:776
	;;
#0:	       add	r15, r2 -> r2   ; vfprintf.c:776
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:776
	;;
#0:	       stm.a	r13, r0, 0      ; vfprintf.c:776
	;;
#0:	       stm.a	r1, r0, 1       ; vfprintf.c:776
	;;
#0:	       ldm.f	r15, 208        ; vfprintf.c:776
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:776
	;;
#0:	       sub	r0, r10 -> r0
	;;
#0:	       sub	r0, 1 -> r0
	;;
#0:	       stm.a	r0, r2, 20      ; vfprintf.c:776
	;;
#0:	       ldm.s	r15, 56         ; vfprintf.c:776
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:776
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:776
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:776
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:776
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:776
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:776
	;;
#0:	if !c1 br @	.BB11_39
	;;
.BB11_38:                               ;   in Loop: Header=BB11_34 Depth=2
#0:	       ldm.s	r15, 68         ; vfprintf.c:776
	;;
#0:	       br	.BB11_40
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:776
	;;
#0:	       add	r0, 8 -> r0     ; vfprintf.c:776
	;;
#0:	       stm.s	r0, r15, 17
	;;
.BB11_39:                               ; %bb19
                                        ;   in Loop: Header=BB11_34 Depth=2
#0:	       ldiu	128 -> r13
	;;
#0:	       add	r15, r13 -> r13
	;;
#0:	       add	r13, 8 -> r0
#1:	       ldiu	192 -> r13
	;;
#0:	       stm.s	r0, r15, 17
#1:	       add	r15, r13 -> r13
	;;
#0:	       ldm.s	r15, 60         ; vfprintf.c:776
#1:	       add	r13, 8 -> r1
	;;
#0:	       callg	___sprint_r     ; vfprintf.c:776
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:776
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:776
	;;
#0:	if  c3 br @	.BB11_364       ; vfprintf.c:776
	;;
.BB11_40:                               ; %bb22
                                        ;   in Loop: Header=BB11_34 Depth=2
#0:	       ldm.f	r11, -1
	;;
#0:	       ldx	$membu, r12 -> r0
#1:	       ldm.s	r15, 48
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       sub	r1, r10 -> r1
	;;
#0:	       sub	r1, 1 -> r1
	;;
#0:	       stm.s	r1, r15, 12
	;;
.BB11_41:                               ; %bb23
                                        ;   in Loop: Header=BB11_34 Depth=2
#0:	       bbh	zext8 r0 -> r0  ; vfprintf.c:783
	;;
#0:	       cmpeq	r0, 0 -> c3     ; vfprintf.c:783
	;;
#0:	if  c3 br @	.BB11_361       ; vfprintf.c:783
	;;
.BB11_42:                               ; %bb24
                                        ;   in Loop: Header=BB11_34 Depth=2
#0:	       ldiu	224 -> r1       ; vfprintf.c:793
#1:	       ldi	0 -> r0
#2:	       ldi	-1 -> r12
	;;
#0:	       stm.s	r0, r15, 16
#1:	       add	r15, r1 -> r1   ; vfprintf.c:793
	;;
#0:	       br	.BB11_45
#1:	       stmb.a	0, r1, 12       ; vfprintf.c:793
	;;
#0:	       stm.s	r0, r15, 19
	;;
#0:	       stm.s	r0, r15, 18
	;;
.BB11_43:                               ; %bb46
                                        ;   in Loop: Header=BB11_45 Depth=3
#0:	       ldm.s	r15, 76         ; vfprintf.c:977
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:977
	;;
#0:	       or	r0, 16 -> r0    ; vfprintf.c:977
	;;
.BB11_44:                               ; %bb46
                                        ;   in Loop: Header=BB11_45 Depth=3
#0:	       stm.s	r0, r15, 19     ; vfprintf.c:977
	;;
.BB11_45:                               ; %rflag
                                        ;   Parent Loop BB11_26 Depth=1
                                        ;     Parent Loop BB11_34 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB11_54 Depth 4
                                        ;           Child Loop BB11_46 Depth 5
                                        ;           Child Loop BB11_52 Depth 5
#0:	       ldm.f	r11, 0          ; vfprintf.c:805
#1:	       br	.BB11_54
	;;
#0:	       ldx	$membs, r11 -> r13 ; vfprintf.c:805
#1:	       add	r11, 1 -> r11   ; vfprintf.c:805
	;;
	       nop	0
	;;
.BB11_46:                               ; %bb41
                                        ;   Parent Loop BB11_26 Depth=1
                                        ;     Parent Loop BB11_34 Depth=2
                                        ;       Parent Loop BB11_45 Depth=3
                                        ;         Parent Loop BB11_54 Depth=4
                                        ; =>        This Inner Loop Header: Depth=5
#1:	       ldm.f	r11, 0          ; vfprintf.c:938
#0:	       mul	r0, 10 -> $mul0.0
#2:	       ldi	-48 -> r1
	;;
#0:	       ldx	$mul0.0, r13 -> r0
	;;
#0:	       ldx	$membs, r11 -> r2 ; vfprintf.c:938
#1:	       add	r0, r1 -> r0    ; vfprintf.c:937
#2:	       add	r11, 1 -> r11
	;;
#0:	       add	r2, r1 -> r1
#1:	       or	r2, 0 -> r13
	;;
#0:	       cmpult	r1, 10 -> c1
	;;
#0:	if  c1 br @	.BB11_46
	;;
.BB11_47:                               ;   in Loop: Header=BB11_54 Depth=4
#0:	       or	r2, 0 -> r13
#1:	       br @	.BB11_54
#2:	       stm.s	r0, r15, 18
	;;
.BB11_48:                               ; %bb32
                                        ;   in Loop: Header=BB11_54 Depth=4
#0:	       ldm.f	r11, 0
#1:	       ldi	42 -> r1
#2:	       add	r11, 1 -> r3    ; vfprintf.c:880
	;;
#0:	       ldx	$membs, r11 -> r0
	;;
#0:	       cmpeq	r0, r1 -> c1    ; vfprintf.c:880
	;;
#0:	if  c1 br @	.BB11_65
	;;
.BB11_49:                               ; %bb37.preheader
                                        ;   in Loop: Header=BB11_54 Depth=4
#0:	       ldi	-48 -> r1
#1:	       ldi	9 -> r2
#2:	       ldi	0 -> r12
	;;
#0:	       add	r0, r1 -> r1
	;;
#0:	       cmpult	r2, r1 -> c1    ; vfprintf.c:919
	;;
#0:	if !c1 br @	.BB11_51
	;;
.BB11_50:                               ;   in Loop: Header=BB11_54 Depth=4
#0:	       or	r0, 0 -> r13
#1:	       br @	.BB11_53
#2:	       or	r3, 0 -> r11
	;;
.BB11_51:                               ; %bb36.preheader
                                        ;   in Loop: Header=BB11_54 Depth=4
#0:	       add	r11, 1 -> r11
#1:	       ldi	0 -> r12
	;;
.BB11_52:                               ; %bb36
                                        ;   Parent Loop BB11_26 Depth=1
                                        ;     Parent Loop BB11_34 Depth=2
                                        ;       Parent Loop BB11_45 Depth=3
                                        ;         Parent Loop BB11_54 Depth=4
                                        ; =>        This Inner Loop Header: Depth=5
#0:	       ldm.f	r11, 0
#1:	       mul	r12, 10 -> $mul1.0
#2:	       ldi	-48 -> r1
	;;
#1:	       ldx	$mul1.0, r0 -> r0
	;;
#0:	       ldx	$membs, r11 -> r13
#1:	       add	r0, r1 -> r12   ; vfprintf.c:920
#2:	       add	r11, 1 -> r11
	;;
#0:	       add	r13, r1 -> r0
	;;
#0:	       cmpult	r0, 10 -> c1
#1:	       or	r13, 0 -> r0
	;;
#0:	if  c1 br @	.BB11_52
	;;
.BB11_53:                               ; %bb38
                                        ;   in Loop: Header=BB11_54 Depth=4
#0:	       cmplt	r12, -1 -> c1
#1:	       ldi	-1 -> r0
	;;
#0:	if  c1 or	r0, 0 -> r12    ; vfprintf.c:923
	;;
.BB11_54:                               ; %reswitch
                                        ;   Parent Loop BB11_26 Depth=1
                                        ;     Parent Loop BB11_34 Depth=2
                                        ;       Parent Loop BB11_45 Depth=3
                                        ; =>      This Loop Header: Depth=4
                                        ;           Child Loop BB11_46 Depth 5
                                        ;           Child Loop BB11_52 Depth 5
#0:	       cmplt	r0.23, r13 -> c1
	;;
#0:	if  c1 br @	.BB11_56
	;;
.BB11_55:                               ; %reswitch
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       cmpeq	r13, 0 -> c3
	;;
#0:	if !c3 br @	.BB11_209
#1:	if  c3 br @	.BB11_361
	;;
.BB11_56:                               ; %reswitch
                                        ;   in Loop: Header=BB11_54 Depth=4
#1:	       add	r13, r1.23 -> r1
	;;
#2:	       cmpult	r2.23, r1 -> c1
	;;
#0:	if  c1 br @	.BB11_209
	;;
.BB11_57:                               ; %reswitch
                                        ;   in Loop: Header=BB11_54 Depth=4
#0:	       ldga	.JTI11_0 -> r2
#1:	       ldi	0 -> r0
	;;
#0:	       s2add	r2, r1 -> r1
	;;
#0:	       ldm.d	r1, 0
#1:	       ldga	._.str642 -> r1
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       jop	brind	r2
	;;
.BB11_58:                               ; %bb25
                                        ;   in Loop: Header=BB11_45 Depth=3
#0:	       ldm.s	r15, 64         ; vfprintf.c:822
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:822
	;;
#0:	       bbh	zext8 r0 -> r0  ; vfprintf.c:822
	;;
#0:	       brz ne @	r0, .BB11_45    ; vfprintf.c:822
	;;
.BB11_59:                               ; %bb26
                                        ;   in Loop: Header=BB11_45 Depth=3
#0:	       ldiu	224 -> r2       ; vfprintf.c:823
#1:	       br	.BB11_45
#2:	       ldi	32 -> r0
	;;
#0:	       stm.s	r0, r15, 16     ; vfprintf.c:823
#1:	       add	r15, r2 -> r2   ; vfprintf.c:823
	;;
#0:	       stmb.a	r0, r2, 12      ; vfprintf.c:823
	;;
.BB11_60:                               ; %bb27
                                        ;   in Loop: Header=BB11_45 Depth=3
#0:	       ldm.s	r15, 76         ; vfprintf.c:826
#1:	       br	.BB11_44
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:826
	;;
#0:	       or	r0, 1 -> r0     ; vfprintf.c:826
	;;
.BB11_61:                               ; %bb28
                                        ;   in Loop: Header=BB11_45 Depth=3
#0:	       ldm.f	r14, 0          ; vfprintf.c:865
#1:	       ldi	-1 -> r1
#2:	       add	r14, 4 -> r14   ; vfprintf.c:865
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:865
	;;
#0:	       cmplt	r1, r0 -> c1
#1:	       stm.s	r0, r15, 18     ; vfprintf.c:865
	;;
#0:	if  c1 br @	.BB11_45
	;;
.BB11_62:                               ; %bb29
                                        ;   in Loop: Header=BB11_45 Depth=3
#0:	       ldi	0 -> r1
	;;
#0:	       sub	r1, r0 -> r0    ; vfprintf.c:871
	;;
#0:	       stm.s	r0, r15, 18
	;;
.BB11_63:                               ; %bb30
                                        ;   in Loop: Header=BB11_45 Depth=3
#0:	       ldm.s	r15, 76         ; vfprintf.c:874
#1:	       br	.BB11_44
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:874
	;;
#0:	       or	r0, 4 -> r0     ; vfprintf.c:874
	;;
.BB11_64:                               ; %bb31
                                        ;   in Loop: Header=BB11_45 Depth=3
#0:	       ldiu	224 -> r1       ; vfprintf.c:877
#1:	       br	.BB11_45
#2:	       ldi	43 -> r0
	;;
#0:	       stm.s	r0, r15, 16     ; vfprintf.c:877
#1:	       add	r15, r1 -> r1   ; vfprintf.c:877
	;;
#0:	       stmb.a	r0, r1, 12      ; vfprintf.c:877
	;;
.BB11_65:                               ; %bb33
                                        ;   in Loop: Header=BB11_45 Depth=3
#0:	       ldm.f	r14, 0          ; vfprintf.c:910
#1:	       ldi	-1 -> r0
#2:	       add	r14, 4 -> r14   ; vfprintf.c:910
#3:	       or	r3, 0 -> r11
	;;
#0:	       ldx	$mem, 0 -> r12  ; vfprintf.c:910
	;;
#0:	       cmplt	r0, r12 -> c1   ; vfprintf.c:914
	;;
#0:	if  c1 br @	.BB11_45
	;;
.BB11_66:                               ; %bb34
                                        ;   in Loop: Header=BB11_45 Depth=3
#0:	       or	r3, 0 -> r11
#1:	       br @	.BB11_45
#2:	       ldi	-1 -> r12
	;;
.BB11_67:                               ; %bb39
                                        ;   in Loop: Header=BB11_45 Depth=3
#0:	       ldi	128 -> r1
	;;
.BB11_68:                               ; %bb39
                                        ;   in Loop: Header=BB11_45 Depth=3
#0:	       ldm.s	r15, 76         ; vfprintf.c:931
#1:	       br	.BB11_44
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:931
	;;
#0:	       or	r0, r1 -> r0    ; vfprintf.c:931
	;;
.BB11_69:                               ; %bb43
                                        ;   in Loop: Header=BB11_45 Depth=3
#0:	       ldm.s	r15, 76         ; vfprintf.c:955
#1:	       br	.BB11_44
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:955
	;;
#0:	       or	r0, 8 -> r0     ; vfprintf.c:955
	;;
.BB11_70:                               ; %bb44
                                        ;   in Loop: Header=BB11_45 Depth=3
#0:	       ldi	64 -> r1
#1:	       br @	.BB11_68
	;;
.BB11_71:                               ; %bb47
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.f	r14, 0          ; vfprintf.c:1036
#1:	       s2add	r15, 24 -> r3
#2:	       ldi	0 -> r0
#3:	       ldi	99 -> r13
	;;
#0:	       add	r3, 0 -> r2
#2:	       add	r14, 4 -> r2.24 ; vfprintf.c:1036
#1:	       ldi	1 -> r12
	;;
#0:	       ldx	$membu, r14 -> r1 ; vfprintf.c:1036
#1:	       stm.s	r0, r15, 16
	;;
#0:	       stm.s	r2, r15, 13     ; vfprintf.c:1036
#1:	       s2add	r15, 24 -> r2   ; vfprintf.c:1036
	;;
#0:	       br	.BB11_160
#1:	       stmb.a	r1, r2, 0       ; vfprintf.c:1036
#2:	       ldiu	224 -> r1       ; vfprintf.c:1039
	;;
#0:	       add	r15, r1 -> r1   ; vfprintf.c:1039
	;;
#0:	       stmb.a	0, r1, 12       ; vfprintf.c:1039
	;;
.BB11_72:                               ; %bb49
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 76         ; vfprintf.c:1042
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1042
	;;
#0:	       or	r0, 16 -> r0    ; vfprintf.c:1042
	;;
#0:	       stm.s	r0, r15, 19
	;;
.BB11_73:                               ; %bb50
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 76         ; vfprintf.c:1046
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1046
	;;
#0:	       btest	r0, 4 -> c1     ; vfprintf.c:1046
	;;
#0:	if !c1 br @	.BB11_75
	;;
.BB11_74:                               ; %bb51
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.f	r14, 0          ; vfprintf.c:1046
#1:	       br	.BB11_76
	;;
#0:	       ldx	$mem, 0 -> r10  ; vfprintf.c:1046
	;;
	       nop	0
	;;
.BB11_75:                               ; %bb52
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.f	r14, 0          ; vfprintf.c:1046
#1:	       btest	r0, 6 -> c1     ; vfprintf.c:1046
	;;
#0:	       ldx	$mem, 0 -> r10  ; vfprintf.c:1046
	;;
#0:	if  c1 bbh	sext16 r10 -> r10
	;;
.BB11_76:                               ; %bb56
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldi	-1 -> r0
#2:	       add	r14, 4 -> r2.24
#1:	       ldi	1 -> r2
	;;
#0:	       cmplt	r0, r10 -> c1   ; vfprintf.c:1050
	;;
#0:	if  c1 br @	.BB11_182
	;;
.BB11_77:                               ; %bb57
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldi	0 -> r1
#1:	       ldi	45 -> r0
#2:	       ldi	1 -> r2
	;;
#0:	       br	.BB11_182
#1:	       sub	r1, r10 -> r10  ; vfprintf.c:1054
#2:	       ldiu	224 -> r1       ; vfprintf.c:1055
#3:	       stm.s	r0, r15, 16     ; vfprintf.c:1054
	;;
#0:	       add	r15, r1 -> r1   ; vfprintf.c:1055
	;;
#0:	       stmb.a	r0, r1, 12      ; vfprintf.c:1055
	;;
.BB11_78:                               ; %bb59
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.f	r14, 0          ; vfprintf.c:1071
#1:	       s2add	r15, 16 -> r5
	;;
#0:	       add	r5, 16 -> r0
#2:	       add	r14, 8 -> r2.24 ; vfprintf.c:1071
	;;
#0:	       ldx	$mem, 0 -> r2   ; vfprintf.c:1071
#1:	       ldm.f	r14, 4          ; vfprintf.c:1071
#2:	       or	r0, 4 -> r3
	;;
#0:	       stx	r2 -> $f10      ; vfprintf.c:1071
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1071
#1:	       ldx	$f10 -> r0
	;;
#0:	       stx	r1 -> $f0       ; vfprintf.c:1071
	;;
#0:	       fop	fmov	f0 -> f11 ; vfprintf.c:1071
#1:	       stm.a	r0, r15, 20
	;;
#0:	       ldx	$f11 -> r0
	;;
#0:	       stm.a	r0, r3, 0
#1:	       ldga	0 -> r0
	;;
#0:	       ldm.f	r3, 0
#1:	       ldih	1024 -> r0
	;;
#0:	       ldx	$mem, 0 -> r1
#1:	       ldm.f	r15, 80
	;;
#0:	       cmpeq	r1, r0 -> c1
	;;
#0:	if  c1 br @	.BB11_80
#1:	       ldx	$mem, 0 -> r4
	;;
.BB11_79:                               ; %bb59
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       brz ne @	r1, .BB11_81
	;;
.BB11_80:                               ; %bb1.i11
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       brz eq @	r4, .BB11_91    ; s_fpclassify.c:16[ vfprintf.c:1079 ]
	;;
.BB11_81:                               ; %bb3.i12
                                        ;   in Loop: Header=BB11_26 Depth=1
#1:	       ldiu	0 -> r2
#2:	       ldga	1048576 -> r0
#0:	       ldga	0 -> r0.16
#3:	       ldiu	0 -> r5
	;;
#1:	       ldim	1536 -> r2
#2:	       ldih	1023 -> r0
#0:	       ldih	1023 -> r0.16
#3:	       ldga	1048576 -> r3
	;;
#0:	       add	r1, r2 -> r2
#1:	       add	r1, r0 -> r0
	;;
#0:	       cmpult	r2, r0.16 -> c2
	;;
#0:	       cmpult	r0, r0.16 -> c1
	;;
#0:	       comb	or c2, c1 -> c1
	;;
#0:	if  c1 br @	.BB11_91
	;;
.BB11_82:                               ; %bb6.i14
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldim	512 -> r5
#1:	       ldih	1024 -> r3
	;;
#0:	       cmpult	r1, r5 -> c2
#1:	       cmplt	r1, r3 -> c1
	;;
#0:	       comb	or c2, c1 -> c1
	;;
#0:	if  c1 br @	.BB11_91
	;;
.BB11_83:                               ; %bb9.i15
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldiu	2047 -> r0
	;;
#0:	       ldim	1535 -> r0
	;;
#0:	       cmplt	r0, r1 -> c1
	;;
#0:	if  c1 br @	.BB11_85
	;;
.BB11_84:                               ; %bb9.i15
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldga	0 -> r0
	;;
#0:	       ldih	1024 -> r0
	;;
#0:	       cmpeq	r1, r0 -> c1
	;;
#0:	if !c1 br @	.BB11_94
#1:	if  c1 br @	.BB11_93
	;;
.BB11_85:                               ; %bb9.i15
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldiu	0 -> r0
	;;
#0:	       ldim	1536 -> r0
	;;
#0:	       cmpeq	r1, r0 -> c1
	;;
#0:	if  c1 br @	.BB11_88
	;;
.BB11_86:                               ; %bb9.i15
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       brz eq @	r1, .BB11_93
	;;
.BB11_87:                               ; %bb9.i15
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldga	1048576 -> r0
	;;
#0:	       ldih	1023 -> r0
	;;
#0:	       cmpne	r1, r0 -> c1
	;;
#0:	if  c1 br @	.BB11_94
	;;
.BB11_88:                               ; %__fpclassifyd.exit
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       brz ne @	r4, .BB11_91    ; vfprintf.c:1079
	;;
.BB11_89:                               ; %bb60
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       fop	dzero -> d0
#1:	       ldga	._.str36 -> r2
	;;
#0:	       fop	dcmp	d5, d0 -> f0 ; vfprintf.c:1080
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r0       ; vfprintf.c:1080
	;;
#0:	       btest	r0, 13 -> c1    ; vfprintf.c:1080
	;;
#0:	if !c1 ldiu	224 -> r1       ; vfprintf.c:1081
#1:	if !c1 ldi	45 -> r0
	;;
#0:	if !c1 stm.s	r0, r15, 16     ; vfprintf.c:1081
#1:	if !c1 add	r15, r1 -> r1   ; vfprintf.c:1081
	;;
#0:	if !c1 stmb.a	r0, r1, 12      ; vfprintf.c:1081
#1:	       ldi	72 -> r0
#2:	       ldi	-129 -> r1
	;;
#0:	       cmplt	r13, r0 -> c1
#1:	       ldga	._.str137 -> r0
	;;
.BB11_90:                               ; %bb62
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	if  c1 or	r2, 0 -> r0
#1:	       ldi	3 -> r12
	;;
#0:	       stm.s	r0, r15, 13     ; vfprintf.c:1087
	;;
#0:	       ldm.s	r15, 76         ; vfprintf.c:1087
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1087
	;;
#0:	       and	r0, r1 -> r0    ; vfprintf.c:1087
	;;
#0:	       br	.BB11_210
#1:	       stm.s	r0, r15, 19
#2:	       ldi	0 -> r0
	;;
#0:	       stm.s	r0, r15, 11
	;;
#3:	       or	r0, 0 -> r3.23
	;;
.BB11_91:                               ; %bb66
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldga	0 -> r0
	;;
#0:	       ldih	1024 -> r0
	;;
#0:	       cmpeq	r1, r0 -> c1
	;;
#0:	if  c1 br @	.BB11_93
	;;
.BB11_92:                               ; %bb66
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       brz ne @	r1, .BB11_94
	;;
.BB11_93:                               ; %bb1.i21
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       brz eq @	r4, .BB11_100   ; s_fpclassify.c:16[ vfprintf.c:1090 ]
	;;
.BB11_94:                               ; %bb3.i22
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldiu	0 -> r2
#2:	       ldga	1048576 -> r0
#1:	       ldga	0 -> r1.16
#3:	       ldiu	0 -> r5
	;;
#0:	       ldim	1536 -> r2
#2:	       ldih	1023 -> r0
#1:	       ldih	1023 -> r1.16
#3:	       ldga	1048576 -> r3
	;;
#0:	       add	r1, r2 -> r2
#1:	       add	r1, r0 -> r0
	;;
#1:	       cmpult	r2, r1.16 -> c2
	;;
#1:	       cmpult	r0, r1.16 -> c1
	;;
#0:	       comb	or c2, c1 -> c1
	;;
#0:	if  c1 br @	.BB11_100
	;;
.BB11_95:                               ; %bb6.i25
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldim	512 -> r5
#1:	       ldih	1024 -> r3
	;;
#0:	       cmpult	r1, r5 -> c2
#1:	       cmplt	r1, r3 -> c1
	;;
#0:	       comb	or c2, c1 -> c1
	;;
#0:	if  c1 br @	.BB11_100
	;;
.BB11_96:                               ; %bb9.i26
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldiu	0 -> r0
	;;
#0:	       ldim	1536 -> r0
	;;
#0:	       cmpeq	r1, r0 -> c1
	;;
#0:	if  c1 br @	.BB11_98
	;;
.BB11_97:                               ; %bb9.i26
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldga	1048576 -> r0
	;;
#0:	       ldih	1023 -> r0
	;;
#0:	       cmpne	r1, r0 -> c1
	;;
#0:	if  c1 br @	.BB11_99
	;;
.BB11_98:                               ; %__fpclassifyd.exit32
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       brz eq @	r4, .BB11_100   ; vfprintf.c:1090
	;;
.BB11_99:                               ; %bb67
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldi	72 -> r0
#1:	       br	.BB11_90
#2:	       ldga	._.str238 -> r2
#3:	       ldi	-129 -> r1
	;;
#0:	       cmplt	r13, r0 -> c1
#1:	       ldga	._.str339 -> r0
	;;
	       nop	0
	;;
.BB11_100:                              ; %bb71
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       cmpeq	r12, -1 -> c1   ; vfprintf.c:1152
#1:	       ldi	6 -> r10
	;;
#0:	if  c1 br @	.BB11_105
	;;
.BB11_101:                              ; %bb73
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldi	32 -> r0
#1:	       ldi	103 -> r1
	;;
#0:	       or	r13, r0 -> r0
	;;
#0:	       cmpeq	r0, r1 -> c1
	;;
#0:	if  c1 br @	.BB11_103
	;;
.BB11_102:                              ;   in Loop: Header=BB11_26 Depth=1
#0:	       or	r12, 0 -> r10
#1:	       br @	.BB11_105
	;;
.BB11_103:                              ; %bb75
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       or	r12, 0 -> r10
#1:	       brz ne @	r12, .BB11_105  ; vfprintf.c:1154
	;;
.BB11_104:                              ; %bb76
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldi	1 -> r10
	;;
.BB11_105:                              ; %bb77
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldiu	224 -> r14
#1:	       or	r15, 0 -> r0
#2:	       or	r10, 0 -> r2
#3:	       ldi	32 -> r12
	;;
#0:	       add	r15, r14 -> r14
	;;
#2:	       add	r14, 8 -> r2.25
#0:	       ldiu	224 -> r14
	;;
#0:	       add	r15, r14 -> r14
#2:	       stm.a	r2.25, r0, 0
	;;
#0:	       add	r14, 4 -> r1
#1:	       ldiu	192 -> r14
	;;
#0:	       stm.a	r1, r0, 1
#1:	       add	r15, r14 -> r14
	;;
#0:	       stm.a	r13, r0, 2
#1:	       add	r14, 24 -> r1
	;;
#0:	       stm.a	r1, r0, 3
#1:	       ldi	256 -> r1
	;;
#0:	       ldm.s	r15, 76         ; vfprintf.c:1158
	;;
#0:	       callg	_cvt45
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1158
	;;
#0:	       or	r0, r1 -> r0.24 ; vfprintf.c:1158
#1:	       ldx	$f10 -> r0
	;;
#1:	       ldx	$f11 -> r1
#0:	       or	r0.24, 0 -> r3
	;;
	       nop	0
	;;
#0:	       ldi	103 -> r14
#1:	       or	r13, r12 -> r1
#2:	       stm.s	r0, r15, 13
	;;
#0:	       cmpeq	r1, r14 -> c1
	;;
#0:	if  c1 br @	.BB11_107
	;;
.BB11_106:                              ;   in Loop: Header=BB11_26 Depth=1
#0:	       or	r13, 0 -> r14
#1:	       br @	.BB11_109
	;;
.BB11_107:                              ; %bb79
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.f	r15, 228        ; vfprintf.c:1164
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1164
	;;
#0:	       cmplt	r0, -3 -> c2
#1:	       cmplt	r10, r0 -> c1   ; vfprintf.c:1164
#2:	       stm.s	r0, r15, 11
	;;
#0:	       comb	or c2, c1 -> c1
	;;
#0:	if !c1 br @	.BB11_128
	;;
.BB11_108:                              ; %bb81
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       sub	r13, 2 -> r14
	;;
.BB11_109:                              ; %bb83
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldi	101 -> r0
	;;
#0:	       cmplt	r0, r14 -> c1   ; vfprintf.c:1173
	;;
#0:	if  c1 br @	.BB11_119
	;;
.BB11_110:                              ; %bb84
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.f	r15, 228        ; vfprintf.c:1174
#1:	       ldiu	128 -> r5       ; vfprintf.c:1174
#2:	       ldi	1 -> r1
#3:	       ldi	-1 -> r3
	;;
#0:	       add	r15, r5 -> r5   ; vfprintf.c:1174
#1:	       ldi	45 -> r2
#2:	       ldi	0 -> r13
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1174
	;;
#0:	       sub	r0, 1 -> r4
#1:	       sub	r1, r0 -> r10
#2:	       ldi	43 -> r1
	;;
#0:	       cmplt	r4, 0 -> c1     ; vfprintf.c:1743[ vfprintf.c:1175 ]
#1:	       stm.a	r4, r5, 25      ; vfprintf.c:1174
	;;
#0:	if !c1 add	r0, r3 -> r10
#1:	       ldm.s	r15, 32
#2:	if  c1 or	r2, 0 -> r1
#3:	       ldiu	192 -> r2       ; vfprintf.c:1742[ vfprintf.c:1175 ]
	;;
#0:	       cmplt	r10, 10 -> c1   ; vfprintf.c:1750[ vfprintf.c:1175 ]
#1:	       add	r15, r2 -> r2   ; vfprintf.c:1742[ vfprintf.c:1175 ]
	;;
#0:	if  c1 br	.BB11_116
#1:	       ldx	$mem, 0 -> r0
	;;
#0:	       or	r0, 1 -> r0
#1:	       stmb.a	r14, r2, 28     ; vfprintf.c:1742[ vfprintf.c:1175 ]
	;;
#0:	       stmb.a	r1, r0, 0
	;;
.BB11_111:                              ; %bb4.i
                                        ;   Parent Loop BB11_26 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       or	r10, 0 -> r0    ; vfprintf.c:1753[ vfprintf.c:1175 ]
#1:	       callg	___divsi3       ; vfprintf.c:1753[ vfprintf.c:1175 ]
#2:	       ldi	10 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldiu	224 -> r2
#1:	       or	r0, 0 -> r1.25  ; vfprintf.c:1753[ vfprintf.c:1175 ]
#2:	       or	r10, 0 -> r0    ; vfprintf.c:1752[ vfprintf.c:1175 ]
#3:	       ldi	10 -> r1
	;;
#0:	       callg	___modsi3       ; vfprintf.c:1752[ vfprintf.c:1175 ]
#1:	       add	r15, r2 -> r2
	;;
#0:	       add	r2, 16 -> r12
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldi	99 -> r2
#1:	       add	r13, 1 -> r1
#2:	       s2add	r0, 12 -> r3    ; vfprintf.c:1752[ vfprintf.c:1175 ]
#3:	       sub	r12, r13 -> r0
	;;
#0:	       cmplt	r2, r10 -> c1
#2:	       or	r1, 0 -> r13
#1:	       or	r1.25, 0 -> r10
#3:	       stmb.a	r3, r0, 6       ; vfprintf.c:1752[ vfprintf.c:1175 ]
	;;
#0:	if  c1 br @	.BB11_111
	;;
.BB11_112:                              ; %bb5.i
                                        ;   in Loop: Header=BB11_26 Depth=1
#2:	       sub	r2.28, r1 -> r2
#1:	       s2add	r1.25, 12 -> r3 ; vfprintf.c:1754[ vfprintf.c:1175 ]
	;;
#1:	       cmpule	r1.29, r2 -> c1 ; vfprintf.c:1755[ vfprintf.c:1175 ]
#2:	       stmb.a	r3, r0, 5       ; vfprintf.c:1754[ vfprintf.c:1175 ]
#0:	       or	r0.26, 0 -> r0
	;;
#0:	if  c1 br @	.BB11_117
	;;
.BB11_113:                              ;   in Loop: Header=BB11_26 Depth=1
#1:	       add	r1, 1 -> r4
#2:	       add	r1, 2 -> r5
#0:	       or	r0.26, 0 -> r0
	;;
.BB11_114:                              ; %bb6.i
                                        ;   Parent Loop BB11_26 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       sub	r12, r5 -> r3
#1:	       sub	r4, 1 -> r4
#2:	       sub	r5, 1 -> r5
	;;
#0:	       brz ne	r4, .BB11_114   ; vfprintf.c:1755[ vfprintf.c:1175 ]
#1:	       ldm.f	r3, 8           ; vfprintf.c:1755[ vfprintf.c:1175 ]
#2:	       add	r3, 8 -> r2
#3:	       add	r0, 1 -> r3
	;;
#0:	       ldx	$membu, r2 -> r2 ; vfprintf.c:1755[ vfprintf.c:1175 ]
	;;
#0:	       stmb.a	r2, r0, 0       ; vfprintf.c:1755[ vfprintf.c:1175 ]
#1:	       or	r3, 0 -> r0
	;;
.BB11_115:                              ; %bb7.bb10.loopexit_crit_edge.i
                                        ;   in Loop: Header=BB11_26 Depth=1
#1:	       add	r1.27, r1 -> r0
#0:	       br @	.BB11_117
	;;
.BB11_116:                              ; %bb9.i
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 32
#1:	       ldi	48 -> r2
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       or	r0, 2 -> r1
#1:	       s2add	r10, 12 -> r0   ; vfprintf.c:1760[ vfprintf.c:1175 ]
	;;
#0:	       stmb.a	r2, r1, 0       ; vfprintf.c:1759[ vfprintf.c:1175 ]
	;;
#1:	       stmb.a	r0, r1.27, 0    ; vfprintf.c:1760[ vfprintf.c:1175 ]
#2:	       or	r2.27, 0 -> r0
	;;
.BB11_117:                              ; %exponent.exit
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 32         ; vfprintf.c:1762[ vfprintf.c:1175 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1762[ vfprintf.c:1175 ]
	;;
#0:	       sub	r0, r1 -> r0    ; vfprintf.c:1762[ vfprintf.c:1175 ]
	;;
#0:	       stm.s	r0, r15, 7      ; vfprintf.c:1176
	;;
#0:	       ldm.f	r15, 216        ; vfprintf.c:1176
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1176
	;;
#0:	       add	r0, r1 -> r12   ; vfprintf.c:1176
#1:	       ldi	1 -> r0
	;;
#0:	       cmplt	r0, r1 -> c1    ; vfprintf.c:1177
	;;
#0:	if !c1 ldi	0 -> r0
	;;
#0:	if !c1 stm.s	r0, r15, 11     ; vfprintf.c:1177
	;;
#0:	if !c1 ldm.s	r15, 76         ; vfprintf.c:1177
	;;
#0:	if !c1 ldx	$mem, 0 -> r0   ; vfprintf.c:1177
	;;
#0:	if !c1 btest	r0, 0 -> c1     ; vfprintf.c:1177
	;;
#0:	if !c1 br @	.BB11_131
	;;
.BB11_118:                              ; %bb88
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldi	0 -> r0
#1:	       br	.BB11_131
#2:	       add	r12, 1 -> r12   ; vfprintf.c:1178
	;;
#0:	       stm.s	r0, r15, 11     ; vfprintf.c:1178
	;;
	       nop	0
	;;
.BB11_119:                              ; %bb89
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.f	r15, 228        ; vfprintf.c:1184
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1184
	;;
#0:	       stm.s	r0, r15, 11
#1:	       ldi	102 -> r0
	;;
#0:	       cmpne	r14, r0 -> c1   ; vfprintf.c:1183
	;;
#0:	if  c1 br @	.BB11_128
	;;
.BB11_120:                              ; %bb90
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 44         ; vfprintf.c:1184
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1184
	;;
#0:	       cmplt	r0, 1 -> c1     ; vfprintf.c:1184
	;;
#0:	if  c1 br @	.BB11_125
	;;
.BB11_121:                              ; %bb91
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       brz ne @	r10, .BB11_124  ; vfprintf.c:1186
	;;
.BB11_122:                              ; %bb92
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 76         ; vfprintf.c:1186
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1186
	;;
#0:	       btest	r0, 0 -> c1     ; vfprintf.c:1186
	;;
#0:	if  c1 br @	.BB11_124
	;;
.BB11_123:                              ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 44
#1:	       br	.BB11_131
	;;
#0:	       ldx	$mem, 0 -> r12
	;;
	       nop	0
	;;
.BB11_124:                              ; %bb94
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 44         ; vfprintf.c:1187
	;;
#0:	       br	.BB11_131
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1187
	;;
#0:	       add	r10, r0 -> r0   ; vfprintf.c:1187
	;;
#0:	       add	r0, 1 -> r12    ; vfprintf.c:1187
	;;
.BB11_125:                              ; %bb95
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       brz ne @	r10, .BB11_127  ; vfprintf.c:1189
	;;
.BB11_126:                              ; %bb96
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 76         ; vfprintf.c:1189
#1:	       ldi	1 -> r12
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1189
	;;
#0:	       btest	r0, 0 -> c1     ; vfprintf.c:1189
	;;
#0:	if !c1 br @	.BB11_131
	;;
.BB11_127:                              ; %bb98
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       add	r10, 2 -> r12   ; vfprintf.c:1189
#1:	       br @	.BB11_131
	;;
.BB11_128:                              ; %bb101
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.f	r15, 216        ; vfprintf.c:1192
	;;
#0:	       ldx	$mem, 0 -> r3   ; vfprintf.c:1192
#1:	       ldm.s	r15, 44         ; vfprintf.c:1192
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1192
	;;
#0:	       cmplt	r0, r3 -> c1    ; vfprintf.c:1192
	;;
#0:	if  c1 br @	.BB11_130
	;;
.BB11_129:                              ; %bb102
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 76         ; vfprintf.c:1194
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1194
	;;
#0:	       br	.BB11_131
#1:	       ldm.s	r15, 44
#2:	       and	r0, 1 -> r1     ; vfprintf.c:1194
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       add	r0, r1 -> r12
	;;
.BB11_130:                              ; %bb105
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       cmplt	r0, 1 -> c1
#1:	       ldi	2 -> r2
#2:	       ldi	1 -> r1
	;;
#0:	if  c1 sub	r2, r0 -> r1
	;;
#0:	       add	r3, r1 -> r12   ; vfprintf.c:1197
	;;
.BB11_131:                              ; %bb110
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.f	r15, 232        ; vfprintf.c:1220
	;;
#2:	       ldx	$membu, r2.25 -> r0 ; vfprintf.c:1220
	;;
#0:	       brz ne @	r0, .BB11_133   ; vfprintf.c:1220
	;;
.BB11_132:                              ; %bb110.bb180_crit_edge
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldiu	224 -> r1
#1:	       ldm.f	r15, 236
	;;
#0:	       add	r15, r1 -> r1
	;;
#0:	       add	r1, 12 -> r0
	;;
#0:	       br	.BB11_134
#1:	       ldx	$membu, r0 -> r0
	;;
#0:	       stm.s	r0, r15, 16
	;;
#3:	       ldi	0 -> r3.23
	;;
.BB11_133:                              ; %bb111
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldiu	224 -> r1       ; vfprintf.c:1221
#1:	       ldi	45 -> r0
	;;
#0:	       stm.s	r0, r15, 16
#1:	       add	r15, r1 -> r1   ; vfprintf.c:1221
	;;
#3:	       ldi	0 -> r3.23
#0:	       stmb.a	r0, r1, 12      ; vfprintf.c:1221
	;;
.BB11_134:                              ; %bb111
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       or	r0.24, 0 -> r0
#1:	       br	.BB11_210
#2:	       or	r14, 0 -> r13
	;;
#0:	       stm.s	r0, r15, 19     ; vfprintf.c:1221
	;;
	       nop	0
	;;
.BB11_135:                              ; %bb117
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 76         ; vfprintf.c:1242
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1242
	;;
#0:	       or	r0, 16 -> r0    ; vfprintf.c:1242
	;;
#0:	       stm.s	r0, r15, 19
	;;
.BB11_136:                              ; %bb118
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 76         ; vfprintf.c:1245
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1245
	;;
#0:	       btest	r0, 4 -> c1     ; vfprintf.c:1245
	;;
#0:	if !c1 br @	.BB11_138
	;;
.BB11_137:                              ; %bb119
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.f	r14, 0          ; vfprintf.c:1245
#1:	       br	.BB11_139
	;;
#0:	       ldx	$mem, 0 -> r10  ; vfprintf.c:1245
	;;
	       nop	0
	;;
.BB11_138:                              ; %bb120
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.f	r14, 0          ; vfprintf.c:1245
#1:	       btest	r0, 6 -> c1
#2:	       ldiu	2047 -> r1
	;;
#0:	       ldim	31 -> r1
	;;
#0:	       ldx	$mem, 0 -> r10  ; vfprintf.c:1245
	;;
#0:	if  c1 and	r10, r1 -> r10
	;;
.BB11_139:                              ; %bb124
                                        ;   in Loop: Header=BB11_26 Depth=1
#2:	       add	r14, 4 -> r2.24
#0:	       br @	.BB11_181
#1:	       ldi	0 -> r2
	;;
.BB11_140:                              ; %bb125
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.f	r14, 0          ; vfprintf.c:1260
#1:	       s2add	r15, 16 -> r4
#2:	       ldi	48 -> r3
#3:	       ldi	120 -> r13
	;;
#0:	       add	r4, 28 -> r1
#2:	       add	r14, 4 -> r2.24 ; vfprintf.c:1260
#1:	       ldi	2 -> r2
	;;
#0:	       ldx	$mem, 0 -> r10  ; vfprintf.c:1260
#1:	       ldm.s	r15, 76         ; vfprintf.c:1263
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1263
	;;
#0:	       or	r0, 2 -> r0     ; vfprintf.c:1263
	;;
#0:	       stm.s	r0, r15, 19
#1:	       ldga	._.str440 -> r0
	;;
#0:	       br	.BB11_181
#1:	       stm.s	r0, r15, 10
#2:	       or	r1, 1 -> r0
#3:	       s2add	r15, 16 -> r1   ; vfprintf.c:1264
	;;
#0:	       stmb.a	r3, r1, 28      ; vfprintf.c:1264
	;;
#0:	       stmb.a	r13, r0, 0      ; vfprintf.c:1265
	;;
.BB11_141:                              ; %bb126
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldiu	224 -> r1       ; vfprintf.c:1271
#2:	       add	r14, 4 -> r2.24 ; vfprintf.c:1272
	;;
#0:	       add	r15, r1 -> r1   ; vfprintf.c:1271
	;;
#0:	       stmb.a	0, r1, 12       ; vfprintf.c:1271
	;;
#0:	       ldm.f	r14, 0          ; vfprintf.c:1272
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1272
	;;
#0:	       brz ne @	r0, .BB11_143   ; vfprintf.c:1278
#1:	       stm.s	r0, r15, 13     ; vfprintf.c:1278
	;;
.BB11_142:                              ; %bb127
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldi	6 -> r1
#1:	       ldi	0 -> r0
#2:	       ldi	115 -> r13
	;;
#0:	       br	.BB11_160
#1:	       cmpult	r1, r12 -> c1
#2:	       stm.s	r0, r15, 16
	;;
#0:	if  c1 or	r1, 0 -> r12
#1:	       ldga	._.str541 -> r1
	;;
#0:	       stm.s	r1, r15, 13
	;;
.BB11_143:                              ; %bb131
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldi	-1 -> r0
#1:	       ldi	0 -> r2
	;;
#0:	       cmplt	r0, r12 -> c1
	;;
#0:	if !c1 br @	.BB11_163
#1:	if  c1 br @	.BB11_148
	;;
.BB11_144:                              ; %bb.i2
                                        ;   in Loop: Header=BB11_148 Depth=2
#0:	       cmpeq	r12, r2 -> c1   ; memchr.c:87[ vfprintf.c:1353 ]
#1:	       ldi	0 -> r0
	;;
#0:	if !c1 br @	.BB11_146
#1:	       stm.s	r0, r15, 16     ; memchr.c:87[ vfprintf.c:1353 ]
	;;
.BB11_145:                              ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 64
#1:	       br	.BB11_160
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
	       nop	0
	;;
.BB11_146:                              ; %bb2.i3
                                        ;   in Loop: Header=BB11_148 Depth=2
#0:	       ldm.f	r1, 0           ; memchr.c:89[ vfprintf.c:1353 ]
	;;
#0:	       ldx	$membu, r1 -> r0 ; memchr.c:89[ vfprintf.c:1353 ]
	;;
#0:	       brz eq @	r0, .BB11_156   ; memchr.c:89[ vfprintf.c:1353 ]
	;;
.BB11_147:                              ; %bb4.i5
                                        ;   in Loop: Header=BB11_148 Depth=2
#0:	       add	r2, 1 -> r2
	;;
.BB11_148:                              ; %bb5.i7
                                        ;   Parent Loop BB11_26 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.s	r15, 52
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       add	r0, r2 -> r1
	;;
#0:	       and	r1, 3 -> r0     ; memchr.c:85[ vfprintf.c:1353 ]
	;;
#0:	       brz ne @	r0, .BB11_144   ; memchr.c:85[ vfprintf.c:1353 ]
	;;
.BB11_149:                              ; %bb6.i8
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       sub	r12, r2 -> r3
#1:	       ldi	3 -> r6
#2:	       ldm.s	r15, 52
	;;
#0:	       cmpult	r6, r3 -> c1    ; memchr.c:94[ vfprintf.c:1353 ]
	;;
#0:	if  c1 cmpult	r6, r3 -> c1    ; memchr.c:110[ vfprintf.c:1353 ]
#1:	       ldx	$mem, 0 -> r0
	;;
#0:	if !c1 br @	.BB11_155
#1:	if  c1 br @	.BB11_151
#2:	       add	r0, r2 -> r1
	;;
.BB11_150:                              ; %bb13.i
                                        ;   in Loop: Header=BB11_151 Depth=2
#0:	       cmpult	r6, r3 -> c1    ; memchr.c:110[ vfprintf.c:1353 ]
	;;
#0:	if !c1 br @	.BB11_155
	;;
.BB11_151:                              ; %bb10.i
                                        ;   Parent Loop BB11_26 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r1, 0           ; memchr.c:112[ vfprintf.c:1353 ]
#1:	       ldiu	1791 -> r5
#2:	       ldga	32896 -> r0
	;;
#0:	       ldim	991 -> r5
#1:	       ldih	1028 -> r0
	;;
#0:	       ldx	$mem, 0 -> r2   ; memchr.c:112[ vfprintf.c:1353 ]
#1:	       ldih	2039 -> r5
	;;
#0:	       and	r2, r0 -> r4
#1:	       add	r2, r5 -> r2
	;;
#0:	       xor	r4, r0 -> r0    ; memchr.c:112[ vfprintf.c:1353 ]
	;;
#0:	       and	r0, r2 -> r0    ; memchr.c:112[ vfprintf.c:1353 ]
	;;
#0:	       brz ne @	r0, .BB11_155   ; memchr.c:112[ vfprintf.c:1353 ]
	;;
.BB11_152:                              ; %bb12.i
                                        ;   in Loop: Header=BB11_151 Depth=2
#0:	       add	r1, 4 -> r1
#1:	       br @	.BB11_150
#2:	       sub	r3, 4 -> r3
	;;
.BB11_153:                              ; %bb15.i
                                        ;   in Loop: Header=BB11_155 Depth=2
#0:	       ldm.f	r1, 0           ; memchr.c:128[ vfprintf.c:1353 ]
	;;
#0:	       ldx	$membu, r1 -> r0 ; memchr.c:128[ vfprintf.c:1353 ]
	;;
#0:	       brz eq @	r0, .BB11_156   ; memchr.c:128[ vfprintf.c:1353 ]
	;;
.BB11_154:                              ; %bb17.i
                                        ;   in Loop: Header=BB11_155 Depth=2
#0:	       add	r1, 1 -> r1
#1:	       sub	r3, 1 -> r3
	;;
.BB11_155:                              ; %bb18.i
                                        ;   Parent Loop BB11_26 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       cmpeq	r3, 0 -> c3     ; memchr.c:126[ vfprintf.c:1353 ]
#1:	       ldi	0 -> r0
	;;
#0:	if !c3 br	.BB11_153       ; memchr.c:126[ vfprintf.c:1353 ]
#1:	if  c3 br	.BB11_210       ; memchr.c:126[ vfprintf.c:1353 ]
#2:	       stm.s	r0, r15, 16
	;;
#3:	       or	r0, 0 -> r3.23
#0:	       stm.s	r0, r15, 11
	;;
	       nop	0
	;;
.BB11_156:                              ; %memchr.exit
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       cmpeq	r1, 0 -> c3     ; vfprintf.c:1355
#1:	       ldi	0 -> r0
	;;
#0:	if  c3 br	.BB11_210       ; vfprintf.c:1355
#1:	       stm.s	r0, r15, 16
	;;
#3:	       or	r0, 0 -> r3.23
#0:	       stm.s	r0, r15, 11
	;;
	       nop	0
	;;
.BB11_157:                              ; %bb133
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldi	0 -> r0
	;;
#0:	       stm.s	r0, r15, 16     ; vfprintf.c:1356
	;;
#0:	       ldm.s	r15, 52         ; vfprintf.c:1356
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1356
	;;
#0:	       sub	r1, r0 -> r1    ; vfprintf.c:1356
	;;
#0:	       cmple	r1, r12 -> c1   ; vfprintf.c:1357
	;;
#0:	if !c1 br @	.BB11_159
	;;
.BB11_158:                              ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 64
#1:	       or	r1, 0 -> r12
	;;
#0:	       br	.BB11_210
#1:	       ldx	$mem, 0 -> r0
	;;
#0:	       stm.s	r0, r15, 11
	;;
#3:	       or	r0, 0 -> r3.23
	;;
.BB11_159:                              ; %bb134
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldi	0 -> r0
	;;
#0:	       stm.s	r0, r15, 16
	;;
.BB11_160:                              ; %bb134
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       stm.s	r0, r15, 11
#1:	       br	.BB11_210
	;;
#3:	       or	r0, 0 -> r3.23
	;;
	       nop	0
	;;
.BB11_161:                              ; %bb.i33
                                        ;   in Loop: Header=BB11_163 Depth=2
#0:	       ldi	0 -> r1
#1:	       or	r2, 0 -> r12
	;;
#0:	       stm.s	r1, r15, 16     ; strlen.c:68[ vfprintf.c:1362 ]
	;;
#0:	       ldm.f	r0, 0           ; strlen.c:68[ vfprintf.c:1362 ]
	;;
#3:	       or	r1, 0 -> r3.23
	;;
#0:	       ldx	$membu, r0 -> r0 ; strlen.c:68[ vfprintf.c:1362 ]
#1:	       stm.s	r1, r15, 11
	;;
#0:	       cmpeq	r0, 0 -> c3     ; strlen.c:68[ vfprintf.c:1362 ]
	;;
#0:	if  c3 br @	.BB11_210       ; strlen.c:68[ vfprintf.c:1362 ]
	;;
.BB11_162:                              ; %bb2.i36
                                        ;   in Loop: Header=BB11_163 Depth=2
#0:	       add	r2, 1 -> r2
	;;
.BB11_163:                              ; %bb3.i38
                                        ;   Parent Loop BB11_26 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.s	r15, 52
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       add	r0, r2 -> r0
	;;
#0:	       and	r0, 3 -> r1     ; strlen.c:66[ vfprintf.c:1362 ]
	;;
#0:	       brz ne @	r1, .BB11_161   ; strlen.c:66[ vfprintf.c:1362 ]
	;;
.BB11_164:                              ; %bb4.i40
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.f	r0, 0           ; strlen.c:76[ vfprintf.c:1362 ]
#1:	       ldiu	1791 -> r5
#2:	       ldga	32896 -> r3
	;;
#0:	       ldim	991 -> r5
#1:	       ldih	1028 -> r3
	;;
#0:	       ldx	$mem, 0 -> r4   ; strlen.c:76[ vfprintf.c:1362 ]
#1:	       ldih	2039 -> r5
	;;
#0:	       and	r4, r3 -> r1
	;;
#0:	       xor	r1, r3 -> r2
#1:	       add	r4, r5 -> r1
	;;
#0:	       and	r2, r1 -> r1    ; strlen.c:76[ vfprintf.c:1362 ]
	;;
#0:	       brz ne @	r1, .BB11_166   ; strlen.c:76[ vfprintf.c:1362 ]
	;;
.BB11_165:                              ; %bb5.i50
                                        ;   Parent Loop BB11_26 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r0, 4           ; strlen.c:76[ vfprintf.c:1362 ]
#1:	       add	r0, 4 -> r0
	;;
#0:	       ldx	$mem, 0 -> r4   ; strlen.c:76[ vfprintf.c:1362 ]
	;;
#0:	       and	r4, r3 -> r1
	;;
#0:	       xor	r1, r3 -> r2
#1:	       add	r4, r5 -> r1
	;;
#0:	       and	r2, r1 -> r1    ; strlen.c:76[ vfprintf.c:1362 ]
	;;
#0:	       brz eq @	r1, .BB11_165   ; strlen.c:76[ vfprintf.c:1362 ]
	;;
.BB11_166:                              ; %bb8.i52
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.f	r0, 0           ; strlen.c:85[ vfprintf.c:1362 ]
#1:	       or	r0, 0 -> r2
	;;
#0:	       ldx	$membu, r0 -> r1 ; strlen.c:85[ vfprintf.c:1362 ]
	;;
#0:	       brz eq @	r1, .BB11_168   ; strlen.c:85[ vfprintf.c:1362 ]
	;;
.BB11_167:                              ; %bb9.i56
                                        ;   Parent Loop BB11_26 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       add	r0, 1 -> r2
#1:	       ldm.f	r0, 1           ; strlen.c:85[ vfprintf.c:1362 ]
	;;
#0:	       or	r2, 0 -> r0
	;;
#0:	       ldx	$membu, r2 -> r1 ; strlen.c:85[ vfprintf.c:1362 ]
	;;
#0:	       brz ne @	r1, .BB11_167   ; strlen.c:85[ vfprintf.c:1362 ]
	;;
.BB11_168:                              ; %bb11.i58
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldi	0 -> r0
	;;
#0:	       stm.s	r0, r15, 16     ; strlen.c:87[ vfprintf.c:1362 ]
	;;
#0:	       br	.BB11_160
#1:	       ldm.s	r15, 52         ; strlen.c:87[ vfprintf.c:1362 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; strlen.c:87[ vfprintf.c:1362 ]
	;;
#0:	       sub	r2, r1 -> r12   ; strlen.c:87[ vfprintf.c:1362 ]
	;;
.BB11_169:                              ; %bb137
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 76         ; vfprintf.c:1366
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1366
	;;
#0:	       or	r0, 16 -> r0    ; vfprintf.c:1366
	;;
#0:	       stm.s	r0, r15, 19
	;;
.BB11_170:                              ; %bb138
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 76         ; vfprintf.c:1369
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1369
	;;
#0:	       btest	r0, 4 -> c1     ; vfprintf.c:1369
	;;
#0:	if !c1 br @	.BB11_172
	;;
.BB11_171:                              ; %bb139
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.f	r14, 0          ; vfprintf.c:1369
#1:	       br	.BB11_173
	;;
#0:	       ldx	$mem, 0 -> r10  ; vfprintf.c:1369
	;;
	       nop	0
	;;
.BB11_172:                              ; %bb140
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.f	r14, 0          ; vfprintf.c:1369
#1:	       btest	r0, 6 -> c1
#2:	       ldiu	2047 -> r1
	;;
#0:	       ldim	31 -> r1
	;;
#0:	       ldx	$mem, 0 -> r10  ; vfprintf.c:1369
	;;
#0:	if  c1 and	r10, r1 -> r10
	;;
.BB11_173:                              ; %bb144
                                        ;   in Loop: Header=BB11_26 Depth=1
#2:	       add	r14, 4 -> r2.24
#0:	       br @	.BB11_181
#1:	       ldi	1 -> r2
	;;
.BB11_174:                              ; %hex.loopexit14
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldga	._.str440 -> r1
	;;
.BB11_175:                              ; %hex
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 76         ; vfprintf.c:1377
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1377
	;;
#0:	       btest	r0, 4 -> c1     ; vfprintf.c:1377
	;;
#0:	if !c1 br @	.BB11_177
	;;
.BB11_176:                              ; %bb147
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.f	r14, 0          ; vfprintf.c:1377
#1:	       br	.BB11_178
	;;
#0:	       ldx	$mem, 0 -> r10  ; vfprintf.c:1377
	;;
	       nop	0
	;;
.BB11_177:                              ; %bb148
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.f	r14, 0          ; vfprintf.c:1377
#1:	       btest	r0, 6 -> c1
#2:	       ldiu	2047 -> r2
	;;
#0:	       ldim	31 -> r2
	;;
#0:	       ldx	$mem, 0 -> r10  ; vfprintf.c:1377
	;;
#0:	if  c1 and	r10, r2 -> r10
	;;
.BB11_178:                              ; %bb152
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 76         ; vfprintf.c:1380
#1:	       cmpeq	r10, 0 -> c1    ; vfprintf.c:1380
#2:	       ldi	2 -> r2
	;;
#2:	       add	r14, 4 -> r2.24
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1380
	;;
#0:	       and	r0, 1 -> r0     ; vfprintf.c:1380
	;;
#0:	       cmpeq	r0, 0 -> c2
	;;
#0:	       comb	or c2, c1 -> c1
	;;
#0:	if  c1 br @	.BB11_180
	;;
.BB11_179:                              ; %bb155
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 76         ; vfprintf.c:1383
#1:	       s2add	r15, 16 -> r5
#2:	       ldi	48 -> r4
#3:	       ldi	2 -> r2
	;;
#0:	       add	r5, 28 -> r3
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1383
	;;
#0:	       or	r0, 2 -> r0     ; vfprintf.c:1383
	;;
#0:	       stm.s	r0, r15, 19
#1:	       or	r3, 1 -> r0
#2:	       s2add	r15, 16 -> r3   ; vfprintf.c:1381
	;;
#0:	       stmb.a	r4, r3, 28      ; vfprintf.c:1381
	;;
#0:	       stmb.a	r13, r0, 0      ; vfprintf.c:1382
	;;
.BB11_180:                              ; %bb155
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       stm.s	r1, r15, 10
	;;
.BB11_181:                              ; %nosign
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldi	0 -> r0
	;;
#0:	       stm.s	r0, r15, 16     ; vfprintf.c:1390
#1:	       ldiu	224 -> r0       ; vfprintf.c:1390
	;;
#0:	       add	r15, r0 -> r0   ; vfprintf.c:1390
	;;
#0:	       stmb.a	0, r0, 12       ; vfprintf.c:1390
	;;
.BB11_182:                              ; %number
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 76
#1:	       ldi	-1 -> r0
#2:	       ldi	-129 -> r1
	;;
#0:	       cmplt	r0, r12 -> c1
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	if  c1 and	r0, r1 -> r0
	;;
#0:	       stm.s	r0, r15, 19
#1:	       or	r10, r12 -> r0
	;;
#0:	       cmpeq	r0, 0 -> c3     ; vfprintf.c:1405
	;;
#0:	if  c3 br @	.BB11_203       ; vfprintf.c:1405
	;;
.BB11_183:                              ; %bb160
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       bbh	zext8 r2 -> r2  ; vfprintf.c:1411
	;;
#0:	       cmpeq	r2, 2 -> c1     ; vfprintf.c:1411
	;;
#0:	if !c1 br @	.BB11_186
	;;
.BB11_184:                              ;   in Loop: Header=BB11_26 Depth=1
#2:	       or	r2.26, 0 -> r0
	;;
#0:	       stm.s	r0, r15, 13
	;;
.BB11_185:                              ; %bb169
                                        ;   Parent Loop BB11_26 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.s	r15, 40         ; vfprintf.c:1459
#1:	       and	r10, 15 -> r0   ; vfprintf.c:1459
#2:	       sr	r10, 4 -> r10   ; vfprintf.c:1460
	;;
#0:	       cmpeq	r10, 0 -> c3    ; vfprintf.c:1461
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1459
	;;
#0:	       add	r1, r0 -> r0    ; vfprintf.c:1459
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1459
	;;
#0:	       ldx	$membu, r0 -> r0 ; vfprintf.c:1459
#1:	       ldm.s	r15, 52
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	if !c3 br	.BB11_185       ; vfprintf.c:1461
#1:	if  c3 br	.BB11_208       ; vfprintf.c:1461
#2:	       sub	r1, 1 -> r1
	;;
#0:	       stm.s	r1, r15, 13     ; vfprintf.c:1459
	;;
#0:	       stmb.a	r0, r1, 0       ; vfprintf.c:1459
	;;
.BB11_186:                              ; %bb160
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       cmpeq	r2, 1 -> c1
	;;
#0:	if  c1 br @	.BB11_191
	;;
.BB11_187:                              ; %bb160
                                        ;   in Loop: Header=BB11_26 Depth=1
#2:	       or	r2.26, 0 -> r0
#0:	       brz ne	r2, .BB11_197
#1:	       ldi	0 -> r1
	;;
#1:	       stm.s	r0, r15, 13
#0:	       or	r0.25, 0 -> r0
	;;
	       nop	0
	;;
.BB11_188:                              ; %bb161
                                        ;   Parent Loop BB11_26 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.s	r15, 52
#1:	       and	r10, 7 -> r3    ; vfprintf.c:1414
#2:	       ldi	48 -> r1
#3:	       sub	r0, 1 -> r4
	;;
#0:	       sr	r10, 3 -> r10   ; vfprintf.c:1415
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       brz ne	r10, .BB11_188  ; vfprintf.c:1416
#1:	       sub	r2, 1 -> r2
	;;
#0:	       stm.s	r2, r15, 13
#1:	       or	r3, r1 -> r2
	;;
#0:	       stmb.a	r2, r0, 0       ; vfprintf.c:1414
#1:	       or	r4, 0 -> r0
	;;
.BB11_189:                              ; %bb162
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 76         ; vfprintf.c:1418
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1418
	;;
#0:	       and	r0, 1 -> r3     ; vfprintf.c:1418
#1:	       bbh	zext8 r2 -> r0  ; vfprintf.c:1418
	;;
#0:	       cmpeq	r3, 0 -> c2
#1:	       cmpeq	r0, r1 -> c1    ; vfprintf.c:1418
	;;
#0:	       comb	or c2, c1 -> c1
	;;
#0:	if  c1 br @	.BB11_208
	;;
.BB11_190:                              ; %bb165
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldi	48 -> r0
#1:	       br	.BB11_207
	;;
#0:	       stmb.a	r0, r4, 0       ; vfprintf.c:1419
#1:	       or	r4, 0 -> r0
	;;
	       nop	0
	;;
.BB11_191:                              ; %bb166
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldi	9 -> r0.24
	;;
#0:	       cmpult	r0.24, r10 -> c1 ; vfprintf.c:1424
	;;
#0:	if !c1 br @	.BB11_360
	;;
.BB11_192:                              ;   in Loop: Header=BB11_26 Depth=1
#2:	       or	r2.26, 0 -> r0
	;;
#0:	       stm.s	r0, r15, 13
	;;
.BB11_193:                              ; %bb168
                                        ;   Parent Loop BB11_26 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       or	r10, 0 -> r0    ; vfprintf.c:1453
#1:	       callg	___udivsi3      ; vfprintf.c:1453
#2:	       ldi	10 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#2:	       or	r0, 0 -> r2.25  ; vfprintf.c:1453
#0:	       or	r10, 0 -> r0    ; vfprintf.c:1432
#1:	       ldi	10 -> r1
#3:	       ldi	48 -> r14
	;;
#0:	       callg	___umodsi3      ; vfprintf.c:1432
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#1:	       ldm.s	r15, 52
#0:	       cmpult	r0.24, r10 -> c1
#2:	       or	r2.25, 0 -> r10
#3:	       or	r0, r14 -> r0
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	if !c1 br	.BB11_208
#1:	if  c1 br	.BB11_193
#2:	       sub	r1, 1 -> r1
	;;
#0:	       stm.s	r1, r15, 13
	;;
#0:	       stmb.a	r0, r1, 0       ; vfprintf.c:1432
	;;
.BB11_194:                              ; %bb.i60
                                        ;   in Loop: Header=BB11_197 Depth=2
#0:	       ldi	25 -> r0
	;;
#0:	       cmpeq	r1, r0 -> c1    ; strlen.c:68[ vfprintf.c:1466 ]
	;;
#0:	if !c1 br @	.BB11_196
	;;
.BB11_195:                              ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldga	._.str743 -> r0
#1:	       br	.BB11_210
	;;
#0:	       stm.s	r0, r15, 13
#1:	       ldi	0 -> r0
	;;
#3:	       or	r12, 0 -> r3.23
#0:	       stm.s	r0, r15, 11
#1:	       ldi	25 -> r12
	;;
.BB11_196:                              ; %bb2.i63
                                        ;   in Loop: Header=BB11_197 Depth=2
#0:	       add	r1, 1 -> r1
	;;
.BB11_197:                              ; %bb3.i65
                                        ;   Parent Loop BB11_26 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldga	._.str743 -> r0
	;;
#0:	       add	r0, r1 -> r2
	;;
#0:	       and	r2, 3 -> r0     ; strlen.c:66[ vfprintf.c:1466 ]
	;;
#0:	       brz ne @	r0, .BB11_194   ; strlen.c:66[ vfprintf.c:1466 ]
	;;
.BB11_198:                              ; %bb4.i67
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldiu	1791 -> r4
#1:	       ldga	32896 -> r3
#2:	       ldm.f	r2, 0           ; strlen.c:76[ vfprintf.c:1466 ]
	;;
#0:	       ldim	991 -> r4
#1:	       ldx	$mem, 0 -> r5   ; strlen.c:76[ vfprintf.c:1466 ]
#2:	       ldih	1028 -> r3
	;;
#0:	       and	r5, r3 -> r0
#1:	       ldih	2039 -> r4
	;;
#0:	       xor	r0, r3 -> r1
#1:	       add	r5, r4 -> r0
	;;
#0:	       and	r1, r0 -> r0    ; strlen.c:76[ vfprintf.c:1466 ]
	;;
#0:	       brz ne @	r0, .BB11_200   ; strlen.c:76[ vfprintf.c:1466 ]
	;;
.BB11_199:                              ; %bb5.i77
                                        ;   Parent Loop BB11_26 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r2, 4           ; strlen.c:76[ vfprintf.c:1466 ]
#1:	       add	r2, 4 -> r2
	;;
#0:	       ldx	$mem, 0 -> r5   ; strlen.c:76[ vfprintf.c:1466 ]
	;;
#0:	       and	r5, r3 -> r0
	;;
#0:	       xor	r0, r3 -> r1
#1:	       add	r5, r4 -> r0
	;;
#0:	       and	r1, r0 -> r0    ; strlen.c:76[ vfprintf.c:1466 ]
	;;
#0:	       brz eq @	r0, .BB11_199   ; strlen.c:76[ vfprintf.c:1466 ]
	;;
.BB11_200:                              ; %bb8.i79
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.f	r2, 0           ; strlen.c:85[ vfprintf.c:1466 ]
#1:	       or	r2, 0 -> r0
	;;
#0:	       ldx	$membu, r2 -> r1 ; strlen.c:85[ vfprintf.c:1466 ]
	;;
#0:	       brz eq @	r1, .BB11_202   ; strlen.c:85[ vfprintf.c:1466 ]
	;;
.BB11_201:                              ; %bb9.i83
                                        ;   Parent Loop BB11_26 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       add	r2, 1 -> r0
#1:	       ldm.f	r2, 1           ; strlen.c:85[ vfprintf.c:1466 ]
	;;
#0:	       or	r0, 0 -> r2
	;;
#0:	       ldx	$membu, r0 -> r1 ; strlen.c:85[ vfprintf.c:1466 ]
	;;
#0:	       brz ne @	r1, .BB11_201   ; strlen.c:85[ vfprintf.c:1466 ]
	;;
.BB11_202:                              ; %bb11.i85
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldga	._.str743 -> r1 ; strlen.c:87[ vfprintf.c:1466 ]
#1:	       br	.BB11_210
	;;
#0:	       stm.s	r1, r15, 13     ; strlen.c:87[ vfprintf.c:1466 ]
#1:	       sub	r0, r1 -> r1    ; strlen.c:87[ vfprintf.c:1466 ]
#2:	       ldi	0 -> r0
	;;
#3:	       or	r12, 0 -> r3.23
#0:	       stm.s	r0, r15, 11
#1:	       or	r1, 0 -> r12
	;;
.BB11_203:                              ; %bb171
                                        ;   in Loop: Header=BB11_26 Depth=1
#2:	       or	r2.26, 0 -> r1
#0:	       bbh	zext8 r2 -> r0  ; vfprintf.c:1479
	;;
#0:	       brz ne @	r0, .BB11_208   ; vfprintf.c:1479
#1:	       stm.s	r1, r15, 13     ; vfprintf.c:1479
	;;
.BB11_204:                              ; %bb172
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 76         ; vfprintf.c:1479
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1479
	;;
#0:	       btest	r0, 0 -> c1     ; vfprintf.c:1479
#2:	       or	r2.26, 0 -> r0
	;;
#0:	if !c1 br @	.BB11_208
#1:	       stm.s	r0, r15, 13     ; vfprintf.c:1479
	;;
.BB11_205:                              ; %bb174
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldi	48 -> r0
	;;
.BB11_206:                              ; %bb174
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldiu	128 -> r1       ; vfprintf.c:1480
	;;
#0:	       add	r15, r1 -> r1   ; vfprintf.c:1480
	;;
#1:	       stmb.a	r0, r1, 7       ; vfprintf.c:1480
#0:	       or	r0.25, 0 -> r0
	;;
.BB11_207:                              ; %bb174
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       stm.s	r0, r15, 13
	;;
.BB11_208:                              ; %bb175
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldi	0 -> r0
	;;
#0:	       stm.s	r0, r15, 11     ; vfprintf.c:1482
	;;
#0:	       ldm.s	r15, 52         ; vfprintf.c:1482
	;;
#3:	       or	r12, 0 -> r3.23
	;;
#0:	       br	.BB11_210
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1482
	;;
#2:	       sub	r2.26, r0 -> r0 ; vfprintf.c:1482
	;;
#0:	       or	r0, 0 -> r12
	;;
.BB11_209:                              ; %bb178
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldi	0 -> r0
#1:	       s2add	r15, 24 -> r2
#2:	       ldi	1 -> r12
	;;
#0:	       stm.s	r0, r15, 16
#1:	       add	r2, 0 -> r1
	;;
#0:	       stm.s	r1, r15, 13
#1:	       s2add	r15, 24 -> r1   ; vfprintf.c:1490
	;;
#0:	       stmb.a	r13, r1, 0      ; vfprintf.c:1490
#1:	       ldiu	224 -> r1       ; vfprintf.c:1492
	;;
#0:	       add	r15, r1 -> r1   ; vfprintf.c:1492
#2:	       or	r14, 0 -> r2.24
	;;
#0:	       stmb.a	0, r1, 12       ; vfprintf.c:1492
	;;
#3:	       or	r0, 0 -> r3.23
#0:	       stm.s	r0, r15, 11
	;;
.BB11_210:                              ; %bb180
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 64
	;;
#3:	       cmple	r3.23, r12 -> c1 ; vfprintf.c:1511
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       ldm.s	r15, 76
#1:	       bbh	zext8 r0 -> r0
	;;
#0:	       cmpne	r0, 0 -> c2
	;;
#3:	       or	r3.23, 0 -> r2  ; vfprintf.c:1511
#0:	       ldx	$mem, 0 -> r0
#1:	       ldx	$c2 -> r1
	;;
#0:	if  c1 or	r12, 0 -> r2    ; vfprintf.c:1511
#1:	       btest	r0, 1 -> c1
	;;
#0:	       add	r2, r1 -> r14
#1:	       ldi	132 -> r1
	;;
#1:	       and	r0, r1 -> r1.25 ; vfprintf.c:1518
#0:	if  c1 add	r14, 2 -> r14
	;;
#1:	       brz ne @	r1.25, .BB11_220 ; vfprintf.c:1518
	;;
.BB11_211:                              ; %bb186
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 72         ; vfprintf.c:1519
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1519
	;;
#0:	       sub	r0, r14 -> r10  ; vfprintf.c:1519
	;;
#0:	       cmplt	r10, 1 -> c1    ; vfprintf.c:1519
	;;
#0:	if  c1 br @	.BB11_220
#1:	if !c1 br @	.BB11_216
	;;
.BB11_212:                              ; %bb187
                                        ;   in Loop: Header=BB11_216 Depth=2
#0:	       ldm.s	r15, 68         ; vfprintf.c:1519
#1:	       ldi	16 -> r0
#2:	       ldiu	128 -> r2       ; vfprintf.c:1519
	;;
#0:	       add	r15, r2 -> r2   ; vfprintf.c:1519
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1519
	;;
#0:	       stm.a	r0, r1, 1       ; vfprintf.c:1519
	;;
#0:	       ldm.f	r15, 208        ; vfprintf.c:1519
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1519
	;;
#0:	       add	r0, 16 -> r0    ; vfprintf.c:1519
	;;
#0:	       stm.a	r0, r2, 20      ; vfprintf.c:1519
	;;
#0:	       ldm.s	r15, 56         ; vfprintf.c:1519
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1519
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1519
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1519
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1519
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1519
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1519
	;;
#0:	if !c1 br @	.BB11_214
	;;
.BB11_213:                              ;   in Loop: Header=BB11_216 Depth=2
#0:	       ldm.s	r15, 68         ; vfprintf.c:1519
	;;
#0:	       br	.BB11_215
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1519
	;;
#0:	       add	r0, 8 -> r0     ; vfprintf.c:1519
	;;
#0:	       stm.s	r0, r15, 17
	;;
.BB11_214:                              ; %bb188
                                        ;   in Loop: Header=BB11_216 Depth=2
#0:	       ldiu	128 -> r2
	;;
#0:	       add	r15, r2 -> r2
	;;
#0:	       add	r2, 8 -> r0
#1:	       ldiu	192 -> r2
	;;
#0:	       stm.s	r0, r15, 17
#1:	       add	r15, r2 -> r2
	;;
#0:	       ldm.s	r15, 60         ; vfprintf.c:1519
#1:	       add	r2, 8 -> r1
	;;
#0:	       callg	___sprint_r     ; vfprintf.c:1519
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1519
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1519
	;;
#0:	if  c3 br @	.BB11_364       ; vfprintf.c:1519
	;;
.BB11_215:                              ; %bb191
                                        ;   in Loop: Header=BB11_216 Depth=2
#0:	       sub	r10, 16 -> r10
	;;
.BB11_216:                              ; %bb192
                                        ;   Parent Loop BB11_26 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldi	16 -> r0
#1:	       ldm.s	r15, 68         ; vfprintf.c:1519
#2:	       ldga	_blanks.3668 -> r1 ; vfprintf.c:1519
	;;
#0:	       cmplt	r0, r10 -> c1   ; vfprintf.c:1519
	;;
#0:	if  c1 br	.BB11_212
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1519
	;;
#0:	       stm.a	r1, r0, 0       ; vfprintf.c:1519
	;;
	       nop	0
	;;
.BB11_217:                              ; %bb193
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1519
#1:	       ldiu	128 -> r3       ; vfprintf.c:1519
	;;
#0:	       add	r15, r3 -> r3   ; vfprintf.c:1519
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1519
	;;
#0:	       stm.a	r10, r0, 1      ; vfprintf.c:1519
	;;
#0:	       ldm.f	r15, 208        ; vfprintf.c:1519
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1519
	;;
#0:	       add	r0, r10 -> r0
	;;
#0:	       stm.a	r0, r3, 20      ; vfprintf.c:1519
	;;
#0:	       ldm.s	r15, 56         ; vfprintf.c:1519
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1519
	;;
#0:	       ldm.f	r1, 0           ; vfprintf.c:1519
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1519
	;;
#0:	       add	r0, 1 -> r2     ; vfprintf.c:1519
#1:	       ldi	7 -> r0
	;;
#0:	       cmplt	r0, r2 -> c1    ; vfprintf.c:1519
#1:	       stm.a	r2, r1, 0       ; vfprintf.c:1519
	;;
#0:	if  c1 br @	.BB11_219
	;;
.BB11_218:                              ; %bb193.bb197_crit_edge
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1519
	;;
#0:	       br	.BB11_220
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1519
	;;
#0:	       add	r0, 8 -> r0     ; vfprintf.c:1519
	;;
#0:	       stm.s	r0, r15, 17
	;;
.BB11_219:                              ; %bb194
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldiu	128 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       add	r10, 8 -> r0
#1:	       ldiu	192 -> r10
	;;
#0:	       stm.s	r0, r15, 17
#1:	       add	r15, r10 -> r10
	;;
#0:	       ldm.s	r15, 60         ; vfprintf.c:1519
#1:	       add	r10, 8 -> r1
	;;
#0:	       callg	___sprint_r     ; vfprintf.c:1519
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1519
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1519
	;;
#0:	if  c3 br @	.BB11_364       ; vfprintf.c:1519
	;;
.BB11_220:                              ; %bb197
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldiu	224 -> r2
#1:	       ldm.f	r15, 236        ; vfprintf.c:1522
	;;
#0:	       add	r15, r2 -> r2
	;;
#0:	       add	r2, 12 -> r1
	;;
#0:	       ldx	$membu, r1 -> r0 ; vfprintf.c:1522
	;;
#0:	       brz eq @	r0, .BB11_224   ; vfprintf.c:1522
	;;
.BB11_221:                              ; %bb198
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1523
#1:	       ldiu	128 -> r2       ; vfprintf.c:1523
	;;
#0:	       add	r15, r2 -> r2   ; vfprintf.c:1523
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1523
	;;
#0:	       stm.a	r1, r0, 0       ; vfprintf.c:1523
	;;
#0:	       stm.a	1, r0, 1        ; vfprintf.c:1523
	;;
#0:	       ldm.f	r15, 208        ; vfprintf.c:1523
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1523
	;;
#0:	       add	r0, 1 -> r0     ; vfprintf.c:1523
	;;
#0:	       stm.a	r0, r2, 20      ; vfprintf.c:1523
	;;
#0:	       ldm.s	r15, 56         ; vfprintf.c:1523
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1523
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1523
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1523
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1523
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1523
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1523
	;;
#0:	if !c1 br @	.BB11_223
	;;
.BB11_222:                              ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1523
	;;
#0:	       br	.BB11_224
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1523
	;;
#0:	       add	r0, 8 -> r0     ; vfprintf.c:1523
	;;
#0:	       stm.s	r0, r15, 17
	;;
.BB11_223:                              ; %bb199
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldiu	128 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       add	r10, 8 -> r0
#1:	       ldiu	192 -> r10
	;;
#0:	       stm.s	r0, r15, 17
#1:	       add	r15, r10 -> r10
	;;
#0:	       ldm.s	r15, 60         ; vfprintf.c:1523
#1:	       add	r10, 8 -> r1
	;;
#0:	       callg	___sprint_r     ; vfprintf.c:1523
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1523
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1523
	;;
#0:	if  c3 br @	.BB11_364       ; vfprintf.c:1523
	;;
.BB11_224:                              ; %bb202
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 76         ; vfprintf.c:1514
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1514
	;;
#0:	       and	r0, 2 -> r0     ; vfprintf.c:1514
	;;
#0:	       brz eq @	r0, .BB11_228   ; vfprintf.c:1524
	;;
.BB11_225:                              ; %bb203
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1525
#1:	       s2add	r15, 16 -> r2
	;;
#0:	       add	r2, 28 -> r1
#1:	       ldiu	128 -> r2       ; vfprintf.c:1525
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1525
#1:	       add	r15, r2 -> r2   ; vfprintf.c:1525
	;;
#0:	       stm.a	r1, r0, 0       ; vfprintf.c:1525
	;;
#0:	       stm.a	2, r0, 1        ; vfprintf.c:1525
	;;
#0:	       ldm.f	r15, 208        ; vfprintf.c:1525
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1525
	;;
#0:	       add	r0, 2 -> r0     ; vfprintf.c:1525
	;;
#0:	       stm.a	r0, r2, 20      ; vfprintf.c:1525
	;;
#0:	       ldm.s	r15, 56         ; vfprintf.c:1525
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1525
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1525
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1525
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1525
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1525
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1525
	;;
#0:	if !c1 br @	.BB11_227
	;;
.BB11_226:                              ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1525
	;;
#0:	       br	.BB11_228
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1525
	;;
#0:	       add	r0, 8 -> r0     ; vfprintf.c:1525
	;;
#0:	       stm.s	r0, r15, 17
	;;
.BB11_227:                              ; %bb205
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldiu	128 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       add	r10, 8 -> r0
#1:	       ldiu	192 -> r10
	;;
#0:	       stm.s	r0, r15, 17
#1:	       add	r15, r10 -> r10
	;;
#0:	       ldm.s	r15, 60         ; vfprintf.c:1525
#1:	       add	r10, 8 -> r1
	;;
#0:	       callg	___sprint_r     ; vfprintf.c:1525
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1525
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1525
	;;
#0:	if  c3 br @	.BB11_364       ; vfprintf.c:1525
	;;
.BB11_228:                              ; %bb208
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldi	128 -> r0
	;;
#1:	       cmpne	r1.25, r0 -> c1 ; vfprintf.c:1528
	;;
#0:	if  c1 br @	.BB11_238
	;;
.BB11_229:                              ; %bb209
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 72         ; vfprintf.c:1529
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1529
	;;
#0:	       sub	r0, r14 -> r10  ; vfprintf.c:1529
	;;
#0:	       cmplt	r10, 1 -> c1    ; vfprintf.c:1529
	;;
#0:	if  c1 br @	.BB11_238
#1:	if !c1 br @	.BB11_234
	;;
.BB11_230:                              ; %bb210
                                        ;   in Loop: Header=BB11_234 Depth=2
#0:	       ldm.s	r15, 68         ; vfprintf.c:1529
#1:	       ldi	16 -> r0
#2:	       ldiu	128 -> r2       ; vfprintf.c:1529
	;;
#0:	       add	r15, r2 -> r2   ; vfprintf.c:1529
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1529
	;;
#0:	       stm.a	r0, r1, 1       ; vfprintf.c:1529
	;;
#0:	       ldm.f	r15, 208        ; vfprintf.c:1529
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1529
	;;
#0:	       add	r0, 16 -> r0    ; vfprintf.c:1529
	;;
#0:	       stm.a	r0, r2, 20      ; vfprintf.c:1529
	;;
#0:	       ldm.s	r15, 56         ; vfprintf.c:1529
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1529
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1529
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1529
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1529
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1529
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1529
	;;
#0:	if !c1 br @	.BB11_232
	;;
.BB11_231:                              ;   in Loop: Header=BB11_234 Depth=2
#0:	       ldm.s	r15, 68         ; vfprintf.c:1529
	;;
#0:	       br	.BB11_233
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1529
	;;
#0:	       add	r0, 8 -> r0     ; vfprintf.c:1529
	;;
#0:	       stm.s	r0, r15, 17
	;;
.BB11_232:                              ; %bb211
                                        ;   in Loop: Header=BB11_234 Depth=2
#0:	       ldiu	128 -> r2
	;;
#0:	       add	r15, r2 -> r2
	;;
#0:	       add	r2, 8 -> r0
#1:	       ldiu	192 -> r2
	;;
#0:	       stm.s	r0, r15, 17
#1:	       add	r15, r2 -> r2
	;;
#0:	       ldm.s	r15, 60         ; vfprintf.c:1529
#1:	       add	r2, 8 -> r1
	;;
#0:	       callg	___sprint_r     ; vfprintf.c:1529
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1529
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1529
	;;
#0:	if  c3 br @	.BB11_364       ; vfprintf.c:1529
	;;
.BB11_233:                              ; %bb214
                                        ;   in Loop: Header=BB11_234 Depth=2
#0:	       sub	r10, 16 -> r10
	;;
.BB11_234:                              ; %bb215
                                        ;   Parent Loop BB11_26 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldi	16 -> r0
#1:	       ldm.s	r15, 68         ; vfprintf.c:1529
#2:	       ldga	_zeroes.3669 -> r1 ; vfprintf.c:1529
	;;
#0:	       cmplt	r0, r10 -> c1   ; vfprintf.c:1529
	;;
#0:	if  c1 br	.BB11_230
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1529
	;;
#0:	       stm.a	r1, r0, 0       ; vfprintf.c:1529
	;;
	       nop	0
	;;
.BB11_235:                              ; %bb216
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1529
#1:	       ldiu	128 -> r2       ; vfprintf.c:1529
	;;
#0:	       add	r15, r2 -> r2   ; vfprintf.c:1529
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1529
	;;
#0:	       stm.a	r10, r0, 1      ; vfprintf.c:1529
	;;
#0:	       ldm.f	r15, 208        ; vfprintf.c:1529
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1529
	;;
#0:	       add	r0, r10 -> r0
	;;
#0:	       stm.a	r0, r2, 20      ; vfprintf.c:1529
	;;
#0:	       ldm.s	r15, 56         ; vfprintf.c:1529
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1529
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1529
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1529
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1529
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1529
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1529
	;;
#0:	if !c1 br @	.BB11_237
	;;
.BB11_236:                              ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1529
	;;
#0:	       br	.BB11_238
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1529
	;;
#0:	       add	r0, 8 -> r0     ; vfprintf.c:1529
	;;
#0:	       stm.s	r0, r15, 17
	;;
.BB11_237:                              ; %bb217
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldiu	128 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       add	r10, 8 -> r0
#1:	       ldiu	192 -> r10
	;;
#0:	       stm.s	r0, r15, 17
#1:	       add	r15, r10 -> r10
	;;
#0:	       ldm.s	r15, 60         ; vfprintf.c:1529
#1:	       add	r10, 8 -> r1
	;;
#0:	       callg	___sprint_r     ; vfprintf.c:1529
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1529
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1529
	;;
#0:	if  c3 br @	.BB11_364       ; vfprintf.c:1529
	;;
.BB11_238:                              ; %bb220
                                        ;   in Loop: Header=BB11_26 Depth=1
#3:	       sub	r3.23, r12 -> r10 ; vfprintf.c:1532
	;;
#0:	       cmplt	r10, 1 -> c1    ; vfprintf.c:1532
	;;
#0:	if  c1 br @	.BB11_247
#1:	if !c1 br @	.BB11_243
	;;
.BB11_239:                              ; %bb221
                                        ;   in Loop: Header=BB11_243 Depth=2
#0:	       ldm.s	r15, 68         ; vfprintf.c:1532
#1:	       ldi	16 -> r0
#2:	       ldiu	128 -> r2       ; vfprintf.c:1532
	;;
#0:	       add	r15, r2 -> r2   ; vfprintf.c:1532
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1532
	;;
#0:	       stm.a	r0, r1, 1       ; vfprintf.c:1532
	;;
#0:	       ldm.f	r15, 208        ; vfprintf.c:1532
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1532
	;;
#0:	       add	r0, 16 -> r0    ; vfprintf.c:1532
	;;
#0:	       stm.a	r0, r2, 20      ; vfprintf.c:1532
	;;
#0:	       ldm.s	r15, 56         ; vfprintf.c:1532
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1532
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1532
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1532
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1532
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1532
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1532
	;;
#0:	if !c1 br @	.BB11_241
	;;
.BB11_240:                              ;   in Loop: Header=BB11_243 Depth=2
#0:	       ldm.s	r15, 68         ; vfprintf.c:1532
	;;
#0:	       br	.BB11_242
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1532
	;;
#0:	       add	r0, 8 -> r0     ; vfprintf.c:1532
	;;
#0:	       stm.s	r0, r15, 17
	;;
.BB11_241:                              ; %bb222
                                        ;   in Loop: Header=BB11_243 Depth=2
#0:	       ldiu	128 -> r2
	;;
#0:	       add	r15, r2 -> r2
	;;
#0:	       add	r2, 8 -> r0
#1:	       ldiu	192 -> r2
	;;
#0:	       stm.s	r0, r15, 17
#1:	       add	r15, r2 -> r2
	;;
#0:	       ldm.s	r15, 60         ; vfprintf.c:1532
#1:	       add	r2, 8 -> r1
	;;
#0:	       callg	___sprint_r     ; vfprintf.c:1532
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1532
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1532
	;;
#0:	if  c3 br @	.BB11_364       ; vfprintf.c:1532
	;;
.BB11_242:                              ; %bb225
                                        ;   in Loop: Header=BB11_243 Depth=2
#0:	       sub	r10, 16 -> r10
	;;
.BB11_243:                              ; %bb226
                                        ;   Parent Loop BB11_26 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldi	16 -> r0
#1:	       ldm.s	r15, 68         ; vfprintf.c:1532
#2:	       ldga	_zeroes.3669 -> r1 ; vfprintf.c:1529
	;;
#0:	       cmplt	r0, r10 -> c1   ; vfprintf.c:1532
	;;
#0:	if  c1 br	.BB11_239
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1532
	;;
#0:	       stm.a	r1, r0, 0       ; vfprintf.c:1532
	;;
	       nop	0
	;;
.BB11_244:                              ; %bb227
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1532
#1:	       ldiu	128 -> r3       ; vfprintf.c:1532
	;;
#0:	       add	r15, r3 -> r3   ; vfprintf.c:1532
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1532
	;;
#0:	       stm.a	r10, r0, 1      ; vfprintf.c:1532
	;;
#0:	       ldm.f	r15, 208        ; vfprintf.c:1532
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1532
	;;
#0:	       add	r0, r10 -> r0
	;;
#0:	       stm.a	r0, r3, 20      ; vfprintf.c:1532
	;;
#0:	       ldm.s	r15, 56         ; vfprintf.c:1532
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1532
	;;
#0:	       ldm.f	r1, 0           ; vfprintf.c:1532
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1532
	;;
#0:	       add	r0, 1 -> r2     ; vfprintf.c:1532
#1:	       ldi	7 -> r0
	;;
#0:	       cmplt	r0, r2 -> c1    ; vfprintf.c:1532
#1:	       stm.a	r2, r1, 0       ; vfprintf.c:1532
	;;
#0:	if  c1 br @	.BB11_246
	;;
.BB11_245:                              ; %bb227.bb231_crit_edge
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1532
	;;
#0:	       br	.BB11_247
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1532
	;;
#0:	       add	r0, 8 -> r0     ; vfprintf.c:1532
	;;
#0:	       stm.s	r0, r15, 17
	;;
.BB11_246:                              ; %bb228
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldiu	128 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       add	r10, 8 -> r0
#1:	       ldiu	192 -> r10
	;;
#0:	       stm.s	r0, r15, 17
#1:	       add	r15, r10 -> r10
	;;
#0:	       ldm.s	r15, 60         ; vfprintf.c:1532
#1:	       add	r10, 8 -> r1
	;;
#0:	       callg	___sprint_r     ; vfprintf.c:1532
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1532
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1532
	;;
#0:	if  c3 br @	.BB11_364       ; vfprintf.c:1532
	;;
.BB11_247:                              ; %bb231
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 76         ; vfprintf.c:1536
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1536
	;;
#0:	       btest	r0, 8 -> c1     ; vfprintf.c:1536
	;;
#0:	if  c1 br @	.BB11_251
	;;
.BB11_248:                              ; %bb232
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 52         ; vfprintf.c:1537
#1:	       ldiu	128 -> r2       ; vfprintf.c:1537
	;;
#0:	       add	r15, r2 -> r2   ; vfprintf.c:1537
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1537
	;;
#0:	       ldm.s	r15, 68         ; vfprintf.c:1537
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1537
	;;
#0:	       stm.a	r1, r0, 0       ; vfprintf.c:1537
	;;
#0:	       stm.a	r12, r0, 1      ; vfprintf.c:1537
	;;
#0:	       ldm.f	r15, 208        ; vfprintf.c:1537
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1537
	;;
#0:	       add	r0, r12 -> r0   ; vfprintf.c:1537
	;;
#0:	       stm.a	r0, r2, 20      ; vfprintf.c:1537
	;;
#0:	       ldm.s	r15, 56         ; vfprintf.c:1537
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1537
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1537
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1537
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1537
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1537
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1537
	;;
#0:	if !c1 br @	.BB11_250
	;;
.BB11_249:                              ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1537
	;;
#0:	       br	.BB11_348
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1537
	;;
#0:	       add	r0, 8 -> r0     ; vfprintf.c:1537
	;;
#0:	       stm.s	r0, r15, 17
	;;
.BB11_250:                              ; %bb233
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldiu	128 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       add	r10, 8 -> r0
#1:	       ldiu	192 -> r10
	;;
#0:	       stm.s	r0, r15, 17
#1:	       add	r15, r10 -> r10
	;;
#0:	       ldm.s	r15, 60         ; vfprintf.c:1537
#1:	       add	r10, 8 -> r1
	;;
#0:	       callg	___sprint_r     ; vfprintf.c:1537
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1537
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       cmpeq	r0, 0 -> c3     ; vfprintf.c:1537
	;;
#0:	if !c3 br @	.BB11_364       ; vfprintf.c:1537
#1:	if  c3 br @	.BB11_348       ; vfprintf.c:1537
	;;
.BB11_251:                              ; %bb236
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       cmplt	r13, r0.27 -> c1 ; vfprintf.c:1539
	;;
#0:	if  c1 br @	.BB11_322
	;;
.BB11_252:                              ; %bb237
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       fop	dcmp	d5, d6 -> f0 ; vfprintf.c:1540
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r0       ; vfprintf.c:1540
	;;
#0:	       btest	r0, 9 -> c1     ; vfprintf.c:1540
	;;
#0:	if  c1 br @	.BB11_268
	;;
.BB11_253:                              ; %bb238
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1542
#1:	       ldga	._.str844 -> r1 ; vfprintf.c:1542
#2:	       ldiu	128 -> r2       ; vfprintf.c:1542
	;;
#0:	       add	r15, r2 -> r2   ; vfprintf.c:1542
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1542
	;;
#0:	       stm.a	r1, r0, 0       ; vfprintf.c:1542
	;;
#0:	       stm.a	1, r0, 1        ; vfprintf.c:1542
	;;
#0:	       ldm.f	r15, 208        ; vfprintf.c:1542
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1542
	;;
#0:	       add	r0, 1 -> r0     ; vfprintf.c:1542
	;;
#0:	       stm.a	r0, r2, 20      ; vfprintf.c:1542
	;;
#0:	       ldm.s	r15, 56         ; vfprintf.c:1542
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1542
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1542
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1542
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1542
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1542
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1542
	;;
#0:	if !c1 br @	.BB11_255
	;;
.BB11_254:                              ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1542
	;;
#0:	       br	.BB11_256
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1542
	;;
#0:	       add	r0, 8 -> r0     ; vfprintf.c:1542
	;;
#0:	       stm.s	r0, r15, 17
	;;
.BB11_255:                              ; %bb239
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldiu	128 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       add	r10, 8 -> r0
#1:	       ldiu	192 -> r10
	;;
#0:	       stm.s	r0, r15, 17
#1:	       add	r15, r10 -> r10
	;;
#0:	       ldm.s	r15, 60         ; vfprintf.c:1542
#1:	       add	r10, 8 -> r1
	;;
#0:	       callg	___sprint_r     ; vfprintf.c:1542
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1542
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1542
	;;
#0:	if  c3 br @	.BB11_364       ; vfprintf.c:1542
	;;
.BB11_256:                              ; %bb242
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.f	r15, 228        ; vfprintf.c:1543
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1543
#1:	       ldm.f	r15, 216        ; vfprintf.c:1543
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1543
	;;
#0:	       cmplt	r1, r0 -> c1    ; vfprintf.c:1543
	;;
#0:	if !c1 ldm.s	r15, 76         ; vfprintf.c:1543
	;;
#0:	if !c1 ldx	$mem, 0 -> r0   ; vfprintf.c:1543
	;;
#0:	if !c1 btest	r0, 0 -> c1     ; vfprintf.c:1543
	;;
#0:	if !c1 br @	.BB11_348
	;;
.BB11_257:                              ; %bb245
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1544
#1:	       ldga	._.str69 -> r0  ; vfprintf.c:1544
#2:	       ldiu	128 -> r2       ; vfprintf.c:1544
	;;
#0:	       add	r15, r2 -> r2   ; vfprintf.c:1544
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1544
	;;
#0:	       stm.a	r0, r1, 0       ; vfprintf.c:1544
	;;
#0:	       ldm.s	r15, 36         ; vfprintf.c:1544
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1544
	;;
#0:	       stm.a	r0, r1, 1       ; vfprintf.c:1544
	;;
#0:	       ldm.f	r15, 208        ; vfprintf.c:1544
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1544
	;;
#0:	       add	r1, r0 -> r0    ; vfprintf.c:1544
	;;
#0:	       stm.a	r0, r2, 20      ; vfprintf.c:1544
	;;
#0:	       ldm.s	r15, 56         ; vfprintf.c:1544
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1544
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1544
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1544
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1544
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1544
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1544
	;;
#0:	if !c1 br @	.BB11_259
	;;
.BB11_258:                              ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1544
	;;
#0:	       br	.BB11_260
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1544
	;;
#0:	       add	r0, 8 -> r0     ; vfprintf.c:1544
	;;
#0:	       stm.s	r0, r15, 17
	;;
.BB11_259:                              ; %bb246
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldiu	128 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       add	r10, 8 -> r0
#1:	       ldiu	192 -> r10
	;;
#0:	       stm.s	r0, r15, 17
#1:	       add	r15, r10 -> r10
	;;
#0:	       ldm.s	r15, 60         ; vfprintf.c:1544
#1:	       add	r10, 8 -> r1
	;;
#0:	       callg	___sprint_r     ; vfprintf.c:1544
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1544
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1544
	;;
#0:	if  c3 br @	.BB11_364       ; vfprintf.c:1544
	;;
.BB11_260:                              ; %bb249
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.f	r15, 216        ; vfprintf.c:1545
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1545
	;;
#0:	       sub	r0, 1 -> r10
	;;
#0:	       cmplt	r10, 1 -> c1    ; vfprintf.c:1545
	;;
#0:	if  c1 br @	.BB11_348
#1:	if !c1 br @	.BB11_265
	;;
.BB11_261:                              ; %bb250
                                        ;   in Loop: Header=BB11_265 Depth=2
#0:	       ldm.s	r15, 68         ; vfprintf.c:1545
#1:	       ldi	16 -> r0
#2:	       ldiu	128 -> r2       ; vfprintf.c:1545
	;;
#0:	       add	r15, r2 -> r2   ; vfprintf.c:1545
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1545
	;;
#0:	       stm.a	r0, r1, 1       ; vfprintf.c:1545
	;;
#0:	       ldm.f	r15, 208        ; vfprintf.c:1545
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1545
	;;
#0:	       add	r0, 16 -> r0    ; vfprintf.c:1545
	;;
#0:	       stm.a	r0, r2, 20      ; vfprintf.c:1545
	;;
#0:	       ldm.s	r15, 56         ; vfprintf.c:1545
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1545
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1545
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1545
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1545
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1545
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1545
	;;
#0:	if !c1 br @	.BB11_263
	;;
.BB11_262:                              ;   in Loop: Header=BB11_265 Depth=2
#0:	       ldm.s	r15, 68         ; vfprintf.c:1545
	;;
#0:	       br	.BB11_264
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1545
	;;
#0:	       add	r0, 8 -> r0     ; vfprintf.c:1545
	;;
#0:	       stm.s	r0, r15, 17
	;;
.BB11_263:                              ; %bb251
                                        ;   in Loop: Header=BB11_265 Depth=2
#0:	       ldiu	128 -> r12
	;;
#0:	       add	r15, r12 -> r12
	;;
#0:	       add	r12, 8 -> r0
#1:	       ldiu	192 -> r12
	;;
#0:	       stm.s	r0, r15, 17
#1:	       add	r15, r12 -> r12
	;;
#0:	       ldm.s	r15, 60         ; vfprintf.c:1545
#1:	       add	r12, 8 -> r1
	;;
#0:	       callg	___sprint_r     ; vfprintf.c:1545
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1545
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1545
	;;
#0:	if  c3 br @	.BB11_364       ; vfprintf.c:1545
	;;
.BB11_264:                              ; %bb254
                                        ;   in Loop: Header=BB11_265 Depth=2
#0:	       sub	r10, 16 -> r10
	;;
.BB11_265:                              ; %bb255
                                        ;   Parent Loop BB11_26 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldi	16 -> r0
#1:	       ldm.s	r15, 68         ; vfprintf.c:1545
#2:	       ldga	_zeroes.3669 -> r1 ; vfprintf.c:1529
	;;
#0:	       cmplt	r0, r10 -> c1   ; vfprintf.c:1545
	;;
#0:	if  c1 br	.BB11_261
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1545
	;;
#0:	       stm.a	r1, r0, 0       ; vfprintf.c:1545
	;;
	       nop	0
	;;
.BB11_266:                              ; %bb256
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1545
#1:	       ldiu	128 -> r2       ; vfprintf.c:1545
	;;
#0:	       add	r15, r2 -> r2   ; vfprintf.c:1545
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1545
	;;
#0:	       stm.a	r10, r0, 1      ; vfprintf.c:1545
	;;
#0:	       ldm.f	r15, 208        ; vfprintf.c:1545
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1545
	;;
#0:	       add	r0, r10 -> r0
	;;
#0:	       stm.a	r0, r2, 20      ; vfprintf.c:1545
	;;
#0:	       ldm.s	r15, 56         ; vfprintf.c:1545
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1545
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1545
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1545
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1545
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1545
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1545
	;;
#0:	if  c1 br @	.BB11_249
	;;
.BB11_267:                              ; %bb257
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldiu	128 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       add	r10, 8 -> r0
#1:	       ldiu	192 -> r10
	;;
#0:	       stm.s	r0, r15, 17
#1:	       add	r15, r10 -> r10
	;;
#0:	       ldm.s	r15, 60         ; vfprintf.c:1545
#1:	       add	r10, 8 -> r1
	;;
#0:	       callg	___sprint_r     ; vfprintf.c:1545
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1545
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       cmpeq	r0, 0 -> c3     ; vfprintf.c:1545
	;;
#0:	if !c3 br @	.BB11_364       ; vfprintf.c:1545
#1:	if  c3 br @	.BB11_348       ; vfprintf.c:1545
	;;
.BB11_268:                              ; %bb260
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.f	r15, 228        ; vfprintf.c:1547
#1:	       ldi	0 -> r0
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1547
	;;
#0:	       cmplt	r0, r1 -> c1    ; vfprintf.c:1547
	;;
#0:	if  c1 br @	.BB11_291
	;;
.BB11_269:                              ; %bb261
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1548
#1:	       ldga	._.str844 -> r1 ; vfprintf.c:1542
#2:	       ldiu	128 -> r2       ; vfprintf.c:1548
	;;
#0:	       add	r15, r2 -> r2   ; vfprintf.c:1548
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1548
	;;
#0:	       stm.a	r1, r0, 0       ; vfprintf.c:1548
	;;
#0:	       stm.a	1, r0, 1        ; vfprintf.c:1548
	;;
#0:	       ldm.f	r15, 208        ; vfprintf.c:1548
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1548
	;;
#0:	       add	r0, 1 -> r0     ; vfprintf.c:1548
	;;
#0:	       stm.a	r0, r2, 20      ; vfprintf.c:1548
	;;
#0:	       ldm.s	r15, 56         ; vfprintf.c:1548
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1548
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1548
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1548
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1548
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1548
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1548
	;;
#0:	if !c1 br @	.BB11_271
	;;
.BB11_270:                              ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1548
	;;
#0:	       br	.BB11_272
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1548
	;;
#0:	       add	r0, 8 -> r0     ; vfprintf.c:1548
	;;
#0:	       stm.s	r0, r15, 17
	;;
.BB11_271:                              ; %bb262
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldiu	128 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       add	r10, 8 -> r0
#1:	       ldiu	192 -> r10
	;;
#0:	       stm.s	r0, r15, 17
#1:	       add	r15, r10 -> r10
	;;
#0:	       ldm.s	r15, 60         ; vfprintf.c:1548
#1:	       add	r10, 8 -> r1
	;;
#0:	       callg	___sprint_r     ; vfprintf.c:1548
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1548
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1548
	;;
#0:	if  c3 br @	.BB11_364       ; vfprintf.c:1548
	;;
.BB11_272:                              ; %bb265
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.f	r15, 228        ; vfprintf.c:1549
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1549
	;;
#0:	       brz ne @	r0, .BB11_275   ; vfprintf.c:1549
	;;
.BB11_273:                              ; %bb266
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.f	r15, 216        ; vfprintf.c:1549
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1549
	;;
#0:	       brz ne @	r0, .BB11_275   ; vfprintf.c:1549
	;;
.BB11_274:                              ; %bb267
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 76         ; vfprintf.c:1549
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1549
	;;
#0:	       btest	r0, 0 -> c1     ; vfprintf.c:1549
	;;
#0:	if !c1 br @	.BB11_348
	;;
.BB11_275:                              ; %bb269
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1550
#1:	       ldga	._.str69 -> r0  ; vfprintf.c:1544
#2:	       ldiu	128 -> r2       ; vfprintf.c:1550
	;;
#0:	       add	r15, r2 -> r2   ; vfprintf.c:1550
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1550
	;;
#0:	       stm.a	r0, r1, 0       ; vfprintf.c:1550
	;;
#0:	       ldm.s	r15, 36         ; vfprintf.c:1550
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1550
	;;
#0:	       stm.a	r0, r1, 1       ; vfprintf.c:1550
	;;
#0:	       ldm.f	r15, 208        ; vfprintf.c:1550
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1550
	;;
#0:	       add	r1, r0 -> r0    ; vfprintf.c:1550
	;;
#0:	       stm.a	r0, r2, 20      ; vfprintf.c:1550
	;;
#0:	       ldm.s	r15, 56         ; vfprintf.c:1550
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1550
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1550
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1550
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1550
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1550
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1550
	;;
#0:	if !c1 br @	.BB11_277
	;;
.BB11_276:                              ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1550
#1:	       br	.BB11_278
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1550
	;;
#0:	       add	r0, 8 -> r12    ; vfprintf.c:1550
	;;
.BB11_277:                              ; %bb270
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldiu	128 -> r10
#1:	       ldm.s	r15, 60         ; vfprintf.c:1550
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       callg	___sprint_r     ; vfprintf.c:1550
#1:	       add	r10, 8 -> r12
#2:	       ldiu	192 -> r10
#3:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1550
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       add	r10, 8 -> r1
	;;
	       nop	0
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1550
	;;
#0:	if  c3 br @	.BB11_364       ; vfprintf.c:1550
	;;
.BB11_278:                              ; %bb273
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.f	r15, 228        ; vfprintf.c:1551
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1551
	;;
#2:	       cmplt	r2.29, r1 -> c1 ; vfprintf.c:1551
	;;
#0:	if  c1 br @	.BB11_288
	;;
.BB11_279:                              ; %bb279.preheader
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldi	0 -> r0
#1:	       br	.BB11_284
	;;
#0:	       sub	r0, r1 -> r10
	;;
	       nop	0
	;;
.BB11_280:                              ; %bb274
                                        ;   in Loop: Header=BB11_284 Depth=2
#0:	       ldi	16 -> r0
#1:	       ldiu	128 -> r2       ; vfprintf.c:1551
	;;
#0:	       stm.a	r0, r12, 1      ; vfprintf.c:1551
#1:	       add	r15, r2 -> r2   ; vfprintf.c:1551
	;;
#0:	       ldm.f	r15, 208        ; vfprintf.c:1551
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1551
	;;
#0:	       add	r0, 16 -> r0    ; vfprintf.c:1551
	;;
#0:	       stm.a	r0, r2, 20      ; vfprintf.c:1551
	;;
#0:	       ldm.s	r15, 56         ; vfprintf.c:1551
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1551
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1551
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1551
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1551
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1551
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1551
	;;
#0:	if !c1 br @	.BB11_282
	;;
.BB11_281:                              ;   in Loop: Header=BB11_284 Depth=2
#0:	       add	r12, 8 -> r12   ; vfprintf.c:1551
#1:	       br @	.BB11_283
	;;
.BB11_282:                              ; %bb275
                                        ;   in Loop: Header=BB11_284 Depth=2
#0:	       ldiu	128 -> r13
#1:	       ldm.s	r15, 60         ; vfprintf.c:1551
	;;
#0:	       add	r15, r13 -> r13
	;;
#0:	       callg	___sprint_r     ; vfprintf.c:1551
#1:	       add	r13, 8 -> r12
#2:	       ldiu	192 -> r13
#3:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1551
	;;
#0:	       add	r15, r13 -> r13
	;;
#0:	       add	r13, 8 -> r1
	;;
	       nop	0
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1551
	;;
#0:	if  c3 br @	.BB11_364       ; vfprintf.c:1551
	;;
.BB11_283:                              ; %bb278
                                        ;   in Loop: Header=BB11_284 Depth=2
#0:	       sub	r10, 16 -> r10
	;;
.BB11_284:                              ; %bb279
                                        ;   Parent Loop BB11_26 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldi	16 -> r0
	;;
#0:	       cmplt	r0, r10 -> c1   ; vfprintf.c:1551
#1:	       ldga	_zeroes.3669 -> r0 ; vfprintf.c:1529
	;;
#0:	if  c1 br @	.BB11_280
#1:	       stm.a	r0, r12, 0      ; vfprintf.c:1551
	;;
.BB11_285:                              ; %bb280
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       stm.a	r10, r12, 1     ; vfprintf.c:1551
#1:	       ldiu	128 -> r2       ; vfprintf.c:1551
	;;
#0:	       ldm.f	r15, 208        ; vfprintf.c:1551
#1:	       add	r15, r2 -> r2   ; vfprintf.c:1551
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1551
	;;
#0:	       add	r0, r10 -> r0
	;;
#0:	       stm.a	r0, r2, 20      ; vfprintf.c:1551
	;;
#0:	       ldm.s	r15, 56         ; vfprintf.c:1551
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1551
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1551
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1551
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1551
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1551
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1551
	;;
#0:	if !c1 br @	.BB11_287
	;;
.BB11_286:                              ;   in Loop: Header=BB11_26 Depth=1
#0:	       add	r12, 8 -> r12   ; vfprintf.c:1551
#1:	       br @	.BB11_288
	;;
.BB11_287:                              ; %bb281
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldiu	128 -> r10
#1:	       ldm.s	r15, 60         ; vfprintf.c:1551
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       callg	___sprint_r     ; vfprintf.c:1551
#1:	       add	r10, 8 -> r12
#2:	       ldiu	192 -> r10
#3:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1551
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       add	r10, 8 -> r1
	;;
	       nop	0
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1551
	;;
#0:	if  c3 br @	.BB11_364       ; vfprintf.c:1551
	;;
.BB11_288:                              ; %bb284
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 52         ; vfprintf.c:1552
#1:	       ldiu	128 -> r2       ; vfprintf.c:1552
	;;
#0:	       add	r15, r2 -> r2   ; vfprintf.c:1552
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1552
	;;
#0:	       stm.a	r0, r12, 0      ; vfprintf.c:1552
	;;
#0:	       ldm.f	r15, 216        ; vfprintf.c:1552
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1552
	;;
#0:	       stm.a	r0, r12, 1      ; vfprintf.c:1552
	;;
#0:	       ldm.f	r15, 208        ; vfprintf.c:1552
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1552
#1:	       ldm.f	r15, 216        ; vfprintf.c:1552
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1552
	;;
#0:	       add	r0, r1 -> r0    ; vfprintf.c:1552
	;;
#0:	       stm.a	r0, r2, 20      ; vfprintf.c:1552
	;;
#0:	       ldm.s	r15, 56         ; vfprintf.c:1552
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1552
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1552
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1552
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1552
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1552
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1552
	;;
#0:	if !c1 br @	.BB11_290
	;;
.BB11_289:                              ;   in Loop: Header=BB11_26 Depth=1
#0:	       add	r12, 8 -> r0    ; vfprintf.c:1552
#1:	       br	.BB11_348
	;;
#0:	       stm.s	r0, r15, 17
	;;
	       nop	0
	;;
.BB11_290:                              ; %bb285
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldiu	128 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       add	r10, 8 -> r0
#1:	       ldiu	192 -> r10
	;;
#0:	       stm.s	r0, r15, 17
#1:	       add	r15, r10 -> r10
	;;
#0:	       ldm.s	r15, 60         ; vfprintf.c:1552
#1:	       add	r10, 8 -> r1
	;;
#0:	       callg	___sprint_r     ; vfprintf.c:1552
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1552
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       cmpeq	r0, 0 -> c3     ; vfprintf.c:1552
	;;
#0:	if !c3 br @	.BB11_364       ; vfprintf.c:1552
#1:	if  c3 br @	.BB11_348       ; vfprintf.c:1552
	;;
.BB11_291:                              ; %bb288
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.f	r15, 216        ; vfprintf.c:1556
	;;
#0:	       ldx	$mem, 0 -> r12  ; vfprintf.c:1556
#1:	       ldm.s	r15, 44         ; vfprintf.c:1556
	;;
#0:	       or	r12, 0 -> r10
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1556
	;;
#0:	       cmplt	r0, r12 -> c1   ; vfprintf.c:1556
	;;
#0:	if  c1 or	r0, 0 -> r10
	;;
#0:	       cmplt	r10, 1 -> c1    ; vfprintf.c:1556
	;;
#0:	if  c1 br @	.BB11_295
	;;
.BB11_292:                              ; %bb292
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 52         ; vfprintf.c:1556
#1:	       ldiu	128 -> r2       ; vfprintf.c:1556
	;;
#0:	       add	r15, r2 -> r2   ; vfprintf.c:1556
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1556
	;;
#0:	       ldm.s	r15, 68         ; vfprintf.c:1556
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1556
	;;
#0:	       stm.a	r1, r0, 0       ; vfprintf.c:1556
	;;
#0:	       stm.a	r10, r0, 1      ; vfprintf.c:1556
	;;
#0:	       ldm.f	r15, 208        ; vfprintf.c:1556
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1556
	;;
#0:	       add	r0, r10 -> r0   ; vfprintf.c:1556
	;;
#0:	       stm.a	r0, r2, 20      ; vfprintf.c:1556
	;;
#0:	       ldm.s	r15, 56         ; vfprintf.c:1556
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1556
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1556
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1556
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1556
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1556
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1556
	;;
#0:	if !c1 br @	.BB11_294
	;;
.BB11_293:                              ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1556
	;;
#0:	       br	.BB11_295
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1556
	;;
#0:	       add	r0, 8 -> r0     ; vfprintf.c:1556
	;;
#0:	       stm.s	r0, r15, 17
	;;
.BB11_294:                              ; %bb293
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldiu	128 -> r13
	;;
#0:	       add	r15, r13 -> r13
	;;
#0:	       add	r13, 8 -> r0
#1:	       ldiu	192 -> r13
	;;
#0:	       stm.s	r0, r15, 17
#1:	       add	r15, r13 -> r13
	;;
#0:	       ldm.s	r15, 60         ; vfprintf.c:1556
#1:	       add	r13, 8 -> r1
	;;
#0:	       callg	___sprint_r     ; vfprintf.c:1556
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1556
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1556
	;;
#0:	if  c3 br @	.BB11_364       ; vfprintf.c:1556
	;;
.BB11_295:                              ; %bb296
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 44         ; vfprintf.c:1556
#1:	       cmplt	r10, 0 -> c1
#2:	       ldi	0 -> r0
	;;
#0:	if  c1 or	r0, 0 -> r10    ; vfprintf.c:1556
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1556
	;;
#0:	       sub	r0, r10 -> r0   ; vfprintf.c:1556
	;;
#0:	       cmplt	r0, 1 -> c1     ; vfprintf.c:1556
	;;
#0:	if  c1 br @	.BB11_305
	;;
.BB11_296:                              ; %bb304.preheader
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 44
#1:	       xor	r12, -1 -> r2
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       xor	r1, -1 -> r0
	;;
#0:	       cmplt	r2, r0 -> c1
#1:	       ldi	0 -> r0
	;;
#0:	if  c1 xor	r1, -1 -> r2
	;;
#0:	       xor	r2, -1 -> r3
	;;
#0:	       br	.BB11_301
#1:	       cmplt	r0, r3 -> c1
#2:	       ldi	0 -> r0
	;;
#0:	if  c1 xor	r2, -1 -> r0
	;;
#0:	       sub	r1, r0 -> r10
	;;
.BB11_297:                              ; %bb299
                                        ;   in Loop: Header=BB11_301 Depth=2
#0:	       ldm.s	r15, 68         ; vfprintf.c:1556
#1:	       ldi	16 -> r0
#2:	       ldiu	128 -> r2       ; vfprintf.c:1556
	;;
#0:	       add	r15, r2 -> r2   ; vfprintf.c:1556
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1556
	;;
#0:	       stm.a	r0, r1, 1       ; vfprintf.c:1556
	;;
#0:	       ldm.f	r15, 208        ; vfprintf.c:1556
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1556
	;;
#0:	       add	r0, 16 -> r0    ; vfprintf.c:1556
	;;
#0:	       stm.a	r0, r2, 20      ; vfprintf.c:1556
	;;
#0:	       ldm.s	r15, 56         ; vfprintf.c:1556
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1556
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1556
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1556
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1556
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1556
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1556
	;;
#0:	if !c1 br @	.BB11_299
	;;
.BB11_298:                              ;   in Loop: Header=BB11_301 Depth=2
#0:	       ldm.s	r15, 68         ; vfprintf.c:1556
	;;
#0:	       br	.BB11_300
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1556
	;;
#0:	       add	r0, 8 -> r0     ; vfprintf.c:1556
	;;
#0:	       stm.s	r0, r15, 17
	;;
.BB11_299:                              ; %bb300
                                        ;   in Loop: Header=BB11_301 Depth=2
#0:	       ldiu	128 -> r12
	;;
#0:	       add	r15, r12 -> r12
	;;
#0:	       add	r12, 8 -> r0
#1:	       ldiu	192 -> r12
	;;
#0:	       stm.s	r0, r15, 17
#1:	       add	r15, r12 -> r12
	;;
#0:	       ldm.s	r15, 60         ; vfprintf.c:1556
#1:	       add	r12, 8 -> r1
	;;
#0:	       callg	___sprint_r     ; vfprintf.c:1556
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1556
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1556
	;;
#0:	if  c3 br @	.BB11_364       ; vfprintf.c:1556
	;;
.BB11_300:                              ; %bb303
                                        ;   in Loop: Header=BB11_301 Depth=2
#0:	       sub	r10, 16 -> r10
	;;
.BB11_301:                              ; %bb304
                                        ;   Parent Loop BB11_26 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldi	16 -> r0
#1:	       ldm.s	r15, 68         ; vfprintf.c:1556
#2:	       ldga	_zeroes.3669 -> r1 ; vfprintf.c:1529
	;;
#0:	       cmplt	r0, r10 -> c1   ; vfprintf.c:1556
	;;
#0:	if  c1 br	.BB11_297
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1556
	;;
#0:	       stm.a	r1, r0, 0       ; vfprintf.c:1556
	;;
	       nop	0
	;;
.BB11_302:                              ; %bb305
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1556
#1:	       ldiu	128 -> r3       ; vfprintf.c:1556
	;;
#0:	       add	r15, r3 -> r3   ; vfprintf.c:1556
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1556
	;;
#0:	       stm.a	r10, r0, 1      ; vfprintf.c:1556
	;;
#0:	       ldm.f	r15, 208        ; vfprintf.c:1556
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1556
	;;
#0:	       add	r0, r10 -> r0
	;;
#0:	       stm.a	r0, r3, 20      ; vfprintf.c:1556
	;;
#0:	       ldm.s	r15, 56         ; vfprintf.c:1556
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1556
	;;
#0:	       ldm.f	r1, 0           ; vfprintf.c:1556
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1556
	;;
#0:	       add	r0, 1 -> r2     ; vfprintf.c:1556
#1:	       ldi	7 -> r0
	;;
#0:	       cmplt	r0, r2 -> c1    ; vfprintf.c:1556
#1:	       stm.a	r2, r1, 0       ; vfprintf.c:1556
	;;
#0:	if  c1 br @	.BB11_304
	;;
.BB11_303:                              ; %bb305.bb309_crit_edge
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1556
	;;
#0:	       br	.BB11_305
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1556
	;;
#0:	       add	r0, 8 -> r0     ; vfprintf.c:1556
	;;
#0:	       stm.s	r0, r15, 17
	;;
.BB11_304:                              ; %bb306
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldiu	128 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       add	r10, 8 -> r0
#1:	       ldiu	192 -> r10
	;;
#0:	       stm.s	r0, r15, 17
#1:	       add	r15, r10 -> r10
	;;
#0:	       ldm.s	r15, 60         ; vfprintf.c:1556
#1:	       add	r10, 8 -> r1
	;;
#0:	       callg	___sprint_r     ; vfprintf.c:1556
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1556
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1556
	;;
#0:	if  c3 br @	.BB11_364       ; vfprintf.c:1556
	;;
.BB11_305:                              ; %bb309
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.f	r15, 228        ; vfprintf.c:1577
	;;
#0:	       ldx	$mem, 0 -> r3   ; vfprintf.c:1577
#1:	       ldm.f	r15, 216        ; vfprintf.c:1577
	;;
#0:	       ldx	$mem, 0 -> r2   ; vfprintf.c:1577
#1:	       ldm.s	r15, 44         ; vfprintf.c:1558
	;;
#0:	       cmplt	r3, r2 -> c1    ; vfprintf.c:1577
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1558
	;;
#0:	       ldm.s	r15, 52         ; vfprintf.c:1558
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1558
	;;
#0:	if !c1 ldm.s	r15, 76         ; vfprintf.c:1577
#1:	       add	r1, r0 -> r1.26 ; vfprintf.c:1558
	;;
#0:	if !c1 ldx	$mem, 0 -> r0   ; vfprintf.c:1577
	;;
#0:	if !c1 btest	r0, 0 -> c1     ; vfprintf.c:1577
	;;
#0:	if !c1 br @	.BB11_309
	;;
.BB11_306:                              ; %bb312
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1578
#1:	       ldga	._.str69 -> r0  ; vfprintf.c:1544
#2:	       ldiu	128 -> r3       ; vfprintf.c:1578
	;;
#0:	       add	r15, r3 -> r3   ; vfprintf.c:1578
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1578
	;;
#0:	       stm.a	r0, r1, 0       ; vfprintf.c:1578
	;;
#0:	       ldm.s	r15, 36         ; vfprintf.c:1578
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1578
	;;
#0:	       stm.a	r0, r1, 1       ; vfprintf.c:1578
	;;
#0:	       ldm.f	r15, 208        ; vfprintf.c:1578
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1578
	;;
#0:	       add	r1, r0 -> r0    ; vfprintf.c:1578
	;;
#0:	       stm.a	r0, r3, 20      ; vfprintf.c:1578
	;;
#0:	       ldm.s	r15, 56         ; vfprintf.c:1578
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1578
	;;
#0:	       ldm.f	r1, 0           ; vfprintf.c:1578
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1578
	;;
#0:	       add	r0, 1 -> r2     ; vfprintf.c:1578
#1:	       ldi	7 -> r0
	;;
#0:	       cmplt	r0, r2 -> c1    ; vfprintf.c:1578
#1:	       stm.a	r2, r1, 0       ; vfprintf.c:1578
	;;
#0:	if  c1 br @	.BB11_308
	;;
.BB11_307:                              ; %bb312.bb316_crit_edge
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1578
	;;
#0:	       br	.BB11_309
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1578
	;;
#0:	       add	r0, 8 -> r0     ; vfprintf.c:1578
	;;
#0:	       stm.s	r0, r15, 17
	;;
.BB11_308:                              ; %bb313
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldiu	128 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       add	r10, 8 -> r0
#1:	       ldiu	192 -> r10
	;;
#0:	       stm.s	r0, r15, 17
#1:	       add	r15, r10 -> r10
	;;
#0:	       ldm.s	r15, 60         ; vfprintf.c:1578
#1:	       add	r10, 8 -> r1
	;;
#0:	       callg	___sprint_r     ; vfprintf.c:1578
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1578
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1578
	;;
#0:	if  c3 br @	.BB11_364       ; vfprintf.c:1578
	;;
.BB11_309:                              ; %bb316
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.f	r15, 216        ; vfprintf.c:1579
	;;
#0:	       ldx	$mem, 0 -> r13  ; vfprintf.c:1579
#1:	       ldm.f	r15, 228        ; vfprintf.c:1579
	;;
#0:	       ldx	$mem, 0 -> r12  ; vfprintf.c:1579
#1:	       ldm.s	r15, 52         ; vfprintf.c:1579
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1579
	;;
#1:	       add	r0, r13 -> r1.25 ; vfprintf.c:1579
#0:	       sub	r13, r12 -> r0  ; vfprintf.c:1579
	;;
#1:	       sub	r1.25, r1.26 -> r10 ; vfprintf.c:1579
	;;
#0:	       cmplt	r0, r10 -> c1   ; vfprintf.c:1579
	;;
#0:	if  c1 sub	r13, r12 -> r10
	;;
#0:	       cmplt	r10, 1 -> c1    ; vfprintf.c:1579
	;;
#0:	if  c1 br @	.BB11_313
	;;
.BB11_310:                              ; %bb320
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1579
#1:	       ldiu	128 -> r3       ; vfprintf.c:1579
	;;
#0:	       add	r15, r3 -> r3   ; vfprintf.c:1579
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1579
	;;
#1:	       stm.a	r1.26, r0, 0    ; vfprintf.c:1579
	;;
#0:	       stm.a	r10, r0, 1      ; vfprintf.c:1579
	;;
#0:	       ldm.f	r15, 208        ; vfprintf.c:1579
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1579
	;;
#0:	       add	r0, r10 -> r0   ; vfprintf.c:1579
	;;
#0:	       stm.a	r0, r3, 20      ; vfprintf.c:1579
	;;
#0:	       ldm.s	r15, 56         ; vfprintf.c:1579
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1579
	;;
#0:	       ldm.f	r1, 0           ; vfprintf.c:1579
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1579
	;;
#0:	       add	r0, 1 -> r2     ; vfprintf.c:1579
#1:	       ldi	7 -> r0
	;;
#0:	       cmplt	r0, r2 -> c1    ; vfprintf.c:1579
#1:	       stm.a	r2, r1, 0       ; vfprintf.c:1579
	;;
#0:	if  c1 br @	.BB11_312
	;;
.BB11_311:                              ; %bb320.bb324_crit_edge
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1579
	;;
#0:	       br	.BB11_313
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1579
	;;
#0:	       add	r0, 8 -> r0     ; vfprintf.c:1579
	;;
#0:	       stm.s	r0, r15, 17
	;;
.BB11_312:                              ; %bb321
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldiu	128 -> r2
	;;
#0:	       add	r15, r2 -> r2
	;;
#0:	       add	r2, 8 -> r0
#1:	       ldiu	192 -> r2
	;;
#0:	       stm.s	r0, r15, 17
#1:	       add	r15, r2 -> r2
	;;
#0:	       ldm.s	r15, 60         ; vfprintf.c:1579
#1:	       add	r2, 8 -> r1
	;;
#0:	       callg	___sprint_r     ; vfprintf.c:1579
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1579
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1579
	;;
#0:	if  c3 br @	.BB11_364       ; vfprintf.c:1579
	;;
.BB11_313:                              ; %bb324
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.f	r15, 216        ; vfprintf.c:1579
#1:	       cmplt	r10, 0 -> c1
#2:	       ldi	0 -> r0
	;;
#0:	if !c1 sub	r0, r10 -> r0
	;;
#0:	       ldx	$mem, 0 -> r3   ; vfprintf.c:1579
#1:	       ldm.f	r15, 228        ; vfprintf.c:1579
	;;
#0:	       add	r3, r0 -> r0
	;;
#0:	       ldx	$mem, 0 -> r2   ; vfprintf.c:1579
	;;
#0:	       sub	r0, r2 -> r0
	;;
#0:	       cmplt	r0, 1 -> c1     ; vfprintf.c:1579
	;;
#0:	if  c1 br @	.BB11_348
	;;
.BB11_314:                              ; %bb332.preheader
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       sub	r12, 1 -> r0
#1:	       sub	r1.26, 1 -> r4
	;;
#1:	       sub	r4, r1.25 -> r1
#0:	       sub	r0, r13 -> r0
	;;
#0:	       cmplt	r0, r1 -> c1
	;;
#1:	if  c1 sub	r4, r1.25 -> r0
	;;
#2:	       cmplt	r2.29, r0 -> c1
#0:	       add	r3, r0 -> r1
	;;
#0:	       br	.BB11_319
#1:	       sub	r1, r2 -> r2
#2:	       ldi	-1 -> r1
	;;
#0:	if  c1 or	r0, 0 -> r1
	;;
#0:	       sub	r2, r1 -> r10
	;;
.BB11_315:                              ; %bb327
                                        ;   in Loop: Header=BB11_319 Depth=2
#0:	       ldm.s	r15, 68         ; vfprintf.c:1579
#1:	       ldi	16 -> r0
#2:	       ldiu	128 -> r2       ; vfprintf.c:1579
	;;
#0:	       add	r15, r2 -> r2   ; vfprintf.c:1579
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1579
	;;
#0:	       stm.a	r0, r1, 1       ; vfprintf.c:1579
	;;
#0:	       ldm.f	r15, 208        ; vfprintf.c:1579
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1579
	;;
#0:	       add	r0, 16 -> r0    ; vfprintf.c:1579
	;;
#0:	       stm.a	r0, r2, 20      ; vfprintf.c:1579
	;;
#0:	       ldm.s	r15, 56         ; vfprintf.c:1579
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1579
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1579
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1579
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1579
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1579
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1579
	;;
#0:	if !c1 br @	.BB11_317
	;;
.BB11_316:                              ;   in Loop: Header=BB11_319 Depth=2
#0:	       ldm.s	r15, 68         ; vfprintf.c:1579
	;;
#0:	       br	.BB11_318
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1579
	;;
#0:	       add	r0, 8 -> r0     ; vfprintf.c:1579
	;;
#0:	       stm.s	r0, r15, 17
	;;
.BB11_317:                              ; %bb328
                                        ;   in Loop: Header=BB11_319 Depth=2
#0:	       ldiu	128 -> r12
	;;
#0:	       add	r15, r12 -> r12
	;;
#0:	       add	r12, 8 -> r0
#1:	       ldiu	192 -> r12
	;;
#0:	       stm.s	r0, r15, 17
#1:	       add	r15, r12 -> r12
	;;
#0:	       ldm.s	r15, 60         ; vfprintf.c:1579
#1:	       add	r12, 8 -> r1
	;;
#0:	       callg	___sprint_r     ; vfprintf.c:1579
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1579
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1579
	;;
#0:	if  c3 br @	.BB11_364       ; vfprintf.c:1579
	;;
.BB11_318:                              ; %bb331
                                        ;   in Loop: Header=BB11_319 Depth=2
#0:	       sub	r10, 16 -> r10
	;;
.BB11_319:                              ; %bb332
                                        ;   Parent Loop BB11_26 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldi	16 -> r0
#1:	       ldm.s	r15, 68         ; vfprintf.c:1579
#2:	       ldga	_zeroes.3669 -> r1 ; vfprintf.c:1529
	;;
#0:	       cmplt	r0, r10 -> c1   ; vfprintf.c:1579
	;;
#0:	if  c1 br	.BB11_315
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1579
	;;
#0:	       stm.a	r1, r0, 0       ; vfprintf.c:1579
	;;
	       nop	0
	;;
.BB11_320:                              ; %bb333
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1579
#1:	       ldiu	128 -> r2       ; vfprintf.c:1579
	;;
#0:	       add	r15, r2 -> r2   ; vfprintf.c:1579
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1579
	;;
#0:	       stm.a	r10, r0, 1      ; vfprintf.c:1579
	;;
#0:	       ldm.f	r15, 208        ; vfprintf.c:1579
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1579
	;;
#0:	       add	r0, r10 -> r0
	;;
#0:	       stm.a	r0, r2, 20      ; vfprintf.c:1579
	;;
#0:	       ldm.s	r15, 56         ; vfprintf.c:1579
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1579
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1579
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1579
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1579
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1579
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1579
	;;
#0:	if  c1 br @	.BB11_249
	;;
.BB11_321:                              ; %bb334
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldiu	128 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       add	r10, 8 -> r0
#1:	       ldiu	192 -> r10
	;;
#0:	       stm.s	r0, r15, 17
#1:	       add	r15, r10 -> r10
	;;
#0:	       ldm.s	r15, 60         ; vfprintf.c:1579
#1:	       add	r10, 8 -> r1
	;;
#0:	       callg	___sprint_r     ; vfprintf.c:1579
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1579
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       cmpeq	r0, 0 -> c3     ; vfprintf.c:1579
	;;
#0:	if !c3 br @	.BB11_364       ; vfprintf.c:1579
#1:	if  c3 br @	.BB11_348       ; vfprintf.c:1579
	;;
.BB11_322:                              ; %bb337
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.f	r15, 216        ; vfprintf.c:1583
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1583
	;;
#1:	       cmplt	r1.30, r0 -> c1 ; vfprintf.c:1583
	;;
#0:	if !c1 ldm.s	r15, 76         ; vfprintf.c:1583
	;;
#0:	if !c1 ldx	$mem, 0 -> r0   ; vfprintf.c:1583
	;;
#0:	if !c1 btest	r0, 0 -> c1     ; vfprintf.c:1583
	;;
#0:	if !c1 br @	.BB11_342
	;;
.BB11_323:                              ; %bb340
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 52         ; vfprintf.c:1584
#1:	       ldiu	128 -> r2       ; vfprintf.c:1584
	;;
#0:	       add	r15, r2 -> r2   ; vfprintf.c:1584
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1584
	;;
#0:	       ldm.s	r15, 68         ; vfprintf.c:1584
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1584
	;;
#0:	       stm.a	r1, r0, 0       ; vfprintf.c:1584
	;;
#0:	       stm.a	1, r0, 1        ; vfprintf.c:1584
	;;
#0:	       ldm.f	r15, 208        ; vfprintf.c:1584
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1584
	;;
#0:	       add	r0, 1 -> r0     ; vfprintf.c:1584
	;;
#0:	       stm.a	r0, r2, 20      ; vfprintf.c:1584
	;;
#0:	       ldm.s	r15, 56         ; vfprintf.c:1584
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1584
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1584
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1584
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1584
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1584
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1584
	;;
#0:	if !c1 br @	.BB11_325
	;;
.BB11_324:                              ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1584
#1:	       br	.BB11_326
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1584
	;;
#0:	       add	r0, 8 -> r10    ; vfprintf.c:1584
	;;
.BB11_325:                              ; %bb341
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldiu	128 -> r12
#1:	       ldm.s	r15, 60         ; vfprintf.c:1584
	;;
#0:	       add	r15, r12 -> r12
	;;
#0:	       callg	___sprint_r     ; vfprintf.c:1584
#1:	       add	r12, 8 -> r10
#2:	       ldiu	192 -> r12
#3:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1584
	;;
#0:	       add	r15, r12 -> r12
	;;
#0:	       add	r12, 8 -> r1
	;;
	       nop	0
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1584
	;;
#0:	if  c3 br @	.BB11_364       ; vfprintf.c:1584
	;;
.BB11_326:                              ; %bb344
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldga	._.str69 -> r0  ; vfprintf.c:1544
#1:	       ldiu	128 -> r2       ; vfprintf.c:1586
	;;
#0:	       stm.a	r0, r10, 0      ; vfprintf.c:1586
#1:	       add	r15, r2 -> r2   ; vfprintf.c:1586
	;;
#0:	       ldm.s	r15, 36         ; vfprintf.c:1586
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1586
	;;
#0:	       stm.a	r0, r10, 1      ; vfprintf.c:1586
	;;
#0:	       ldm.f	r15, 208        ; vfprintf.c:1586
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1586
	;;
#0:	       add	r1, r0 -> r0    ; vfprintf.c:1586
	;;
#0:	       stm.a	r0, r2, 20      ; vfprintf.c:1586
	;;
#0:	       ldm.s	r15, 52         ; vfprintf.c:1585
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1585
	;;
#0:	       ldm.s	r15, 56         ; vfprintf.c:1586
#1:	       add	r0, 1 -> r12    ; vfprintf.c:1585
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1586
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1586
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1586
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1586
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1586
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1586
	;;
#0:	if !c1 br @	.BB11_328
	;;
.BB11_327:                              ;   in Loop: Header=BB11_26 Depth=1
#0:	       add	r10, 8 -> r10   ; vfprintf.c:1586
#1:	       br @	.BB11_329
	;;
.BB11_328:                              ; %bb345
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldiu	128 -> r13
#1:	       ldm.s	r15, 60         ; vfprintf.c:1586
	;;
#0:	       add	r15, r13 -> r13
	;;
#0:	       callg	___sprint_r     ; vfprintf.c:1586
#1:	       add	r13, 8 -> r10
#2:	       ldiu	192 -> r13
#3:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1586
	;;
#0:	       add	r15, r13 -> r13
	;;
#0:	       add	r13, 8 -> r1
	;;
	       nop	0
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1586
	;;
#0:	if  c3 br @	.BB11_364       ; vfprintf.c:1586
	;;
.BB11_329:                              ; %bb348
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       fop	dcmp	d5, d6 -> f0 ; vfprintf.c:1587
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r0       ; vfprintf.c:1587
	;;
#0:	       btest	r0, 0 -> c1     ; vfprintf.c:1587
	;;
#0:	if  c1 br @	.BB11_333
	;;
.BB11_330:                              ; %bb349
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       stm.a	r12, r10, 0     ; vfprintf.c:1588
#1:	       ldiu	128 -> r2       ; vfprintf.c:1588
	;;
#0:	       ldm.f	r15, 216        ; vfprintf.c:1588
#1:	       add	r15, r2 -> r2   ; vfprintf.c:1588
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1588
	;;
#0:	       sub	r0, 1 -> r0
	;;
#0:	       stm.a	r0, r10, 1      ; vfprintf.c:1588
	;;
#0:	       ldm.f	r15, 208        ; vfprintf.c:1588
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1588
#1:	       ldm.f	r15, 216        ; vfprintf.c:1588
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1588
	;;
#0:	       add	r1, r0 -> r0
	;;
#0:	       sub	r0, 1 -> r0     ; vfprintf.c:1588
	;;
#0:	       stm.a	r0, r2, 20      ; vfprintf.c:1588
	;;
#0:	       ldm.s	r15, 56         ; vfprintf.c:1588
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1588
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1588
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1588
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1588
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1588
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1588
	;;
#0:	if !c1 br @	.BB11_332
	;;
.BB11_331:                              ;   in Loop: Header=BB11_26 Depth=1
#0:	       add	r10, 8 -> r10   ; vfprintf.c:1588
#1:	       br @	.BB11_345
	;;
.BB11_332:                              ; %bb350
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldiu	128 -> r12
#1:	       ldm.s	r15, 60         ; vfprintf.c:1588
	;;
#0:	       add	r15, r12 -> r12
	;;
#0:	       callg	___sprint_r     ; vfprintf.c:1588
#1:	       add	r12, 8 -> r10
#2:	       ldiu	192 -> r12
#3:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1588
	;;
#0:	       add	r15, r12 -> r12
	;;
#0:	       add	r12, 8 -> r1
	;;
	       nop	0
	;;
#0:	       brz eq @	r0, .BB11_345   ; vfprintf.c:1588
	;;
#0:	       br @	.BB11_364       ; vfprintf.c:1588
	;;
.BB11_333:                              ; %bb353
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.f	r15, 216        ; vfprintf.c:1591
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1591
	;;
#0:	       sub	r0, 1 -> r12
	;;
#0:	       cmplt	r12, 1 -> c1    ; vfprintf.c:1591
	;;
#0:	if  c1 br @	.BB11_345
#1:	if !c1 br @	.BB11_338
	;;
.BB11_334:                              ; %bb354
                                        ;   in Loop: Header=BB11_338 Depth=2
#0:	       ldi	16 -> r0
#1:	       ldiu	128 -> r2       ; vfprintf.c:1591
	;;
#0:	       stm.a	r0, r10, 1      ; vfprintf.c:1591
#1:	       add	r15, r2 -> r2   ; vfprintf.c:1591
	;;
#0:	       ldm.f	r15, 208        ; vfprintf.c:1591
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1591
	;;
#0:	       add	r0, 16 -> r0    ; vfprintf.c:1591
	;;
#0:	       stm.a	r0, r2, 20      ; vfprintf.c:1591
	;;
#0:	       ldm.s	r15, 56         ; vfprintf.c:1591
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1591
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1591
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1591
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1591
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1591
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1591
	;;
#0:	if !c1 br @	.BB11_336
	;;
.BB11_335:                              ;   in Loop: Header=BB11_338 Depth=2
#0:	       add	r10, 8 -> r10   ; vfprintf.c:1591
#1:	       br @	.BB11_337
	;;
.BB11_336:                              ; %bb355
                                        ;   in Loop: Header=BB11_338 Depth=2
#0:	       ldiu	128 -> r13
#1:	       ldm.s	r15, 60         ; vfprintf.c:1591
	;;
#0:	       add	r15, r13 -> r13
	;;
#0:	       callg	___sprint_r     ; vfprintf.c:1591
#1:	       add	r13, 8 -> r10
#2:	       ldiu	192 -> r13
#3:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1591
	;;
#0:	       add	r15, r13 -> r13
	;;
#0:	       add	r13, 8 -> r1
	;;
	       nop	0
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1591
	;;
#0:	if  c3 br @	.BB11_364       ; vfprintf.c:1591
	;;
.BB11_337:                              ; %bb358
                                        ;   in Loop: Header=BB11_338 Depth=2
#0:	       sub	r12, 16 -> r12
	;;
.BB11_338:                              ; %bb359
                                        ;   Parent Loop BB11_26 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldi	16 -> r0
	;;
#0:	       cmplt	r0, r12 -> c1   ; vfprintf.c:1591
#1:	       ldga	_zeroes.3669 -> r0 ; vfprintf.c:1529
	;;
#0:	if  c1 br @	.BB11_334
#1:	       stm.a	r0, r10, 0      ; vfprintf.c:1591
	;;
.BB11_339:                              ; %bb360
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       stm.a	r12, r10, 1     ; vfprintf.c:1591
#1:	       ldiu	128 -> r2       ; vfprintf.c:1591
	;;
#0:	       ldm.f	r15, 208        ; vfprintf.c:1591
#1:	       add	r15, r2 -> r2   ; vfprintf.c:1591
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1591
	;;
#0:	       add	r0, r12 -> r0
	;;
#0:	       stm.a	r0, r2, 20      ; vfprintf.c:1591
	;;
#0:	       ldm.s	r15, 56         ; vfprintf.c:1591
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1591
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1591
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1591
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1591
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1591
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1591
	;;
#0:	if !c1 br @	.BB11_341
	;;
.BB11_340:                              ;   in Loop: Header=BB11_26 Depth=1
#0:	       add	r10, 8 -> r10   ; vfprintf.c:1591
#1:	       br @	.BB11_345
	;;
.BB11_341:                              ; %bb361
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldiu	128 -> r12
#1:	       ldm.s	r15, 60         ; vfprintf.c:1591
	;;
#0:	       add	r15, r12 -> r12
	;;
#0:	       callg	___sprint_r     ; vfprintf.c:1591
#1:	       add	r12, 8 -> r10
#2:	       ldiu	192 -> r12
#3:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1591
	;;
#0:	       add	r15, r12 -> r12
	;;
#0:	       add	r12, 8 -> r1
	;;
	       nop	0
	;;
#0:	       brz eq @	r0, .BB11_345   ; vfprintf.c:1591
	;;
#0:	       br @	.BB11_364       ; vfprintf.c:1591
	;;
.BB11_342:                              ; %bb364
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 52         ; vfprintf.c:1593
#1:	       ldiu	128 -> r2       ; vfprintf.c:1593
	;;
#0:	       add	r15, r2 -> r2   ; vfprintf.c:1593
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1593
	;;
#0:	       ldm.s	r15, 68         ; vfprintf.c:1593
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1593
	;;
#0:	       stm.a	r1, r0, 0       ; vfprintf.c:1593
	;;
#0:	       stm.a	1, r0, 1        ; vfprintf.c:1593
	;;
#0:	       ldm.f	r15, 208        ; vfprintf.c:1593
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1593
	;;
#0:	       add	r0, 1 -> r0     ; vfprintf.c:1593
	;;
#0:	       stm.a	r0, r2, 20      ; vfprintf.c:1593
	;;
#0:	       ldm.s	r15, 56         ; vfprintf.c:1593
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1593
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1593
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1593
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1593
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1593
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1593
	;;
#0:	if !c1 br @	.BB11_344
	;;
.BB11_343:                              ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1593
#1:	       br	.BB11_345
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1593
	;;
#0:	       add	r0, 8 -> r10    ; vfprintf.c:1593
	;;
.BB11_344:                              ; %bb365
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldiu	128 -> r12
#1:	       ldm.s	r15, 60         ; vfprintf.c:1593
	;;
#0:	       add	r15, r12 -> r12
	;;
#0:	       callg	___sprint_r     ; vfprintf.c:1593
#1:	       add	r12, 8 -> r10
#2:	       ldiu	192 -> r12
#3:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1593
	;;
#0:	       add	r15, r12 -> r12
	;;
#0:	       add	r12, 8 -> r1
	;;
	       nop	0
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1593
	;;
#0:	if  c3 br @	.BB11_364       ; vfprintf.c:1593
	;;
.BB11_345:                              ; %bb368
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 32         ; vfprintf.c:1594
#1:	       ldiu	128 -> r2       ; vfprintf.c:1594
	;;
#0:	       add	r15, r2 -> r2   ; vfprintf.c:1594
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1594
	;;
#0:	       stm.a	r0, r10, 0      ; vfprintf.c:1594
	;;
#0:	       ldm.s	r15, 28         ; vfprintf.c:1594
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1594
	;;
#0:	       stm.a	r0, r10, 1      ; vfprintf.c:1594
	;;
#0:	       ldm.f	r15, 208        ; vfprintf.c:1594
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1594
	;;
#0:	       add	r1, r0 -> r0    ; vfprintf.c:1594
	;;
#0:	       stm.a	r0, r2, 20      ; vfprintf.c:1594
	;;
#0:	       ldm.s	r15, 56         ; vfprintf.c:1594
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1594
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1594
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1594
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1594
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1594
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1594
	;;
#0:	if !c1 br @	.BB11_347
	;;
.BB11_346:                              ;   in Loop: Header=BB11_26 Depth=1
#0:	       add	r10, 8 -> r0    ; vfprintf.c:1594
#1:	       br	.BB11_348
	;;
#0:	       stm.s	r0, r15, 17
	;;
	       nop	0
	;;
.BB11_347:                              ; %bb370
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldiu	128 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       add	r10, 8 -> r0
#1:	       ldiu	192 -> r10
	;;
#0:	       stm.s	r0, r15, 17
#1:	       add	r15, r10 -> r10
	;;
#0:	       ldm.s	r15, 60         ; vfprintf.c:1594
#1:	       add	r10, 8 -> r1
	;;
#0:	       callg	___sprint_r     ; vfprintf.c:1594
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1594
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       cmpne	r0, 0 -> c3     ; vfprintf.c:1594
	;;
#0:	if  c3 br @	.BB11_364       ; vfprintf.c:1594
	;;
.BB11_348:                              ; %bb373
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 76         ; vfprintf.c:1601
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1601
	;;
#0:	       btest	r0, 2 -> c1     ; vfprintf.c:1601
	;;
#0:	if !c1 br @	.BB11_357
	;;
.BB11_349:                              ; %bb374
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 72         ; vfprintf.c:1602
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1602
	;;
#0:	       sub	r0, r14 -> r10  ; vfprintf.c:1602
	;;
#0:	       cmplt	r10, 1 -> c1    ; vfprintf.c:1602
	;;
#0:	if  c1 br @	.BB11_357
#1:	if !c1 br @	.BB11_354
	;;
.BB11_350:                              ; %bb375
                                        ;   in Loop: Header=BB11_354 Depth=2
#0:	       ldm.s	r15, 68         ; vfprintf.c:1602
#1:	       ldi	16 -> r0
#2:	       ldiu	128 -> r2       ; vfprintf.c:1602
	;;
#0:	       add	r15, r2 -> r2   ; vfprintf.c:1602
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1602
	;;
#0:	       stm.a	r0, r1, 1       ; vfprintf.c:1602
	;;
#0:	       ldm.f	r15, 208        ; vfprintf.c:1602
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1602
	;;
#0:	       add	r0, 16 -> r0    ; vfprintf.c:1602
	;;
#0:	       stm.a	r0, r2, 20      ; vfprintf.c:1602
	;;
#0:	       ldm.s	r15, 56         ; vfprintf.c:1602
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1602
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1602
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1602
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1602
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1602
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1602
	;;
#0:	if !c1 br @	.BB11_352
	;;
.BB11_351:                              ;   in Loop: Header=BB11_354 Depth=2
#0:	       ldm.s	r15, 68         ; vfprintf.c:1602
	;;
#0:	       br	.BB11_353
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1602
	;;
#0:	       add	r0, 8 -> r0     ; vfprintf.c:1602
	;;
#0:	       stm.s	r0, r15, 17
	;;
.BB11_352:                              ; %bb376
                                        ;   in Loop: Header=BB11_354 Depth=2
#0:	       ldiu	128 -> r12
	;;
#0:	       add	r15, r12 -> r12
	;;
#0:	       add	r12, 8 -> r0
#1:	       ldiu	192 -> r12
	;;
#0:	       stm.s	r0, r15, 17
#1:	       add	r15, r12 -> r12
	;;
#0:	       ldm.s	r15, 60         ; vfprintf.c:1602
#1:	       add	r12, 8 -> r1
	;;
#0:	       callg	___sprint_r     ; vfprintf.c:1602
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1602
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz ne @	r0, .BB11_364   ; vfprintf.c:1602
	;;
.BB11_353:                              ; %bb379
                                        ;   in Loop: Header=BB11_354 Depth=2
#0:	       sub	r10, 16 -> r10
	;;
.BB11_354:                              ; %bb380
                                        ;   Parent Loop BB11_26 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldi	16 -> r0
#1:	       ldm.s	r15, 68         ; vfprintf.c:1602
#2:	       ldga	_blanks.3668 -> r1 ; vfprintf.c:1519
	;;
#0:	       cmplt	r0, r10 -> c1   ; vfprintf.c:1602
	;;
#0:	if  c1 br	.BB11_350
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1602
	;;
#0:	       stm.a	r1, r0, 0       ; vfprintf.c:1602
	;;
	       nop	0
	;;
.BB11_355:                              ; %bb381
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 68         ; vfprintf.c:1602
#1:	       ldiu	128 -> r2       ; vfprintf.c:1602
	;;
#0:	       add	r15, r2 -> r2   ; vfprintf.c:1602
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1602
	;;
#0:	       stm.a	r10, r0, 1      ; vfprintf.c:1602
	;;
#0:	       ldm.f	r15, 208        ; vfprintf.c:1602
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1602
	;;
#0:	       add	r0, r10 -> r0
	;;
#0:	       stm.a	r0, r2, 20      ; vfprintf.c:1602
	;;
#0:	       ldm.s	r15, 56         ; vfprintf.c:1602
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1602
	;;
#0:	       ldm.f	r0, 0           ; vfprintf.c:1602
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1602
	;;
#0:	       add	r1, 1 -> r1     ; vfprintf.c:1602
	;;
#0:	       cmplt	r1, 8 -> c1     ; vfprintf.c:1602
#1:	       stm.a	r1, r0, 0       ; vfprintf.c:1602
	;;
#0:	if  c1 br @	.BB11_357
	;;
.BB11_356:                              ; %bb382
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 60         ; vfprintf.c:1602
#1:	       ldiu	192 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       callg	___sprint_r     ; vfprintf.c:1602
#1:	       add	r10, 8 -> r1
#2:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1602
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz ne @	r0, .BB11_364   ; vfprintf.c:1602
	;;
.BB11_357:                              ; %bb385
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 72         ; vfprintf.c:1605
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1605
	;;
#0:	       ldm.s	r15, 48         ; vfprintf.c:1605
#1:	       cmple	r0, r14 -> c1   ; vfprintf.c:1605
	;;
#0:	if  c1 or	r14, 0 -> r0    ; vfprintf.c:1605
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:1605
	;;
#0:	       add	r0, r1 -> r1    ; vfprintf.c:1605
	;;
#0:	       stm.s	r1, r15, 12     ; vfprintf.c:1607
	;;
#0:	       ldm.f	r15, 208        ; vfprintf.c:1607
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1607
	;;
#0:	       brz eq @	r0, .BB11_359   ; vfprintf.c:1607
	;;
.BB11_358:                              ; %bb388
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 60         ; vfprintf.c:1607
#1:	       ldiu	192 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       callg	___sprint_r     ; vfprintf.c:1607
#1:	       add	r10, 8 -> r1
#2:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1607
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz ne @	r0, .BB11_364   ; vfprintf.c:1607
	;;
.BB11_359:                              ; %bb389
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       ldm.s	r15, 56         ; vfprintf.c:1607
#1:	       or	r11, 0 -> r13
	;;
#0:	       br	.BB11_26
#2:	       or	r2.24, 0 -> r14
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1607
	;;
#0:	       stm.a	0, r0, 0        ; vfprintf.c:1607
	;;
.BB11_360:                              ; %bb167
                                        ;   in Loop: Header=BB11_26 Depth=1
#0:	       s2add	r10, 12 -> r0   ; vfprintf.c:1425
#1:	       br @	.BB11_206
	;;
.BB11_361:                              ; %done
#0:	       ldm.f	r15, 208        ; vfprintf.c:1615
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1615
	;;
#0:	       brz eq @	r0, .BB11_363   ; vfprintf.c:1615
	;;
.BB11_362:                              ; %bb392
#0:	       ldm.s	r15, 60         ; vfprintf.c:1615
#1:	       ldiu	192 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       callg	___sprint_r     ; vfprintf.c:1615
#1:	       add	r10, 8 -> r1
#2:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1615
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz ne @	r0, .BB11_364   ; vfprintf.c:1615
	;;
.BB11_363:                              ; %bb393
#0:	       ldm.s	r15, 56         ; vfprintf.c:1615
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:1615
	;;
#0:	       stm.a	0, r0, 0        ; vfprintf.c:1615
	;;
.BB11_364:                              ; %bb396
#0:	       ldm.s	r15, 60
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       ldm.f	r0, 12
#1:	       ldiu	lo11{ ___mem_emergency } -> r0
	;;
#2:	       ldx	$mem, 0 -> r2.31
	;;
#2:	       stm.a	r2.31, r0, 0
	;;
#0:	       ldm.s	r15, 24
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       ldmg.d	___mem_emergency
	;;
#0:	       ldx	$memhu, r0 -> r1
#1:	       ldm.s	r15, 48
#2:	       ldi	-1 -> r0
	;;
#0:	       br	.BB11_24
#1:	       btest	r1, 6 -> c1
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	if !c1 or	r1, 0 -> r0
	;;
	.align	4
__vfprintf_r_end:
	.section	.rodata,"a",@progbits
	.align	4
.JTI11_0:
	.long	.BB11_58-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_60-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_61-__vfprintf_r_start
	.long	.BB11_64-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_63-__vfprintf_r_start
	.long	.BB11_48-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_67-__vfprintf_r_start
	.long	.BB11_46-__vfprintf_r_start
	.long	.BB11_46-__vfprintf_r_start
	.long	.BB11_46-__vfprintf_r_start
	.long	.BB11_46-__vfprintf_r_start
	.long	.BB11_46-__vfprintf_r_start
	.long	.BB11_46-__vfprintf_r_start
	.long	.BB11_46-__vfprintf_r_start
	.long	.BB11_46-__vfprintf_r_start
	.long	.BB11_46-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_72-__vfprintf_r_start
	.long	.BB11_78-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_78-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_69-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_135-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_169-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_175-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_71-__vfprintf_r_start
	.long	.BB11_73-__vfprintf_r_start
	.long	.BB11_78-__vfprintf_r_start
	.long	.BB11_78-__vfprintf_r_start
	.long	.BB11_78-__vfprintf_r_start
	.long	.BB11_70-__vfprintf_r_start
	.long	.BB11_73-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_43-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_27-__vfprintf_r_start
	.long	.BB11_136-__vfprintf_r_start
	.long	.BB11_140-__vfprintf_r_start
	.long	.BB11_43-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_141-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_170-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_209-__vfprintf_r_start
	.long	.BB11_174-__vfprintf_r_start

	.text
	.align	4
__cleanup_r:                            ; @_cleanup_r
	.size	__cleanup_r_end-__cleanup_r
__cleanup_r_start:
; BB#0:                                 ; %entry
#0:	       ldiu	48 -> r2
#1:	       wb.s	r15, 12
#2:	       ldi	736 -> r1
	;;
#0:	       sub	r15, r2 -> r15
#1:	       ldx	$rb, 0 -> r2
	;;
#0:	       stm.s	r10, r15, 7
	;;
#0:	       stm.s	r11, r15, 6
	;;
#0:	       stm.s	r12, r15, 5
	;;
#0:	       stm.s	r13, r15, 4
#1:	       add	r0, r1 -> r13   ; fwalk.c:47[ findfp.c:165 ]
	;;
#0:	       brz eq	r13, .BB12_21   ; fwalk.c:47[ findfp.c:165 ]
#1:	       stm.s	r2, r15, 3
#2:	       ldx	$ro, 0 -> r2
	;;
#0:	       stm.s	r2, r15, 2
	;;
	       nop	0
	;;
.BB12_1:                                ; %bb.i
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB12_3 Depth 2
#0:	       ldm.f	r13, 4          ; fwalk.c:48[ findfp.c:165 ]
	;;
#0:	       ldx	$mem, 0 -> r12  ; fwalk.c:48[ findfp.c:165 ]
	;;
#0:	       cmplt	r12, 1 -> c1    ; fwalk.c:48[ findfp.c:165 ]
	;;
#0:	if  c1 br @	.BB12_20
	;;
.BB12_2:                                ; %bb.nph.i
                                        ;   in Loop: Header=BB12_1 Depth=1
#0:	       ldm.f	r13, 8          ; fwalk.c:48[ findfp.c:165 ]
	;;
#0:	       ldx	$mem, 0 -> r10  ; fwalk.c:48[ findfp.c:165 ]
	;;
.BB12_3:                                ; %bb1.i
                                        ;   Parent Loop BB12_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r10, 12         ; fwalk.c:49[ findfp.c:165 ]
#1:	       add	r10, 12 -> r11
	;;
#0:	       ldx	$memhu, r11 -> r2 ; fwalk.c:49[ findfp.c:165 ]
	;;
#0:	       cmpult	r2, 2 -> c1     ; fwalk.c:49[ findfp.c:165 ]
	;;
#0:	if  c1 br @	.BB12_19
	;;
.BB12_4:                                ; %bb3.i
                                        ;   in Loop: Header=BB12_3 Depth=2
#0:	       ldm.f	r10, 14         ; fwalk.c:51[ findfp.c:165 ]
#1:	       add	r10, 14 -> r0
#2:	       ldiu	2047 -> r1
#3:	       cmpeq	r10, 0 -> c1    ; fclose.c:74[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	       ldim	31 -> r1
	;;
#0:	       ldx	$memhu, r0 -> r0 ; fwalk.c:51[ findfp.c:165 ]
	;;
#0:	       cmpeq	r0, r1 -> c2    ; fwalk.c:51[ findfp.c:165 ]
	;;
#0:	       comb	or c2, c1 -> c1
	;;
#0:	if  c1 br @	.BB12_19
	;;
.BB12_5:                                ; %bb1.i.i.i
                                        ;   in Loop: Header=BB12_3 Depth=2
#0:	       ldmg.d	_impure_data+56 ; fclose.c:77[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; fclose.c:77[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	       brz ne @	r0, .BB12_7     ; fclose.c:77[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
.BB12_6:                                ; %bb3.i.i.i
                                        ;   in Loop: Header=BB12_3 Depth=2
#0:	       callg	___sinit        ; fclose.c:77[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldm.f	r10, 12
	;;
#0:	       ldx	$memhu, r11 -> r2
	;;
.BB12_7:                                ; %bb4.i.i.i
                                        ;   in Loop: Header=BB12_3 Depth=2
#0:	       bbh	zext16 r2 -> r0 ; fclose.c:81[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	       brz eq @	r0, .BB12_19    ; fclose.c:81[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
.BB12_8:                                ; %bb6.i.i.i
                                        ;   in Loop: Header=BB12_3 Depth=2
#0:	       or	r10, 0 -> r0    ; fclose.c:89[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
#1:	       callg	__fflush_r      ; fclose.c:89[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldm.f	r10, 44         ; fclose.c:90[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	       ldx	$mem, 0 -> r2   ; fclose.c:90[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	       brz eq @	r2, .BB12_10    ; fclose.c:90[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
.BB12_9:                                ; %bb7.i.i.i
                                        ;   in Loop: Header=BB12_3 Depth=2
#0:	       ldm.f	r10, 28         ; fclose.c:90[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
#1:	       ldga	_impure_data -> r0 ; fclose.c:90[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; fclose.c:90[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	       jop	call	r2      ; fclose.c:90[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB12_10:                               ; %bb9.i.i.i
                                        ;   in Loop: Header=BB12_3 Depth=2
#0:	       ldm.f	r10, 12
	;;
#0:	       ldx	$memhu, r11 -> r0
	;;
#0:	       btest	r0, 7 -> c1     ; fclose.c:92[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	if !c1 br @	.BB12_12
	;;
.BB12_11:                               ; %bb10.i.i.i
                                        ;   in Loop: Header=BB12_3 Depth=2
#0:	       ldm.f	r10, 16         ; fclose.c:93[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	       callg	__free_r        ; fclose.c:93[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
#1:	       ldx	$mem, 0 -> r0   ; fclose.c:93[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB12_12:                               ; %bb11.i.i.i
                                        ;   in Loop: Header=BB12_3 Depth=2
#0:	       ldm.f	r10, 48         ; fclose.c:94[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; fclose.c:94[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	       brz eq @	r0, .BB12_16    ; fclose.c:94[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
.BB12_13:                               ; %bb12.i.i.i
                                        ;   in Loop: Header=BB12_3 Depth=2
#0:	       s2add	r10, 16 -> r1
	;;
#0:	       cmpeq	r1, r0 -> c1    ; fclose.c:95[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	if  c1 br @	.BB12_15
	;;
.BB12_14:                               ; %bb13.i.i.i
                                        ;   in Loop: Header=BB12_3 Depth=2
#0:	       callg	__free_r        ; fclose.c:95[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB12_15:                               ; %bb14.i.i.i
                                        ;   in Loop: Header=BB12_3 Depth=2
#0:	       stm.a	0, r10, 12      ; fclose.c:95[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
.BB12_16:                               ; %bb15.i.i.i
                                        ;   in Loop: Header=BB12_3 Depth=2
#0:	       ldm.f	r10, 68         ; fclose.c:96[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; fclose.c:96[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	       brz eq @	r0, .BB12_18    ; fclose.c:96[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
.BB12_17:                               ; %bb16.i.i.i
                                        ;   in Loop: Header=BB12_3 Depth=2
#0:	       callg	__free_r        ; fclose.c:97[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       stm.a	0, r10, 17      ; fclose.c:97[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
.BB12_18:                               ; %bb17.i.i.i
                                        ;   in Loop: Header=BB12_3 Depth=2
#0:	       stmh.a	0, r10, 6       ; fclose.c:99[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
.BB12_19:                               ; %bb5.i
                                        ;   in Loop: Header=BB12_3 Depth=2
#0:	       sub	r12, 1 -> r12
#1:	       s2add	r10, 26 -> r10
	;;
#0:	       brz ne @	r12, .BB12_3    ; fwalk.c:48[ findfp.c:165 ]
	;;
.BB12_20:                               ; %bb7.i
                                        ;   in Loop: Header=BB12_1 Depth=1
#0:	       ldm.f	r13, 0          ; fwalk.c:47[ findfp.c:165 ]
	;;
#0:	       ldx	$mem, 0 -> r13  ; fwalk.c:47[ findfp.c:165 ]
	;;
#0:	       brz ne @	r13, .BB12_1    ; fwalk.c:47[ findfp.c:165 ]
	;;
.BB12_21:                               ; %_fwalk.exit
#0:	       ldm.s	r15, 8          ; findfp.c:167
	;;
#0:	       ldx	$mem, 0 -> r0   ; findfp.c:167
	;;
#0:	       stx	r0 -> $ro       ; findfp.c:167
	;;
#0:	       ldm.s	r15, 12         ; findfp.c:167
	;;
#0:	       ldx	$mem, 0 -> r0   ; findfp.c:167
	;;
#0:	       stx	r0 -> $rb       ; findfp.c:167
	;;
#0:	       ldm.s	r15, 16         ; findfp.c:167
	;;
#0:	       ldx	$mem, 0 -> r13  ; findfp.c:167
	;;
#0:	       ldm.s	r15, 20         ; findfp.c:167
	;;
#0:	       ldx	$mem, 0 -> r12  ; findfp.c:167
	;;
#0:	       ldm.s	r15, 24         ; findfp.c:167
	;;
#0:	       ldx	$mem, 0 -> r11  ; findfp.c:167
	;;
#0:	       ldm.s	r15, 28         ; findfp.c:167
#1:	       s2add	r15, 12 -> r15  ; findfp.c:167
	;;
#0:	       jop	ret             ; findfp.c:167
#1:	       ldx	$mem, 0 -> r10  ; findfp.c:167
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
__cleanup_r_end:

	.align	4
___sinit:                               ; @__sinit
	.size	___sinit_end-___sinit
___sinit_start:
; BB#0:                                 ; %entry
#0:	       ldiu	40 -> r1        ; findfp.c:187
#1:	       wb.s	r15, 10         ; findfp.c:187
	;;
#0:	       sub	r15, r1 -> r15  ; findfp.c:187
#1:	       ldx	$rb, 0 -> r1    ; findfp.c:187
	;;
#0:	       stm.s	r10, r15, 5     ; findfp.c:187
	;;
#0:	       stm.s	r11, r15, 4     ; findfp.c:187
	;;
#0:	       stm.s	r1, r15, 3      ; findfp.c:187
#1:	       ldx	$ro, 0 -> r1    ; findfp.c:187
	;;
#0:	       stm.s	r1, r15, 2      ; findfp.c:187
	;;
#0:	       ldmg.d	_impure_data+56 ; findfp.c:187
	;;
#0:	       ldx	$mem, 0 -> r0   ; findfp.c:187
	;;
#0:	       brz eq @	r0, .BB13_2     ; findfp.c:187
	;;
.BB13_1:                                ; %bb
#0:	       ldm.s	r15, 8          ; findfp.c:227
	;;
#0:	       ldx	$mem, 0 -> r0   ; findfp.c:227
	;;
#0:	       stx	r0 -> $ro       ; findfp.c:227
	;;
#0:	       ldm.s	r15, 12         ; findfp.c:227
	;;
#0:	       ldx	$mem, 0 -> r0   ; findfp.c:227
	;;
#0:	       stx	r0 -> $rb       ; findfp.c:227
	;;
#0:	       ldm.s	r15, 16         ; findfp.c:227
	;;
#0:	       ldx	$mem, 0 -> r11  ; findfp.c:227
	;;
#0:	       ldm.s	r15, 20         ; findfp.c:227
#1:	       s2add	r15, 10 -> r15  ; findfp.c:227
	;;
#0:	       jop	ret             ; findfp.c:227
#1:	       ldx	$mem, 0 -> r10  ; findfp.c:227
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB13_2:                                ; %bb1
#0:	       ldga	_impure_data -> r0.16 ; findfp.c:194
#1:	       ldga	__cleanup_r -> r1 ; findfp.c:194
#2:	       ldi	736 -> r0
#3:	       ldi	744 -> r3
	;;
#0:	       stm.a	r1, r0.16, 15   ; findfp.c:194
#1:	       ldi	740 -> r1
	;;
#0:	       add	r0.16, r0 -> r2 ; findfp.c:197
#1:	       ldi	748 -> r0
	;;
#0:	       stm.a	1, r0.16, 14    ; findfp.c:195
	;;
#1:	       stm.a	0, r2, 0        ; findfp.c:197
#0:	       add	r0.16, r1 -> r1 ; findfp.c:199
	;;
#1:	       stm.a	3, r1, 0        ; findfp.c:199
#0:	       add	r0.16, r0 -> r0 ; findfp.c:200
#2:	       ldi	0 -> r1
	;;
#0:	       add	r0.16, r3 -> r2 ; findfp.c:200
	;;
#0:	       stm.a	r0, r2, 0       ; findfp.c:200
#1:	       ldi	8 -> r2
	;;
#0:	       ldmg.d	_impure_data+4  ; findfp.c:209
	;;
#0:	       ldx	$mem, 0 -> r10  ; findfp.c:209
	;;
#0:	       stm.a	0, r10, 0
#1:	       s2add	r10, 23 -> r0
	;;
#0:	       stm.a	0, r10, 1
	;;
#0:	       stm.a	0, r10, 2
	;;
#0:	       stmh.a	4, r10, 6
	;;
#0:	       stm.a	0, r10, 25
	;;
#0:	       stmh.a	0, r10, 7
	;;
#0:	       stm.a	0, r10, 4
	;;
#0:	       stm.a	0, r10, 5
	;;
#0:	       stm.a	0, r10, 6
	;;
#0:	       callg	_memset
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       stm.a	r10, r10, 7
#1:	       ldga	___sread -> r0
#2:	       ldi	0 -> r1
#3:	       ldi	8 -> r2
	;;
#0:	       stm.a	r0, r10, 8
#1:	       ldga	___swrite -> r0
#2:	       ldi	18 -> r11
	;;
#0:	       stm.a	r0, r10, 9
#1:	       ldga	___sseek -> r0
	;;
#0:	       stm.a	r0, r10, 10
#1:	       ldga	___sclose -> r0
	;;
#0:	       stm.a	r0, r10, 11
	;;
#0:	       ldmg.d	_impure_data+8  ; findfp.c:220
	;;
#0:	       ldx	$mem, 0 -> r10  ; findfp.c:220
	;;
#0:	       stm.a	0, r10, 0
#1:	       s2add	r10, 23 -> r0
	;;
#0:	       stm.a	0, r10, 1
	;;
#0:	       stm.a	0, r10, 2
	;;
#0:	       stmh.a	9, r10, 6
	;;
#0:	       stm.a	0, r10, 25
	;;
#0:	       stmh.a	1, r10, 7
	;;
#0:	       stm.a	0, r10, 4
	;;
#0:	       stm.a	0, r10, 5
	;;
#0:	       stm.a	0, r10, 6
	;;
#0:	       callg	_memset
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       stm.a	r10, r10, 7
#1:	       ldga	___sread -> r0
#2:	       ldi	0 -> r1
#3:	       ldi	8 -> r2
	;;
#0:	       stm.a	r0, r10, 8
#1:	       ldga	___swrite -> r0
	;;
#0:	       stm.a	r0, r10, 9
#1:	       ldga	___sseek -> r0
	;;
#0:	       stm.a	r0, r10, 10
#1:	       ldga	___sclose -> r0
	;;
#0:	       stm.a	r0, r10, 11
	;;
#0:	       ldmg.d	_impure_data+12 ; findfp.c:225
	;;
#0:	       ldx	$mem, 0 -> r10  ; findfp.c:225
	;;
#0:	       stm.a	0, r10, 0
#1:	       s2add	r10, 23 -> r0
	;;
#0:	       stm.a	0, r10, 1
	;;
#0:	       stm.a	0, r10, 2
	;;
#0:	       stmh.a	r11, r10, 6
	;;
#0:	       stm.a	0, r10, 25
	;;
#0:	       stmh.a	2, r10, 7
	;;
#0:	       stm.a	0, r10, 4
	;;
#0:	       stm.a	0, r10, 5
	;;
#0:	       stm.a	0, r10, 6
	;;
#0:	       callg	_memset
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       stm.a	r10, r10, 7
#1:	       ldga	___sread -> r0
	;;
#0:	       stm.a	r0, r10, 8
#1:	       ldga	___swrite -> r0
	;;
#0:	       br	.BB13_1
#1:	       stm.a	r0, r10, 9
#2:	       ldga	___sseek -> r0
	;;
#0:	       stm.a	r0, r10, 10
#1:	       ldga	___sclose -> r0
	;;
#0:	       stm.a	r0, r10, 11
	;;
	.align	4
___sinit_end:

	.align	4
___sprint_r:                            ; @__sprint_r
	.size	___sprint_r_end-___sprint_r
___sprint_r_start:
; BB#0:                                 ; %entry
#0:	       ldiu	88 -> r3
#1:	       wb.s	r15, 22
	;;
#0:	       sub	r15, r3 -> r15
#1:	       ldx	$rb, 0 -> r3
	;;
#0:	       stm.s	r10, r15, 17
	;;
#0:	       stm.s	r11, r15, 16
	;;
#0:	       stm.s	r12, r15, 15
#1:	       or	r0, 0 -> r12
	;;
#0:	       stm.s	r13, r15, 14
	;;
#0:	       stm.s	r14, r15, 13
#1:	       or	r1, 0 -> r14
	;;
#0:	       stm.s	r0.23, r15, 12
	;;
#1:	       stm.s	r1.23, r15, 11
	;;
#2:	       stm.s	r2.23, r15, 10
	;;
#3:	       stm.s	r3.23, r15, 9
	;;
#2:	       stm.s	r2.24, r15, 8
	;;
#3:	       stm.s	r3.24, r15, 7
	;;
#2:	       stm.s	r2.25, r15, 6
	;;
#2:	       stm.s	r2.26, r15, 5
	;;
#0:	       stm.s	r3, r15, 4
#1:	       ldx	$ro, 0 -> r3
	;;
#0:	       stm.s	r3, r15, 3
	;;
#0:	       ldm.f	r1, 8           ; vfprintf.c:300
	;;
#0:	       ldx	$mem, 0 -> r2   ; vfprintf.c:300
	;;
#0:	       brz ne @	r2, .BB14_3     ; vfprintf.c:300
	;;
.BB14_1:                                ; %bb
#0:	       ldi	0 -> r0
#1:	       stm.a	0, r14, 1       ; vfprintf.c:301
	;;
.BB14_2:                                ; %bb
#0:	       ldm.s	r15, 12         ; vfprintf.c:326
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:326
	;;
#0:	       stx	r1 -> $ro       ; vfprintf.c:326
	;;
#0:	       ldm.s	r15, 16         ; vfprintf.c:326
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:326
	;;
#0:	       stx	r1 -> $rb       ; vfprintf.c:326
	;;
#0:	       ldm.s	r15, 20         ; vfprintf.c:326
	;;
#2:	       ldx	$mem, 0 -> r2.26 ; vfprintf.c:326
	;;
#0:	       ldm.s	r15, 24         ; vfprintf.c:326
	;;
#2:	       ldx	$mem, 0 -> r2.25 ; vfprintf.c:326
	;;
#0:	       ldm.s	r15, 28         ; vfprintf.c:326
	;;
#3:	       ldx	$mem, 0 -> r3.24 ; vfprintf.c:326
	;;
#0:	       ldm.s	r15, 32         ; vfprintf.c:326
	;;
#2:	       ldx	$mem, 0 -> r2.24 ; vfprintf.c:326
	;;
#0:	       ldm.s	r15, 36         ; vfprintf.c:326
	;;
#3:	       ldx	$mem, 0 -> r3.23 ; vfprintf.c:326
	;;
#0:	       ldm.s	r15, 40         ; vfprintf.c:326
	;;
#2:	       ldx	$mem, 0 -> r2.23 ; vfprintf.c:326
	;;
#0:	       ldm.s	r15, 44         ; vfprintf.c:326
	;;
#1:	       ldx	$mem, 0 -> r1.23 ; vfprintf.c:326
	;;
#0:	       ldm.s	r15, 48         ; vfprintf.c:326
	;;
#0:	       ldx	$mem, 0 -> r0.23 ; vfprintf.c:326
	;;
#0:	       ldm.s	r15, 52         ; vfprintf.c:326
	;;
#0:	       ldx	$mem, 0 -> r14  ; vfprintf.c:326
	;;
#0:	       ldm.s	r15, 56         ; vfprintf.c:326
	;;
#0:	       ldx	$mem, 0 -> r13  ; vfprintf.c:326
	;;
#0:	       ldm.s	r15, 60         ; vfprintf.c:326
	;;
#0:	       ldx	$mem, 0 -> r12  ; vfprintf.c:326
	;;
#0:	       ldm.s	r15, 64         ; vfprintf.c:326
	;;
#0:	       ldx	$mem, 0 -> r11  ; vfprintf.c:326
	;;
#0:	       ldm.s	r15, 68         ; vfprintf.c:326
#1:	       s2add	r15, 22 -> r15  ; vfprintf.c:326
	;;
#0:	       jop	ret             ; vfprintf.c:326
#1:	       ldx	$mem, 0 -> r10  ; vfprintf.c:326
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB14_3:                                ; %bb1
#0:	       ldi	101 -> r0
#1:	       ldm.f	r12, 101        ; vfprintf.c:304
	;;
#0:	       add	r12, r0 -> r0   ; vfprintf.c:304
	;;
#0:	       ldx	$membu, r0 -> r0 ; vfprintf.c:304
	;;
#0:	       btest	r0, 5 -> c1     ; vfprintf.c:304
	;;
#0:	if !c1 br @	.BB14_27
	;;
.BB14_4:                                ; %bb2
#1:	       ldm.f	r14, 0          ; vfprintf.c:309
#2:	       ldi	255 -> r2.24
#0:	       ldi	-1 -> r0.23
	;;
#0:	       br	.BB14_26
#3:	       ldi	254 -> r3.23
#2:	       ldi	-4 -> r2.25
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:309
	;;
#3:	       add	r0, 4 -> r3.24
	;;
.BB14_5:                                ; %bb3
                                        ;   in Loop: Header=BB14_26 Depth=1
#3:	       ldm.f	r3.24, 0        ; vfprintf.c:313
#0:	       ldi	0 -> r13
	;;
#0:	       br	.BB14_24
#2:	       ldx	$mem, 0 -> r2.26 ; vfprintf.c:313
#3:	       ldm.f	r3.24, -4       ; vfprintf.c:312
	;;
#2:	       sr	r2.26, 2 -> r2.23
	;;
#1:	       ldx	$mem, 0 -> r1.23 ; vfprintf.c:312
	;;
.BB14_6:                                ; %bb5.i.i
#0:	       ldi	138 -> r0
#1:	       ldga	_impure_data -> r1 ; wcrtomb.c:35[ fputwc.c:141[ fputwc.c:165[ vfprintf.c:315 ] ] ]
#2:	       stm.a	0, r12, 23      ; wcrtomb.c:34[ fputwc.c:141[ fputwc.c:165[ vfprintf.c:315 ] ] ]
	;;
#0:	       stm.a	r0, r1, 0       ; wcrtomb.c:35[ fputwc.c:141[ fputwc.c:165[ vfprintf.c:315 ] ] ]
#1:	       ldi	64 -> r1
#2:	       ldi	-1 -> r0
	;;
#0:	       ldm.f	r12, 12         ; fputwc.c:143[ fputwc.c:165[ vfprintf.c:315 ] ]
	;;
#0:	       br	.BB14_28
#1:	       ldx	$memhu, r3 -> r2 ; fputwc.c:143[ fputwc.c:165[ vfprintf.c:315 ] ]
	;;
#0:	       or	r2, r1 -> r1    ; fputwc.c:143[ fputwc.c:165[ vfprintf.c:315 ] ]
	;;
#0:	       stmh.a	r1, r12, 6      ; fputwc.c:143[ fputwc.c:165[ vfprintf.c:315 ] ]
	;;
.BB14_7:                                ; %bb4
                                        ;   in Loop: Header=BB14_24 Depth=2
#0:	       ldm.f	r12, 12         ; fputwc.c:164[ vfprintf.c:315 ]
#2:	       add	r12, 12 -> r3
#1:	       s2add	r1.23, r13 -> r0
	;;
#0:	       ldx	$memhu, r3 -> r2 ; fputwc.c:164[ vfprintf.c:315 ]
#1:	       ldm.f	r0, 0           ; vfprintf.c:315
	;;
#0:	       btest	r2, 13 -> c1    ; fputwc.c:164[ vfprintf.c:315 ]
	;;
#0:	if  c1 br @	.BB14_9
#1:	       ldx	$mem, 0 -> r11  ; vfprintf.c:315
	;;
.BB14_8:                                ; %bb.i
                                        ;   in Loop: Header=BB14_24 Depth=2
#0:	       ldga	8192 -> r1
	;;
#0:	       or	r2, r1 -> r0    ; fputwc.c:164[ vfprintf.c:315 ]
	;;
#0:	       stmh.a	r0, r12, 6      ; fputwc.c:164[ vfprintf.c:315 ]
	;;
#0:	       ldm.f	r12, 100        ; fputwc.c:164[ vfprintf.c:315 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; fputwc.c:164[ vfprintf.c:315 ]
	;;
#0:	       or	r0, r1 -> r0    ; fputwc.c:164[ vfprintf.c:315 ]
	;;
#0:	       stm.a	r0, r12, 25     ; fputwc.c:164[ vfprintf.c:315 ]
	;;
.BB14_9:                                ; %bb1.i
                                        ;   in Loop: Header=BB14_24 Depth=2
#0:	       sub	r11, 1 -> r0
#2:	       cmpult	r2.24, r11 -> c1 ; wctomb_r.c:47[ wcrtomb.c:30[ fputwc.c:141[ fputwc.c:165[ vfprintf.c:315 ] ] ] ]
	;;
#3:	       cmpult	r3.23, r0 -> c2
	;;
#0:	       comb	and c2, c1 -> c1
	;;
#0:	if  c1 br @	.BB14_6
	;;
.BB14_10:                               ; %bb6.i.i
                                        ;   in Loop: Header=BB14_24 Depth=2
#0:	       stmb.a	r11, r15, 8
#1:	       br @	.BB14_21
#2:	       ldi	0 -> r10
	;;
.BB14_11:                               ; %bb7.i.i
                                        ;   in Loop: Header=BB14_21 Depth=3
#0:	       ldm.f	r12, 8          ; fputwc.c:149[ fputwc.c:165[ vfprintf.c:315 ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; fputwc.c:149[ fputwc.c:165[ vfprintf.c:315 ] ]
	;;
#0:	       sub	r0, 1 -> r1
	;;
#0:	       cmplt	r0.23, r1 -> c1 ; fputwc.c:149[ fputwc.c:165[ vfprintf.c:315 ] ]
#1:	       stm.a	r1, r12, 2      ; fputwc.c:149[ fputwc.c:165[ vfprintf.c:315 ] ]
	;;
#0:	if  c1 br @	.BB14_18
	;;
.BB14_12:                               ; %bb8.i.i
                                        ;   in Loop: Header=BB14_21 Depth=3
#0:	       ldm.f	r12, 24         ; fputwc.c:149[ fputwc.c:165[ vfprintf.c:315 ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; fputwc.c:149[ fputwc.c:165[ vfprintf.c:315 ] ]
	;;
#0:	       cmplt	r1, r0 -> c1    ; fputwc.c:149[ fputwc.c:165[ vfprintf.c:315 ] ]
	;;
#0:	if  c1 br @	.BB14_17
	;;
.BB14_13:                               ; %bb9.i.i
                                        ;   in Loop: Header=BB14_21 Depth=3
#0:	       add	r15, 8 -> r0
	;;
#0:	       sub	r0, r10 -> r0
	;;
#0:	       ldm.f	r0, 0           ; fputwc.c:149[ fputwc.c:165[ vfprintf.c:315 ] ]
	;;
#0:	       ldx	$membu, r0 -> r1 ; fputwc.c:149[ fputwc.c:165[ vfprintf.c:315 ] ]
#1:	       ldm.f	r12, 0          ; fputwc.c:149[ fputwc.c:165[ vfprintf.c:315 ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; fputwc.c:149[ fputwc.c:165[ vfprintf.c:315 ] ]
	;;
#0:	       stmb.a	r1, r0, 0       ; fputwc.c:149[ fputwc.c:165[ vfprintf.c:315 ] ]
	;;
#0:	       ldm.f	r12, 0          ; fputwc.c:149[ fputwc.c:165[ vfprintf.c:315 ] ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; fputwc.c:149[ fputwc.c:165[ vfprintf.c:315 ] ]
	;;
#0:	       ldm.f	r1, 0           ; fputwc.c:149[ fputwc.c:165[ vfprintf.c:315 ] ]
	;;
#0:	       ldx	$membu, r1 -> r0 ; fputwc.c:149[ fputwc.c:165[ vfprintf.c:315 ] ]
	;;
#0:	       cmpeq	r0, 10 -> c1    ; fputwc.c:149[ fputwc.c:165[ vfprintf.c:315 ] ]
	;;
#0:	if  c1 br @	.BB14_15
	;;
.BB14_14:                               ; %bb10.i.i
                                        ;   in Loop: Header=BB14_21 Depth=3
#0:	       add	r1, 1 -> r0     ; fputwc.c:149[ fputwc.c:165[ vfprintf.c:315 ] ]
#1:	       br @	.BB14_19
	;;
.BB14_15:                               ; %bb11.i.i
                                        ;   in Loop: Header=BB14_21 Depth=3
#0:	       ldi	10 -> r0
	;;
.BB14_16:                               ; %bb11.i.i
                                        ;   in Loop: Header=BB14_21 Depth=3
#0:	       or	r12, 0 -> r1    ; fputwc.c:149[ fputwc.c:165[ vfprintf.c:315 ] ]
#1:	       callg	___swbuf_r      ; fputwc.c:149[ fputwc.c:165[ vfprintf.c:315 ] ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       cmpeq	r0, -1 -> c1    ; fputwc.c:149[ fputwc.c:165[ vfprintf.c:315 ] ]
#1:	       ldi	-1 -> r0
	;;
#0:	       ldx	$c1 -> r1       ; fputwc.c:149[ fputwc.c:165[ vfprintf.c:315 ] ]
	;;
#0:	       btest	r1, 0 -> c1     ; fputwc.c:149[ fputwc.c:165[ vfprintf.c:315 ] ]
	;;
#0:	if  c1 br @	.BB14_28
#1:	if !c1 br @	.BB14_20
	;;
.BB14_17:                               ; %bb13.i.i
                                        ;   in Loop: Header=BB14_21 Depth=3
#0:	       add	r15, 8 -> r0
	;;
#0:	       br	.BB14_16
#1:	       sub	r0, r10 -> r0
	;;
#0:	       ldm.f	r0, 0           ; fputwc.c:149[ fputwc.c:165[ vfprintf.c:315 ] ]
	;;
#0:	       ldx	$membu, r0 -> r0 ; fputwc.c:149[ fputwc.c:165[ vfprintf.c:315 ] ]
	;;
.BB14_18:                               ; %bb15.i.i
                                        ;   in Loop: Header=BB14_21 Depth=3
#0:	       add	r15, 8 -> r0
	;;
#0:	       sub	r0, r10 -> r0
	;;
#0:	       ldm.f	r0, 0           ; fputwc.c:149[ fputwc.c:165[ vfprintf.c:315 ] ]
	;;
#0:	       ldx	$membu, r0 -> r1 ; fputwc.c:149[ fputwc.c:165[ vfprintf.c:315 ] ]
#1:	       ldm.f	r12, 0          ; fputwc.c:149[ fputwc.c:165[ vfprintf.c:315 ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; fputwc.c:149[ fputwc.c:165[ vfprintf.c:315 ] ]
	;;
#0:	       stmb.a	r1, r0, 0       ; fputwc.c:149[ fputwc.c:165[ vfprintf.c:315 ] ]
	;;
#0:	       ldm.f	r12, 0          ; fputwc.c:149[ fputwc.c:165[ vfprintf.c:315 ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; fputwc.c:149[ fputwc.c:165[ vfprintf.c:315 ] ]
	;;
#0:	       add	r0, 1 -> r0     ; fputwc.c:149[ fputwc.c:165[ vfprintf.c:315 ] ]
	;;
.BB14_19:                               ; %bb15.i.i
                                        ;   in Loop: Header=BB14_21 Depth=3
#0:	       stm.a	r0, r12, 0      ; fputwc.c:149[ fputwc.c:165[ vfprintf.c:315 ] ]
	;;
.BB14_20:                               ; %bb18.i.i
                                        ;   in Loop: Header=BB14_21 Depth=3
#0:	       sub	r10, 1 -> r10
	;;
.BB14_21:                               ; %bb19.i.i
                                        ;   Parent Loop BB14_26 Depth=1
                                        ;     Parent Loop BB14_24 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
#0:	       brz eq @	r10, .BB14_11   ; fputwc.c:148[ fputwc.c:165[ vfprintf.c:315 ] ]
	;;
.BB14_22:                               ; %_fputwc_r.exit
                                        ;   in Loop: Header=BB14_24 Depth=2
#0:	       cmpeq	r11, -1 -> c1   ; vfprintf.c:315
#1:	       ldi	-1 -> r0
	;;
#0:	if  c1 br @	.BB14_28
	;;
.BB14_23:                               ; %bb6
                                        ;   in Loop: Header=BB14_24 Depth=2
#0:	       add	r13, 1 -> r13   ; vfprintf.c:314
	;;
.BB14_24:                               ; %bb7
                                        ;   Parent Loop BB14_26 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB14_21 Depth 3
#2:	       cmplt	r13, r2.23 -> c1 ; vfprintf.c:314
	;;
#0:	if  c1 br @	.BB14_7
	;;
.BB14_25:                               ; %bb8
                                        ;   in Loop: Header=BB14_26 Depth=1
#0:	       ldm.f	r14, 8          ; vfprintf.c:311
#2:	       and	r2.26, r2.25 -> r0
	;;
#3:	       add	r3.24, 8 -> r3.24
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:311
	;;
#0:	       sub	r1, r0 -> r2    ; vfprintf.c:311
	;;
#0:	       stm.a	r2, r14, 2      ; vfprintf.c:311
	;;
.BB14_26:                               ; %bb9
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB14_24 Depth 2
                                        ;       Child Loop BB14_21 Depth 3
#0:	       ldi	0 -> r0
#1:	       brz ne @	r2, .BB14_5     ; vfprintf.c:310
	;;
#0:	       brz eq @	r2, .BB14_28    ; vfprintf.c:310
	;;
.BB14_27:                               ; %bb10
#0:	       or	r12, 0 -> r0    ; vfprintf.c:322
#1:	       callg	___sfvwrite_r   ; vfprintf.c:322
#2:	       or	r14, 0 -> r1    ; vfprintf.c:322
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB14_28:                               ; %out
#0:	       stm.a	0, r14, 2       ; vfprintf.c:324
#1:	       br	.BB14_2
	;;
#0:	       stm.a	0, r14, 1       ; vfprintf.c:325
	;;
	       nop	0
	;;
	.align	4
___sprint_r_end:

	.align	4
___ssprint_r:                           ; @__ssprint_r
	.size	___ssprint_r_end-___ssprint_r
___ssprint_r_start:
; BB#0:                                 ; %entry
#0:	       ldiu	80 -> r3        ; vfprintf.c:205
#1:	       wb.s	r15, 20         ; vfprintf.c:205
	;;
#0:	       sub	r15, r3 -> r15  ; vfprintf.c:205
#1:	       ldx	$rb, 0 -> r3    ; vfprintf.c:205
	;;
#0:	       stm.s	r10, r15, 15    ; vfprintf.c:205
	;;
#0:	       stm.s	r11, r15, 14    ; vfprintf.c:205
	;;
#0:	       stm.s	r12, r15, 13    ; vfprintf.c:205
	;;
#0:	       stm.s	r13, r15, 12    ; vfprintf.c:205
	;;
#0:	       stm.s	r14, r15, 11    ; vfprintf.c:205
	;;
#0:	       stm.s	r0.23, r15, 10  ; vfprintf.c:205
	;;
#1:	       stm.s	r1.23, r15, 9   ; vfprintf.c:205
#0:	       or	r1, 0 -> r0.23
	;;
#2:	       stm.s	r2.23, r15, 8   ; vfprintf.c:205
	;;
#1:	       stm.s	r1.24, r15, 7   ; vfprintf.c:205
	;;
#2:	       stm.s	r2.24, r15, 6   ; vfprintf.c:205
	;;
#2:	       stm.s	r2.25, r15, 5   ; vfprintf.c:205
	;;
#2:	       stm.s	r2.26, r15, 4   ; vfprintf.c:205
	;;
#0:	       stm.s	r3, r15, 3      ; vfprintf.c:205
#1:	       ldx	$ro, 0 -> r3    ; vfprintf.c:205
	;;
#0:	       stm.s	r3, r15, 2      ; vfprintf.c:205
	;;
#0:	       ldm.f	r1, 8           ; vfprintf.c:205
	;;
#0:	       ldx	$mem, 0 -> r2   ; vfprintf.c:205
	;;
#0:	       brz eq @	r2, .BB15_2     ; vfprintf.c:205
	;;
.BB15_1:                                ; %bb2.preheader
#0:	       ldm.f	r0.23, 0        ; vfprintf.c:202
#2:	       ldiu	895 -> r2.24
#1:	       or	r0, 0 -> r12
#3:	       ldi	0 -> r2
	;;
#0:	       br	.BB15_5
#2:	       ldiu	1152 -> r2.25
#1:	       ldi	128 -> r1.23
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:202
#2:	       ldim	31 -> r2.24
	;;
#1:	       add	r0, 4 -> r1.24
#2:	       or	r2, 0 -> r2.23
	;;
.BB15_2:                                ; %bb
#1:	       ldi	0 -> r0
#0:	       stm.a	0, r0.23, 1     ; vfprintf.c:206
	;;
.BB15_3:                                ; %bb
#0:	       ldm.s	r15, 8          ; vfprintf.c:280
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:280
	;;
#0:	       stx	r1 -> $ro       ; vfprintf.c:280
	;;
#0:	       ldm.s	r15, 12         ; vfprintf.c:280
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:280
	;;
#0:	       stx	r1 -> $rb       ; vfprintf.c:280
	;;
#0:	       ldm.s	r15, 16         ; vfprintf.c:280
	;;
#2:	       ldx	$mem, 0 -> r2.26 ; vfprintf.c:280
	;;
#0:	       ldm.s	r15, 20         ; vfprintf.c:280
	;;
#2:	       ldx	$mem, 0 -> r2.25 ; vfprintf.c:280
	;;
#0:	       ldm.s	r15, 24         ; vfprintf.c:280
	;;
#2:	       ldx	$mem, 0 -> r2.24 ; vfprintf.c:280
	;;
#0:	       ldm.s	r15, 28         ; vfprintf.c:280
	;;
#1:	       ldx	$mem, 0 -> r1.24 ; vfprintf.c:280
	;;
#0:	       ldm.s	r15, 32         ; vfprintf.c:280
	;;
#2:	       ldx	$mem, 0 -> r2.23 ; vfprintf.c:280
	;;
#0:	       ldm.s	r15, 36         ; vfprintf.c:280
	;;
#1:	       ldx	$mem, 0 -> r1.23 ; vfprintf.c:280
	;;
#0:	       ldm.s	r15, 40         ; vfprintf.c:280
	;;
#0:	       ldx	$mem, 0 -> r0.23 ; vfprintf.c:280
	;;
#0:	       ldm.s	r15, 44         ; vfprintf.c:280
	;;
#0:	       ldx	$mem, 0 -> r14  ; vfprintf.c:280
	;;
#0:	       ldm.s	r15, 48         ; vfprintf.c:280
	;;
#0:	       ldx	$mem, 0 -> r13  ; vfprintf.c:280
	;;
#0:	       ldm.s	r15, 52         ; vfprintf.c:280
	;;
#0:	       ldx	$mem, 0 -> r12  ; vfprintf.c:280
	;;
#0:	       ldm.s	r15, 56         ; vfprintf.c:280
	;;
#0:	       ldx	$mem, 0 -> r11  ; vfprintf.c:280
	;;
#0:	       ldm.s	r15, 60         ; vfprintf.c:280
#1:	       s2add	r15, 20 -> r15  ; vfprintf.c:280
	;;
#0:	       jop	ret             ; vfprintf.c:280
#1:	       ldx	$mem, 0 -> r10  ; vfprintf.c:280
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB15_4:                                ; %bb1
                                        ;   in Loop: Header=BB15_5 Depth=1
#1:	       ldm.f	r1.24, -4       ; vfprintf.c:212
	;;
#2:	       ldx	$mem, 0 -> r2.23 ; vfprintf.c:212
#1:	       ldm.f	r1.24, 0        ; vfprintf.c:213
	;;
#1:	       add	r1.24, 8 -> r1.24
	;;
#0:	       ldx	$mem, 0 -> r2   ; vfprintf.c:213
	;;
.BB15_5:                                ; %bb2
                                        ; =>This Inner Loop Header: Depth=1
#0:	       or	r2, 0 -> r10
	;;
#0:	       brz eq @	r10, .BB15_4    ; vfprintf.c:211
	;;
.BB15_6:                                ; %bb3
                                        ;   in Loop: Header=BB15_5 Depth=1
#0:	       ldm.f	r12, 8          ; vfprintf.c:216
	;;
#0:	       ldx	$mem, 0 -> r11  ; vfprintf.c:216
	;;
#0:	       cmpult	r10, r11 -> c1  ; vfprintf.c:217
	;;
#0:	if  c1 br @	.BB15_12
	;;
.BB15_7:                                ; %bb4
                                        ;   in Loop: Header=BB15_5 Depth=1
#0:	       ldm.f	r12, 12
#1:	       add	r12, 12 -> r13
	;;
#0:	       ldx	$memhu, r13 -> r4
	;;
#2:	       and	r4, r2.25 -> r0 ; vfprintf.c:217
	;;
#0:	       brz eq @	r0, .BB15_12    ; vfprintf.c:217
	;;
.BB15_8:                                ; %bb5
                                        ;   in Loop: Header=BB15_5 Depth=1
#0:	       ldm.f	r12, 20         ; vfprintf.c:228
	;;
#0:	       ldx	$mem, 0 -> r2   ; vfprintf.c:228
#1:	       ldm.f	r12, 16         ; vfprintf.c:220
	;;
#0:	       mul	r2, 3 -> $mul0.0 ; vfprintf.c:228
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:220
#1:	       ldm.f	r12, 0          ; vfprintf.c:220
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:220
	;;
#1:	       sub	r1, r0 -> r14   ; vfprintf.c:220
#0:	       ldx	$mul0.0, 0 -> r1 ; vfprintf.c:228
	;;
#0:	       sr	r1, 31 -> r1    ; vfprintf.c:228
#1:	       add	r10, r14 -> r3  ; vfprintf.c:229
	;;
#0:	       ldx	$mul0.0, r1 -> r1 ; vfprintf.c:228
#1:	       add	r3, 1 -> r2     ; vfprintf.c:229
	;;
#0:	       sra	r1, 1 -> r11    ; vfprintf.c:228
	;;
#0:	       cmpult	r11, r2 -> c1   ; vfprintf.c:229
	;;
#0:	if  c1 add	r3, 1 -> r11
#1:	       btest	r4, 10 -> c1    ; vfprintf.c:231
	;;
#0:	if !c1 br @	.BB15_14
	;;
.BB15_9:                                ; %bb8
                                        ;   in Loop: Header=BB15_5 Depth=1
#0:	       or	r11, 0 -> r0    ; vfprintf.c:234
#1:	       callg	__malloc_r      ; vfprintf.c:234
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz eq @	r0, .BB15_16    ; vfprintf.c:235
	;;
.BB15_10:                               ; %bb10
                                        ;   in Loop: Header=BB15_5 Depth=1
#0:	       ldm.f	r12, 16         ; vfprintf.c:240
#1:	       or	r14, 0 -> r2    ; vfprintf.c:240
	;;
#2:	       or	r0, 0 -> r2.26  ; vfprintf.c:234
	;;
#0:	       callg	_memcpy         ; vfprintf.c:240
#1:	       ldx	$mem, 0 -> r1   ; vfprintf.c:240
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldm.f	r12, 12         ; vfprintf.c:241
	;;
#0:	       ldx	$memhu, r13 -> r0 ; vfprintf.c:241
	;;
#2:	       and	r0, r2.24 -> r0 ; vfprintf.c:241
	;;
#1:	       or	r0, r1.23 -> r0 ; vfprintf.c:241
	;;
#0:	       stmh.a	r0, r12, 6      ; vfprintf.c:241
#2:	       or	r2.26, 0 -> r0
	;;
.BB15_11:                               ; %bb13
                                        ;   in Loop: Header=BB15_5 Depth=1
#0:	       add	r0, r14 -> r1   ; vfprintf.c:257
#1:	       stm.a	r0, r12, 4      ; vfprintf.c:256
#2:	       sub	r11, r14 -> r0  ; vfprintf.c:260
	;;
#0:	       stm.a	r1, r12, 0      ; vfprintf.c:257
	;;
#0:	       stm.a	r11, r12, 5     ; vfprintf.c:258
#1:	       or	r10, 0 -> r11
	;;
#0:	       stm.a	r0, r12, 2      ; vfprintf.c:260
	;;
.BB15_12:                               ; %bb14
                                        ;   in Loop: Header=BB15_5 Depth=1
#0:	       cmpult	r10, r11 -> c1  ; vfprintf.c:262
#1:	       ldm.f	r12, 0          ; vfprintf.c:264
	;;
#0:	if  c1 or	r10, 0 -> r11
#2:	       or	r2.23, 0 -> r1  ; vfprintf.c:264
	;;
#0:	       callg	_memmove        ; vfprintf.c:264
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:264
#2:	       or	r11, 0 -> r2    ; vfprintf.c:264
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldm.f	r12, 8          ; vfprintf.c:265
#2:	       add	r2.23, r10 -> r2.23 ; vfprintf.c:268
#1:	       ldi	0 -> r2
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:265
	;;
#0:	       sub	r0, r11 -> r0   ; vfprintf.c:265
	;;
#0:	       stm.a	r0, r12, 2      ; vfprintf.c:265
	;;
#0:	       ldm.f	r12, 0          ; vfprintf.c:266
	;;
#0:	       ldx	$mem, 0 -> r0   ; vfprintf.c:266
	;;
#0:	       add	r0, r11 -> r0   ; vfprintf.c:266
	;;
#0:	       stm.a	r0, r12, 0      ; vfprintf.c:266
	;;
#0:	       ldm.f	r0.23, 8        ; vfprintf.c:270
	;;
#0:	       ldx	$mem, 0 -> r1   ; vfprintf.c:270
	;;
#0:	       cmpne	r1, r10 -> c1   ; vfprintf.c:270
#1:	       sub	r1, r10 -> r0   ; vfprintf.c:270
	;;
#1:	if  c1 br @	.BB15_5
#0:	       stm.a	r0, r0.23, 2    ; vfprintf.c:270
	;;
.BB15_13:                               ; %bb17
#0:	       stm.a	0, r0.23, 2     ; vfprintf.c:272
#1:	       br @	.BB15_2
	;;
.BB15_14:                               ; %bb11
                                        ;   in Loop: Header=BB15_5 Depth=1
#0:	       or	r11, 0 -> r1    ; vfprintf.c:245
#1:	       callg	__realloc_r     ; vfprintf.c:245
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz ne @	r0, .BB15_11    ; vfprintf.c:247
	;;
.BB15_15:                               ; %bb12
#0:	       ldm.f	r12, 16         ; vfprintf.c:249
	;;
#0:	       callg	__free_r        ; vfprintf.c:249
#1:	       ldx	$mem, 0 -> r0   ; vfprintf.c:249
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB15_16:                               ; %err
#0:	       ldga	_impure_data -> r0
	;;
#0:	       stm.a	12, r0, 0
#1:	       ldi	64 -> r0
	;;
#0:	       ldm.f	r12, 12         ; vfprintf.c:277
	;;
#0:	       ldx	$memhu, r13 -> r1 ; vfprintf.c:277
	;;
#0:	       or	r1, r0 -> r0    ; vfprintf.c:277
	;;
#0:	       br	.BB15_3
#1:	       stmh.a	r0, r12, 6      ; vfprintf.c:277
#2:	       ldi	-1 -> r0
	;;
#0:	       stm.a	0, r0.23, 2     ; vfprintf.c:278
	;;
#0:	       stm.a	0, r0.23, 1     ; vfprintf.c:279
	;;
	.align	4
___ssprint_r_end:

	.align	4
___swsetup_r:                           ; @__swsetup_r
	.size	___swsetup_r_end-___swsetup_r
___swsetup_r_start:
; BB#0:                                 ; %bb
#0:	       ldiu	40 -> r1
#1:	       wb.s	r15, 10
	;;
#0:	       sub	r15, r1 -> r15
#1:	       ldx	$rb, 0 -> r1
	;;
#0:	       stm.s	r10, r15, 5
#1:	       or	r0, 0 -> r10
	;;
#0:	       stm.s	r11, r15, 4
	;;
#0:	       stm.s	r12, r15, 3
	;;
#0:	       stm.s	r1, r15, 2
#1:	       ldx	$ro, 0 -> r1
	;;
#0:	       stm.s	r1, r15, 1
	;;
#0:	       ldmg.d	_impure_data+56 ; wsetup.c:38
	;;
#0:	       ldx	$mem, 0 -> r0   ; wsetup.c:38
	;;
#0:	       brz ne @	r0, .BB16_2     ; wsetup.c:38
	;;
.BB16_1:                                ; %bb1
#0:	       callg	___sinit        ; wsetup.c:38
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB16_2:                                ; %bb2
#0:	       ldm.f	r10, 12         ; wsetup.c:44
#1:	       add	r10, 12 -> r11  ; wsetup.c:44
	;;
#0:	       ldx	$memhu, r11 -> r2 ; wsetup.c:44
	;;
#0:	       btest	r2, 3 -> c1     ; wsetup.c:44
	;;
#0:	if  c1 br @	.BB16_11
	;;
.BB16_3:                                ; %bb3
#0:	       btest	r2, 4 -> c1     ; wsetup.c:46
#1:	       ldi	-1 -> r0
	;;
#0:	if !c1 br @	.BB16_27
	;;
.BB16_4:                                ; %bb5
#0:	       btest	r2, 2 -> c1     ; wsetup.c:48
	;;
#0:	if !c1 br @	.BB16_10
	;;
.BB16_5:                                ; %bb6
#0:	       ldm.f	r10, 48         ; wsetup.c:51
	;;
#0:	       ldx	$mem, 0 -> r0   ; wsetup.c:51
	;;
#0:	       brz eq @	r0, .BB16_9     ; wsetup.c:51
	;;
.BB16_6:                                ; %bb7
#0:	       s2add	r10, 16 -> r1
	;;
#0:	       cmpeq	r0, r1 -> c1    ; wsetup.c:52
	;;
#0:	if  c1 br @	.BB16_8
	;;
.BB16_7:                                ; %bb8
#0:	       callg	__free_r        ; wsetup.c:52
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldm.f	r10, 12
	;;
#0:	       ldx	$memhu, r11 -> r2
	;;
.BB16_8:                                ; %bb9
#0:	       stm.a	0, r10, 12      ; wsetup.c:52
	;;
.BB16_9:                                ; %bb10
#0:	       ldiu	2011 -> r0
	;;
#0:	       ldim	31 -> r0
	;;
#0:	       and	r2, r0 -> r2    ; wsetup.c:53
	;;
#0:	       stmh.a	r2, r10, 6      ; wsetup.c:53
	;;
#0:	       stm.a	0, r10, 1       ; wsetup.c:54
	;;
#0:	       ldm.f	r10, 16         ; wsetup.c:55
	;;
#0:	       ldx	$mem, 0 -> r0   ; wsetup.c:55
	;;
#0:	       stm.a	r0, r10, 0      ; wsetup.c:55
	;;
.BB16_10:                               ; %bb11
#0:	       or	r2, 8 -> r2     ; wsetup.c:57
	;;
#0:	       stmh.a	r2, r10, 6      ; wsetup.c:57
	;;
.BB16_11:                               ; %bb12
#0:	       ldm.f	r10, 16         ; wsetup.c:65
	;;
#0:	       ldx	$mem, 0 -> r0   ; wsetup.c:65
	;;
#0:	       brz ne @	r0, .BB16_22    ; wsetup.c:65
	;;
.BB16_12:                               ; %bb13
#0:	       ldi	640 -> r0
	;;
#0:	       and	r2, r0 -> r1
#1:	       ldi	512 -> r0
	;;
#0:	       cmpeq	r1, r0 -> c1
	;;
#0:	if  c1 br @	.BB16_22
	;;
.BB16_13:                               ; %bb15
#0:	       bbh	zext16 r2 -> r0
	;;
#0:	       btest	r0, 1 -> c1     ; makebuf.c:50[ wsetup.c:67 ]
	;;
#0:	if !c1 br @	.BB16_16
	;;
.BB16_14:                               ; %bb.i
#0:	       ldi	67 -> r0
	;;
#0:	       add	r10, r0 -> r0
	;;
.BB16_15:                               ; %bb.i
#0:	       stm.a	r0, r10, 0      ; makebuf.c:52[ wsetup.c:67 ]
#1:	       br	.BB16_22
	;;
#0:	       stm.a	r0, r10, 4      ; makebuf.c:52[ wsetup.c:67 ]
	;;
#0:	       stm.a	1, r10, 5       ; makebuf.c:53[ wsetup.c:67 ]
	;;
.BB16_16:                               ; %bb1.i
#0:	       ldm.f	r10, 14         ; makebuf.c:59[ wsetup.c:67 ]
#1:	       add	r10, 14 -> r0   ; makebuf.c:59[ wsetup.c:67 ]
	;;
#0:	       ldx	$memhs, r0 -> r0 ; makebuf.c:59[ wsetup.c:67 ]
	;;
#0:	       cmplt	r0, 0 -> c1     ; makebuf.c:59[ wsetup.c:67 ]
	;;
#0:	if  c1 br @	.BB16_18
	;;
.BB16_17:                               ; %_fstat_r.exit.i
#0:	       ldi	88 -> r0
#1:	       ldga	_impure_data -> r1 ; fstatr.c:63[ makebuf.c:59[ wsetup.c:67 ] ]
	;;
#0:	       stm.a	r0, r1, 0       ; fstatr.c:63[ makebuf.c:59[ wsetup.c:67 ] ]
	;;
#0:	       ldm.f	r10, 12
	;;
#0:	       ldx	$memhu, r11 -> r2
	;;
.BB16_18:                               ; %bb11.i
#0:	       ldga	2048 -> r0
#1:	       btest	r2, 7 -> c1
#2:	       ldi	64 -> r12
	;;
#0:	       callg	__malloc_r      ; makebuf.c:95[ wsetup.c:67 ]
#1:	       or	r2, r0 -> r0    ; makebuf.c:69[ wsetup.c:67 ]
	;;
#0:	       stmh.a	r0, r10, 6      ; makebuf.c:69[ wsetup.c:67 ]
#1:	       ldiu	1024 -> r0
	;;
#0:	if !c1 or	r0, 0 -> r12
	;;
#0:	       or	r12, 0 -> r0    ; makebuf.c:95[ wsetup.c:67 ]
	;;
#0:	       brz ne @	r0, .BB16_21    ; makebuf.c:95[ wsetup.c:67 ]
	;;
.BB16_19:                               ; %bb12.i
#0:	       ldm.f	r10, 12         ; makebuf.c:97[ wsetup.c:67 ]
	;;
#0:	       ldx	$memhu, r11 -> r2 ; makebuf.c:97[ wsetup.c:67 ]
	;;
#0:	       btest	r2, 9 -> c1     ; makebuf.c:97[ wsetup.c:67 ]
	;;
#0:	if  c1 br @	.BB16_22
	;;
.BB16_20:                               ; %bb13.i
#0:	       ldi	67 -> r0
#1:	       br	.BB16_15
#2:	       or	r2, 2 -> r2     ; makebuf.c:99[ wsetup.c:67 ]
	;;
#0:	       add	r10, r0 -> r0
#1:	       stmh.a	r2, r10, 6      ; makebuf.c:99[ wsetup.c:67 ]
	;;
	       nop	0
	;;
.BB16_21:                               ; %bb14.i
#0:	       ldga	__cleanup_r -> r2 ; makebuf.c:106[ wsetup.c:67 ]
#1:	       ldga	_impure_data -> r1 ; makebuf.c:106[ wsetup.c:67 ]
	;;
#0:	       stm.a	r2, r1, 15      ; makebuf.c:106[ wsetup.c:67 ]
#1:	       ldi	128 -> r1
	;;
#0:	       ldm.f	r10, 12         ; makebuf.c:107[ wsetup.c:67 ]
	;;
#0:	       ldx	$memhu, r11 -> r2 ; makebuf.c:107[ wsetup.c:67 ]
	;;
#0:	       or	r2, r1 -> r2    ; makebuf.c:107[ wsetup.c:67 ]
	;;
#0:	       stmh.a	r2, r10, 6      ; makebuf.c:107[ wsetup.c:67 ]
	;;
#0:	       stm.a	r0, r10, 0      ; makebuf.c:108[ wsetup.c:67 ]
	;;
#0:	       stm.a	r0, r10, 4      ; makebuf.c:108[ wsetup.c:67 ]
	;;
#0:	       stm.a	r12, r10, 5     ; makebuf.c:109[ wsetup.c:67 ]
	;;
.BB16_22:                               ; %bb16
#0:	       btest	r2, 0 -> c1     ; wsetup.c:69
#1:	       bbh	zext16 r2 -> r3
	;;
#0:	if !c1 br @	.BB16_24
	;;
.BB16_23:                               ; %bb17
#0:	       stm.a	0, r10, 2       ; wsetup.c:76
#1:	       ldi	0 -> r0
	;;
#0:	       ldm.f	r10, 20         ; wsetup.c:77
	;;
#0:	       br	.BB16_25
#1:	       ldx	$mem, 0 -> r1   ; wsetup.c:77
	;;
#0:	       sub	r0, r1 -> r0    ; wsetup.c:77
	;;
#0:	       stm.a	r0, r10, 6      ; wsetup.c:77
	;;
.BB16_24:                               ; %bb18
#0:	       btest	r3, 1 -> c1     ; wsetup.c:80
#1:	       ldi	0 -> r0
	;;
#0:	if !c1 ldm.f	r10, 20         ; wsetup.c:80
	;;
#0:	if !c1 ldx	$mem, 0 -> r0   ; wsetup.c:80
	;;
#0:	       stm.a	r0, r10, 2      ; wsetup.c:80
	;;
.BB16_25:                               ; %bb22
#0:	       ldm.f	r10, 16         ; wsetup.c:82
#1:	       ldi	0 -> r0
	;;
#0:	       ldx	$mem, 0 -> r1   ; wsetup.c:82
	;;
#0:	       brz ne @	r1, .BB16_27    ; wsetup.c:82
	;;
.BB16_26:                               ; %bb23
#0:	       sr	r3, 7 -> r0
#1:	       ldi	-1 -> r1
	;;
#0:	       btest	r0, 0 -> c1
#1:	       ldi	0 -> r0
	;;
#0:	if  c1 or	r1, 0 -> r0
	;;
.BB16_27:                               ; %bb25
#0:	       ldm.s	r15, 4          ; wsetup.c:82
	;;
#0:	       ldx	$mem, 0 -> r1   ; wsetup.c:82
	;;
#0:	       stx	r1 -> $ro       ; wsetup.c:82
	;;
#0:	       ldm.s	r15, 8          ; wsetup.c:82
	;;
#0:	       ldx	$mem, 0 -> r1   ; wsetup.c:82
	;;
#0:	       stx	r1 -> $rb       ; wsetup.c:82
	;;
#0:	       ldm.s	r15, 12         ; wsetup.c:82
	;;
#0:	       ldx	$mem, 0 -> r12  ; wsetup.c:82
	;;
#0:	       ldm.s	r15, 16         ; wsetup.c:82
	;;
#0:	       ldx	$mem, 0 -> r11  ; wsetup.c:82
	;;
#0:	       ldm.s	r15, 20         ; wsetup.c:82
#1:	       s2add	r15, 10 -> r15  ; wsetup.c:82
	;;
#0:	       jop	ret             ; wsetup.c:82
#1:	       ldx	$mem, 0 -> r10  ; wsetup.c:82
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
___swsetup_r_end:

	.align	4
__dtoa_r:                               ; @_dtoa_r
	.size	__dtoa_r_end-__dtoa_r
__dtoa_r_start:
; BB#0:                                 ; %entry
#1:	       ldiu	360 -> r4
#2:	       wb.s	r15, 90
#0:	       ldx	$f10 -> r0.31
	;;
#0:	       sub	r15, r4 -> r15
#2:	       ldiu	256 -> r4
#1:	       ldx	$f11 -> r1.31
	;;
#0:	       add	r15, r4 -> r4
#2:	       ldx	$f12 -> r2.31
	;;
#0:	       stm.s	r10, r4, 21
#1:	       stx	r0 -> $f0
	;;
#0:	       stm.s	r11, r4, 20
#1:	       stx	r1 -> $f2
	;;
#0:	       stm.s	r12, r4, 19
#1:	       ldx	$f0 -> r0
	;;
#0:	       stm.s	r13, r4, 18
#1:	       or	r2, 0 -> r13
	;;
#0:	       stm.s	r14, r4, 17
#1:	       or	r3, 0 -> r14
	;;
#0:	       stm.s	r0.23, r4, 16
#3:	       ldx	$f13 -> r3.31
	;;
#1:	       stm.s	r1.23, r4, 15
	;;
#2:	       stm.s	r2.23, r4, 14
	;;
#3:	       stm.s	r3.23, r4, 13
	;;
#0:	       stm.s	r0.24, r4, 12
	;;
#1:	       stm.s	r1.24, r4, 11
	;;
#2:	       stm.s	r2.24, r4, 10
	;;
#3:	       stm.s	r3.24, r4, 9
	;;
#0:	       stm.s	r0.25, r4, 8
	;;
#1:	       stm.s	r1.25, r4, 7
	;;
#2:	       stm.s	r2.25, r4, 6
	;;
#3:	       stm.s	r3.25, r4, 5
	;;
#0:	       stm.s	r0.26, r4, 4
	;;
#1:	       stm.s	r1.26, r4, 3
	;;
#2:	       stm.s	r2.26, r4, 2
	;;
#3:	       stm.s	r3.26, r4, 1
	;;
#0:	       stm.s	r0.31, r4, 0
#1:	       ldiu	128 -> r4
	;;
#1:	       add	r15, r4 -> r4
#0:	       ldx	$f14 -> r0.31
	;;
#1:	       stm.s	r1.31, r4, 31
	;;
#2:	       stm.s	r2.31, r4, 30
#1:	       ldx	$f15 -> r1.31
	;;
#3:	       stm.s	r3.31, r4, 29
#2:	       ldx	$rb, 0 -> r2.31
	;;
#0:	       stm.s	r0.31, r4, 28
#3:	       ldx	$ro, 0 -> r3.31
	;;
#1:	       stm.s	r1.31, r4, 27
	;;
#2:	       stm.s	r2.31, r4, 26
	;;
#3:	       stm.s	r3.31, r4, 25
#0:	       ldiu	192 -> r4
#1:	       fop	fmov	f2 -> f1
	;;
#0:	       add	r15, r4 -> r4
	;;
#0:	       add	r4, 24 -> r2
#1:	       ldiu	128 -> r4
	;;
#0:	       add	r15, r4 -> r4
#1:	       or	r2, 4 -> r2
	;;
#0:	       stm.a	r0, r4, 22
#1:	       ldx	$f1 -> r0
	;;
#0:	       ldmg.d	_impure_data+64 ; dtoa.c:239
	;;
#0:	       ldx	$mem, 0 -> r1   ; dtoa.c:239
#1:	       stm.a	r0, r2, 0
	;;
#0:	       ldm.f	r2, 0
	;;
#0:	       ldx	$mem, 0 -> r12
#1:	       ldm.f	r15, 360
	;;
#3:	       ldx	$mem, 0 -> r3.26
#0:	       ldm.f	r15, 364
	;;
#0:	       ldx	$mem, 0 -> r3
#1:	       ldm.f	r15, 368
	;;
#1:	       brz eq	r1, .BB17_4     ; dtoa.c:239
#0:	       ldx	$mem, 0 -> r0.26
#2:	       ldm.f	r15, 216
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       stm.s	r0, r15, 6      ; dtoa.c:239
	;;
.BB17_1:                                ; %bb
#0:	       ldmg.d	_impure_data+68 ; dtoa.c:241
#1:	       ldi	1 -> r2
	;;
#0:	       ldx	$mem, 0 -> r0   ; dtoa.c:241
	;;
#0:	       stm.a	r0, r1, 1       ; dtoa.c:241
	;;
#0:	       ldmg.d	_impure_data+68 ; dtoa.c:242
	;;
#0:	       ldx	$mem, 0 -> r0   ; dtoa.c:242
#1:	       ldmg.d	_impure_data+64 ; dtoa.c:242
	;;
#0:	       sl	r2, r0 -> r0    ; dtoa.c:242
	;;
#0:	       ldx	$mem, 0 -> r1   ; dtoa.c:242
	;;
#0:	       stm.a	r0, r1, 2       ; dtoa.c:242
	;;
#0:	       ldmg.d	_impure_data+64 ; dtoa.c:243
	;;
#0:	       ldx	$mem, 0 -> r2   ; dtoa.c:243
	;;
#0:	       brz eq @	r2, .BB17_3     ; mprec.c:139[ dtoa.c:243 ]
	;;
.BB17_2:                                ; %bb.i
#0:	       ldmg.d	_impure_data+76 ; mprec.c:141[ dtoa.c:243 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:141[ dtoa.c:243 ]
#1:	       ldm.f	r2, 4           ; mprec.c:141[ dtoa.c:243 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; mprec.c:141[ dtoa.c:243 ]
	;;
#0:	       s2add	r0, r1 -> r0    ; mprec.c:141[ dtoa.c:243 ]
	;;
#0:	       ldm.f	r0, 0           ; mprec.c:141[ dtoa.c:243 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:141[ dtoa.c:243 ]
	;;
#0:	       stm.a	r0, r2, 0       ; mprec.c:141[ dtoa.c:243 ]
	;;
#0:	       ldmg.d	_impure_data+76 ; mprec.c:142[ dtoa.c:243 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:142[ dtoa.c:243 ]
	;;
#0:	       s2add	r0, r1 -> r0    ; mprec.c:142[ dtoa.c:243 ]
	;;
#0:	       stm.a	r2, r0, 0       ; mprec.c:142[ dtoa.c:243 ]
	;;
.BB17_3:                                ; %_Bfree.exit
#0:	       ldga	_impure_data -> r0 ; dtoa.c:244
	;;
#0:	       stm.a	0, r0, 16       ; dtoa.c:244
	;;
.BB17_4:                                ; %bb1
#0:	       ldi	-1 -> r0
	;;
#0:	       cmplt	r0, r12 -> c1   ; dtoa.c:247
	;;
#0:	if  c1 br @	.BB17_6
	;;
.BB17_5:                                ; %bb2
#0:	       ldiu	2047 -> r0
#1:	       stm.a	1, r3, 0        ; dtoa.c:250
	;;
#0:	       br	.BB17_7
#1:	       ldim	1023 -> r0
	;;
#0:	       ldih	1023 -> r0
	;;
#0:	       and	r12, r0 -> r12
	;;
.BB17_6:                                ; %bb3
#0:	       stm.a	0, r3, 0        ; dtoa.c:254
	;;
.BB17_7:                                ; %bb4
#0:	       ldga	1048576 -> r0
	;;
#0:	       ldih	1023 -> r0
	;;
#2:	       and	r12, r0 -> r2.25
	;;
#2:	       cmpne	r2.25, r0 -> c1 ; dtoa.c:258
	;;
#0:	if  c1 br @	.BB17_10
	;;
.BB17_8:                                ; %bb5
#1:	       ldiu	2047 -> r0
#2:	       ldm.s	r15, 24         ; dtoa.c:265
#0:	       cmpeq	r0.26, 0 -> c3  ; dtoa.c:270
#3:	       ldga	._.str61 -> r2
	;;
#0:	       ldim	511 -> r0
	;;
#0:	       and	r12, r0 -> r1
#1:	       ldx	$mem, 0 -> r0   ; dtoa.c:265
	;;
#0:	       or	r0, r1 -> r1    ; dtoa.c:265
#1:	       ldiu	1807 -> r0
	;;
#0:	       cmpeq	r1, 0 -> c1
#1:	       ldga	._.str162 -> r1
#2:	       ldim	4 -> r0
	;;
#0:	if  c3 br	.BB17_481       ; dtoa.c:270
#1:	if  c1 or	r2, 0 -> r1
	;;
#0:	       stm.s	r1, r15, 5
	;;
#3:	       stm.a	r0, r3.26, 0    ; dtoa.c:264
	;;
.BB17_9:                                ; %bb10
#0:	       add	r1, 3 -> r0     ; dtoa.c:271
#1:	       ldm.f	r1, 3           ; dtoa.c:271
	;;
#0:	       ldx	$membu, r0 -> r2 ; dtoa.c:271
#1:	       add	r1, 8 -> r0     ; dtoa.c:271
	;;
#0:	       br	.BB17_13
#1:	       cmpeq	r2, 0 -> c1     ; dtoa.c:271
	;;
#0:	if  c1 add	r1, 3 -> r0
	;;
#0:	       stm.a	r0, r0.26, 0    ; dtoa.c:271
#1:	       or	r1, 0 -> r0     ; dtoa.c:861
	;;
.BB17_10:                               ; %bb15
#0:	       ldiu	192 -> r3
#1:	       ldm.s	r15, 24
#2:	       fop	dzero -> d1
	;;
#0:	       add	r15, r3 -> r3
	;;
#0:	       add	r3, 16 -> r0
#1:	       ldiu	128 -> r3
	;;
#0:	       or	r0, 4 -> r2
#1:	       ldx	$mem, 0 -> r0
#2:	       add	r15, r3 -> r3
	;;
#0:	       stm.a	r0, r3, 20
	;;
#0:	       stm.a	r12, r2, 0
	;;
#0:	       ldm.f	r15, 208
	;;
#0:	       ldx	$mem, 0 -> r1
#1:	       ldm.f	r2, 0
	;;
#0:	       stx	r1 -> $f10
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       stx	r0 -> $f0
	;;
#0:	       fop	fmov	f0 -> f11
	;;
#0:	       fop	dcmp	d5, d1 -> f0 ; dtoa.c:282
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r0       ; dtoa.c:282
	;;
#0:	       btest	r0, 9 -> c1     ; dtoa.c:282
	;;
#0:	if  c1 br @	.BB17_14
	;;
.BB17_11:                               ; %bb16
#0:	       cmpeq	r0.26, 0 -> c3  ; dtoa.c:286
#1:	       ldga	._.str263 -> r0
	;;
#0:	if  c3 br	.BB17_481       ; dtoa.c:286
#1:	       stm.s	r0, r15, 5      ; dtoa.c:284
	;;
#3:	       stm.a	1, r3.26, 0     ; dtoa.c:284
	;;
	       nop	0
	;;
.BB17_12:                               ; %bb17
#0:	       add	r0, 1 -> r1     ; dtoa.c:287
	;;
#0:	       stm.a	r1, r0.26, 0    ; dtoa.c:287
	;;
.BB17_13:                               ; %bb17
#0:	       ldm.s	r15, 228        ; dtoa.c:861
	;;
#0:	       ldx	$mem, 0 -> r1   ; dtoa.c:861
	;;
#0:	       stx	r1 -> $ro       ; dtoa.c:861
	;;
#0:	       ldm.s	r15, 232        ; dtoa.c:861
	;;
#0:	       ldx	$mem, 0 -> r1   ; dtoa.c:861
	;;
#0:	       stx	r1 -> $rb       ; dtoa.c:861
	;;
#0:	       ldm.s	r15, 236        ; dtoa.c:861
	;;
#0:	       ldx	$mem, 0 -> r1   ; dtoa.c:861
	;;
#0:	       stx	r1 -> $f15      ; dtoa.c:861
	;;
#0:	       ldm.s	r15, 240        ; dtoa.c:861
	;;
#0:	       ldx	$mem, 0 -> r1   ; dtoa.c:861
	;;
#0:	       stx	r1 -> $f14      ; dtoa.c:861
	;;
#0:	       ldm.s	r15, 244        ; dtoa.c:861
	;;
#0:	       ldx	$mem, 0 -> r1   ; dtoa.c:861
	;;
#0:	       stx	r1 -> $f13      ; dtoa.c:861
	;;
#0:	       ldm.s	r15, 248        ; dtoa.c:861
	;;
#0:	       ldx	$mem, 0 -> r1   ; dtoa.c:861
	;;
#0:	       stx	r1 -> $f12      ; dtoa.c:861
	;;
#0:	       ldm.s	r15, 252        ; dtoa.c:861
	;;
#0:	       ldx	$mem, 0 -> r1   ; dtoa.c:861
	;;
#0:	       stx	r1 -> $f11      ; dtoa.c:861
	;;
#0:	       ldm.s	r15, 256        ; dtoa.c:861
	;;
#0:	       ldx	$mem, 0 -> r1   ; dtoa.c:861
	;;
#0:	       stx	r1 -> $f10      ; dtoa.c:861
#1:	       ldiu	360 -> r1       ; dtoa.c:861
	;;
#0:	       ldm.s	r15, 260        ; dtoa.c:861
	;;
#3:	       ldx	$mem, 0 -> r3.26 ; dtoa.c:861
	;;
#0:	       ldm.s	r15, 264        ; dtoa.c:861
	;;
#2:	       ldx	$mem, 0 -> r2.26 ; dtoa.c:861
	;;
#0:	       ldm.s	r15, 268        ; dtoa.c:861
	;;
#1:	       ldx	$mem, 0 -> r1.26 ; dtoa.c:861
	;;
#0:	       ldm.s	r15, 272        ; dtoa.c:861
	;;
#0:	       ldx	$mem, 0 -> r0.26 ; dtoa.c:861
	;;
#0:	       ldm.s	r15, 276        ; dtoa.c:861
	;;
#3:	       ldx	$mem, 0 -> r3.25 ; dtoa.c:861
	;;
#0:	       ldm.s	r15, 280        ; dtoa.c:861
	;;
#2:	       ldx	$mem, 0 -> r2.25 ; dtoa.c:861
	;;
#0:	       ldm.s	r15, 284        ; dtoa.c:861
	;;
#1:	       ldx	$mem, 0 -> r1.25 ; dtoa.c:861
	;;
#0:	       ldm.s	r15, 288        ; dtoa.c:861
	;;
#0:	       ldx	$mem, 0 -> r0.25 ; dtoa.c:861
	;;
#0:	       ldm.s	r15, 292        ; dtoa.c:861
	;;
#3:	       ldx	$mem, 0 -> r3.24 ; dtoa.c:861
	;;
#0:	       ldm.s	r15, 296        ; dtoa.c:861
	;;
#2:	       ldx	$mem, 0 -> r2.24 ; dtoa.c:861
	;;
#0:	       ldm.s	r15, 300        ; dtoa.c:861
	;;
#1:	       ldx	$mem, 0 -> r1.24 ; dtoa.c:861
	;;
#0:	       ldm.s	r15, 304        ; dtoa.c:861
	;;
#0:	       ldx	$mem, 0 -> r0.24 ; dtoa.c:861
	;;
#0:	       ldm.s	r15, 308        ; dtoa.c:861
	;;
#3:	       ldx	$mem, 0 -> r3.23 ; dtoa.c:861
	;;
#0:	       ldm.s	r15, 312        ; dtoa.c:861
	;;
#2:	       ldx	$mem, 0 -> r2.23 ; dtoa.c:861
	;;
#0:	       ldm.s	r15, 316        ; dtoa.c:861
	;;
#1:	       ldx	$mem, 0 -> r1.23 ; dtoa.c:861
	;;
#0:	       ldm.s	r15, 320        ; dtoa.c:861
	;;
#0:	       ldx	$mem, 0 -> r0.23 ; dtoa.c:861
	;;
#0:	       ldm.s	r15, 324        ; dtoa.c:861
	;;
#0:	       ldx	$mem, 0 -> r14  ; dtoa.c:861
	;;
#0:	       ldm.s	r15, 328        ; dtoa.c:861
	;;
#0:	       ldx	$mem, 0 -> r13  ; dtoa.c:861
	;;
#0:	       ldm.s	r15, 332        ; dtoa.c:861
	;;
#0:	       ldx	$mem, 0 -> r12  ; dtoa.c:861
	;;
#0:	       ldm.s	r15, 336        ; dtoa.c:861
	;;
#0:	       ldx	$mem, 0 -> r11  ; dtoa.c:861
	;;
#0:	       ldm.s	r15, 340        ; dtoa.c:861
#1:	       add	r15, r1 -> r15  ; dtoa.c:861
	;;
#0:	       jop	ret             ; dtoa.c:861
#1:	       ldx	$mem, 0 -> r10  ; dtoa.c:861
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB17_14:                               ; %bb19
#0:	       ldmg.d	_impure_data+76 ; mprec.c:103[ mprec.c:785[ dtoa.c:291 ] ]
#2:	       ldi	0 -> r2.26
	;;
#0:	       ldx	$mem, 0 -> r10  ; mprec.c:103[ mprec.c:785[ dtoa.c:291 ] ]
	;;
#0:	       brz ne @	r10, .BB17_27   ; mprec.c:103[ mprec.c:785[ dtoa.c:291 ] ]
	;;
.BB17_15:                               ; %bb.i.i
#0:	       ldi	132 -> r0
#1:	       callg	__malloc_r      ; mallocr.c:3207[ mprec.c:106[ mprec.c:785[ dtoa.c:291 ] ] ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz ne @	r0, .BB17_17    ; mallocr.c:3209[ mprec.c:106[ mprec.c:785[ dtoa.c:291 ] ] ]
	;;
.BB17_16:                               ; %_calloc_r.exit.i.thread
#0:	       ldi	0 -> r0
#1:	       br	.BB17_41
	;;
#0:	       stm.s	r0, r15, 10     ; mprec.c:106[ mprec.c:785[ dtoa.c:291 ] ]
#1:	       ldga	_impure_data -> r0 ; mprec.c:106[ mprec.c:785[ dtoa.c:291 ] ]
	;;
#0:	       stm.a	0, r0, 19       ; mprec.c:106[ mprec.c:785[ dtoa.c:291 ] ]
	;;
.BB17_17:                               ; %bb1.i.i
#0:	       or	r0, 0 -> r10    ; mallocr.c:3207[ mprec.c:106[ mprec.c:785[ dtoa.c:291 ] ] ]
#1:	       ldi	-4 -> r1
	;;
#0:	       ldm.f	r10, -4         ; mallocr.c:3233[ mprec.c:106[ mprec.c:785[ dtoa.c:291 ] ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:3233[ mprec.c:106[ mprec.c:785[ dtoa.c:291 ] ] ]
	;;
#0:	       sub	r0, 4 -> r0
	;;
#0:	       and	r0, r1 -> r2
#1:	       ldi	36 -> r0
	;;
#0:	       cmpult	r0, r2 -> c1    ; mallocr.c:3244[ mprec.c:106[ mprec.c:785[ dtoa.c:291 ] ] ]
	;;
#0:	if  c1 br @	.BB17_25
	;;
.BB17_18:                               ; %bb2.i1.i
#0:	       cmpult	r2, 20 -> c1    ; mallocr.c:3244[ mprec.c:106[ mprec.c:785[ dtoa.c:291 ] ] ]
#1:	       or	r10, 0 -> r0
	;;
#0:	if  c1 br @	.BB17_24
	;;
.BB17_19:                               ; %bb3.i2.i
#0:	       cmpult	r2, 28 -> c1    ; mallocr.c:3244[ mprec.c:106[ mprec.c:785[ dtoa.c:291 ] ] ]
#1:	       stm.a	0, r10, 0       ; mallocr.c:3244[ mprec.c:106[ mprec.c:785[ dtoa.c:291 ] ] ]
	;;
#0:	if !c1 br @	.BB17_21
#1:	       stm.a	0, r10, 1       ; mallocr.c:3244[ mprec.c:106[ mprec.c:785[ dtoa.c:291 ] ] ]
	;;
.BB17_20:
#0:	       add	r10, 8 -> r0
#1:	       br @	.BB17_24
	;;
.BB17_21:                               ; %bb4.i3.i
#0:	       ldi	36 -> r0
#1:	       stm.a	0, r10, 2       ; mallocr.c:3244[ mprec.c:106[ mprec.c:785[ dtoa.c:291 ] ] ]
	;;
#0:	       cmpult	r2, r0 -> c1    ; mallocr.c:3244[ mprec.c:106[ mprec.c:785[ dtoa.c:291 ] ] ]
#1:	       stm.a	0, r10, 3       ; mallocr.c:3244[ mprec.c:106[ mprec.c:785[ dtoa.c:291 ] ] ]
	;;
#0:	if !c1 br @	.BB17_23
	;;
.BB17_22:
#0:	       add	r10, 16 -> r0
#1:	       br @	.BB17_24
	;;
.BB17_23:                               ; %bb5.i4.i
#0:	       stm.a	0, r10, 4       ; mallocr.c:3244[ mprec.c:106[ mprec.c:785[ dtoa.c:291 ] ] ]
#1:	       add	r10, 24 -> r0
	;;
#0:	       stm.a	0, r10, 5       ; mallocr.c:3244[ mprec.c:106[ mprec.c:785[ dtoa.c:291 ] ] ]
	;;
.BB17_24:                               ; %bb6.i5.i
#0:	       stm.a	0, r0, 0        ; mallocr.c:3244[ mprec.c:106[ mprec.c:785[ dtoa.c:291 ] ] ]
#1:	       br	.BB17_26
	;;
#0:	       stm.a	0, r0, 1        ; mallocr.c:3244[ mprec.c:106[ mprec.c:785[ dtoa.c:291 ] ] ]
	;;
#0:	       stm.a	0, r0, 2        ; mallocr.c:3244[ mprec.c:106[ mprec.c:785[ dtoa.c:291 ] ] ]
	;;
.BB17_25:                               ; %bb7.i6.i
#0:	       ldi	0 -> r1
#1:	       callg	_memset         ; mallocr.c:3244[ mprec.c:106[ mprec.c:785[ dtoa.c:291 ] ] ]
#2:	       or	r10, 0 -> r0    ; mallocr.c:3244[ mprec.c:106[ mprec.c:785[ dtoa.c:291 ] ] ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB17_26:                               ; %_calloc_r.exit.i
#0:	       ldga	_impure_data -> r0 ; mprec.c:106[ mprec.c:785[ dtoa.c:291 ] ]
	;;
#0:	       stm.a	r10, r0, 19     ; mprec.c:106[ mprec.c:785[ dtoa.c:291 ] ]
	;;
.BB17_27:                               ; %bb2.i.i
#0:	       ldm.f	r10, 4          ; mprec.c:115[ mprec.c:785[ dtoa.c:291 ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:115[ mprec.c:785[ dtoa.c:291 ] ]
	;;
#0:	       brz eq @	r0, .BB17_29    ; mprec.c:115[ mprec.c:785[ dtoa.c:291 ] ]
#1:	       stm.s	r0, r15, 10     ; mprec.c:115[ mprec.c:785[ dtoa.c:291 ] ]
	;;
.BB17_28:                               ; %bb3.i.i
#0:	       ldm.s	r15, 40         ; mprec.c:117[ mprec.c:785[ dtoa.c:291 ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:117[ mprec.c:785[ dtoa.c:291 ] ]
	;;
#0:	       br	.BB17_40
#1:	       ldm.f	r0, 0           ; mprec.c:117[ mprec.c:785[ dtoa.c:291 ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:117[ mprec.c:785[ dtoa.c:291 ] ]
	;;
#0:	       stm.a	r0, r10, 1      ; mprec.c:117[ mprec.c:785[ dtoa.c:291 ] ]
	;;
.BB17_29:                               ; %bb4.i.i
#0:	       ldi	28 -> r0
#1:	       callg	__malloc_r      ; mallocr.c:3207[ mprec.c:123[ mprec.c:785[ dtoa.c:291 ] ] ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz eq	r0, .BB17_41    ; mallocr.c:3209[ mprec.c:123[ mprec.c:785[ dtoa.c:291 ] ] ]
#1:	       ldi	0 -> r1
	;;
#0:	       stm.s	r1, r15, 10     ; mallocr.c:3209[ mprec.c:123[ mprec.c:785[ dtoa.c:291 ] ] ]
	;;
	       nop	0
	;;
.BB17_30:                               ; %bb1.i7.i
#0:	       stm.s	r0, r15, 10     ; mallocr.c:3233[ mprec.c:123[ mprec.c:785[ dtoa.c:291 ] ] ]
#1:	       ldi	-4 -> r1
	;;
#0:	       ldm.f	r0, -4          ; mallocr.c:3233[ mprec.c:123[ mprec.c:785[ dtoa.c:291 ] ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:3233[ mprec.c:123[ mprec.c:785[ dtoa.c:291 ] ] ]
	;;
#0:	       sub	r0, 4 -> r0
	;;
#0:	       and	r0, r1 -> r2
#1:	       ldi	36 -> r0
	;;
#0:	       cmpult	r0, r2 -> c1    ; mallocr.c:3244[ mprec.c:123[ mprec.c:785[ dtoa.c:291 ] ] ]
	;;
#0:	if  c1 br @	.BB17_38
	;;
.BB17_31:                               ; %bb2.i8.i
#0:	       ldm.s	r15, 40
#1:	       cmpult	r2, 20 -> c1    ; mallocr.c:3244[ mprec.c:123[ mprec.c:785[ dtoa.c:291 ] ] ]
	;;
#0:	if  c1 br	.BB17_37
#1:	       ldx	$mem, 0 -> r0
	;;
#0:	       or	r0, 0 -> r1
	;;
	       nop	0
	;;
.BB17_32:                               ; %bb3.i9.i
#0:	       cmpult	r2, 28 -> c1    ; mallocr.c:3244[ mprec.c:123[ mprec.c:785[ dtoa.c:291 ] ] ]
#1:	       stm.a	0, r0, 0        ; mallocr.c:3244[ mprec.c:123[ mprec.c:785[ dtoa.c:291 ] ] ]
	;;
#0:	if !c1 br @	.BB17_34
#1:	       stm.a	0, r0, 1        ; mallocr.c:3244[ mprec.c:123[ mprec.c:785[ dtoa.c:291 ] ] ]
	;;
.BB17_33:
#0:	       ldm.s	r15, 40
#1:	       br	.BB17_37
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       add	r0, 8 -> r1
	;;
.BB17_34:                               ; %bb4.i10.i
#0:	       ldi	36 -> r1
#1:	       stm.a	0, r0, 2        ; mallocr.c:3244[ mprec.c:123[ mprec.c:785[ dtoa.c:291 ] ] ]
	;;
#0:	       cmpult	r2, r1 -> c1    ; mallocr.c:3244[ mprec.c:123[ mprec.c:785[ dtoa.c:291 ] ] ]
#1:	       stm.a	0, r0, 3        ; mallocr.c:3244[ mprec.c:123[ mprec.c:785[ dtoa.c:291 ] ] ]
	;;
#0:	if !c1 br @	.BB17_36
	;;
.BB17_35:
#0:	       ldm.s	r15, 40
#1:	       br	.BB17_37
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       add	r0, 16 -> r1
	;;
.BB17_36:                               ; %bb5.i11.i
#0:	       stm.a	0, r0, 4        ; mallocr.c:3244[ mprec.c:123[ mprec.c:785[ dtoa.c:291 ] ] ]
#1:	       add	r0, 24 -> r1
	;;
#0:	       stm.a	0, r0, 5        ; mallocr.c:3244[ mprec.c:123[ mprec.c:785[ dtoa.c:291 ] ] ]
	;;
.BB17_37:                               ; %bb6.i13.i
#0:	       stm.a	0, r1, 0        ; mallocr.c:3244[ mprec.c:123[ mprec.c:785[ dtoa.c:291 ] ] ]
#1:	       br	.BB17_39
	;;
#0:	       stm.a	0, r1, 1        ; mallocr.c:3244[ mprec.c:123[ mprec.c:785[ dtoa.c:291 ] ] ]
	;;
#0:	       stm.a	0, r1, 2        ; mallocr.c:3244[ mprec.c:123[ mprec.c:785[ dtoa.c:291 ] ] ]
	;;
.BB17_38:                               ; %bb7.i14.i
#0:	       ldm.s	r15, 40         ; mallocr.c:3244[ mprec.c:123[ mprec.c:785[ dtoa.c:291 ] ] ]
#1:	       ldi	0 -> r1
	;;
#0:	       callg	_memset         ; mallocr.c:3244[ mprec.c:123[ mprec.c:785[ dtoa.c:291 ] ] ]
#1:	       ldx	$mem, 0 -> r0   ; mallocr.c:3244[ mprec.c:123[ mprec.c:785[ dtoa.c:291 ] ] ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB17_39:                               ; %bb6.i.i
#0:	       ldm.s	r15, 40         ; mprec.c:128[ mprec.c:785[ dtoa.c:291 ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:128[ mprec.c:785[ dtoa.c:291 ] ]
	;;
#0:	       stm.a	1, r0, 1        ; mprec.c:128[ mprec.c:785[ dtoa.c:291 ] ]
	;;
#0:	       stm.a	2, r0, 2        ; mprec.c:129[ mprec.c:785[ dtoa.c:291 ] ]
	;;
.BB17_40:                               ; %bb7.i.i
#0:	       ldm.s	r15, 40         ; mprec.c:131[ mprec.c:785[ dtoa.c:291 ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:131[ mprec.c:785[ dtoa.c:291 ] ]
	;;
#0:	       stm.a	0, r0, 4        ; mprec.c:131[ mprec.c:785[ dtoa.c:291 ] ]
	;;
#0:	       stm.a	0, r0, 3        ; mprec.c:131[ mprec.c:785[ dtoa.c:291 ] ]
	;;
.BB17_41:                               ; %_Balloc.exit.i
#0:	       ldiu	2047 -> r1
#1:	       sr	r12, 20 -> r0
#2:	       ldiu	2047 -> r6
#3:	       ldiu	0 -> r4
	;;
#0:	       and	r0, r1 -> r2
#1:	       ldim	511 -> r6
#2:	       ldm.s	r15, 24         ; mprec.c:804[ dtoa.c:291 ]
#3:	       ldim	512 -> r4
	;;
#0:	       cmpeq	r2, 0 -> c1     ; mprec.c:799[ dtoa.c:291 ]
#1:	       and	r12, r6 -> r3   ; mprec.c:791[ dtoa.c:291 ]
	;;
#0:	       or	r3, r4 -> r5    ; mprec.c:800[ dtoa.c:291 ]
#1:	       ldx	$mem, 0 -> r0   ; mprec.c:804[ dtoa.c:291 ]
	;;
#0:	       brz eq @	r0, .BB17_54    ; mprec.c:804[ dtoa.c:291 ]
#1:	if  c1 and	r12, r6 -> r5
	;;
.BB17_42:                               ; %bb2.i15
#0:	       ldm.s	r15, 24         ; mprec.c:274[ mprec.c:807[ dtoa.c:291 ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:274[ mprec.c:807[ dtoa.c:291 ] ]
	;;
#0:	       and	r0, 7 -> r0     ; mprec.c:274[ mprec.c:807[ dtoa.c:291 ] ]
	;;
#0:	       brz eq @	r0, .BB17_47    ; mprec.c:274[ mprec.c:807[ dtoa.c:291 ] ]
	;;
.BB17_43:                               ; %bb.i45.i
#0:	       ldm.s	r15, 24         ; mprec.c:276[ mprec.c:807[ dtoa.c:291 ] ]
#1:	       ldi	0 -> r6
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:276[ mprec.c:807[ dtoa.c:291 ] ]
	;;
#0:	       btest	r0, 0 -> c1     ; mprec.c:276[ mprec.c:807[ dtoa.c:291 ] ]
	;;
#0:	if  c1 br @	.BB17_49
	;;
.BB17_44:                               ; %bb2.i46.i
#0:	       btest	r0, 1 -> c1     ; mprec.c:278[ mprec.c:807[ dtoa.c:291 ] ]
	;;
#0:	if !c1 br @	.BB17_46
	;;
.BB17_45:                               ; %bb3.i47.i
#0:	       ldm.s	r15, 24         ; mprec.c:280[ mprec.c:807[ dtoa.c:291 ] ]
#1:	       br	.BB17_51
#2:	       ldi	1 -> r4
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:280[ mprec.c:807[ dtoa.c:291 ] ]
	;;
#0:	       sr	r0, 1 -> r1     ; mprec.c:280[ mprec.c:807[ dtoa.c:291 ] ]
	;;
.BB17_46:                               ; %bb4.i48.i
#0:	       sr	r0, 2 -> r1     ; mprec.c:283[ mprec.c:807[ dtoa.c:291 ] ]
#1:	       br @	.BB17_51
#2:	       ldi	2 -> r4
	;;
.BB17_47:                               ; %bb5.i57.i
#0:	       ldm.s	r15, 24         ; mprec.c:287[ mprec.c:807[ dtoa.c:291 ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:287[ mprec.c:807[ dtoa.c:291 ] ]
	;;
#0:	       bbh	zext16 r0 -> r1 ; mprec.c:287[ mprec.c:807[ dtoa.c:291 ] ]
	;;
#0:	       cmpeq	r1, 0 -> c2     ; mprec.c:287[ mprec.c:807[ dtoa.c:291 ] ]
#1:	       or	r0, 0 -> r1
	;;
#0:	if  c2 sr	r1, 16 -> r1
	;;
#0:	       bbh	zext8 r1 -> r0  ; mprec.c:292[ mprec.c:807[ dtoa.c:291 ] ]
	;;
#0:	       cmpeq	r0, 0 -> c1     ; mprec.c:292[ mprec.c:807[ dtoa.c:291 ] ]
#1:	       ldx	$c2 -> r0
	;;
#0:	if  c1 sr	r1, 8 -> r1
	;;
#0:	       and	r1, 15 -> r4    ; mprec.c:297[ mprec.c:807[ dtoa.c:291 ] ]
	;;
#0:	       cmpeq	r4, 0 -> c2     ; mprec.c:297[ mprec.c:807[ dtoa.c:291 ] ]
#1:	       sl	r0, 4 -> r4
	;;
#0:	if  c2 sr	r1, 4 -> r1
#1:	if  c1 or	r4, 8 -> r4
	;;
#0:	       and	r1, 3 -> r0     ; mprec.c:302[ mprec.c:807[ dtoa.c:291 ] ]
#1:	if  c2 or	r4, 4 -> r4
	;;
#0:	       cmpeq	r0, 0 -> c1     ; mprec.c:302[ mprec.c:807[ dtoa.c:291 ] ]
	;;
#0:	if  c1 sr	r1, 2 -> r1
#1:	if  c1 or	r4, 2 -> r4
	;;
#0:	       btest	r1, 0 -> c1     ; mprec.c:307[ mprec.c:807[ dtoa.c:291 ] ]
	;;
#0:	if  c1 br @	.BB17_50
	;;
.BB17_48:                               ; %bb14.i58.i
#0:	       sr	r1, 1 -> r1     ; mprec.c:310[ mprec.c:807[ dtoa.c:291 ] ]
#1:	       add	r4, 1 -> r4     ; mprec.c:309[ mprec.c:807[ dtoa.c:291 ] ]
#2:	       ldi	32 -> r6
	;;
#0:	       brz ne @	r1, .BB17_50    ; mprec.c:311[ mprec.c:807[ dtoa.c:291 ] ]
	;;
.BB17_49:                               ; %bb17.i63.i
#0:	       ldm.s	r15, 24
#1:	       or	r6, 0 -> r4
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
.BB17_50:                               ; %__lo0bits.exit64.i
#0:	       brz eq @	r4, .BB17_52    ; mprec.c:808[ dtoa.c:291 ]
	;;
.BB17_51:                               ; %bb3.i16
#0:	       ldi	32 -> r0
	;;
#0:	       br	.BB17_53
#1:	       sub	r0, r4 -> r0    ; mprec.c:810[ dtoa.c:291 ]
	;;
#0:	       sl	r5, r0 -> r0    ; mprec.c:810[ dtoa.c:291 ]
#1:	       sr	r5, r4 -> r5    ; mprec.c:811[ dtoa.c:291 ]
	;;
#0:	       or	r0, r1 -> r1    ; mprec.c:810[ dtoa.c:291 ]
	;;
.BB17_52:                               ; %bb4.i
#0:	       ldi	0 -> r4
	;;
.BB17_53:                               ; %bb4.i
#0:	       ldm.s	r15, 40         ; mprec.c:814[ dtoa.c:291 ]
#1:	       cmpeq	r5, 0 -> c1     ; mprec.c:815[ dtoa.c:291 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:814[ dtoa.c:291 ]
	;;
#0:	       stm.a	r1, r0, 5       ; mprec.c:814[ dtoa.c:291 ]
#1:	       ldi	1 -> r0
#2:	       ldi	2 -> r1
	;;
#0:	       ldm.s	r15, 40         ; mprec.c:815[ dtoa.c:291 ]
#1:	if  c1 or	r0, 0 -> r1
	;;
#0:	       br	.BB17_63
#1:	       ldx	$mem, 0 -> r0   ; mprec.c:815[ dtoa.c:291 ]
	;;
#0:	       stm.a	r5, r0, 6       ; mprec.c:815[ dtoa.c:291 ]
	;;
#0:	       stm.a	r1, r0, 4       ; mprec.c:815[ dtoa.c:291 ]
	;;
.BB17_54:                               ; %bb9.i17
#0:	       and	r5, 7 -> r0     ; mprec.c:274[ mprec.c:824[ dtoa.c:291 ] ]
	;;
#0:	       brz eq @	r0, .BB17_59    ; mprec.c:274[ mprec.c:824[ dtoa.c:291 ] ]
	;;
.BB17_55:                               ; %bb.i36.i
#0:	       btest	r5, 0 -> c1     ; mprec.c:276[ mprec.c:824[ dtoa.c:291 ] ]
#1:	       ldi	0 -> r0
	;;
#0:	if  c1 br @	.BB17_61
	;;
.BB17_56:                               ; %bb2.i37.i
#0:	       btest	r5, 1 -> c1     ; mprec.c:278[ mprec.c:824[ dtoa.c:291 ] ]
	;;
#0:	if !c1 br @	.BB17_58
	;;
.BB17_57:                               ; %bb3.i38.i
#0:	       sr	r5, 1 -> r6     ; mprec.c:280[ mprec.c:824[ dtoa.c:291 ] ]
#1:	       br @	.BB17_62
#2:	       ldi	1 -> r1
	;;
.BB17_58:                               ; %bb4.i39.i
#0:	       sr	r5, 2 -> r6     ; mprec.c:283[ mprec.c:824[ dtoa.c:291 ] ]
#1:	       br @	.BB17_62
#2:	       ldi	2 -> r1
	;;
.BB17_59:                               ; %bb5.i.i
#0:	       bbh	zext16 r5 -> r0 ; mprec.c:287[ mprec.c:824[ dtoa.c:291 ] ]
#1:	       or	r5, 0 -> r6
	;;
#0:	       cmpeq	r0, 0 -> c2     ; mprec.c:287[ mprec.c:824[ dtoa.c:291 ] ]
	;;
#0:	if  c2 sr	r6, 16 -> r6
	;;
#0:	       bbh	zext8 r6 -> r0  ; mprec.c:292[ mprec.c:824[ dtoa.c:291 ] ]
	;;
#0:	       cmpeq	r0, 0 -> c1     ; mprec.c:292[ mprec.c:824[ dtoa.c:291 ] ]
#1:	       ldx	$c2 -> r0
	;;
#0:	if  c1 sr	r6, 8 -> r6
	;;
#0:	       and	r6, 15 -> r1    ; mprec.c:297[ mprec.c:824[ dtoa.c:291 ] ]
	;;
#0:	       cmpeq	r1, 0 -> c2     ; mprec.c:297[ mprec.c:824[ dtoa.c:291 ] ]
#1:	       sl	r0, 4 -> r1
	;;
#0:	if  c2 sr	r6, 4 -> r6
#1:	if  c1 or	r1, 8 -> r1
	;;
#0:	       and	r6, 3 -> r0     ; mprec.c:302[ mprec.c:824[ dtoa.c:291 ] ]
#1:	if  c2 or	r1, 4 -> r1
	;;
#0:	       cmpeq	r0, 0 -> c1     ; mprec.c:302[ mprec.c:824[ dtoa.c:291 ] ]
	;;
#0:	if  c1 sr	r6, 2 -> r6
#1:	if  c1 or	r1, 2 -> r1
	;;
#0:	       btest	r6, 0 -> c1     ; mprec.c:307[ mprec.c:824[ dtoa.c:291 ] ]
	;;
#0:	if  c1 br @	.BB17_62
	;;
.BB17_60:                               ; %bb14.i.i
#0:	       sr	r6, 1 -> r6     ; mprec.c:310[ mprec.c:824[ dtoa.c:291 ] ]
#1:	       add	r1, 1 -> r1     ; mprec.c:309[ mprec.c:824[ dtoa.c:291 ] ]
#2:	       ldi	32 -> r0
	;;
#0:	       brz ne @	r6, .BB17_62    ; mprec.c:311[ mprec.c:824[ dtoa.c:291 ] ]
	;;
.BB17_61:                               ; %bb17.i.i
#0:	       or	r5, 0 -> r6
#1:	       or	r0, 0 -> r1
	;;
.BB17_62:                               ; %__lo0bits.exit.i
#0:	       ldm.s	r15, 40         ; mprec.c:825[ dtoa.c:291 ]
#1:	       s2add	r1, 8 -> r4     ; mprec.c:828[ dtoa.c:291 ]
#2:	       ldi	1 -> r1
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:825[ dtoa.c:291 ]
	;;
#0:	       stm.a	r6, r0, 5       ; mprec.c:825[ dtoa.c:291 ]
	;;
#0:	       stm.a	1, r0, 4        ; mprec.c:826[ dtoa.c:291 ]
	;;
.BB17_63:                               ; %bb10.i
#0:	       brz ne @	r2, .BB17_66    ; mprec.c:886[ dtoa.c:291 ]
	;;
.BB17_64:                               ; %bb12.i
#0:	       ldm.s	r15, 40
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       s2add	r0, r1 -> r0
	;;
#0:	       ldm.f	r0, 16          ; mprec.c:902[ dtoa.c:291 ]
#1:	       ldga	65536 -> r0
	;;
#0:	       ldx	$mem, 0 -> r3   ; mprec.c:902[ dtoa.c:291 ]
	;;
#0:	       cmpult	r3, r0 -> c2
#1:	       ldga	0 -> r0
	;;
#0:	       ldih	8 -> r0
#1:	if  c2 sl	r3, 16 -> r3
#2:	       ldx	$c2 -> r5
	;;
#0:	       cmpult	r3, r0 -> c1
#1:	       ldga	0 -> r0
#2:	       sl	r5, 4 -> r5
	;;
#0:	       ldih	128 -> r0
#1:	if  c1 sl	r3, 8 -> r3
#2:	if  c1 or	r5, 8 -> r5
	;;
#0:	       cmpult	r3, r0 -> c2
#1:	       ldga	0 -> r0
	;;
#0:	       ldih	512 -> r0
#1:	if  c2 sl	r3, 4 -> r3
#2:	if  c2 or	r5, 4 -> r5
	;;
#0:	       cmpult	r3, r0 -> c1
	;;
#0:	if  c1 sl	r3, 2 -> r3
#1:	if  c1 or	r5, 2 -> r5
	;;
#0:	       cmplt	r3, 0 -> c1     ; mprec.c:259[ mprec.c:902[ dtoa.c:291 ] ]
	;;
#0:	if !c1 br @	.BB17_67
	;;
.BB17_65:
#0:	       or	r5, 0 -> r6
#1:	       br @	.BB17_68
	;;
.BB17_66:                               ; %bb20
#0:	       ldiu	973 -> r5
#1:	       ldi	53 -> r0
#2:	       add	r2, r4 -> r6
#3:	       ldga	1048576 -> r1
	;;
#0:	       sub	r0, r4 -> r0    ; mprec.c:894[ dtoa.c:291 ]
#1:	       ldim	2047 -> r5
#2:	       ldi	-1023 -> r7
#3:	       ldih	511 -> r1
	;;
#1:	       stm.s	r0, r15, 7
#2:	       add	r6, r5 -> r0
#0:	       ldi	0 -> r0.25
	;;
#0:	       stm.s	r0, r15, 8
#1:	       add	r2, r7 -> r0
#2:	       or	r3, r1 -> r2    ; dtoa.c:300
	;;
#0:	       br	.BB17_72
#1:	       ldm.s	r15, 24
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       or	r1, 0 -> r3
	;;
.BB17_67:                               ; %bb8.i35.i
#0:	       btest	r3, 30 -> c1
#1:	       ldi	32 -> r6
	;;
#0:	if  c1 add	r5, 1 -> r6
	;;
.BB17_68:                               ; %bb21
#0:	       sl	r1, 5 -> r3
#1:	       ldiu	974 -> r1
#2:	       add	r2, r4 -> r0
	;;
#0:	       ldim	2047 -> r1
	;;
#0:	       add	r0, r1 -> r1
#1:	       sub	r3, r6 -> r0    ; mprec.c:902[ dtoa.c:291 ]
	;;
#0:	       stm.s	r1, r15, 8      ; mprec.c:902[ dtoa.c:291 ]
#1:	       add	r0, r1 -> r2    ; dtoa.c:340
	;;
#0:	       stm.s	r0, r15, 7      ; dtoa.c:340
#1:	       ldiu	1074 -> r0
	;;
#0:	       add	r2, r0 -> r1    ; dtoa.c:340
#1:	       ldi	33 -> r0
	;;
#0:	       cmplt	r1, r0 -> c1    ; dtoa.c:344
	;;
#0:	if  c1 br @	.BB17_70
	;;
.BB17_69:                               ; %bb22
#0:	       ldi	-1010 -> r0
#1:	       ldm.s	r15, 24         ; dtoa.c:344
#2:	       ldiu	1042 -> r1
	;;
#0:	       sub	r0, r2 -> r0
#1:	       add	r2, r1 -> r3
	;;
#0:	       br	.BB17_71
#1:	       sl	r12, r0 -> r1   ; dtoa.c:344
#2:	       ldx	$mem, 0 -> r0   ; dtoa.c:344
	;;
#0:	       sr	r0, r3 -> r0    ; dtoa.c:344
	;;
#0:	       or	r1, r0 -> r1    ; dtoa.c:344
	;;
.BB17_70:                               ; %bb23
#0:	       ldiu	1006 -> r0
#1:	       ldm.s	r15, 24         ; dtoa.c:344
	;;
#0:	       ldim	2047 -> r0
	;;
#0:	       sub	r0, r2 -> r1
#1:	       ldx	$mem, 0 -> r0   ; dtoa.c:344
	;;
#0:	       sl	r0, r1 -> r1    ; dtoa.c:344
	;;
.BB17_71:                               ; %bb24
#1:	       ldiu	192 -> r6
#2:	       ldiu	0 -> r5
#0:	       ldi	1 -> r0.25
	;;
#0:	       add	r15, r6 -> r6
#1:	       ldim	512 -> r5
	;;
#0:	       add	r6, 0 -> r0
#1:	       ldiu	128 -> r6       ; dtoa.c:347
#2:	       ldih	537 -> r5
	;;
#0:	       or	r0, 4 -> r4     ; dtoa.c:347
#1:	       ldga	1048576 -> r0
#2:	       add	r15, r6 -> r6   ; dtoa.c:347
	;;
#0:	       ldih	537 -> r0
#1:	       stm.a	r1, r6, 16      ; dtoa.c:347
	;;
#0:	       stm.a	r0, r4, 0       ; dtoa.c:347
#1:	       ldiu	0 -> r0
	;;
#0:	       ldm.f	r15, 192        ; dtoa.c:347
#1:	       ldim	0 -> r0
	;;
#0:	       ldih	0 -> r0
	;;
#0:	       ldx	$mem, 0 -> r3   ; dtoa.c:347
#1:	       ldm.f	r4, 0           ; dtoa.c:347
#2:	       stx	r0 -> $f2
#3:	       ldiu	192 -> r4
	;;
#0:	       stx	r3 -> $f4       ; dtoa.c:347
#1:	       add	r15, r4 -> r4
	;;
#0:	       ldx	$mem, 0 -> r1   ; dtoa.c:347
#1:	       add	r4, 8 -> r0
#2:	       ldiu	128 -> r4
	;;
#0:	       stx	r1 -> $f0       ; dtoa.c:347
#1:	       or	r0, 4 -> r3
#2:	       sub	r2, 1 -> r0
#3:	       add	r15, r4 -> r4
	;;
#0:	       fop	fmov	f0 -> f5 ; dtoa.c:347
#1:	       ldga	1048576 -> r1
	;;
#0:	       stx	r5 -> $f0
#1:	       ldih	2032 -> r1
	;;
#0:	       fop	fmov	f0 -> f3
	;;
#0:	       fop	dsub	d2, d1 -> d0 ; dtoa.c:347
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r2
	;;
#0:	       stm.a	r2, r4, 18
#1:	       ldx	$f1 -> r2
	;;
#0:	       stm.a	r2, r3, 0
	;;
#0:	       ldm.f	r3, 0
	;;
#0:	       ldx	$mem, 0 -> r2
#1:	       ldm.f	r15, 200
	;;
#0:	       add	r2, r1 -> r2
	;;
#0:	       ldx	$mem, 0 -> r3
	;;
.BB17_72:                               ; %bb25
#0:	       ldiu	160 -> r5
	;;
#0:	       add	r15, r5 -> r5
	;;
#0:	       add	r5, 24 -> r1
#1:	       ldiu	128 -> r5
	;;
#0:	       add	r15, r5 -> r5
#1:	       or	r1, 4 -> r1
	;;
#0:	       stm.a	r3, r5, 14
#1:	       ldiu	0 -> r3
	;;
#0:	       stm.a	r2, r1, 0
#1:	       ldim	768 -> r3
	;;
#0:	       ldm.f	r15, 184
#1:	       ldih	1535 -> r3
	;;
#0:	       ldx	$mem, 0 -> r4
#1:	       ldm.f	r1, 0
#2:	       ldiu	0 -> r1
	;;
#0:	       ldim	0 -> r1
#1:	       stx	r4 -> $f4
#2:	       ldiu	179 -> r4
	;;
#0:	       ldx	$mem, 0 -> r2
#1:	       ldih	0 -> r1
#2:	       ldim	25 -> r4
	;;
#0:	       stx	r2 -> $f0
#1:	       ldiu	865 -> r2
#2:	       ldih	1115 -> r4
	;;
#0:	       stx	r1 -> $f2
#1:	       ldiu	1959 -> r1
#2:	       ldim	488 -> r2
	;;
#0:	       fop	fmov	f0 -> f5
#1:	       ldim	592 -> r1
#2:	       ldih	795 -> r2
	;;
#0:	       stx	r3 -> $f0
#1:	       ldiu	552 -> r3
#2:	       ldih	510 -> r1
	;;
#0:	       fop	fmov	f0 -> f3
#1:	       ldim	209 -> r3
	;;
#0:	       fop	dadd	d2, d1 -> d3
#1:	       ldih	510 -> r3
	;;
#0:	       stx	r4 -> $f4
	;;
#0:	       stx	r3 -> $f0
	;;
#0:	       stx	r2 -> $f2
#1:	       ldiu	507 -> r2
	;;
#0:	       fop	fmov	f0 -> f5
#1:	       ldim	1007 -> r2
	;;
#0:	       stx	r1 -> $f0
#1:	       ldiu	1043 -> r1
#2:	       ldih	644 -> r2
	;;
#0:	       fop	fmov	f0 -> f3
#1:	       ldim	616 -> r1
	;;
#0:	       ldih	510 -> r1
	;;
#0:	       fop	dmac	d3, d1 -> d2 ; dtoa.c:356
	;;
#0:	       stx	r0 -> $f0       ; dtoa.c:356
	;;
#0:	       fop	si2df	f0 -> d3 ; dtoa.c:356
	;;
#0:	       stx	r2 -> $f0
	;;
	       nop	0
	;;
#0:	       stx	r1 -> $f2
	;;
#0:	       fop	fmov	f2 -> f1
	;;
	       nop	0
	;;
#0:	       fop	dmac	d3, d0 -> d2 ; dtoa.c:356
	;;
#0:	       fop	dzero -> d0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       fop	df2si	d2 -> f2 ; dtoa.c:358
	;;
#0:	       fop	dcmp	d2, d0 -> f0 ; dtoa.c:359
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f2 -> r1       ; dtoa.c:358
	;;
#0:	       stm.s	r1, r15, 4      ; dtoa.c:359
#1:	       ldx	$f0 -> r1       ; dtoa.c:359
	;;
#0:	       btest	r1, 13 -> c1    ; dtoa.c:359
	;;
#0:	if  c1 br @	.BB17_74
	;;
.BB17_73:                               ; %bb26
#0:	       ldm.s	r15, 16         ; dtoa.c:359
	;;
#0:	       ldx	$mem, 0 -> r1   ; dtoa.c:359
	;;
#0:	       stx	r1 -> $f0       ; dtoa.c:359
	;;
#0:	       fop	si2df	f0 -> d0 ; dtoa.c:359
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       fop	dcmp	d0, d2 -> f0 ; dtoa.c:359
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r1       ; dtoa.c:359
	;;
#0:	       btest	r1, 0 -> c1     ; dtoa.c:359
	;;
#0:	if !c1 ldm.s	r15, 16
	;;
#0:	if !c1 ldx	$mem, 0 -> r1
	;;
#0:	if !c1 sub	r1, 1 -> r1
	;;
#0:	if !c1 stm.s	r1, r15, 4
	;;
.BB17_74:                               ; %bb28
#0:	       ldm.s	r15, 16         ; dtoa.c:362
#1:	       ldi	22 -> r2
#2:	       ldi	1 -> r4
	;;
#0:	       ldx	$mem, 0 -> r1   ; dtoa.c:362
	;;
#0:	       cmpult	r2, r1 -> c1    ; dtoa.c:362
	;;
#0:	if !c1 br @	.BB17_76
	;;
.BB17_75:
#1:	       ldi	1 -> r1.26
#0:	       br @	.BB17_77
	;;
.BB17_76:                               ; %bb29
#0:	       ldm.s	r15, 16         ; dtoa.c:364
#2:	       ldga	___mprec_tens -> r1 ; dtoa.c:364
#1:	       ldi	0 -> r1.26
	;;
#0:	       ldx	$mem, 0 -> r2   ; dtoa.c:364
	;;
#0:	       sl	r2, 3 -> r3     ; dtoa.c:364
	;;
#0:	       add	r1, r3 -> r1    ; dtoa.c:364
	;;
#0:	       ldm.f	r1, 0           ; dtoa.c:364
	;;
#0:	       ldx	$mem, 0 -> r3   ; dtoa.c:364
#1:	       ldm.f	r1, 4           ; dtoa.c:364
	;;
#0:	       ldx	$mem, 0 -> r1   ; dtoa.c:364
#1:	       stx	r3 -> $f0       ; dtoa.c:364
#2:	       ldi	-1 -> r3
	;;
#0:	       stx	r1 -> $f2       ; dtoa.c:364
	;;
#0:	       fop	fmov	f2 -> f1 ; dtoa.c:364
	;;
#0:	       fop	dcmp	d5, d0 -> f0 ; dtoa.c:364
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r1       ; dtoa.c:364
	;;
#0:	       btest	r1, 2 -> c1     ; dtoa.c:364
#1:	       ldi	0 -> r1
	;;
#0:	if  c1 or	r3, 0 -> r1
	;;
#0:	       add	r1, r2 -> r2
	;;
#0:	       stm.s	r2, r15, 4
	;;
.BB17_77:                               ; %bb32
#0:	       ldm.s	r15, 28         ; dtoa.c:368
#1:	       ldi	0 -> r1.25
#2:	       ldi	-1 -> r3
#3:	       ldi	0 -> r10
	;;
#0:	       ldx	$mem, 0 -> r1   ; dtoa.c:368
	;;
#0:	       sub	r1, r0 -> r2    ; dtoa.c:368
#1:	       ldi	0 -> r1
	;;
#1:	       cmplt	r1.25, r2 -> c1
	;;
#0:	if !c1 sub	r4, r2 -> r1
#1:	if  c1 add	r2, r3 -> r10
	;;
#0:	       stm.s	r1, r15, 11
	;;
#0:	       ldm.s	r15, 16         ; dtoa.c:379
	;;
#0:	       ldx	$mem, 0 -> r1   ; dtoa.c:379
	;;
#0:	       cmplt	r1, 0 -> c1     ; dtoa.c:379
	;;
#0:	if  c1 br @	.BB17_79
	;;
.BB17_78:                               ; %bb36
#1:	       ldi	0 -> r1.23
#0:	       br	.BB17_80
#2:	       add	r1, r10 -> r10  ; dtoa.c:383
	;;
#1:	       or	r1, 0 -> r1.25
	;;
	       nop	0
	;;
.BB17_79:                               ; %bb37
#0:	       ldm.s	r15, 44         ; dtoa.c:387
	;;
#0:	       ldx	$mem, 0 -> r1   ; dtoa.c:387
	;;
#0:	       ldm.s	r15, 16         ; dtoa.c:387
	;;
#0:	       ldx	$mem, 0 -> r2   ; dtoa.c:387
	;;
#0:	       sub	r1, r2 -> r1    ; dtoa.c:387
#1:	       sub	r1.25, r2 -> r1.23 ; dtoa.c:388
	;;
#0:	       stm.s	r1, r15, 11     ; dtoa.c:388
	;;
.BB17_80:                               ; %bb38
#0:	       ldi	9 -> r1
#1:	       ldi	5 -> r3
	;;
#0:	       cmpult	r1, r13 -> c1   ; dtoa.c:391
#1:	       ldi	-4 -> r1
	;;
#3:	       ldi	0 -> r3.23
#2:	       ldi	1 -> r2.23
	;;
#3:	if  c1 or	r3.23, 0 -> r13
	;;
#0:	       cmplt	r3, r13 -> c1   ; dtoa.c:394
#1:	       or	r13, 0 -> r2
	;;
#0:	if  c1 add	r2, r1 -> r2
#1:	       ldi	-1 -> r1
	;;
#0:	       cmpult	r3, r2 -> c1    ; dtoa.c:401
#1:	       stm.s	r2, r15, 2
	;;
#0:	if !c1 br @	.BB17_82
#1:	       stm.s	r1, r15, 3      ; dtoa.c:401
	;;
.BB17_81:
#0:	       ldm.s	r15, 12
#1:	       br	.BB17_85
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#1:	       or	r1, 0 -> r1.24
	;;
.BB17_82:                               ; %bb38
#0:	       ldga	.JTI17_0 -> r1
#1:	       or	r2, 0 -> r0
	;;
#0:	       s2add	r1, r0 -> r0
	;;
#0:	       ldm.d	r0, 0
	;;
#0:	       ldx	$mem, 0 -> r1
#1:	       ldm.s	r15, 12
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#1:	       or	r0, 0 -> r1.24
	;;
#0:	       jop	brind	r1
	;;
.BB17_83:                               ; %bb44
#2:	       ldi	0 -> r2.23
	;;
.BB17_84:                               ; %bb45
#0:	       cmplt	r14, 1 -> c1
#1:	       ldi	1 -> r0
	;;
#0:	if  c1 or	r0, 0 -> r14
	;;
#1:	       or	r14, 0 -> r1.24
#0:	       or	r14, 0 -> r0
#2:	       stm.s	r14, r15, 3
	;;
.BB17_85:                               ; %bb51
#0:	       cmpult	r0, 24 -> c1    ; dtoa.c:427
#1:	       ldga	_impure_data -> r1 ; dtoa.c:427
#2:	       ldi	0 -> r11
	;;
#0:	if  c1 br @	.BB17_89
#1:	       stm.a	0, r1, 17       ; dtoa.c:427
	;;
.BB17_86:
#0:	       ldi	4 -> r1
	;;
.BB17_87:                               ; %bb52
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sl	r1, 1 -> r1     ; dtoa.c:428
#1:	       add	r11, 1 -> r11
	;;
#0:	       add	r1, 20 -> r2    ; dtoa.c:427
	;;
#0:	       cmpule	r2, r0 -> c1    ; dtoa.c:427
	;;
#0:	if  c1 br @	.BB17_87
	;;
.BB17_88:                               ; %bb53.bb54_crit_edge
#0:	       ldga	_impure_data -> r0
	;;
#0:	       stm.a	r11, r0, 17
	;;
.BB17_89:                               ; %bb53.bb54_crit_edge
#3:	       or	r14, 0 -> r3.23
#0:	       br @	.BB17_93
	;;
.BB17_90:                               ; %bb48
#2:	       ldi	0 -> r2.23
	;;
.BB17_91:                               ; %bb49
#0:	       ldm.s	r15, 16         ; dtoa.c:420
#1:	       ldi	-1 -> r1
	;;
#3:	       or	r14, 0 -> r3.23
	;;
#0:	       ldx	$mem, 0 -> r0   ; dtoa.c:420
	;;
#1:	       add	r0, r14 -> r1.24 ; dtoa.c:420
	;;
#1:	       cmplt	r1, r1.24 -> c1 ; dtoa.c:423
	;;
#0:	if  c1 br	.BB17_85
#1:	       add	r1.24, 1 -> r0  ; dtoa.c:420
	;;
#0:	       stm.s	r0, r15, 3
	;;
	       nop	0
	;;
.BB17_92:                               ; %bb51.thread
#0:	       ldga	_impure_data -> r0 ; dtoa.c:427
#1:	       ldi	0 -> r11
	;;
#0:	       stm.a	0, r0, 17       ; dtoa.c:427
	;;
.BB17_93:                               ; %bb54
#0:	       ldmg.d	_impure_data+76 ; mprec.c:103[ dtoa.c:430 ]
	;;
#0:	       ldx	$mem, 0 -> r14  ; mprec.c:103[ dtoa.c:430 ]
	;;
#0:	       brz ne @	r14, .BB17_106  ; mprec.c:103[ dtoa.c:430 ]
	;;
.BB17_94:                               ; %bb.i18
#0:	       ldi	132 -> r0
#1:	       callg	__malloc_r      ; mallocr.c:3207[ mprec.c:106[ dtoa.c:430 ] ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz ne @	r0, .BB17_96    ; mallocr.c:3209[ mprec.c:106[ dtoa.c:430 ] ]
	;;
.BB17_95:                               ; %_calloc_r.exit213.thread
#0:	       ldi	0 -> r0
#1:	       br	.BB17_120
	;;
#0:	       stm.s	r0, r15, 5      ; mprec.c:106[ dtoa.c:430 ]
#1:	       ldga	_impure_data -> r0 ; mprec.c:106[ dtoa.c:430 ]
	;;
#0:	       stm.a	0, r0, 19       ; mprec.c:106[ dtoa.c:430 ]
	;;
.BB17_96:                               ; %bb1.i204
#0:	       or	r0, 0 -> r14    ; mallocr.c:3207[ mprec.c:106[ dtoa.c:430 ] ]
#1:	       ldi	-4 -> r1
	;;
#0:	       ldm.f	r14, -4         ; mallocr.c:3233[ mprec.c:106[ dtoa.c:430 ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:3233[ mprec.c:106[ dtoa.c:430 ] ]
	;;
#0:	       sub	r0, 4 -> r0
	;;
#0:	       and	r0, r1 -> r2
#1:	       ldi	36 -> r0
	;;
#0:	       cmpult	r0, r2 -> c1    ; mallocr.c:3244[ mprec.c:106[ dtoa.c:430 ] ]
	;;
#0:	if  c1 br @	.BB17_104
	;;
.BB17_97:                               ; %bb2.i205
#0:	       cmpult	r2, 20 -> c1    ; mallocr.c:3244[ mprec.c:106[ dtoa.c:430 ] ]
#1:	       or	r14, 0 -> r0
	;;
#0:	if  c1 br @	.BB17_103
	;;
.BB17_98:                               ; %bb3.i206
#0:	       cmpult	r2, 28 -> c1    ; mallocr.c:3244[ mprec.c:106[ dtoa.c:430 ] ]
#1:	       stm.a	0, r14, 0       ; mallocr.c:3244[ mprec.c:106[ dtoa.c:430 ] ]
	;;
#0:	if !c1 br @	.BB17_100
#1:	       stm.a	0, r14, 1       ; mallocr.c:3244[ mprec.c:106[ dtoa.c:430 ] ]
	;;
.BB17_99:
#0:	       add	r14, 8 -> r0
#1:	       br @	.BB17_103
	;;
.BB17_100:                              ; %bb4.i207
#0:	       ldi	36 -> r0
#1:	       stm.a	0, r14, 2       ; mallocr.c:3244[ mprec.c:106[ dtoa.c:430 ] ]
	;;
#0:	       cmpult	r2, r0 -> c1    ; mallocr.c:3244[ mprec.c:106[ dtoa.c:430 ] ]
#1:	       stm.a	0, r14, 3       ; mallocr.c:3244[ mprec.c:106[ dtoa.c:430 ] ]
	;;
#0:	if !c1 br @	.BB17_102
	;;
.BB17_101:
#0:	       add	r14, 16 -> r0
#1:	       br @	.BB17_103
	;;
.BB17_102:                              ; %bb5.i208
#0:	       stm.a	0, r14, 4       ; mallocr.c:3244[ mprec.c:106[ dtoa.c:430 ] ]
#1:	       add	r14, 24 -> r0
	;;
#0:	       stm.a	0, r14, 5       ; mallocr.c:3244[ mprec.c:106[ dtoa.c:430 ] ]
	;;
.BB17_103:                              ; %bb6.i210
#0:	       stm.a	0, r0, 0        ; mallocr.c:3244[ mprec.c:106[ dtoa.c:430 ] ]
#1:	       br	.BB17_105
	;;
#0:	       stm.a	0, r0, 1        ; mallocr.c:3244[ mprec.c:106[ dtoa.c:430 ] ]
	;;
#0:	       stm.a	0, r0, 2        ; mallocr.c:3244[ mprec.c:106[ dtoa.c:430 ] ]
	;;
.BB17_104:                              ; %bb7.i211
#0:	       ldi	0 -> r1
#1:	       callg	_memset         ; mallocr.c:3244[ mprec.c:106[ dtoa.c:430 ] ]
#2:	       or	r14, 0 -> r0    ; mallocr.c:3244[ mprec.c:106[ dtoa.c:430 ] ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB17_105:                              ; %_calloc_r.exit213
#0:	       ldga	_impure_data -> r0 ; mprec.c:106[ dtoa.c:430 ]
	;;
#0:	       stm.a	r14, r0, 19     ; mprec.c:106[ dtoa.c:430 ]
	;;
.BB17_106:                              ; %bb2.i19
#0:	       s2add	r14, r11 -> r1  ; mprec.c:115[ dtoa.c:430 ]
	;;
#0:	       ldm.f	r1, 0           ; mprec.c:115[ dtoa.c:430 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:115[ dtoa.c:430 ]
	;;
#0:	       brz eq @	r0, .BB17_108   ; mprec.c:115[ dtoa.c:430 ]
#1:	       stm.s	r0, r15, 5      ; mprec.c:115[ dtoa.c:430 ]
	;;
.BB17_107:                              ; %bb3.i20
#0:	       ldm.s	r15, 20         ; mprec.c:117[ dtoa.c:430 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:117[ dtoa.c:430 ]
	;;
#0:	       br	.BB17_119
#1:	       ldm.f	r0, 0           ; mprec.c:117[ dtoa.c:430 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:117[ dtoa.c:430 ]
	;;
#0:	       stm.a	r0, r1, 0       ; mprec.c:117[ dtoa.c:430 ]
	;;
.BB17_108:                              ; %bb4.i21
#0:	       ldi	1 -> r0
#1:	       callg	__malloc_r      ; mallocr.c:3207[ mprec.c:123[ dtoa.c:430 ] ]
	;;
#0:	       sl	r0, r11 -> r14  ; mprec.c:121[ dtoa.c:430 ]
#1:	       ldi	20 -> r0
	;;
#0:	       s2add	r0, r14 -> r0   ; mprec.c:123[ dtoa.c:430 ]
	;;
	       nop	0
	;;
#0:	       brz eq	r0, .BB17_120   ; mallocr.c:3209[ mprec.c:123[ dtoa.c:430 ] ]
#1:	       ldi	0 -> r1
	;;
#0:	       stm.s	r1, r15, 5      ; mallocr.c:3209[ mprec.c:123[ dtoa.c:430 ] ]
	;;
	       nop	0
	;;
.BB17_109:                              ; %bb1.i23
#0:	       stm.s	r0, r15, 5      ; mallocr.c:3233[ mprec.c:123[ dtoa.c:430 ] ]
#1:	       ldi	-4 -> r1
	;;
#0:	       ldm.f	r0, -4          ; mallocr.c:3233[ mprec.c:123[ dtoa.c:430 ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:3233[ mprec.c:123[ dtoa.c:430 ] ]
	;;
#0:	       sub	r0, 4 -> r0
	;;
#0:	       and	r0, r1 -> r2
#1:	       ldi	36 -> r0
	;;
#0:	       cmpult	r0, r2 -> c1    ; mallocr.c:3244[ mprec.c:123[ dtoa.c:430 ] ]
	;;
#0:	if  c1 br @	.BB17_117
	;;
.BB17_110:                              ; %bb2.i24
#0:	       cmpult	r2, 20 -> c1    ; mallocr.c:3244[ mprec.c:123[ dtoa.c:430 ] ]
#1:	       ldm.s	r15, 20
	;;
#0:	if  c1 br @	.BB17_116
#1:	       ldx	$mem, 0 -> r0
	;;
.BB17_111:                              ; %bb3.i25
#0:	       cmpult	r2, 28 -> c1    ; mallocr.c:3244[ mprec.c:123[ dtoa.c:430 ] ]
#1:	       stm.a	0, r0, 0        ; mallocr.c:3244[ mprec.c:123[ dtoa.c:430 ] ]
	;;
#0:	if !c1 br @	.BB17_113
#1:	       stm.a	0, r0, 1        ; mallocr.c:3244[ mprec.c:123[ dtoa.c:430 ] ]
	;;
.BB17_112:
#0:	       ldm.s	r15, 20
#1:	       br	.BB17_116
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       add	r0, 8 -> r0
	;;
.BB17_113:                              ; %bb4.i26
#0:	       or	r0, 0 -> r1     ; mallocr.c:3244[ mprec.c:123[ dtoa.c:430 ] ]
#1:	       ldi	36 -> r0
	;;
#0:	       cmpult	r2, r0 -> c1    ; mallocr.c:3244[ mprec.c:123[ dtoa.c:430 ] ]
#1:	       stm.a	0, r1, 2        ; mallocr.c:3244[ mprec.c:123[ dtoa.c:430 ] ]
	;;
#0:	if !c1 br @	.BB17_115
#1:	       stm.a	0, r1, 3        ; mallocr.c:3244[ mprec.c:123[ dtoa.c:430 ] ]
	;;
.BB17_114:
#0:	       ldm.s	r15, 20
#1:	       br	.BB17_116
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       add	r0, 16 -> r0
	;;
.BB17_115:                              ; %bb5.i27
#0:	       stm.a	0, r1, 4        ; mallocr.c:3244[ mprec.c:123[ dtoa.c:430 ] ]
#1:	       add	r1, 24 -> r0
	;;
#0:	       stm.a	0, r1, 5        ; mallocr.c:3244[ mprec.c:123[ dtoa.c:430 ] ]
	;;
.BB17_116:                              ; %bb6.i28
#0:	       stm.a	0, r0, 0        ; mallocr.c:3244[ mprec.c:123[ dtoa.c:430 ] ]
#1:	       br	.BB17_118
	;;
#0:	       stm.a	0, r0, 1        ; mallocr.c:3244[ mprec.c:123[ dtoa.c:430 ] ]
	;;
#0:	       stm.a	0, r0, 2        ; mallocr.c:3244[ mprec.c:123[ dtoa.c:430 ] ]
	;;
.BB17_117:                              ; %bb7.i29
#0:	       ldm.s	r15, 20         ; mallocr.c:3244[ mprec.c:123[ dtoa.c:430 ] ]
#1:	       ldi	0 -> r1
	;;
#0:	       callg	_memset         ; mallocr.c:3244[ mprec.c:123[ dtoa.c:430 ] ]
#1:	       ldx	$mem, 0 -> r0   ; mallocr.c:3244[ mprec.c:123[ dtoa.c:430 ] ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB17_118:                              ; %bb6.i
#0:	       ldm.s	r15, 20         ; mprec.c:128[ dtoa.c:430 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:128[ dtoa.c:430 ]
	;;
#0:	       stm.a	r11, r0, 1      ; mprec.c:128[ dtoa.c:430 ]
	;;
#0:	       stm.a	r14, r0, 2      ; mprec.c:129[ dtoa.c:430 ]
	;;
.BB17_119:                              ; %bb7.i22
#0:	       ldm.s	r15, 20         ; mprec.c:131[ dtoa.c:430 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:131[ dtoa.c:430 ]
	;;
#0:	       stm.a	0, r0, 4        ; mprec.c:131[ dtoa.c:430 ]
	;;
#0:	       stm.a	0, r0, 3        ; mprec.c:131[ dtoa.c:430 ]
	;;
.BB17_120:                              ; %_Balloc.exit
#0:	       ldm.s	r15, 12
#1:	       ldi	5 -> r1
#2:	       ldi	14 -> r2
	;;
#0:	       cmplt	r1, r13 -> c1
#1:	       ldga	_impure_data -> r1 ; dtoa.c:430
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       cmpult	r2, r0 -> c2
#1:	       ldm.s	r15, 20         ; dtoa.c:430
	;;
#0:	       comb	or c2, c1 -> c1
	;;
#0:	if  c1 br	.BB17_169
#1:	       ldx	$mem, 0 -> r0   ; dtoa.c:430
	;;
#0:	       stm.a	r0, r1, 16      ; dtoa.c:430
	;;
	       nop	0
	;;
.BB17_121:                              ; %bb56
#0:	       ldm.s	r15, 16         ; dtoa.c:442
	;;
#0:	       ldx	$mem, 0 -> r0   ; dtoa.c:442
	;;
#0:	       cmplt	r0, 1 -> c1     ; dtoa.c:442
	;;
#0:	if  c1 br @	.BB17_130
	;;
.BB17_122:                              ; %bb57
#0:	       and	r0, 15 -> r2    ; dtoa.c:444
#1:	       ldga	___mprec_tens -> r1 ; dtoa.c:444
#2:	       sra	r0, 4 -> r11    ; dtoa.c:445
	;;
#0:	       sl	r2, 3 -> r2     ; dtoa.c:444
#1:	       btest	r11, 4 -> c1    ; dtoa.c:446
	;;
#0:	       add	r1, r2 -> r1    ; dtoa.c:444
#2:	       ldi	2 -> r2.24
	;;
#0:	       ldm.f	r1, 0           ; dtoa.c:444
	;;
#0:	       ldx	$mem, 0 -> r2   ; dtoa.c:444
#1:	       ldm.f	r1, 4           ; dtoa.c:444
	;;
#0:	if  c1 br	.BB17_124
#1:	       ldx	$mem, 0 -> r1   ; dtoa.c:444
#2:	       stx	r2 -> $f12      ; dtoa.c:444
	;;
#0:	       stx	r1 -> $f0       ; dtoa.c:444
	;;
#0:	       fop	fmov	f0 -> f13 ; dtoa.c:444
	;;
.BB17_123:
#0:	       ldm.s	r15, 24
#1:	       br	.BB17_125
#2:	       or	r12, 0 -> r3
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       or	r0, 0 -> r4
	;;
.BB17_124:                              ; %bb58
#0:	       ldiu	1852 -> r1
#1:	       ldiu	2013 -> r0
#2:	       ldiu	128 -> r14
	;;
#0:	       ldim	631 -> r1
#1:	       ldim	681 -> r0
#2:	       add	r15, r14 -> r14
	;;
#0:	       ldih	1019 -> r1
#1:	       ldih	936 -> r0
#2:	       add	r14, 24 -> r13
	;;
#0:	       stx	r1 -> $f0
	;;
#0:	       stx	r0 -> $f2
	;;
#0:	       fop	fmov	f2 -> f1
	;;
#0:	       callg	___divdf3       ; dtoa.c:450
#1:	       ldx	$f10 -> r0      ; dtoa.c:450
	;;
#0:	       ldx	$f11 -> r1      ; dtoa.c:450
	;;
#0:	       ldx	$f0 -> r2       ; dtoa.c:450
	;;
#0:	       ldx	$f1 -> r3       ; dtoa.c:450
	;;
#0:	       ldiu	128 -> r2
#1:	       ldx	$f0 -> r1
#2:	       or	r13, 4 -> r0
#3:	       and	r11, 15 -> r11  ; dtoa.c:449
	;;
#0:	       add	r15, r2 -> r2
#2:	       ldi	3 -> r2.24
	;;
#0:	       stm.a	r1, r2, 6
#1:	       ldx	$f1 -> r1
	;;
#0:	       stm.a	r1, r0, 0
	;;
#0:	       ldm.f	r0, 0
	;;
#0:	       ldx	$mem, 0 -> r3
#1:	       ldm.f	r15, 152
	;;
#0:	       ldx	$mem, 0 -> r4
	;;
.BB17_125:                              ; %bb62.preheader
#0:	       ldga	___mprec_bigtens -> r1
#1:	       brz eq @	r11, .BB17_129  ; dtoa.c:453
	;;
.BB17_126:                              ; %bb59
                                        ; =>This Inner Loop Header: Depth=1
#0:	       btest	r11, 0 -> c1    ; dtoa.c:454
	;;
#0:	if !c1 br @	.BB17_128
	;;
.BB17_127:                              ; %bb60
                                        ;   in Loop: Header=BB17_126 Depth=1
#0:	       ldm.f	r1, 0           ; dtoa.c:457
#2:	       add	r2.24, 1 -> r2.24 ; dtoa.c:456
	;;
#0:	       ldx	$mem, 0 -> r2   ; dtoa.c:457
#1:	       ldm.f	r1, 4           ; dtoa.c:457
	;;
#0:	       stx	r2 -> $f0       ; dtoa.c:457
	;;
#0:	       ldx	$mem, 0 -> r0   ; dtoa.c:457
	;;
#0:	       stx	r0 -> $f2       ; dtoa.c:457
	;;
#0:	       fop	fmov	f2 -> f1 ; dtoa.c:457
	;;
#0:	       fop	dmul	d0, d6 -> d6 ; dtoa.c:457
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB17_128:                              ; %bb61
                                        ;   in Loop: Header=BB17_126 Depth=1
#0:	       sra	r11, 1 -> r11   ; dtoa.c:453
#1:	       add	r1, 8 -> r1
	;;
#0:	       brz ne @	r11, .BB17_126  ; dtoa.c:453
	;;
.BB17_129:                              ; %bb63
#0:	       ldiu	128 -> r13
#1:	       ldiu	128 -> r14
	;;
#0:	       add	r15, r13 -> r13
#1:	       add	r15, r14 -> r14
	;;
#0:	       add	r13, 16 -> r0
#1:	       ldiu	128 -> r13
#2:	       add	r14, 8 -> r2
	;;
#0:	       add	r15, r13 -> r13
#1:	       or	r0, 4 -> r0
#2:	       or	r2, 4 -> r11
#3:	       ldx	$f12 -> r2      ; dtoa.c:459
	;;
#0:	       stm.a	r4, r13, 4
	;;
#0:	       stm.a	r3, r0, 0
#1:	       ldx	$f13 -> r3      ; dtoa.c:459
	;;
#0:	       ldm.f	r15, 144
	;;
#0:	       ldx	$mem, 0 -> r1
#1:	       ldm.f	r0, 0
	;;
#0:	       stx	r1 -> $f0
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       callg	___divdf3       ; dtoa.c:459
#1:	       stx	r0 -> $f2
	;;
#0:	       fop	fmov	f2 -> f1
	;;
#0:	       ldx	$f0 -> r0       ; dtoa.c:459
	;;
#0:	       ldx	$f1 -> r1       ; dtoa.c:459
	;;
#0:	       ldiu	128 -> r1
#1:	       ldx	$f0 -> r0
	;;
#0:	       add	r15, r1 -> r1
	;;
#0:	       stm.a	r0, r1, 2
#1:	       ldx	$f1 -> r0
	;;
#0:	       stm.a	r0, r11, 0
	;;
#0:	       br	.BB17_135
#1:	       ldm.f	r11, 0
	;;
#0:	       ldx	$mem, 0 -> r13
#1:	       ldm.f	r15, 136
	;;
#3:	       ldx	$mem, 0 -> r3.24
	;;
.BB17_130:                              ; %bb64
#0:	       ldm.s	r15, 24
#2:	       ldi	2 -> r2.24
#1:	       or	r12, 0 -> r13
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       ldm.s	r15, 16         ; dtoa.c:461
	;;
#3:	       or	r0, 0 -> r3.24
	;;
#0:	       ldx	$mem, 0 -> r0   ; dtoa.c:461
	;;
#0:	       brz eq @	r0, .BB17_135   ; dtoa.c:461
	;;
.BB17_131:                              ; %bb65
#0:	       ldi	0 -> r1
#1:	       ldga	___mprec_tens -> r2 ; dtoa.c:463
	;;
#0:	       sub	r1, r0 -> r1    ; dtoa.c:461
#2:	       ldi	2 -> r2.24
	;;
#0:	       and	r1, 15 -> r0    ; dtoa.c:463
#1:	       sra	r1, 4 -> r5     ; dtoa.c:464
#2:	       ldga	___mprec_bigtens -> r1
	;;
#0:	       sl	r0, 3 -> r0     ; dtoa.c:463
	;;
#0:	       add	r2, r0 -> r0    ; dtoa.c:463
	;;
#0:	       ldm.f	r0, 0           ; dtoa.c:463
	;;
#0:	       ldx	$mem, 0 -> r3   ; dtoa.c:463
#1:	       ldm.f	r0, 4           ; dtoa.c:463
	;;
#0:	       ldx	$mem, 0 -> r2   ; dtoa.c:463
#1:	       stx	r3 -> $f0       ; dtoa.c:463
#2:	       ldiu	160 -> r3
	;;
#0:	       stx	r2 -> $f2       ; dtoa.c:463
#1:	       add	r15, r3 -> r3
	;;
#0:	       fop	fmov	f2 -> f1 ; dtoa.c:463
#1:	       add	r3, 16 -> r0
#2:	       ldiu	128 -> r3
	;;
#0:	       fop	dmul	d5, d0 -> d0 ; dtoa.c:463
#1:	       or	r0, 4 -> r2
#2:	       add	r15, r3 -> r3
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r0
	;;
#0:	       stm.a	r0, r3, 12
#1:	       ldx	$f1 -> r0
	;;
#0:	       stm.a	r0, r2, 0
	;;
#0:	       brz eq	r5, .BB17_135   ; dtoa.c:464
#1:	       ldm.f	r2, 0
	;;
#0:	       ldx	$mem, 0 -> r13
#1:	       ldm.f	r15, 176
	;;
#3:	       ldx	$mem, 0 -> r3.24
	;;
.BB17_132:                              ; %bb66
                                        ; =>This Inner Loop Header: Depth=1
#0:	       btest	r5, 0 -> c1     ; dtoa.c:465
	;;
#0:	if !c1 br @	.BB17_134
	;;
.BB17_133:                              ; %bb68
                                        ;   in Loop: Header=BB17_132 Depth=1
#0:	       ldiu	160 -> r6
#2:	       add	r2.24, 1 -> r2.24 ; dtoa.c:467
	;;
#0:	       add	r15, r6 -> r6
	;;
#0:	       add	r6, 8 -> r0
#1:	       ldiu	128 -> r6
	;;
#0:	       add	r15, r6 -> r6
#1:	       or	r0, 4 -> r0
	;;
#3:	       stm.a	r3.24, r6, 10
	;;
#0:	       stm.a	r13, r0, 0
	;;
#0:	       ldm.f	r1, 0           ; dtoa.c:468
	;;
#0:	       ldx	$mem, 0 -> r3   ; dtoa.c:468
#1:	       ldm.f	r15, 168
	;;
#0:	       stx	r3 -> $f2       ; dtoa.c:468
#1:	       ldiu	160 -> r3
	;;
#0:	       ldx	$mem, 0 -> r2
#1:	       ldm.f	r0, 0
#2:	       add	r15, r3 -> r3
	;;
#0:	       stx	r2 -> $f4
	;;
#0:	       ldx	$mem, 0 -> r0
#1:	       ldm.f	r1, 4           ; dtoa.c:468
	;;
#0:	       stx	r0 -> $f0
#1:	       add	r3, 0 -> r0
#2:	       ldiu	128 -> r3
	;;
#0:	       ldx	$mem, 0 -> r4   ; dtoa.c:468
#1:	       fop	fmov	f0 -> f5
#2:	       or	r0, 4 -> r2
#3:	       add	r15, r3 -> r3
	;;
#0:	       stx	r4 -> $f0       ; dtoa.c:468
	;;
#0:	       fop	fmov	f0 -> f3 ; dtoa.c:468
	;;
#0:	       fop	dmul	d2, d1 -> d0 ; dtoa.c:468
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r0
	;;
#0:	       stm.a	r0, r3, 8
#1:	       ldx	$f1 -> r0
	;;
#0:	       stm.a	r0, r2, 0
	;;
#0:	       ldm.f	r2, 0
	;;
#0:	       ldx	$mem, 0 -> r13
#1:	       ldm.f	r15, 160
	;;
#3:	       ldx	$mem, 0 -> r3.24
	;;
.BB17_134:                              ; %bb69
                                        ;   in Loop: Header=BB17_132 Depth=1
#0:	       sra	r5, 1 -> r5     ; dtoa.c:464
#1:	       add	r1, 8 -> r1
	;;
#0:	       brz ne @	r5, .BB17_132   ; dtoa.c:464
	;;
.BB17_135:                              ; %bb71
#0:	       ldm.s	r15, 16
	;;
#1:	       brz eq	r1.26, .BB17_140 ; dtoa.c:471
#0:	       ldx	$mem, 0 -> r0
	;;
#1:	       ldm.s	r15, 12
#0:	       or	r0, 0 -> r0.23
	;;
#0:	       ldx	$mem, 0 -> r14
	;;
.BB17_136:                              ; %bb72
#0:	       ldiu	128 -> r2
#1:	       fop	done -> d1
	;;
#0:	       add	r15, r2 -> r2
	;;
#0:	       add	r2, 0 -> r0
#1:	       ldiu	128 -> r2
	;;
#0:	       add	r15, r2 -> r2
#1:	       or	r0, 4 -> r0
	;;
#3:	       stm.a	r3.24, r2, 0
	;;
#0:	       stm.a	r13, r0, 0
	;;
#0:	       ldm.f	r15, 128
	;;
#0:	       ldx	$mem, 0 -> r1
#1:	       ldm.f	r0, 0
	;;
#0:	       stx	r1 -> $f4
#1:	       ldi	0 -> r1
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       stx	r0 -> $f0
#1:	       or	r14, 0 -> r0    ; dtoa.c:471
	;;
#0:	       fop	fmov	f0 -> f5
#1:	       cmplt	r1, r0 -> c2    ; dtoa.c:471
	;;
#0:	       fop	dcmp	d2, d1 -> f0 ; dtoa.c:471
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r0       ; dtoa.c:471
	;;
#0:	       btest	r0, 2 -> c1     ; dtoa.c:471
	;;
#0:	       comb	and c1, c2 -> c1
	;;
#0:	if  c1 br @	.BB17_138
	;;
.BB17_137:
#0:	       ldm.s	r15, 16
	;;
#0:	       br	.BB17_140
#1:	       ldx	$mem, 0 -> r0
	;;
#1:	       ldm.s	r15, 12
#0:	       or	r0, 0 -> r0.23
	;;
#0:	       ldx	$mem, 0 -> r14
	;;
.BB17_138:                              ; %bb74
#1:	       cmplt	r1.24, 1 -> c1
	;;
#0:	if  c1 br @	.BB17_169
	;;
.BB17_139:                              ; %bb75
#0:	       ldiu	0 -> r0
#1:	       ldiu	0 -> r1
#2:	       s2add	r15, 24 -> r2
	;;
#0:	       ldim	0 -> r1
#2:	       ldim	128 -> r0
#1:	       or	r1.24, 0 -> r14
	;;
#0:	       ldih	0 -> r1
#1:	       ldih	513 -> r0
	;;
#0:	       stx	r0 -> $f2
#1:	       add	r2, 24 -> r0
	;;
#0:	       stx	r1 -> $f0
#1:	       or	r0, 4 -> r1
	;;
#0:	       fop	fmov	f2 -> f1
#1:	       ldm.s	r15, 16
	;;
#0:	       fop	dmul	d2, d0 -> d0 ; dtoa.c:477
#2:	       add	r2.24, 1 -> r2.24 ; dtoa.c:478
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       sub	r0, 1 -> r0.23
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r0
	;;
#0:	       stm.a	r0, r15, 30
#1:	       ldx	$f1 -> r0
	;;
#0:	       stm.a	r0, r1, 0
	;;
#0:	       ldm.f	r1, 0
	;;
#0:	       ldx	$mem, 0 -> r13
#1:	       ldm.f	r15, 120
	;;
#3:	       ldx	$mem, 0 -> r3.24
	;;
.BB17_140:                              ; %bb76
#0:	       s2add	r15, 24 -> r4
#1:	       ldiu	0 -> r5
#2:	       s2add	r15, 24 -> r6
#3:	       ldiu	0 -> r3
	;;
#0:	       add	r4, 16 -> r0
#1:	       ldim	0 -> r5
	;;
#0:	       or	r0, 4 -> r1
#1:	       ldiu	0 -> r0
#2:	       ldih	0 -> r5
	;;
#3:	       stm.a	r3.24, r15, 28
#0:	       ldim	896 -> r0
#1:	       stx	r5 -> $f2
	;;
#0:	       stm.a	r13, r1, 0
#2:	       stx	r2.24 -> $f0    ; dtoa.c:480
#1:	       ldih	512 -> r0
	;;
#0:	       ldm.f	r15, 112
#1:	       fop	si2df	f0 -> d3 ; dtoa.c:480
	;;
#0:	       stx	r0 -> $f0
#1:	       add	r6, 8 -> r0
	;;
#0:	       ldx	$mem, 0 -> r2
#1:	       ldm.f	r1, 0
	;;
#0:	       stx	r2 -> $f4
#1:	       or	r0, 4 -> r2
	;;
#0:	       ldx	$mem, 0 -> r1
#1:	       fop	fmov	f0 -> f3
	;;
#0:	       stx	r1 -> $f0
#1:	       ldga	0 -> r1
	;;
#0:	       fop	fmov	f0 -> f5
#1:	       ldih	2022 -> r1
	;;
#0:	       fop	dmac	d3, d2 -> d1 ; dtoa.c:480
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f2 -> r0
	;;
#0:	       stm.a	r0, r15, 26
#1:	       ldx	$f3 -> r0
	;;
#0:	       stm.a	r0, r2, 0
	;;
#0:	       ldm.f	r2, 0
	;;
#0:	       brz ne	r14, .BB17_146  ; dtoa.c:482
#1:	       ldx	$mem, 0 -> r0
#2:	       ldm.f	r15, 104
	;;
#0:	       add	r0, r1 -> r0
	;;
#0:	       ldx	$mem, 0 -> r4
	;;
.BB17_141:                              ; %bb77
#0:	       ldim	640 -> r3
#1:	       stx	r5 -> $f0
	;;
#0:	       ldih	1536 -> r3
	;;
#0:	       stx	r3 -> $f2
#1:	       s2add	r15, 16 -> r3
	;;
#0:	       add	r3, 0 -> r1
#1:	       fop	fmov	f2 -> f1
#2:	       stm.a	r4, r15, 16
	;;
#0:	       or	r1, 4 -> r2
#1:	       fop	dadd	d2, d0 -> d2
	;;
#0:	       stm.a	r0, r2, 0
#1:	       ldi	0 -> r0
	;;
#0:	       stm.s	r0, r15, 9
	;;
#0:	       ldm.f	r15, 64
	;;
	       nop	0
	;;
#0:	       ldx	$mem, 0 -> r1
#1:	       ldm.f	r2, 0
	;;
#0:	       stx	r1 -> $f2
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       stx	r0 -> $f0
	;;
#0:	       fop	fmov	f0 -> f3
	;;
#0:	       fop	dcmp	d2, d1 -> f0 ; dtoa.c:486
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r0       ; dtoa.c:486
	;;
#0:	       btest	r0, 4 -> c1     ; dtoa.c:486
	;;
#0:	if !c1 br @	.BB17_144
	;;
.BB17_142:
#0:	       or	r0.23, 0 -> r0
	;;
#0:	       stm.s	r0, r15, 4
	;;
#0:	       ldm.s	r15, 36
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       or	r0, 0 -> r2
	;;
.BB17_143:                              ; %one_digit
#0:	       ldm.s	r15, 16         ; dtoa.c:735
	;;
#0:	       ldx	$mem, 0 -> r0   ; dtoa.c:735
	;;
#0:	       add	r0, 1 -> r0     ; dtoa.c:735
	;;
#0:	       stm.s	r0, r15, 4
#1:	       ldi	0 -> r0
	;;
#0:	       stm.s	r0, r15, 7      ; dtoa.c:734
	;;
#0:	       ldm.s	r15, 20         ; dtoa.c:734
	;;
#0:	       ldx	$mem, 0 -> r1   ; dtoa.c:734
	;;
#0:	       add	r1, 1 -> r0     ; dtoa.c:734
	;;
#0:	       br	.BB17_426
#1:	       stm.s	r0, r15, 11
#2:	       ldi	49 -> r0
	;;
#0:	       stmb.a	r0, r1, 0       ; dtoa.c:734
#1:	       or	r2, 0 -> r0
	;;
#0:	       stm.s	r0, r15, 8      ; dtoa.c:735
	;;
.BB17_144:                              ; %bb78
#0:	       fop	dneg	d1 -> d0 ; dtoa.c:488
#1:	       ldi	0 -> r0
	;;
#0:	       fop	dcmp	d2, d0 -> f0 ; dtoa.c:488
#1:	       stm.s	r0, r15, 9      ; dtoa.c:488
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r0       ; dtoa.c:488
	;;
#0:	       btest	r0, 2 -> c1     ; dtoa.c:488
	;;
#0:	if !c1 br @	.BB17_169
	;;
.BB17_145:
#0:	       ldm.s	r15, 36
#1:	       br	.BB17_300
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       stm.s	r0, r15, 8
	;;
.BB17_146:                              ; %bb79
#2:	       cmpeq	r2.23, 0 -> c3  ; dtoa.c:493
	;;
#0:	if  c3 br @	.BB17_159       ; dtoa.c:493
	;;
.BB17_147:                              ; %bb80
#0:	       s2add	r15, 24 -> r5
#1:	       sl	r14, 3 -> r2
#2:	       ldga	___mprec_tens -> r1 ; dtoa.c:498
#3:	       stm.a	r4, r15, 24
	;;
#0:	       add	r5, 0 -> r3
#1:	       add	r2, r1 -> r1    ; dtoa.c:498
#2:	       fop	dhalf -> d2
	;;
#0:	       or	r3, 4 -> r3
	;;
#0:	       stm.a	r0, r3, 0
	;;
#0:	       ldm.f	r1, -8          ; dtoa.c:498
	;;
#0:	       ldx	$mem, 0 -> r2   ; dtoa.c:498
#1:	       ldm.f	r1, -4          ; dtoa.c:498
	;;
#0:	       ldx	$mem, 0 -> r1   ; dtoa.c:498
#1:	       ldm.f	r15, 96
#2:	       stx	r2 -> $f2       ; dtoa.c:498
	;;
#0:	       stx	r1 -> $f0       ; dtoa.c:498
	;;
#0:	       ldx	$mem, 0 -> r0
#1:	       ldm.f	r3, 0
#2:	       ldx	$f5 -> r1       ; dtoa.c:498
	;;
#0:	       stx	r0 -> $f12
	;;
#0:	       ldx	$mem, 0 -> r0.24
#1:	       fop	fmov	f0 -> f3 ; dtoa.c:498
#2:	       ldm.s	r15, 20
	;;
#0:	       ldx	$f2 -> r2       ; dtoa.c:498
	;;
#0:	       callg	___divdf3       ; dtoa.c:498
#1:	       ldx	$mem, 0 -> r0
#2:	       ldx	$f3 -> r3       ; dtoa.c:498
	;;
#0:	       add	r0, 1 -> r11
#1:	       ldx	$f4 -> r0       ; dtoa.c:498
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       stx	r0.24 -> $f2
#1:	       ldi	1 -> r2
	;;
#0:	       fop	fmov	f2 -> f13
	;;
#0:	       fop	dsub	d0, d6 -> d2 ; dtoa.c:498
	;;
#0:	       fop	done -> d1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       br	.BB17_151
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB17_148:                              ; %bb82
                                        ;   in Loop: Header=BB17_151 Depth=1
#0:	       fop	dsub	d1, d3 -> d0 ; dtoa.c:506
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       fop	dcmp	d0, d2 -> f0 ; dtoa.c:506
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r0       ; dtoa.c:506
	;;
#0:	       btest	r0, 2 -> c1     ; dtoa.c:506
	;;
#0:	if  c1 br @	.BB17_153
	;;
.BB17_149:                              ; %bb83
                                        ;   in Loop: Header=BB17_151 Depth=1
#0:	       cmple	r14, r2 -> c1   ; dtoa.c:508
	;;
#0:	if  c1 br @	.BB17_169
	;;
.BB17_150:                              ; %bb84
                                        ;   in Loop: Header=BB17_151 Depth=1
#0:	       ldiu	0 -> r1
#1:	       ldiu	0 -> r0
#2:	       s2add	r15, 16 -> r3
#3:	       add	r11, 1 -> r11
	;;
#0:	       ldim	0 -> r1
#1:	       ldim	128 -> r0
#2:	       add	r2, 1 -> r2
	;;
#0:	       ldih	0 -> r1
#1:	       ldih	513 -> r0
	;;
#0:	       stx	r0 -> $f0
#1:	       add	r3, 16 -> r0
	;;
#0:	       stx	r1 -> $f8
#1:	       or	r0, 4 -> r1
	;;
#0:	       fop	fmov	f0 -> f9
	;;
#0:	       fop	dmul	d3, d4 -> d0 ; dtoa.c:511
	;;
#0:	       fop	dmul	d2, d4 -> d2 ; dtoa.c:510
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r0
	;;
#0:	       stm.a	r0, r15, 20
#1:	       ldx	$f1 -> r0
	;;
#0:	       stm.a	r0, r1, 0
	;;
#0:	       ldm.f	r1, 0
	;;
#0:	       ldx	$mem, 0 -> r13
#1:	       ldm.f	r15, 80
	;;
#3:	       ldx	$mem, 0 -> r3.24
	;;
.BB17_151:                              ; %bb81
                                        ; =>This Inner Loop Header: Depth=1
#0:	       s2add	r15, 16 -> r4
#1:	       sub	r11, 1 -> r3
	;;
#0:	       add	r4, 24 -> r0
	;;
#0:	       or	r0, 4 -> r0
	;;
#3:	       stm.a	r3.24, r15, 22
	;;
#0:	       stm.a	r13, r0, 0
	;;
#0:	       ldm.f	r15, 88
	;;
#0:	       ldx	$mem, 0 -> r1
#1:	       ldm.f	r0, 0
	;;
#0:	       stx	r1 -> $f8
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       stx	r0 -> $f0
	;;
#0:	       fop	fmov	f0 -> f9
	;;
#0:	       fop	df2si	d4 -> f6 ; dtoa.c:501
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       fop	si2df	f6 -> d0 ; dtoa.c:502
	;;
#0:	       ldx	$f6 -> r0       ; dtoa.c:501
	;;
#0:	       s2add	r0, 12 -> r0    ; dtoa.c:503
	;;
#0:	       fop	dsub	d4, d0 -> d3 ; dtoa.c:502
#1:	       stmb.a	r0, r3, 0       ; dtoa.c:503
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       fop	dcmp	d3, d2 -> f0 ; dtoa.c:504
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r0       ; dtoa.c:504
	;;
#0:	       btest	r0, 2 -> c1     ; dtoa.c:504
	;;
#0:	if !c1 br @	.BB17_148
	;;
.BB17_152:
#0:	       or	r0.23, 0 -> r0
#1:	       br	.BB17_477
	;;
#0:	       stm.s	r0, r15, 4
	;;
#0:	       stm.s	r11, r15, 11
	;;
.BB17_153:
#0:	       or	r0.23, 0 -> r0
	;;
#0:	       stm.s	r0, r15, 4
	;;
.BB17_154:                              ; %bb106.preheader
#0:	       ldi	57 -> r1
	;;
.BB17_155:                              ; %bb106
                                        ; =>This Inner Loop Header: Depth=1
#0:	       or	r11, 0 -> r0
	;;
#0:	       stm.s	r0, r15, 11
#1:	       sub	r0, 1 -> r11
	;;
#0:	       ldm.f	r0, -1          ; dtoa.c:579
	;;
#0:	       ldx	$membu, r11 -> r0 ; dtoa.c:579
	;;
#0:	       cmpeq	r0, r1 -> c1    ; dtoa.c:579
	;;
#0:	if !c1 br @	.BB17_158
	;;
.BB17_156:                              ; %bb104
                                        ;   in Loop: Header=BB17_155 Depth=1
#0:	       ldm.s	r15, 20         ; dtoa.c:580
	;;
#0:	       ldx	$mem, 0 -> r0   ; dtoa.c:580
	;;
#0:	       cmpne	r0, r11 -> c1   ; dtoa.c:580
	;;
#0:	if  c1 br @	.BB17_155
	;;
.BB17_157:                              ; %bb105
#0:	       ldm.s	r15, 16         ; dtoa.c:582
#1:	       ldi	48 -> r1
	;;
#0:	       ldx	$mem, 0 -> r0   ; dtoa.c:582
	;;
#0:	       add	r0, 1 -> r0     ; dtoa.c:582
	;;
#0:	       br	.BB17_477
#1:	       stm.s	r0, r15, 4
#2:	       ldi	49 -> r0
	;;
#0:	       stmb.a	r1, r11, 0      ; dtoa.c:583
	;;
#0:	       stmb.a	r0, r11, 0      ; dtoa.c:586
	;;
.BB17_158:                              ; %bb107.loopexit
#0:	       add	r0, 1 -> r0
#1:	       br	.BB17_477
	;;
#0:	       stmb.a	r0, r11, 0      ; dtoa.c:586
	;;
	       nop	0
	;;
.BB17_159:                              ; %bb85
#0:	       s2add	r15, 16 -> r5
#1:	       stm.a	r4, r15, 18
#2:	       fop	df2si	d2 -> f8 ; dtoa.c:521
#3:	       ldga	___mprec_tens -> r2 ; dtoa.c:518
	;;
#0:	       add	r5, 8 -> r1
#1:	       cmpeq	r14, 1 -> c1    ; dtoa.c:524
	;;
#0:	       or	r1, 4 -> r1
	;;
#0:	       stm.a	r0, r1, 0
#1:	       sl	r14, 3 -> r0
#2:	       fop	si2df	f8 -> d0 ; dtoa.c:522
	;;
#0:	       ldm.f	r15, 72
#1:	       add	r0, r2 -> r0    ; dtoa.c:518
	;;
	       nop	0
	;;
#0:	       ldx	$mem, 0 -> r3
#1:	       ldm.f	r0, -8          ; dtoa.c:518
#2:	       fop	dsub	d2, d0 -> d1 ; dtoa.c:522
	;;
#0:	       ldx	$mem, 0 -> r2   ; dtoa.c:518
#1:	       ldm.f	r1, 0
#2:	       stx	r3 -> $f6
	;;
#0:	       stx	r2 -> $f4       ; dtoa.c:518
	;;
#0:	       ldx	$mem, 0 -> r1
#1:	       ldm.f	r0, -4          ; dtoa.c:518
	;;
#0:	       ldx	$mem, 0 -> r0   ; dtoa.c:518
#1:	       stx	r1 -> $f0
	;;
#0:	       fop	fmov	f0 -> f7
	;;
#0:	       stx	r0 -> $f0       ; dtoa.c:518
	;;
	       nop	0
	;;
#0:	       fop	fmov	f0 -> f5 ; dtoa.c:518
#1:	       ldm.s	r15, 20         ; dtoa.c:523
	;;
#0:	       fop	dmul	d3, d2 -> d3 ; dtoa.c:518
	;;
#0:	       ldx	$f8 -> r0       ; dtoa.c:521
#1:	       ldx	$mem, 0 -> r1   ; dtoa.c:523
	;;
#0:	       s2add	r0, 12 -> r0    ; dtoa.c:523
	;;
#0:	       stmb.a	r0, r1, 0       ; dtoa.c:523
	;;
	       nop	0
	;;
#0:	if !c1 br	.BB17_167
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB17_160:
#0:	       ldm.s	r15, 20         ; dtoa.c:523
#1:	       br	.BB17_162
	;;
#0:	       ldx	$mem, 0 -> r0   ; dtoa.c:523
	;;
#0:	       add	r0, 1 -> r11    ; dtoa.c:523
	;;
.BB17_161:                              ; %bb86.bb87_crit_edge
#0:	       ldm.s	r15, 20
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       add	r0, r14 -> r11
	;;
.BB17_162:                              ; %bb87
#0:	       fop	dhalf -> d2
	;;
#0:	       fop	dadd	d3, d2 -> d0 ; dtoa.c:526
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       fop	dcmp	d1, d0 -> f0 ; dtoa.c:526
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r0       ; dtoa.c:526
	;;
#0:	       btest	r0, 4 -> c1     ; dtoa.c:526
	;;
#0:	if  c1 br @	.BB17_153
	;;
.BB17_163:                              ; %bb88
#0:	       fop	dsub	d2, d3 -> d0 ; dtoa.c:528
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       fop	dcmp	d1, d0 -> f0 ; dtoa.c:528
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r0       ; dtoa.c:528
	;;
#0:	       btest	r0, 13 -> c1    ; dtoa.c:528
	;;
#0:	if  c1 br @	.BB17_169
	;;
.BB17_164:                              ; %bb89.preheader
#0:	       add	r11, 1 -> r0
#1:	       ldi	48 -> r2
	;;
#0:	       stm.s	r0, r15, 11
	;;
.BB17_165:                              ; %bb89
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.s	r15, 44
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       ldm.f	r1, -2          ; dtoa.c:530
#1:	       sub	r1, 2 -> r0
#2:	       sub	r1, 1 -> r1
	;;
#0:	       ldx	$membu, r0 -> r0 ; dtoa.c:530
#1:	       stm.s	r1, r15, 11     ; dtoa.c:530
	;;
#0:	       cmpeq	r0, r2 -> c1    ; dtoa.c:530
	;;
#0:	if  c1 br @	.BB17_165
	;;
.BB17_166:
#0:	       or	r0.23, 0 -> r0
#1:	       br	.BB17_477
	;;
#0:	       stm.s	r0, r15, 4
	;;
	       nop	0
	;;
.BB17_167:                              ; %bb91.preheader
#0:	       or	r1, 0 -> r0
#1:	       sub	r14, 1 -> r3
	;;
#0:	       add	r0, 1 -> r0
	;;
.BB17_168:                              ; %bb91
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldiu	0 -> r2
#1:	       ldiu	0 -> r1
#2:	       sub	r3, 1 -> r3
	;;
#0:	       ldim	0 -> r2
#1:	       ldim	128 -> r1
	;;
#0:	       ldih	0 -> r2
#1:	       ldih	513 -> r1
	;;
#0:	       stx	r2 -> $f0
#1:	       add	r0, 1 -> r2
	;;
#0:	       stx	r1 -> $f4
	;;
#0:	       fop	fmov	f4 -> f1
	;;
#0:	       fop	dmul	d1, d0 -> d2 ; dtoa.c:519
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       fop	df2si	d2 -> f2 ; dtoa.c:521
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       fop	si2df	f2 -> d0 ; dtoa.c:522
	;;
#0:	       ldx	$f2 -> r1       ; dtoa.c:521
	;;
#0:	       s2add	r1, 12 -> r1    ; dtoa.c:523
	;;
#0:	       fop	dsub	d2, d0 -> d1 ; dtoa.c:522
#1:	       stmb.a	r1, r0, 0       ; dtoa.c:523
#2:	       or	r2, 0 -> r0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz ne	r3, .BB17_168   ; dtoa.c:524
	;;
#0:	       brz eq	r3, .BB17_161   ; dtoa.c:524
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB17_169:                              ; %bb92
#0:	       ldm.s	r15, 32
#1:	       ldi	-1 -> r1
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       ldm.s	r15, 16
#1:	       cmplt	r1, r0 -> c2
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       cmplt	r0, 15 -> c1
	;;
#0:	       comb	and c2, c1 -> c1
	;;
#0:	if !c1 br @	.BB17_183
	;;
.BB17_170:                              ; %bb94
#0:	       ldga	___mprec_tens -> r1 ; dtoa.c:552
#1:	       sl	r0, 3 -> r0     ; dtoa.c:552
	;;
#0:	       add	r1, r0 -> r0    ; dtoa.c:552
	;;
#0:	       ldm.f	r0, 0           ; dtoa.c:552
	;;
#0:	       ldx	$mem, 0 -> r2   ; dtoa.c:552
#1:	       ldm.f	r0, 4           ; dtoa.c:552
	;;
#0:	       ldx	$mem, 0 -> r1   ; dtoa.c:552
#1:	       ldm.s	r15, 12
#2:	       stx	r2 -> $f12      ; dtoa.c:552
	;;
#3:	       cmplt	r3.23, 0 -> c2  ; dtoa.c:553
#0:	       stx	r1 -> $f0       ; dtoa.c:552
	;;
#0:	       ldx	$mem, 0 -> r0
#1:	       fop	fmov	f0 -> f13 ; dtoa.c:552
	;;
#0:	       cmplt	r0, 1 -> c1
	;;
#0:	       comb	and c2, c1 -> c1
	;;
#0:	if  c1 br @	.BB17_174
	;;
.BB17_171:                              ; %bb99.preheader
#0:	       ldm.s	r15, 20
#1:	       ldiu	0 -> r10
#2:	       fop	dzero -> d5
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       br	.BB17_173
#1:	       ldm.s	r15, 12
#2:	       add	r0, 1 -> r11
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       sub	r0, 1 -> r13
	;;
.BB17_172:                              ; %bb109
                                        ;   in Loop: Header=BB17_173 Depth=1
#0:	       s2add	r15, 8 -> r2
#1:	       add	r11, 1 -> r11
#2:	       sub	r13, 1 -> r13
	;;
#0:	       add	r2, 16 -> r0
	;;
#0:	       or	r0, 4 -> r1
#1:	       ldx	$f2 -> r0
	;;
#0:	       stm.a	r0, r15, 12
#1:	       ldx	$f3 -> r0
	;;
#0:	       stm.a	r0, r1, 0
	;;
#0:	       ldm.f	r1, 0
	;;
#0:	       ldx	$mem, 0 -> r12
#1:	       ldm.f	r15, 48
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       stm.s	r0, r15, 6      ; dtoa.c:560
	;;
.BB17_173:                              ; %bb99
                                        ; =>This Inner Loop Header: Depth=1
#0:	       s2add	r15, 8 -> r14
#1:	       ldm.s	r15, 24
#2:	       ldx	$f13 -> r3      ; dtoa.c:562
	;;
#0:	       add	r14, 24 -> r0
	;;
#0:	       or	r0, 4 -> r2
#1:	       ldx	$mem, 0 -> r0
	;;
#0:	       stm.a	r0, r15, 14
	;;
#0:	       stm.a	r12, r2, 0
#1:	       sub	r11, 1 -> r12
	;;
#0:	       ldm.f	r15, 56
	;;
#0:	       ldx	$mem, 0 -> r1
#1:	       ldm.f	r2, 0
#2:	       ldx	$f12 -> r2      ; dtoa.c:562
	;;
#0:	       stx	r1 -> $f14
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       callg	___divdf3       ; dtoa.c:562
#1:	       stx	r0 -> $f0
	;;
#0:	       fop	fmov	f0 -> f15
	;;
#0:	       ldx	$f14 -> r0      ; dtoa.c:562
	;;
#0:	       ldx	$f15 -> r1      ; dtoa.c:562
	;;
#0:	       fop	df2si	d0 -> f6 ; dtoa.c:562
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       fop	si2df	f6 -> d0 ; dtoa.c:563
	;;
#0:	       ldx	$f6 -> r0       ; dtoa.c:562
	;;
#0:	       s2add	r0, 12 -> r0    ; dtoa.c:572
	;;
#0:	       fop	dmul	d0, d6 -> d0 ; dtoa.c:563
#1:	       stmb.a	r0, r12, 0      ; dtoa.c:572
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       fop	dsub	d7, d0 -> d2 ; dtoa.c:563
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz ne	r13, .BB17_181  ; dtoa.c:573
	;;
#0:	       brz eq	r13, .BB17_176
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB17_174:                              ; %bb96
#0:	       ldi	0 -> r0
	;;
#0:	       stm.s	r0, r15, 9      ; dtoa.c:556
	;;
#0:	       ldm.s	r15, 12         ; dtoa.c:556
	;;
#0:	       ldx	$mem, 0 -> r0   ; dtoa.c:556
	;;
#0:	       cmplt	r0, 0 -> c1     ; dtoa.c:556
	;;
#0:	if  c1 br @	.BB17_145
	;;
.BB17_175:                              ; %bb97
#0:	       ldiu	0 -> r0
#1:	       ldiu	0 -> r1
	;;
#0:	       ldim	0 -> r1
#1:	       ldim	640 -> r0
	;;
#0:	       ldih	0 -> r1
#1:	       ldih	512 -> r0
	;;
#0:	       stx	r0 -> $f2
#1:	       ldi	0 -> r0
	;;
#0:	       stx	r1 -> $f0
	;;
#0:	       fop	fmov	f2 -> f1
#1:	       stm.s	r0, r15, 9      ; dtoa.c:556
	;;
#0:	       fop	dmul	d6, d0 -> d0 ; dtoa.c:556
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       fop	dcmp	d5, d0 -> f0 ; dtoa.c:556
#1:	       stm.s	r0, r15, 8
	;;
	       nop	0
	;;
#0:	       br	.BB17_296
	;;
#0:	       ldx	$f0 -> r1       ; dtoa.c:556
	;;
#0:	       btest	r1, 12 -> c1    ; dtoa.c:556
	;;
.BB17_176:                              ; %bb100
#0:	       fop	dadd	d2, d2 -> d1 ; dtoa.c:575
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       fop	dcmp	d1, d6 -> f0 ; dtoa.c:576
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r0       ; dtoa.c:576
	;;
#0:	       btest	r0, 4 -> c1     ; dtoa.c:576
	;;
#0:	if  c1 br @	.BB17_154
	;;
.BB17_177:                              ; %bb101
#0:	       fop	dcmp	d1, d6 -> f0 ; dtoa.c:576
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r0       ; dtoa.c:576
	;;
#0:	       btest	r0, 9 -> c1     ; dtoa.c:576
	;;
#0:	if !c1 br @	.BB17_179
	;;
.BB17_178:
#0:	       stm.s	r11, r15, 11
#1:	       br @	.BB17_477
	;;
.BB17_179:                              ; %bb102
#0:	       ldx	$f6 -> r0       ; dtoa.c:562
	;;
#0:	       btest	r0, 0 -> c1     ; dtoa.c:576
	;;
#0:	if  c1 br @	.BB17_154
	;;
.BB17_180:
#0:	       stm.s	r11, r15, 11
#1:	       br @	.BB17_477
	;;
.BB17_181:                              ; %bb108
                                        ;   in Loop: Header=BB17_173 Depth=1
#0:	       or	r10, 0 -> r1
#1:	       or	r10, 0 -> r0
	;;
#0:	       ldim	0 -> r1
#1:	       ldim	128 -> r0
	;;
#0:	       ldih	0 -> r1
#1:	       ldih	513 -> r0
	;;
#0:	       stx	r1 -> $f0
	;;
#0:	       stx	r0 -> $f2
	;;
#0:	       fop	fmov	f2 -> f1
	;;
#0:	       fop	dmul	d2, d0 -> d1 ; dtoa.c:590
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       fop	dcmp	d1, d5 -> f0 ; dtoa.c:590
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r0       ; dtoa.c:590
	;;
#0:	       btest	r0, 0 -> c1     ; dtoa.c:590
	;;
#0:	if !c1 br @	.BB17_172
	;;
.BB17_182:
#0:	       stm.s	r11, r15, 11
#1:	       br @	.BB17_477
	;;
.BB17_183:                              ; %bb110
#2:	       cmpeq	r2.23, 0 -> c3  ; dtoa.c:599
#0:	       ldm.s	r15, 44
#1:	       or	r1.23, 0 -> r14
#3:	       ldi	0 -> r0
	;;
#0:	if  c3 br	.BB17_222       ; dtoa.c:599
#2:	       ldi	0 -> r2.24
	;;
#0:	       ldx	$mem, 0 -> r13
	;;
#0:	       stm.s	r0, r15, 9      ; dtoa.c:599
	;;
.BB17_184:                              ; %bb111
#0:	       ldm.s	r15, 8          ; dtoa.c:601
#1:	       ldi	1 -> r1
	;;
#0:	       ldx	$mem, 0 -> r0   ; dtoa.c:601
	;;
#0:	       cmplt	r1, r0 -> c1    ; dtoa.c:601
	;;
#0:	if  c1 br @	.BB17_188
	;;
.BB17_185:                              ; %bb112
#0:	       brz eq @	r0.25, .BB17_187 ; dtoa.c:603
	;;
.BB17_186:                              ; %bb113
#0:	       ldm.s	r15, 32         ; dtoa.c:603
#2:	       ldiu	1075 -> r1
#1:	       or	r1.23, 0 -> r14
	;;
#0:	       br	.BB17_194
#1:	       ldx	$mem, 0 -> r0   ; dtoa.c:603
	;;
#0:	       ldm.s	r15, 44
#1:	       add	r0, r1 -> r1    ; dtoa.c:603
	;;
#0:	       ldx	$mem, 0 -> r13
	;;
.BB17_187:                              ; %bb114
#0:	       ldm.s	r15, 28         ; dtoa.c:603
#2:	       br	.BB17_194
#3:	       ldi	54 -> r1
#1:	       or	r1.23, 0 -> r14
	;;
#0:	       ldx	$mem, 0 -> r0   ; dtoa.c:603
	;;
#0:	       sub	r1, r0 -> r1    ; dtoa.c:603
	;;
.BB17_188:                              ; %bb116
#0:	       ldm.s	r15, 12
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       sub	r0, 1 -> r14
	;;
#1:	       cmplt	r1.23, r14 -> c1 ; dtoa.c:616
	;;
#0:	if  c1 br @	.BB17_190
	;;
.BB17_189:                              ; %bb117
#1:	       sub	r1.23, r14 -> r4 ; dtoa.c:617
#0:	       br	.BB17_191
	;;
#1:	       or	r1.23, 0 -> r14
	;;
	       nop	0
	;;
.BB17_190:                              ; %bb118
#1:	       sub	r1.25, r1.23 -> r0
#0:	       ldi	0 -> r4
	;;
#1:	       add	r0, r14 -> r1.25 ; dtoa.c:620
	;;
.BB17_191:                              ; %bb119
#0:	       ldm.s	r15, 12         ; dtoa.c:624
#1:	       ldi	-1 -> r3
	;;
#0:	       ldx	$mem, 0 -> r0   ; dtoa.c:624
	;;
#0:	       ldm.s	r15, 44
#1:	       cmplt	r3, r0 -> c1    ; dtoa.c:624
#2:	       sra	r0, 31 -> r1    ; dtoa.c:624
	;;
#0:	if !c1 br	.BB17_193
#1:	       and	r1, r0 -> r2
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       sub	r1, r2 -> r13
	;;
.BB17_192:
#0:	       ldm.s	r15, 12
#2:	       br	.BB17_194
#1:	       or	r4, 0 -> r1.23
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
	       nop	0
	;;
.BB17_193:                              ; %bb120
#0:	       ldi	0 -> r1
#1:	       or	r4, 0 -> r1.23
	;;
.BB17_194:                              ; %bb121
#0:	       ldmg.d	_impure_data+76 ; mprec.c:103[ mprec.c:323[ dtoa.c:632 ] ]
#1:	       add	r1, r10 -> r10  ; dtoa.c:631
	;;
#0:	       ldx	$mem, 0 -> r11  ; mprec.c:103[ mprec.c:323[ dtoa.c:632 ] ]
#1:	       ldm.s	r15, 44         ; dtoa.c:630
	;;
#0:	       brz ne	r11, .BB17_207  ; mprec.c:103[ mprec.c:323[ dtoa.c:632 ] ]
#1:	       ldx	$mem, 0 -> r0   ; dtoa.c:630
	;;
#0:	       add	r1, r0 -> r0    ; dtoa.c:630
	;;
#0:	       stm.s	r0, r15, 11     ; dtoa.c:631
	;;
.BB17_195:                              ; %bb.i.i31
#0:	       ldi	132 -> r0
#1:	       callg	__malloc_r      ; mallocr.c:3207[ mprec.c:106[ mprec.c:323[ dtoa.c:632 ] ] ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz ne @	r0, .BB17_197   ; mallocr.c:3209[ mprec.c:106[ mprec.c:323[ dtoa.c:632 ] ] ]
	;;
.BB17_196:                              ; %_calloc_r.exit223.thread
#0:	       ldi	0 -> r0
#1:	       br	.BB17_221
	;;
#0:	       stm.s	r0, r15, 9      ; mprec.c:106[ mprec.c:323[ dtoa.c:632 ] ]
#1:	       ldga	_impure_data -> r0 ; mprec.c:106[ mprec.c:323[ dtoa.c:632 ] ]
	;;
#0:	       stm.a	0, r0, 19       ; mprec.c:106[ mprec.c:323[ dtoa.c:632 ] ]
	;;
.BB17_197:                              ; %bb1.i214
#0:	       or	r0, 0 -> r11    ; mallocr.c:3207[ mprec.c:106[ mprec.c:323[ dtoa.c:632 ] ] ]
#1:	       ldi	-4 -> r1
	;;
#0:	       ldm.f	r11, -4         ; mallocr.c:3233[ mprec.c:106[ mprec.c:323[ dtoa.c:632 ] ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:3233[ mprec.c:106[ mprec.c:323[ dtoa.c:632 ] ] ]
	;;
#0:	       sub	r0, 4 -> r0
	;;
#0:	       and	r0, r1 -> r2
#1:	       ldi	36 -> r0
	;;
#0:	       cmpult	r0, r2 -> c1    ; mallocr.c:3244[ mprec.c:106[ mprec.c:323[ dtoa.c:632 ] ] ]
	;;
#0:	if  c1 br @	.BB17_205
	;;
.BB17_198:                              ; %bb2.i215
#0:	       cmpult	r2, 20 -> c1    ; mallocr.c:3244[ mprec.c:106[ mprec.c:323[ dtoa.c:632 ] ] ]
#1:	       or	r11, 0 -> r0
	;;
#0:	if  c1 br @	.BB17_204
	;;
.BB17_199:                              ; %bb3.i216
#0:	       cmpult	r2, 28 -> c1    ; mallocr.c:3244[ mprec.c:106[ mprec.c:323[ dtoa.c:632 ] ] ]
#1:	       stm.a	0, r11, 0       ; mallocr.c:3244[ mprec.c:106[ mprec.c:323[ dtoa.c:632 ] ] ]
	;;
#0:	if !c1 br @	.BB17_201
#1:	       stm.a	0, r11, 1       ; mallocr.c:3244[ mprec.c:106[ mprec.c:323[ dtoa.c:632 ] ] ]
	;;
.BB17_200:
#0:	       add	r11, 8 -> r0
#1:	       br @	.BB17_204
	;;
.BB17_201:                              ; %bb4.i217
#0:	       ldi	36 -> r0
#1:	       stm.a	0, r11, 2       ; mallocr.c:3244[ mprec.c:106[ mprec.c:323[ dtoa.c:632 ] ] ]
	;;
#0:	       cmpult	r2, r0 -> c1    ; mallocr.c:3244[ mprec.c:106[ mprec.c:323[ dtoa.c:632 ] ] ]
#1:	       stm.a	0, r11, 3       ; mallocr.c:3244[ mprec.c:106[ mprec.c:323[ dtoa.c:632 ] ] ]
	;;
#0:	if !c1 br @	.BB17_203
	;;
.BB17_202:
#0:	       add	r11, 16 -> r0
#1:	       br @	.BB17_204
	;;
.BB17_203:                              ; %bb5.i218
#0:	       stm.a	0, r11, 4       ; mallocr.c:3244[ mprec.c:106[ mprec.c:323[ dtoa.c:632 ] ] ]
#1:	       add	r11, 24 -> r0
	;;
#0:	       stm.a	0, r11, 5       ; mallocr.c:3244[ mprec.c:106[ mprec.c:323[ dtoa.c:632 ] ] ]
	;;
.BB17_204:                              ; %bb6.i220
#0:	       stm.a	0, r0, 0        ; mallocr.c:3244[ mprec.c:106[ mprec.c:323[ dtoa.c:632 ] ] ]
#1:	       br	.BB17_206
	;;
#0:	       stm.a	0, r0, 1        ; mallocr.c:3244[ mprec.c:106[ mprec.c:323[ dtoa.c:632 ] ] ]
	;;
#0:	       stm.a	0, r0, 2        ; mallocr.c:3244[ mprec.c:106[ mprec.c:323[ dtoa.c:632 ] ] ]
	;;
.BB17_205:                              ; %bb7.i221
#0:	       ldi	0 -> r1
#1:	       callg	_memset         ; mallocr.c:3244[ mprec.c:106[ mprec.c:323[ dtoa.c:632 ] ] ]
#2:	       or	r11, 0 -> r0    ; mallocr.c:3244[ mprec.c:106[ mprec.c:323[ dtoa.c:632 ] ] ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB17_206:                              ; %_calloc_r.exit223
#0:	       ldga	_impure_data -> r0 ; mprec.c:106[ mprec.c:323[ dtoa.c:632 ] ]
	;;
#0:	       stm.a	r11, r0, 19     ; mprec.c:106[ mprec.c:323[ dtoa.c:632 ] ]
	;;
.BB17_207:                              ; %bb2.i.i32
#0:	       ldm.f	r11, 4          ; mprec.c:115[ mprec.c:323[ dtoa.c:632 ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:115[ mprec.c:323[ dtoa.c:632 ] ]
	;;
#0:	       brz eq @	r0, .BB17_209   ; mprec.c:115[ mprec.c:323[ dtoa.c:632 ] ]
#1:	       stm.s	r0, r15, 9      ; mprec.c:115[ mprec.c:323[ dtoa.c:632 ] ]
	;;
.BB17_208:                              ; %bb3.i.i33
#0:	       ldm.s	r15, 36         ; mprec.c:117[ mprec.c:323[ dtoa.c:632 ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:117[ mprec.c:323[ dtoa.c:632 ] ]
	;;
#0:	       br	.BB17_220
#1:	       ldm.f	r0, 0           ; mprec.c:117[ mprec.c:323[ dtoa.c:632 ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:117[ mprec.c:323[ dtoa.c:632 ] ]
	;;
#0:	       stm.a	r0, r11, 1      ; mprec.c:117[ mprec.c:323[ dtoa.c:632 ] ]
	;;
.BB17_209:                              ; %bb4.i.i34
#0:	       ldi	28 -> r0
#1:	       callg	__malloc_r      ; mallocr.c:3207[ mprec.c:123[ mprec.c:323[ dtoa.c:632 ] ] ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz eq	r0, .BB17_221   ; mallocr.c:3209[ mprec.c:123[ mprec.c:323[ dtoa.c:632 ] ] ]
#1:	       ldi	0 -> r1
	;;
#0:	       stm.s	r1, r15, 9      ; mallocr.c:3209[ mprec.c:123[ mprec.c:323[ dtoa.c:632 ] ] ]
	;;
	       nop	0
	;;
.BB17_210:                              ; %bb1.i39
#0:	       stm.s	r0, r15, 9      ; mallocr.c:3233[ mprec.c:123[ mprec.c:323[ dtoa.c:632 ] ] ]
#1:	       ldi	-4 -> r1
	;;
#0:	       ldm.f	r0, -4          ; mallocr.c:3233[ mprec.c:123[ mprec.c:323[ dtoa.c:632 ] ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:3233[ mprec.c:123[ mprec.c:323[ dtoa.c:632 ] ] ]
	;;
#0:	       sub	r0, 4 -> r0
	;;
#0:	       and	r0, r1 -> r2
#1:	       ldi	36 -> r0
	;;
#0:	       cmpult	r0, r2 -> c1    ; mallocr.c:3244[ mprec.c:123[ mprec.c:323[ dtoa.c:632 ] ] ]
	;;
#0:	if  c1 br @	.BB17_218
	;;
.BB17_211:                              ; %bb2.i40
#0:	       ldm.s	r15, 36
#1:	       cmpult	r2, 20 -> c1    ; mallocr.c:3244[ mprec.c:123[ mprec.c:323[ dtoa.c:632 ] ] ]
	;;
#0:	if  c1 br	.BB17_217
#1:	       ldx	$mem, 0 -> r0
	;;
#0:	       or	r0, 0 -> r1
	;;
	       nop	0
	;;
.BB17_212:                              ; %bb3.i41
#0:	       cmpult	r2, 28 -> c1    ; mallocr.c:3244[ mprec.c:123[ mprec.c:323[ dtoa.c:632 ] ] ]
#1:	       stm.a	0, r0, 0        ; mallocr.c:3244[ mprec.c:123[ mprec.c:323[ dtoa.c:632 ] ] ]
	;;
#0:	if !c1 br @	.BB17_214
#1:	       stm.a	0, r0, 1        ; mallocr.c:3244[ mprec.c:123[ mprec.c:323[ dtoa.c:632 ] ] ]
	;;
.BB17_213:
#0:	       ldm.s	r15, 36
#1:	       br	.BB17_217
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       add	r0, 8 -> r1
	;;
.BB17_214:                              ; %bb4.i42
#0:	       ldi	36 -> r1
#1:	       stm.a	0, r0, 2        ; mallocr.c:3244[ mprec.c:123[ mprec.c:323[ dtoa.c:632 ] ] ]
	;;
#0:	       cmpult	r2, r1 -> c1    ; mallocr.c:3244[ mprec.c:123[ mprec.c:323[ dtoa.c:632 ] ] ]
#1:	       stm.a	0, r0, 3        ; mallocr.c:3244[ mprec.c:123[ mprec.c:323[ dtoa.c:632 ] ] ]
	;;
#0:	if !c1 br @	.BB17_216
	;;
.BB17_215:
#0:	       ldm.s	r15, 36
#1:	       br	.BB17_217
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       add	r0, 16 -> r1
	;;
.BB17_216:                              ; %bb5.i43
#0:	       stm.a	0, r0, 4        ; mallocr.c:3244[ mprec.c:123[ mprec.c:323[ dtoa.c:632 ] ] ]
#1:	       add	r0, 24 -> r1
	;;
#0:	       stm.a	0, r0, 5        ; mallocr.c:3244[ mprec.c:123[ mprec.c:323[ dtoa.c:632 ] ] ]
	;;
.BB17_217:                              ; %bb6.i45
#0:	       stm.a	0, r1, 0        ; mallocr.c:3244[ mprec.c:123[ mprec.c:323[ dtoa.c:632 ] ] ]
#1:	       br	.BB17_219
	;;
#0:	       stm.a	0, r1, 1        ; mallocr.c:3244[ mprec.c:123[ mprec.c:323[ dtoa.c:632 ] ] ]
	;;
#0:	       stm.a	0, r1, 2        ; mallocr.c:3244[ mprec.c:123[ mprec.c:323[ dtoa.c:632 ] ] ]
	;;
.BB17_218:                              ; %bb7.i46
#0:	       ldm.s	r15, 36         ; mallocr.c:3244[ mprec.c:123[ mprec.c:323[ dtoa.c:632 ] ] ]
#1:	       ldi	0 -> r1
	;;
#0:	       callg	_memset         ; mallocr.c:3244[ mprec.c:123[ mprec.c:323[ dtoa.c:632 ] ] ]
#1:	       ldx	$mem, 0 -> r0   ; mallocr.c:3244[ mprec.c:123[ mprec.c:323[ dtoa.c:632 ] ] ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB17_219:                              ; %bb6.i.i35
#0:	       ldm.s	r15, 36         ; mprec.c:128[ mprec.c:323[ dtoa.c:632 ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:128[ mprec.c:323[ dtoa.c:632 ] ]
	;;
#0:	       stm.a	1, r0, 1        ; mprec.c:128[ mprec.c:323[ dtoa.c:632 ] ]
	;;
#0:	       stm.a	2, r0, 2        ; mprec.c:129[ mprec.c:323[ dtoa.c:632 ] ]
	;;
.BB17_220:                              ; %bb7.i.i37
#0:	       ldm.s	r15, 36         ; mprec.c:131[ mprec.c:323[ dtoa.c:632 ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:131[ mprec.c:323[ dtoa.c:632 ] ]
	;;
#0:	       stm.a	0, r0, 4        ; mprec.c:131[ mprec.c:323[ dtoa.c:632 ] ]
	;;
#0:	       stm.a	0, r0, 3        ; mprec.c:131[ mprec.c:323[ dtoa.c:632 ] ]
	;;
.BB17_221:                              ; %__i2b.exit
#0:	       ldm.s	r15, 36         ; mprec.c:324[ dtoa.c:632 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:324[ dtoa.c:632 ]
	;;
#0:	       stm.a	1, r0, 5        ; mprec.c:324[ dtoa.c:632 ]
	;;
#0:	       stm.a	1, r0, 4        ; mprec.c:325[ dtoa.c:632 ]
	;;
.BB17_222:                              ; %bb122
#2:	       cmplt	r2.24, r13 -> c2 ; dtoa.c:634
	;;
#2:	       cmplt	r2.24, r10 -> c1 ; dtoa.c:634
	;;
#0:	       comb	and c2, c1 -> c1
	;;
#0:	if !c1 br @	.BB17_224
	;;
.BB17_223:                              ; %bb124
#0:	       ldm.s	r15, 44         ; dtoa.c:637
#1:	       cmple	r10, r13 -> c1  ; dtoa.c:636
#2:	       or	r13, 0 -> r1    ; dtoa.c:636
	;;
#0:	if  c1 or	r10, 0 -> r1    ; dtoa.c:636
	;;
#0:	       ldx	$mem, 0 -> r0   ; dtoa.c:637
#1:	       sub	r13, r1 -> r13  ; dtoa.c:638
#2:	       sub	r10, r1 -> r10  ; dtoa.c:639
	;;
#0:	       sub	r0, r1 -> r0    ; dtoa.c:637
	;;
#0:	       stm.s	r0, r15, 11     ; dtoa.c:638
	;;
.BB17_224:                              ; %bb125
#0:	       cmplt	r14, 1 -> c1    ; dtoa.c:641
	;;
#0:	if  c1 br @	.BB17_235
	;;
.BB17_225:                              ; %bb126
#2:	       brz eq @	r2.23, .BB17_232 ; dtoa.c:643
	;;
.BB17_226:                              ; %bb127
#1:	       cmplt	r1.23, 1 -> c1  ; dtoa.c:645
	;;
#0:	if !c1 br @	.BB17_228
	;;
.BB17_227:
#0:	       ldm.s	r15, 40
#1:	       br	.BB17_230
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
	       nop	0
	;;
.BB17_228:                              ; %bb128
#0:	       ldm.s	r15, 36         ; dtoa.c:647
#1:	       or	r1.23, 0 -> r1  ; dtoa.c:647
	;;
#0:	       callg	___pow5mult     ; dtoa.c:647
#1:	       ldx	$mem, 0 -> r0   ; dtoa.c:647
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       stm.s	r0, r15, 9      ; dtoa.c:647
	;;
#0:	       ldm.s	r15, 40         ; dtoa.c:648
	;;
#0:	       callg	___multiply     ; dtoa.c:648
#1:	       ldx	$mem, 0 -> r11  ; dtoa.c:648
	;;
#0:	       or	r11, 0 -> r1    ; dtoa.c:648
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz eq @	r11, .BB17_230  ; mprec.c:139[ dtoa.c:649 ]
	;;
.BB17_229:                              ; %bb.i49
#0:	       ldmg.d	_impure_data+76 ; mprec.c:141[ dtoa.c:649 ]
#1:	       or	r11, 0 -> r1    ; mprec.c:141[ dtoa.c:649 ]
	;;
#0:	       ldx	$mem, 0 -> r3   ; mprec.c:141[ dtoa.c:649 ]
#1:	       ldm.f	r1, 4           ; mprec.c:141[ dtoa.c:649 ]
	;;
#0:	       ldx	$mem, 0 -> r2   ; mprec.c:141[ dtoa.c:649 ]
	;;
#0:	       s2add	r3, r2 -> r3    ; mprec.c:141[ dtoa.c:649 ]
	;;
#0:	       ldm.f	r3, 0           ; mprec.c:141[ dtoa.c:649 ]
	;;
#0:	       ldx	$mem, 0 -> r3   ; mprec.c:141[ dtoa.c:649 ]
	;;
#0:	       stm.a	r3, r1, 0       ; mprec.c:141[ dtoa.c:649 ]
	;;
#0:	       ldmg.d	_impure_data+76 ; mprec.c:142[ dtoa.c:649 ]
	;;
#0:	       ldx	$mem, 0 -> r3   ; mprec.c:142[ dtoa.c:649 ]
	;;
#0:	       s2add	r3, r2 -> r2    ; mprec.c:142[ dtoa.c:649 ]
	;;
#0:	       stm.a	r1, r2, 0       ; mprec.c:142[ dtoa.c:649 ]
	;;
.BB17_230:                              ; %bb129
#1:	       cmpeq	r14, r1.23 -> c1
	;;
#0:	if  c1 br @	.BB17_234
	;;
.BB17_231:                              ; %bb130
#1:	       sub	r14, r1.23 -> r1 ; dtoa.c:652
#0:	       br @	.BB17_233
	;;
.BB17_232:                              ; %bb131
#0:	       ldm.s	r15, 40         ; dtoa.c:656
#1:	       or	r14, 0 -> r1    ; dtoa.c:656
	;;
#0:	       ldx	$mem, 0 -> r0   ; dtoa.c:656
	;;
.BB17_233:                              ; %bb131
#0:	       callg	___pow5mult     ; dtoa.c:656
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB17_234:                              ; %bb131
#0:	       stm.s	r0, r15, 10
	;;
.BB17_235:                              ; %bb132
#0:	       ldmg.d	_impure_data+76 ; mprec.c:103[ mprec.c:323[ dtoa.c:658 ] ]
	;;
#0:	       ldx	$mem, 0 -> r11  ; mprec.c:103[ mprec.c:323[ dtoa.c:658 ] ]
	;;
#0:	       brz ne @	r11, .BB17_248  ; mprec.c:103[ mprec.c:323[ dtoa.c:658 ] ]
	;;
.BB17_236:                              ; %bb.i.i52
#0:	       ldi	132 -> r0
#1:	       callg	__malloc_r      ; mallocr.c:3207[ mprec.c:106[ mprec.c:323[ dtoa.c:658 ] ] ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz ne @	r0, .BB17_238   ; mallocr.c:3209[ mprec.c:106[ mprec.c:323[ dtoa.c:658 ] ] ]
	;;
.BB17_237:                              ; %_calloc_r.exit96.thread
#0:	       ldi	0 -> r0
#1:	       br	.BB17_262
	;;
#0:	       stm.s	r0, r15, 8      ; mprec.c:106[ mprec.c:323[ dtoa.c:658 ] ]
#1:	       ldga	_impure_data -> r0 ; mprec.c:106[ mprec.c:323[ dtoa.c:658 ] ]
	;;
#0:	       stm.a	0, r0, 19       ; mprec.c:106[ mprec.c:323[ dtoa.c:658 ] ]
	;;
.BB17_238:                              ; %bb1.i87
#0:	       or	r0, 0 -> r11    ; mallocr.c:3207[ mprec.c:106[ mprec.c:323[ dtoa.c:658 ] ] ]
#1:	       ldi	-4 -> r1
	;;
#0:	       ldm.f	r11, -4         ; mallocr.c:3233[ mprec.c:106[ mprec.c:323[ dtoa.c:658 ] ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:3233[ mprec.c:106[ mprec.c:323[ dtoa.c:658 ] ] ]
	;;
#0:	       sub	r0, 4 -> r0
	;;
#0:	       and	r0, r1 -> r2
#1:	       ldi	36 -> r0
	;;
#0:	       cmpult	r0, r2 -> c1    ; mallocr.c:3244[ mprec.c:106[ mprec.c:323[ dtoa.c:658 ] ] ]
	;;
#0:	if  c1 br @	.BB17_246
	;;
.BB17_239:                              ; %bb2.i88
#0:	       cmpult	r2, 20 -> c1    ; mallocr.c:3244[ mprec.c:106[ mprec.c:323[ dtoa.c:658 ] ] ]
#1:	       or	r11, 0 -> r0
	;;
#0:	if  c1 br @	.BB17_245
	;;
.BB17_240:                              ; %bb3.i89
#0:	       cmpult	r2, 28 -> c1    ; mallocr.c:3244[ mprec.c:106[ mprec.c:323[ dtoa.c:658 ] ] ]
#1:	       stm.a	0, r11, 0       ; mallocr.c:3244[ mprec.c:106[ mprec.c:323[ dtoa.c:658 ] ] ]
	;;
#0:	if !c1 br @	.BB17_242
#1:	       stm.a	0, r11, 1       ; mallocr.c:3244[ mprec.c:106[ mprec.c:323[ dtoa.c:658 ] ] ]
	;;
.BB17_241:
#0:	       add	r11, 8 -> r0
#1:	       br @	.BB17_245
	;;
.BB17_242:                              ; %bb4.i90
#0:	       ldi	36 -> r0
#1:	       stm.a	0, r11, 2       ; mallocr.c:3244[ mprec.c:106[ mprec.c:323[ dtoa.c:658 ] ] ]
	;;
#0:	       cmpult	r2, r0 -> c1    ; mallocr.c:3244[ mprec.c:106[ mprec.c:323[ dtoa.c:658 ] ] ]
#1:	       stm.a	0, r11, 3       ; mallocr.c:3244[ mprec.c:106[ mprec.c:323[ dtoa.c:658 ] ] ]
	;;
#0:	if !c1 br @	.BB17_244
	;;
.BB17_243:
#0:	       add	r11, 16 -> r0
#1:	       br @	.BB17_245
	;;
.BB17_244:                              ; %bb5.i91
#0:	       stm.a	0, r11, 4       ; mallocr.c:3244[ mprec.c:106[ mprec.c:323[ dtoa.c:658 ] ] ]
#1:	       add	r11, 24 -> r0
	;;
#0:	       stm.a	0, r11, 5       ; mallocr.c:3244[ mprec.c:106[ mprec.c:323[ dtoa.c:658 ] ] ]
	;;
.BB17_245:                              ; %bb6.i93
#0:	       stm.a	0, r0, 0        ; mallocr.c:3244[ mprec.c:106[ mprec.c:323[ dtoa.c:658 ] ] ]
#1:	       br	.BB17_247
	;;
#0:	       stm.a	0, r0, 1        ; mallocr.c:3244[ mprec.c:106[ mprec.c:323[ dtoa.c:658 ] ] ]
	;;
#0:	       stm.a	0, r0, 2        ; mallocr.c:3244[ mprec.c:106[ mprec.c:323[ dtoa.c:658 ] ] ]
	;;
.BB17_246:                              ; %bb7.i94
#0:	       ldi	0 -> r1
#1:	       callg	_memset         ; mallocr.c:3244[ mprec.c:106[ mprec.c:323[ dtoa.c:658 ] ] ]
#2:	       or	r11, 0 -> r0    ; mallocr.c:3244[ mprec.c:106[ mprec.c:323[ dtoa.c:658 ] ] ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB17_247:                              ; %_calloc_r.exit96
#0:	       ldga	_impure_data -> r0 ; mprec.c:106[ mprec.c:323[ dtoa.c:658 ] ]
	;;
#0:	       stm.a	r11, r0, 19     ; mprec.c:106[ mprec.c:323[ dtoa.c:658 ] ]
	;;
.BB17_248:                              ; %bb2.i.i53
#0:	       ldm.f	r11, 4          ; mprec.c:115[ mprec.c:323[ dtoa.c:658 ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:115[ mprec.c:323[ dtoa.c:658 ] ]
	;;
#0:	       brz eq @	r0, .BB17_250   ; mprec.c:115[ mprec.c:323[ dtoa.c:658 ] ]
#1:	       stm.s	r0, r15, 8      ; mprec.c:115[ mprec.c:323[ dtoa.c:658 ] ]
	;;
.BB17_249:                              ; %bb3.i.i54
#0:	       ldm.s	r15, 32         ; mprec.c:117[ mprec.c:323[ dtoa.c:658 ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:117[ mprec.c:323[ dtoa.c:658 ] ]
	;;
#0:	       br	.BB17_261
#1:	       ldm.f	r0, 0           ; mprec.c:117[ mprec.c:323[ dtoa.c:658 ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:117[ mprec.c:323[ dtoa.c:658 ] ]
	;;
#0:	       stm.a	r0, r11, 1      ; mprec.c:117[ mprec.c:323[ dtoa.c:658 ] ]
	;;
.BB17_250:                              ; %bb4.i.i55
#0:	       ldi	28 -> r0
#1:	       callg	__malloc_r      ; mallocr.c:3207[ mprec.c:123[ mprec.c:323[ dtoa.c:658 ] ] ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz eq	r0, .BB17_262   ; mallocr.c:3209[ mprec.c:123[ mprec.c:323[ dtoa.c:658 ] ] ]
#1:	       ldi	0 -> r1
	;;
#0:	       stm.s	r1, r15, 8      ; mallocr.c:3209[ mprec.c:123[ mprec.c:323[ dtoa.c:658 ] ] ]
	;;
	       nop	0
	;;
.BB17_251:                              ; %bb1.i61
#0:	       stm.s	r0, r15, 8      ; mallocr.c:3233[ mprec.c:123[ mprec.c:323[ dtoa.c:658 ] ] ]
#1:	       ldi	-4 -> r1
	;;
#0:	       ldm.f	r0, -4          ; mallocr.c:3233[ mprec.c:123[ mprec.c:323[ dtoa.c:658 ] ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:3233[ mprec.c:123[ mprec.c:323[ dtoa.c:658 ] ] ]
	;;
#0:	       sub	r0, 4 -> r0
	;;
#0:	       and	r0, r1 -> r2
#1:	       ldi	36 -> r0
	;;
#0:	       cmpult	r0, r2 -> c1    ; mallocr.c:3244[ mprec.c:123[ mprec.c:323[ dtoa.c:658 ] ] ]
	;;
#0:	if  c1 br @	.BB17_259
	;;
.BB17_252:                              ; %bb2.i62
#0:	       ldm.s	r15, 32
#1:	       cmpult	r2, 20 -> c1    ; mallocr.c:3244[ mprec.c:123[ mprec.c:323[ dtoa.c:658 ] ] ]
	;;
#0:	if  c1 br	.BB17_258
#1:	       ldx	$mem, 0 -> r0
	;;
#0:	       or	r0, 0 -> r1
	;;
	       nop	0
	;;
.BB17_253:                              ; %bb3.i63
#0:	       cmpult	r2, 28 -> c1    ; mallocr.c:3244[ mprec.c:123[ mprec.c:323[ dtoa.c:658 ] ] ]
#1:	       stm.a	0, r0, 0        ; mallocr.c:3244[ mprec.c:123[ mprec.c:323[ dtoa.c:658 ] ] ]
	;;
#0:	if !c1 br @	.BB17_255
#1:	       stm.a	0, r0, 1        ; mallocr.c:3244[ mprec.c:123[ mprec.c:323[ dtoa.c:658 ] ] ]
	;;
.BB17_254:
#0:	       ldm.s	r15, 32
#1:	       br	.BB17_258
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       add	r0, 8 -> r1
	;;
.BB17_255:                              ; %bb4.i64
#0:	       ldi	36 -> r1
#1:	       stm.a	0, r0, 2        ; mallocr.c:3244[ mprec.c:123[ mprec.c:323[ dtoa.c:658 ] ] ]
	;;
#0:	       cmpult	r2, r1 -> c1    ; mallocr.c:3244[ mprec.c:123[ mprec.c:323[ dtoa.c:658 ] ] ]
#1:	       stm.a	0, r0, 3        ; mallocr.c:3244[ mprec.c:123[ mprec.c:323[ dtoa.c:658 ] ] ]
	;;
#0:	if !c1 br @	.BB17_257
	;;
.BB17_256:
#0:	       ldm.s	r15, 32
#1:	       br	.BB17_258
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       add	r0, 16 -> r1
	;;
.BB17_257:                              ; %bb5.i65
#0:	       stm.a	0, r0, 4        ; mallocr.c:3244[ mprec.c:123[ mprec.c:323[ dtoa.c:658 ] ] ]
#1:	       add	r0, 24 -> r1
	;;
#0:	       stm.a	0, r0, 5        ; mallocr.c:3244[ mprec.c:123[ mprec.c:323[ dtoa.c:658 ] ] ]
	;;
.BB17_258:                              ; %bb6.i67
#0:	       stm.a	0, r1, 0        ; mallocr.c:3244[ mprec.c:123[ mprec.c:323[ dtoa.c:658 ] ] ]
#1:	       br	.BB17_260
	;;
#0:	       stm.a	0, r1, 1        ; mallocr.c:3244[ mprec.c:123[ mprec.c:323[ dtoa.c:658 ] ] ]
	;;
#0:	       stm.a	0, r1, 2        ; mallocr.c:3244[ mprec.c:123[ mprec.c:323[ dtoa.c:658 ] ] ]
	;;
.BB17_259:                              ; %bb7.i68
#0:	       ldm.s	r15, 32         ; mallocr.c:3244[ mprec.c:123[ mprec.c:323[ dtoa.c:658 ] ] ]
#1:	       ldi	0 -> r1
	;;
#0:	       callg	_memset         ; mallocr.c:3244[ mprec.c:123[ mprec.c:323[ dtoa.c:658 ] ] ]
#1:	       ldx	$mem, 0 -> r0   ; mallocr.c:3244[ mprec.c:123[ mprec.c:323[ dtoa.c:658 ] ] ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB17_260:                              ; %bb6.i.i56
#0:	       ldm.s	r15, 32         ; mprec.c:128[ mprec.c:323[ dtoa.c:658 ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:128[ mprec.c:323[ dtoa.c:658 ] ]
	;;
#0:	       stm.a	1, r0, 1        ; mprec.c:128[ mprec.c:323[ dtoa.c:658 ] ]
	;;
#0:	       stm.a	2, r0, 2        ; mprec.c:129[ mprec.c:323[ dtoa.c:658 ] ]
	;;
.BB17_261:                              ; %bb7.i.i58
#0:	       ldm.s	r15, 32         ; mprec.c:131[ mprec.c:323[ dtoa.c:658 ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:131[ mprec.c:323[ dtoa.c:658 ] ]
	;;
#0:	       stm.a	0, r0, 4        ; mprec.c:131[ mprec.c:323[ dtoa.c:658 ] ]
	;;
#0:	       stm.a	0, r0, 3        ; mprec.c:131[ mprec.c:323[ dtoa.c:658 ] ]
	;;
.BB17_262:                              ; %__i2b.exit60
#0:	       ldm.s	r15, 32         ; mprec.c:324[ dtoa.c:658 ]
#1:	       cmplt	r1.25, 1 -> c1  ; dtoa.c:659
	;;
#0:	if  c1 br	.BB17_264
#1:	       ldx	$mem, 0 -> r0   ; mprec.c:324[ dtoa.c:658 ]
	;;
#0:	       stm.a	1, r0, 5        ; mprec.c:324[ dtoa.c:658 ]
	;;
#0:	       stm.a	1, r0, 4        ; mprec.c:325[ dtoa.c:658 ]
	;;
.BB17_263:                              ; %bb133
#1:	       or	r1.25, 0 -> r1  ; dtoa.c:660
#0:	       callg	___pow5mult     ; dtoa.c:660
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       stm.s	r0, r15, 8
	;;
.BB17_264:                              ; %bb134
#0:	       ldm.s	r15, 8
#1:	       ldi	1 -> r1
#2:	       ldi	0 -> r11
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       ldm.s	r15, 24
#1:	       cmplt	r1, r0 -> c2
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       cmpne	r0, 0 -> c1
	;;
#0:	       comb	or c2, c1 -> c1
	;;
#0:	if  c1 br @	.BB17_266
	;;
.BB17_265:                              ; %bb136
#0:	       ldiu	2047 -> r0
#1:	       ldi	0 -> r11
	;;
#0:	       ldim	511 -> r0
	;;
#0:	       and	r12, r0 -> r2
#2:	       or	r2.26, r2.25 -> r0
	;;
#0:	       cmpne	r2, 0 -> c2
#1:	       cmpeq	r0, 0 -> c1
	;;
#0:	       comb	or c2, c1 -> c1
	;;
#0:	if !c1 ldm.s	r15, 44         ; dtoa.c:674
#1:	if !c1 add	r10, 1 -> r10   ; dtoa.c:675
#2:	if !c1 ldi	1 -> r11
	;;
#0:	if !c1 ldx	$mem, 0 -> r0   ; dtoa.c:674
	;;
#0:	if !c1 add	r0, 1 -> r0     ; dtoa.c:674
	;;
#0:	if !c1 stm.s	r0, r15, 11     ; dtoa.c:675
	;;
.BB17_266:                              ; %bb139
#1:	       brz eq @	r1.25, .BB17_271 ; dtoa.c:689
	;;
.BB17_267:                              ; %bb140
#0:	       ldm.s	r15, 32         ; dtoa.c:689
#1:	       ldga	65536 -> r1
	;;
#0:	       ldx	$mem, 0 -> r0   ; dtoa.c:689
	;;
#0:	       ldm.f	r0, 16          ; dtoa.c:689
	;;
#0:	       ldx	$mem, 0 -> r2   ; dtoa.c:689
	;;
#0:	       s2add	r0, r2 -> r0
	;;
#0:	       ldm.f	r0, 16          ; dtoa.c:689
#1:	       ldga	0 -> r0
	;;
#0:	       ldih	8 -> r0
	;;
#0:	       ldx	$mem, 0 -> r3   ; dtoa.c:689
	;;
#0:	       cmpult	r3, r1 -> c2
#1:	       ldga	0 -> r1
	;;
#0:	if  c2 sl	r3, 16 -> r3
#1:	       ldih	128 -> r1
	;;
#0:	       cmpult	r3, r0 -> c1
#1:	       ldx	$c2 -> r0
	;;
#0:	if  c1 sl	r3, 8 -> r3
#1:	       sl	r0, 4 -> r2
#2:	       ldga	0 -> r0
	;;
#0:	       cmpult	r3, r1 -> c2
#1:	       ldih	512 -> r0
#2:	if  c1 or	r2, 8 -> r2
	;;
#0:	if  c2 sl	r3, 4 -> r3
#1:	if  c2 or	r2, 4 -> r2
	;;
#0:	       cmpult	r3, r0 -> c1
	;;
#0:	if  c1 sl	r3, 2 -> r3
#1:	if  c1 or	r2, 2 -> r2
	;;
#0:	       cmplt	r3, 0 -> c1     ; mprec.c:259[ dtoa.c:689 ]
	;;
#0:	if !c1 br @	.BB17_269
	;;
.BB17_268:
#0:	       or	r2, 0 -> r0
#1:	       br @	.BB17_270
	;;
.BB17_269:                              ; %bb8.i72
#0:	       btest	r3, 30 -> c1
#1:	       ldi	32 -> r0
	;;
#0:	if  c1 add	r2, 1 -> r0
	;;
.BB17_270:                              ; %__hi0bits.exit
#0:	       ldi	32 -> r1
	;;
#0:	       sub	r1, r0 -> r1    ; dtoa.c:689
	;;
.BB17_271:                              ; %bb142
#0:	       add	r1, r10 -> r2   ; dtoa.c:689
#1:	       ldi	32 -> r0
	;;
#0:	       and	r2, 31 -> r1    ; dtoa.c:689
	;;
#0:	       cmpeq	r1, 0 -> c1     ; dtoa.c:689
#1:	       sub	r0, r1 -> r1    ; dtoa.c:690
	;;
#0:	if  c1 and	r2, 31 -> r1
	;;
#0:	       cmpult	r1, 5 -> c1     ; dtoa.c:695
	;;
#0:	if  c1 br @	.BB17_273
	;;
.BB17_272:                              ; %bb145
#0:	       sub	r1, 4 -> r2
#1:	       br @	.BB17_276
	;;
.BB17_273:                              ; %bb146
#0:	       ldi	3 -> r0
	;;
#0:	       cmpult	r0, r1 -> c1    ; dtoa.c:702
	;;
#0:	if !c1 br @	.BB17_275
	;;
.BB17_274:
#0:	       ldm.s	r15, 44
#1:	       br	.BB17_277
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
	       nop	0
	;;
.BB17_275:                              ; %bb147
#0:	       add	r1, 28 -> r2    ; dtoa.c:704
	;;
.BB17_276:                              ; %bb147
#0:	       ldm.s	r15, 44         ; dtoa.c:705
#1:	       add	r2, r13 -> r13  ; dtoa.c:706
#2:	       add	r2, r10 -> r10  ; dtoa.c:707
	;;
#0:	       ldx	$mem, 0 -> r0   ; dtoa.c:705
	;;
#0:	       add	r2, r0 -> r1    ; dtoa.c:705
	;;
.BB17_277:                              ; %bb148
#0:	       cmplt	r1, 1 -> c1     ; dtoa.c:709
	;;
#0:	if  c1 br @	.BB17_279
	;;
.BB17_278:                              ; %bb149
#0:	       ldm.s	r15, 40         ; dtoa.c:710
	;;
#0:	       callg	___lshift       ; dtoa.c:710
#1:	       ldx	$mem, 0 -> r0   ; dtoa.c:710
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       stm.s	r0, r15, 10
	;;
.BB17_279:                              ; %bb150
#0:	       cmplt	r10, 1 -> c1    ; dtoa.c:711
	;;
#0:	if  c1 br @	.BB17_281
	;;
.BB17_280:                              ; %bb151
#0:	       ldm.s	r15, 32         ; dtoa.c:712
#1:	       or	r10, 0 -> r1    ; dtoa.c:712
	;;
#0:	       callg	___lshift       ; dtoa.c:712
#1:	       ldx	$mem, 0 -> r0   ; dtoa.c:712
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       stm.s	r0, r15, 8
	;;
.BB17_281:                              ; %bb152
#1:	       brz eq @	r1.26, .BB17_291 ; dtoa.c:713
	;;
.BB17_282:                              ; %bb153
#0:	       ldm.s	r15, 40         ; mprec.c:527[ dtoa.c:715 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:527[ dtoa.c:715 ]
	;;
#0:	       ldm.f	r0, 16          ; mprec.c:527[ dtoa.c:715 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; mprec.c:527[ dtoa.c:715 ]
#1:	       ldm.s	r15, 32         ; mprec.c:528[ dtoa.c:715 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:528[ dtoa.c:715 ]
	;;
#0:	       ldm.f	r0, 16          ; mprec.c:528[ dtoa.c:715 ]
	;;
#0:	       ldx	$mem, 0 -> r3   ; mprec.c:528[ dtoa.c:715 ]
	;;
#0:	       cmpeq	r1, r3 -> c1
	;;
#0:	if  c1 br @	.BB17_286
	;;
.BB17_283:                              ; %bb.i74
#0:	       sub	r1, r3 -> r1    ; mprec.c:535[ dtoa.c:715 ]
	;;
.BB17_284:                              ; %__mcmp.exit86
#0:	       ldi	-1 -> r0
	;;
#0:	       cmplt	r0, r1 -> c1    ; dtoa.c:715
	;;
#0:	if  c1 br @	.BB17_291
	;;
.BB17_285:                              ; %bb154
#0:	       ldm.s	r15, 16
#1:	       ldi	10 -> r1
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       sub	r0, 1 -> r0
	;;
#0:	       stm.s	r0, r15, 4      ; dtoa.c:718
	;;
#0:	       ldm.s	r15, 40         ; dtoa.c:718
	;;
#0:	       callg	___multadd      ; dtoa.c:718
#1:	       ldx	$mem, 0 -> r0   ; dtoa.c:718
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#2:	       brz ne	r2.23, .BB17_290
#0:	       stm.s	r0, r15, 10     ; dtoa.c:718
#1:	       or	r1.24, 0 -> r0
	;;
#2:	       brz eq	r2.23, .BB17_291 ; dtoa.c:719
#0:	       stm.s	r0, r15, 3      ; dtoa.c:719
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB17_286:                              ; %bb1.i75
#0:	       ldm.s	r15, 40
#1:	       s2add	r0, r3 -> r0
	;;
#0:	       add	r0, 16 -> r0
	;;
#0:	       br	.BB17_288
#1:	       ldx	$mem, 0 -> r1
	;;
#0:	       s2add	r1, r3 -> r2
#1:	       add	r1, 20 -> r4
	;;
#0:	       add	r2, 20 -> r3
	;;
.BB17_287:                              ; %bb7.i84
                                        ;   in Loop: Header=BB17_288 Depth=1
#0:	       sub	r3, 4 -> r3
#1:	       sub	r0, 4 -> r0
	;;
#0:	       cmpult	r4, r3 -> c1    ; mprec.c:545[ dtoa.c:715 ]
	;;
#0:	if !c1 br @	.BB17_291
	;;
.BB17_288:                              ; %bb2.i80
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r3, -4          ; mprec.c:543[ dtoa.c:715 ]
	;;
#0:	       ldx	$mem, 0 -> r2   ; mprec.c:543[ dtoa.c:715 ]
#1:	       ldm.f	r0, 0           ; mprec.c:543[ dtoa.c:715 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; mprec.c:543[ dtoa.c:715 ]
	;;
#0:	       cmpeq	r2, r1 -> c1    ; mprec.c:543[ dtoa.c:715 ]
	;;
#0:	if  c1 br @	.BB17_287
	;;
.BB17_289:                              ; %bb3.i82
#0:	       cmpult	r2, r1 -> c1    ; mprec.c:544[ dtoa.c:715 ]
#1:	       br	.BB17_284
#2:	       ldi	-1 -> r0
#3:	       ldi	1 -> r1
	;;
#0:	if  c1 or	r0, 0 -> r1
	;;
	       nop	0
	;;
.BB17_290:                              ; %bb155
#0:	       ldm.s	r15, 36         ; dtoa.c:720
#1:	       ldi	10 -> r1
	;;
#0:	       callg	___multadd      ; dtoa.c:720
#1:	       ldx	$mem, 0 -> r0   ; dtoa.c:720
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#1:	       or	r1.24, 0 -> r1
	;;
#0:	       stm.s	r1, r15, 3
	;;
#0:	       stm.s	r0, r15, 9
	;;
.BB17_291:                              ; %bb157
#0:	       ldm.s	r15, 12
#1:	       ldi	2 -> r1
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       ldm.s	r15, 8          ; dtoa.c:724
#1:	       cmplt	r0, 1 -> c2
	;;
#0:	       ldx	$mem, 0 -> r0   ; dtoa.c:724
	;;
#0:	       cmplt	r1, r0 -> c1    ; dtoa.c:724
	;;
#0:	       comb	and c2, c1 -> c1
	;;
#0:	if !c1 br @	.BB17_302
	;;
.BB17_292:                              ; %bb159
#0:	       ldm.s	r15, 12         ; dtoa.c:726
	;;
#0:	       ldx	$mem, 0 -> r0   ; dtoa.c:726
	;;
#0:	       cmplt	r0, 0 -> c1     ; dtoa.c:726
	;;
#0:	if  c1 br @	.BB17_300
	;;
.BB17_293:                              ; %bb160
#0:	       ldm.s	r15, 32         ; dtoa.c:726
#1:	       ldi	5 -> r1
	;;
#0:	       callg	___multadd      ; dtoa.c:726
#1:	       ldx	$mem, 0 -> r0   ; dtoa.c:726
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldm.s	r15, 40         ; mprec.c:527[ dtoa.c:726 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; mprec.c:527[ dtoa.c:726 ]
	;;
#0:	       ldm.f	r1, 16          ; mprec.c:527[ dtoa.c:726 ]
	;;
#0:	       ldx	$mem, 0 -> r2   ; mprec.c:527[ dtoa.c:726 ]
#1:	       ldm.f	r0, 16          ; mprec.c:528[ dtoa.c:726 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; mprec.c:528[ dtoa.c:726 ]
#1:	       stm.s	r0, r15, 8      ; dtoa.c:726
	;;
#0:	       cmpeq	r2, r1 -> c1
	;;
#0:	if  c1 br @	.BB17_297
	;;
.BB17_294:                              ; %bb.i97
#0:	       sub	r2, r1 -> r1    ; mprec.c:535[ dtoa.c:726 ]
	;;
.BB17_295:                              ; %__mcmp.exit109
#0:	       ldi	0 -> r0
#1:	       ldm.s	r15, 32
	;;
#0:	       cmplt	r0, r1 -> c1    ; dtoa.c:726
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
.BB17_296:                              ; %__mcmp.exit109
#0:	       or	r0, 0 -> r2
#1:	if !c1 br @	.BB17_300
#2:	if  c1 br @	.BB17_143
	;;
.BB17_297:                              ; %bb1.i98
#0:	       ldm.s	r15, 40
#1:	       sl	r1, 2 -> r3
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       add	r0, 20 -> r2
	;;
.BB17_298:                              ; %bb2.i103
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.s	r15, 40
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       ldm.s	r15, 32
#1:	       add	r0, r3 -> r1
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       ldm.f	r1, 16          ; mprec.c:543[ dtoa.c:726 ]
#1:	       add	r0, r3 -> r0
	;;
#0:	       ldx	$mem, 0 -> r1   ; mprec.c:543[ dtoa.c:726 ]
#1:	       ldm.f	r0, 16          ; mprec.c:543[ dtoa.c:726 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:543[ dtoa.c:726 ]
	;;
#0:	       cmpeq	r1, r0 -> c1    ; mprec.c:543[ dtoa.c:726 ]
	;;
#0:	if !c1 br @	.BB17_301
	;;
.BB17_299:                              ; %bb7.i107
                                        ;   in Loop: Header=BB17_298 Depth=1
#0:	       sub	r3, 4 -> r3
	;;
#0:	       add	r2, r3 -> r0
	;;
#0:	       cmpult	r2, r0 -> c1    ; mprec.c:545[ dtoa.c:726 ]
	;;
#0:	if  c1 br @	.BB17_298
	;;
.BB17_300:                              ; %no_digits
#3:	       xor	r3.23, -1 -> r0 ; dtoa.c:730
	;;
#0:	       stm.s	r0, r15, 4
#1:	       ldi	0 -> r0
	;;
#0:	       stm.s	r0, r15, 7
	;;
#0:	       br	.BB17_426
#1:	       ldm.s	r15, 20
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       stm.s	r0, r15, 11
	;;
.BB17_301:                              ; %bb3.i105
#0:	       cmpult	r1, r0 -> c1    ; mprec.c:544[ dtoa.c:726 ]
#1:	       br	.BB17_295
#2:	       ldi	-1 -> r0
#3:	       ldi	1 -> r1
	;;
#0:	if  c1 or	r0, 0 -> r1
	;;
	       nop	0
	;;
.BB17_302:                              ; %bb161
#2:	       brz ne @	r2.23, .BB17_305 ; dtoa.c:738
	;;
.BB17_303:                              ; %bb197.preheader
#0:	       ldm.s	r15, 40         ; dtoa.c:820
	;;
#0:	       ldx	$mem, 0 -> r0   ; dtoa.c:820
	;;
#0:	       ldm.s	r15, 32         ; dtoa.c:820
	;;
#0:	       callg	_quorem         ; dtoa.c:820
#1:	       ldx	$mem, 0 -> r1   ; dtoa.c:820
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       s2add	r0, 12 -> r0    ; dtoa.c:820
#1:	       ldi	1 -> r1
	;;
#0:	       stm.s	r0, r15, 6
	;;
#0:	       ldm.s	r15, 20         ; dtoa.c:820
	;;
#0:	       ldx	$mem, 0 -> r2   ; dtoa.c:820
	;;
#0:	       stmb.a	r0, r2, 0       ; dtoa.c:820
	;;
#0:	       ldm.s	r15, 12         ; dtoa.c:821
	;;
#0:	       ldx	$mem, 0 -> r0   ; dtoa.c:821
	;;
#0:	       cmplt	r1, r0 -> c1    ; dtoa.c:821
	;;
#0:	if  c1 br @	.BB17_455
	;;
.BB17_304:
#0:	       ldi	0 -> r0
	;;
#0:	       stm.s	r0, r15, 7      ; dtoa.c:820
	;;
#0:	       br	.BB17_458
#1:	       ldm.s	r15, 20         ; dtoa.c:820
	;;
#0:	       ldx	$mem, 0 -> r0   ; dtoa.c:820
	;;
#0:	       add	r0, 1 -> r0     ; dtoa.c:820
	;;
.BB17_305:                              ; %bb162
#0:	       cmplt	r13, 1 -> c1    ; dtoa.c:740
	;;
#0:	if !c1 br @	.BB17_307
	;;
.BB17_306:
#0:	       ldm.s	r15, 36
#1:	       br	.BB17_308
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
	       nop	0
	;;
.BB17_307:                              ; %bb163
#0:	       ldm.s	r15, 36         ; dtoa.c:741
#1:	       or	r13, 0 -> r1    ; dtoa.c:741
	;;
#0:	       callg	___lshift       ; dtoa.c:741
#1:	       ldx	$mem, 0 -> r0   ; dtoa.c:741
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB17_308:                              ; %bb163
#0:	       stm.s	r0, r15, 7
#1:	       cmpeq	r11, 0 -> c3    ; dtoa.c:748
	;;
#0:	if  c3 br	.BB17_337       ; dtoa.c:748
#1:	       ldm.s	r15, 28
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
	       nop	0
	;;
.BB17_309:                              ; %bb165
#0:	       ldmg.d	_impure_data+76 ; mprec.c:103[ dtoa.c:750 ]
	;;
#0:	       ldx	$mem, 0 -> r10  ; mprec.c:103[ dtoa.c:750 ]
#1:	       ldm.f	r0, 4           ; dtoa.c:750
	;;
#0:	       brz ne @	r10, .BB17_322  ; mprec.c:103[ dtoa.c:750 ]
#1:	       ldx	$mem, 0 -> r11  ; dtoa.c:750
	;;
.BB17_310:                              ; %bb.i110
#0:	       ldi	132 -> r0
#1:	       callg	__malloc_r      ; mallocr.c:3207[ mprec.c:106[ dtoa.c:750 ] ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz ne @	r0, .BB17_312   ; mallocr.c:3209[ mprec.c:106[ dtoa.c:750 ] ]
	;;
.BB17_311:                              ; %_calloc_r.exit233.thread
#0:	       ldga	_impure_data -> r0 ; mprec.c:106[ dtoa.c:750 ]
#1:	       br	.BB17_336
#2:	       ldi	0 -> r12
	;;
#0:	       stm.a	0, r0, 19       ; mprec.c:106[ dtoa.c:750 ]
	;;
	       nop	0
	;;
.BB17_312:                              ; %bb1.i224
#0:	       or	r0, 0 -> r10    ; mallocr.c:3207[ mprec.c:106[ dtoa.c:750 ] ]
#1:	       ldi	-4 -> r1
	;;
#0:	       ldm.f	r10, -4         ; mallocr.c:3233[ mprec.c:106[ dtoa.c:750 ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:3233[ mprec.c:106[ dtoa.c:750 ] ]
	;;
#0:	       sub	r0, 4 -> r0
	;;
#0:	       and	r0, r1 -> r2
#1:	       ldi	36 -> r0
	;;
#0:	       cmpult	r0, r2 -> c1    ; mallocr.c:3244[ mprec.c:106[ dtoa.c:750 ] ]
	;;
#0:	if  c1 br @	.BB17_320
	;;
.BB17_313:                              ; %bb2.i225
#0:	       cmpult	r2, 20 -> c1    ; mallocr.c:3244[ mprec.c:106[ dtoa.c:750 ] ]
#1:	       or	r10, 0 -> r0
	;;
#0:	if  c1 br @	.BB17_319
	;;
.BB17_314:                              ; %bb3.i226
#0:	       cmpult	r2, 28 -> c1    ; mallocr.c:3244[ mprec.c:106[ dtoa.c:750 ] ]
#1:	       stm.a	0, r10, 0       ; mallocr.c:3244[ mprec.c:106[ dtoa.c:750 ] ]
	;;
#0:	if !c1 br @	.BB17_316
#1:	       stm.a	0, r10, 1       ; mallocr.c:3244[ mprec.c:106[ dtoa.c:750 ] ]
	;;
.BB17_315:
#0:	       add	r10, 8 -> r0
#1:	       br @	.BB17_319
	;;
.BB17_316:                              ; %bb4.i227
#0:	       ldi	36 -> r0
#1:	       stm.a	0, r10, 2       ; mallocr.c:3244[ mprec.c:106[ dtoa.c:750 ] ]
	;;
#0:	       cmpult	r2, r0 -> c1    ; mallocr.c:3244[ mprec.c:106[ dtoa.c:750 ] ]
#1:	       stm.a	0, r10, 3       ; mallocr.c:3244[ mprec.c:106[ dtoa.c:750 ] ]
	;;
#0:	if !c1 br @	.BB17_318
	;;
.BB17_317:
#0:	       add	r10, 16 -> r0
#1:	       br @	.BB17_319
	;;
.BB17_318:                              ; %bb5.i228
#0:	       stm.a	0, r10, 4       ; mallocr.c:3244[ mprec.c:106[ dtoa.c:750 ] ]
#1:	       add	r10, 24 -> r0
	;;
#0:	       stm.a	0, r10, 5       ; mallocr.c:3244[ mprec.c:106[ dtoa.c:750 ] ]
	;;
.BB17_319:                              ; %bb6.i230
#0:	       stm.a	0, r0, 0        ; mallocr.c:3244[ mprec.c:106[ dtoa.c:750 ] ]
#1:	       br	.BB17_321
	;;
#0:	       stm.a	0, r0, 1        ; mallocr.c:3244[ mprec.c:106[ dtoa.c:750 ] ]
	;;
#0:	       stm.a	0, r0, 2        ; mallocr.c:3244[ mprec.c:106[ dtoa.c:750 ] ]
	;;
.BB17_320:                              ; %bb7.i231
#0:	       ldi	0 -> r1
#1:	       callg	_memset         ; mallocr.c:3244[ mprec.c:106[ dtoa.c:750 ] ]
#2:	       or	r10, 0 -> r0    ; mallocr.c:3244[ mprec.c:106[ dtoa.c:750 ] ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB17_321:                              ; %_calloc_r.exit233
#0:	       ldga	_impure_data -> r0 ; mprec.c:106[ dtoa.c:750 ]
	;;
#0:	       stm.a	r10, r0, 19     ; mprec.c:106[ dtoa.c:750 ]
	;;
.BB17_322:                              ; %bb2.i111
#0:	       s2add	r10, r11 -> r1  ; mprec.c:115[ dtoa.c:750 ]
	;;
#0:	       ldm.f	r1, 0           ; mprec.c:115[ dtoa.c:750 ]
	;;
#0:	       ldx	$mem, 0 -> r12  ; mprec.c:115[ dtoa.c:750 ]
	;;
#0:	       brz eq @	r12, .BB17_324  ; mprec.c:115[ dtoa.c:750 ]
	;;
.BB17_323:                              ; %bb3.i112
#0:	       ldm.f	r12, 0          ; mprec.c:117[ dtoa.c:750 ]
#1:	       br	.BB17_335
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:117[ dtoa.c:750 ]
	;;
#0:	       stm.a	r0, r1, 0       ; mprec.c:117[ dtoa.c:750 ]
	;;
.BB17_324:                              ; %bb4.i113
#0:	       ldi	1 -> r0
#1:	       callg	__malloc_r      ; mallocr.c:3207[ mprec.c:123[ dtoa.c:750 ] ]
	;;
#0:	       sl	r0, r11 -> r10  ; mprec.c:121[ dtoa.c:750 ]
#1:	       ldi	20 -> r0
	;;
#0:	       s2add	r0, r10 -> r0   ; mprec.c:123[ dtoa.c:750 ]
	;;
	       nop	0
	;;
#0:	       brz eq @	r0, .BB17_336   ; mallocr.c:3209[ mprec.c:123[ dtoa.c:750 ] ]
#1:	       ldi	0 -> r12
	;;
.BB17_325:                              ; %bb1.i119
#0:	       or	r0, 0 -> r12    ; mallocr.c:3207[ mprec.c:123[ dtoa.c:750 ] ]
#1:	       ldi	-4 -> r1
	;;
#0:	       ldm.f	r12, -4         ; mallocr.c:3233[ mprec.c:123[ dtoa.c:750 ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:3233[ mprec.c:123[ dtoa.c:750 ] ]
	;;
#0:	       sub	r0, 4 -> r0
	;;
#0:	       and	r0, r1 -> r2
#1:	       ldi	36 -> r0
	;;
#0:	       cmpult	r0, r2 -> c1    ; mallocr.c:3244[ mprec.c:123[ dtoa.c:750 ] ]
	;;
#0:	if  c1 br @	.BB17_333
	;;
.BB17_326:                              ; %bb2.i120
#0:	       cmpult	r2, 20 -> c1    ; mallocr.c:3244[ mprec.c:123[ dtoa.c:750 ] ]
#1:	       or	r12, 0 -> r0
	;;
#0:	if  c1 br @	.BB17_332
	;;
.BB17_327:                              ; %bb3.i121
#0:	       cmpult	r2, 28 -> c1    ; mallocr.c:3244[ mprec.c:123[ dtoa.c:750 ] ]
#1:	       stm.a	0, r12, 0       ; mallocr.c:3244[ mprec.c:123[ dtoa.c:750 ] ]
	;;
#0:	if !c1 br @	.BB17_329
#1:	       stm.a	0, r12, 1       ; mallocr.c:3244[ mprec.c:123[ dtoa.c:750 ] ]
	;;
.BB17_328:
#0:	       add	r12, 8 -> r0
#1:	       br @	.BB17_332
	;;
.BB17_329:                              ; %bb4.i122
#0:	       ldi	36 -> r0
#1:	       stm.a	0, r12, 2       ; mallocr.c:3244[ mprec.c:123[ dtoa.c:750 ] ]
	;;
#0:	       cmpult	r2, r0 -> c1    ; mallocr.c:3244[ mprec.c:123[ dtoa.c:750 ] ]
#1:	       stm.a	0, r12, 3       ; mallocr.c:3244[ mprec.c:123[ dtoa.c:750 ] ]
	;;
#0:	if !c1 br @	.BB17_331
	;;
.BB17_330:
#0:	       add	r12, 16 -> r0
#1:	       br @	.BB17_332
	;;
.BB17_331:                              ; %bb5.i123
#0:	       stm.a	0, r12, 4       ; mallocr.c:3244[ mprec.c:123[ dtoa.c:750 ] ]
#1:	       add	r12, 24 -> r0
	;;
#0:	       stm.a	0, r12, 5       ; mallocr.c:3244[ mprec.c:123[ dtoa.c:750 ] ]
	;;
.BB17_332:                              ; %bb6.i125
#0:	       stm.a	0, r0, 0        ; mallocr.c:3244[ mprec.c:123[ dtoa.c:750 ] ]
#1:	       br	.BB17_334
	;;
#0:	       stm.a	0, r0, 1        ; mallocr.c:3244[ mprec.c:123[ dtoa.c:750 ] ]
	;;
#0:	       stm.a	0, r0, 2        ; mallocr.c:3244[ mprec.c:123[ dtoa.c:750 ] ]
	;;
.BB17_333:                              ; %bb7.i126
#0:	       ldi	0 -> r1
#1:	       callg	_memset         ; mallocr.c:3244[ mprec.c:123[ dtoa.c:750 ] ]
#2:	       or	r12, 0 -> r0    ; mallocr.c:3244[ mprec.c:123[ dtoa.c:750 ] ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB17_334:                              ; %bb6.i114
#0:	       stm.a	r11, r12, 1     ; mprec.c:128[ dtoa.c:750 ]
	;;
#0:	       stm.a	r10, r12, 2     ; mprec.c:129[ dtoa.c:750 ]
	;;
.BB17_335:                              ; %bb7.i116
#0:	       stm.a	0, r12, 4       ; mprec.c:131[ dtoa.c:750 ]
	;;
#0:	       stm.a	0, r12, 3       ; mprec.c:131[ dtoa.c:750 ]
	;;
.BB17_336:                              ; %_Balloc.exit118
#0:	       ldm.s	r15, 28         ; dtoa.c:751
#1:	       ldi	8 -> r2
#2:	       add	r12, 12 -> r0   ; dtoa.c:751
	;;
#0:	       ldx	$mem, 0 -> r1   ; dtoa.c:751
	;;
#0:	       ldm.f	r1, 16          ; dtoa.c:751
#1:	       add	r1, 12 -> r1    ; dtoa.c:751
	;;
#0:	       callg	_memcpy         ; dtoa.c:751
#1:	       ldx	$mem, 0 -> r3   ; dtoa.c:751
	;;
#0:	       s2add	r2, r3 -> r2    ; dtoa.c:751
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       callg	___lshift       ; dtoa.c:752
#1:	       ldi	1 -> r1
#2:	       or	r12, 0 -> r0    ; dtoa.c:752
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB17_337:                              ; %bb167.preheader
#0:	       ldm.s	r15, 32
#1:	       ldi	0 -> r1.25
#2:	       ldi	36 -> r2.23
	;;
#1:	       ldi	-1 -> r1.23
#3:	       ldi	1 -> r3.25
#2:	       ldi	20 -> r2.24
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       ldm.s	r15, 20
	;;
#3:	       add	r1, 20 -> r3.23
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       add	r1, 1 -> r1
	;;
#0:	       stm.s	r1, r15, 11
	;;
#0:	       ldm.s	r15, 12
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       br	.BB17_340
#1:	       ldm.s	r15, 24
#2:	       sub	r1, 1 -> r2.25
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#1:	       and	r1, 1 -> r1.24
#0:	       stm.s	r0, r15, 9
	;;
.BB17_338:                              ; %bb193
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       ldi	10 -> r1
#1:	       callg	___multadd      ; dtoa.c:809
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       stm.s	r0, r15, 7
	;;
.BB17_339:                              ; %bb193
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       stm.s	r0, r15, 9
#2:	       sub	r2.25, 1 -> r2.25
	;;
#0:	       ldm.s	r15, 44
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       add	r0, 1 -> r0
	;;
#0:	       stm.s	r0, r15, 11
	;;
.BB17_340:                              ; %bb167
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB17_419 Depth 2
                                        ;     Child Loop BB17_347 Depth 2
                                        ;     Child Loop BB17_343 Depth 2
                                        ;     Child Loop BB17_413 Depth 2
                                        ;     Child Loop BB17_410 Depth 2
                                        ;     Child Loop BB17_408 Depth 2
#0:	       ldm.s	r15, 40         ; dtoa.c:757
	;;
#0:	       ldx	$mem, 0 -> r10  ; dtoa.c:757
	;;
#0:	       ldm.s	r15, 32         ; dtoa.c:757
#1:	       or	r10, 0 -> r0    ; dtoa.c:757
	;;
#0:	       callg	_quorem         ; dtoa.c:757
#1:	       ldx	$mem, 0 -> r1   ; dtoa.c:757
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldm.f	r10, 16         ; mprec.c:527[ dtoa.c:761 ]
	;;
#0:	       ldx	$mem, 0 -> r3   ; mprec.c:527[ dtoa.c:761 ]
#1:	       ldm.s	r15, 28         ; mprec.c:528[ dtoa.c:761 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; mprec.c:528[ dtoa.c:761 ]
	;;
#0:	       ldm.f	r1, 16          ; mprec.c:528[ dtoa.c:761 ]
#1:	       s2add	r0, 12 -> r1    ; dtoa.c:757
	;;
#0:	       ldx	$mem, 0 -> r2   ; mprec.c:528[ dtoa.c:761 ]
#1:	       stm.s	r1, r15, 6      ; dtoa.c:757
	;;
#0:	       cmpeq	r3, r2 -> c1
#1:	       stm.s	r0, r15, 1      ; dtoa.c:757
	;;
#0:	if  c1 br @	.BB17_342
	;;
.BB17_341:                              ; %bb.i129
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       sub	r3, r2 -> r12   ; mprec.c:535[ dtoa.c:761 ]
#1:	       br @	.BB17_345
	;;
.BB17_342:                              ; %bb1.i130
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       ldm.s	r15, 28
#1:	       or	r10, 0 -> r0
	;;
#0:	       add	r0, 20 -> r4
	;;
#0:	       ldx	$mem, 0 -> r0
#1:	       s2add	r4, r2 -> r3
	;;
#0:	       s2add	r0, r2 -> r0
	;;
#0:	       add	r0, 16 -> r2
	;;
.BB17_343:                              ; %bb2.i135
                                        ;   Parent Loop BB17_340 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r3, -4          ; mprec.c:543[ dtoa.c:761 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; mprec.c:543[ dtoa.c:761 ]
#1:	       ldm.f	r2, 0           ; mprec.c:543[ dtoa.c:761 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:543[ dtoa.c:761 ]
	;;
#0:	       cmpeq	r1, r0 -> c1    ; mprec.c:543[ dtoa.c:761 ]
	;;
#0:	if !c1 br @	.BB17_350
	;;
.BB17_344:                              ; %bb7.i139
                                        ;   in Loop: Header=BB17_343 Depth=2
#0:	       sub	r3, 4 -> r3
#1:	       sub	r2, 4 -> r2
#2:	       ldi	0 -> r12
	;;
#0:	       cmpult	r4, r3 -> c1    ; mprec.c:545[ dtoa.c:761 ]
	;;
#0:	if  c1 br @	.BB17_343
	;;
.BB17_345:                              ; %__mcmp.exit141
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       ldm.s	r15, 32         ; mprec.c:527[ mprec.c:563[ dtoa.c:762 ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:527[ mprec.c:563[ dtoa.c:762 ] ]
	;;
#0:	       ldm.f	r0, 16          ; mprec.c:527[ mprec.c:563[ dtoa.c:762 ] ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; mprec.c:527[ mprec.c:563[ dtoa.c:762 ] ]
#1:	       ldm.s	r15, 36         ; mprec.c:528[ mprec.c:563[ dtoa.c:762 ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:528[ mprec.c:563[ dtoa.c:762 ] ]
	;;
#0:	       ldm.f	r0, 16          ; mprec.c:528[ mprec.c:563[ dtoa.c:762 ] ]
	;;
#0:	       ldx	$mem, 0 -> r2   ; mprec.c:528[ mprec.c:563[ dtoa.c:762 ] ]
	;;
#0:	       cmpne	r1, r2 -> c1    ; mprec.c:535[ mprec.c:563[ dtoa.c:762 ] ]
	;;
#0:	if  c1 br @	.BB17_379
	;;
.BB17_346:                              ; %bb2.i.i144.preheader
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       s2add	r0, r2 -> r0
	;;
#0:	       add	r0, 16 -> r3
	;;
#3:	       s2add	r3.23, r2 -> r0
	;;
.BB17_347:                              ; %bb2.i.i144
                                        ;   Parent Loop BB17_340 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r0, -4          ; mprec.c:543[ mprec.c:563[ dtoa.c:762 ] ]
	;;
#0:	       ldx	$mem, 0 -> r2   ; mprec.c:543[ mprec.c:563[ dtoa.c:762 ] ]
#1:	       ldm.f	r3, 0           ; mprec.c:543[ mprec.c:563[ dtoa.c:762 ] ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; mprec.c:543[ mprec.c:563[ dtoa.c:762 ] ]
	;;
#0:	       cmpeq	r2, r1 -> c1    ; mprec.c:543[ mprec.c:563[ dtoa.c:762 ] ]
	;;
#0:	if !c1 br @	.BB17_351
	;;
.BB17_348:                              ; %bb7.i.i146
                                        ;   in Loop: Header=BB17_347 Depth=2
#0:	       sub	r0, 4 -> r0
#1:	       sub	r3, 4 -> r3
	;;
#3:	       cmpult	r3.23, r0 -> c1 ; mprec.c:545[ mprec.c:563[ dtoa.c:762 ] ]
	;;
#0:	if  c1 br @	.BB17_347
	;;
.BB17_349:                              ; %bb.i147
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       ldmg.d	_impure_data+76 ; mprec.c:103[ mprec.c:566[ dtoa.c:762 ] ]
	;;
#0:	       ldx	$mem, 0 -> r10  ; mprec.c:103[ mprec.c:566[ dtoa.c:762 ] ]
	;;
#0:	       brz ne @	r10, .BB17_364  ; mprec.c:103[ mprec.c:566[ dtoa.c:762 ] ]
	;;
#0:	       brz eq @	r10, .BB17_352
	;;
.BB17_350:                              ; %bb3.i137
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       cmpult	r1, r0 -> c1    ; mprec.c:544[ dtoa.c:761 ]
#1:	       br	.BB17_345
#2:	       ldi	1 -> r12
	;;
#1:	if  c1 or	r1.23, 0 -> r12
	;;
	       nop	0
	;;
.BB17_351:                              ; %__mcmp.exit.i.thread
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       cmpult	r2, r1 -> c1    ; mprec.c:544[ mprec.c:563[ dtoa.c:762 ] ]
#1:	       br	.BB17_380
#2:	       ldi	1 -> r3
	;;
#1:	if  c1 or	r1.23, 0 -> r3
	;;
	       nop	0
	;;
.BB17_352:                              ; %bb.i17.i
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       ldi	132 -> r0
#1:	       callg	__malloc_r      ; mallocr.c:3207[ mprec.c:106[ mprec.c:566[ dtoa.c:762 ] ] ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz ne @	r0, .BB17_354   ; mallocr.c:3209[ mprec.c:106[ mprec.c:566[ dtoa.c:762 ] ] ]
	;;
.BB17_353:                              ; %_calloc_r.exit.i153.thread
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       ldga	_impure_data -> r0 ; mprec.c:106[ mprec.c:566[ dtoa.c:762 ] ]
#1:	       br	.BB17_378
#2:	       ldi	0 -> r11
	;;
#0:	       stm.a	0, r0, 19       ; mprec.c:106[ mprec.c:566[ dtoa.c:762 ] ]
	;;
	       nop	0
	;;
.BB17_354:                              ; %bb1.i1.i
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       or	r0, 0 -> r10    ; mallocr.c:3207[ mprec.c:106[ mprec.c:566[ dtoa.c:762 ] ] ]
	;;
#0:	       ldm.f	r10, -4         ; mallocr.c:3233[ mprec.c:106[ mprec.c:566[ dtoa.c:762 ] ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:3233[ mprec.c:106[ mprec.c:566[ dtoa.c:762 ] ] ]
	;;
#0:	       sub	r0, 4 -> r1
#1:	       ldi	-4 -> r0
	;;
#0:	       and	r1, r0 -> r2
	;;
#2:	       cmpult	r2.23, r2 -> c1 ; mallocr.c:3244[ mprec.c:106[ mprec.c:566[ dtoa.c:762 ] ] ]
	;;
#0:	if  c1 br @	.BB17_362
	;;
.BB17_355:                              ; %bb2.i2.i
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       cmpult	r2, 20 -> c1    ; mallocr.c:3244[ mprec.c:106[ mprec.c:566[ dtoa.c:762 ] ] ]
#1:	       or	r10, 0 -> r0
	;;
#0:	if  c1 br @	.BB17_361
	;;
.BB17_356:                              ; %bb3.i3.i
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       cmpult	r2, 28 -> c1    ; mallocr.c:3244[ mprec.c:106[ mprec.c:566[ dtoa.c:762 ] ] ]
#1:	       stm.a	0, r10, 0       ; mallocr.c:3244[ mprec.c:106[ mprec.c:566[ dtoa.c:762 ] ] ]
	;;
#0:	if !c1 br @	.BB17_358
#1:	       stm.a	0, r10, 1       ; mallocr.c:3244[ mprec.c:106[ mprec.c:566[ dtoa.c:762 ] ] ]
	;;
.BB17_357:                              ;   in Loop: Header=BB17_340 Depth=1
#0:	       add	r10, 8 -> r0
#1:	       br @	.BB17_361
	;;
.BB17_358:                              ; %bb4.i4.i
                                        ;   in Loop: Header=BB17_340 Depth=1
#2:	       cmpult	r2, r2.23 -> c1 ; mallocr.c:3244[ mprec.c:106[ mprec.c:566[ dtoa.c:762 ] ] ]
#0:	       stm.a	0, r10, 2       ; mallocr.c:3244[ mprec.c:106[ mprec.c:566[ dtoa.c:762 ] ] ]
	;;
#0:	if !c1 br @	.BB17_360
#1:	       stm.a	0, r10, 3       ; mallocr.c:3244[ mprec.c:106[ mprec.c:566[ dtoa.c:762 ] ] ]
	;;
.BB17_359:                              ;   in Loop: Header=BB17_340 Depth=1
#0:	       add	r10, 16 -> r0
#1:	       br @	.BB17_361
	;;
.BB17_360:                              ; %bb5.i.i148
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       stm.a	0, r10, 4       ; mallocr.c:3244[ mprec.c:106[ mprec.c:566[ dtoa.c:762 ] ] ]
#1:	       add	r10, 24 -> r0
	;;
#0:	       stm.a	0, r10, 5       ; mallocr.c:3244[ mprec.c:106[ mprec.c:566[ dtoa.c:762 ] ] ]
	;;
.BB17_361:                              ; %bb6.i5.i150
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       stm.a	0, r0, 0        ; mallocr.c:3244[ mprec.c:106[ mprec.c:566[ dtoa.c:762 ] ] ]
#1:	       br	.BB17_363
	;;
#0:	       stm.a	0, r0, 1        ; mallocr.c:3244[ mprec.c:106[ mprec.c:566[ dtoa.c:762 ] ] ]
	;;
#0:	       stm.a	0, r0, 2        ; mallocr.c:3244[ mprec.c:106[ mprec.c:566[ dtoa.c:762 ] ] ]
	;;
.BB17_362:                              ; %bb7.i6.i151
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       or	r10, 0 -> r0    ; mallocr.c:3244[ mprec.c:106[ mprec.c:566[ dtoa.c:762 ] ] ]
#1:	       callg	_memset         ; mallocr.c:3244[ mprec.c:106[ mprec.c:566[ dtoa.c:762 ] ] ]
#2:	       ldi	0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB17_363:                              ; %_calloc_r.exit.i153
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       ldga	_impure_data -> r0 ; mprec.c:106[ mprec.c:566[ dtoa.c:762 ] ]
	;;
#0:	       stm.a	r10, r0, 19     ; mprec.c:106[ mprec.c:566[ dtoa.c:762 ] ]
	;;
.BB17_364:                              ; %bb2.i18.i
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       ldm.f	r10, 0          ; mprec.c:115[ mprec.c:566[ dtoa.c:762 ] ]
	;;
#0:	       ldx	$mem, 0 -> r11  ; mprec.c:115[ mprec.c:566[ dtoa.c:762 ] ]
	;;
#0:	       brz eq @	r11, .BB17_366  ; mprec.c:115[ mprec.c:566[ dtoa.c:762 ] ]
	;;
.BB17_365:                              ; %bb3.i19.i
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       ldm.f	r11, 0          ; mprec.c:117[ mprec.c:566[ dtoa.c:762 ] ]
#1:	       br	.BB17_377
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:117[ mprec.c:566[ dtoa.c:762 ] ]
	;;
#0:	       stm.a	r0, r10, 0      ; mprec.c:117[ mprec.c:566[ dtoa.c:762 ] ]
	;;
.BB17_366:                              ; %bb4.i20.i
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       ldi	24 -> r0
#1:	       callg	__malloc_r      ; mallocr.c:3207[ mprec.c:123[ mprec.c:566[ dtoa.c:762 ] ] ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz eq @	r0, .BB17_378   ; mallocr.c:3209[ mprec.c:123[ mprec.c:566[ dtoa.c:762 ] ] ]
#1:	       ldi	0 -> r11
	;;
.BB17_367:                              ; %bb1.i7.i154
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       or	r0, 0 -> r11    ; mallocr.c:3207[ mprec.c:123[ mprec.c:566[ dtoa.c:762 ] ] ]
	;;
#0:	       ldm.f	r11, -4         ; mallocr.c:3233[ mprec.c:123[ mprec.c:566[ dtoa.c:762 ] ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:3233[ mprec.c:123[ mprec.c:566[ dtoa.c:762 ] ] ]
	;;
#0:	       sub	r0, 4 -> r1
#1:	       ldi	-4 -> r0
	;;
#0:	       and	r1, r0 -> r2
	;;
#2:	       cmpult	r2.23, r2 -> c1 ; mallocr.c:3244[ mprec.c:123[ mprec.c:566[ dtoa.c:762 ] ] ]
	;;
#0:	if  c1 br @	.BB17_375
	;;
.BB17_368:                              ; %bb2.i8.i155
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       cmpult	r2, 20 -> c1    ; mallocr.c:3244[ mprec.c:123[ mprec.c:566[ dtoa.c:762 ] ] ]
#1:	       or	r11, 0 -> r0
	;;
#0:	if  c1 br @	.BB17_374
	;;
.BB17_369:                              ; %bb3.i9.i156
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       cmpult	r2, 28 -> c1    ; mallocr.c:3244[ mprec.c:123[ mprec.c:566[ dtoa.c:762 ] ] ]
#1:	       stm.a	0, r11, 0       ; mallocr.c:3244[ mprec.c:123[ mprec.c:566[ dtoa.c:762 ] ] ]
	;;
#0:	if !c1 br @	.BB17_371
#1:	       stm.a	0, r11, 1       ; mallocr.c:3244[ mprec.c:123[ mprec.c:566[ dtoa.c:762 ] ] ]
	;;
.BB17_370:                              ;   in Loop: Header=BB17_340 Depth=1
#0:	       add	r11, 8 -> r0
#1:	       br @	.BB17_374
	;;
.BB17_371:                              ; %bb4.i10.i157
                                        ;   in Loop: Header=BB17_340 Depth=1
#2:	       cmpult	r2, r2.23 -> c1 ; mallocr.c:3244[ mprec.c:123[ mprec.c:566[ dtoa.c:762 ] ] ]
#0:	       stm.a	0, r11, 2       ; mallocr.c:3244[ mprec.c:123[ mprec.c:566[ dtoa.c:762 ] ] ]
	;;
#0:	if !c1 br @	.BB17_373
#1:	       stm.a	0, r11, 3       ; mallocr.c:3244[ mprec.c:123[ mprec.c:566[ dtoa.c:762 ] ] ]
	;;
.BB17_372:                              ;   in Loop: Header=BB17_340 Depth=1
#0:	       add	r11, 16 -> r0
#1:	       br @	.BB17_374
	;;
.BB17_373:                              ; %bb5.i11.i158
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       stm.a	0, r11, 4       ; mallocr.c:3244[ mprec.c:123[ mprec.c:566[ dtoa.c:762 ] ] ]
#1:	       add	r11, 24 -> r0
	;;
#0:	       stm.a	0, r11, 5       ; mallocr.c:3244[ mprec.c:123[ mprec.c:566[ dtoa.c:762 ] ] ]
	;;
.BB17_374:                              ; %bb6.i13.i160
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       stm.a	0, r0, 0        ; mallocr.c:3244[ mprec.c:123[ mprec.c:566[ dtoa.c:762 ] ] ]
#1:	       br	.BB17_376
	;;
#0:	       stm.a	0, r0, 1        ; mallocr.c:3244[ mprec.c:123[ mprec.c:566[ dtoa.c:762 ] ] ]
	;;
#0:	       stm.a	0, r0, 2        ; mallocr.c:3244[ mprec.c:123[ mprec.c:566[ dtoa.c:762 ] ] ]
	;;
.BB17_375:                              ; %bb7.i14.i161
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       or	r11, 0 -> r0    ; mallocr.c:3244[ mprec.c:123[ mprec.c:566[ dtoa.c:762 ] ] ]
#1:	       callg	_memset         ; mallocr.c:3244[ mprec.c:123[ mprec.c:566[ dtoa.c:762 ] ] ]
#2:	       ldi	0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB17_376:                              ; %bb6.i21.i
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       stm.a	0, r11, 1       ; mprec.c:128[ mprec.c:566[ dtoa.c:762 ] ]
	;;
#0:	       stm.a	1, r11, 2       ; mprec.c:129[ mprec.c:566[ dtoa.c:762 ] ]
	;;
.BB17_377:                              ; %bb7.i23.i
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       stm.a	0, r11, 4       ; mprec.c:131[ mprec.c:566[ dtoa.c:762 ] ]
	;;
#0:	       stm.a	0, r11, 3       ; mprec.c:131[ mprec.c:566[ dtoa.c:762 ] ]
	;;
.BB17_378:                              ; %_Balloc.exit25.i
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       stm.a	1, r11, 4       ; mprec.c:567[ dtoa.c:762 ]
#1:	       br	.BB17_415
#2:	       ldi	1 -> r1
	;;
#0:	       stm.a	0, r11, 5       ; mprec.c:568[ dtoa.c:762 ]
	;;
	       nop	0
	;;
.BB17_379:                              ; %__mcmp.exit.i
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       sub	r1, r2 -> r3    ; mprec.c:535[ mprec.c:563[ dtoa.c:762 ] ]
	;;
.BB17_380:                              ; %bb1.i164
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       ldm.s	r15, 32
#1:	       cmplt	r3, 0 -> c1     ; mprec.c:571[ dtoa.c:762 ]
	;;
#3:	       sr	r3, 31 -> r3.24
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       ldm.s	r15, 36
#1:	       or	r1, 0 -> r10
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       ldmg.d	_impure_data+76 ; mprec.c:103[ mprec.c:580[ dtoa.c:762 ] ]
#1:	if  c1 or	r2, 0 -> r10
#2:	       or	r2, 0 -> r13
	;;
#0:	if  c1 or	r1, 0 -> r13
	;;
#0:	       ldx	$mem, 0 -> r11  ; mprec.c:103[ mprec.c:580[ dtoa.c:762 ] ]
#1:	       ldm.f	r10, 4          ; mprec.c:580[ dtoa.c:762 ]
	;;
#0:	       brz ne	r11, .BB17_393  ; mprec.c:103[ mprec.c:580[ dtoa.c:762 ] ]
#1:	       ldx	$mem, 0 -> r0   ; mprec.c:580[ dtoa.c:762 ]
	;;
#0:	       stm.s	r0, r15, 3
	;;
	       nop	0
	;;
.BB17_381:                              ; %bb.i13.i
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       ldi	132 -> r0
#1:	       callg	__malloc_r      ; mallocr.c:3207[ mprec.c:106[ mprec.c:580[ dtoa.c:762 ] ] ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz ne @	r0, .BB17_383   ; mallocr.c:3209[ mprec.c:106[ mprec.c:580[ dtoa.c:762 ] ] ]
	;;
.BB17_382:                              ; %_calloc_r.exit27.i.thread
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       ldga	_impure_data -> r0 ; mprec.c:106[ mprec.c:566[ dtoa.c:762 ] ]
#1:	       br	.BB17_407
#2:	       ldi	0 -> r11
	;;
#0:	       stm.a	0, r0, 19       ; mprec.c:106[ mprec.c:580[ dtoa.c:762 ] ]
	;;
	       nop	0
	;;
.BB17_383:                              ; %bb1.i17.i
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       or	r0, 0 -> r11    ; mallocr.c:3207[ mprec.c:106[ mprec.c:580[ dtoa.c:762 ] ] ]
	;;
#0:	       ldm.f	r11, -4         ; mallocr.c:3233[ mprec.c:106[ mprec.c:580[ dtoa.c:762 ] ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:3233[ mprec.c:106[ mprec.c:580[ dtoa.c:762 ] ] ]
	;;
#0:	       sub	r0, 4 -> r1
#1:	       ldi	-4 -> r0
	;;
#0:	       and	r1, r0 -> r2
	;;
#2:	       cmpult	r2.23, r2 -> c1 ; mallocr.c:3244[ mprec.c:106[ mprec.c:580[ dtoa.c:762 ] ] ]
	;;
#0:	if  c1 br @	.BB17_391
	;;
.BB17_384:                              ; %bb2.i19.i
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       cmpult	r2, 20 -> c1    ; mallocr.c:3244[ mprec.c:106[ mprec.c:580[ dtoa.c:762 ] ] ]
#1:	       or	r11, 0 -> r0
	;;
#0:	if  c1 br @	.BB17_390
	;;
.BB17_385:                              ; %bb3.i20.i
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       cmpult	r2, 28 -> c1    ; mallocr.c:3244[ mprec.c:106[ mprec.c:580[ dtoa.c:762 ] ] ]
#1:	       stm.a	0, r11, 0       ; mallocr.c:3244[ mprec.c:106[ mprec.c:580[ dtoa.c:762 ] ] ]
	;;
#0:	if !c1 br @	.BB17_387
#1:	       stm.a	0, r11, 1       ; mallocr.c:3244[ mprec.c:106[ mprec.c:580[ dtoa.c:762 ] ] ]
	;;
.BB17_386:                              ;   in Loop: Header=BB17_340 Depth=1
#0:	       add	r11, 8 -> r0
#1:	       br @	.BB17_390
	;;
.BB17_387:                              ; %bb4.i21.i
                                        ;   in Loop: Header=BB17_340 Depth=1
#2:	       cmpult	r2, r2.23 -> c1 ; mallocr.c:3244[ mprec.c:106[ mprec.c:580[ dtoa.c:762 ] ] ]
#0:	       stm.a	0, r11, 2       ; mallocr.c:3244[ mprec.c:106[ mprec.c:580[ dtoa.c:762 ] ] ]
	;;
#0:	if !c1 br @	.BB17_389
#1:	       stm.a	0, r11, 3       ; mallocr.c:3244[ mprec.c:106[ mprec.c:580[ dtoa.c:762 ] ] ]
	;;
.BB17_388:                              ;   in Loop: Header=BB17_340 Depth=1
#0:	       add	r11, 16 -> r0
#1:	       br @	.BB17_390
	;;
.BB17_389:                              ; %bb5.i22.i
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       stm.a	0, r11, 4       ; mallocr.c:3244[ mprec.c:106[ mprec.c:580[ dtoa.c:762 ] ] ]
#1:	       add	r11, 24 -> r0
	;;
#0:	       stm.a	0, r11, 5       ; mallocr.c:3244[ mprec.c:106[ mprec.c:580[ dtoa.c:762 ] ] ]
	;;
.BB17_390:                              ; %bb6.i24.i
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       stm.a	0, r0, 0        ; mallocr.c:3244[ mprec.c:106[ mprec.c:580[ dtoa.c:762 ] ] ]
#1:	       br	.BB17_392
	;;
#0:	       stm.a	0, r0, 1        ; mallocr.c:3244[ mprec.c:106[ mprec.c:580[ dtoa.c:762 ] ] ]
	;;
#0:	       stm.a	0, r0, 2        ; mallocr.c:3244[ mprec.c:106[ mprec.c:580[ dtoa.c:762 ] ] ]
	;;
.BB17_391:                              ; %bb7.i25.i
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       or	r11, 0 -> r0    ; mallocr.c:3244[ mprec.c:106[ mprec.c:580[ dtoa.c:762 ] ] ]
#1:	       callg	_memset         ; mallocr.c:3244[ mprec.c:106[ mprec.c:580[ dtoa.c:762 ] ] ]
#2:	       ldi	0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB17_392:                              ; %_calloc_r.exit27.i
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       ldga	_impure_data -> r0 ; mprec.c:106[ mprec.c:566[ dtoa.c:762 ] ]
	;;
#0:	       stm.a	r11, r0, 19     ; mprec.c:106[ mprec.c:580[ dtoa.c:762 ] ]
	;;
.BB17_393:                              ; %bb2.i14.i
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       ldm.s	r15, 12         ; mprec.c:115[ mprec.c:580[ dtoa.c:762 ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:115[ mprec.c:580[ dtoa.c:762 ] ]
	;;
#0:	       s2add	r11, r0 -> r1   ; mprec.c:115[ mprec.c:580[ dtoa.c:762 ] ]
	;;
#0:	       ldm.f	r1, 0           ; mprec.c:115[ mprec.c:580[ dtoa.c:762 ] ]
	;;
#0:	       ldx	$mem, 0 -> r11  ; mprec.c:115[ mprec.c:580[ dtoa.c:762 ] ]
	;;
#0:	       brz eq @	r11, .BB17_395  ; mprec.c:115[ mprec.c:580[ dtoa.c:762 ] ]
	;;
.BB17_394:                              ; %bb3.i15.i
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       ldm.f	r11, 0          ; mprec.c:117[ mprec.c:580[ dtoa.c:762 ] ]
#1:	       br	.BB17_406
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:117[ mprec.c:580[ dtoa.c:762 ] ]
	;;
#0:	       stm.a	r0, r1, 0       ; mprec.c:117[ mprec.c:580[ dtoa.c:762 ] ]
	;;
.BB17_395:                              ; %bb4.i.i165
                                        ;   in Loop: Header=BB17_340 Depth=1
#3:	       sl	r3.25, r0 -> r14 ; mprec.c:121[ mprec.c:580[ dtoa.c:762 ] ]
#0:	       callg	__malloc_r      ; mallocr.c:3207[ mprec.c:123[ mprec.c:580[ dtoa.c:762 ] ] ]
	;;
#2:	       s2add	r2.24, r14 -> r0 ; mprec.c:123[ mprec.c:580[ dtoa.c:762 ] ]
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz eq @	r0, .BB17_407   ; mallocr.c:3209[ mprec.c:123[ mprec.c:580[ dtoa.c:762 ] ] ]
#1:	       ldi	0 -> r11
	;;
.BB17_396:                              ; %bb1.i28.i
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       or	r0, 0 -> r11    ; mallocr.c:3207[ mprec.c:123[ mprec.c:580[ dtoa.c:762 ] ] ]
	;;
#0:	       ldm.f	r11, -4         ; mallocr.c:3233[ mprec.c:123[ mprec.c:580[ dtoa.c:762 ] ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:3233[ mprec.c:123[ mprec.c:580[ dtoa.c:762 ] ] ]
	;;
#0:	       sub	r0, 4 -> r1
#1:	       ldi	-4 -> r0
	;;
#0:	       and	r1, r0 -> r2
	;;
#2:	       cmpult	r2.23, r2 -> c1 ; mallocr.c:3244[ mprec.c:123[ mprec.c:580[ dtoa.c:762 ] ] ]
	;;
#0:	if  c1 br @	.BB17_404
	;;
.BB17_397:                              ; %bb2.i29.i
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       cmpult	r2, 20 -> c1    ; mallocr.c:3244[ mprec.c:123[ mprec.c:580[ dtoa.c:762 ] ] ]
#1:	       or	r11, 0 -> r0
	;;
#0:	if  c1 br @	.BB17_403
	;;
.BB17_398:                              ; %bb3.i30.i
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       cmpult	r2, 28 -> c1    ; mallocr.c:3244[ mprec.c:123[ mprec.c:580[ dtoa.c:762 ] ] ]
#1:	       stm.a	0, r11, 0       ; mallocr.c:3244[ mprec.c:123[ mprec.c:580[ dtoa.c:762 ] ] ]
	;;
#0:	if !c1 br @	.BB17_400
#1:	       stm.a	0, r11, 1       ; mallocr.c:3244[ mprec.c:123[ mprec.c:580[ dtoa.c:762 ] ] ]
	;;
.BB17_399:                              ;   in Loop: Header=BB17_340 Depth=1
#0:	       add	r11, 8 -> r0
#1:	       br @	.BB17_403
	;;
.BB17_400:                              ; %bb4.i31.i
                                        ;   in Loop: Header=BB17_340 Depth=1
#2:	       cmpult	r2, r2.23 -> c1 ; mallocr.c:3244[ mprec.c:123[ mprec.c:580[ dtoa.c:762 ] ] ]
#0:	       stm.a	0, r11, 2       ; mallocr.c:3244[ mprec.c:123[ mprec.c:580[ dtoa.c:762 ] ] ]
	;;
#0:	if !c1 br @	.BB17_402
#1:	       stm.a	0, r11, 3       ; mallocr.c:3244[ mprec.c:123[ mprec.c:580[ dtoa.c:762 ] ] ]
	;;
.BB17_401:                              ;   in Loop: Header=BB17_340 Depth=1
#0:	       add	r11, 16 -> r0
#1:	       br @	.BB17_403
	;;
.BB17_402:                              ; %bb5.i32.i
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       stm.a	0, r11, 4       ; mallocr.c:3244[ mprec.c:123[ mprec.c:580[ dtoa.c:762 ] ] ]
#1:	       add	r11, 24 -> r0
	;;
#0:	       stm.a	0, r11, 5       ; mallocr.c:3244[ mprec.c:123[ mprec.c:580[ dtoa.c:762 ] ] ]
	;;
.BB17_403:                              ; %bb6.i34.i
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       stm.a	0, r0, 0        ; mallocr.c:3244[ mprec.c:123[ mprec.c:580[ dtoa.c:762 ] ] ]
#1:	       br	.BB17_405
	;;
#0:	       stm.a	0, r0, 1        ; mallocr.c:3244[ mprec.c:123[ mprec.c:580[ dtoa.c:762 ] ] ]
	;;
#0:	       stm.a	0, r0, 2        ; mallocr.c:3244[ mprec.c:123[ mprec.c:580[ dtoa.c:762 ] ] ]
	;;
.BB17_404:                              ; %bb7.i35.i
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       or	r11, 0 -> r0    ; mallocr.c:3244[ mprec.c:123[ mprec.c:580[ dtoa.c:762 ] ] ]
#1:	       callg	_memset         ; mallocr.c:3244[ mprec.c:123[ mprec.c:580[ dtoa.c:762 ] ] ]
#2:	       ldi	0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB17_405:                              ; %bb6.i.i166
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       ldm.s	r15, 12         ; mprec.c:128[ mprec.c:580[ dtoa.c:762 ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:128[ mprec.c:580[ dtoa.c:762 ] ]
	;;
#0:	       stm.a	r0, r11, 1      ; mprec.c:128[ mprec.c:580[ dtoa.c:762 ] ]
	;;
#0:	       stm.a	r14, r11, 2     ; mprec.c:129[ mprec.c:580[ dtoa.c:762 ] ]
	;;
.BB17_406:                              ; %bb7.i16.i
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       stm.a	0, r11, 4       ; mprec.c:131[ mprec.c:580[ dtoa.c:762 ] ]
	;;
#0:	       stm.a	0, r11, 3       ; mprec.c:131[ mprec.c:580[ dtoa.c:762 ] ]
	;;
.BB17_407:                              ; %_Balloc.exit.i168
                                        ;   in Loop: Header=BB17_340 Depth=1
#3:	       stm.a	r3.24, r11, 3   ; mprec.c:581[ dtoa.c:762 ]
#0:	       ldi	20 -> r2
	;;
#0:	       ldm.f	r13, 16         ; mprec.c:585[ dtoa.c:762 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:585[ dtoa.c:762 ]
#1:	       ldm.f	r10, 16         ; mprec.c:582[ dtoa.c:762 ]
	;;
#0:	       s2add	r13, r0 -> r0
	;;
#0:	       add	r0, 20 -> r5
#1:	       ldx	$mem, 0 -> r1   ; mprec.c:582[ dtoa.c:762 ]
#2:	       ldi	0 -> r0
	;;
.BB17_408:                              ; %bb5.i169
                                        ;   Parent Loop BB17_340 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       add	r10, r2 -> r4
#1:	       add	r13, r2 -> r3
	;;
#0:	       ldm.f	r4, 0           ; mprec.c:593[ dtoa.c:762 ]
	;;
#0:	       ldx	$mem, 0 -> r7   ; mprec.c:593[ dtoa.c:762 ]
#1:	       ldm.f	r3, 0           ; mprec.c:593[ dtoa.c:762 ]
	;;
#0:	       bbh	zext16 r7 -> r4 ; mprec.c:593[ dtoa.c:762 ]
	;;
#0:	       ldx	$mem, 0 -> r6   ; mprec.c:593[ dtoa.c:762 ]
	;;
#0:	       bbh	zext16 r6 -> r3 ; mprec.c:593[ dtoa.c:762 ]
	;;
#0:	       sub	r4, r3 -> r3    ; mprec.c:593[ dtoa.c:762 ]
#1:	       sr	r7, 16 -> r4    ; mprec.c:596[ dtoa.c:762 ]
#2:	       add	r2, 4 -> r7
	;;
#0:	       add	r3, r0 -> r0    ; mprec.c:593[ dtoa.c:762 ]
#1:	       sr	r6, 16 -> r3    ; mprec.c:596[ dtoa.c:762 ]
	;;
#0:	       sub	r4, r3 -> r3    ; mprec.c:596[ dtoa.c:762 ]
#1:	       sra	r0, 16 -> r6    ; mprec.c:594[ dtoa.c:762 ]
#2:	       bbh	zext16 r0 -> r4 ; mprec.c:599[ dtoa.c:762 ]
	;;
#0:	       add	r6, r3 -> r3    ; mprec.c:596[ dtoa.c:762 ]
	;;
#0:	       sl	r3, 16 -> r6    ; mprec.c:599[ dtoa.c:762 ]
#1:	       sra	r3, 16 -> r0    ; mprec.c:597[ dtoa.c:762 ]
#2:	       add	r11, r2 -> r3
#3:	       add	r13, r7 -> r2
	;;
#0:	       cmpult	r2, r5 -> c1    ; mprec.c:601[ dtoa.c:762 ]
#1:	       or	r6, r4 -> r4    ; mprec.c:599[ dtoa.c:762 ]
#2:	       or	r7, 0 -> r2
	;;
#0:	if  c1 br @	.BB17_408
#1:	       stm.a	r4, r3, 0       ; mprec.c:599[ dtoa.c:762 ]
	;;
.BB17_409:                              ; %bb7.preheader.i
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       s2add	r10, r1 -> r2
#1:	       add	r10, r7 -> r8
	;;
#0:	       add	r2, 20 -> r9
#1:	       add	r11, r7 -> r2
	;;
#0:	       cmpule	r9, r8 -> c1    ; mprec.c:602[ dtoa.c:762 ]
#1:	       or	r2, 0 -> r5
	;;
#0:	if  c1 br @	.BB17_411
	;;
.BB17_410:                              ; %bb6.i170
                                        ;   Parent Loop BB17_340 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r8, 0           ; mprec.c:604[ dtoa.c:762 ]
#1:	       add	r8, 4 -> r8
	;;
#0:	       cmpult	r8, r9 -> c1    ; mprec.c:602[ dtoa.c:762 ]
	;;
#0:	       ldx	$mem, 0 -> r4   ; mprec.c:604[ dtoa.c:762 ]
	;;
#0:	       bbh	zext16 r4 -> r3 ; mprec.c:604[ dtoa.c:762 ]
	;;
#0:	       add	r3, r0 -> r3    ; mprec.c:604[ dtoa.c:762 ]
#1:	       add	r4, r0 -> r0
	;;
#0:	       sra	r3, 16 -> r5    ; mprec.c:605[ dtoa.c:762 ]
#1:	       sr	r4, 16 -> r3    ; mprec.c:607[ dtoa.c:762 ]
#2:	       bbh	zext16 r0 -> r4
	;;
#0:	       add	r5, r3 -> r3    ; mprec.c:607[ dtoa.c:762 ]
#1:	       add	r2, 4 -> r5
	;;
#0:	if  c1 br	.BB17_410
#1:	       sl	r3, 16 -> r6    ; mprec.c:610[ dtoa.c:762 ]
#2:	       sra	r3, 16 -> r0    ; mprec.c:608[ dtoa.c:762 ]
	;;
#0:	       or	r6, r4 -> r3    ; mprec.c:610[ dtoa.c:762 ]
	;;
#0:	       stm.a	r3, r2, 0
#1:	       or	r5, 0 -> r2
	;;
.BB17_411:                              ; %bb9.preheader.i
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       ldm.f	r5, -4          ; mprec.c:629[ dtoa.c:762 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:629[ dtoa.c:762 ]
	;;
#0:	       brz ne @	r0, .BB17_414   ; mprec.c:629[ dtoa.c:762 ]
	;;
.BB17_412:                              ; %bb8.i173.preheader
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       sub	r5, 8 -> r0
	;;
.BB17_413:                              ; %bb8.i173
                                        ;   Parent Loop BB17_340 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r0, 0           ; mprec.c:629[ dtoa.c:762 ]
#1:	       sub	r0, 4 -> r3
#2:	       sub	r1, 1 -> r1
	;;
#0:	       or	r3, 0 -> r0
	;;
#0:	       ldx	$mem, 0 -> r2   ; mprec.c:629[ dtoa.c:762 ]
	;;
#0:	       brz eq @	r2, .BB17_413   ; mprec.c:629[ dtoa.c:762 ]
	;;
.BB17_414:                              ; %bb10.i174
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       stm.a	r1, r11, 4      ; mprec.c:631[ dtoa.c:762 ]
	;;
.BB17_415:                              ; %__mdiff.exit
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       ldm.f	r11, 12         ; dtoa.c:763
#1:	       ldi	1 -> r2
	;;
#0:	       ldx	$mem, 0 -> r0   ; dtoa.c:763
	;;
#0:	       brz ne @	r0, .BB17_421   ; dtoa.c:763
	;;
.BB17_416:                              ; %bb168
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       ldm.s	r15, 40         ; mprec.c:527[ dtoa.c:763 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:527[ dtoa.c:763 ]
	;;
#0:	       ldm.f	r0, 16          ; mprec.c:527[ dtoa.c:763 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:527[ dtoa.c:763 ]
	;;
#0:	       cmpeq	r0, r1 -> c1
	;;
#0:	if  c1 br @	.BB17_418
	;;
.BB17_417:                              ; %bb.i175
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       sub	r0, r1 -> r2    ; mprec.c:535[ dtoa.c:763 ]
#1:	       br @	.BB17_421
	;;
.BB17_418:                              ; %bb1.i176
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       ldm.s	r15, 40
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       add	r0, 20 -> r5
#1:	       s2add	r11, r1 -> r0
	;;
#0:	       s2add	r5, r1 -> r4
#1:	       add	r0, 16 -> r3
	;;
.BB17_419:                              ; %bb2.i181
                                        ;   Parent Loop BB17_340 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r4, -4          ; mprec.c:543[ dtoa.c:763 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; mprec.c:543[ dtoa.c:763 ]
#1:	       ldm.f	r3, 0           ; mprec.c:543[ dtoa.c:763 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:543[ dtoa.c:763 ]
	;;
#0:	       cmpeq	r1, r0 -> c1    ; mprec.c:543[ dtoa.c:763 ]
	;;
#0:	if !c1 br @	.BB17_482
	;;
.BB17_420:                              ; %bb7.i185
                                        ;   in Loop: Header=BB17_419 Depth=2
#0:	       sub	r4, 4 -> r4
#1:	       sub	r3, 4 -> r3
#2:	       ldi	0 -> r2
	;;
#0:	       cmpult	r5, r4 -> c1    ; mprec.c:545[ dtoa.c:763 ]
	;;
#0:	if  c1 br @	.BB17_419
	;;
.BB17_421:                              ; %bb170
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       brz eq @	r11, .BB17_423  ; mprec.c:139[ dtoa.c:764 ]
	;;
.BB17_422:                              ; %bb.i188
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       ldmg.d	_impure_data+76 ; mprec.c:141[ dtoa.c:764 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; mprec.c:141[ dtoa.c:764 ]
#1:	       ldm.f	r11, 4          ; mprec.c:141[ dtoa.c:764 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:141[ dtoa.c:764 ]
	;;
#0:	       s2add	r1, r0 -> r1    ; mprec.c:141[ dtoa.c:764 ]
	;;
#0:	       ldm.f	r1, 0           ; mprec.c:141[ dtoa.c:764 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; mprec.c:141[ dtoa.c:764 ]
	;;
#0:	       stm.a	r1, r11, 0      ; mprec.c:141[ dtoa.c:764 ]
	;;
#0:	       ldmg.d	_impure_data+76 ; mprec.c:142[ dtoa.c:764 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; mprec.c:142[ dtoa.c:764 ]
	;;
#0:	       s2add	r1, r0 -> r0    ; mprec.c:142[ dtoa.c:764 ]
	;;
#0:	       stm.a	r11, r0, 0      ; mprec.c:142[ dtoa.c:764 ]
	;;
.BB17_423:                              ; %_Bfree.exit190
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       ldm.s	r15, 8
#1:	       or	r1.24, r1.25 -> r1
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       or	r2, r0 -> r0
	;;
#0:	       or	r0, r1 -> r0
	;;
#0:	       brz ne @	r0, .BB17_427   ; dtoa.c:766
	;;
.BB17_424:                              ; %bb173
#0:	       ldm.s	r15, 24         ; dtoa.c:768
#1:	       ldi	57 -> r1
	;;
#0:	       ldx	$mem, 0 -> r0   ; dtoa.c:768
	;;
#0:	       cmpeq	r0, r1 -> c1    ; dtoa.c:768
	;;
#0:	if  c1 br @	.BB17_443
	;;
.BB17_425:                              ; %bb174
#0:	       ldm.s	r15, 24
#1:	       ldi	0 -> r0
#2:	       ldi	49 -> r1
	;;
#0:	       cmplt	r0, r12 -> c1   ; dtoa.c:770
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       ldm.s	r15, 4
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       ldm.s	r15, 44
#1:	if  c1 add	r0, r1 -> r2
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       sub	r0, 1 -> r0
	;;
#0:	       stmb.a	r2, r0, 0       ; dtoa.c:772
	;;
.BB17_426:                              ; %ret
#0:	       ldm.s	r15, 32         ; mprec.c:139[ dtoa.c:848 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:139[ dtoa.c:848 ]
	;;
#0:	       cmpeq	r0, 0 -> c3     ; mprec.c:139[ dtoa.c:848 ]
	;;
#0:	if !c3 br @	.BB17_472
#1:	if  c3 br @	.BB17_473       ; mprec.c:139[ dtoa.c:848 ]
	;;
.BB17_427:                              ; %bb177
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       cmplt	r12, 0 -> c1    ; dtoa.c:776
	;;
#0:	if  c1 br @	.BB17_429
	;;
.BB17_428:                              ; %bb178
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       ldm.s	r15, 8
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       or	r12, r0 -> r0
	;;
#0:	       or	r0, r1 -> r0
	;;
#0:	       brz ne @	r0, .BB17_441   ; dtoa.c:776
	;;
.BB17_429:                              ; %bb181
#0:	       cmplt	r2, 1 -> c1     ; dtoa.c:782
	;;
#0:	if  c1 br @	.BB17_440
	;;
.BB17_430:                              ; %bb182
#0:	       ldm.s	r15, 40         ; dtoa.c:784
#1:	       ldi	1 -> r1
	;;
#0:	       callg	___lshift       ; dtoa.c:784
#1:	       ldx	$mem, 0 -> r0   ; dtoa.c:784
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldm.f	r0, 16          ; mprec.c:527[ dtoa.c:785 ]
	;;
#0:	       ldx	$mem, 0 -> r2   ; mprec.c:527[ dtoa.c:785 ]
#1:	       ldm.s	r15, 32         ; mprec.c:528[ dtoa.c:785 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; mprec.c:528[ dtoa.c:785 ]
	;;
#0:	       ldm.f	r1, 16          ; mprec.c:528[ dtoa.c:785 ]
	;;
#0:	       ldx	$mem, 0 -> r3   ; mprec.c:528[ dtoa.c:785 ]
#1:	       stm.s	r0, r15, 10     ; dtoa.c:784
	;;
#0:	       cmpeq	r2, r3 -> c1
	;;
#0:	if  c1 br @	.BB17_432
	;;
.BB17_431:                              ; %bb.i191
#0:	       sub	r2, r3 -> r1    ; mprec.c:535[ dtoa.c:785 ]
#1:	       br @	.BB17_436
	;;
.BB17_432:                              ; %bb1.i192
#0:	       ldm.s	r15, 32
#1:	       or	r0, 0 -> r1
	;;
#0:	       s2add	r1, r3 -> r2
#1:	       add	r1, 20 -> r4
	;;
#0:	       br	.BB17_434
#1:	       ldx	$mem, 0 -> r0
	;;
#0:	       s2add	r0, r3 -> r0
#1:	       add	r2, 20 -> r3
	;;
#0:	       add	r0, 16 -> r0
	;;
.BB17_433:                              ; %bb7.i201
                                        ;   in Loop: Header=BB17_434 Depth=1
#0:	       sub	r3, 4 -> r3
#1:	       sub	r0, 4 -> r0
	;;
#0:	       cmpult	r4, r3 -> c1    ; mprec.c:545[ dtoa.c:785 ]
	;;
#0:	if !c1 br @	.BB17_438
	;;
.BB17_434:                              ; %bb2.i197
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r3, -4          ; mprec.c:543[ dtoa.c:785 ]
	;;
#0:	       ldx	$mem, 0 -> r2   ; mprec.c:543[ dtoa.c:785 ]
#1:	       ldm.f	r0, 0           ; mprec.c:543[ dtoa.c:785 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; mprec.c:543[ dtoa.c:785 ]
	;;
#0:	       cmpeq	r2, r1 -> c1    ; mprec.c:543[ dtoa.c:785 ]
	;;
#0:	if  c1 br @	.BB17_433
	;;
.BB17_435:                              ; %bb3.i199
#0:	       cmpult	r2, r1 -> c1    ; mprec.c:544[ dtoa.c:785 ]
#1:	       ldi	-1 -> r0
#2:	       ldi	1 -> r1
	;;
#0:	if  c1 or	r0, 0 -> r1
	;;
.BB17_436:                              ; %__mcmp.exit203
#0:	       ldi	0 -> r0
	;;
#0:	       cmplt	r0, r1 -> c1    ; dtoa.c:786
	;;
#0:	if  c1 br @	.BB17_439
	;;
.BB17_437:                              ; %bb183
#0:	       brz ne @	r1, .BB17_440   ; dtoa.c:786
	;;
.BB17_438:                              ; %bb184
#0:	       ldm.s	r15, 24         ; dtoa.c:786
	;;
#0:	       ldx	$mem, 0 -> r0   ; dtoa.c:786
	;;
#0:	       btest	r0, 0 -> c1     ; dtoa.c:786
	;;
#0:	if !c1 br @	.BB17_440
	;;
.BB17_439:                              ; %bb186
#0:	       ldm.s	r15, 4          ; dtoa.c:786
#1:	       ldi	49 -> r1
	;;
#0:	       ldx	$mem, 0 -> r0   ; dtoa.c:786
	;;
#0:	       add	r0, r1 -> r0    ; dtoa.c:786
#1:	       ldi	58 -> r1
	;;
#0:	       stm.s	r0, r15, 6
#1:	       cmpeq	r0, r1 -> c1    ; dtoa.c:786
	;;
#0:	if  c1 br	.BB17_444
#1:	       ldm.s	r15, 44
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       or	r0, 0 -> r2
	;;
.BB17_440:                              ; %bb187
#0:	       ldm.s	r15, 44
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       br	.BB17_426
#1:	       ldm.s	r15, 24         ; dtoa.c:790
#2:	       sub	r0, 1 -> r1
	;;
#0:	       ldx	$mem, 0 -> r0   ; dtoa.c:790
	;;
#0:	       stmb.a	r0, r1, 0       ; dtoa.c:790
	;;
.BB17_441:                              ; %bb188
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       cmplt	r2, 1 -> c1     ; dtoa.c:793
	;;
#0:	if  c1 br @	.BB17_452
	;;
.BB17_442:                              ; %bb189
#0:	       ldm.s	r15, 24         ; dtoa.c:795
#1:	       ldi	57 -> r1
	;;
#0:	       ldx	$mem, 0 -> r0   ; dtoa.c:795
	;;
#0:	       cmpne	r0, r1 -> c1    ; dtoa.c:795
	;;
#0:	if  c1 br @	.BB17_450
	;;
.BB17_443:
#0:	       ldm.s	r15, 44
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       or	r0, 0 -> r2
	;;
.BB17_444:                              ; %round_9_up
#0:	       ldm.s	r15, 44
#1:	       ldi	57 -> r1
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       sub	r0, 1 -> r0
	;;
#0:	       stmb.a	r1, r0, 0       ; dtoa.c:798
	;;
.BB17_445:                              ; %bb205.preheader
#0:	       add	r2, 1 -> r0
#1:	       ldi	0 -> r1
#2:	       ldi	57 -> r2
	;;
#0:	       stm.s	r0, r15, 11
	;;
#0:	       ldm.s	r15, 20
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       sub	r1, r0 -> r4
	;;
.BB17_446:                              ; %bb205
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.s	r15, 44
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       ldm.f	r0, -2          ; dtoa.c:833
#1:	       sub	r0, 2 -> r3
	;;
#0:	       ldx	$membu, r3 -> r1 ; dtoa.c:833
	;;
#0:	       cmpeq	r1, r2 -> c1    ; dtoa.c:833
	;;
#0:	if !c1 br @	.BB17_449
	;;
.BB17_447:                              ; %bb203
                                        ;   in Loop: Header=BB17_446 Depth=1
#0:	       sub	r0, 1 -> r0
	;;
#0:	       stm.s	r0, r15, 11
#1:	       add	r0, r4 -> r0
	;;
#0:	       cmpne	r0, 1 -> c1     ; dtoa.c:834
	;;
#0:	if  c1 br @	.BB17_446
	;;
.BB17_448:                              ; %bb204
#0:	       ldm.s	r15, 16         ; dtoa.c:836
#1:	       ldi	49 -> r1
	;;
#0:	       br	.BB17_451
#1:	       ldx	$mem, 0 -> r0   ; dtoa.c:836
	;;
#0:	       add	r0, 1 -> r0     ; dtoa.c:836
	;;
#0:	       stm.s	r0, r15, 4
	;;
.BB17_449:                              ; %bb206
#0:	       ldm.s	r15, 44
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       br	.BB17_426
#1:	       sub	r0, 1 -> r0
	;;
#0:	       stm.s	r0, r15, 11     ; dtoa.c:840
#1:	       add	r1, 1 -> r0     ; dtoa.c:840
	;;
#0:	       stmb.a	r0, r3, 0       ; dtoa.c:840
	;;
.BB17_450:                              ; %bb190
#0:	       add	r0, 1 -> r1     ; dtoa.c:801
	;;
.BB17_451:                              ; %bb190
#0:	       ldm.s	r15, 44
	;;
#0:	       br	.BB17_426
#1:	       ldx	$mem, 0 -> r0
	;;
#0:	       sub	r0, 1 -> r0
	;;
#0:	       stmb.a	r1, r0, 0       ; dtoa.c:801
	;;
.BB17_452:                              ; %bb191
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       ldm.s	r15, 44
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#2:	       brz eq	r2.25, .BB17_459 ; dtoa.c:805
#0:	       ldm.s	r15, 24         ; dtoa.c:804
#1:	       sub	r0, 1 -> r1
	;;
#0:	       ldx	$mem, 0 -> r0   ; dtoa.c:804
	;;
#0:	       stmb.a	r0, r1, 0       ; dtoa.c:804
	;;
.BB17_453:                              ; %bb192
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       ldm.s	r15, 40         ; dtoa.c:807
#1:	       ldi	10 -> r1
	;;
#0:	       callg	___multadd      ; dtoa.c:807
#1:	       ldx	$mem, 0 -> r0   ; dtoa.c:807
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       stm.s	r0, r15, 10     ; dtoa.c:807
	;;
#0:	       ldm.s	r15, 36         ; dtoa.c:808
	;;
#0:	       ldx	$mem, 0 -> r0   ; dtoa.c:808
	;;
#0:	       ldm.s	r15, 28         ; dtoa.c:808
	;;
#0:	       ldx	$mem, 0 -> r1   ; dtoa.c:808
	;;
#0:	       cmpne	r1, r0 -> c1    ; dtoa.c:808
	;;
#0:	if !c1 br @	.BB17_338
	;;
.BB17_454:                              ; %bb194
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       ldm.s	r15, 28         ; dtoa.c:812
#1:	       ldi	10 -> r1
	;;
#0:	       callg	___multadd      ; dtoa.c:812
#1:	       ldx	$mem, 0 -> r0   ; dtoa.c:812
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       stm.s	r0, r15, 7      ; dtoa.c:812
#1:	       ldi	10 -> r1
	;;
#0:	       ldm.s	r15, 36         ; dtoa.c:813
	;;
#0:	       callg	___multadd      ; dtoa.c:813
#1:	       ldx	$mem, 0 -> r0   ; dtoa.c:813
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       br @	.BB17_339
	;;
.BB17_455:                              ; %bb.nph489
#0:	       ldm.s	r15, 40
#1:	       sub	r0, 1 -> r11
#2:	       or	r2, 0 -> r0
	;;
#0:	       add	r0, 1 -> r12
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
.BB17_456:                              ; %bb198
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldi	10 -> r1
#1:	       callg	___multadd      ; dtoa.c:823
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r10    ; dtoa.c:823
#1:	       sub	r11, 1 -> r11
	;;
#0:	       stm.s	r10, r15, 10
	;;
#0:	       ldm.s	r15, 32         ; dtoa.c:820
	;;
#0:	       callg	_quorem         ; dtoa.c:820
#1:	       ldx	$mem, 0 -> r1   ; dtoa.c:820
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz ne	r11, .BB17_456  ; dtoa.c:821
#1:	       s2add	r0, 12 -> r0    ; dtoa.c:820
#2:	       add	r12, 1 -> r1
	;;
#0:	       brz eq	r11, .BB17_457  ; dtoa.c:821
#1:	       stm.s	r0, r15, 6
	;;
#0:	       stmb.a	r0, r12, 0      ; dtoa.c:820
#1:	       or	r1, 0 -> r12
#2:	       or	r10, 0 -> r0
	;;
	       nop	0
	;;
.BB17_457:                              ; %bb197.bb199.loopexit427_crit_edge
#0:	       ldi	0 -> r0
	;;
#0:	       stm.s	r0, r15, 7
	;;
#0:	       ldm.s	r15, 20
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       ldm.s	r15, 12
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       add	r1, r0 -> r0
	;;
.BB17_458:                              ; %bb197.bb199.loopexit427_crit_edge
#0:	       stm.s	r0, r15, 11
	;;
.BB17_459:                              ; %bb199
#0:	       ldm.s	r15, 40
#1:	       ldi	1 -> r1
	;;
#0:	       callg	___lshift       ; dtoa.c:828
#1:	       ldx	$mem, 0 -> r0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldm.f	r0, 16          ; mprec.c:527[ dtoa.c:829 ]
	;;
#0:	       ldx	$mem, 0 -> r2   ; mprec.c:527[ dtoa.c:829 ]
#1:	       ldm.s	r15, 32         ; mprec.c:528[ dtoa.c:829 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; mprec.c:528[ dtoa.c:829 ]
	;;
#0:	       ldm.f	r1, 16          ; mprec.c:528[ dtoa.c:829 ]
	;;
#0:	       ldx	$mem, 0 -> r3   ; mprec.c:528[ dtoa.c:829 ]
	;;
#0:	       cmpeq	r2, r3 -> c1
	;;
#0:	if  c1 br @	.BB17_461
	;;
.BB17_460:                              ; %bb.i13
#0:	       sub	r2, r3 -> r2    ; mprec.c:535[ dtoa.c:829 ]
#1:	       br @	.BB17_465
	;;
.BB17_461:                              ; %bb1.i
#0:	       s2add	r1, r3 -> r1
#1:	       br	.BB17_463
#2:	       s2add	r0, r3 -> r2
#3:	       add	r0, 20 -> r5
	;;
#0:	       add	r2, 20 -> r4
#1:	       add	r1, 16 -> r1
	;;
	       nop	0
	;;
.BB17_462:                              ; %bb7.i
                                        ;   in Loop: Header=BB17_463 Depth=1
#0:	       sub	r4, 4 -> r4
#1:	       sub	r1, 4 -> r1
	;;
#0:	       cmpult	r5, r4 -> c1    ; mprec.c:545[ dtoa.c:829 ]
	;;
#0:	if !c1 br @	.BB17_468
	;;
.BB17_463:                              ; %bb2.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r4, -4          ; mprec.c:543[ dtoa.c:829 ]
	;;
#0:	       ldx	$mem, 0 -> r3   ; mprec.c:543[ dtoa.c:829 ]
#1:	       ldm.f	r1, 0           ; mprec.c:543[ dtoa.c:829 ]
	;;
#0:	       ldx	$mem, 0 -> r2   ; mprec.c:543[ dtoa.c:829 ]
	;;
#0:	       cmpeq	r3, r2 -> c1    ; mprec.c:543[ dtoa.c:829 ]
	;;
#0:	if  c1 br @	.BB17_462
	;;
.BB17_464:                              ; %bb3.i
#0:	       cmpult	r3, r2 -> c1    ; mprec.c:544[ dtoa.c:829 ]
#1:	       ldi	-1 -> r1
#2:	       ldi	1 -> r2
	;;
#0:	if  c1 or	r1, 0 -> r2
	;;
.BB17_465:                              ; %__mcmp.exit
#0:	       ldi	0 -> r1
	;;
#0:	       cmplt	r1, r2 -> c1    ; dtoa.c:830
	;;
#0:	if !c1 br @	.BB17_467
	;;
.BB17_466:
#0:	       stm.s	r0, r15, 10
	;;
#0:	       br	.BB17_445
#1:	       ldm.s	r15, 44
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       or	r0, 0 -> r2
	;;
.BB17_467:                              ; %bb200
#0:	       brz ne @	r2, .BB17_469   ; dtoa.c:830
	;;
.BB17_468:                              ; %bb201
#0:	       ldm.s	r15, 24         ; dtoa.c:830
	;;
#0:	       ldx	$mem, 0 -> r1   ; dtoa.c:830
	;;
#0:	       btest	r1, 0 -> c1     ; dtoa.c:830
	;;
#0:	if  c1 br @	.BB17_466
	;;
.BB17_469:                              ; %bb207.preheader
#0:	       ldm.s	r15, 44
#1:	       ldi	48 -> r3
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       add	r1, 1 -> r1
	;;
#0:	       stm.s	r1, r15, 11
	;;
.BB17_470:                              ; %bb207
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.s	r15, 44
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       ldm.f	r2, -2          ; dtoa.c:844
#1:	       sub	r2, 2 -> r1
#2:	       sub	r2, 1 -> r2
	;;
#0:	       ldx	$membu, r1 -> r1 ; dtoa.c:844
#1:	       stm.s	r2, r15, 11     ; dtoa.c:844
	;;
#0:	       cmpeq	r1, r3 -> c1    ; dtoa.c:844
	;;
#0:	if  c1 br @	.BB17_470
	;;
.BB17_471:
#0:	       stm.s	r0, r15, 10
#1:	       br @	.BB17_426
	;;
.BB17_472:                              ; %bb.i10
#0:	       ldmg.d	_impure_data+76 ; mprec.c:141[ dtoa.c:848 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:141[ dtoa.c:848 ]
#1:	       ldm.s	r15, 32         ; mprec.c:141[ dtoa.c:848 ]
	;;
#0:	       ldx	$mem, 0 -> r2   ; mprec.c:141[ dtoa.c:848 ]
	;;
#0:	       ldm.f	r2, 4           ; mprec.c:141[ dtoa.c:848 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; mprec.c:141[ dtoa.c:848 ]
	;;
#0:	       s2add	r0, r1 -> r0    ; mprec.c:141[ dtoa.c:848 ]
	;;
#0:	       ldm.f	r0, 0           ; mprec.c:141[ dtoa.c:848 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:141[ dtoa.c:848 ]
	;;
#0:	       stm.a	r0, r2, 0       ; mprec.c:141[ dtoa.c:848 ]
	;;
#0:	       ldmg.d	_impure_data+76 ; mprec.c:142[ dtoa.c:848 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:142[ dtoa.c:848 ]
	;;
#0:	       s2add	r0, r1 -> r0    ; mprec.c:142[ dtoa.c:848 ]
	;;
#0:	       stm.a	r2, r0, 0       ; mprec.c:142[ dtoa.c:848 ]
	;;
.BB17_473:                              ; %_Bfree.exit12
#0:	       ldm.s	r15, 36         ; dtoa.c:849
	;;
#0:	       ldx	$mem, 0 -> r0   ; dtoa.c:849
	;;
#0:	       brz eq @	r0, .BB17_477   ; dtoa.c:849
	;;
.BB17_474:                              ; %bb209
#0:	       ldm.s	r15, 28         ; dtoa.c:851
	;;
#0:	       ldx	$mem, 0 -> r1   ; dtoa.c:851
	;;
#0:	       cmpeq	r1, 0 -> c2     ; dtoa.c:851
#1:	       cmpeq	r1, r0 -> c1    ; dtoa.c:851
	;;
#0:	       comb	or c2, c1 -> c1
	;;
#0:	if  c1 br @	.BB17_476
	;;
.BB17_475:                              ; %bb.i7
#0:	       ldmg.d	_impure_data+76 ; mprec.c:141[ dtoa.c:852 ]
#1:	       or	r1, 0 -> r2     ; mprec.c:141[ dtoa.c:852 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:141[ dtoa.c:852 ]
#1:	       ldm.f	r2, 4           ; mprec.c:141[ dtoa.c:852 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; mprec.c:141[ dtoa.c:852 ]
	;;
#0:	       s2add	r0, r1 -> r0    ; mprec.c:141[ dtoa.c:852 ]
	;;
#0:	       ldm.f	r0, 0           ; mprec.c:141[ dtoa.c:852 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:141[ dtoa.c:852 ]
	;;
#0:	       stm.a	r0, r2, 0       ; mprec.c:141[ dtoa.c:852 ]
	;;
#0:	       ldmg.d	_impure_data+76 ; mprec.c:142[ dtoa.c:852 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:142[ dtoa.c:852 ]
	;;
#0:	       s2add	r0, r1 -> r0    ; mprec.c:142[ dtoa.c:852 ]
	;;
#0:	       stm.a	r2, r0, 0       ; mprec.c:142[ dtoa.c:852 ]
	;;
.BB17_476:                              ; %bb.i4
#0:	       ldmg.d	_impure_data+76 ; mprec.c:141[ dtoa.c:853 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:141[ dtoa.c:853 ]
#1:	       ldm.s	r15, 36         ; mprec.c:141[ dtoa.c:853 ]
	;;
#0:	       ldx	$mem, 0 -> r2   ; mprec.c:141[ dtoa.c:853 ]
	;;
#0:	       ldm.f	r2, 4           ; mprec.c:141[ dtoa.c:853 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; mprec.c:141[ dtoa.c:853 ]
	;;
#0:	       s2add	r0, r1 -> r0    ; mprec.c:141[ dtoa.c:853 ]
	;;
#0:	       ldm.f	r0, 0           ; mprec.c:141[ dtoa.c:853 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:141[ dtoa.c:853 ]
	;;
#0:	       stm.a	r0, r2, 0       ; mprec.c:141[ dtoa.c:853 ]
	;;
#0:	       ldmg.d	_impure_data+76 ; mprec.c:142[ dtoa.c:853 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:142[ dtoa.c:853 ]
	;;
#0:	       s2add	r0, r1 -> r0    ; mprec.c:142[ dtoa.c:853 ]
	;;
#0:	       stm.a	r2, r0, 0       ; mprec.c:142[ dtoa.c:853 ]
	;;
.BB17_477:                              ; %ret1
#0:	       ldm.s	r15, 40         ; mprec.c:139[ dtoa.c:856 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:139[ dtoa.c:856 ]
	;;
#0:	       brz eq @	r0, .BB17_479   ; mprec.c:139[ dtoa.c:856 ]
	;;
.BB17_478:                              ; %bb.i1
#0:	       ldmg.d	_impure_data+76 ; mprec.c:141[ dtoa.c:856 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:141[ dtoa.c:856 ]
#1:	       ldm.s	r15, 40         ; mprec.c:141[ dtoa.c:856 ]
	;;
#0:	       ldx	$mem, 0 -> r2   ; mprec.c:141[ dtoa.c:856 ]
	;;
#0:	       ldm.f	r2, 4           ; mprec.c:141[ dtoa.c:856 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; mprec.c:141[ dtoa.c:856 ]
	;;
#0:	       s2add	r0, r1 -> r0    ; mprec.c:141[ dtoa.c:856 ]
	;;
#0:	       ldm.f	r0, 0           ; mprec.c:141[ dtoa.c:856 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:141[ dtoa.c:856 ]
	;;
#0:	       stm.a	r0, r2, 0       ; mprec.c:141[ dtoa.c:856 ]
	;;
#0:	       ldmg.d	_impure_data+76 ; mprec.c:142[ dtoa.c:856 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:142[ dtoa.c:856 ]
	;;
#0:	       s2add	r0, r1 -> r0    ; mprec.c:142[ dtoa.c:856 ]
	;;
#0:	       stm.a	r2, r0, 0       ; mprec.c:142[ dtoa.c:856 ]
	;;
.BB17_479:                              ; %_Bfree.exit3
#0:	       ldm.s	r15, 16         ; dtoa.c:858
	;;
#0:	       ldx	$mem, 0 -> r0   ; dtoa.c:858
	;;
#0:	       ldm.s	r15, 44         ; dtoa.c:857
#1:	       add	r0, 1 -> r1     ; dtoa.c:858
	;;
#0:	       brz eq	r0.26, .BB17_481 ; dtoa.c:859
#1:	       ldx	$mem, 0 -> r0   ; dtoa.c:857
	;;
#0:	       stmb.a	0, r0, 0        ; dtoa.c:857
	;;
#3:	       stm.a	r1, r3.26, 0    ; dtoa.c:858
	;;
.BB17_480:                              ; %bb213
#0:	       stm.a	r0, r0.26, 0    ; dtoa.c:860
	;;
.BB17_481:                              ; %bb215
#0:	       ldm.s	r15, 20
#1:	       br	.BB17_13
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
	       nop	0
	;;
.BB17_482:                              ; %bb170.thread
                                        ;   in Loop: Header=BB17_340 Depth=1
#0:	       cmpult	r1, r0 -> c1    ; mprec.c:544[ dtoa.c:763 ]
#1:	       br	.BB17_422
#2:	       ldi	1 -> r2
	;;
#1:	if  c1 or	r1.23, 0 -> r2
	;;
	       nop	0
	;;
	.align	4
__dtoa_r_end:
	.section	.rodata,"a",@progbits
	.align	4
.JTI17_0:
	.long	.BB17_92-__dtoa_r_start
	.long	.BB17_92-__dtoa_r_start
	.long	.BB17_83-__dtoa_r_start
	.long	.BB17_90-__dtoa_r_start
	.long	.BB17_84-__dtoa_r_start
	.long	.BB17_91-__dtoa_r_start

	.text
	.align	4
_quorem:                                ; @quorem
	.size	_quorem_end-_quorem
_quorem_start:
; BB#0:                                 ; %entry
#0:	       ldiu	56 -> r2
#1:	       wb.s	r15, 14
	;;
#0:	       sub	r15, r2 -> r15
#1:	       ldx	$rb, 0 -> r2
	;;
#0:	       stm.s	r10, r15, 9
	;;
#0:	       stm.s	r11, r15, 8
	;;
#0:	       stm.s	r12, r15, 7
#1:	       or	r0, 0 -> r12
#2:	       ldi	0 -> r0
	;;
#0:	       stm.s	r13, r15, 6
#1:	       or	r1, 0 -> r13
	;;
#0:	       stm.s	r14, r15, 5
	;;
#0:	       stm.s	r0.23, r15, 4
	;;
#0:	       stm.s	r2, r15, 3
#1:	       ldx	$ro, 0 -> r2
	;;
#0:	       stm.s	r2, r15, 2
	;;
#0:	       ldm.f	r13, 16         ; dtoa.c:49
	;;
#0:	       ldx	$mem, 0 -> r11  ; dtoa.c:49
#1:	       ldm.f	r12, 16         ; dtoa.c:54
	;;
#0:	       ldx	$mem, 0 -> r0.23 ; dtoa.c:54
	;;
#0:	       cmplt	r0.23, r11 -> c1 ; dtoa.c:54
	;;
#0:	if  c1 br @	.BB18_27
	;;
.BB18_1:                                ; %bb1
#0:	       sub	r11, 1 -> r10
	;;
#0:	       s2add	r13, r10 -> r14
#1:	       s2add	r12, r10 -> r0
	;;
#0:	       ldm.f	r14, 20         ; dtoa.c:60
	;;
#0:	       ldx	$mem, 0 -> r1   ; dtoa.c:60
#1:	       ldm.f	r0, 20          ; dtoa.c:60
	;;
#0:	       add	r1, 1 -> r1     ; dtoa.c:60
	;;
#0:	       callg	___udivsi3      ; dtoa.c:60
#1:	       ldx	$mem, 0 -> r0   ; dtoa.c:60
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz eq @	r0, .BB18_11    ; dtoa.c:65
#1:	       add	r14, 20 -> r1
#2:	       or	r0, 0 -> r2     ; dtoa.c:60
	;;
.BB18_2:                                ; %bb2
#0:	       ldi	0 -> r6
#1:	       add	r13, 20 -> r9
#2:	       add	r12, 20 -> r3
	;;
#0:	       or	r6, 0 -> r5
	;;
.BB18_3:                                ; %bb3
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r9, 0           ; dtoa.c:72
#1:	       add	r9, 4 -> r9
	;;
#0:	       cmpule	r9, r1 -> c1    ; dtoa.c:92
	;;
#0:	       ldx	$mem, 0 -> r4   ; dtoa.c:72
#1:	       ldm.f	r3, 0           ; dtoa.c:76
	;;
#0:	       bbh	zext16 r4 -> r0 ; dtoa.c:73
	;;
#0:	       mul	r0, r2 -> $mul0.0 ; dtoa.c:73
#1:	       sr	r4, 16 -> r0    ; dtoa.c:74
#2:	       ldx	$mem, 0 -> r8   ; dtoa.c:76
	;;
#0:	       ldx	$mul0.0, r6 -> r4 ; dtoa.c:73
#1:	       mul	r0, r2 -> $mul1.0 ; dtoa.c:74
#2:	       bbh	zext16 r8 -> r7 ; dtoa.c:76
	;;
#0:	       sr	r4, 16 -> r0    ; dtoa.c:74
#1:	       bbh	zext16 r4 -> r4 ; dtoa.c:76
	;;
#1:	       ldx	$mul1.0, r0 -> r6 ; dtoa.c:74
#0:	       sub	r7, r4 -> r0    ; dtoa.c:76
#2:	       sr	r8, 16 -> r4    ; dtoa.c:79
	;;
#0:	       add	r0, r5 -> r5    ; dtoa.c:76
#1:	       bbh	zext16 r6 -> r0 ; dtoa.c:79
#2:	       sr	r6, 16 -> r6    ; dtoa.c:75
	;;
#0:	       sub	r4, r0 -> r4    ; dtoa.c:79
#1:	       sra	r5, 16 -> r0    ; dtoa.c:77
#2:	       bbh	zext16 r5 -> r7 ; dtoa.c:82
	;;
#0:	       add	r4, r0 -> r0    ; dtoa.c:79
#1:	       add	r3, 4 -> r4
	;;
#0:	if  c1 br	.BB18_3
#1:	       sl	r0, 16 -> r8    ; dtoa.c:82
#2:	       sra	r0, 16 -> r5    ; dtoa.c:80
	;;
#0:	       or	r8, r7 -> r0    ; dtoa.c:82
	;;
#0:	       stm.a	r0, r3, 0       ; dtoa.c:82
#1:	       or	r4, 0 -> r3
	;;
.BB18_4:                                ; %bb4
#0:	       s2add	r12, r11 -> r3
	;;
#0:	       ldm.f	r3, 16          ; dtoa.c:93
	;;
#0:	       ldx	$mem, 0 -> r0   ; dtoa.c:93
	;;
#0:	       brz eq @	r0, .BB18_6     ; dtoa.c:93
	;;
.BB18_5:                                ; %bb4.bb10_crit_edge
#0:	       ldm.f	r12, 16
#1:	       br	.BB18_11
	;;
#0:	       ldx	$mem, 0 -> r0.23
	;;
	       nop	0
	;;
.BB18_6:                                ; %bb5
#0:	       add	r12, 20 -> r5
#1:	       br @	.BB18_8
#2:	       add	r3, 12 -> r3
#3:	       ldi	-1 -> r0
	;;
.BB18_7:                                ; %bb6
                                        ;   in Loop: Header=BB18_8 Depth=1
#0:	       sub	r0, 1 -> r0
#1:	       sub	r3, 4 -> r3
	;;
.BB18_8:                                ; %bb7
                                        ; =>This Inner Loop Header: Depth=1
#0:	       cmpule	r3, r5 -> c1    ; dtoa.c:96
	;;
#0:	if  c1 br @	.BB18_10
	;;
.BB18_9:                                ; %bb8
                                        ;   in Loop: Header=BB18_8 Depth=1
#0:	       ldm.f	r3, 0           ; dtoa.c:96
	;;
#0:	       ldx	$mem, 0 -> r4   ; dtoa.c:96
	;;
#0:	       brz eq @	r4, .BB18_7     ; dtoa.c:96
	;;
.BB18_10:                               ; %bb9
#0:	       add	r11, r0 -> r0.23
	;;
#0:	       or	r0.23, 0 -> r10
	;;
#0:	       stm.a	r0.23, r12, 4   ; dtoa.c:98
	;;
.BB18_11:                               ; %bb10
#0:	       ldm.f	r13, 16         ; mprec.c:528[ dtoa.c:101 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:528[ dtoa.c:101 ]
	;;
#0:	       cmpeq	r0.23, r0 -> c1
	;;
#0:	if  c1 br @	.BB18_13
	;;
.BB18_12:                               ; %bb.i
#0:	       sub	r0.23, r0 -> r0 ; mprec.c:535[ dtoa.c:101 ]
#1:	       br @	.BB18_20
	;;
.BB18_13:                               ; %bb1.i
#0:	       s2add	r12, r0 -> r3
#1:	       s2add	r13, r0 -> r0
#2:	       add	r12, 20 -> r6
	;;
#0:	       add	r3, 20 -> r5
#1:	       add	r0, 16 -> r0
	;;
.BB18_14:                               ; %bb2.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r5, -4          ; mprec.c:543[ dtoa.c:101 ]
	;;
#0:	       ldx	$mem, 0 -> r4   ; mprec.c:543[ dtoa.c:101 ]
#1:	       ldm.f	r0, 0           ; mprec.c:543[ dtoa.c:101 ]
	;;
#0:	       ldx	$mem, 0 -> r3   ; mprec.c:543[ dtoa.c:101 ]
	;;
#0:	       cmpeq	r4, r3 -> c1    ; mprec.c:543[ dtoa.c:101 ]
	;;
#0:	if !c1 br @	.BB18_19
	;;
.BB18_15:                               ; %bb7.i
                                        ;   in Loop: Header=BB18_14 Depth=1
#0:	       sub	r5, 4 -> r5
#1:	       sub	r0, 4 -> r0
	;;
#0:	       cmpult	r6, r5 -> c1    ; mprec.c:545[ dtoa.c:101 ]
	;;
#0:	if  c1 br @	.BB18_14
	;;
.BB18_16:                               ; %bb11
#0:	       ldi	0 -> r6
#1:	       add	r13, 20 -> r1.16
#2:	       add	r12, 20 -> r4
	;;
#0:	       or	r6, 0 -> r9
	;;
.BB18_17:                               ; %bb12
                                        ; =>This Inner Loop Header: Depth=1
#1:	       ldm.f	r1.16, 0        ; dtoa.c:111
	;;
#1:	       add	r1.16, 4 -> r1.16
	;;
#0:	       ldx	$mem, 0 -> r3   ; dtoa.c:111
#2:	       ldm.f	r4, 0           ; dtoa.c:115
#1:	       cmpule	r1.16, r1 -> c1 ; dtoa.c:131
	;;
#0:	       bbh	zext16 r3 -> r0 ; dtoa.c:112
#1:	       add	r3, r6 -> r7
#2:	       sr	r3, 16 -> r5    ; dtoa.c:113
	;;
#0:	       add	r0, r6 -> r0    ; dtoa.c:112
#1:	       ldx	$mem, 0 -> r8   ; dtoa.c:115
	;;
#0:	       sr	r0, 16 -> r6    ; dtoa.c:113
#1:	       bbh	zext16 r7 -> r0
#2:	       bbh	zext16 r8 -> r3 ; dtoa.c:115
	;;
#0:	       sub	r3, r0 -> r0    ; dtoa.c:115
#1:	       add	r6, r5 -> r7    ; dtoa.c:113
#2:	       sr	r8, 16 -> r3    ; dtoa.c:118
	;;
#0:	       add	r0, r9 -> r6    ; dtoa.c:115
#1:	       bbh	zext16 r7 -> r0 ; dtoa.c:118
	;;
#0:	       sub	r3, r0 -> r3    ; dtoa.c:118
#1:	       sra	r6, 16 -> r0    ; dtoa.c:116
	;;
#0:	       add	r3, r0 -> r5    ; dtoa.c:118
#1:	       bbh	zext16 r6 -> r0 ; dtoa.c:121
#2:	       sr	r7, 16 -> r6    ; dtoa.c:114
	;;
#0:	if  c1 br	.BB18_17
#1:	       sl	r5, 16 -> r3    ; dtoa.c:121
#2:	       sra	r5, 16 -> r9    ; dtoa.c:119
#3:	       add	r4, 4 -> r5
	;;
#0:	       or	r3, r0 -> r0    ; dtoa.c:121
	;;
#0:	       stm.a	r0, r4, 0       ; dtoa.c:121
#1:	       or	r5, 0 -> r4
	;;
.BB18_18:                               ; %bb13
#0:	       add	r12, 20 -> r4
#1:	       add	r2, 1 -> r0     ; dtoa.c:103
	;;
#0:	       s2add	r4, r10 -> r1
	;;
#0:	       ldm.f	r1, 0           ; dtoa.c:134
	;;
#0:	       ldx	$mem, 0 -> r1   ; dtoa.c:134
	;;
#0:	       brz ne @	r1, .BB18_27    ; dtoa.c:134
	;;
#0:	       brz eq @	r1, .BB18_22
	;;
.BB18_19:                               ; %bb3.i
#0:	       cmpult	r4, r3 -> c1    ; mprec.c:544[ dtoa.c:101 ]
#1:	       ldi	-1 -> r3
#2:	       ldi	1 -> r0
	;;
#0:	if  c1 or	r3, 0 -> r0
	;;
.BB18_20:                               ; %__mcmp.exit
#0:	       cmplt	r0, 0 -> c1     ; dtoa.c:101
	;;
#0:	if !c1 br @	.BB18_16
	;;
.BB18_21:
#0:	       or	r2, 0 -> r0
#1:	       br @	.BB18_27
	;;
.BB18_22:                               ; %bb15.preheader
#0:	       add	r12, 16 -> r3
#1:	       br @	.BB18_24
#2:	       sl	r10, 2 -> r2
	;;
.BB18_23:                               ; %bb14
                                        ;   in Loop: Header=BB18_24 Depth=1
#0:	       sub	r10, 1 -> r10
#1:	       sub	r2, 4 -> r2
	;;
.BB18_24:                               ; %bb15
                                        ; =>This Inner Loop Header: Depth=1
#0:	       add	r3, r2 -> r1
	;;
#0:	       cmpule	r1, r4 -> c1    ; dtoa.c:136
	;;
#0:	if  c1 br @	.BB18_26
	;;
.BB18_25:                               ; %bb16
                                        ;   in Loop: Header=BB18_24 Depth=1
#0:	       s2add	r3, r10 -> r1
	;;
#0:	       ldm.f	r1, 0           ; dtoa.c:136
	;;
#0:	       ldx	$mem, 0 -> r1   ; dtoa.c:136
	;;
#0:	       brz eq @	r1, .BB18_23    ; dtoa.c:136
	;;
.BB18_26:                               ; %bb17
#0:	       stm.a	r10, r12, 4     ; dtoa.c:138
	;;
.BB18_27:                               ; %bb19
#0:	       ldm.s	r15, 8          ; dtoa.c:141
	;;
#0:	       ldx	$mem, 0 -> r1   ; dtoa.c:141
	;;
#0:	       stx	r1 -> $ro       ; dtoa.c:141
	;;
#0:	       ldm.s	r15, 12         ; dtoa.c:141
	;;
#0:	       ldx	$mem, 0 -> r1   ; dtoa.c:141
	;;
#0:	       stx	r1 -> $rb       ; dtoa.c:141
	;;
#0:	       ldm.s	r15, 16         ; dtoa.c:141
	;;
#0:	       ldx	$mem, 0 -> r0.23 ; dtoa.c:141
	;;
#0:	       ldm.s	r15, 20         ; dtoa.c:141
	;;
#0:	       ldx	$mem, 0 -> r14  ; dtoa.c:141
	;;
#0:	       ldm.s	r15, 24         ; dtoa.c:141
	;;
#0:	       ldx	$mem, 0 -> r13  ; dtoa.c:141
	;;
#0:	       ldm.s	r15, 28         ; dtoa.c:141
	;;
#0:	       ldx	$mem, 0 -> r12  ; dtoa.c:141
	;;
#0:	       ldm.s	r15, 32         ; dtoa.c:141
	;;
#0:	       ldx	$mem, 0 -> r11  ; dtoa.c:141
	;;
#0:	       ldm.s	r15, 36         ; dtoa.c:141
#1:	       s2add	r15, 14 -> r15  ; dtoa.c:141
	;;
#0:	       jop	ret             ; dtoa.c:141
#1:	       ldx	$mem, 0 -> r10  ; dtoa.c:141
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
_quorem_end:

	.align	4
__fflush_r:                             ; @_fflush_r
	.size	__fflush_r_end-__fflush_r
__fflush_r_start:
; BB#0:                                 ; %entry
#0:	       ldiu	48 -> r1
#1:	       wb.s	r15, 12
	;;
#0:	       sub	r15, r1 -> r15
#1:	       ldx	$rb, 0 -> r1
	;;
#0:	       stm.s	r10, r15, 7
#1:	       or	r0, 0 -> r10
	;;
#0:	       stm.s	r11, r15, 6
	;;
#0:	       stm.s	r12, r15, 5
	;;
#0:	       stm.s	r13, r15, 4
	;;
#0:	       stm.s	r14, r15, 3
	;;
#0:	       stm.s	r1, r15, 2
#1:	       ldx	$ro, 0 -> r1
	;;
#0:	       stm.s	r1, r15, 1
	;;
#0:	       ldmg.d	_impure_data+56 ; fflush.c:224
	;;
#0:	       ldx	$mem, 0 -> r0   ; fflush.c:224
	;;
#0:	       brz ne @	r0, .BB19_2     ; fflush.c:224
	;;
.BB19_1:                                ; %bb1
#0:	       callg	___sinit        ; fflush.c:224
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB19_2:                                ; %bb2
#0:	       ldm.f	r10, 12         ; fflush.c:226
#1:	       add	r10, 12 -> r11  ; fflush.c:226
#2:	       ldi	0 -> r0
	;;
#0:	       ldx	$memhu, r11 -> r2 ; fflush.c:226
	;;
#0:	       cmpeq	r2, 0 -> c3     ; fflush.c:226
	;;
#0:	if  c3 br @	.BB19_35        ; fflush.c:226
	;;
.BB19_3:                                ; %bb4
#0:	       bbh	sext16 r2 -> r1 ; fflush.c:80[ fflush.c:230 ]
	;;
#0:	       btest	r1, 3 -> c1     ; fflush.c:81[ fflush.c:230 ]
	;;
#0:	if  c1 br @	.BB19_27
	;;
.BB19_4:                                ; %bb.i
#0:	       ldga	2048 -> r0
	;;
#0:	       or	r2, r0 -> r0    ; fflush.c:86[ fflush.c:230 ]
	;;
#0:	       stmh.a	r0, r10, 6      ; fflush.c:86[ fflush.c:230 ]
#1:	       ldi	0 -> r0
	;;
#0:	       ldm.f	r10, 4          ; fflush.c:95[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; fflush.c:95[ fflush.c:230 ]
	;;
#0:	       cmplt	r0, r1 -> c1    ; fflush.c:95[ fflush.c:230 ]
	;;
#0:	if  c1 br @	.BB19_6
	;;
.BB19_5:                                ; %bb1.i
#0:	       ldm.f	r10, 60         ; fflush.c:95[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; fflush.c:95[ fflush.c:230 ]
	;;
#0:	       cmplt	r1, 1 -> c1     ; fflush.c:95[ fflush.c:230 ]
	;;
#0:	if  c1 br @	.BB19_35
	;;
.BB19_6:                                ; %bb2.i
#0:	       ldm.f	r10, 40         ; fflush.c:95[ fflush.c:230 ]
#1:	       ldi	0 -> r0
	;;
#0:	       ldx	$mem, 0 -> r1   ; fflush.c:95[ fflush.c:230 ]
	;;
#0:	       cmpeq	r1, 0 -> c3     ; fflush.c:95[ fflush.c:230 ]
	;;
#0:	if  c3 br @	.BB19_35        ; fflush.c:95[ fflush.c:230 ]
	;;
.BB19_7:                                ; %bb3.i
#0:	       ldmg.d	_impure_data    ; fflush.c:107[ fflush.c:230 ]
#1:	       ldga	_impure_data -> r0 ; fflush.c:108[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r12  ; fflush.c:107[ fflush.c:230 ]
#1:	       stm.a	0, r0, 0        ; fflush.c:108[ fflush.c:230 ]
	;;
#0:	       ldm.f	r10, 12
	;;
#0:	       ldx	$memhu, r11 -> r0
	;;
#0:	       btest	r0, 12 -> c1    ; fflush.c:110[ fflush.c:230 ]
	;;
#0:	if !c1 br @	.BB19_11
	;;
.BB19_8:                                ; %bb4.i
#0:	       ldm.f	r10, 80         ; fflush.c:111[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; fflush.c:111[ fflush.c:230 ]
	;;
.BB19_9:                                ; %bb12.i
#0:	       ldm.f	r10, 12
	;;
#0:	       ldx	$memhu, r11 -> r1
	;;
#0:	       btest	r1, 2 -> c1     ; fflush.c:135[ fflush.c:230 ]
	;;
#0:	if  c1 br @	.BB19_16
	;;
.BB19_10:
#0:	       or	r0, 0 -> r2
#1:	       br @	.BB19_18
	;;
.BB19_11:                               ; %bb5.i
#0:	       ldm.f	r10, 40         ; fflush.c:121[ fflush.c:230 ]
#1:	       ldga	_impure_data -> r0 ; fflush.c:121[ fflush.c:230 ]
#2:	       ldi	0 -> r2
#3:	       ldi	1 -> r3
	;;
#0:	       ldx	$mem, 0 -> r4   ; fflush.c:121[ fflush.c:230 ]
#1:	       ldm.f	r10, 28         ; fflush.c:121[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; fflush.c:121[ fflush.c:230 ]
	;;
#0:	       jop	call	r4      ; fflush.c:121[ fflush.c:230 ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       cmpne	r0, -1 -> c1    ; fflush.c:122[ fflush.c:230 ]
	;;
#0:	if  c1 br @	.BB19_9
	;;
.BB19_12:                               ; %bb6.i
#0:	       ldmg.d	_impure_data    ; fflush.c:122[ fflush.c:230 ]
#1:	       ldi	-1 -> r0
	;;
#0:	       ldx	$mem, 0 -> r1   ; fflush.c:122[ fflush.c:230 ]
	;;
#0:	       brz eq @	r1, .BB19_9
	;;
.BB19_13:                               ; %bb6.i
#0:	       ldi	22 -> r0
	;;
#0:	       cmpeq	r1, r0 -> c1
	;;
#0:	if  c1 br @	.BB19_15
	;;
.BB19_14:                               ; %bb6.i
#0:	       ldi	29 -> r0
	;;
#0:	       cmpne	r1, r0 -> c1
	;;
#0:	if  c1 br @	.BB19_31
	;;
.BB19_15:                               ; %bb9.i
#0:	       ldga	_impure_data -> r1 ; fflush.c:128[ fflush.c:230 ]
#1:	       br	.BB19_35
#2:	       ldi	0 -> r0
	;;
#0:	       stm.a	r12, r1, 0      ; fflush.c:128[ fflush.c:230 ]
	;;
	       nop	0
	;;
.BB19_16:                               ; %bb13.i
#0:	       ldm.f	r10, 4          ; fflush.c:139[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r2   ; fflush.c:139[ fflush.c:230 ]
#1:	       ldm.f	r10, 48         ; fflush.c:140[ fflush.c:230 ]
	;;
#0:	       sub	r0, r2 -> r2    ; fflush.c:139[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; fflush.c:140[ fflush.c:230 ]
	;;
#0:	       brz eq @	r1, .BB19_18    ; fflush.c:140[ fflush.c:230 ]
	;;
.BB19_17:                               ; %bb14.i
#0:	       ldm.f	r10, 60         ; fflush.c:141[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; fflush.c:141[ fflush.c:230 ]
	;;
#0:	       sub	r2, r0 -> r2    ; fflush.c:141[ fflush.c:230 ]
	;;
.BB19_18:                               ; %bb15.i
#0:	       ldm.f	r10, 40         ; fflush.c:149[ fflush.c:230 ]
#1:	       ldga	_impure_data -> r0 ; fflush.c:149[ fflush.c:230 ]
#2:	       ldi	0 -> r3
	;;
#0:	       ldx	$mem, 0 -> r4   ; fflush.c:149[ fflush.c:230 ]
#1:	       ldm.f	r10, 28         ; fflush.c:149[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; fflush.c:149[ fflush.c:230 ]
	;;
#0:	       jop	call	r4      ; fflush.c:149[ fflush.c:230 ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       cmpne	r0, -1 -> c1    ; fflush.c:150[ fflush.c:230 ]
	;;
#0:	if  c1 br @	.BB19_21
	;;
.BB19_19:                               ; %bb16.i
#0:	       ldmg.d	_impure_data    ; fflush.c:150[ fflush.c:230 ]
#1:	       ldi	29 -> r1
	;;
#0:	       ldx	$mem, 0 -> r3   ; fflush.c:150[ fflush.c:230 ]
	;;
#0:	       cmpult	r1, r3 -> c1
	;;
#0:	if  c1 br @	.BB19_31
	;;
.BB19_20:                               ; %bb16.i
#0:	       ldiu	1 -> r2
#1:	       ldi	1 -> r1
	;;
#0:	       ldim	0 -> r2
#1:	       sl	r1, r3 -> r1
	;;
#0:	       ldih	258 -> r2
	;;
#0:	       and	r1, r2 -> r1
	;;
#0:	       brz ne @	r1, .BB19_21
	;;
#0:	       brz eq @	r1, .BB19_31
	;;
.BB19_21:                               ; %bb19.i
#0:	       ldm.f	r10, 12         ; fflush.c:155[ fflush.c:230 ]
#1:	       ldiu	2047 -> r1
	;;
#0:	       ldim	30 -> r1
	;;
#0:	       ldx	$memhu, r11 -> r2 ; fflush.c:155[ fflush.c:230 ]
	;;
#0:	       and	r2, r1 -> r1    ; fflush.c:155[ fflush.c:230 ]
#1:	       btest	r2, 12 -> c1    ; fflush.c:158[ fflush.c:230 ]
	;;
#0:	       stmh.a	r1, r10, 6      ; fflush.c:155[ fflush.c:230 ]
	;;
#0:	       stm.a	0, r10, 1       ; fflush.c:156[ fflush.c:230 ]
	;;
#0:	if !c1 br	.BB19_23
#1:	       ldm.f	r10, 16         ; fflush.c:157[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; fflush.c:157[ fflush.c:230 ]
	;;
#0:	       stm.a	r1, r10, 0      ; fflush.c:157[ fflush.c:230 ]
	;;
.BB19_22:                               ; %bb20.i
#0:	       ldmg.d	_impure_data    ; fflush.c:158[ fflush.c:230 ]
#1:	       cmpne	r0, -1 -> c2
	;;
#0:	       ldx	$mem, 0 -> r1   ; fflush.c:158[ fflush.c:230 ]
	;;
#0:	       cmpeq	r1, 0 -> c1     ; fflush.c:158[ fflush.c:230 ]
	;;
#0:	       comb	or c1, c2 -> c1
	;;
#0:	if  c1 stm.a	r0, r10, 20     ; fflush.c:159[ fflush.c:230 ]
	;;
.BB19_23:                               ; %bb23.i
#0:	       ldga	_impure_data -> r0 ; fflush.c:160[ fflush.c:230 ]
	;;
#0:	       stm.a	r12, r0, 0      ; fflush.c:160[ fflush.c:230 ]
#1:	       ldi	0 -> r0
	;;
#0:	       ldm.f	r10, 48         ; fflush.c:161[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; fflush.c:161[ fflush.c:230 ]
	;;
#0:	       brz eq @	r1, .BB19_35    ; fflush.c:161[ fflush.c:230 ]
	;;
.BB19_24:                               ; %bb24.i
#0:	       s2add	r10, 16 -> r0
	;;
#0:	       cmpeq	r1, r0 -> c1    ; fflush.c:162[ fflush.c:230 ]
	;;
#0:	if  c1 br @	.BB19_26
	;;
.BB19_25:                               ; %bb25.i
#0:	       or	r1, 0 -> r0     ; fflush.c:162[ fflush.c:230 ]
#1:	       callg	__free_r        ; fflush.c:162[ fflush.c:230 ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB19_26:                               ; %bb26.i
#0:	       ldi	0 -> r0
#1:	       br @	.BB19_35
#2:	       stm.a	0, r10, 12      ; fflush.c:162[ fflush.c:230 ]
	;;
.BB19_27:                               ; %bb29.i
#0:	       ldm.f	r10, 16         ; fflush.c:172[ fflush.c:230 ]
#1:	       ldi	0 -> r0
	;;
#0:	       ldx	$mem, 0 -> r14  ; fflush.c:172[ fflush.c:230 ]
	;;
#0:	       brz eq @	r14, .BB19_35   ; fflush.c:172[ fflush.c:230 ]
	;;
.BB19_28:                               ; %bb31.i
#0:	       ldm.f	r10, 0          ; fflush.c:177[ fflush.c:230 ]
#1:	       ldi	0 -> r13
#2:	       ldi	0 -> r0
#3:	       and	r1, 3 -> r1     ; fflush.c:185[ fflush.c:230 ]
	;;
#0:	       brz ne @	r1, .BB19_30    ; fflush.c:185[ fflush.c:230 ]
#1:	       ldx	$mem, 0 -> r2   ; fflush.c:177[ fflush.c:230 ]
#2:	       stm.a	r14, r10, 0     ; fflush.c:184[ fflush.c:230 ]
	;;
.BB19_29:                               ; %bb32.i
#0:	       ldm.f	r10, 20         ; fflush.c:185[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; fflush.c:185[ fflush.c:230 ]
	;;
.BB19_30:                               ; %bb34.i
#0:	       sub	r2, r14 -> r12  ; fflush.c:177[ fflush.c:230 ]
#1:	       br @	.BB19_34
#2:	       stm.a	r0, r10, 2      ; fflush.c:185[ fflush.c:230 ]
	;;
.BB19_31:                               ; %bb10.i
#0:	       ldm.f	r10, 12         ; fflush.c:131[ fflush.c:230 ]
#1:	       ldi	64 -> r1
#2:	       ldi	-1 -> r0
	;;
#0:	       br	.BB19_35
#1:	       ldx	$memhu, r11 -> r2 ; fflush.c:131[ fflush.c:230 ]
	;;
#0:	       or	r2, r1 -> r1    ; fflush.c:131[ fflush.c:230 ]
	;;
#0:	       stmh.a	r1, r10, 6      ; fflush.c:131[ fflush.c:230 ]
	;;
.BB19_32:                               ; %bb35.i
                                        ;   in Loop: Header=BB19_34 Depth=1
#0:	       ldm.f	r10, 36         ; fflush.c:189[ fflush.c:230 ]
#1:	       ldga	_impure_data -> r0 ; fflush.c:189[ fflush.c:230 ]
#2:	       or	r14, 0 -> r2    ; fflush.c:189[ fflush.c:230 ]
#3:	       or	r12, 0 -> r3    ; fflush.c:189[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r4   ; fflush.c:189[ fflush.c:230 ]
#1:	       ldm.f	r10, 28         ; fflush.c:189[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; fflush.c:189[ fflush.c:230 ]
	;;
#0:	       jop	call	r4      ; fflush.c:189[ fflush.c:230 ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       cmplt	r13, r0 -> c1   ; fflush.c:190[ fflush.c:230 ]
	;;
#0:	if !c1 br @	.BB19_31
	;;
.BB19_33:                               ; %bb37.i
                                        ;   in Loop: Header=BB19_34 Depth=1
#0:	       add	r14, r0 -> r14  ; fflush.c:195[ fflush.c:230 ]
#1:	       sub	r12, r0 -> r12  ; fflush.c:196[ fflush.c:230 ]
	;;
.BB19_34:                               ; %bb38.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldi	0 -> r0
	;;
#0:	       cmplt	r0, r12 -> c1   ; fflush.c:187[ fflush.c:230 ]
	;;
#0:	if  c1 br @	.BB19_32
	;;
.BB19_35:                               ; %__sflush_r.exit
#0:	       ldm.s	r15, 4          ; fflush.c:232
	;;
#0:	       ldx	$mem, 0 -> r1   ; fflush.c:232
	;;
#0:	       stx	r1 -> $ro       ; fflush.c:232
	;;
#0:	       ldm.s	r15, 8          ; fflush.c:232
	;;
#0:	       ldx	$mem, 0 -> r1   ; fflush.c:232
	;;
#0:	       stx	r1 -> $rb       ; fflush.c:232
	;;
#0:	       ldm.s	r15, 12         ; fflush.c:232
	;;
#0:	       ldx	$mem, 0 -> r14  ; fflush.c:232
	;;
#0:	       ldm.s	r15, 16         ; fflush.c:232
	;;
#0:	       ldx	$mem, 0 -> r13  ; fflush.c:232
	;;
#0:	       ldm.s	r15, 20         ; fflush.c:232
	;;
#0:	       ldx	$mem, 0 -> r12  ; fflush.c:232
	;;
#0:	       ldm.s	r15, 24         ; fflush.c:232
	;;
#0:	       ldx	$mem, 0 -> r11  ; fflush.c:232
	;;
#0:	       ldm.s	r15, 28         ; fflush.c:232
#1:	       s2add	r15, 12 -> r15  ; fflush.c:232
	;;
#0:	       jop	ret             ; fflush.c:232
#1:	       ldx	$mem, 0 -> r10  ; fflush.c:232
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
__fflush_r_end:

	.align	4
__free_r:                               ; @_free_r
	.size	__free_r_end-__free_r
__free_r_start:
; BB#0:                                 ; %entry
#0:	       wb.s	r15, 6          ; mallocr.c:2644
#1:	       brz eq @	r0, .BB20_15    ; mallocr.c:2644
#2:	       sub	r15, 24 -> r15  ; mallocr.c:2644
	;;
.BB20_1:                                ; %bb
#0:	       ldm.f	r0, -4          ; mallocr.c:2650
#1:	       ldi	-2 -> r1
#2:	       sub	r0, 8 -> r2     ; mallocr.c:2649
	;;
#0:	       ldx	$mem, 0 -> r8   ; mallocr.c:2650
	;;
#0:	       and	r8, r1 -> r5    ; mallocr.c:2663
#1:	       ldi	-4 -> r1
	;;
#0:	       sub	r5, 4 -> r6
#1:	       add	r5, r0 -> r1.16 ; mallocr.c:2649
	;;
#0:	       add	r0, r6 -> r7
	;;
#0:	       ldm.f	r7, 0           ; mallocr.c:2665
	;;
#0:	       ldx	$mem, 0 -> r3   ; mallocr.c:2665
#1:	       ldmg.d	___malloc_av_+8 ; mallocr.c:2667
	;;
#0:	       and	r3, r1 -> r4    ; mallocr.c:2665
#1:	       sub	r1.16, 8 -> r1  ; mallocr.c:2664
	;;
#0:	       ldx	$mem, 0 -> r3   ; mallocr.c:2667
	;;
#0:	       cmpne	r3, r1 -> c1    ; mallocr.c:2667
	;;
#0:	if  c1 br @	.BB20_16
	;;
.BB20_2:                                ; %bb1
#0:	       btest	r8, 0 -> c1     ; mallocr.c:2671
#1:	       add	r4, r5 -> r4    ; mallocr.c:2669
	;;
#0:	if  c1 br @	.BB20_4
	;;
.BB20_3:                                ; %bb2
#0:	       ldm.f	r0, -8          ; mallocr.c:2673
#1:	       ldi	-8 -> r1
	;;
#0:	       ldx	$mem, 0 -> r3   ; mallocr.c:2673
	;;
#0:	       sub	r1, r3 -> r1
#1:	       add	r3, r4 -> r4    ; mallocr.c:2675
	;;
#0:	       add	r0, r1 -> r2    ; mallocr.c:2674
	;;
#0:	       ldm.f	r2, 8           ; mallocr.c:2676
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:2676
#1:	       ldm.f	r2, 12          ; mallocr.c:2676
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2676
	;;
#0:	       stm.a	r0, r1, 3       ; mallocr.c:2676
	;;
#0:	       stm.a	r1, r0, 2       ; mallocr.c:2676
	;;
.BB20_4:                                ; %bb3
#0:	       ldga	131072 -> r1
#1:	       or	r4, 1 -> r3     ; mallocr.c:2679
#2:	       ldga	___malloc_av_ -> r0 ; mallocr.c:2680
	;;
#0:	       cmpult	r4, r1 -> c1    ; mallocr.c:2681
#1:	       stm.a	r3, r2, 1       ; mallocr.c:2679
	;;
#0:	if  c1 br @	.BB20_15
#1:	       stm.a	r2, r0, 2       ; mallocr.c:2680
	;;
.BB20_5:                                ; %bb4
#0:	       ldm.f	r2, 4           ; mallocr.c:3319[ mallocr.c:2682 ]
#1:	       ldi	-4 -> r0
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:3319[ mallocr.c:2682 ]
	;;
#0:	       and	r1, r0 -> r5    ; mallocr.c:3319[ mallocr.c:2682 ]
#1:	       ldiu	0 -> r0
	;;
#0:	       sub	r5, 17 -> r1
#1:	       ldim	2046 -> r0
	;;
#0:	       and	r1, r0 -> r4
#1:	       ldga	4096 -> r0
	;;
#0:	       cmplt	r4, r0 -> c1    ; mallocr.c:3322[ mallocr.c:2682 ]
	;;
#0:	if  c1 br @	.BB20_15
	;;
.BB20_6:                                ; %bb1.i
#0:	       ldmg.d	_heap_end.1081  ; sbrk.c:14[ sbrkr.c:60[ mallocr.c:3331[ mallocr.c:2682 ] ] ]
	;;
#2:	       ldx	$mem, 0 -> r2.16 ; sbrk.c:14[ sbrkr.c:60[ mallocr.c:3331[ mallocr.c:2682 ] ] ]
	;;
#2:	       brz ne @	r2.16, .BB20_8  ; sbrk.c:14[ sbrkr.c:60[ mallocr.c:3331[ mallocr.c:2682 ] ] ]
	;;
.BB20_7:                                ; %bb.i.i.i
#2:	       ldga	_end -> r2.16   ; sbrk.c:15[ sbrkr.c:60[ mallocr.c:3331[ mallocr.c:2682 ] ] ]
#0:	       ldga	_heap_end.1081 -> r0 ; sbrk.c:15[ sbrkr.c:60[ mallocr.c:3331[ mallocr.c:2682 ] ] ]
	;;
#2:	       stm.a	r2.16, r0, 0    ; sbrk.c:15[ sbrkr.c:60[ mallocr.c:3331[ mallocr.c:2682 ] ] ]
	;;
.BB20_8:                                ; %_sbrk.exit.i.i
#0:	       add	r2, r5 -> r0    ; mallocr.c:3332[ mallocr.c:2682 ]
#1:	       ldga	_heap_end.1081 -> r3 ; sbrk.c:18[ sbrkr.c:60[ mallocr.c:3331[ mallocr.c:2682 ] ] ]
	;;
#2:	       cmpne	r0, r2.16 -> c1 ; mallocr.c:3332[ mallocr.c:2682 ]
	;;
#0:	if  c1 br @	.BB20_15
#2:	       stm.a	r2.16, r3, 0    ; sbrk.c:18[ sbrkr.c:60[ mallocr.c:3331[ mallocr.c:2682 ] ] ]
	;;
.BB20_9:                                ; %_sbrk.exit.i9.i
#2:	       cmpne	r2.16, -1 -> c1 ; sbrkr.c:60[ mallocr.c:3340[ mallocr.c:2682 ] ]
	;;
#0:	if  c1 br	.BB20_14
#2:	       sub	r2.16, r4 -> r1 ; sbrk.c:18[ sbrkr.c:60[ mallocr.c:3340[ mallocr.c:2682 ] ] ]
	;;
#0:	       stm.a	r1, r3, 0       ; sbrk.c:18[ sbrkr.c:60[ mallocr.c:3340[ mallocr.c:2682 ] ] ]
	;;
	       nop	0
	;;
.BB20_10:                               ; %bb4.i
#0:	       brz ne @	r1, .BB20_12    ; sbrk.c:14[ sbrkr.c:60[ mallocr.c:3345[ mallocr.c:2682 ] ] ]
	;;
.BB20_11:                               ; %bb.i.i1.i
#0:	       ldga	_end -> r1      ; sbrk.c:15[ sbrkr.c:60[ mallocr.c:3345[ mallocr.c:2682 ] ] ]
#1:	       ldga	_heap_end.1081 -> r0 ; sbrk.c:15[ sbrkr.c:60[ mallocr.c:3345[ mallocr.c:2682 ] ] ]
	;;
#0:	       stm.a	r1, r0, 0       ; sbrk.c:15[ sbrkr.c:60[ mallocr.c:3345[ mallocr.c:2682 ] ] ]
	;;
.BB20_12:                               ; %_sbrk.exit.i2.i
#0:	       sub	r1, r2 -> r4    ; mallocr.c:3346[ mallocr.c:2682 ]
#1:	       ldi	16 -> r0
#2:	       ldga	_heap_end.1081 -> r3 ; sbrk.c:18[ sbrkr.c:60[ mallocr.c:3345[ mallocr.c:2682 ] ] ]
	;;
#0:	       cmplt	r4, r0 -> c1    ; mallocr.c:3347[ mallocr.c:2682 ]
#1:	       stm.a	r1, r3, 0       ; sbrk.c:18[ sbrkr.c:60[ mallocr.c:3345[ mallocr.c:2682 ] ] ]
	;;
#0:	if  c1 br @	.BB20_15
	;;
.BB20_13:                               ; %bb5.i
#0:	       ldmg.d	___malloc_sbrk_base ; mallocr.c:3349[ mallocr.c:2682 ]
#1:	       ldga	___malloc_current_mallinfo.0 -> r3 ; mallocr.c:3349[ mallocr.c:2682 ]
#2:	       add	r15, 24 -> r15  ; mallocr.c:2722
	;;
#0:	       jop	ret             ; mallocr.c:2722
#1:	       ldx	$mem, 0 -> r0   ; mallocr.c:3349[ mallocr.c:2682 ]
	;;
#0:	       sub	r1, r0 -> r1    ; mallocr.c:3349[ mallocr.c:2682 ]
#1:	       or	r4, 1 -> r0     ; mallocr.c:3350[ mallocr.c:2682 ]
	;;
#0:	       stm.a	r1, r3, 0       ; mallocr.c:3349[ mallocr.c:2682 ]
	;;
#0:	       stm.a	r0, r2, 1       ; mallocr.c:3350[ mallocr.c:2682 ]
	;;
.BB20_14:                               ; %bb7.i
#0:	       sub	r5, r4 -> r0    ; mallocr.c:3360[ mallocr.c:2682 ]
	;;
#0:	       or	r0, 1 -> r0     ; mallocr.c:3360[ mallocr.c:2682 ]
	;;
#0:	       stm.a	r0, r2, 1       ; mallocr.c:3360[ mallocr.c:2682 ]
#1:	       ldga	___malloc_current_mallinfo.0 -> r0 ; mallocr.c:3361[ mallocr.c:2682 ]
	;;
#0:	       ldmg.d	___malloc_current_mallinfo.0 ; mallocr.c:3361[ mallocr.c:2682 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:3361[ mallocr.c:2682 ]
	;;
#0:	       sub	r1, r4 -> r1    ; mallocr.c:3361[ mallocr.c:2682 ]
	;;
#0:	       stm.a	r1, r0, 0       ; mallocr.c:3361[ mallocr.c:2682 ]
	;;
.BB20_15:                               ; %bb5
#0:	       add	r15, 24 -> r15  ; mallocr.c:2722
#1:	       jop	ret             ; mallocr.c:2722
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB20_16:                               ; %bb6
#0:	       btest	r8, 0 -> c1     ; mallocr.c:2691
#1:	       stm.a	r4, r7, 0       ; mallocr.c:2687
	;;
#0:	if !c1 br @	.BB20_18
	;;
.BB20_17:
#0:	       ldi	0 -> r9
#1:	       br @	.BB20_19
#2:	       or	r5, 0 -> r3
	;;
.BB20_18:                               ; %bb7
#0:	       ldm.f	r0, -8          ; mallocr.c:2693
#1:	       ldi	-8 -> r1
#2:	       ldi	1 -> r9
	;;
#0:	       ldx	$mem, 0 -> r3   ; mallocr.c:2693
	;;
#0:	       sub	r1, r3 -> r7
#1:	       ldga	___malloc_av_ -> r1 ; mallocr.c:2697
#2:	       add	r3, r5 -> r3    ; mallocr.c:2695
	;;
#0:	       add	r0, r7 -> r2    ; mallocr.c:2694
#1:	       add	r1, 8 -> r1     ; mallocr.c:2697
	;;
#0:	       ldm.f	r2, 8           ; mallocr.c:2697
	;;
#0:	       ldx	$mem, 0 -> r8   ; mallocr.c:2697
	;;
#0:	       cmpeq	r8, r1 -> c1    ; mallocr.c:2697
	;;
#0:	if !c1 add	r7, r0 -> r1
#1:	if !c1 ldi	0 -> r9
	;;
#0:	if !c1 ldm.f	r1, 12          ; mallocr.c:2700
	;;
#0:	if !c1 ldx	$mem, 0 -> r1   ; mallocr.c:2700
	;;
#0:	if !c1 stm.a	r1, r8, 3       ; mallocr.c:2700
	;;
#0:	if !c1 stm.a	r8, r1, 2       ; mallocr.c:2700
	;;
.BB20_19:                               ; %bb10
#0:	       add	r6, r4 -> r1
	;;
#0:	       add	r0, r1 -> r1
	;;
#0:	       ldm.f	r1, 0           ; mallocr.c:2703
	;;
#0:	       ldx	$membu, r1 -> r1 ; mallocr.c:2703
	;;
#0:	       btest	r1, 0 -> c1     ; mallocr.c:2703
	;;
#0:	if !c1 br @	.BB20_21
	;;
.BB20_20:                               ; %bb10.bb15_crit_edge
#0:	       or	r3, 1 -> r1     ; mallocr.c:2717
#1:	       brz ne	r9, .BB20_15    ; mallocr.c:2719
#2:	       add	r2, r3 -> r0    ; mallocr.c:2718
	;;
#0:	       brz eq	r9, .BB20_23    ; mallocr.c:2719
#1:	       stm.a	r1, r2, 1       ; mallocr.c:2717
	;;
#0:	       stm.a	r3, r0, 0       ; mallocr.c:2718
	;;
	       nop	0
	;;
.BB20_21:                               ; %bb11
#0:	       add	r0, r5 -> r0
#1:	       ldga	___malloc_av_ -> r1 ; mallocr.c:2707
#2:	       cmpeq	r9, 0 -> c2     ; mallocr.c:2707
#3:	       add	r3, r4 -> r3    ; mallocr.c:2705
	;;
#0:	       ldm.f	r0, 0           ; mallocr.c:2707
#1:	       add	r1, 8 -> r0     ; mallocr.c:2707
	;;
#0:	       ldx	$mem, 0 -> r5   ; mallocr.c:2707
	;;
#0:	       cmpeq	r5, r0 -> c1    ; mallocr.c:2707
	;;
#0:	       comb	and c2, c1 -> c1
	;;
#0:	if  c1 br @	.BB20_41
	;;
.BB20_22:                               ; %bb15
#1:	       ldm.f	r1.16, 4        ; mallocr.c:2713
#0:	       or	r3, 1 -> r1     ; mallocr.c:2717
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2713
	;;
#0:	       stm.a	r0, r5, 3       ; mallocr.c:2713
	;;
#0:	       brz ne	r9, .BB20_15    ; mallocr.c:2719
#1:	       stm.a	r5, r0, 2       ; mallocr.c:2713
#2:	       add	r2, r3 -> r0    ; mallocr.c:2718
	;;
#0:	       stm.a	r1, r2, 1       ; mallocr.c:2717
	;;
#0:	       stm.a	r3, r0, 0       ; mallocr.c:2718
	;;
.BB20_23:                               ; %bb16
#0:	       ldi	511 -> r0
	;;
#0:	       cmpult	r0, r3 -> c1    ; mallocr.c:2720
	;;
#0:	if !c1 br @	.BB20_42
	;;
.BB20_24:                               ; %bb20
#0:	       ldiu	511 -> r1
#1:	       ldiu	511 -> r0
	;;
#0:	       ldim	1 -> r1
	;;
#0:	       cmpult	r1, r3 -> c1    ; mallocr.c:2720
	;;
#0:	if  c1 br @	.BB20_26
	;;
.BB20_25:                               ; %bb21
#0:	       sr	r3, 6 -> r0     ; mallocr.c:2720
#1:	       br	.BB20_33
	;;
#0:	       s2add	r0, 14 -> r4    ; mallocr.c:2720
	;;
	       nop	0
	;;
.BB20_26:                               ; %bb22
#0:	       ldim	5 -> r0
	;;
#0:	       cmpult	r0, r3 -> c1    ; mallocr.c:2720
	;;
#0:	if  c1 br @	.BB20_28
	;;
.BB20_27:                               ; %bb23
#0:	       sr	r3, 9 -> r1     ; mallocr.c:2720
#1:	       br	.BB20_33
#2:	       ldi	91 -> r0
	;;
#0:	       add	r1, r0 -> r4    ; mallocr.c:2720
	;;
	       nop	0
	;;
.BB20_28:                               ; %bb24
#0:	       ldiu	511 -> r1
#1:	       ldiu	511 -> r0
	;;
#0:	       ldim	21 -> r1
	;;
#0:	       cmpult	r1, r3 -> c1    ; mallocr.c:2720
	;;
#0:	if  c1 br @	.BB20_30
	;;
.BB20_29:                               ; %bb25
#0:	       sr	r3, 12 -> r1    ; mallocr.c:2720
#1:	       br	.BB20_33
#2:	       ldi	110 -> r0
	;;
#0:	       add	r1, r0 -> r4    ; mallocr.c:2720
	;;
	       nop	0
	;;
.BB20_30:                               ; %bb26
#0:	       ldim	85 -> r0
	;;
#0:	       cmpult	r0, r3 -> c1    ; mallocr.c:2720
	;;
#0:	if  c1 br @	.BB20_32
	;;
.BB20_31:                               ; %bb27
#0:	       sr	r3, 15 -> r1    ; mallocr.c:2720
#1:	       br	.BB20_33
#2:	       ldi	119 -> r0
	;;
#0:	       add	r1, r0 -> r4    ; mallocr.c:2720
	;;
	       nop	0
	;;
.BB20_32:                               ; %bb28
#0:	       ldiu	511 -> r0
#1:	       ldi	126 -> r4
	;;
#0:	       ldim	341 -> r0
	;;
#0:	       cmpult	r0, r3 -> c1    ; mallocr.c:2720
	;;
#0:	if !c1 sr	r3, 18 -> r0    ; mallocr.c:2720
	;;
#0:	if !c1 s2add	r0, 31 -> r4    ; mallocr.c:2720
	;;
.BB20_33:                               ; %bb36
#0:	       ldga	___malloc_av_ -> r1
#1:	       sl	r4, 3 -> r0
	;;
#0:	       add	r1, r0 -> r5
	;;
#0:	       ldm.f	r5, 8           ; mallocr.c:2720
	;;
#0:	       ldx	$mem, 0 -> r6   ; mallocr.c:2720
	;;
#0:	       cmpne	r6, r5 -> c1    ; mallocr.c:2720
	;;
#0:	if !c1 br @	.BB20_35
	;;
.BB20_34:
#0:	       ldi	-4 -> r1
#1:	       br @	.BB20_37
	;;
.BB20_35:                               ; %bb37
#0:	       sra	r4, 31 -> r0    ; mallocr.c:2720
#1:	       ldmg.d	___malloc_av_+4 ; mallocr.c:2720
	;;
#0:	       sr	r0, 30 -> r0    ; mallocr.c:2720
	;;
#0:	       add	r4, r0 -> r0    ; mallocr.c:2720
#1:	       ldi	1 -> r4
#2:	       ldx	$mem, 0 -> r3   ; mallocr.c:2720
	;;
#0:	       sra	r0, 2 -> r0     ; mallocr.c:2720
	;;
#0:	       br	.BB20_40
#1:	       sl	r4, r0 -> r0    ; mallocr.c:2720
	;;
#0:	       or	r0, r3 -> r0    ; mallocr.c:2720
	;;
#0:	       stm.a	r0, r1, 1
	;;
.BB20_36:                               ; %bb38
                                        ;   in Loop: Header=BB20_37 Depth=1
#0:	       ldm.f	r6, 8           ; mallocr.c:2720
	;;
#0:	       ldx	$mem, 0 -> r6   ; mallocr.c:2720
	;;
.BB20_37:                               ; %bb39
                                        ; =>This Inner Loop Header: Depth=1
#0:	       cmpeq	r6, r5 -> c1    ; mallocr.c:2720
	;;
#0:	if  c1 br @	.BB20_39
	;;
.BB20_38:                               ; %bb40
                                        ;   in Loop: Header=BB20_37 Depth=1
#0:	       ldm.f	r6, 4           ; mallocr.c:2720
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2720
	;;
#0:	       and	r0, r1 -> r0    ; mallocr.c:2720
	;;
#0:	       cmpult	r3, r0 -> c1    ; mallocr.c:2720
	;;
#0:	if  c1 br @	.BB20_36
	;;
.BB20_39:                               ; %bb41
#0:	       ldm.f	r6, 12          ; mallocr.c:2720
	;;
#0:	       ldx	$mem, 0 -> r5   ; mallocr.c:2720
	;;
.BB20_40:                               ; %bb42
#0:	       stm.a	r5, r2, 3       ; mallocr.c:2720
#1:	       add	r15, 24 -> r15  ; mallocr.c:2722
	;;
#0:	       stm.a	r6, r2, 2       ; mallocr.c:2720
	;;
#0:	       stm.a	r2, r5, 2       ; mallocr.c:2720
	;;
#0:	       stm.a	r2, r6, 3       ; mallocr.c:2720
	;;
#0:	       jop	ret             ; mallocr.c:2722
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB20_41:                               ; %bb15.thread
#0:	       stm.a	r2, r1, 5       ; mallocr.c:2710
#1:	       add	r15, 24 -> r15  ; mallocr.c:2722
	;;
#0:	       stm.a	r2, r1, 4       ; mallocr.c:2710
#1:	       or	r3, 1 -> r1     ; mallocr.c:2717
	;;
#0:	       stm.a	r0, r2, 3       ; mallocr.c:2710
	;;
#0:	       stm.a	r0, r2, 2       ; mallocr.c:2710
#1:	       add	r2, r3 -> r0    ; mallocr.c:2718
	;;
#0:	       stm.a	r1, r2, 1       ; mallocr.c:2717
	;;
#0:	       stm.a	r3, r0, 0       ; mallocr.c:2718
	;;
#0:	       jop	ret             ; mallocr.c:2722
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB20_42:                               ; %bb17
#0:	       ldmg.d	___malloc_av_+4 ; mallocr.c:2720
#1:	       ldi	1 -> r1
#2:	       sr	r3, 5 -> r0
#3:	       ldi	-8 -> r5
	;;
#0:	       sl	r1, r0 -> r0    ; mallocr.c:2720
#1:	       ldga	___malloc_av_ -> r1 ; mallocr.c:2720
#2:	       add	r15, 24 -> r15  ; mallocr.c:2722
	;;
#0:	       ldx	$mem, 0 -> r4   ; mallocr.c:2720
	;;
#0:	       or	r4, r0 -> r4    ; mallocr.c:2720
#1:	       and	r3, r5 -> r0
	;;
#0:	       stm.a	r4, r1, 1
#1:	       add	r1, r0 -> r1
	;;
#0:	       ldm.f	r1, 8           ; mallocr.c:2720
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2720
#1:	       stm.a	r1, r2, 3       ; mallocr.c:2720
	;;
#0:	       stm.a	r0, r2, 2       ; mallocr.c:2720
	;;
#0:	       stm.a	r2, r1, 2       ; mallocr.c:2720
	;;
#0:	       stm.a	r2, r0, 3       ; mallocr.c:2720
	;;
#0:	       jop	ret             ; mallocr.c:2722
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
__free_r_end:

	.align	4
__malloc_r:                             ; @_malloc_r
	.size	__malloc_r_end-__malloc_r
__malloc_r_start:
; BB#0:                                 ; %entry
#0:	       ldiu	32 -> r3
#1:	       wb.s	r15, 8
#2:	       ldi	22 -> r2
#3:	       add	r0, 11 -> r1    ; mallocr.c:2348
	;;
#0:	       sub	r15, r3 -> r15
#1:	       cmpult	r2, r1 -> c1    ; mallocr.c:2348
#2:	       ldi	-8 -> r2
#3:	       ldx	$rb, 0 -> r3
	;;
#0:	       stm.s	r10, r15, 3
#1:	       ldi	16 -> r10
	;;
#0:	if  c1 and	r1, r2 -> r10
#1:	       stm.s	r3, r15, 2
#2:	       ldx	$ro, 0 -> r3
	;;
#0:	       cmplt	r10, 0 -> c2    ; mallocr.c:2351
#1:	       cmpult	r10, r0 -> c1   ; mallocr.c:2351
#2:	       stm.s	r3, r15, 1
	;;
#0:	       comb	or c2, c1 -> c1
	;;
#0:	if !c1 br @	.BB21_2
	;;
.BB21_1:                                ; %bb4
#0:	       ldga	_impure_data -> r0 ; mallocr.c:2353
#1:	       br	.BB21_97
	;;
#0:	       stm.a	12, r0, 0       ; mallocr.c:2353
	;;
	       nop	0
	;;
.BB21_2:                                ; %bb5
#0:	       ldi	503 -> r0
	;;
#0:	       cmpult	r0, r10 -> c1   ; mallocr.c:2361
	;;
#0:	if  c1 br @	.BB21_6
	;;
.BB21_3:                                ; %bb6
#0:	       ldi	-4 -> r0
#1:	       ldga	___malloc_av_ -> r1
	;;
#0:	       and	r10, r0 -> r0
	;;
#0:	       add	r1, r0 -> r0
	;;
#0:	       ldm.f	r0, 12          ; mallocr.c:2368
	;;
#0:	       ldx	$mem, 0 -> r4   ; mallocr.c:2368
	;;
#0:	       cmpne	r4, r0 -> c1    ; mallocr.c:2372
	;;
#0:	if !c1 sr	r10, 2 -> r0
	;;
#0:	if !c1 s2add	r1, r0 -> r0
	;;
#0:	if !c1 ldm.f	r0, 20          ; mallocr.c:2375
#1:	if !c1 add	r0, 8 -> r0
	;;
#0:	if !c1 ldx	$mem, 0 -> r4   ; mallocr.c:2375
	;;
#0:	       cmpeq	r4, r0 -> c1    ; mallocr.c:2378
	;;
#0:	if  c1 br @	.BB21_5
	;;
.BB21_4:                                ; %bb9
#0:	       ldm.f	r4, 4           ; mallocr.c:2380
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2380
#1:	       ldm.f	r4, 8           ; mallocr.c:2381
	;;
#0:	       add	r0, 4 -> r1
#1:	       ldi	-4 -> r0
	;;
#0:	       ldx	$mem, 0 -> r3   ; mallocr.c:2381
#1:	       ldm.f	r4, 12          ; mallocr.c:2381
#2:	       and	r1, r0 -> r0
	;;
#0:	       add	r4, r0 -> r1
#1:	       add	r4, 8 -> r0     ; mallocr.c:2381
	;;
#0:	       ldx	$mem, 0 -> r2   ; mallocr.c:2381
	;;
#0:	       stm.a	r2, r3, 3       ; mallocr.c:2381
	;;
#0:	       stm.a	r3, r2, 2       ; mallocr.c:2381
	;;
#0:	       ldm.f	r1, 0           ; mallocr.c:2382
	;;
#0:	       br	.BB21_98
#1:	       ldx	$mem, 0 -> r2   ; mallocr.c:2382
	;;
#0:	       or	r2, 1 -> r2     ; mallocr.c:2382
	;;
#0:	       stm.a	r2, r1, 0       ; mallocr.c:2382
	;;
.BB21_5:                                ; %bb10
#0:	       sr	r10, 3 -> r0    ; mallocr.c:2363
#1:	       br	.BB21_24
	;;
#0:	       add	r0, 2 -> r1     ; mallocr.c:2388
	;;
	       nop	0
	;;
.BB21_6:                                ; %bb11
#0:	       ldi	511 -> r0
	;;
#0:	       cmpult	r0, r10 -> c1   ; mallocr.c:2393
	;;
#0:	if  c1 br @	.BB21_8
	;;
.BB21_7:                                ; %bb12
#0:	       sr	r10, 3 -> r6    ; mallocr.c:2393
#1:	       br @	.BB21_17
	;;
.BB21_8:                                ; %bb13
#0:	       ldiu	511 -> r1
#1:	       ldiu	511 -> r0
	;;
#0:	       ldim	1 -> r1
	;;
#0:	       cmpult	r1, r10 -> c1   ; mallocr.c:2393
	;;
#0:	if  c1 br @	.BB21_10
	;;
.BB21_9:                                ; %bb14
#0:	       sr	r10, 6 -> r0    ; mallocr.c:2393
#1:	       br	.BB21_17
	;;
#0:	       s2add	r0, 14 -> r6    ; mallocr.c:2393
	;;
	       nop	0
	;;
.BB21_10:                               ; %bb15
#0:	       ldim	5 -> r0
	;;
#0:	       cmpult	r0, r10 -> c1   ; mallocr.c:2393
	;;
#0:	if  c1 br @	.BB21_12
	;;
.BB21_11:                               ; %bb16
#0:	       sr	r10, 9 -> r1    ; mallocr.c:2393
#1:	       br	.BB21_17
#2:	       ldi	91 -> r0
	;;
#0:	       add	r1, r0 -> r6    ; mallocr.c:2393
	;;
	       nop	0
	;;
.BB21_12:                               ; %bb17
#0:	       ldiu	511 -> r1
#1:	       ldiu	511 -> r0
	;;
#0:	       ldim	21 -> r1
	;;
#0:	       cmpult	r1, r10 -> c1   ; mallocr.c:2393
	;;
#0:	if  c1 br @	.BB21_14
	;;
.BB21_13:                               ; %bb18
#0:	       sr	r10, 12 -> r1   ; mallocr.c:2393
#1:	       br	.BB21_17
#2:	       ldi	110 -> r0
	;;
#0:	       add	r1, r0 -> r6    ; mallocr.c:2393
	;;
	       nop	0
	;;
.BB21_14:                               ; %bb19
#0:	       ldim	85 -> r0
	;;
#0:	       cmpult	r0, r10 -> c1   ; mallocr.c:2393
	;;
#0:	if  c1 br @	.BB21_16
	;;
.BB21_15:                               ; %bb20
#0:	       sr	r10, 15 -> r1   ; mallocr.c:2393
#1:	       br	.BB21_17
#2:	       ldi	119 -> r0
	;;
#0:	       add	r1, r0 -> r6    ; mallocr.c:2393
	;;
	       nop	0
	;;
.BB21_16:                               ; %bb21
#0:	       ldiu	511 -> r0
#1:	       ldi	126 -> r6
	;;
#0:	       ldim	341 -> r0
	;;
#0:	       cmpult	r0, r10 -> c1   ; mallocr.c:2393
	;;
#0:	if !c1 sr	r10, 18 -> r0   ; mallocr.c:2393
	;;
#0:	if !c1 s2add	r0, 31 -> r6    ; mallocr.c:2393
	;;
.BB21_17:                               ; %bb29
#0:	       ldga	___malloc_av_ -> r1
#1:	       sl	r6, 3 -> r0
#2:	       ldi	-4 -> r3
#3:	       ldi	16 -> r2
	;;
#0:	       add	r1, r0 -> r4
	;;
#0:	       ldm.f	r4, 12          ; mallocr.c:2396
	;;
#0:	       ldx	$mem, 0 -> r5   ; mallocr.c:2396
	;;
.BB21_18:                               ; %bb35
                                        ; =>This Inner Loop Header: Depth=1
#0:	       or	r5, 0 -> r7
	;;
#0:	       cmpne	r7, r4 -> c1    ; mallocr.c:2396
	;;
#0:	if !c1 br @	.BB21_23
	;;
.BB21_19:                               ; %bb30
                                        ;   in Loop: Header=BB21_18 Depth=1
#0:	       ldm.f	r7, 4           ; mallocr.c:2398
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2398
	;;
#0:	       and	r0, r3 -> r1    ; mallocr.c:2398
	;;
#0:	       sub	r1, r10 -> r0   ; mallocr.c:2399
	;;
#0:	       cmplt	r0, r2 -> c1    ; mallocr.c:2401
	;;
#0:	if !c1 br @	.BB21_22
	;;
.BB21_20:                               ; %bb32
                                        ;   in Loop: Header=BB21_18 Depth=1
#0:	       cmplt	r0, 0 -> c1     ; mallocr.c:2407
#1:	       ldm.f	r7, 12          ; mallocr.c:2409
	;;
#0:	if  c1 br @	.BB21_18
#1:	       ldx	$mem, 0 -> r5   ; mallocr.c:2409
	;;
.BB21_21:                               ; %bb33
#0:	       ldm.f	r7, 8           ; mallocr.c:2409
#1:	       add	r1, r7 -> r1    ; mallocr.c:2409
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2409
	;;
#0:	       stm.a	r5, r0, 3       ; mallocr.c:2409
	;;
#0:	       stm.a	r0, r5, 2       ; mallocr.c:2409
#1:	       add	r7, 8 -> r0     ; mallocr.c:2409
	;;
#0:	       ldm.f	r1, 4           ; mallocr.c:2410
	;;
#0:	       br	.BB21_98
#1:	       ldx	$mem, 0 -> r2   ; mallocr.c:2410
	;;
#0:	       or	r2, 1 -> r2     ; mallocr.c:2410
	;;
#0:	       stm.a	r2, r1, 1       ; mallocr.c:2444
	;;
.BB21_22:                               ; %bb31
#0:	       sub	r6, 1 -> r6
	;;
.BB21_23:                               ; %bb36
#0:	       add	r6, 1 -> r1     ; mallocr.c:2417
	;;
.BB21_24:                               ; %bb37
#0:	       ldmg.d	___malloc_av_+16 ; mallocr.c:2423
#1:	       ldga	___malloc_av_ -> r0 ; mallocr.c:2423
	;;
#0:	       add	r0, 8 -> r0     ; mallocr.c:2423
	;;
#0:	       ldx	$mem, 0 -> r2   ; mallocr.c:2423
	;;
#0:	       cmpeq	r2, r0 -> c1    ; mallocr.c:2423
	;;
#0:	if  c1 br @	.BB21_50
	;;
.BB21_25:                               ; %bb38
#0:	       ldm.f	r2, 4           ; mallocr.c:2425
#1:	       ldi	-4 -> r0
	;;
#0:	       ldx	$mem, 0 -> r4   ; mallocr.c:2425
	;;
#0:	       and	r4, r0 -> r3    ; mallocr.c:2425
#1:	       ldi	16 -> r0
	;;
#0:	       sub	r3, r10 -> r6   ; mallocr.c:2426
	;;
#0:	       cmplt	r6, r0 -> c1    ; mallocr.c:2428
	;;
#0:	if  c1 br @	.BB21_27
	;;
.BB21_26:                               ; %bb39
#0:	       or	r10, 1 -> r0    ; mallocr.c:2431
#1:	       ldga	___malloc_av_ -> r1 ; mallocr.c:2432
#2:	       add	r2, r10 -> r7   ; mallocr.c:2430
#3:	       or	r6, 1 -> r4     ; mallocr.c:2433
	;;
#0:	       stm.a	r0, r2, 1       ; mallocr.c:2431
#1:	       add	r1, 8 -> r5     ; mallocr.c:2432
#2:	       or	r10, 4 -> r0
	;;
#0:	       stm.a	r7, r1, 5       ; mallocr.c:2432
	;;
#0:	       stm.a	r7, r1, 4       ; mallocr.c:2432
#1:	       add	r2, r0 -> r1
#2:	       add	r2, r3 -> r0    ; mallocr.c:2434
	;;
#0:	       stm.a	r5, r7, 3       ; mallocr.c:2432
	;;
#0:	       br	.BB21_98
#1:	       stm.a	r5, r7, 2       ; mallocr.c:2432
	;;
#0:	       stm.a	r4, r1, 0       ; mallocr.c:2433
	;;
#0:	       stm.a	r6, r0, 0       ; mallocr.c:2434
#1:	       add	r2, 8 -> r0
	;;
.BB21_27:                               ; %bb40
#0:	       cmplt	r6, 0 -> c1     ; mallocr.c:2442
#1:	       ldga	___malloc_av_ -> r0 ; mallocr.c:2440
	;;
#0:	if  c1 br	.BB21_29
#1:	       add	r0, 8 -> r5     ; mallocr.c:2440
	;;
#0:	       stm.a	r5, r0, 5       ; mallocr.c:2440
	;;
#0:	       stm.a	r5, r0, 4       ; mallocr.c:2440
	;;
.BB21_28:                               ; %bb41
#0:	       add	r3, r2 -> r1    ; mallocr.c:2444
#1:	       add	r2, 8 -> r0
	;;
#0:	       ldm.f	r1, 4           ; mallocr.c:2444
	;;
#0:	       br	.BB21_98
#1:	       ldx	$mem, 0 -> r3   ; mallocr.c:2444
	;;
#0:	       or	r3, 1 -> r2     ; mallocr.c:2444
	;;
#0:	       stm.a	r2, r1, 1       ; mallocr.c:2444
	;;
.BB21_29:                               ; %bb42
#0:	       ldi	511 -> r0
	;;
#0:	       cmpult	r0, r3 -> c1    ; mallocr.c:2452
	;;
#0:	if  c1 br @	.BB21_31
	;;
.BB21_30:                               ; %bb43
#0:	       ldmg.d	___malloc_av_+4 ; mallocr.c:2452
#1:	       ldi	1 -> r3
#2:	       sr	r4, 5 -> r0
	;;
#0:	       sl	r3, r0 -> r0    ; mallocr.c:2452
#1:	       ldi	-8 -> r3
	;;
#0:	       ldx	$mem, 0 -> r5   ; mallocr.c:2452
#1:	       and	r4, r3 -> r3
	;;
#0:	       or	r5, r0 -> r5    ; mallocr.c:2452
#1:	       ldga	___malloc_av_ -> r0 ; mallocr.c:2452
	;;
#0:	       stm.a	r5, r0, 1
#1:	       add	r0, r3 -> r3
	;;
#0:	       ldm.f	r3, 8           ; mallocr.c:2452
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2452
#1:	       stm.a	r3, r2, 3       ; mallocr.c:2452
	;;
#0:	       br	.BB21_50
#1:	       stm.a	r0, r2, 2       ; mallocr.c:2452
	;;
#0:	       stm.a	r2, r3, 2       ; mallocr.c:2452
	;;
#0:	       stm.a	r2, r0, 3       ; mallocr.c:2452
	;;
.BB21_31:                               ; %bb44
#0:	       cmpult	r0, r4 -> c1    ; mallocr.c:2452
	;;
#0:	if  c1 br @	.BB21_33
	;;
.BB21_32:                               ; %bb45
#0:	       sr	r4, 3 -> r5     ; mallocr.c:2452
#1:	       br @	.BB21_42
	;;
.BB21_33:                               ; %bb46
#0:	       ldiu	511 -> r5
#1:	       ldiu	511 -> r0
	;;
#0:	       ldim	1 -> r5
	;;
#0:	       cmpult	r5, r4 -> c1    ; mallocr.c:2452
	;;
#0:	if  c1 br @	.BB21_35
	;;
.BB21_34:                               ; %bb47
#0:	       sr	r4, 6 -> r0     ; mallocr.c:2452
#1:	       br	.BB21_42
	;;
#0:	       s2add	r0, 14 -> r5    ; mallocr.c:2452
	;;
	       nop	0
	;;
.BB21_35:                               ; %bb48
#0:	       ldim	5 -> r0
	;;
#0:	       cmpult	r0, r4 -> c1    ; mallocr.c:2452
	;;
#0:	if  c1 br @	.BB21_37
	;;
.BB21_36:                               ; %bb49
#0:	       sr	r4, 9 -> r4     ; mallocr.c:2452
#1:	       br	.BB21_42
#2:	       ldi	91 -> r0
	;;
#0:	       add	r4, r0 -> r5    ; mallocr.c:2452
	;;
	       nop	0
	;;
.BB21_37:                               ; %bb50
#0:	       ldiu	511 -> r5
#1:	       ldiu	511 -> r0
	;;
#0:	       ldim	21 -> r5
	;;
#0:	       cmpult	r5, r4 -> c1    ; mallocr.c:2452
	;;
#0:	if  c1 br @	.BB21_39
	;;
.BB21_38:                               ; %bb51
#0:	       sr	r4, 12 -> r4    ; mallocr.c:2452
#1:	       br	.BB21_42
#2:	       ldi	110 -> r0
	;;
#0:	       add	r4, r0 -> r5    ; mallocr.c:2452
	;;
	       nop	0
	;;
.BB21_39:                               ; %bb52
#0:	       ldim	85 -> r0
	;;
#0:	       cmpult	r0, r4 -> c1    ; mallocr.c:2452
	;;
#0:	if  c1 br @	.BB21_41
	;;
.BB21_40:                               ; %bb53
#0:	       sr	r4, 15 -> r4    ; mallocr.c:2452
#1:	       br	.BB21_42
#2:	       ldi	119 -> r0
	;;
#0:	       add	r4, r0 -> r5    ; mallocr.c:2452
	;;
	       nop	0
	;;
.BB21_41:                               ; %bb54
#0:	       ldiu	511 -> r0
#1:	       ldi	126 -> r5
	;;
#0:	       ldim	341 -> r0
	;;
#0:	       cmpult	r0, r4 -> c1    ; mallocr.c:2452
	;;
#0:	if !c1 sr	r4, 18 -> r0    ; mallocr.c:2452
	;;
#0:	if !c1 s2add	r0, 31 -> r5    ; mallocr.c:2452
	;;
.BB21_42:                               ; %bb62
#1:	       ldga	___malloc_av_ -> r1.16
#0:	       sl	r5, 3 -> r0
	;;
#1:	       add	r1.16, r0 -> r4
	;;
#0:	       ldm.f	r4, 8           ; mallocr.c:2452
	;;
#0:	       ldx	$mem, 0 -> r6   ; mallocr.c:2452
	;;
#0:	       cmpne	r6, r4 -> c1    ; mallocr.c:2452
	;;
#0:	if !c1 br @	.BB21_44
	;;
.BB21_43:
#0:	       ldi	-4 -> r5
#1:	       br @	.BB21_46
	;;
.BB21_44:                               ; %bb63
#0:	       sra	r5, 31 -> r0    ; mallocr.c:2452
#1:	       ldmg.d	___malloc_av_+4 ; mallocr.c:2452
	;;
#0:	       sr	r0, 30 -> r0    ; mallocr.c:2452
	;;
#0:	       add	r5, r0 -> r0    ; mallocr.c:2452
#1:	       ldi	1 -> r5
#2:	       ldx	$mem, 0 -> r3   ; mallocr.c:2452
	;;
#0:	       sra	r0, 2 -> r0     ; mallocr.c:2452
	;;
#0:	       br	.BB21_49
#1:	       sl	r5, r0 -> r0    ; mallocr.c:2452
	;;
#0:	       or	r0, r3 -> r0    ; mallocr.c:2452
	;;
#1:	       stm.a	r0, r1.16, 1
	;;
.BB21_45:                               ; %bb64
                                        ;   in Loop: Header=BB21_46 Depth=1
#0:	       ldm.f	r6, 8           ; mallocr.c:2452
	;;
#0:	       ldx	$mem, 0 -> r6   ; mallocr.c:2452
	;;
.BB21_46:                               ; %bb65
                                        ; =>This Inner Loop Header: Depth=1
#0:	       cmpeq	r6, r4 -> c1    ; mallocr.c:2452
	;;
#0:	if  c1 br @	.BB21_48
	;;
.BB21_47:                               ; %bb66
                                        ;   in Loop: Header=BB21_46 Depth=1
#0:	       ldm.f	r6, 4           ; mallocr.c:2452
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2452
	;;
#0:	       and	r0, r5 -> r0    ; mallocr.c:2452
	;;
#0:	       cmpult	r3, r0 -> c1    ; mallocr.c:2452
	;;
#0:	if  c1 br @	.BB21_45
	;;
.BB21_48:                               ; %bb67
#0:	       ldm.f	r6, 12          ; mallocr.c:2452
	;;
#0:	       ldx	$mem, 0 -> r4   ; mallocr.c:2452
	;;
.BB21_49:                               ; %bb68
#0:	       stm.a	r4, r2, 3       ; mallocr.c:2452
	;;
#0:	       stm.a	r6, r2, 2       ; mallocr.c:2452
	;;
#0:	       stm.a	r2, r4, 2       ; mallocr.c:2452
	;;
#0:	       stm.a	r2, r6, 3       ; mallocr.c:2452
	;;
.BB21_50:                               ; %bb69
#0:	       sra	r1, 31 -> r0    ; mallocr.c:2460
#1:	       ldmg.d	___malloc_av_+4 ; mallocr.c:2460
#2:	       ldi	1 -> r3
	;;
#0:	       sr	r0, 30 -> r0    ; mallocr.c:2460
	;;
#0:	       add	r1, r0 -> r0    ; mallocr.c:2460
#1:	       ldx	$mem, 0 -> r2   ; mallocr.c:2460
	;;
#0:	       sra	r0, 2 -> r0     ; mallocr.c:2460
	;;
#0:	       sl	r3, r0 -> r3    ; mallocr.c:2460
	;;
#0:	       cmpult	r2, r3 -> c1    ; mallocr.c:2460
	;;
#0:	if  c1 br @	.BB21_69
	;;
.BB21_51:                               ; %bb70
#0:	       or	r2, 0 -> r4
#1:	       and	r2, r3 -> r0    ; mallocr.c:2465
	;;
#0:	       brz ne @	r0, .BB21_54    ; mallocr.c:2465
	;;
.BB21_52:                               ; %bb71
#0:	       add	r1, 4 -> r1
#1:	       ldi	-4 -> r0
#2:	       sl	r3, 1 -> r3
#3:	       or	r2, 0 -> r4
	;;
#0:	       and	r1, r0 -> r1
#1:	       and	r3, r2 -> r0    ; mallocr.c:2470
	;;
#0:	       brz ne @	r0, .BB21_54    ; mallocr.c:2470
	;;
.BB21_53:                               ; %bb72
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sl	r3, 1 -> r3
#1:	       add	r1, 4 -> r1
#2:	       or	r2, 0 -> r4
	;;
#0:	       and	r3, r2 -> r0    ; mallocr.c:2470
	;;
#0:	       brz eq @	r0, .BB21_53    ; mallocr.c:2470
	;;
.BB21_54:                               ; %bb74
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB21_68 Depth 2
                                        ;     Child Loop BB21_63 Depth 2
                                        ;     Child Loop BB21_55 Depth 2
                                        ;       Child Loop BB21_56 Depth 3
#2:	       ldga	___malloc_av_ -> r0
#1:	       sl	r1, 3 -> r1.17
#0:	       add	r1, 1 -> r0.16
#3:	       ldi	-4 -> r9
	;;
#1:	       add	r0, r1.17 -> r1.16
#0:	       ldi	16 -> r8
	;;
.BB21_55:                               ; %bb75
                                        ;   Parent Loop BB21_54 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB21_56 Depth 3
#1:	       or	r1.16, 0 -> r5
	;;
.BB21_56:                               ; %bb81
                                        ;   Parent Loop BB21_54 Depth=1
                                        ;     Parent Loop BB21_55 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
#0:	       ldm.f	r5, 12
	;;
#0:	       ldx	$mem, 0 -> r5
	;;
#1:	       cmpne	r1.16, r5 -> c1 ; mallocr.c:2488
	;;
#0:	if !c1 br @	.BB21_61
	;;
.BB21_57:                               ; %bb76
                                        ;   in Loop: Header=BB21_56 Depth=3
#0:	       ldm.f	r5, 4           ; mallocr.c:2490
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2490
	;;
#0:	       and	r0, r9 -> r7    ; mallocr.c:2490
	;;
#0:	       sub	r7, r10 -> r6   ; mallocr.c:2491
	;;
#0:	       cmplt	r6, r8 -> c1    ; mallocr.c:2493
	;;
#0:	if !c1 br @	.BB21_60
	;;
.BB21_58:                               ; %bb78
                                        ;   in Loop: Header=BB21_56 Depth=3
#0:	       cmplt	r6, 0 -> c1     ; mallocr.c:2506
	;;
#0:	if  c1 br @	.BB21_56
	;;
.BB21_59:                               ; %bb79
#0:	       add	r7, r5 -> r1    ; mallocr.c:2508
#1:	       add	r5, 8 -> r0     ; mallocr.c:2509
	;;
#0:	       ldm.f	r1, 4           ; mallocr.c:2508
	;;
#0:	       ldx	$mem, 0 -> r2   ; mallocr.c:2508
	;;
#0:	       or	r2, 1 -> r2     ; mallocr.c:2508
	;;
#0:	       stm.a	r2, r1, 1       ; mallocr.c:2508
	;;
#0:	       ldm.f	r5, 8           ; mallocr.c:2509
	;;
#0:	       ldx	$mem, 0 -> r2   ; mallocr.c:2509
#1:	       ldm.f	r5, 12          ; mallocr.c:2509
	;;
#0:	       br	.BB21_98
#1:	       ldx	$mem, 0 -> r1   ; mallocr.c:2509
	;;
#0:	       stm.a	r1, r2, 3       ; mallocr.c:2509
	;;
#0:	       stm.a	r2, r1, 2       ; mallocr.c:2509
	;;
.BB21_60:                               ; %bb77
#0:	       or	r10, 1 -> r0    ; mallocr.c:2496
#1:	       ldga	___malloc_av_ -> r1 ; mallocr.c:2498
#2:	       add	r5, r10 -> r4   ; mallocr.c:2495
	;;
#0:	       stm.a	r0, r5, 1       ; mallocr.c:2496
#1:	       add	r1, 8 -> r3     ; mallocr.c:2498
	;;
#0:	       ldm.f	r5, 8           ; mallocr.c:2497
	;;
#0:	       ldx	$mem, 0 -> r2   ; mallocr.c:2497
#1:	       ldm.f	r5, 12          ; mallocr.c:2497
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2497
	;;
#0:	       stm.a	r0, r2, 3       ; mallocr.c:2497
	;;
#0:	       stm.a	r2, r0, 2       ; mallocr.c:2497
#1:	       or	r10, 4 -> r0
#2:	       or	r6, 1 -> r2     ; mallocr.c:2499
	;;
#0:	       stm.a	r4, r1, 5       ; mallocr.c:2498
	;;
#0:	       stm.a	r4, r1, 4       ; mallocr.c:2498
#1:	       add	r5, r0 -> r1
#2:	       add	r5, r7 -> r0    ; mallocr.c:2500
	;;
#0:	       stm.a	r3, r4, 3       ; mallocr.c:2498
	;;
#0:	       br	.BB21_98
#1:	       stm.a	r3, r4, 2       ; mallocr.c:2498
	;;
#0:	       stm.a	r2, r1, 0       ; mallocr.c:2499
	;;
#0:	       stm.a	r6, r0, 0       ; mallocr.c:2500
#1:	       add	r5, 8 -> r0     ; mallocr.c:2497
	;;
.BB21_61:                               ; %bb82
                                        ;   in Loop: Header=BB21_55 Depth=2
#0:	       add	r0.16, 1 -> r5
#1:	       add	r1.16, 8 -> r1.16
	;;
#0:	       and	r0.16, 3 -> r0  ; mallocr.c:2526
	;;
#1:	       brz ne @	r0, .BB21_55    ; mallocr.c:2526
#0:	       or	r5, 0 -> r0.16
	;;
.BB21_62:                               ; %bb83.loopexit
                                        ;   in Loop: Header=BB21_54 Depth=1
#0:	       sub	r5, 1 -> r6
#1:	       ldga	___malloc_av_ -> r1.16
	;;
.BB21_63:                               ; %bb83
                                        ;   Parent Loop BB21_54 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       and	r1, 3 -> r0     ; mallocr.c:2532
	;;
#0:	       brz ne @	r0, .BB21_65    ; mallocr.c:2532
	;;
.BB21_64:                               ; %bb84
                                        ;   in Loop: Header=BB21_54 Depth=1
#0:	       xor	r3, -1 -> r0    ; mallocr.c:2534
#1:	       br	.BB21_66
	;;
#0:	       and	r4, r0 -> r2    ; mallocr.c:2534
#1:	       ldga	___malloc_av_ -> r0
	;;
#0:	       stm.a	r2, r0, 1
#1:	       or	r2, 0 -> r4
	;;
.BB21_65:                               ; %bb86
                                        ;   in Loop: Header=BB21_63 Depth=2
#0:	       sl	r1, 3 -> r0
#1:	       sub	r1.17, 8 -> r1.17
#2:	       sub	r1, 1 -> r1
	;;
#1:	       add	r1.16, r0 -> r0
	;;
#0:	       ldm.f	r0, 0           ; mallocr.c:2539
#1:	       add	r1.16, r1.17 -> r0
	;;
#0:	       ldx	$mem, 0 -> r5   ; mallocr.c:2539
	;;
#0:	       cmpeq	r0, r5 -> c1    ; mallocr.c:2539
	;;
#0:	if  c1 br @	.BB21_63
	;;
.BB21_66:                               ; %bb87
                                        ;   in Loop: Header=BB21_54 Depth=1
#0:	       sl	r3, 1 -> r3     ; mallocr.c:2543
	;;
#0:	       cmpult	r4, r3 -> c2    ; mallocr.c:2543
#1:	       cmpeq	r3, 0 -> c1     ; mallocr.c:2543
	;;
#0:	       comb	or c2, c1 -> c1
	;;
#0:	if  c1 br @	.BB21_69
	;;
.BB21_67:                               ; %bb90.preheader
                                        ;   in Loop: Header=BB21_54 Depth=1
#0:	       or	r6, 0 -> r1
#1:	       and	r4, r3 -> r0    ; mallocr.c:2545
	;;
#0:	       brz ne @	r0, .BB21_54    ; mallocr.c:2545
	;;
.BB21_68:                               ; %bb89
                                        ;   Parent Loop BB21_54 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       add	r6, 4 -> r1
#1:	       sl	r3, 1 -> r3     ; mallocr.c:2548
#2:	       or	r2, 0 -> r4
	;;
#0:	       or	r1, 0 -> r6
#1:	       and	r3, r2 -> r0    ; mallocr.c:2545
	;;
#0:	       brz ne @	r0, .BB21_54    ; mallocr.c:2545
	;;
#0:	       brz eq @	r0, .BB21_68    ; mallocr.c:2545
	;;
.BB21_69:                               ; %bb91
#0:	       ldmg.d	___malloc_av_+8 ; mallocr.c:2560
#1:	       ldi	-4 -> r1
#2:	       ldi	16 -> r3
	;;
#0:	       ldx	$mem, 0 -> r2   ; mallocr.c:2560
	;;
#0:	       ldm.f	r2, 4           ; mallocr.c:2560
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2560
	;;
#0:	       and	r0, r1 -> r5    ; mallocr.c:2560
	;;
#0:	       sub	r5, r10 -> r1   ; mallocr.c:2560
#1:	       cmpult	r5, r10 -> c2   ; mallocr.c:2561
	;;
#0:	       cmplt	r1, r3 -> c1
	;;
#0:	       comb	or c2, c1 -> c1
	;;
#0:	if !c1 br @	.BB21_99
	;;
.BB21_70:                               ; %bb93
#0:	       ldmg.d	___malloc_sbrk_base ; mallocr.c:2162[ mallocr.c:2575 ]
	;;
#0:	       ldx	$mem, 0 -> r8   ; mallocr.c:2162[ mallocr.c:2575 ]
	;;
#0:	       cmpeq	r8, -1 -> c1    ; mallocr.c:2162[ mallocr.c:2575 ]
	;;
#0:	if !c1 br @	.BB21_72
	;;
.BB21_71:
#0:	       add	r10, 16 -> r6   ; mallocr.c:2155[ mallocr.c:2575 ]
#1:	       br @	.BB21_73
	;;
.BB21_72:                               ; %bb.i
#0:	       ldiu	15 -> r0
#1:	       ldiu	0 -> r1
	;;
#0:	       ldim	2 -> r0
#1:	       ldim	2046 -> r1
	;;
#0:	       add	r10, r0 -> r0
	;;
#0:	       and	r0, r1 -> r6    ; mallocr.c:2163[ mallocr.c:2575 ]
	;;
.BB21_73:                               ; %bb1.i
#0:	       ldmg.d	_heap_end.1081  ; sbrk.c:14[ sbrkr.c:60[ mallocr.c:2165[ mallocr.c:2575 ] ] ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; sbrk.c:14[ sbrkr.c:60[ mallocr.c:2165[ mallocr.c:2575 ] ] ]
	;;
#0:	       brz ne @	r1, .BB21_75    ; sbrk.c:14[ sbrkr.c:60[ mallocr.c:2165[ mallocr.c:2575 ] ] ]
	;;
.BB21_74:                               ; %bb.i.i
#0:	       ldga	_end -> r1      ; sbrk.c:15[ sbrkr.c:60[ mallocr.c:2165[ mallocr.c:2575 ] ] ]
#1:	       ldga	_heap_end.1081 -> r0 ; sbrk.c:15[ sbrkr.c:60[ mallocr.c:2165[ mallocr.c:2575 ] ] ]
	;;
#0:	       stm.a	r1, r0, 0       ; sbrk.c:15[ sbrkr.c:60[ mallocr.c:2165[ mallocr.c:2575 ] ] ]
	;;
.BB21_75:                               ; %_sbrk.exit.i
#0:	       cmpeq	r1, -1 -> c1    ; sbrkr.c:60[ mallocr.c:2165[ mallocr.c:2575 ] ]
#1:	       add	r1, r6 -> r3    ; sbrk.c:18[ sbrkr.c:60[ mallocr.c:2165[ mallocr.c:2575 ] ] ]
#2:	       ldga	_heap_end.1081 -> r0 ; sbrk.c:18[ sbrkr.c:60[ mallocr.c:2165[ mallocr.c:2575 ] ] ]
	;;
#0:	if  c1 br @	.BB21_96
#1:	       stm.a	r3, r0, 0       ; sbrk.c:18[ sbrkr.c:60[ mallocr.c:2165[ mallocr.c:2575 ] ] ]
	;;
.BB21_76:                               ; %bb2.i
#0:	       add	r2, r5 -> r7    ; mallocr.c:2151[ mallocr.c:2575 ]
#1:	       ldga	___malloc_av_ -> r0 ; mallocr.c:2168[ mallocr.c:2575 ]
	;;
#0:	       cmpule	r7, r1 -> c2
#1:	       cmpeq	r2, r0 -> c1    ; mallocr.c:2168[ mallocr.c:2575 ]
	;;
#0:	       comb	or c2, c1 -> c1
	;;
#0:	if !c1 br @	.BB21_96
	;;
.BB21_77:                               ; %bb4.i
#0:	       ldmg.d	___malloc_current_mallinfo.0 ; mallocr.c:2172[ mallocr.c:2575 ]
#1:	       cmpne	r1, r7 -> c1    ; mallocr.c:2174[ mallocr.c:2575 ]
#2:	       ldga	___malloc_current_mallinfo.0 -> r0 ; mallocr.c:2172[ mallocr.c:2575 ]
	;;
#0:	if  c1 br	.BB21_80
#1:	       ldx	$mem, 0 -> r4   ; mallocr.c:2172[ mallocr.c:2575 ]
	;;
#0:	       add	r4, r6 -> r4    ; mallocr.c:2172[ mallocr.c:2575 ]
	;;
#0:	       stm.a	r4, r0, 0       ; mallocr.c:2172[ mallocr.c:2575 ]
	;;
.BB21_78:                               ; %bb5.i
#0:	       ldiu	2047 -> r0
	;;
#0:	       ldim	1 -> r0
	;;
#0:	       and	r7, r0 -> r0    ; mallocr.c:2174[ mallocr.c:2575 ]
	;;
#0:	       brz ne @	r0, .BB21_80    ; mallocr.c:2174[ mallocr.c:2575 ]
	;;
.BB21_79:                               ; %bb6.i
#0:	       add	r6, r5 -> r0    ; mallocr.c:2178[ mallocr.c:2575 ]
#1:	       br	.BB21_92
	;;
#0:	       or	r0, 1 -> r0     ; mallocr.c:2179[ mallocr.c:2575 ]
	;;
#0:	       stm.a	r0, r2, 1       ; mallocr.c:2179[ mallocr.c:2575 ]
	;;
.BB21_80:                               ; %bb7.i
#0:	       cmpne	r8, -1 -> c1    ; mallocr.c:2183[ mallocr.c:2575 ]
	;;
#0:	if  c1 br @	.BB21_82
	;;
.BB21_81:                               ; %bb8.i
#0:	       ldga	___malloc_sbrk_base -> r0 ; mallocr.c:2184[ mallocr.c:2575 ]
#1:	       br	.BB21_83
	;;
#0:	       stm.a	r1, r0, 0       ; mallocr.c:2184[ mallocr.c:2575 ]
	;;
	       nop	0
	;;
.BB21_82:                               ; %bb9.i
#0:	       sub	r1, r7 -> r0
	;;
#0:	       add	r4, r0 -> r4    ; mallocr.c:2186[ mallocr.c:2575 ]
#1:	       ldga	___malloc_current_mallinfo.0 -> r0 ; mallocr.c:2186[ mallocr.c:2575 ]
	;;
#0:	       stm.a	r4, r0, 0       ; mallocr.c:2186[ mallocr.c:2575 ]
	;;
.BB21_83:                               ; %bb10.i
#0:	       add	r1, 8 -> r0     ; mallocr.c:2189[ mallocr.c:2575 ]
#1:	       ldi	0 -> r8
	;;
#0:	       and	r0, 7 -> r7     ; mallocr.c:2189[ mallocr.c:2575 ]
	;;
#0:	       brz eq @	r7, .BB21_85    ; mallocr.c:2190[ mallocr.c:2575 ]
	;;
.BB21_84:                               ; %bb11.i
#0:	       ldi	8 -> r0
	;;
#0:	       sub	r0, r7 -> r8    ; mallocr.c:2192[ mallocr.c:2575 ]
	;;
#0:	       add	r1, r8 -> r1    ; mallocr.c:2193[ mallocr.c:2575 ]
	;;
.BB21_85:                               ; %bb13.i
#0:	       brz ne @	r3, .BB21_87    ; sbrk.c:14[ sbrkr.c:60[ mallocr.c:2202[ mallocr.c:2575 ] ] ]
	;;
.BB21_86:                               ; %bb.i.i4
#0:	       ldga	_end -> r3      ; sbrk.c:15[ sbrkr.c:60[ mallocr.c:2202[ mallocr.c:2575 ] ] ]
#1:	       ldga	_heap_end.1081 -> r0 ; sbrk.c:15[ sbrkr.c:60[ mallocr.c:2202[ mallocr.c:2575 ] ] ]
	;;
#0:	       stm.a	r3, r0, 0       ; sbrk.c:15[ sbrkr.c:60[ mallocr.c:2202[ mallocr.c:2575 ] ] ]
	;;
.BB21_87:                               ; %_sbrk.exit.i5
#0:	       ldiu	2047 -> r7
#1:	       add	r1, r6 -> r6    ; mallocr.c:2199[ mallocr.c:2575 ]
#2:	       ldga	4096 -> r0
#3:	       cmpeq	r3, -1 -> c1    ; sbrkr.c:60[ mallocr.c:2202[ mallocr.c:2575 ] ]
	;;
#0:	       ldim	1 -> r7
	;;
#0:	       and	r6, r7 -> r6    ; mallocr.c:2199[ mallocr.c:2575 ]
	;;
#0:	       sub	r0, r6 -> r0    ; mallocr.c:2199[ mallocr.c:2575 ]
	;;
#0:	       add	r0, r8 -> r6    ; mallocr.c:2199[ mallocr.c:2575 ]
#1:	       ldi	0 -> r0
	;;
#0:	       or	r6, 0 -> r8
#1:	       add	r3, r6 -> r7    ; sbrk.c:18[ sbrkr.c:60[ mallocr.c:2202[ mallocr.c:2575 ] ] ]
#2:	if  c1 or	r1, 0 -> r3
	;;
#0:	if  c1 or	r0, 0 -> r8
#1:	       ldga	_heap_end.1081 -> r0 ; sbrk.c:18[ sbrkr.c:60[ mallocr.c:2202[ mallocr.c:2575 ] ] ]
	;;
#0:	       stm.a	r7, r0, 0       ; sbrk.c:18[ sbrkr.c:60[ mallocr.c:2202[ mallocr.c:2575 ] ] ]
#1:	       ldga	___malloc_av_ -> r0
#2:	       sub	r8, r1 -> r6
#3:	       add	r8, r4 -> r4    ; mallocr.c:2210[ mallocr.c:2575 ]
	;;
#0:	       cmpeq	r2, r0 -> c1
#1:	       add	r6, r3 -> r3    ; mallocr.c:2213[ mallocr.c:2575 ]
	;;
#3:	       ldga	___malloc_current_mallinfo.0 -> r3.16 ; mallocr.c:2210[ mallocr.c:2575 ]
#0:	       or	r3, 1 -> r3     ; mallocr.c:2214[ mallocr.c:2575 ]
	;;
#0:	if  c1 br	.BB21_92
#3:	       stm.a	r4, r3.16, 0    ; mallocr.c:2210[ mallocr.c:2575 ]
	;;
#0:	       stm.a	r1, r0, 2       ; mallocr.c:2212[ mallocr.c:2575 ]
	;;
#0:	       stm.a	r3, r1, 1       ; mallocr.c:2214[ mallocr.c:2575 ]
	;;
.BB21_88:                               ; %bb16.i
#0:	       ldi	15 -> r0
	;;
#0:	       cmpult	r0, r5 -> c1    ; mallocr.c:2223[ mallocr.c:2575 ]
	;;
#0:	if  c1 br @	.BB21_90
	;;
.BB21_89:                               ; %bb17.i
#0:	       ldmg.d	___malloc_av_+8 ; mallocr.c:2225[ mallocr.c:2575 ]
#1:	       br	.BB21_96
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2225[ mallocr.c:2575 ]
	;;
#0:	       stm.a	1, r0, 1        ; mallocr.c:2225[ mallocr.c:2575 ]
	;;
.BB21_90:                               ; %bb18.i
#0:	       ldm.f	r2, 4           ; mallocr.c:2231[ mallocr.c:2575 ]
#1:	       sub	r5, 12 -> r1
#2:	       ldi	-8 -> r0
	;;
#0:	       and	r1, r0 -> r5    ; mallocr.c:2230[ mallocr.c:2575 ]
	;;
#0:	       ldx	$mem, 0 -> r3   ; mallocr.c:2231[ mallocr.c:2575 ]
#1:	       cmpult	r5, 16 -> c1    ; mallocr.c:2237[ mallocr.c:2575 ]
	;;
#0:	       and	r3, 1 -> r0     ; mallocr.c:2231[ mallocr.c:2575 ]
#1:	       or	r1, 4 -> r3
	;;
#0:	       or	r0, r5 -> r1    ; mallocr.c:2231[ mallocr.c:2575 ]
#1:	       add	r2, r3 -> r0
	;;
#0:	if  c1 br	.BB21_92
#1:	       stm.a	r1, r2, 1       ; mallocr.c:2231[ mallocr.c:2575 ]
	;;
#0:	       stm.a	5, r0, 0        ; mallocr.c:2232[ mallocr.c:2575 ]
	;;
#0:	       stm.a	5, r0, 1        ; mallocr.c:2234[ mallocr.c:2575 ]
	;;
.BB21_91:                               ; %bb19.i
#0:	       add	r2, 8 -> r0
#1:	       callg	__free_r        ; mallocr.c:2238[ mallocr.c:2575 ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldmg.d	___malloc_current_mallinfo.0
	;;
#0:	       ldx	$mem, 0 -> r4
	;;
.BB21_92:                               ; %bb20.i
#0:	       ldmg.d	___malloc_max_sbrked_mem ; mallocr.c:2242[ mallocr.c:2575 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2242[ mallocr.c:2575 ]
	;;
#0:	       cmpule	r4, r0 -> c1    ; mallocr.c:2242[ mallocr.c:2575 ]
	;;
#0:	if  c1 br @	.BB21_94
	;;
.BB21_93:                               ; %bb21.i
#0:	       ldga	___malloc_max_sbrked_mem -> r0 ; mallocr.c:2243[ mallocr.c:2575 ]
	;;
#0:	       stm.a	r4, r0, 0       ; mallocr.c:2243[ mallocr.c:2575 ]
	;;
.BB21_94:                               ; %bb22.i
#0:	       ldmg.d	___malloc_max_total_mem ; mallocr.c:2248[ mallocr.c:2575 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2248[ mallocr.c:2575 ]
	;;
#0:	       cmpule	r4, r0 -> c1    ; mallocr.c:2248[ mallocr.c:2575 ]
	;;
#0:	if  c1 br @	.BB21_96
	;;
.BB21_95:                               ; %bb23.i
#0:	       ldga	___malloc_max_total_mem -> r0 ; mallocr.c:2249[ mallocr.c:2575 ]
	;;
#0:	       stm.a	r4, r0, 0       ; mallocr.c:2249[ mallocr.c:2575 ]
	;;
.BB21_96:                               ; %malloc_extend_top.exit
#0:	       ldmg.d	___malloc_av_+8 ; mallocr.c:2576
#1:	       ldi	-4 -> r1
#2:	       ldi	16 -> r3
	;;
#0:	       ldx	$mem, 0 -> r2   ; mallocr.c:2576
	;;
#0:	       ldm.f	r2, 4           ; mallocr.c:2576
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2576
	;;
#0:	       and	r0, r1 -> r0    ; mallocr.c:2576
	;;
#0:	       sub	r0, r10 -> r1   ; mallocr.c:2576
#1:	       cmpult	r0, r10 -> c2   ; mallocr.c:2577
	;;
#0:	       cmplt	r1, r3 -> c1
	;;
#0:	       comb	or c2, c1 -> c1
	;;
#0:	if !c1 br @	.BB21_99
	;;
.BB21_97:                               ; %bb95
#0:	       ldi	0 -> r0
	;;
.BB21_98:                               ; %bb95
#0:	       ldm.s	r15, 4          ; mallocr.c:2590
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:2590
	;;
#0:	       stx	r1 -> $ro       ; mallocr.c:2590
	;;
#0:	       ldm.s	r15, 8          ; mallocr.c:2590
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:2590
	;;
#0:	       stx	r1 -> $rb       ; mallocr.c:2590
	;;
#0:	       ldm.s	r15, 12         ; mallocr.c:2590
#1:	       s2add	r15, 8 -> r15   ; mallocr.c:2590
	;;
#0:	       jop	ret             ; mallocr.c:2590
#1:	       ldx	$mem, 0 -> r10  ; mallocr.c:2590
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB21_99:                               ; %bb96
#0:	       or	r10, 1 -> r0    ; mallocr.c:2585
#1:	       or	r10, 4 -> r5
#2:	       add	r2, r10 -> r4   ; mallocr.c:2586
#3:	       ldga	___malloc_av_ -> r3 ; mallocr.c:2586
	;;
#0:	       br	.BB21_98
#1:	       stm.a	r0, r2, 1       ; mallocr.c:2585
#2:	       or	r1, 1 -> r1     ; mallocr.c:2587
#3:	       add	r2, r5 -> r0
	;;
#0:	       stm.a	r4, r3, 2       ; mallocr.c:2586
	;;
#0:	       stm.a	r1, r0, 0       ; mallocr.c:2587
#1:	       add	r2, 8 -> r0
	;;
	.align	4
__malloc_r_end:

	.align	4
__realloc_r:                            ; @_realloc_r
	.size	__realloc_r_end-__realloc_r
__realloc_r_start:
; BB#0:                                 ; %entry
#0:	       ldiu	72 -> r2        ; mallocr.c:2806
#1:	       wb.s	r15, 18         ; mallocr.c:2806
	;;
#0:	       sub	r15, r2 -> r15  ; mallocr.c:2806
#1:	       ldx	$rb, 0 -> r2    ; mallocr.c:2806
	;;
#0:	       stm.s	r10, r15, 13    ; mallocr.c:2806
	;;
#0:	       stm.s	r11, r15, 12    ; mallocr.c:2806
	;;
#0:	       stm.s	r12, r15, 11    ; mallocr.c:2806
	;;
#0:	       stm.s	r13, r15, 10    ; mallocr.c:2806
	;;
#0:	       stm.s	r14, r15, 9     ; mallocr.c:2806
	;;
#1:	       stm.s	r1.23, r15, 8   ; mallocr.c:2806
	;;
#2:	       stm.s	r2.23, r15, 7   ; mallocr.c:2806
	;;
#0:	       brz ne	r0, .BB22_2     ; mallocr.c:2806
#3:	       stm.s	r3.23, r15, 6   ; mallocr.c:2806
	;;
#0:	       stm.s	r2, r15, 5      ; mallocr.c:2806
#1:	       ldx	$ro, 0 -> r2    ; mallocr.c:2806
	;;
#0:	       stm.s	r2, r15, 4      ; mallocr.c:2806
	;;
.BB22_1:                                ; %bb
#0:	       or	r1, 0 -> r0     ; mallocr.c:2806
#1:	       callg	__malloc_r      ; mallocr.c:2806
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       br @	.BB22_50
	;;
.BB22_2:                                ; %bb1
#0:	       or	r0, 0 -> r13
#1:	       ldi	22 -> r0
#2:	       add	r1, 11 -> r3    ; mallocr.c:2814
#3:	       ldi	-8 -> r2
	;;
#0:	       cmpult	r0, r3 -> c1    ; mallocr.c:2814
#1:	       ldi	16 -> r0
#2:	       ldm.f	r13, -4         ; mallocr.c:2811
	;;
#0:	if  c1 and	r3, r2 -> r0
	;;
#0:	       cmplt	r0, 0 -> c2     ; mallocr.c:2817
#1:	       cmpult	r0, r1 -> c1    ; mallocr.c:2817
#2:	       ldx	$mem, 0 -> r5   ; mallocr.c:2811
#3:	       stm.s	r0, r15, 3      ; mallocr.c:2817
	;;
#0:	       comb	or c2, c1 -> c1
	;;
#0:	if !c1 br @	.BB22_4
	;;
.BB22_3:                                ; %bb6
#0:	       ldga	_impure_data -> r0 ; mallocr.c:2819
#1:	       br	.BB22_49
	;;
#0:	       stm.a	12, r0, 0       ; mallocr.c:2819
	;;
	       nop	0
	;;
.BB22_4:                                ; %bb7
#0:	       ldm.s	r15, 12         ; mallocr.c:2856
#1:	       ldi	-4 -> r0
#2:	       sub	r13, 8 -> r10   ; mallocr.c:2810
	;;
#0:	       and	r5, r0 -> r12   ; mallocr.c:2811
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2856
	;;
#0:	       cmple	r0, r12 -> c1   ; mallocr.c:2856
	;;
#0:	if  c1 br @	.BB22_9
	;;
.BB22_5:                                ; %bb8
#0:	       ldmg.d	___malloc_av_+8 ; mallocr.c:2862
#1:	       add	r12, r13 -> r0  ; mallocr.c:2861
#2:	       sub	r12, 4 -> r14
	;;
#0:	       sub	r0, 8 -> r6     ; mallocr.c:2861
#1:	       add	r13, r14 -> r2
	;;
#0:	       ldx	$mem, 0 -> r4   ; mallocr.c:2862
#1:	       ldm.f	r2, 0           ; mallocr.c:2864
	;;
#0:	       cmpeq	r4, r6 -> c1    ; mallocr.c:2862
	;;
#0:	if  c1 br @	.BB22_11
#1:	       ldx	$mem, 0 -> r3   ; mallocr.c:2864
	;;
.BB22_6:                                ; %bb9
#0:	       ldi	-2 -> r0
#1:	       ldi	0 -> r2
	;;
#0:	       and	r3, r0 -> r0    ; mallocr.c:2862
#1:	       stm.s	r2, r15, 2      ; mallocr.c:2862
#2:	       or	r2, 0 -> r7
	;;
#0:	       add	r0, r14 -> r0
	;;
#0:	       add	r13, r0 -> r0
	;;
#0:	       ldm.f	r0, 0           ; mallocr.c:2862
	;;
#0:	       ldx	$membu, r0 -> r0 ; mallocr.c:2862
	;;
#0:	       btest	r0, 0 -> c1     ; mallocr.c:2862
	;;
#0:	if  c1 br @	.BB22_13
	;;
.BB22_7:                                ; %bb13
#0:	       ldi	-4 -> r0
#1:	       or	r6, 0 -> r7
	;;
#0:	       and	r3, r0 -> r0    ; mallocr.c:2864
	;;
#0:	       stm.s	r0, r15, 2      ; mallocr.c:2869
#1:	       add	r0, r12 -> r2   ; mallocr.c:2869
	;;
#0:	       ldm.s	r15, 12         ; mallocr.c:2881
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2881
	;;
#0:	       cmplt	r2, r0 -> c1    ; mallocr.c:2881
	;;
#0:	if  c1 br @	.BB22_13
	;;
.BB22_8:                                ; %bb14
#0:	       add	r13, r12 -> r0
#1:	       or	r2, 0 -> r12
	;;
#0:	       ldm.f	r0, 0           ; mallocr.c:2883
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:2883
#1:	       ldm.f	r0, 4           ; mallocr.c:2883
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2883
	;;
#0:	       stm.a	r0, r1, 3       ; mallocr.c:2883
	;;
#0:	       stm.a	r1, r0, 2       ; mallocr.c:2883
	;;
.BB22_9:                                ; %split
#0:	       ldm.s	r15, 12         ; mallocr.c:2978
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2978
	;;
#0:	       sub	r12, r0 -> r1   ; mallocr.c:2978
	;;
#0:	       cmpult	r1, 16 -> c1    ; mallocr.c:2980
	;;
#0:	if  c1 br @	.BB22_64
	;;
.BB22_10:                               ; %bb66
#0:	       ldm.f	r10, 4          ; mallocr.c:2983
#1:	       or	r1, 1 -> r1     ; mallocr.c:2984
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2983
#1:	       ldm.s	r15, 12
	;;
#0:	       and	r0, 1 -> r0     ; mallocr.c:2983
	;;
#0:	       ldx	$mem, 0 -> r4
	;;
#0:	       or	r0, r4 -> r2    ; mallocr.c:2983
#1:	       or	r4, 4 -> r3
	;;
#0:	       stm.a	r2, r10, 1      ; mallocr.c:2983
#1:	       add	r10, r3 -> r0
#2:	       add	r12, r10 -> r2  ; mallocr.c:2982
	;;
#0:	       stm.a	r1, r0, 0       ; mallocr.c:2984
#1:	       add	r4, r10 -> r1   ; mallocr.c:2982
	;;
#0:	       ldm.f	r2, 4           ; mallocr.c:2985
	;;
#0:	       callg	__free_r        ; mallocr.c:2986
#1:	       ldx	$mem, 0 -> r0   ; mallocr.c:2985
	;;
#0:	       or	r0, 1 -> r0     ; mallocr.c:2985
	;;
#0:	       stm.a	r0, r2, 1       ; mallocr.c:2985
#1:	       add	r1, 8 -> r0     ; mallocr.c:2986
	;;
	       nop	0
	;;
#0:	       br @	.BB22_50
#1:	       add	r10, 8 -> r0
	;;
.BB22_11:                               ; %bb11
#0:	       ldi	-4 -> r0
	;;
#0:	       and	r3, r0 -> r0    ; mallocr.c:2864
	;;
#0:	       stm.s	r0, r15, 2      ; mallocr.c:2869
#1:	       add	r0, r12 -> r2   ; mallocr.c:2869
	;;
#0:	       ldm.s	r15, 12         ; mallocr.c:2869
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2869
	;;
#0:	       add	r0, 16 -> r0    ; mallocr.c:2869
	;;
#0:	       cmplt	r2, r0 -> c1    ; mallocr.c:2869
	;;
#0:	if !c1 br @	.BB22_15
	;;
.BB22_12:
#0:	       or	r6, 0 -> r7
	;;
.BB22_13:                               ; %bb16
#0:	       btest	r5, 0 -> c1     ; mallocr.c:2896
	;;
#0:	if  c1 br @	.BB22_48
	;;
.BB22_14:                               ; %bb17
#0:	       ldm.f	r13, -8         ; mallocr.c:2898
#1:	       ldi	-4 -> r5
#2:	       cmpeq	r7, 0 -> c3     ; mallocr.c:2903
	;;
#0:	       ldx	$mem, 0 -> r2   ; mallocr.c:2898
	;;
#0:	       sub	r5, r2 -> r0
	;;
#1:	       add	r13, r0 -> r1.23
#0:	       ldi	-8 -> r0
	;;
#1:	       ldm.f	r1.23, 0        ; mallocr.c:2899
#0:	       sub	r0, r2 -> r11
	;;
#3:	       add	r13, r11 -> r3.23 ; mallocr.c:2898
	;;
#0:	if !c3 br	.BB22_16
#1:	if  c3 br	.BB22_40        ; mallocr.c:2903
#2:	       ldx	$mem, 0 -> r3   ; mallocr.c:2899
	;;
#0:	       and	r3, r5 -> r0    ; mallocr.c:2899
	;;
#0:	       stm.s	r0, r15, 1      ; mallocr.c:2903
	;;
.BB22_15:                               ; %bb12
#0:	       ldm.s	r15, 12         ; mallocr.c:2872
#1:	       ldga	___malloc_av_ -> r2 ; mallocr.c:2872
	;;
#0:	       ldx	$mem, 0 -> r5   ; mallocr.c:2872
	;;
#0:	       ldm.s	r15, 8
#1:	       add	r5, r13 -> r4   ; mallocr.c:2872
#2:	       sub	r12, r5 -> r1
	;;
#0:	       sub	r4, 8 -> r3     ; mallocr.c:2872
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       add	r1, r0 -> r0
#1:	       stm.a	r3, r2, 2       ; mallocr.c:2872
	;;
#0:	       or	r0, 1 -> r1     ; mallocr.c:2873
#1:	       sub	r4, 4 -> r0
	;;
#0:	       stm.a	r1, r0, 0       ; mallocr.c:2873
#1:	       sub	r13, 4 -> r1
	;;
#0:	       ldm.f	r13, -4         ; mallocr.c:2874
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2874
	;;
#0:	       br	.BB22_50
#1:	       and	r0, 1 -> r0     ; mallocr.c:2874
	;;
#0:	       or	r0, r5 -> r0    ; mallocr.c:2874
	;;
#0:	       stm.a	r0, r1, 0       ; mallocr.c:2874
#1:	       or	r13, 0 -> r0    ; mallocr.c:2996
	;;
.BB22_16:                               ; %bb18
#0:	       ldm.s	r15, 8          ; mallocr.c:2908
#1:	       cmpne	r4, r7 -> c1    ; mallocr.c:2906
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2908
	;;
#0:	if  c1 br	.BB22_29
#1:	       ldm.s	r15, 4          ; mallocr.c:2908
#2:	       add	r0, r12 -> r2   ; mallocr.c:2908
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2908
	;;
#2:	       add	r2, r0 -> r2.23 ; mallocr.c:2908
	;;
.BB22_17:                               ; %bb19
#0:	       ldm.s	r15, 12         ; mallocr.c:2908
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2908
	;;
#0:	       add	r0, 16 -> r0    ; mallocr.c:2908
	;;
#2:	       cmplt	r2.23, r0 -> c1 ; mallocr.c:2908
	;;
#0:	if  c1 br @	.BB22_40
	;;
.BB22_18:                               ; %bb20
#0:	       add	r11, r13 -> r2
#1:	       add	r11, 12 -> r0
	;;
#0:	       ldm.f	r2, 8           ; mallocr.c:2910
#1:	       add	r13, r0 -> r4
#2:	       ldi	36 -> r0
#3:	       add	r2, 8 -> r10
	;;
#0:	       cmpult	r0, r14 -> c1   ; mallocr.c:2914
	;;
#0:	       ldx	$mem, 0 -> r3   ; mallocr.c:2910
#1:	       ldm.f	r4, 0           ; mallocr.c:2910
	;;
#0:	if  c1 br	.BB22_27
#1:	       ldx	$mem, 0 -> r1   ; mallocr.c:2910
	;;
#0:	       stm.a	r1, r3, 3       ; mallocr.c:2910
	;;
#0:	       stm.a	r3, r1, 2       ; mallocr.c:2910
	;;
.BB22_19:                               ; %bb21
#0:	       cmpult	r14, 20 -> c1   ; mallocr.c:2914
	;;
#0:	if !c1 br @	.BB22_21
	;;
.BB22_20:
#0:	       or	r13, 0 -> r3
#1:	       br @	.BB22_26
#2:	       or	r10, 0 -> r1
	;;
.BB22_21:                               ; %bb22
#0:	       ldm.f	r13, 0          ; mallocr.c:2914
#1:	       cmpult	r14, 28 -> c1   ; mallocr.c:2914
#2:	       add	r2, 16 -> r1
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2914
	;;
#0:	       stm.a	r0, r10, 0      ; mallocr.c:2914
	;;
#0:	if !c1 br	.BB22_23
#1:	       ldm.f	r13, 4          ; mallocr.c:2914
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2914
	;;
#0:	       stm.a	r0, r4, 0       ; mallocr.c:2914
	;;
.BB22_22:
#0:	       add	r13, 8 -> r3
#1:	       br @	.BB22_26
	;;
.BB22_23:                               ; %bb23
#0:	       ldm.f	r13, 8          ; mallocr.c:2914
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2914
	;;
#0:	       stm.a	r0, r1, 0       ; mallocr.c:2914
#1:	       ldi	36 -> r0
#2:	       add	r2, 24 -> r1
	;;
#0:	       cmpult	r14, r0 -> c1   ; mallocr.c:2914
#1:	       ldm.f	r13, 12         ; mallocr.c:2914
	;;
#0:	if !c1 br	.BB22_25
#1:	       ldx	$mem, 0 -> r3   ; mallocr.c:2914
	;;
#0:	       stm.a	r3, r2, 5       ; mallocr.c:2914
	;;
	       nop	0
	;;
.BB22_24:
#0:	       add	r13, 16 -> r3
#1:	       br @	.BB22_26
	;;
.BB22_25:                               ; %bb24
#0:	       ldm.f	r13, 16         ; mallocr.c:2914
#1:	       add	r13, 24 -> r3
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2914
	;;
#0:	       stm.a	r0, r1, 0       ; mallocr.c:2914
#1:	       s2add	r2, 8 -> r1
	;;
#0:	       ldm.f	r13, 20         ; mallocr.c:2914
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2914
	;;
#0:	       stm.a	r0, r2, 7       ; mallocr.c:2914
	;;
.BB22_26:                               ; %bb25
#0:	       ldm.f	r3, 0           ; mallocr.c:2914
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2914
	;;
#0:	       stm.a	r0, r1, 0       ; mallocr.c:2914
	;;
#0:	       ldm.f	r3, 4           ; mallocr.c:2914
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2914
	;;
#0:	       stm.a	r0, r1, 1       ; mallocr.c:2914
	;;
#0:	       br	.BB22_28
#1:	       ldm.f	r3, 8           ; mallocr.c:2914
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2914
	;;
#0:	       stm.a	r0, r1, 2       ; mallocr.c:2914
	;;
.BB22_27:                               ; %bb26
#0:	       or	r10, 0 -> r0    ; mallocr.c:2914
#1:	       callg	_memmove        ; mallocr.c:2914
#2:	       or	r13, 0 -> r1    ; mallocr.c:2914
#3:	       or	r14, 0 -> r2    ; mallocr.c:2914
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB22_28:                               ; %bb27
#0:	       ldm.s	r15, 12
	;;
#0:	       ldx	$mem, 0 -> r3
	;;
#0:	       ldm.s	r15, 8          ; mallocr.c:2912
#1:	       sub	r12, r3 -> r1
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2912
	;;
#0:	       ldm.s	r15, 4
#1:	       add	r1, r0 -> r2    ; mallocr.c:2912
#2:	       add	r11, r3 -> r1
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       add	r2, r0 -> r0
#1:	       add	r13, r1 -> r2   ; mallocr.c:2915
#2:	       ldga	___malloc_av_ -> r1 ; mallocr.c:2915
	;;
#0:	       stm.a	r2, r1, 2       ; mallocr.c:2915
#1:	       or	r0, 1 -> r0     ; mallocr.c:2916
	;;
#0:	       stm.a	r0, r2, 1       ; mallocr.c:2916
	;;
#1:	       ldm.f	r1.23, 0        ; mallocr.c:2917
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2917
	;;
#0:	       br	.BB22_50
#1:	       and	r0, 1 -> r0     ; mallocr.c:2917
	;;
#0:	       or	r0, r3 -> r0    ; mallocr.c:2917
	;;
#1:	       stm.a	r0, r1.23, 0    ; mallocr.c:2917
#0:	       or	r10, 0 -> r0    ; mallocr.c:2996
	;;
.BB22_29:                               ; %bb28
#0:	       ldm.s	r15, 12         ; mallocr.c:2924
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2924
	;;
#2:	       cmplt	r2.23, r0 -> c1 ; mallocr.c:2924
	;;
#0:	if  c1 br @	.BB22_40
	;;
.BB22_30:                               ; %bb29
#0:	       ldm.f	r7, 8           ; mallocr.c:2926
#1:	       add	r11, r13 -> r3
#2:	       add	r11, 12 -> r2
	;;
#0:	       add	r13, r2 -> r5
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:2926
#1:	       ldm.f	r7, 12          ; mallocr.c:2926
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2926
	;;
#0:	       stm.a	r0, r1, 3       ; mallocr.c:2926
	;;
#0:	       stm.a	r1, r0, 2       ; mallocr.c:2926
#1:	       ldi	36 -> r1
#2:	       add	r3, 8 -> r0
	;;
#0:	       ldm.f	r3, 8           ; mallocr.c:2927
#1:	       cmpult	r1, r14 -> c1   ; mallocr.c:2931
	;;
#0:	       ldx	$mem, 0 -> r4   ; mallocr.c:2927
#1:	       ldm.f	r5, 0           ; mallocr.c:2927
	;;
#0:	if  c1 br	.BB22_38
#1:	       ldx	$mem, 0 -> r2   ; mallocr.c:2927
	;;
#0:	       stm.a	r2, r4, 3       ; mallocr.c:2927
	;;
#0:	       stm.a	r4, r2, 2       ; mallocr.c:2927
	;;
.BB22_31:                               ; %bb31
#0:	       cmpult	r14, 20 -> c1   ; mallocr.c:2931
	;;
#0:	if  c1 br @	.BB22_37
	;;
.BB22_32:                               ; %bb34
#0:	       ldm.f	r13, 0          ; mallocr.c:2931
#1:	       cmpult	r14, 28 -> c1   ; mallocr.c:2931
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:2931
	;;
#0:	       stm.a	r1, r0, 0       ; mallocr.c:2931
#1:	       add	r3, 16 -> r0
	;;
#0:	if !c1 br	.BB22_34
#1:	       ldm.f	r13, 4          ; mallocr.c:2931
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:2931
	;;
#0:	       stm.a	r1, r5, 0       ; mallocr.c:2931
	;;
.BB22_33:
#0:	       add	r13, 8 -> r13
#1:	       br @	.BB22_37
	;;
.BB22_34:                               ; %bb35
#0:	       ldm.f	r13, 8          ; mallocr.c:2931
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:2931
	;;
#0:	       stm.a	r1, r0, 0       ; mallocr.c:2931
#1:	       ldi	36 -> r1
#2:	       add	r3, 24 -> r0
	;;
#0:	       cmpult	r14, r1 -> c1   ; mallocr.c:2931
#1:	       ldm.f	r13, 12         ; mallocr.c:2931
	;;
#0:	if !c1 br	.BB22_36
#1:	       ldx	$mem, 0 -> r2   ; mallocr.c:2931
	;;
#0:	       stm.a	r2, r3, 5       ; mallocr.c:2931
	;;
	       nop	0
	;;
.BB22_35:
#0:	       add	r13, 16 -> r13
#1:	       br @	.BB22_37
	;;
.BB22_36:                               ; %bb36
#0:	       ldm.f	r13, 16         ; mallocr.c:2931
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:2931
	;;
#0:	       stm.a	r1, r0, 0       ; mallocr.c:2931
#1:	       s2add	r3, 8 -> r0
	;;
#0:	       ldm.f	r13, 20         ; mallocr.c:2931
#1:	       add	r13, 24 -> r13
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:2931
	;;
#0:	       stm.a	r1, r3, 7       ; mallocr.c:2931
	;;
.BB22_37:                               ; %bb37
#0:	       ldm.f	r13, 0          ; mallocr.c:2931
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:2931
	;;
#0:	       stm.a	r1, r0, 0       ; mallocr.c:2931
	;;
#0:	       ldm.f	r13, 4          ; mallocr.c:2931
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:2931
	;;
#0:	       stm.a	r1, r0, 1       ; mallocr.c:2931
	;;
#0:	       br	.BB22_39
#1:	       ldm.f	r13, 8          ; mallocr.c:2931
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:2931
	;;
#0:	       stm.a	r1, r0, 2       ; mallocr.c:2931
	;;
.BB22_38:                               ; %bb38
#0:	       or	r13, 0 -> r1    ; mallocr.c:2931
#1:	       callg	_memmove        ; mallocr.c:2931
#2:	       or	r14, 0 -> r2    ; mallocr.c:2931
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB22_39:                               ; %bb38
#2:	       or	r2.23, 0 -> r12
#0:	       br @	.BB22_9
#3:	       or	r3.23, 0 -> r10
	;;
.BB22_40:                               ; %bb39
#3:	       brz eq @	r3.23, .BB22_48 ; mallocr.c:2937
	;;
.BB22_41:                               ; %bb40
#0:	       ldm.s	r15, 4          ; mallocr.c:2937
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2937
	;;
#0:	       ldm.s	r15, 12         ; mallocr.c:2937
#2:	       add	r0, r12 -> r2.23 ; mallocr.c:2937
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2937
	;;
#2:	       cmplt	r2.23, r0 -> c1 ; mallocr.c:2937
	;;
#0:	if  c1 br @	.BB22_48
	;;
.BB22_42:                               ; %bb41
#0:	       add	r11, r13 -> r3
#1:	       add	r11, 12 -> r0
#2:	       ldi	36 -> r1
	;;
#0:	       ldm.f	r3, 8           ; mallocr.c:2939
#1:	       add	r13, r0 -> r5
#2:	       cmpult	r1, r14 -> c1   ; mallocr.c:2943
#3:	       add	r3, 8 -> r0
	;;
#0:	       ldx	$mem, 0 -> r4   ; mallocr.c:2939
#1:	       ldm.f	r5, 0           ; mallocr.c:2939
	;;
#0:	if  c1 br	.BB22_38
#1:	       ldx	$mem, 0 -> r2   ; mallocr.c:2939
	;;
#0:	       stm.a	r2, r4, 3       ; mallocr.c:2939
	;;
#0:	       stm.a	r4, r2, 2       ; mallocr.c:2939
	;;
.BB22_43:                               ; %bb43
#0:	       cmpult	r14, 20 -> c1   ; mallocr.c:2943
	;;
#0:	if  c1 br @	.BB22_37
	;;
.BB22_44:                               ; %bb46
#0:	       ldm.f	r13, 0          ; mallocr.c:2943
#1:	       cmpult	r14, 28 -> c1   ; mallocr.c:2943
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:2943
	;;
#0:	       stm.a	r1, r0, 0       ; mallocr.c:2943
#1:	       add	r3, 16 -> r0
	;;
#0:	if !c1 br	.BB22_46
#1:	       ldm.f	r13, 4          ; mallocr.c:2943
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:2943
	;;
#0:	       stm.a	r1, r5, 0       ; mallocr.c:2943
	;;
.BB22_45:
#0:	       add	r13, 8 -> r13
#1:	       br @	.BB22_37
	;;
.BB22_46:                               ; %bb47
#0:	       ldm.f	r13, 8          ; mallocr.c:2943
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:2943
	;;
#0:	       stm.a	r1, r0, 0       ; mallocr.c:2943
#1:	       ldi	36 -> r1
#2:	       add	r3, 24 -> r0
	;;
#0:	       cmpult	r14, r1 -> c1   ; mallocr.c:2943
#1:	       ldm.f	r13, 12         ; mallocr.c:2943
	;;
#0:	if !c1 br	.BB22_36
#1:	       ldx	$mem, 0 -> r2   ; mallocr.c:2943
	;;
#0:	       stm.a	r2, r3, 5       ; mallocr.c:2943
	;;
	       nop	0
	;;
.BB22_47:
#0:	       add	r13, 16 -> r13
#1:	       br @	.BB22_37
	;;
.BB22_48:                               ; %bb51
#0:	       or	r1, 0 -> r0     ; mallocr.c:2950
#1:	       callg	__malloc_r      ; mallocr.c:2950
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz ne @	r0, .BB22_51    ; mallocr.c:2952
	;;
.BB22_49:                               ; %bb52
#0:	       ldi	0 -> r0
	;;
.BB22_50:                               ; %bb52
#0:	       ldm.s	r15, 16         ; mallocr.c:2996
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:2996
	;;
#0:	       stx	r1 -> $ro       ; mallocr.c:2996
	;;
#0:	       ldm.s	r15, 20         ; mallocr.c:2996
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:2996
	;;
#0:	       stx	r1 -> $rb       ; mallocr.c:2996
	;;
#0:	       ldm.s	r15, 24         ; mallocr.c:2996
	;;
#3:	       ldx	$mem, 0 -> r3.23 ; mallocr.c:2996
	;;
#0:	       ldm.s	r15, 28         ; mallocr.c:2996
	;;
#2:	       ldx	$mem, 0 -> r2.23 ; mallocr.c:2996
	;;
#0:	       ldm.s	r15, 32         ; mallocr.c:2996
	;;
#1:	       ldx	$mem, 0 -> r1.23 ; mallocr.c:2996
	;;
#0:	       ldm.s	r15, 36         ; mallocr.c:2996
	;;
#0:	       ldx	$mem, 0 -> r14  ; mallocr.c:2996
	;;
#0:	       ldm.s	r15, 40         ; mallocr.c:2996
	;;
#0:	       ldx	$mem, 0 -> r13  ; mallocr.c:2996
	;;
#0:	       ldm.s	r15, 44         ; mallocr.c:2996
	;;
#0:	       ldx	$mem, 0 -> r12  ; mallocr.c:2996
	;;
#0:	       ldm.s	r15, 48         ; mallocr.c:2996
	;;
#0:	       ldx	$mem, 0 -> r11  ; mallocr.c:2996
	;;
#0:	       ldm.s	r15, 52         ; mallocr.c:2996
#1:	       s2add	r15, 18 -> r15  ; mallocr.c:2996
	;;
#0:	       jop	ret             ; mallocr.c:2996
#1:	       ldx	$mem, 0 -> r10  ; mallocr.c:2996
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB22_51:                               ; %bb53
#0:	       ldm.f	r13, -4         ; mallocr.c:2961
#1:	       or	r0, 0 -> r11    ; mallocr.c:2950
#2:	       ldi	-2 -> r1
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2961
	;;
#0:	       sub	r0, 8 -> r0
	;;
#0:	       and	r0, r1 -> r0
#1:	       sub	r11, 8 -> r1    ; mallocr.c:2961
	;;
#0:	       add	r13, r0 -> r0   ; mallocr.c:2961
	;;
#0:	       cmpne	r1, r0 -> c1    ; mallocr.c:2961
	;;
#0:	if  c1 br @	.BB22_53
	;;
.BB22_52:                               ; %bb54
#0:	       ldm.f	r11, -4         ; mallocr.c:2963
#1:	       ldi	-4 -> r0
	;;
#0:	       br	.BB22_9
#1:	       ldx	$mem, 0 -> r1   ; mallocr.c:2963
	;;
#0:	       and	r1, r0 -> r0    ; mallocr.c:2963
	;;
#0:	       add	r0, r12 -> r12  ; mallocr.c:2963
	;;
.BB22_53:                               ; %bb55
#0:	       ldi	36 -> r0
	;;
#0:	       cmpult	r0, r14 -> c1   ; mallocr.c:2969
	;;
#0:	if  c1 br @	.BB22_62
	;;
.BB22_54:                               ; %bb57
#0:	       cmpult	r14, 20 -> c1   ; mallocr.c:2969
	;;
#0:	if !c1 br @	.BB22_56
	;;
.BB22_55:
#0:	       or	r13, 0 -> r1
#1:	       br @	.BB22_61
#2:	       or	r11, 0 -> r2
	;;
.BB22_56:                               ; %bb60
#0:	       ldm.f	r13, 0          ; mallocr.c:2969
#1:	       cmpult	r14, 28 -> c1   ; mallocr.c:2969
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2969
	;;
#0:	       stm.a	r0, r11, 0      ; mallocr.c:2969
	;;
#0:	if !c1 br	.BB22_58
#1:	       ldm.f	r13, 4          ; mallocr.c:2969
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2969
	;;
#0:	       stm.a	r0, r11, 1      ; mallocr.c:2969
	;;
.BB22_57:
#0:	       add	r11, 8 -> r2
#1:	       br @	.BB22_61
#2:	       add	r13, 8 -> r1
	;;
.BB22_58:                               ; %bb61
#0:	       ldm.f	r13, 8          ; mallocr.c:2969
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2969
	;;
#0:	       stm.a	r0, r11, 2      ; mallocr.c:2969
#1:	       ldi	36 -> r0
	;;
#0:	       cmpult	r14, r0 -> c1   ; mallocr.c:2969
#1:	       ldm.f	r13, 12         ; mallocr.c:2969
	;;
#0:	if !c1 br	.BB22_60
#1:	       ldx	$mem, 0 -> r1   ; mallocr.c:2969
	;;
#0:	       stm.a	r1, r11, 3      ; mallocr.c:2969
	;;
	       nop	0
	;;
.BB22_59:
#0:	       add	r11, 16 -> r2
#1:	       br @	.BB22_61
#2:	       add	r13, 16 -> r1
	;;
.BB22_60:                               ; %bb62
#0:	       ldm.f	r13, 16         ; mallocr.c:2969
#1:	       add	r11, 24 -> r2
#2:	       add	r13, 24 -> r1
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2969
	;;
#0:	       stm.a	r0, r11, 4      ; mallocr.c:2969
	;;
#0:	       ldm.f	r13, 20         ; mallocr.c:2969
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2969
	;;
#0:	       stm.a	r0, r11, 5      ; mallocr.c:2969
	;;
.BB22_61:                               ; %bb63
#0:	       ldm.f	r1, 0           ; mallocr.c:2969
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2969
	;;
#0:	       stm.a	r0, r2, 0       ; mallocr.c:2969
	;;
#0:	       ldm.f	r1, 4           ; mallocr.c:2969
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2969
	;;
#0:	       stm.a	r0, r2, 1       ; mallocr.c:2969
	;;
#0:	       br	.BB22_63
#1:	       ldm.f	r1, 8           ; mallocr.c:2969
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2969
	;;
#0:	       stm.a	r0, r2, 2       ; mallocr.c:2969
	;;
.BB22_62:                               ; %bb64
#0:	       or	r11, 0 -> r0    ; mallocr.c:2969
#1:	       callg	_memmove        ; mallocr.c:2969
#2:	       or	r13, 0 -> r1    ; mallocr.c:2969
#3:	       or	r14, 0 -> r2    ; mallocr.c:2969
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB22_63:                               ; %bb65
#0:	       or	r13, 0 -> r0    ; mallocr.c:2970
#1:	       callg	__free_r        ; mallocr.c:2970
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       br @	.BB22_50
#1:	       or	r11, 0 -> r0    ; mallocr.c:2996
	;;
.BB22_64:                               ; %bb67
#0:	       ldm.f	r10, 4          ; mallocr.c:2990
#1:	       add	r12, r10 -> r1  ; mallocr.c:2990
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2990
	;;
#0:	       and	r0, 1 -> r0     ; mallocr.c:2990
	;;
#0:	       or	r0, r12 -> r0   ; mallocr.c:2990
	;;
#0:	       stm.a	r0, r10, 1      ; mallocr.c:2990
	;;
#0:	       ldm.f	r1, 4           ; mallocr.c:2991
	;;
#0:	       br	.BB22_50
#1:	       ldx	$mem, 0 -> r0   ; mallocr.c:2991
	;;
#0:	       or	r0, 1 -> r0     ; mallocr.c:2991
	;;
#0:	       stm.a	r0, r1, 1       ; mallocr.c:2991
#1:	       add	r10, 8 -> r0
	;;
	.align	4
__realloc_r_end:

	.align	4
___lshift:                              ; @__lshift
	.size	___lshift_end-___lshift
___lshift_start:
; BB#0:                                 ; %entry
#0:	       ldiu	64 -> r2
#1:	       wb.s	r15, 16
	;;
#0:	       sub	r15, r2 -> r15
#1:	       ldx	$rb, 0 -> r2
	;;
#0:	       stm.s	r10, r15, 11
	;;
#0:	       stm.s	r11, r15, 10
#1:	       or	r0, 0 -> r11
	;;
#0:	       stm.s	r12, r15, 9
	;;
#0:	       stm.s	r13, r15, 8
	;;
#0:	       stm.s	r14, r15, 7
	;;
#0:	       stm.s	r0.23, r15, 6
	;;
#1:	       stm.s	r1.23, r15, 5
	;;
#3:	       stm.s	r3.23, r15, 4
#1:	       or	r1, 0 -> r1.23
	;;
#0:	       stm.s	r2, r15, 3
#2:	       ldx	$ro, 0 -> r2
#1:	       sra	r1.23, 5 -> r12 ; mprec.c:469
	;;
#0:	       stm.s	r2, r15, 2
	;;
#0:	       ldm.f	r11, 16         ; mprec.c:474
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:474
#1:	       ldm.f	r11, 4          ; mprec.c:473
	;;
#0:	       add	r0, r12 -> r14  ; mprec.c:474
	;;
#0:	       ldx	$mem, 0 -> r0.23 ; mprec.c:473
#1:	       ldm.f	r11, 8          ; mprec.c:475
	;;
#3:	       add	r14, 1 -> r3.23 ; mprec.c:474
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:475
	;;
#3:	       cmple	r3.23, r0 -> c1 ; mprec.c:475
	;;
#0:	if  c1 br @	.BB23_2
	;;
.BB23_1:                                ; %bb
                                        ; =>This Inner Loop Header: Depth=1
#1:	       sl	r0, 1 -> r0     ; mprec.c:475
#0:	       add	r0.23, 1 -> r0.23
	;;
#3:	       cmplt	r0, r3.23 -> c1 ; mprec.c:475
	;;
#0:	if  c1 br @	.BB23_1
	;;
.BB23_2:                                ; %bb2
#0:	       ldmg.d	_impure_data+76 ; mprec.c:103[ mprec.c:477 ]
	;;
#0:	       ldx	$mem, 0 -> r10  ; mprec.c:103[ mprec.c:477 ]
	;;
#0:	       brz ne @	r10, .BB23_15   ; mprec.c:103[ mprec.c:477 ]
	;;
.BB23_3:                                ; %bb.i
#0:	       ldi	132 -> r0
#1:	       callg	__malloc_r      ; mallocr.c:3207[ mprec.c:106[ mprec.c:477 ] ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz ne @	r0, .BB23_5     ; mallocr.c:3209[ mprec.c:106[ mprec.c:477 ] ]
	;;
.BB23_4:                                ; %_calloc_r.exit.thread
#0:	       ldga	_impure_data -> r0 ; mprec.c:106[ mprec.c:477 ]
#1:	       br	.BB23_29
#2:	       ldi	0 -> r10
	;;
#0:	       stm.a	0, r0, 19       ; mprec.c:106[ mprec.c:477 ]
	;;
	       nop	0
	;;
.BB23_5:                                ; %bb1.i
#0:	       or	r0, 0 -> r10    ; mallocr.c:3207[ mprec.c:106[ mprec.c:477 ] ]
#1:	       ldi	-4 -> r1
	;;
#0:	       ldm.f	r10, -4         ; mallocr.c:3233[ mprec.c:106[ mprec.c:477 ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:3233[ mprec.c:106[ mprec.c:477 ] ]
	;;
#0:	       sub	r0, 4 -> r0
	;;
#0:	       and	r0, r1 -> r2
#1:	       ldi	36 -> r0
	;;
#0:	       cmpult	r0, r2 -> c1    ; mallocr.c:3244[ mprec.c:106[ mprec.c:477 ] ]
	;;
#0:	if  c1 br @	.BB23_13
	;;
.BB23_6:                                ; %bb2.i1
#0:	       cmpult	r2, 20 -> c1    ; mallocr.c:3244[ mprec.c:106[ mprec.c:477 ] ]
#1:	       or	r10, 0 -> r0
	;;
#0:	if  c1 br @	.BB23_12
	;;
.BB23_7:                                ; %bb3.i2
#0:	       cmpult	r2, 28 -> c1    ; mallocr.c:3244[ mprec.c:106[ mprec.c:477 ] ]
#1:	       stm.a	0, r10, 0       ; mallocr.c:3244[ mprec.c:106[ mprec.c:477 ] ]
	;;
#0:	if !c1 br @	.BB23_9
#1:	       stm.a	0, r10, 1       ; mallocr.c:3244[ mprec.c:106[ mprec.c:477 ] ]
	;;
.BB23_8:
#0:	       add	r10, 8 -> r0
#1:	       br @	.BB23_12
	;;
.BB23_9:                                ; %bb4.i3
#0:	       ldi	36 -> r0
#1:	       stm.a	0, r10, 2       ; mallocr.c:3244[ mprec.c:106[ mprec.c:477 ] ]
	;;
#0:	       cmpult	r2, r0 -> c1    ; mallocr.c:3244[ mprec.c:106[ mprec.c:477 ] ]
#1:	       stm.a	0, r10, 3       ; mallocr.c:3244[ mprec.c:106[ mprec.c:477 ] ]
	;;
#0:	if !c1 br @	.BB23_11
	;;
.BB23_10:
#0:	       add	r10, 16 -> r0
#1:	       br @	.BB23_12
	;;
.BB23_11:                               ; %bb5.i
#0:	       stm.a	0, r10, 4       ; mallocr.c:3244[ mprec.c:106[ mprec.c:477 ] ]
#1:	       add	r10, 24 -> r0
	;;
#0:	       stm.a	0, r10, 5       ; mallocr.c:3244[ mprec.c:106[ mprec.c:477 ] ]
	;;
.BB23_12:                               ; %bb6.i4
#0:	       stm.a	0, r0, 0        ; mallocr.c:3244[ mprec.c:106[ mprec.c:477 ] ]
#1:	       br	.BB23_14
	;;
#0:	       stm.a	0, r0, 1        ; mallocr.c:3244[ mprec.c:106[ mprec.c:477 ] ]
	;;
#0:	       stm.a	0, r0, 2        ; mallocr.c:3244[ mprec.c:106[ mprec.c:477 ] ]
	;;
.BB23_13:                               ; %bb7.i5
#0:	       ldi	0 -> r1
#1:	       callg	_memset         ; mallocr.c:3244[ mprec.c:106[ mprec.c:477 ] ]
#2:	       or	r10, 0 -> r0    ; mallocr.c:3244[ mprec.c:106[ mprec.c:477 ] ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB23_14:                               ; %_calloc_r.exit
#0:	       ldga	_impure_data -> r0 ; mprec.c:106[ mprec.c:477 ]
	;;
#0:	       stm.a	r10, r0, 19     ; mprec.c:106[ mprec.c:477 ]
	;;
.BB23_15:                               ; %bb2.i
#0:	       s2add	r10, r0.23 -> r1 ; mprec.c:115[ mprec.c:477 ]
	;;
#0:	       ldm.f	r1, 0           ; mprec.c:115[ mprec.c:477 ]
	;;
#0:	       ldx	$mem, 0 -> r10  ; mprec.c:115[ mprec.c:477 ]
	;;
#0:	       brz eq @	r10, .BB23_17   ; mprec.c:115[ mprec.c:477 ]
	;;
.BB23_16:                               ; %bb3.i
#0:	       ldm.f	r10, 0          ; mprec.c:117[ mprec.c:477 ]
#1:	       br	.BB23_28
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:117[ mprec.c:477 ]
	;;
#0:	       stm.a	r0, r1, 0       ; mprec.c:117[ mprec.c:477 ]
	;;
.BB23_17:                               ; %bb4.i
#0:	       ldi	1 -> r0
#1:	       callg	__malloc_r      ; mallocr.c:3207[ mprec.c:123[ mprec.c:477 ] ]
	;;
#0:	       sl	r0, r0.23 -> r13 ; mprec.c:121[ mprec.c:477 ]
#1:	       ldi	20 -> r0
	;;
#0:	       s2add	r0, r13 -> r0   ; mprec.c:123[ mprec.c:477 ]
	;;
	       nop	0
	;;
#0:	       brz eq @	r0, .BB23_29    ; mallocr.c:3209[ mprec.c:123[ mprec.c:477 ] ]
#1:	       ldi	0 -> r10
	;;
.BB23_18:                               ; %bb1.i6
#0:	       or	r0, 0 -> r10    ; mallocr.c:3207[ mprec.c:123[ mprec.c:477 ] ]
#1:	       ldi	-4 -> r1
	;;
#0:	       ldm.f	r10, -4         ; mallocr.c:3233[ mprec.c:123[ mprec.c:477 ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:3233[ mprec.c:123[ mprec.c:477 ] ]
	;;
#0:	       sub	r0, 4 -> r0
	;;
#0:	       and	r0, r1 -> r2
#1:	       ldi	36 -> r0
	;;
#0:	       cmpult	r0, r2 -> c1    ; mallocr.c:3244[ mprec.c:123[ mprec.c:477 ] ]
	;;
#0:	if  c1 br @	.BB23_26
	;;
.BB23_19:                               ; %bb2.i7
#0:	       cmpult	r2, 20 -> c1    ; mallocr.c:3244[ mprec.c:123[ mprec.c:477 ] ]
#1:	       or	r10, 0 -> r0
	;;
#0:	if  c1 br @	.BB23_25
	;;
.BB23_20:                               ; %bb3.i8
#0:	       cmpult	r2, 28 -> c1    ; mallocr.c:3244[ mprec.c:123[ mprec.c:477 ] ]
#1:	       stm.a	0, r10, 0       ; mallocr.c:3244[ mprec.c:123[ mprec.c:477 ] ]
	;;
#0:	if !c1 br @	.BB23_22
#1:	       stm.a	0, r10, 1       ; mallocr.c:3244[ mprec.c:123[ mprec.c:477 ] ]
	;;
.BB23_21:
#0:	       add	r10, 8 -> r0
#1:	       br @	.BB23_25
	;;
.BB23_22:                               ; %bb4.i9
#0:	       ldi	36 -> r0
#1:	       stm.a	0, r10, 2       ; mallocr.c:3244[ mprec.c:123[ mprec.c:477 ] ]
	;;
#0:	       cmpult	r2, r0 -> c1    ; mallocr.c:3244[ mprec.c:123[ mprec.c:477 ] ]
#1:	       stm.a	0, r10, 3       ; mallocr.c:3244[ mprec.c:123[ mprec.c:477 ] ]
	;;
#0:	if !c1 br @	.BB23_24
	;;
.BB23_23:
#0:	       add	r10, 16 -> r0
#1:	       br @	.BB23_25
	;;
.BB23_24:                               ; %bb5.i10
#0:	       stm.a	0, r10, 4       ; mallocr.c:3244[ mprec.c:123[ mprec.c:477 ] ]
#1:	       add	r10, 24 -> r0
	;;
#0:	       stm.a	0, r10, 5       ; mallocr.c:3244[ mprec.c:123[ mprec.c:477 ] ]
	;;
.BB23_25:                               ; %bb6.i12
#0:	       stm.a	0, r0, 0        ; mallocr.c:3244[ mprec.c:123[ mprec.c:477 ] ]
#1:	       br	.BB23_27
	;;
#0:	       stm.a	0, r0, 1        ; mallocr.c:3244[ mprec.c:123[ mprec.c:477 ] ]
	;;
#0:	       stm.a	0, r0, 2        ; mallocr.c:3244[ mprec.c:123[ mprec.c:477 ] ]
	;;
.BB23_26:                               ; %bb7.i13
#0:	       ldi	0 -> r1
#1:	       callg	_memset         ; mallocr.c:3244[ mprec.c:123[ mprec.c:477 ] ]
#2:	       or	r10, 0 -> r0    ; mallocr.c:3244[ mprec.c:123[ mprec.c:477 ] ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB23_27:                               ; %bb6.i
#0:	       stm.a	r0.23, r10, 1   ; mprec.c:128[ mprec.c:477 ]
	;;
#0:	       stm.a	r13, r10, 2     ; mprec.c:129[ mprec.c:477 ]
	;;
.BB23_28:                               ; %bb7.i
#0:	       stm.a	0, r10, 4       ; mprec.c:131[ mprec.c:477 ]
	;;
#0:	       stm.a	0, r10, 3       ; mprec.c:131[ mprec.c:477 ]
	;;
.BB23_29:                               ; %_Balloc.exit
#0:	       cmplt	r12, 1 -> c1    ; mprec.c:479
	;;
#0:	if !c1 br @	.BB23_31
	;;
.BB23_30:
#0:	       add	r10, 20 -> r3
#1:	       br @	.BB23_34
	;;
.BB23_31:                               ; %bb.nph
#1:	       sra	r1.23, 3 -> r0
	;;
#0:	       add	r0, 20 -> r1
#1:	       ldi	-4 -> r0
	;;
#0:	       and	r1, r0 -> r2
#1:	       add	r10, 20 -> r0
	;;
.BB23_32:                               ; %bb3
                                        ; =>This Inner Loop Header: Depth=1
#0:	       add	r0, 4 -> r1
#1:	       stm.a	0, r0, 0        ; mprec.c:480
#2:	       sub	r12, 1 -> r12
	;;
#0:	       brz ne @	r12, .BB23_32   ; mprec.c:479
#1:	       or	r1, 0 -> r0
	;;
.BB23_33:                               ; %bb4.bb5_crit_edge
#0:	       add	r10, r2 -> r3
	;;
.BB23_34:                               ; %bb5
#0:	       ldm.f	r11, 16         ; mprec.c:482
#1:	       and	r1.23, 31 -> r2 ; mprec.c:484
	;;
#0:	       brz ne	r2, .BB23_38    ; mprec.c:484
#1:	       ldx	$mem, 0 -> r0   ; mprec.c:482
	;;
#0:	       s2add	r11, r0 -> r0
	;;
#0:	       add	r0, 20 -> r4
	;;
.BB23_35:                               ; %bb10.preheader
#0:	       add	r11, 20 -> r0
	;;
.BB23_36:                               ; %bb10
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r0, 0           ; mprec.c:514
#1:	       add	r0, 4 -> r0
#2:	       add	r3, 4 -> r2
	;;
#0:	       cmpult	r0, r4 -> c1    ; mprec.c:515
	;;
#0:	if  c1 br	.BB23_36
#1:	       ldx	$mem, 0 -> r1   ; mprec.c:514
	;;
#0:	       stm.a	r1, r3, 0       ; mprec.c:514
#1:	       or	r2, 0 -> r3
	;;
	       nop	0
	;;
.BB23_37:                               ; %bb11.thread
#0:	       stm.a	r14, r10, 4     ; mprec.c:516
#1:	       br @	.BB23_41
	;;
.BB23_38:                               ; %bb6
#0:	       ldi	32 -> r0
#1:	       add	r11, 20 -> r5
#2:	       ldi	0 -> r1
	;;
#0:	       sub	r0, r2 -> r6    ; mprec.c:486
	;;
.BB23_39:                               ; %bb7
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r5, 0           ; mprec.c:490
#1:	       add	r3, 4 -> r7
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:490
	;;
#0:	       sl	r0, r2 -> r0    ; mprec.c:490
	;;
#0:	       or	r0, r1 -> r0    ; mprec.c:490
	;;
#0:	       stm.a	r0, r3, 0       ; mprec.c:490
#1:	       or	r7, 0 -> r3
	;;
#0:	       ldm.f	r5, 0           ; mprec.c:491
#1:	       add	r5, 4 -> r5
	;;
#0:	       cmpult	r5, r4 -> c1    ; mprec.c:493
	;;
#0:	if  c1 br	.BB23_39
#1:	       ldx	$mem, 0 -> r0   ; mprec.c:491
	;;
#0:	       sr	r0, r6 -> r1    ; mprec.c:491
	;;
	       nop	0
	;;
.BB23_40:                               ; %bb11
#0:	       cmpeq	r1, 0 -> c1     ; mprec.c:494
#1:	       stm.a	r1, r7, 0       ; mprec.c:494
	;;
#3:	if !c1 add	r14, 2 -> r3.23
	;;
#3:	       sub	r3.23, 1 -> r0
	;;
#0:	       stm.a	r0, r10, 4      ; mprec.c:516
	;;
.BB23_41:                               ; %bb.i13
#0:	       ldmg.d	_impure_data+76 ; mprec.c:141[ mprec.c:517 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:141[ mprec.c:517 ]
#1:	       ldm.f	r11, 4          ; mprec.c:141[ mprec.c:517 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; mprec.c:141[ mprec.c:517 ]
	;;
#0:	       s2add	r0, r1 -> r0    ; mprec.c:141[ mprec.c:517 ]
	;;
#0:	       ldm.f	r0, 0           ; mprec.c:141[ mprec.c:517 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:141[ mprec.c:517 ]
	;;
#0:	       stm.a	r0, r11, 0      ; mprec.c:141[ mprec.c:517 ]
	;;
#0:	       ldmg.d	_impure_data+76 ; mprec.c:142[ mprec.c:517 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:142[ mprec.c:517 ]
	;;
#0:	       s2add	r0, r1 -> r0    ; mprec.c:142[ mprec.c:517 ]
	;;
#0:	       stm.a	r11, r0, 0      ; mprec.c:142[ mprec.c:517 ]
#1:	       or	r10, 0 -> r0    ; mprec.c:518
	;;
#0:	       ldm.s	r15, 8          ; mprec.c:518
	;;
#0:	       ldx	$mem, 0 -> r1   ; mprec.c:518
	;;
#0:	       stx	r1 -> $ro       ; mprec.c:518
	;;
#0:	       ldm.s	r15, 12         ; mprec.c:518
	;;
#0:	       ldx	$mem, 0 -> r1   ; mprec.c:518
	;;
#0:	       stx	r1 -> $rb       ; mprec.c:518
	;;
#0:	       ldm.s	r15, 16         ; mprec.c:518
	;;
#3:	       ldx	$mem, 0 -> r3.23 ; mprec.c:518
	;;
#0:	       ldm.s	r15, 20         ; mprec.c:518
	;;
#1:	       ldx	$mem, 0 -> r1.23 ; mprec.c:518
	;;
#0:	       ldm.s	r15, 24         ; mprec.c:518
	;;
#0:	       ldx	$mem, 0 -> r0.23 ; mprec.c:518
	;;
#0:	       ldm.s	r15, 28         ; mprec.c:518
	;;
#0:	       ldx	$mem, 0 -> r14  ; mprec.c:518
	;;
#0:	       ldm.s	r15, 32         ; mprec.c:518
	;;
#0:	       ldx	$mem, 0 -> r13  ; mprec.c:518
	;;
#0:	       ldm.s	r15, 36         ; mprec.c:518
	;;
#0:	       ldx	$mem, 0 -> r12  ; mprec.c:518
	;;
#0:	       ldm.s	r15, 40         ; mprec.c:518
	;;
#0:	       ldx	$mem, 0 -> r11  ; mprec.c:518
	;;
#0:	       ldm.s	r15, 44         ; mprec.c:518
#1:	       s2add	r15, 16 -> r15  ; mprec.c:518
	;;
#0:	       jop	ret             ; mprec.c:518
#1:	       ldx	$mem, 0 -> r10  ; mprec.c:518
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
___lshift_end:

	.align	4
___multiply:                            ; @__multiply
	.size	___multiply_end-___multiply
___multiply_start:
; BB#0:                                 ; %entry
#0:	       ldiu	64 -> r4        ; mprec.c:340
#1:	       wb.s	r15, 16         ; mprec.c:340
	;;
#0:	       sub	r15, r4 -> r15  ; mprec.c:340
#1:	       ldx	$rb, 0 -> r4    ; mprec.c:340
	;;
#0:	       stm.s	r10, r15, 11    ; mprec.c:340
	;;
#0:	       stm.s	r11, r15, 10    ; mprec.c:340
	;;
#0:	       stm.s	r12, r15, 9     ; mprec.c:340
	;;
#0:	       stm.s	r13, r15, 8     ; mprec.c:340
	;;
#0:	       stm.s	r14, r15, 7     ; mprec.c:340
#1:	       or	r0, 0 -> r14
	;;
#0:	       stm.s	r0.23, r15, 6   ; mprec.c:340
	;;
#2:	       stm.s	r2.23, r15, 5   ; mprec.c:340
	;;
#3:	       stm.s	r3.23, r15, 4   ; mprec.c:340
#2:	       or	r1, 0 -> r2.23
	;;
#2:	       stm.s	r2.24, r15, 3   ; mprec.c:340
	;;
#0:	       stm.s	r4, r15, 2      ; mprec.c:340
#1:	       ldx	$ro, 0 -> r4    ; mprec.c:340
	;;
#0:	       stm.s	r4, r15, 1      ; mprec.c:340
	;;
#0:	       ldm.f	r0, 16          ; mprec.c:340
	;;
#0:	       ldx	$mem, 0 -> r3   ; mprec.c:340
#1:	       ldm.f	r1, 16          ; mprec.c:340
	;;
#0:	       ldx	$mem, 0 -> r2   ; mprec.c:340
#1:	       ldmg.d	_impure_data+76 ; mprec.c:103[ mprec.c:352 ]
	;;
#0:	       cmplt	r3, r2 -> c1    ; mprec.c:340
	;;
#2:	if  c1 or	r0, 0 -> r2.23
#0:	       ldx	$mem, 0 -> r11  ; mprec.c:103[ mprec.c:352 ]
#1:	if  c1 or	r1, 0 -> r14
	;;
#2:	       ldm.f	r2.23, 16       ; mprec.c:348
	;;
#0:	       ldx	$mem, 0 -> r12  ; mprec.c:348
#1:	       ldm.f	r14, 16         ; mprec.c:347
	;;
#3:	       ldx	$mem, 0 -> r3.23 ; mprec.c:347
#0:	       ldm.f	r14, 8          ; mprec.c:350
	;;
#0:	       brz ne	r11, .BB24_13   ; mprec.c:103[ mprec.c:352 ]
#3:	       add	r12, r3.23 -> r10 ; mprec.c:349
	;;
#2:	       ldx	$mem, 0 -> r2.24 ; mprec.c:350
#0:	       ldm.f	r14, 4          ; mprec.c:346
	;;
#0:	       ldx	$mem, 0 -> r13  ; mprec.c:346
	;;
.BB24_1:                                ; %bb.i
#0:	       ldi	132 -> r0
#1:	       callg	__malloc_r      ; mallocr.c:3207[ mprec.c:106[ mprec.c:352 ] ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz ne @	r0, .BB24_3     ; mallocr.c:3209[ mprec.c:106[ mprec.c:352 ] ]
	;;
.BB24_2:                                ; %_calloc_r.exit.thread
#0:	       ldga	_impure_data -> r0 ; mprec.c:106[ mprec.c:352 ]
#1:	       br	.BB24_27
#2:	       ldi	0 -> r11
	;;
#0:	       stm.a	0, r0, 19       ; mprec.c:106[ mprec.c:352 ]
	;;
	       nop	0
	;;
.BB24_3:                                ; %bb1.i
#0:	       or	r0, 0 -> r11    ; mallocr.c:3207[ mprec.c:106[ mprec.c:352 ] ]
#1:	       ldi	-4 -> r1
	;;
#0:	       ldm.f	r11, -4         ; mallocr.c:3233[ mprec.c:106[ mprec.c:352 ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:3233[ mprec.c:106[ mprec.c:352 ] ]
	;;
#0:	       sub	r0, 4 -> r0
	;;
#0:	       and	r0, r1 -> r2
#1:	       ldi	36 -> r0
	;;
#0:	       cmpult	r0, r2 -> c1    ; mallocr.c:3244[ mprec.c:106[ mprec.c:352 ] ]
	;;
#0:	if  c1 br @	.BB24_11
	;;
.BB24_4:                                ; %bb2.i1
#0:	       cmpult	r2, 20 -> c1    ; mallocr.c:3244[ mprec.c:106[ mprec.c:352 ] ]
#1:	       or	r11, 0 -> r0
	;;
#0:	if  c1 br @	.BB24_10
	;;
.BB24_5:                                ; %bb3.i2
#0:	       cmpult	r2, 28 -> c1    ; mallocr.c:3244[ mprec.c:106[ mprec.c:352 ] ]
#1:	       stm.a	0, r11, 0       ; mallocr.c:3244[ mprec.c:106[ mprec.c:352 ] ]
	;;
#0:	if !c1 br @	.BB24_7
#1:	       stm.a	0, r11, 1       ; mallocr.c:3244[ mprec.c:106[ mprec.c:352 ] ]
	;;
.BB24_6:
#0:	       add	r11, 8 -> r0
#1:	       br @	.BB24_10
	;;
.BB24_7:                                ; %bb4.i3
#0:	       ldi	36 -> r0
#1:	       stm.a	0, r11, 2       ; mallocr.c:3244[ mprec.c:106[ mprec.c:352 ] ]
	;;
#0:	       cmpult	r2, r0 -> c1    ; mallocr.c:3244[ mprec.c:106[ mprec.c:352 ] ]
#1:	       stm.a	0, r11, 3       ; mallocr.c:3244[ mprec.c:106[ mprec.c:352 ] ]
	;;
#0:	if !c1 br @	.BB24_9
	;;
.BB24_8:
#0:	       add	r11, 16 -> r0
#1:	       br @	.BB24_10
	;;
.BB24_9:                                ; %bb5.i
#0:	       stm.a	0, r11, 4       ; mallocr.c:3244[ mprec.c:106[ mprec.c:352 ] ]
#1:	       add	r11, 24 -> r0
	;;
#0:	       stm.a	0, r11, 5       ; mallocr.c:3244[ mprec.c:106[ mprec.c:352 ] ]
	;;
.BB24_10:                               ; %bb6.i4
#0:	       stm.a	0, r0, 0        ; mallocr.c:3244[ mprec.c:106[ mprec.c:352 ] ]
#1:	       br	.BB24_12
	;;
#0:	       stm.a	0, r0, 1        ; mallocr.c:3244[ mprec.c:106[ mprec.c:352 ] ]
	;;
#0:	       stm.a	0, r0, 2        ; mallocr.c:3244[ mprec.c:106[ mprec.c:352 ] ]
	;;
.BB24_11:                               ; %bb7.i5
#0:	       ldi	0 -> r1
#1:	       callg	_memset         ; mallocr.c:3244[ mprec.c:106[ mprec.c:352 ] ]
#2:	       or	r11, 0 -> r0    ; mallocr.c:3244[ mprec.c:106[ mprec.c:352 ] ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB24_12:                               ; %_calloc_r.exit
#0:	       ldga	_impure_data -> r0 ; mprec.c:106[ mprec.c:352 ]
	;;
#0:	       stm.a	r11, r0, 19     ; mprec.c:106[ mprec.c:352 ]
	;;
.BB24_13:                               ; %bb2.i
#2:	       cmplt	r2.24, r10 -> c1 ; mprec.c:350
	;;
#0:	       ldx	$c1 -> r0
	;;
#0:	       add	r0, r13 -> r13
	;;
#0:	       s2add	r11, r13 -> r1  ; mprec.c:115[ mprec.c:352 ]
	;;
#0:	       ldm.f	r1, 0           ; mprec.c:115[ mprec.c:352 ]
	;;
#0:	       ldx	$mem, 0 -> r11  ; mprec.c:115[ mprec.c:352 ]
	;;
#0:	       brz eq @	r11, .BB24_15   ; mprec.c:115[ mprec.c:352 ]
	;;
.BB24_14:                               ; %bb3.i
#0:	       ldm.f	r11, 0          ; mprec.c:117[ mprec.c:352 ]
#1:	       br	.BB24_26
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:117[ mprec.c:352 ]
	;;
#0:	       stm.a	r0, r1, 0       ; mprec.c:117[ mprec.c:352 ]
	;;
.BB24_15:                               ; %bb4.i
#0:	       ldi	1 -> r0
#1:	       callg	__malloc_r      ; mallocr.c:3207[ mprec.c:123[ mprec.c:352 ] ]
	;;
#0:	       sl	r0, r13 -> r0.23 ; mprec.c:121[ mprec.c:352 ]
#1:	       ldi	20 -> r0
	;;
#0:	       s2add	r0, r0.23 -> r0 ; mprec.c:123[ mprec.c:352 ]
	;;
	       nop	0
	;;
#0:	       brz eq @	r0, .BB24_27    ; mallocr.c:3209[ mprec.c:123[ mprec.c:352 ] ]
#1:	       ldi	0 -> r11
	;;
.BB24_16:                               ; %bb1.i6
#0:	       or	r0, 0 -> r11    ; mallocr.c:3207[ mprec.c:123[ mprec.c:352 ] ]
#1:	       ldi	-4 -> r1
	;;
#0:	       ldm.f	r11, -4         ; mallocr.c:3233[ mprec.c:123[ mprec.c:352 ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:3233[ mprec.c:123[ mprec.c:352 ] ]
	;;
#0:	       sub	r0, 4 -> r0
	;;
#0:	       and	r0, r1 -> r2
#1:	       ldi	36 -> r0
	;;
#0:	       cmpult	r0, r2 -> c1    ; mallocr.c:3244[ mprec.c:123[ mprec.c:352 ] ]
	;;
#0:	if  c1 br @	.BB24_24
	;;
.BB24_17:                               ; %bb2.i7
#0:	       cmpult	r2, 20 -> c1    ; mallocr.c:3244[ mprec.c:123[ mprec.c:352 ] ]
#1:	       or	r11, 0 -> r0
	;;
#0:	if  c1 br @	.BB24_23
	;;
.BB24_18:                               ; %bb3.i8
#0:	       cmpult	r2, 28 -> c1    ; mallocr.c:3244[ mprec.c:123[ mprec.c:352 ] ]
#1:	       stm.a	0, r11, 0       ; mallocr.c:3244[ mprec.c:123[ mprec.c:352 ] ]
	;;
#0:	if !c1 br @	.BB24_20
#1:	       stm.a	0, r11, 1       ; mallocr.c:3244[ mprec.c:123[ mprec.c:352 ] ]
	;;
.BB24_19:
#0:	       add	r11, 8 -> r0
#1:	       br @	.BB24_23
	;;
.BB24_20:                               ; %bb4.i9
#0:	       ldi	36 -> r0
#1:	       stm.a	0, r11, 2       ; mallocr.c:3244[ mprec.c:123[ mprec.c:352 ] ]
	;;
#0:	       cmpult	r2, r0 -> c1    ; mallocr.c:3244[ mprec.c:123[ mprec.c:352 ] ]
#1:	       stm.a	0, r11, 3       ; mallocr.c:3244[ mprec.c:123[ mprec.c:352 ] ]
	;;
#0:	if !c1 br @	.BB24_22
	;;
.BB24_21:
#0:	       add	r11, 16 -> r0
#1:	       br @	.BB24_23
	;;
.BB24_22:                               ; %bb5.i10
#0:	       stm.a	0, r11, 4       ; mallocr.c:3244[ mprec.c:123[ mprec.c:352 ] ]
#1:	       add	r11, 24 -> r0
	;;
#0:	       stm.a	0, r11, 5       ; mallocr.c:3244[ mprec.c:123[ mprec.c:352 ] ]
	;;
.BB24_23:                               ; %bb6.i12
#0:	       stm.a	0, r0, 0        ; mallocr.c:3244[ mprec.c:123[ mprec.c:352 ] ]
#1:	       br	.BB24_25
	;;
#0:	       stm.a	0, r0, 1        ; mallocr.c:3244[ mprec.c:123[ mprec.c:352 ] ]
	;;
#0:	       stm.a	0, r0, 2        ; mallocr.c:3244[ mprec.c:123[ mprec.c:352 ] ]
	;;
.BB24_24:                               ; %bb7.i13
#0:	       ldi	0 -> r1
#1:	       callg	_memset         ; mallocr.c:3244[ mprec.c:123[ mprec.c:352 ] ]
#2:	       or	r11, 0 -> r0    ; mallocr.c:3244[ mprec.c:123[ mprec.c:352 ] ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB24_25:                               ; %bb6.i
#0:	       stm.a	r13, r11, 1     ; mprec.c:128[ mprec.c:352 ]
	;;
#0:	       stm.a	r0.23, r11, 2   ; mprec.c:129[ mprec.c:352 ]
	;;
.BB24_26:                               ; %bb7.i
#0:	       stm.a	0, r11, 4       ; mprec.c:131[ mprec.c:352 ]
	;;
#0:	       stm.a	0, r11, 3       ; mprec.c:131[ mprec.c:352 ]
	;;
.BB24_27:                               ; %_Balloc.exit
#0:	       cmplt	r10, 1 -> c1    ; mprec.c:353
	;;
#0:	if  c1 br @	.BB24_30
	;;
.BB24_28:                               ; %bb.nph33
#0:	       s2add	r11, r10 -> r0
	;;
#0:	       add	r0, 20 -> r2
#1:	       add	r11, 20 -> r0
	;;
.BB24_29:                               ; %bb4
                                        ; =>This Inner Loop Header: Depth=1
#0:	       add	r0, 4 -> r1
#1:	       stm.a	0, r0, 0        ; mprec.c:354
	;;
#0:	       cmpult	r1, r2 -> c1    ; mprec.c:353
#1:	       or	r1, 0 -> r0
	;;
#0:	if  c1 br @	.BB24_29
	;;
.BB24_30:                               ; %bb6
#0:	       cmplt	r12, 1 -> c1    ; mprec.c:361
	;;
#0:	if  c1 br @	.BB24_41
	;;
.BB24_31:                               ; %bb.nph
#2:	       s2add	r2.23, r12 -> r1
#3:	       s2add	r14, r3.23 -> r0
#0:	       add	r11, 24 -> r7
#1:	       add	r11, 20 -> r6
	;;
#0:	       br	.BB24_35
#1:	       add	r0, 20 -> r8
#2:	       add	r1, 20 -> r9
	;;
#3:	       add	r14, 20 -> r3.16
#2:	       add	r2.23, 20 -> r2.16
	;;
	       nop	0
	;;
.BB24_32:                               ; %bb13
                                        ;   Parent Loop BB24_35 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r3, 0           ; mprec.c:387
#1:	       sub	r4, 2 -> r2     ; mprec.c:387
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:387
#1:	       ldm.f	r4, -2          ; mprec.c:387
	;;
#0:	       bbh	zext16 r0 -> r0 ; mprec.c:387
	;;
#2:	       mul	r0, r5 -> $mul2.0 ; mprec.c:387
#0:	       ldx	$memhu, r2 -> r2 ; mprec.c:387
	;;
#2:	       ldx	$mul2.0, r2.17 -> r0 ; mprec.c:387
	;;
#0:	       add	r0, r2 -> r2    ; mprec.c:387
#1:	       bbh	zext16 r1 -> r0 ; mprec.c:389
#2:	       sub	r4, 4 -> r1
	;;
#3:	       sl	r2, 16 -> r3.17 ; mprec.c:389
	;;
#3:	       or	r3.17, r0 -> r3.17 ; mprec.c:389
#0:	       add	r3, 2 -> r0     ; mprec.c:390
	;;
#3:	       stm.a	r3.17, r1, 0    ; mprec.c:389
	;;
#0:	       ldm.f	r3, 2           ; mprec.c:390
#1:	       add	r3, 4 -> r3
	;;
#0:	       cmpult	r3, r8 -> c1    ; mprec.c:393
	;;
#0:	       ldx	$memhu, r0 -> r1 ; mprec.c:390
#1:	       ldm.f	r4, 0           ; mprec.c:390
	;;
#3:	       mul	r1, r5 -> $mul3.0 ; mprec.c:390
	;;
#0:	       ldx	$memhu, r4 -> r0 ; mprec.c:390
#1:	       add	r4, 4 -> r4
	;;
#0:	if  c1 br	.BB24_32
#3:	       ldx	$mul3.0, r0 -> r1 ; mprec.c:390
#1:	       sr	r2, 16 -> r0    ; mprec.c:388
	;;
#0:	       add	r1, r0 -> r1    ; mprec.c:390
	;;
#2:	       sr	r1, 16 -> r2.17 ; mprec.c:391
	;;
.BB24_33:                               ; %bb14
                                        ;   in Loop: Header=BB24_35 Depth=1
#0:	       sub	r4, 4 -> r0
	;;
#0:	       stm.a	r1, r0, 0
	;;
.BB24_34:                               ; %bb15
                                        ;   in Loop: Header=BB24_35 Depth=1
#2:	       add	r2.16, 4 -> r2.16
#0:	       add	r7, 4 -> r7
#1:	       add	r6, 4 -> r6
	;;
#2:	       cmpult	r2.16, r9 -> c1 ; mprec.c:361
	;;
#0:	if !c1 br @	.BB24_41
	;;
.BB24_35:                               ; %bb7
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB24_32 Depth 2
                                        ;     Child Loop BB24_36 Depth 2
#2:	       ldm.f	r2.16, 0        ; mprec.c:363
#0:	       ldi	0 -> r0.16
#1:	       or	r6, 0 -> r1
	;;
#3:	       or	r3.16, 0 -> r3.17
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:363
	;;
#0:	       bbh	zext16 r0 -> r2 ; mprec.c:363
	;;
#0:	       brz eq @	r2, .BB24_38    ; mprec.c:363
	;;
.BB24_36:                               ; %bb9
                                        ;   Parent Loop BB24_35 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#3:	       ldm.f	r3.17, 0        ; mprec.c:370
	;;
#3:	       add	r3.17, 4 -> r3.17
	;;
#0:	       ldx	$mem, 0 -> r4   ; mprec.c:370
#1:	       ldm.f	r1, 0           ; mprec.c:370
	;;
#0:	       bbh	zext16 r4 -> r0 ; mprec.c:370
#1:	       sr	r4, 16 -> r5    ; mprec.c:372
	;;
#0:	       mul	r0, r2 -> $mul0.0 ; mprec.c:370
#2:	       ldx	$mem, 0 -> r3   ; mprec.c:370
#1:	       mul	r5, r2 -> $mul1.0 ; mprec.c:372
	;;
#0:	       ldx	$mul0.0, r0.16 -> r4 ; mprec.c:370
#1:	       bbh	zext16 r3 -> r0 ; mprec.c:370
	;;
#2:	       add	r4, r0 -> r2.17 ; mprec.c:370
#0:	       sr	r3, 16 -> r0    ; mprec.c:372
	;;
#1:	       ldx	$mul1.0, r0 -> r0 ; mprec.c:372
#2:	       sr	r2.17, 16 -> r5 ; mprec.c:371
#3:	       cmpult	r3.17, r8 -> c1 ; mprec.c:376
	;;
#0:	       add	r0, r5 -> r5    ; mprec.c:372
#1:	       add	r3, r4 -> r0
#2:	       add	r1, 4 -> r4
	;;
#1:	if  c1 br	.BB24_36
#2:	       sl	r5, 16 -> r3    ; mprec.c:374
#3:	       bbh	zext16 r0 -> r0 ; mprec.c:374
#0:	       sr	r5, 16 -> r0.16 ; mprec.c:373
	;;
#0:	       or	r3, r0 -> r0    ; mprec.c:374
	;;
#0:	       stm.a	r0, r1, 0       ; mprec.c:374
#1:	       or	r4, 0 -> r1
	;;
.BB24_37:                               ; %bb10
                                        ;   in Loop: Header=BB24_35 Depth=1
#0:	       stm.a	r0.16, r4, 0
	;;
#2:	       ldm.f	r2.16, 0
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
.BB24_38:                               ; %bb11
                                        ;   in Loop: Header=BB24_35 Depth=1
#0:	       sr	r0, 16 -> r5    ; mprec.c:379
	;;
#0:	       brz eq @	r5, .BB24_34    ; mprec.c:379
	;;
.BB24_39:                               ; %bb12
                                        ;   in Loop: Header=BB24_35 Depth=1
#0:	       ldm.f	r6, 0           ; mprec.c:384
#1:	       br	.BB24_32
#2:	       ldi	0 -> r2.17
#3:	       or	r7, 0 -> r4
	;;
#3:	       or	r3.16, 0 -> r3
	;;
#0:	       ldx	$mem, 0 -> r1   ; mprec.c:384
	;;
.BB24_40:                               ; %bb18
                                        ;   in Loop: Header=BB24_41 Depth=1
#0:	       sub	r10, 1 -> r10
	;;
.BB24_41:                               ; %bb19
                                        ; =>This Inner Loop Header: Depth=1
#0:	       cmplt	r10, 1 -> c1
	;;
#0:	if  c1 br @	.BB24_43
	;;
.BB24_42:                               ; %bb20
                                        ;   in Loop: Header=BB24_41 Depth=1
#0:	       s2add	r11, r10 -> r0
	;;
#0:	       ldm.f	r0, 16          ; mprec.c:416
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:416
	;;
#0:	       brz eq @	r0, .BB24_40    ; mprec.c:416
	;;
.BB24_43:                               ; %bb21
#0:	       stm.a	r10, r11, 4     ; mprec.c:417
#1:	       or	r11, 0 -> r0    ; mprec.c:418
	;;
#0:	       ldm.s	r15, 4          ; mprec.c:418
	;;
#0:	       ldx	$mem, 0 -> r1   ; mprec.c:418
	;;
#0:	       stx	r1 -> $ro       ; mprec.c:418
	;;
#0:	       ldm.s	r15, 8          ; mprec.c:418
	;;
#0:	       ldx	$mem, 0 -> r1   ; mprec.c:418
	;;
#0:	       stx	r1 -> $rb       ; mprec.c:418
	;;
#0:	       ldm.s	r15, 12         ; mprec.c:418
	;;
#2:	       ldx	$mem, 0 -> r2.24 ; mprec.c:418
	;;
#0:	       ldm.s	r15, 16         ; mprec.c:418
	;;
#3:	       ldx	$mem, 0 -> r3.23 ; mprec.c:418
	;;
#0:	       ldm.s	r15, 20         ; mprec.c:418
	;;
#2:	       ldx	$mem, 0 -> r2.23 ; mprec.c:418
	;;
#0:	       ldm.s	r15, 24         ; mprec.c:418
	;;
#0:	       ldx	$mem, 0 -> r0.23 ; mprec.c:418
	;;
#0:	       ldm.s	r15, 28         ; mprec.c:418
	;;
#0:	       ldx	$mem, 0 -> r14  ; mprec.c:418
	;;
#0:	       ldm.s	r15, 32         ; mprec.c:418
	;;
#0:	       ldx	$mem, 0 -> r13  ; mprec.c:418
	;;
#0:	       ldm.s	r15, 36         ; mprec.c:418
	;;
#0:	       ldx	$mem, 0 -> r12  ; mprec.c:418
	;;
#0:	       ldm.s	r15, 40         ; mprec.c:418
	;;
#0:	       ldx	$mem, 0 -> r11  ; mprec.c:418
	;;
#0:	       ldm.s	r15, 44         ; mprec.c:418
#1:	       s2add	r15, 16 -> r15  ; mprec.c:418
	;;
#0:	       jop	ret             ; mprec.c:418
#1:	       ldx	$mem, 0 -> r10  ; mprec.c:418
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
___multiply_end:

	.align	4
___multadd:                             ; @__multadd
	.size	___multadd_end-___multadd
___multadd_start:
; BB#0:                                 ; %entry
#0:	       ldiu	56 -> r2        ; mprec.c:160
#1:	       wb.s	r15, 14         ; mprec.c:160
#2:	       ldi	0 -> r5
	;;
#0:	       sub	r15, r2 -> r15  ; mprec.c:160
#1:	       ldx	$rb, 0 -> r2    ; mprec.c:160
	;;
#0:	       stm.s	r10, r15, 9     ; mprec.c:160
	;;
#0:	       stm.s	r11, r15, 8     ; mprec.c:160
#1:	       or	r0, 0 -> r11
	;;
#0:	       stm.s	r12, r15, 7     ; mprec.c:160
	;;
#0:	       stm.s	r13, r15, 6     ; mprec.c:160
#1:	       or	r5, 0 -> r13
	;;
#0:	       stm.s	r14, r15, 5     ; mprec.c:160
	;;
#1:	       stm.s	r1.23, r15, 4   ; mprec.c:160
	;;
#0:	       stm.s	r2, r15, 3      ; mprec.c:160
#1:	       ldx	$ro, 0 -> r2    ; mprec.c:160
	;;
#0:	       stm.s	r2, r15, 2      ; mprec.c:160
	;;
#0:	       ldm.f	r0, 16          ; mprec.c:160
	;;
#0:	       ldx	$mem, 0 -> r12  ; mprec.c:160
	;;
.BB25_1:                                ; %bb
                                        ; =>This Inner Loop Header: Depth=1
#0:	       s2add	r11, r5 -> r6
#1:	       add	r5, 1 -> r5     ; mprec.c:177
	;;
#0:	       ldm.f	r6, 20          ; mprec.c:166
#1:	       cmplt	r5, r12 -> c1   ; mprec.c:177
	;;
#0:	       ldx	$mem, 0 -> r2   ; mprec.c:166
	;;
#0:	       bbh	zext16 r2 -> r0 ; mprec.c:167
	;;
#0:	       mul	r0, r1 -> $mul0.0 ; mprec.c:167
#1:	       sr	r2, 16 -> r0    ; mprec.c:168
	;;
#0:	       ldx	$mul0.0, r13 -> r4 ; mprec.c:167
#1:	       mul	r0, r1 -> $mul1.0 ; mprec.c:168
	;;
#0:	       sr	r4, 16 -> r0    ; mprec.c:168
#1:	       bbh	zext16 r4 -> r2 ; mprec.c:170
	;;
#1:	       ldx	$mul1.0, r0 -> r0 ; mprec.c:168
	;;
#0:	if  c1 br	.BB25_1
#1:	       sl	r0, 16 -> r3    ; mprec.c:170
#2:	       sr	r0, 16 -> r13   ; mprec.c:169
	;;
#0:	       or	r3, r2 -> r0
	;;
#0:	       stm.a	r0, r6, 5       ; mprec.c:170
	;;
.BB25_2:                                ; %bb1
#0:	       cmpeq	r13, 0 -> c3    ; mprec.c:178
	;;
#0:	if  c3 br @	.BB25_35        ; mprec.c:178
	;;
.BB25_3:                                ; %bb2
#0:	       ldm.f	r11, 8          ; mprec.c:180
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:180
	;;
#0:	       cmplt	r12, r0 -> c1   ; mprec.c:180
	;;
#0:	if !c1 br @	.BB25_5
	;;
.BB25_4:
#0:	       or	r11, 0 -> r10
#1:	       br @	.BB25_34
	;;
.BB25_5:                                ; %bb3
#0:	       ldm.f	r11, 4          ; mprec.c:182
	;;
#0:	       ldx	$mem, 0 -> r14  ; mprec.c:182
#1:	       ldmg.d	_impure_data+76 ; mprec.c:103[ mprec.c:182 ]
	;;
#0:	       ldx	$mem, 0 -> r10  ; mprec.c:103[ mprec.c:182 ]
	;;
#0:	       brz ne @	r10, .BB25_18   ; mprec.c:103[ mprec.c:182 ]
	;;
.BB25_6:                                ; %bb.i
#0:	       ldi	132 -> r0
#1:	       callg	__malloc_r      ; mallocr.c:3207[ mprec.c:106[ mprec.c:182 ] ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz ne @	r0, .BB25_8     ; mallocr.c:3209[ mprec.c:106[ mprec.c:182 ] ]
	;;
.BB25_7:                                ; %_calloc_r.exit.thread
#0:	       ldga	_impure_data -> r0 ; mprec.c:106[ mprec.c:182 ]
#1:	       br	.BB25_32
#2:	       ldi	0 -> r10
	;;
#0:	       stm.a	0, r0, 19       ; mprec.c:106[ mprec.c:182 ]
	;;
	       nop	0
	;;
.BB25_8:                                ; %bb1.i
#0:	       or	r0, 0 -> r10    ; mallocr.c:3207[ mprec.c:106[ mprec.c:182 ] ]
#1:	       ldi	-4 -> r1
	;;
#0:	       ldm.f	r10, -4         ; mallocr.c:3233[ mprec.c:106[ mprec.c:182 ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:3233[ mprec.c:106[ mprec.c:182 ] ]
	;;
#0:	       sub	r0, 4 -> r0
	;;
#0:	       and	r0, r1 -> r2
#1:	       ldi	36 -> r0
	;;
#0:	       cmpult	r0, r2 -> c1    ; mallocr.c:3244[ mprec.c:106[ mprec.c:182 ] ]
	;;
#0:	if  c1 br @	.BB25_16
	;;
.BB25_9:                                ; %bb2.i1
#0:	       cmpult	r2, 20 -> c1    ; mallocr.c:3244[ mprec.c:106[ mprec.c:182 ] ]
#1:	       or	r10, 0 -> r0
	;;
#0:	if  c1 br @	.BB25_15
	;;
.BB25_10:                               ; %bb3.i2
#0:	       cmpult	r2, 28 -> c1    ; mallocr.c:3244[ mprec.c:106[ mprec.c:182 ] ]
#1:	       stm.a	0, r10, 0       ; mallocr.c:3244[ mprec.c:106[ mprec.c:182 ] ]
	;;
#0:	if !c1 br @	.BB25_12
#1:	       stm.a	0, r10, 1       ; mallocr.c:3244[ mprec.c:106[ mprec.c:182 ] ]
	;;
.BB25_11:
#0:	       add	r10, 8 -> r0
#1:	       br @	.BB25_15
	;;
.BB25_12:                               ; %bb4.i3
#0:	       ldi	36 -> r0
#1:	       stm.a	0, r10, 2       ; mallocr.c:3244[ mprec.c:106[ mprec.c:182 ] ]
	;;
#0:	       cmpult	r2, r0 -> c1    ; mallocr.c:3244[ mprec.c:106[ mprec.c:182 ] ]
#1:	       stm.a	0, r10, 3       ; mallocr.c:3244[ mprec.c:106[ mprec.c:182 ] ]
	;;
#0:	if !c1 br @	.BB25_14
	;;
.BB25_13:
#0:	       add	r10, 16 -> r0
#1:	       br @	.BB25_15
	;;
.BB25_14:                               ; %bb5.i
#0:	       stm.a	0, r10, 4       ; mallocr.c:3244[ mprec.c:106[ mprec.c:182 ] ]
#1:	       add	r10, 24 -> r0
	;;
#0:	       stm.a	0, r10, 5       ; mallocr.c:3244[ mprec.c:106[ mprec.c:182 ] ]
	;;
.BB25_15:                               ; %bb6.i4
#0:	       stm.a	0, r0, 0        ; mallocr.c:3244[ mprec.c:106[ mprec.c:182 ] ]
#1:	       br	.BB25_17
	;;
#0:	       stm.a	0, r0, 1        ; mallocr.c:3244[ mprec.c:106[ mprec.c:182 ] ]
	;;
#0:	       stm.a	0, r0, 2        ; mallocr.c:3244[ mprec.c:106[ mprec.c:182 ] ]
	;;
.BB25_16:                               ; %bb7.i5
#0:	       ldi	0 -> r1
#1:	       callg	_memset         ; mallocr.c:3244[ mprec.c:106[ mprec.c:182 ] ]
#2:	       or	r10, 0 -> r0    ; mallocr.c:3244[ mprec.c:106[ mprec.c:182 ] ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB25_17:                               ; %_calloc_r.exit
#0:	       ldga	_impure_data -> r0 ; mprec.c:106[ mprec.c:182 ]
	;;
#0:	       stm.a	r10, r0, 19     ; mprec.c:106[ mprec.c:182 ]
	;;
.BB25_18:                               ; %bb2.i
#0:	       s2add	r10, r14 -> r1
	;;
#0:	       ldm.f	r1, 4           ; mprec.c:115[ mprec.c:182 ]
	;;
#0:	       ldx	$mem, 0 -> r10  ; mprec.c:115[ mprec.c:182 ]
	;;
#0:	       brz eq @	r10, .BB25_20   ; mprec.c:115[ mprec.c:182 ]
	;;
.BB25_19:                               ; %bb3.i
#0:	       ldm.f	r10, 0          ; mprec.c:117[ mprec.c:182 ]
#1:	       br	.BB25_31
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:117[ mprec.c:182 ]
	;;
#0:	       stm.a	r0, r1, 1       ; mprec.c:117[ mprec.c:182 ]
	;;
.BB25_20:                               ; %bb4.i
#0:	       add	r14, 1 -> r14   ; mprec.c:182
#1:	       callg	__malloc_r      ; mallocr.c:3207[ mprec.c:123[ mprec.c:182 ] ]
#2:	       ldi	1 -> r0
	;;
#1:	       sl	r0, r14 -> r1.23 ; mprec.c:121[ mprec.c:182 ]
#0:	       ldi	20 -> r0
	;;
#1:	       s2add	r0, r1.23 -> r0 ; mprec.c:123[ mprec.c:182 ]
	;;
	       nop	0
	;;
#0:	       brz eq @	r0, .BB25_32    ; mallocr.c:3209[ mprec.c:123[ mprec.c:182 ] ]
#1:	       ldi	0 -> r10
	;;
.BB25_21:                               ; %bb1.i6
#0:	       or	r0, 0 -> r10    ; mallocr.c:3207[ mprec.c:123[ mprec.c:182 ] ]
#1:	       ldi	-4 -> r1
	;;
#0:	       ldm.f	r10, -4         ; mallocr.c:3233[ mprec.c:123[ mprec.c:182 ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:3233[ mprec.c:123[ mprec.c:182 ] ]
	;;
#0:	       sub	r0, 4 -> r0
	;;
#0:	       and	r0, r1 -> r2
#1:	       ldi	36 -> r0
	;;
#0:	       cmpult	r0, r2 -> c1    ; mallocr.c:3244[ mprec.c:123[ mprec.c:182 ] ]
	;;
#0:	if  c1 br @	.BB25_29
	;;
.BB25_22:                               ; %bb2.i7
#0:	       cmpult	r2, 20 -> c1    ; mallocr.c:3244[ mprec.c:123[ mprec.c:182 ] ]
#1:	       or	r10, 0 -> r0
	;;
#0:	if  c1 br @	.BB25_28
	;;
.BB25_23:                               ; %bb3.i8
#0:	       cmpult	r2, 28 -> c1    ; mallocr.c:3244[ mprec.c:123[ mprec.c:182 ] ]
#1:	       stm.a	0, r10, 0       ; mallocr.c:3244[ mprec.c:123[ mprec.c:182 ] ]
	;;
#0:	if !c1 br @	.BB25_25
#1:	       stm.a	0, r10, 1       ; mallocr.c:3244[ mprec.c:123[ mprec.c:182 ] ]
	;;
.BB25_24:
#0:	       add	r10, 8 -> r0
#1:	       br @	.BB25_28
	;;
.BB25_25:                               ; %bb4.i9
#0:	       ldi	36 -> r0
#1:	       stm.a	0, r10, 2       ; mallocr.c:3244[ mprec.c:123[ mprec.c:182 ] ]
	;;
#0:	       cmpult	r2, r0 -> c1    ; mallocr.c:3244[ mprec.c:123[ mprec.c:182 ] ]
#1:	       stm.a	0, r10, 3       ; mallocr.c:3244[ mprec.c:123[ mprec.c:182 ] ]
	;;
#0:	if !c1 br @	.BB25_27
	;;
.BB25_26:
#0:	       add	r10, 16 -> r0
#1:	       br @	.BB25_28
	;;
.BB25_27:                               ; %bb5.i10
#0:	       stm.a	0, r10, 4       ; mallocr.c:3244[ mprec.c:123[ mprec.c:182 ] ]
#1:	       add	r10, 24 -> r0
	;;
#0:	       stm.a	0, r10, 5       ; mallocr.c:3244[ mprec.c:123[ mprec.c:182 ] ]
	;;
.BB25_28:                               ; %bb6.i12
#0:	       stm.a	0, r0, 0        ; mallocr.c:3244[ mprec.c:123[ mprec.c:182 ] ]
#1:	       br	.BB25_30
	;;
#0:	       stm.a	0, r0, 1        ; mallocr.c:3244[ mprec.c:123[ mprec.c:182 ] ]
	;;
#0:	       stm.a	0, r0, 2        ; mallocr.c:3244[ mprec.c:123[ mprec.c:182 ] ]
	;;
.BB25_29:                               ; %bb7.i13
#0:	       ldi	0 -> r1
#1:	       callg	_memset         ; mallocr.c:3244[ mprec.c:123[ mprec.c:182 ] ]
#2:	       or	r10, 0 -> r0    ; mallocr.c:3244[ mprec.c:123[ mprec.c:182 ] ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB25_30:                               ; %bb6.i
#0:	       stm.a	r14, r10, 1     ; mprec.c:128[ mprec.c:182 ]
	;;
#1:	       stm.a	r1.23, r10, 2   ; mprec.c:129[ mprec.c:182 ]
	;;
.BB25_31:                               ; %bb7.i
#0:	       stm.a	0, r10, 4       ; mprec.c:131[ mprec.c:182 ]
	;;
#0:	       stm.a	0, r10, 3       ; mprec.c:131[ mprec.c:182 ]
	;;
.BB25_32:                               ; %_Balloc.exit
#0:	       ldm.f	r11, 16         ; mprec.c:183
#1:	       ldi	8 -> r2
#2:	       add	r10, 12 -> r0   ; mprec.c:183
#3:	       add	r11, 12 -> r1   ; mprec.c:183
	;;
#0:	       callg	_memcpy         ; mprec.c:183
#1:	       ldx	$mem, 0 -> r3   ; mprec.c:183
	;;
#0:	       s2add	r2, r3 -> r2    ; mprec.c:183
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz eq @	r11, .BB25_34   ; mprec.c:139[ mprec.c:184 ]
	;;
.BB25_33:                               ; %bb.i7
#0:	       ldmg.d	_impure_data+76 ; mprec.c:141[ mprec.c:184 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:141[ mprec.c:184 ]
#1:	       ldm.f	r11, 4          ; mprec.c:141[ mprec.c:184 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; mprec.c:141[ mprec.c:184 ]
	;;
#0:	       s2add	r0, r1 -> r0    ; mprec.c:141[ mprec.c:184 ]
	;;
#0:	       ldm.f	r0, 0           ; mprec.c:141[ mprec.c:184 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:141[ mprec.c:184 ]
	;;
#0:	       stm.a	r0, r11, 0      ; mprec.c:141[ mprec.c:184 ]
	;;
#0:	       ldmg.d	_impure_data+76 ; mprec.c:142[ mprec.c:184 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:142[ mprec.c:184 ]
	;;
#0:	       s2add	r0, r1 -> r0    ; mprec.c:142[ mprec.c:184 ]
	;;
#0:	       stm.a	r11, r0, 0      ; mprec.c:142[ mprec.c:184 ]
	;;
.BB25_34:                               ; %bb4
#0:	       or	r10, 0 -> r0
#1:	       add	r12, 1 -> r2    ; mprec.c:187
	;;
#0:	       br	.BB25_36
#1:	       s2add	r0, r12 -> r1
	;;
#0:	       stm.a	r13, r1, 5      ; mprec.c:187
	;;
#0:	       stm.a	r2, r0, 4       ; mprec.c:188
	;;
.BB25_35:                               ; %bb5
#0:	       or	r11, 0 -> r0    ; mprec.c:190
	;;
.BB25_36:                               ; %bb5
#0:	       ldm.s	r15, 8          ; mprec.c:190
	;;
#0:	       ldx	$mem, 0 -> r1   ; mprec.c:190
	;;
#0:	       stx	r1 -> $ro       ; mprec.c:190
	;;
#0:	       ldm.s	r15, 12         ; mprec.c:190
	;;
#0:	       ldx	$mem, 0 -> r1   ; mprec.c:190
	;;
#0:	       stx	r1 -> $rb       ; mprec.c:190
	;;
#0:	       ldm.s	r15, 16         ; mprec.c:190
	;;
#1:	       ldx	$mem, 0 -> r1.23 ; mprec.c:190
	;;
#0:	       ldm.s	r15, 20         ; mprec.c:190
	;;
#0:	       ldx	$mem, 0 -> r14  ; mprec.c:190
	;;
#0:	       ldm.s	r15, 24         ; mprec.c:190
	;;
#0:	       ldx	$mem, 0 -> r13  ; mprec.c:190
	;;
#0:	       ldm.s	r15, 28         ; mprec.c:190
	;;
#0:	       ldx	$mem, 0 -> r12  ; mprec.c:190
	;;
#0:	       ldm.s	r15, 32         ; mprec.c:190
	;;
#0:	       ldx	$mem, 0 -> r11  ; mprec.c:190
	;;
#0:	       ldm.s	r15, 36         ; mprec.c:190
#1:	       s2add	r15, 14 -> r15  ; mprec.c:190
	;;
#0:	       jop	ret             ; mprec.c:190
#1:	       ldx	$mem, 0 -> r10  ; mprec.c:190
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
___multadd_end:

	.align	4
___pow5mult:                            ; @__pow5mult
	.size	___pow5mult_end-___pow5mult
___pow5mult_start:
; BB#0:                                 ; %entry
#0:	       ldiu	48 -> r2
#1:	       wb.s	r15, 12
	;;
#0:	       sub	r15, r2 -> r15
#1:	       ldx	$rb, 0 -> r2
	;;
#0:	       stm.s	r10, r15, 7
#1:	       or	r1, 0 -> r10
	;;
#0:	       stm.s	r11, r15, 6
#1:	       and	r10, 3 -> r1    ; mprec.c:429
	;;
#0:	       stm.s	r12, r15, 5
#1:	       or	r0, 0 -> r12
	;;
#0:	       brz eq	r1, .BB26_2     ; mprec.c:429
#1:	       stm.s	r13, r15, 4
	;;
#0:	       stm.s	r2, r15, 3
#1:	       ldx	$ro, 0 -> r2
	;;
#0:	       stm.s	r2, r15, 2
	;;
.BB26_1:                                ; %bb
#0:	       ldga	_p05.2269 -> r2 ; mprec.c:430
	;;
#0:	       s2add	r2, r1 -> r1    ; mprec.c:430
	;;
#0:	       ldm.f	r1, -4          ; mprec.c:430
	;;
#0:	       callg	___multadd      ; mprec.c:430
#1:	       ldx	$mem, 0 -> r1   ; mprec.c:430
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r12
	;;
.BB26_2:                                ; %bb1
#0:	       sra	r10, 2 -> r11   ; mprec.c:432
	;;
#0:	       cmpeq	r11, 0 -> c3    ; mprec.c:432
	;;
#0:	if  c3 br @	.BB26_40        ; mprec.c:432
	;;
.BB26_3:                                ; %bb3
#0:	       ldmg.d	_impure_data+72 ; mprec.c:435
#1:	       or	r12, 0 -> r10
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:435
	;;
#0:	       brz ne @	r0, .BB26_33    ; mprec.c:435
	;;
.BB26_4:                                ; %bb4
#0:	       ldmg.d	_impure_data+76 ; mprec.c:103[ mprec.c:323[ mprec.c:438 ] ]
	;;
#0:	       ldx	$mem, 0 -> r10  ; mprec.c:103[ mprec.c:323[ mprec.c:438 ] ]
	;;
#0:	       brz ne @	r10, .BB26_17   ; mprec.c:103[ mprec.c:323[ mprec.c:438 ] ]
	;;
.BB26_5:                                ; %bb.i.i
#0:	       ldi	132 -> r0
#1:	       callg	__malloc_r      ; mallocr.c:3207[ mprec.c:106[ mprec.c:323[ mprec.c:438 ] ] ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz ne @	r0, .BB26_7     ; mallocr.c:3209[ mprec.c:106[ mprec.c:323[ mprec.c:438 ] ] ]
	;;
.BB26_6:                                ; %_calloc_r.exit.thread
#0:	       ldga	_impure_data -> r1 ; mprec.c:106[ mprec.c:323[ mprec.c:438 ] ]
#1:	       br	.BB26_31
#2:	       ldi	0 -> r0
	;;
#0:	       stm.a	0, r1, 19       ; mprec.c:106[ mprec.c:323[ mprec.c:438 ] ]
	;;
	       nop	0
	;;
.BB26_7:                                ; %bb1.i
#0:	       or	r0, 0 -> r10    ; mallocr.c:3207[ mprec.c:106[ mprec.c:323[ mprec.c:438 ] ] ]
#1:	       ldi	-4 -> r1
	;;
#0:	       ldm.f	r10, -4         ; mallocr.c:3233[ mprec.c:106[ mprec.c:323[ mprec.c:438 ] ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:3233[ mprec.c:106[ mprec.c:323[ mprec.c:438 ] ] ]
	;;
#0:	       sub	r0, 4 -> r0
	;;
#0:	       and	r0, r1 -> r2
#1:	       ldi	36 -> r0
	;;
#0:	       cmpult	r0, r2 -> c1    ; mallocr.c:3244[ mprec.c:106[ mprec.c:323[ mprec.c:438 ] ] ]
	;;
#0:	if  c1 br @	.BB26_15
	;;
.BB26_8:                                ; %bb2.i
#0:	       cmpult	r2, 20 -> c1    ; mallocr.c:3244[ mprec.c:106[ mprec.c:323[ mprec.c:438 ] ] ]
#1:	       or	r10, 0 -> r0
	;;
#0:	if  c1 br @	.BB26_14
	;;
.BB26_9:                                ; %bb3.i
#0:	       cmpult	r2, 28 -> c1    ; mallocr.c:3244[ mprec.c:106[ mprec.c:323[ mprec.c:438 ] ] ]
#1:	       stm.a	0, r10, 0       ; mallocr.c:3244[ mprec.c:106[ mprec.c:323[ mprec.c:438 ] ] ]
	;;
#0:	if !c1 br @	.BB26_11
#1:	       stm.a	0, r10, 1       ; mallocr.c:3244[ mprec.c:106[ mprec.c:323[ mprec.c:438 ] ] ]
	;;
.BB26_10:
#0:	       add	r10, 8 -> r0
#1:	       br @	.BB26_14
	;;
.BB26_11:                               ; %bb4.i
#0:	       ldi	36 -> r0
#1:	       stm.a	0, r10, 2       ; mallocr.c:3244[ mprec.c:106[ mprec.c:323[ mprec.c:438 ] ] ]
	;;
#0:	       cmpult	r2, r0 -> c1    ; mallocr.c:3244[ mprec.c:106[ mprec.c:323[ mprec.c:438 ] ] ]
#1:	       stm.a	0, r10, 3       ; mallocr.c:3244[ mprec.c:106[ mprec.c:323[ mprec.c:438 ] ] ]
	;;
#0:	if !c1 br @	.BB26_13
	;;
.BB26_12:
#0:	       add	r10, 16 -> r0
#1:	       br @	.BB26_14
	;;
.BB26_13:                               ; %bb5.i
#0:	       stm.a	0, r10, 4       ; mallocr.c:3244[ mprec.c:106[ mprec.c:323[ mprec.c:438 ] ] ]
#1:	       add	r10, 24 -> r0
	;;
#0:	       stm.a	0, r10, 5       ; mallocr.c:3244[ mprec.c:106[ mprec.c:323[ mprec.c:438 ] ] ]
	;;
.BB26_14:                               ; %bb6.i
#0:	       stm.a	0, r0, 0        ; mallocr.c:3244[ mprec.c:106[ mprec.c:323[ mprec.c:438 ] ] ]
#1:	       br	.BB26_16
	;;
#0:	       stm.a	0, r0, 1        ; mallocr.c:3244[ mprec.c:106[ mprec.c:323[ mprec.c:438 ] ] ]
	;;
#0:	       stm.a	0, r0, 2        ; mallocr.c:3244[ mprec.c:106[ mprec.c:323[ mprec.c:438 ] ] ]
	;;
.BB26_15:                               ; %bb7.i
#0:	       ldi	0 -> r1
#1:	       callg	_memset         ; mallocr.c:3244[ mprec.c:106[ mprec.c:323[ mprec.c:438 ] ] ]
#2:	       or	r10, 0 -> r0    ; mallocr.c:3244[ mprec.c:106[ mprec.c:323[ mprec.c:438 ] ] ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB26_16:                               ; %_calloc_r.exit
#0:	       ldga	_impure_data -> r0 ; mprec.c:106[ mprec.c:323[ mprec.c:438 ] ]
	;;
#0:	       stm.a	r10, r0, 19     ; mprec.c:106[ mprec.c:323[ mprec.c:438 ] ]
	;;
.BB26_17:                               ; %bb2.i.i
#0:	       ldm.f	r10, 4          ; mprec.c:115[ mprec.c:323[ mprec.c:438 ] ]
	;;
#0:	       ldx	$mem, 0 -> r13  ; mprec.c:115[ mprec.c:323[ mprec.c:438 ] ]
	;;
#0:	       brz eq @	r13, .BB26_19   ; mprec.c:115[ mprec.c:323[ mprec.c:438 ] ]
	;;
.BB26_18:                               ; %bb3.i.i
#0:	       ldm.f	r13, 0          ; mprec.c:117[ mprec.c:323[ mprec.c:438 ] ]
#1:	       br	.BB26_30
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:117[ mprec.c:323[ mprec.c:438 ] ]
	;;
#0:	       stm.a	r0, r10, 1      ; mprec.c:117[ mprec.c:323[ mprec.c:438 ] ]
	;;
.BB26_19:                               ; %bb4.i.i
#0:	       ldi	28 -> r0
#1:	       callg	__malloc_r      ; mallocr.c:3207[ mprec.c:123[ mprec.c:323[ mprec.c:438 ] ] ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r13    ; mallocr.c:3207[ mprec.c:123[ mprec.c:323[ mprec.c:438 ] ] ]
#1:	       ldi	0 -> r0
	;;
#0:	       brz eq @	r13, .BB26_31   ; mallocr.c:3209[ mprec.c:123[ mprec.c:323[ mprec.c:438 ] ] ]
	;;
.BB26_20:                               ; %bb1.i1
#0:	       ldm.f	r13, -4         ; mallocr.c:3233[ mprec.c:123[ mprec.c:323[ mprec.c:438 ] ] ]
#1:	       ldi	-4 -> r1
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:3233[ mprec.c:123[ mprec.c:323[ mprec.c:438 ] ] ]
	;;
#0:	       sub	r0, 4 -> r0
	;;
#0:	       and	r0, r1 -> r2
#1:	       ldi	36 -> r0
	;;
#0:	       cmpult	r0, r2 -> c1    ; mallocr.c:3244[ mprec.c:123[ mprec.c:323[ mprec.c:438 ] ] ]
	;;
#0:	if  c1 br @	.BB26_28
	;;
.BB26_21:                               ; %bb2.i2
#0:	       cmpult	r2, 20 -> c1    ; mallocr.c:3244[ mprec.c:123[ mprec.c:323[ mprec.c:438 ] ] ]
#1:	       or	r13, 0 -> r0
	;;
#0:	if  c1 br @	.BB26_27
	;;
.BB26_22:                               ; %bb3.i3
#0:	       cmpult	r2, 28 -> c1    ; mallocr.c:3244[ mprec.c:123[ mprec.c:323[ mprec.c:438 ] ] ]
#1:	       stm.a	0, r13, 0       ; mallocr.c:3244[ mprec.c:123[ mprec.c:323[ mprec.c:438 ] ] ]
	;;
#0:	if !c1 br @	.BB26_24
#1:	       stm.a	0, r13, 1       ; mallocr.c:3244[ mprec.c:123[ mprec.c:323[ mprec.c:438 ] ] ]
	;;
.BB26_23:
#0:	       add	r13, 8 -> r0
#1:	       br @	.BB26_27
	;;
.BB26_24:                               ; %bb4.i4
#0:	       ldi	36 -> r0
#1:	       stm.a	0, r13, 2       ; mallocr.c:3244[ mprec.c:123[ mprec.c:323[ mprec.c:438 ] ] ]
	;;
#0:	       cmpult	r2, r0 -> c1    ; mallocr.c:3244[ mprec.c:123[ mprec.c:323[ mprec.c:438 ] ] ]
#1:	       stm.a	0, r13, 3       ; mallocr.c:3244[ mprec.c:123[ mprec.c:323[ mprec.c:438 ] ] ]
	;;
#0:	if !c1 br @	.BB26_26
	;;
.BB26_25:
#0:	       add	r13, 16 -> r0
#1:	       br @	.BB26_27
	;;
.BB26_26:                               ; %bb5.i5
#0:	       stm.a	0, r13, 4       ; mallocr.c:3244[ mprec.c:123[ mprec.c:323[ mprec.c:438 ] ] ]
#1:	       add	r13, 24 -> r0
	;;
#0:	       stm.a	0, r13, 5       ; mallocr.c:3244[ mprec.c:123[ mprec.c:323[ mprec.c:438 ] ] ]
	;;
.BB26_27:                               ; %bb6.i7
#0:	       stm.a	0, r0, 0        ; mallocr.c:3244[ mprec.c:123[ mprec.c:323[ mprec.c:438 ] ] ]
#1:	       br	.BB26_29
	;;
#0:	       stm.a	0, r0, 1        ; mallocr.c:3244[ mprec.c:123[ mprec.c:323[ mprec.c:438 ] ] ]
	;;
#0:	       stm.a	0, r0, 2        ; mallocr.c:3244[ mprec.c:123[ mprec.c:323[ mprec.c:438 ] ] ]
	;;
.BB26_28:                               ; %bb7.i8
#0:	       ldi	0 -> r1
#1:	       callg	_memset         ; mallocr.c:3244[ mprec.c:123[ mprec.c:323[ mprec.c:438 ] ] ]
#2:	       or	r13, 0 -> r0    ; mallocr.c:3244[ mprec.c:123[ mprec.c:323[ mprec.c:438 ] ] ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB26_29:                               ; %bb6.i.i
#0:	       stm.a	1, r13, 1       ; mprec.c:128[ mprec.c:323[ mprec.c:438 ] ]
	;;
#0:	       stm.a	2, r13, 2       ; mprec.c:129[ mprec.c:323[ mprec.c:438 ] ]
	;;
.BB26_30:                               ; %bb7.i.i
#0:	       or	r13, 0 -> r0
	;;
#0:	       stm.a	0, r0, 4        ; mprec.c:131[ mprec.c:323[ mprec.c:438 ] ]
	;;
#0:	       stm.a	0, r0, 3        ; mprec.c:131[ mprec.c:323[ mprec.c:438 ] ]
	;;
.BB26_31:                               ; %__i2b.exit
#0:	       ldi	625 -> r1
	;;
#0:	       stm.a	r1, r0, 5       ; mprec.c:324[ mprec.c:438 ]
#1:	       ldga	_impure_data -> r1 ; mprec.c:438
	;;
#0:	       stm.a	1, r0, 4        ; mprec.c:325[ mprec.c:438 ]
	;;
#0:	       stm.a	r0, r1, 18      ; mprec.c:438
	;;
.BB26_32:                               ; %__i2b.exit
#0:	       or	r12, 0 -> r10
#1:	       stm.a	0, r0, 0        ; mprec.c:439
	;;
.BB26_33:                               ; %bb5
                                        ; =>This Inner Loop Header: Depth=1
#0:	       btest	r11, 0 -> c1    ; mprec.c:443
#1:	       or	r0, 0 -> r13
	;;
#0:	if  c1 br @	.BB26_35
	;;
.BB26_34:                               ;   in Loop: Header=BB26_33 Depth=1
#0:	       or	r10, 0 -> r12
#1:	       br @	.BB26_37
	;;
.BB26_35:                               ; %bb6
                                        ;   in Loop: Header=BB26_33 Depth=1
#0:	       or	r10, 0 -> r0    ; mprec.c:445
#1:	       callg	___multiply     ; mprec.c:445
#2:	       or	r13, 0 -> r1    ; mprec.c:445
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz eq @	r10, .BB26_37   ; mprec.c:139[ mprec.c:446 ]
#1:	       or	r0, 0 -> r12
	;;
.BB26_36:                               ; %bb.i
                                        ;   in Loop: Header=BB26_33 Depth=1
#0:	       ldmg.d	_impure_data+76 ; mprec.c:141[ mprec.c:446 ]
#1:	       or	r0, 0 -> r12
	;;
#0:	       ldx	$mem, 0 -> r1   ; mprec.c:141[ mprec.c:446 ]
#1:	       ldm.f	r10, 4          ; mprec.c:141[ mprec.c:446 ]
	;;
#0:	       ldx	$mem, 0 -> r2   ; mprec.c:141[ mprec.c:446 ]
	;;
#0:	       s2add	r1, r2 -> r1    ; mprec.c:141[ mprec.c:446 ]
	;;
#0:	       ldm.f	r1, 0           ; mprec.c:141[ mprec.c:446 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; mprec.c:141[ mprec.c:446 ]
	;;
#0:	       stm.a	r1, r10, 0      ; mprec.c:141[ mprec.c:446 ]
	;;
#0:	       ldmg.d	_impure_data+76 ; mprec.c:142[ mprec.c:446 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; mprec.c:142[ mprec.c:446 ]
	;;
#0:	       s2add	r1, r2 -> r1    ; mprec.c:142[ mprec.c:446 ]
	;;
#0:	       stm.a	r10, r1, 0      ; mprec.c:142[ mprec.c:446 ]
	;;
.BB26_37:                               ; %bb7
                                        ;   in Loop: Header=BB26_33 Depth=1
#0:	       sra	r11, 1 -> r11   ; mprec.c:449
	;;
#0:	       brz eq @	r11, .BB26_40   ; mprec.c:449
	;;
.BB26_38:                               ; %bb8
                                        ;   in Loop: Header=BB26_33 Depth=1
#0:	       ldm.f	r13, 0          ; mprec.c:451
#1:	       or	r12, 0 -> r10
	;;
#0:	       ldx	$mem, 0 -> r0   ; mprec.c:451
	;;
#0:	       brz ne @	r0, .BB26_33    ; mprec.c:451
	;;
.BB26_39:                               ; %bb9
#0:	       or	r13, 0 -> r0    ; mprec.c:453
#1:	       callg	___multiply     ; mprec.c:453
#2:	       or	r13, 0 -> r1    ; mprec.c:453
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       br @	.BB26_32
#1:	       stm.a	r0, r13, 0      ; mprec.c:453
	;;
.BB26_40:                               ; %bb12
#0:	       ldm.s	r15, 8          ; mprec.c:458
#1:	       or	r12, 0 -> r0
	;;
#0:	       ldx	$mem, 0 -> r1   ; mprec.c:458
	;;
#0:	       stx	r1 -> $ro       ; mprec.c:458
	;;
#0:	       ldm.s	r15, 12         ; mprec.c:458
	;;
#0:	       ldx	$mem, 0 -> r1   ; mprec.c:458
	;;
#0:	       stx	r1 -> $rb       ; mprec.c:458
	;;
#0:	       ldm.s	r15, 16         ; mprec.c:458
	;;
#0:	       ldx	$mem, 0 -> r13  ; mprec.c:458
	;;
#0:	       ldm.s	r15, 20         ; mprec.c:458
	;;
#0:	       ldx	$mem, 0 -> r12  ; mprec.c:458
	;;
#0:	       ldm.s	r15, 24         ; mprec.c:458
	;;
#0:	       ldx	$mem, 0 -> r11  ; mprec.c:458
	;;
#0:	       ldm.s	r15, 28         ; mprec.c:458
#1:	       s2add	r15, 12 -> r15  ; mprec.c:458
	;;
#0:	       jop	ret             ; mprec.c:458
#1:	       ldx	$mem, 0 -> r10  ; mprec.c:458
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
___pow5mult_end:

	.align	4
___sread:                               ; @__sread
	.size	___sread_end-___sread
___sread_start:
; BB#0:                                 ; %entry
#0:	       wb.s	r15, 6
#1:	       add	r1, 14 -> r4
#2:	       sub	r15, 24 -> r15
	;;
#0:	       ldm.f	r1, 14          ; stdio.c:48
	;;
#0:	       ldx	$memhu, r4 -> r4 ; stdio.c:48
	;;
#0:	       brz ne @	r4, .BB27_9
	;;
.BB27_1:                                ; %bb3.preheader.i.i
#0:	       ldi	0 -> r0
	;;
#0:	       cmplt	r0, r3 -> c1
	;;
#0:	if !c1 br @	.BB27_7
	;;
.BB27_2:
#0:	       ldi	-120 -> r6
#1:	       ldi	-116 -> r5
#2:	       or	r3, 0 -> r0
	;;
.BB27_3:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB27_4 Depth 2
#0:	       or	r2, 0 -> r7
	;;
.BB27_4:                                ; %bb1.i.i
                                        ;   Parent Loop BB27_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.b	r6, 0
	;;
#0:	       ldx	$membu, r6 -> r2
	;;
#0:	       btest	r2, 1 -> c1
	;;
#0:	if !c1 br @	.BB27_4
	;;
.BB27_5:                                ; %bb2.i.i
                                        ;   in Loop: Header=BB27_3 Depth=1
#0:	       ldm.b	r5, 0
#1:	       sub	r0, 1 -> r0
#2:	       add	r7, 1 -> r2
	;;
#0:	       brz eq	r0, .BB27_7
#1:	       ldx	$membu, r5 -> r4
	;;
#0:	       stmb.a	r4, r7, 0
	;;
	       nop	0
	;;
.BB27_6:                                ; %bb1.preheader.i.i
                                        ;   in Loop: Header=BB27_3 Depth=1
#0:	       br @	.BB27_3
	;;
.BB27_7:                                ; %_read.exit.i
#0:	       ldi	-1 -> r0
	;;
#0:	       cmplt	r0, r3 -> c1
	;;
#0:	if !c1 br @	.BB27_10
	;;
.BB27_8:                                ; %bb
#0:	       ldm.f	r1, 80          ; stdio.c:58
#1:	       add	r15, 24 -> r15  ; stdio.c:61
	;;
#0:	       jop	ret             ; stdio.c:61
#1:	       ldx	$mem, 0 -> r0   ; stdio.c:58
	;;
#0:	       add	r0, r3 -> r0    ; stdio.c:58
	;;
#0:	       stm.a	r0, r1, 20      ; stdio.c:58
#1:	       or	r3, 0 -> r0     ; stdio.c:61
	;;
	       nop	0
	;;
.BB27_9:                                ; %_read_r.exit.thread
#0:	       ldi	88 -> r2
#1:	       ldi	-1 -> r3
	;;
#0:	       stm.a	r2, r0, 0       ; readr.c:59[ stdio.c:48 ]
	;;
.BB27_10:                               ; %bb1
#0:	       ldm.f	r1, 12          ; stdio.c:60
#1:	       or	r3, 0 -> r0
#2:	       add	r1, 12 -> r3
#3:	       ldiu	2047 -> r2
	;;
#0:	       ldim	29 -> r2
#1:	       add	r15, 24 -> r15  ; stdio.c:61
	;;
#0:	       jop	ret             ; stdio.c:61
#1:	       ldx	$memhu, r3 -> r3 ; stdio.c:60
	;;
#0:	       and	r3, r2 -> r2    ; stdio.c:60
	;;
#0:	       stmh.a	r2, r1, 6       ; stdio.c:60
	;;
	       nop	0
	;;
	.align	4
___sread_end:

	.align	4
___sclose:                              ; @__sclose
	.size	___sclose_end-___sclose
___sclose_start:
; BB#0:                                 ; %entry
#0:	       wb.s	r15, 6
#1:	       add	r1, 14 -> r2
#2:	       sub	r15, 24 -> r15
	;;
#0:	       ldm.f	r1, 14          ; stdio.c:135
#1:	       ldi	0 -> r1
#2:	       add	r15, 24 -> r15  ; stdio.c:135
	;;
#0:	       jop	ret             ; stdio.c:135
#1:	       ldx	$memhu, r2 -> r2 ; stdio.c:135
	;;
#0:	       cmpult	r2, 3 -> c1
	;;
#0:	if !c1 ldi	88 -> r2
#1:	if !c1 ldi	-1 -> r1
	;;
#0:	if !c1 stm.a	r2, r0, 0       ; closer.c:54[ stdio.c:135 ]
#1:	       or	r1, 0 -> r0
	;;
	.align	4
___sclose_end:

	.align	4
___sseek:                               ; @__sseek
	.size	___sseek_end-___sseek
___sseek_start:
; BB#0:                                 ; %bb
#0:	       wb.s	r15, 6
#1:	       ldi	88 -> r3
#2:	       add	r1, 12 -> r2
#3:	       sub	r15, 24 -> r15
	;;
#0:	       stm.a	r3, r0, 0       ; lseekr.c:59[ stdio.c:117 ]
#1:	       ldiu	2047 -> r0
#2:	       add	r15, 24 -> r15  ; stdio.c:125
	;;
#0:	       ldm.f	r1, 12          ; stdio.c:119
#1:	       ldim	29 -> r0
	;;
#0:	       jop	ret             ; stdio.c:125
#1:	       ldx	$memhu, r2 -> r2 ; stdio.c:119
	;;
#0:	       and	r2, r0 -> r0    ; stdio.c:119
	;;
#0:	       stmh.a	r0, r1, 6       ; stdio.c:119
#1:	       ldi	-1 -> r0
	;;
	       nop	0
	;;
	.align	4
___sseek_end:

	.align	4
___swrite:                              ; @__swrite
	.size	___swrite_end-___swrite
___swrite_start:
; BB#0:                                 ; %entry
#0:	       wb.s	r15, 6
#1:	       add	r1, 12 -> r4
#2:	       sub	r15, 24 -> r15
	;;
#0:	       ldm.f	r1, 12          ; stdio.c:88
	;;
#0:	       ldx	$memhu, r4 -> r4 ; stdio.c:88
	;;
#0:	       btest	r4, 8 -> c1     ; stdio.c:88
	;;
#0:	if  c1 ldi	88 -> r5
#1:	if  c1 add	r1, 12 -> r4
	;;
#0:	if  c1 stm.a	r5, r0, 0       ; lseekr.c:59[ stdio.c:89 ]
#1:	       ldiu	2047 -> r5
	;;
#0:	if  c1 ldm.f	r1, 12
#1:	       ldim	29 -> r5
	;;
#0:	if  c1 ldx	$memhu, r4 -> r4
	;;
#0:	       and	r4, r5 -> r5    ; stdio.c:90
#1:	       add	r1, 14 -> r4
	;;
#0:	       stmh.a	r5, r1, 6       ; stdio.c:90
	;;
#0:	       ldm.f	r1, 14          ; stdio.c:97
	;;
#0:	       ldx	$memhs, r4 -> r1 ; stdio.c:97
#1:	       ldi	1 -> r4
	;;
#0:	       sub	r1, 1 -> r1
	;;
#0:	       cmpult	r4, r1 -> c1
	;;
#0:	if  c1 br @	.BB30_6
	;;
.BB30_1:                                ; %bb3.preheader.i.i
#0:	       ldi	0 -> r0
	;;
#0:	       cmplt	r0, r3 -> c1
	;;
#0:	if !c1 br @	.BB30_5
	;;
.BB30_2:
#0:	       ldi	-120 -> r5
#1:	       ldi	-116 -> r4
	;;
.BB30_3:                                ; %bb1.i.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.b	r5, 0
	;;
#0:	       ldx	$membu, r5 -> r1
	;;
#0:	       btest	r1, 0 -> c1
	;;
#0:	if !c1 br @	.BB30_3
	;;
.BB30_4:                                ; %bb2.i.i
                                        ;   in Loop: Header=BB30_3 Depth=1
#0:	       add	r2, r0 -> r1
#1:	       add	r0, 1 -> r0
	;;
#0:	       cmpeq	r3, r0 -> c1
#1:	       ldm.f	r1, 0
	;;
#0:	if !c1 br	.BB30_3
#1:	       ldx	$membu, r1 -> r1
	;;
#0:	       stmb.a	r1, r4, 0
	;;
	       nop	0
	;;
.BB30_5:
#0:	       or	r3, 0 -> r0
#1:	       jop	ret             ; stdio.c:104
#2:	       add	r15, 24 -> r15  ; stdio.c:104
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB30_6:                                ; %bb1.i2
#0:	       ldi	88 -> r1
#1:	       jop	ret             ; stdio.c:104
#2:	       add	r15, 24 -> r15  ; stdio.c:104
	;;
#0:	       stm.a	r1, r0, 0       ; writer.c:59[ stdio.c:97 ]
#1:	       ldi	-1 -> r0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
___swrite_end:

	.align	4
___swbuf_r:                             ; @__swbuf_r
	.size	___swbuf_r_end-___swbuf_r
___swbuf_r_start:
; BB#0:                                 ; %bb
#0:	       ldiu	48 -> r2
#1:	       wb.s	r15, 12
	;;
#0:	       sub	r15, r2 -> r15
#1:	       ldx	$rb, 0 -> r2
	;;
#0:	       stm.s	r10, r15, 7
	;;
#0:	       stm.s	r11, r15, 6
	;;
#0:	       stm.s	r12, r15, 5
#1:	       or	r1, 0 -> r12
	;;
#0:	       stm.s	r13, r15, 4
	;;
#0:	       stm.s	r14, r15, 3
#1:	       or	r0, 0 -> r14
	;;
#0:	       stm.s	r2, r15, 2
#1:	       ldx	$ro, 0 -> r2
	;;
#0:	       stm.s	r2, r15, 1
	;;
#0:	       ldmg.d	_impure_data+56 ; wbuf.c:45
	;;
#0:	       ldx	$mem, 0 -> r0   ; wbuf.c:45
	;;
#0:	       brz ne @	r0, .BB31_2     ; wbuf.c:45
	;;
.BB31_1:                                ; %bb1
#0:	       callg	___sinit        ; wbuf.c:45
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB31_2:                                ; %bb2
#0:	       ldm.f	r12, 24         ; wbuf.c:55
#1:	       add	r12, 12 -> r13  ; wbuf.c:56
	;;
#0:	       ldx	$mem, 0 -> r0   ; wbuf.c:55
	;;
#0:	       stm.a	r0, r12, 2      ; wbuf.c:55
	;;
#0:	       ldm.f	r12, 12         ; wbuf.c:56
	;;
#0:	       ldx	$memhu, r13 -> r1 ; wbuf.c:56
	;;
#0:	       btest	r1, 3 -> c1     ; wbuf.c:56
	;;
#0:	if !c1 br @	.BB31_4
	;;
.BB31_3:                                ; %bb3
#0:	       ldm.f	r12, 16         ; wbuf.c:56
	;;
#0:	       ldx	$mem, 0 -> r0   ; wbuf.c:56
	;;
#0:	       brz ne @	r0, .BB31_6     ; wbuf.c:56
	;;
.BB31_4:                                ; %bb4
#0:	       or	r12, 0 -> r0    ; wbuf.c:56
#1:	       callg	___swsetup_r    ; wbuf.c:56
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz eq	r0, .BB31_6     ; wbuf.c:56
#1:	       ldm.f	r12, 12
	;;
#0:	       ldx	$memhu, r13 -> r1
	;;
	       nop	0
	;;
.BB31_5:                                ; %bb5
#0:	       ldi	64 -> r0
	;;
#0:	       br	.BB31_16
#1:	       or	r1, r0 -> r1    ; wbuf.c:58
#2:	       ldga	_impure_data -> r0 ; wbuf.c:59
	;;
#0:	       stmh.a	r1, r12, 6      ; wbuf.c:58
	;;
#0:	       stm.a	9, r0, 0        ; wbuf.c:59
#1:	       ldi	-1 -> r0
	;;
.BB31_6:                                ; %bb6
#0:	       btest	r1, 13 -> c1    ; wbuf.c:64
	;;
#0:	if  c1 br @	.BB31_8
	;;
.BB31_7:                                ; %bb7
#0:	       ldga	8192 -> r0
	;;
#0:	       or	r1, r0 -> r0    ; wbuf.c:64
	;;
#0:	       stmh.a	r0, r12, 6      ; wbuf.c:64
#1:	       ldiu	2047 -> r0
	;;
#0:	       ldm.f	r12, 100        ; wbuf.c:64
#1:	       ldim	2043 -> r0
	;;
#0:	       ldx	$mem, 0 -> r1   ; wbuf.c:64
	;;
#0:	       and	r1, r0 -> r0    ; wbuf.c:64
	;;
#0:	       stm.a	r0, r12, 25     ; wbuf.c:64
	;;
.BB31_8:                                ; %bb8
#0:	       ldm.f	r12, 0          ; wbuf.c:76
#1:	       bbh	zext8 r14 -> r10
	;;
#0:	       ldx	$mem, 0 -> r3   ; wbuf.c:76
#1:	       ldm.f	r12, 16         ; wbuf.c:76
	;;
#0:	       ldx	$mem, 0 -> r0   ; wbuf.c:76
#1:	       ldm.f	r12, 20         ; wbuf.c:77
	;;
#0:	       sub	r3, r0 -> r0    ; wbuf.c:76
	;;
#0:	       ldx	$mem, 0 -> r1   ; wbuf.c:77
	;;
#0:	       cmple	r1, r0 -> c1    ; wbuf.c:77
	;;
#0:	if  c1 br @	.BB31_10
	;;
.BB31_9:                                ; %bb8.bb12_crit_edge
#0:	       add	r0, 1 -> r2
#1:	       br @	.BB31_12
	;;
.BB31_10:                               ; %bb9
#0:	       or	r12, 0 -> r0    ; wbuf.c:79
#1:	       callg	__fflush_r      ; wbuf.c:79
#2:	       ldi	-1 -> r11
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz ne @	r0, .BB31_15    ; wbuf.c:79
	;;
.BB31_11:                               ; %bb9.bb12_crit_edge
#0:	       ldm.f	r12, 0
#1:	       ldi	1 -> r2
	;;
#0:	       ldx	$mem, 0 -> r3
	;;
.BB31_12:                               ; %bb12
#0:	       ldm.f	r12, 8          ; wbuf.c:83
#1:	       add	r3, 1 -> r1     ; wbuf.c:84
	;;
#0:	       ldx	$mem, 0 -> r0   ; wbuf.c:83
	;;
#0:	       sub	r0, 1 -> r0
	;;
#0:	       stm.a	r0, r12, 2      ; wbuf.c:83
	;;
#0:	       stmb.a	r14, r3, 0      ; wbuf.c:84
	;;
#0:	       stm.a	r1, r12, 0      ; wbuf.c:84
	;;
#0:	       ldm.f	r12, 20         ; wbuf.c:85
	;;
#0:	       ldx	$mem, 0 -> r0   ; wbuf.c:85
	;;
#0:	       cmpeq	r2, r0 -> c1    ; wbuf.c:85
	;;
#0:	if  c1 br @	.BB31_17
	;;
.BB31_13:                               ; %bb13
#0:	       ldm.f	r12, 12
#1:	       cmpeq	r10, 10 -> c2   ; wbuf.c:85
	;;
#0:	       ldx	$memhu, r13 -> r0
	;;
#0:	       btest	r0, 0 -> c1
	;;
#0:	       comb	and c1, c2 -> c1
	;;
#0:	if  c1 br @	.BB31_17
	;;
.BB31_14:
#0:	       or	r10, 0 -> r11
	;;
.BB31_15:                               ; %bb20
#0:	       or	r11, 0 -> r0
	;;
.BB31_16:                               ; %bb20
#0:	       ldm.s	r15, 4          ; wbuf.c:88
	;;
#0:	       ldx	$mem, 0 -> r1   ; wbuf.c:88
	;;
#0:	       stx	r1 -> $ro       ; wbuf.c:88
	;;
#0:	       ldm.s	r15, 8          ; wbuf.c:88
	;;
#0:	       ldx	$mem, 0 -> r1   ; wbuf.c:88
	;;
#0:	       stx	r1 -> $rb       ; wbuf.c:88
	;;
#0:	       ldm.s	r15, 12         ; wbuf.c:88
	;;
#0:	       ldx	$mem, 0 -> r14  ; wbuf.c:88
	;;
#0:	       ldm.s	r15, 16         ; wbuf.c:88
	;;
#0:	       ldx	$mem, 0 -> r13  ; wbuf.c:88
	;;
#0:	       ldm.s	r15, 20         ; wbuf.c:88
	;;
#0:	       ldx	$mem, 0 -> r12  ; wbuf.c:88
	;;
#0:	       ldm.s	r15, 24         ; wbuf.c:88
	;;
#0:	       ldx	$mem, 0 -> r11  ; wbuf.c:88
	;;
#0:	       ldm.s	r15, 28         ; wbuf.c:88
#1:	       s2add	r15, 12 -> r15  ; wbuf.c:88
	;;
#0:	       jop	ret             ; wbuf.c:88
#1:	       ldx	$mem, 0 -> r10  ; wbuf.c:88
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB31_17:                               ; %bb18
#0:	       or	r12, 0 -> r0    ; wbuf.c:86
#1:	       callg	__fflush_r      ; wbuf.c:86
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       br	.BB31_16
#1:	       cmpeq	r0, 0 -> c1     ; wbuf.c:86
#2:	       ldi	-1 -> r0
	;;
#0:	if  c1 or	r10, 0 -> r0
	;;
	       nop	0
	;;
	.align	4
___swbuf_r_end:

	.globl	___umodsi3
	.align	4
___umodsi3:                             ; @__umodsi3
	.size	___umodsi3_end-___umodsi3
___umodsi3_start:
; BB#0:                                 ; %entry
#0:	       cmpeq	r1, 0 -> c2
#1:	       cmpeq	r0, 0 -> c1
#2:	       ldi	0 -> r2
#3:	       wb.s	r15, 6
	;;
#0:	       comb	or c2, c1 -> c1
#1:	       sub	r15, 24 -> r15
	;;
#0:	if !c1 bbh	clz r1 -> r5
#1:	if !c1 bbh	clz r0 -> r6
#2:	if !c1 ldi	31 -> r3
#3:	if !c1 ldi	0 -> r2
	;;
#0:	if !c1 sub	r5, r6 -> r4
	;;
#0:	if !c1 cmpult	r3, r4 -> c1
	;;
#0:	if  c1 br @	.BB32_6
	;;
.BB32_1:                                ; %bb5.i
#0:	       cmpeq	r4, r3 -> c1
#1:	       or	r0, 0 -> r2
	;;
#0:	if  c1 br @	.BB32_6
	;;
.BB32_2:                                ; %bb7.i
#0:	       ldi	31 -> r2
#1:	       add	r4, 1 -> r3
#2:	       ldi	0 -> r8
	;;
#0:	       brz eq	r3, .BB32_5
#1:	       sub	r2, r4 -> r2
	;;
#0:	       sl	r0, r2 -> r7
	;;
	       nop	0
	;;
.BB32_3:                                ; %bb.nph.i
#0:	       add	r5, 1 -> r2
#1:	       sub	r1, 1 -> r9
#2:	       ldi	0 -> r8
#3:	       sr	r0, r3 -> r3
	;;
#0:	       sub	r2, r6 -> r6
	;;
.BB32_4:                                ; %bb8.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sr	r7, 31 -> r2
#1:	       sl	r3, 1 -> r3
#2:	       sub	r6, 1 -> r6
	;;
#0:	       or	r2, r3 -> r5
	;;
#0:	       sub	r9, r5 -> r2
	;;
#0:	       brz ne	r6, .BB32_4
#1:	       sra	r2, 31 -> r4
#2:	       sl	r7, 1 -> r2
	;;
#0:	       and	r4, r1 -> r3
#1:	       or	r2, r8 -> r7
#2:	       and	r4, 1 -> r8
	;;
#0:	       sub	r5, r3 -> r3
	;;
.BB32_5:                                ; %bb10.i
#0:	       sl	r7, 1 -> r2
	;;
#0:	       or	r2, r8 -> r2
	;;
.BB32_6:                                ; %__udivsi3.exit
#0:	       mul	r2, r1 -> $mul0.0
#1:	       jop	ret
#2:	       add	r15, 24 -> r15
	;;
#0:	       ldx	$mul0.0, 0 -> r1
	;;
#0:	       sub	r0, r1 -> r0
	;;
	       nop	0
	;;
	.align	4
___umodsi3_end:

	.globl	___modsi3
	.align	4
___modsi3:                              ; @__modsi3
	.size	___modsi3_end-___modsi3
___modsi3_start:
; BB#0:                                 ; %entry
#0:	       cmpeq	r1, 0 -> c2
#1:	       cmpeq	r0, 0 -> c1
#2:	       ldi	0 -> r2
#3:	       wb.s	r15, 6
	;;
#0:	       comb	or c2, c1 -> c1
#1:	       sub	r15, 24 -> r15
	;;
#0:	if  c1 br @	.BB33_8
	;;
.BB33_1:                                ; %bb3.i.i
#0:	       sra	r0, 31 -> r5
#1:	       sra	r1, 31 -> r4
	;;
#0:	       xor	r5, r0 -> r3
#1:	       xor	r4, r1 -> r2
	;;
#0:	       sub	r3, r5 -> r6
#1:	       sub	r2, r4 -> r5
#2:	       ldi	31 -> r3
#3:	       ldi	0 -> r2
	;;
#1:	       bbh	clz r5 -> r9
#0:	       bbh	clz r6 -> r0.16
	;;
#0:	       sub	r9, r0.16 -> r4
	;;
#0:	       cmpult	r3, r4 -> c1
	;;
#0:	if  c1 br @	.BB33_8
	;;
.BB33_2:                                ; %bb5.i.i
#0:	       cmpeq	r4, r3 -> c1
	;;
#0:	if !c1 br @	.BB33_4
	;;
.BB33_3:
#0:	       or	r6, 0 -> r2
#1:	       br @	.BB33_8
	;;
.BB33_4:                                ; %bb7.i.i
#0:	       ldi	31 -> r2
#1:	       ldi	0 -> r8
	;;
#0:	       sub	r2, r4 -> r3
#1:	       add	r4, 1 -> r2
	;;
#0:	       brz eq @	r2, .BB33_7
#1:	       sl	r6, r3 -> r7
	;;
.BB33_5:                                ; %bb.nph.i.i
#0:	       add	r9, 1 -> r3
#2:	       sub	r5, 1 -> r2.16
#1:	       ldi	0 -> r8
	;;
#0:	       sub	r3, r0.16 -> r9
#1:	       sr	r6, r2 -> r3
	;;
.BB33_6:                                ; %bb8.i.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sr	r7, 31 -> r2
#1:	       sl	r3, 1 -> r3
#2:	       sub	r9, 1 -> r9
	;;
#0:	       or	r2, r3 -> r6
	;;
#2:	       sub	r2.16, r6 -> r2
	;;
#0:	       brz ne	r9, .BB33_6
#1:	       sra	r2, 31 -> r4
#2:	       sl	r7, 1 -> r2
	;;
#0:	       and	r4, r5 -> r3
#1:	       or	r2, r8 -> r7
#2:	       and	r4, 1 -> r8
	;;
#0:	       sub	r6, r3 -> r3
	;;
.BB33_7:                                ; %bb10.i.i
#0:	       sl	r7, 1 -> r2
	;;
#0:	       or	r2, r8 -> r2
	;;
.BB33_8:                                ; %__divsi3.exit
#0:	       xor	r1, r0 -> r3
#1:	       add	r15, 24 -> r15
	;;
#0:	       sra	r3, 31 -> r3
	;;
#0:	       xor	r2, r3 -> r2
	;;
#0:	       jop	ret
#1:	       sub	r2, r3 -> r2
	;;
#0:	       mul	r2, r1 -> $mul0.0
	;;
#0:	       ldx	$mul0.0, 0 -> r1
	;;
#0:	       sub	r0, r1 -> r0
	;;
	.align	4
___modsi3_end:

	.globl	___moddi3
	.align	4
___moddi3:                              ; @__moddi3
	.size	___moddi3_end-___moddi3
___moddi3_start:
; BB#0:                                 ; %entry
#0:	       ldiu	64 -> r8
#1:	       wb.s	r15, 16
#2:	       sra	r3, 31 -> r5
	;;
#0:	       sub	r15, r8 -> r15
#1:	       ldx	$rb, 0 -> r8
#2:	       xor	r5, r2 -> r6
	;;
#0:	       stm.s	r10, r15, 9
#1:	       sra	r1, 31 -> r10
	;;
#0:	       stm.s	r11, r15, 8
#1:	       xor	r10, r1 -> r1
#2:	       xor	r10, r0 -> r7
#3:	       xor	r5, r3 -> r0
	;;
#0:	       stm.s	r8, r15, 7
#1:	       ldx	$ro, 0 -> r8
#2:	       sub	r1, r10 -> r2
#3:	       borr	r7, r10 -> r1
	;;
#0:	       sub	r0, r5 -> r4
#1:	       borr	r6, r5 -> r3
#2:	       stm.s	r8, r15, 6
#3:	       add	r15, 16 -> r11
	;;
#0:	       or	r15, 0 -> r0
#1:	       sub	r2, r1 -> r1
#2:	       sub	r6, r5 -> r2
#3:	       sub	r4, r3 -> r3
	;;
#0:	       stm.a	r11, r0, 0
#1:	       sub	r7, r10 -> r0
	;;
#0:	       callg	___udivmoddi4
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       or	r11, 4 -> r0
	;;
#0:	       ldm.f	r0, 0
	;;
#0:	       ldx	$mem, 0 -> r0
#1:	       ldm.f	r15, 16
	;;
#0:	       ldx	$mem, 0 -> r1
#1:	       ldm.s	r15, 24
	;;
#0:	       xor	r1, r10 -> r2
#1:	       xor	r0, r10 -> r1
	;;
#0:	       sub	r2, r10 -> r0
#1:	       sub	r1, r10 -> r1
#2:	       borr	r2, r10 -> r2
	;;
#0:	       sub	r1, r2 -> r1
#1:	       ldx	$mem, 0 -> r2
	;;
#0:	       stx	r2 -> $ro
	;;
#0:	       ldm.s	r15, 28
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       stx	r2 -> $rb
	;;
#0:	       ldm.s	r15, 32
	;;
#0:	       ldx	$mem, 0 -> r11
	;;
#0:	       ldm.s	r15, 36
#1:	       s2add	r15, 16 -> r15
	;;
#0:	       jop	ret
#1:	       ldx	$mem, 0 -> r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
___moddi3_end:

	.globl	___muldi3
	.align	4
___muldi3:                              ; @__muldi3
	.size	___muldi3_end-___muldi3
___muldi3_start:
; BB#0:                                 ; %entry
#0:	       bbh	zext16 r2 -> r5
#1:	       bbh	zext16 r0 -> r7
#2:	       sr	r0, 16 -> r6
#3:	       sr	r2, 16 -> r4
	;;
#2:	       mul	r5, r7 -> $mul2.0
#0:	       mul	r1, r2 -> $mul0.1
#3:	       mul	r5, r6 -> $mul3.0
#1:	       mul	r4, r7 -> $mul1.1
	;;
#2:	       ldx	$mul2.0, 0 -> r8
#0:	       mul	r4, r6 -> $mul0.0
#1:	       mul	r3, r0 -> $mul1.0
#3:	       wb.s	r15, 6
	;;
#1:	       sr	r8, 16 -> r5
#0:	       ldx	$mul0.1, 0 -> r2
#2:	       bbh	zext16 r8 -> r0
#3:	       sub	r15, 24 -> r15
	;;
#3:	       ldx	$mul3.0, r5 -> r5
#0:	       ldx	$mul0.0, r2 -> r2
#1:	       add	r15, 24 -> r15
	;;
#0:	       bbh	zext16 r5 -> r1
#1:	       ldx	$mul1.1, r5 -> r4
	;;
#0:	       jop	ret
#1:	       ldx	$mul1.1, r1 -> r6
#2:	       sr	r5, 16 -> r1
#3:	       sl	r4, 16 -> r3
	;;
#1:	       ldx	$mul1.0, r2 -> r2
#0:	       or	r3, r0 -> r0
	;;
#0:	       add	r2, r1 -> r2
#1:	       sr	r6, 16 -> r1
	;;
#0:	       add	r2, r1 -> r1
	;;
	.align	4
___muldi3_end:

	.globl	___divdf3
	.align	4
___divdf3:                              ; @__divdf3
	.size	___divdf3_end-___divdf3
___divdf3_start:
; BB#0:                                 ; %entry
#0:	       ldiu	200 -> r5
#1:	       wb.s	r15, 50
#2:	       ldiu	128 -> r6
#3:	       stx	r0 -> $f2
	;;
#0:	       sub	r15, r5 -> r15
#1:	       ldx	$ro, 0 -> r7
#2:	       stx	r2 -> $f0
#3:	       ldga	0 -> r2
	;;
#0:	       add	r15, r6 -> r6
#1:	       s2add	r15, 24 -> r8
#2:	       stx	r1 -> $f4
#3:	       ldih	1024 -> r2
	;;
#0:	       stm.s	r10, r6, 13
#1:	       ldx	$f2 -> r0
#2:	       add	r8, 8 -> r4
#3:	       add	r8, 0 -> r5
	;;
#0:	       stm.s	r11, r6, 12
#1:	       ldx	$f0 -> r1
#2:	       or	r4, 4 -> r4
	;;
#0:	       stm.s	r12, r6, 11
	;;
#0:	       stm.s	r13, r6, 10
	;;
#0:	       stm.s	r14, r6, 9
	;;
#0:	       stm.s	r0.23, r6, 8
	;;
#1:	       stm.s	r1.23, r6, 7
	;;
#2:	       stm.s	r2.23, r6, 6
	;;
#3:	       stm.s	r3.23, r6, 5
	;;
#0:	       stm.s	r0.24, r6, 4
	;;
#1:	       stm.s	r1.24, r6, 3
	;;
#2:	       stm.s	r2.24, r6, 2
	;;
#3:	       stm.s	r3.24, r6, 1
	;;
#1:	       stm.s	r1.25, r6, 0
#0:	       ldx	$rb, 0 -> r6
	;;
#2:	       stm.s	r2.25, r15, 31
	;;
#2:	       stm.s	r2.26, r15, 30
	;;
#0:	       stm.s	r6, r15, 29
#1:	       ldiu	2047 -> r6
	;;
#0:	       stm.s	r7, r15, 28
#1:	       fop	fmov	f4 -> f3
#2:	       ldiu	2047 -> r7
	;;
#0:	       stm.a	r0, r15, 26
#1:	       stx	r3 -> $f4
#2:	       or	r5, 4 -> r0
#3:	       ldim	511 -> r7
	;;
#0:	       fop	fmov	f4 -> f1
#1:	       stm.a	r1, r15, 24
	;;
#0:	       ldx	$f3 -> r1
	;;
#0:	       stm.a	r1, r4, 0
#1:	       ldx	$f1 -> r1
	;;
#0:	       stm.a	r1, r0, 0
	;;
#0:	       ldm.f	r4, 0
	;;
#0:	       ldx	$mem, 0 -> r5
#1:	       ldm.f	r0, 0
	;;
#0:	       sr	r5, 20 -> r0
	;;
#0:	       and	r0, r6 -> r8
#1:	       ldx	$mem, 0 -> r3
	;;
#0:	       stm.s	r8, r15, 2
#1:	       sr	r3, 20 -> r1
#2:	       xor	r3, r5 -> r4
#3:	       and	r3, r7 -> r11
	;;
#0:	       ldm.f	r15, 104
#1:	       and	r1, r6 -> r1
	;;
#0:	       ldx	$mem, 0 -> r0
#1:	       ldm.f	r15, 96
	;;
#0:	       ldx	$mem, 0 -> r10
#1:	       stm.s	r1, r15, 3
#2:	       and	r4, r2 -> r1
#3:	       ldiu	2045 -> r4
	;;
#0:	       sub	r8, 1 -> r2
#1:	       stm.s	r1, r15, 5
#2:	       and	r5, r7 -> r1
	;;
#0:	       cmpult	r4, r2 -> c1
	;;
#0:	if  c1 br @	.BB36_3
	;;
.BB36_1:                                ; %bb
#0:	       ldm.s	r15, 12
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       sub	r2, 1 -> r4
#1:	       ldiu	2046 -> r2
	;;
#0:	       cmpult	r4, r2 -> c1
	;;
#0:	if !c1 br @	.BB36_3
	;;
.BB36_2:
#0:	       ldi	0 -> r2
#1:	       br	.BB36_33
	;;
#0:	       or	r2, 0 -> r13
	;;
	       nop	0
	;;
.BB36_3:                                ; %bb1
#0:	       ldim	1023 -> r6
#1:	       ldga	1048576 -> r2
	;;
#0:	       ldih	1023 -> r6
#1:	       ldih	1023 -> r2
	;;
#0:	       and	r5, r6 -> r4
	;;
#0:	       cmpeq	r4, r2 -> c2
#1:	       cmpult	r4, r2 -> c1
	;;
#0:	if  c2 cmpeq	r0, 0 -> c1
	;;
#0:	if  c1 br @	.BB36_7
	;;
.BB36_4:                                ; %bb2
#0:	       add	r15, 24 -> r1
#1:	       ldga	524288 -> r2
#2:	       stm.a	r0, r15, 6
	;;
#0:	       or	r1, 4 -> r1
#1:	       or	r5, r2 -> r2
	;;
#0:	       stm.a	r2, r1, 0
	;;
#0:	       ldm.f	r15, 24
	;;
.BB36_5:                                ; %bb2
#0:	       ldx	$mem, 0 -> r2
#1:	       ldm.f	r1, 0
	;;
#0:	       stx	r2 -> $f0
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
.BB36_6:                                ; %bb2
#0:	       stx	r0 -> $f2
#1:	       br	.BB36_13
	;;
#0:	       fop	fmov	f2 -> f1
	;;
	       nop	0
	;;
.BB36_7:                                ; %bb3
#0:	       and	r3, r6 -> r12
	;;
#0:	       cmpeq	r12, r2 -> c2
#1:	       cmpult	r12, r2 -> c1
	;;
#0:	if  c2 cmpeq	r10, 0 -> c1
	;;
#0:	if  c1 br @	.BB36_10
	;;
.BB36_8:                                ; %bb4
#0:	       s2add	r15, 8 -> r2
#1:	       ldga	524288 -> r1
#2:	       stm.a	r10, r15, 8
	;;
#0:	       add	r2, 0 -> r0
#1:	       or	r3, r1 -> r1
	;;
#0:	       or	r0, 4 -> r0
	;;
#0:	       stm.a	r1, r0, 0
	;;
#0:	       ldm.f	r15, 32
	;;
.BB36_9:                                ; %bb4
#0:	       ldx	$mem, 0 -> r1
#1:	       br	.BB36_6
#2:	       ldm.f	r0, 0
	;;
#0:	       stx	r1 -> $f0
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
.BB36_10:                               ; %bb5
#0:	       ldga	1048576 -> r2
	;;
#0:	       ldih	1023 -> r2
	;;
#0:	       xor	r4, r2 -> r3
	;;
#0:	       or	r0, r3 -> r3
	;;
#0:	       brz ne @	r3, .BB36_15
	;;
.BB36_11:                               ; %bb6
#0:	       xor	r12, r2 -> r1
	;;
#0:	       or	r10, r1 -> r1
	;;
#0:	       brz ne @	r1, .BB36_14
	;;
.BB36_12:                               ; %bb7
#0:	       fop	dnan -> d0
	;;
.BB36_13:                               ; %bb7
#0:	       ldm.s	r15, 112
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       stx	r0 -> $ro
	;;
#0:	       ldm.s	r15, 116
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       stx	r0 -> $rb
#1:	       ldiu	200 -> r0
	;;
#0:	       ldm.s	r15, 120
	;;
#2:	       ldx	$mem, 0 -> r2.26
	;;
#0:	       ldm.s	r15, 124
	;;
#2:	       ldx	$mem, 0 -> r2.25
	;;
#0:	       ldm.s	r15, 128
	;;
#1:	       ldx	$mem, 0 -> r1.25
	;;
#0:	       ldm.s	r15, 132
	;;
#3:	       ldx	$mem, 0 -> r3.24
	;;
#0:	       ldm.s	r15, 136
	;;
#2:	       ldx	$mem, 0 -> r2.24
	;;
#0:	       ldm.s	r15, 140
	;;
#1:	       ldx	$mem, 0 -> r1.24
	;;
#0:	       ldm.s	r15, 144
	;;
#0:	       ldx	$mem, 0 -> r0.24
	;;
#0:	       ldm.s	r15, 148
	;;
#3:	       ldx	$mem, 0 -> r3.23
	;;
#0:	       ldm.s	r15, 152
	;;
#2:	       ldx	$mem, 0 -> r2.23
	;;
#0:	       ldm.s	r15, 156
	;;
#1:	       ldx	$mem, 0 -> r1.23
	;;
#0:	       ldm.s	r15, 160
	;;
#0:	       ldx	$mem, 0 -> r0.23
	;;
#0:	       ldm.s	r15, 164
	;;
#0:	       ldx	$mem, 0 -> r14
	;;
#0:	       ldm.s	r15, 168
	;;
#0:	       ldx	$mem, 0 -> r13
	;;
#0:	       ldm.s	r15, 172
	;;
#0:	       ldx	$mem, 0 -> r12
	;;
#0:	       ldm.s	r15, 176
	;;
#0:	       ldx	$mem, 0 -> r11
	;;
#0:	       ldm.s	r15, 180
#1:	       add	r15, r0 -> r15
	;;
#0:	       jop	ret
#1:	       ldx	$mem, 0 -> r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB36_14:                               ; %bb8
#0:	       ldm.s	r15, 20
#1:	       ldi	0 -> r2
#2:	       s2add	r15, 8 -> r3
	;;
#0:	       add	r3, 8 -> r1
#1:	       or	r2, r0 -> r2
	;;
#0:	       ldx	$mem, 0 -> r0
#1:	       or	r1, 4 -> r1
	;;
#0:	       br	.BB36_5
#1:	       or	r0, r4 -> r0
#2:	       stm.a	r2, r15, 10
	;;
#0:	       stm.a	r0, r1, 0
	;;
#0:	       ldm.f	r15, 40
	;;
.BB36_15:                               ; %bb9
#0:	       xor	r12, r2 -> r2
	;;
#0:	       or	r10, r2 -> r2
	;;
#0:	       brz ne @	r2, .BB36_17
	;;
.BB36_16:                               ; %bb10
#0:	       ldi	0 -> r1
#1:	       s2add	r15, 8 -> r2
	;;
#0:	       stm.a	r1, r15, 12
#1:	       add	r2, 16 -> r0
	;;
#0:	       ldm.s	r15, 20
#1:	       or	r0, 4 -> r0
	;;
#0:	       br	.BB36_9
#1:	       ldx	$mem, 0 -> r1
	;;
#0:	       stm.a	r1, r0, 0
	;;
#0:	       ldm.f	r15, 48
	;;
.BB36_17:                               ; %bb11
#0:	       or	r0, r4 -> r2
	;;
#0:	       brz ne @	r2, .BB36_20
	;;
.BB36_18:                               ; %bb12
#0:	       or	r10, r12 -> r0
	;;
#0:	       brz eq @	r0, .BB36_12
	;;
.BB36_19:                               ; %bb14
#0:	       ldi	0 -> r1
#1:	       s2add	r15, 8 -> r2
	;;
#0:	       stm.a	r1, r15, 14
#1:	       add	r2, 24 -> r0
	;;
#0:	       ldm.s	r15, 20
#1:	       or	r0, 4 -> r0
	;;
#0:	       br	.BB36_9
#1:	       ldx	$mem, 0 -> r1
	;;
#0:	       stm.a	r1, r0, 0
	;;
#0:	       ldm.f	r15, 56
	;;
.BB36_20:                               ; %bb15
#0:	       or	r10, r12 -> r2
	;;
#0:	       brz ne @	r2, .BB36_22
	;;
.BB36_21:                               ; %bb16
#0:	       ldm.s	r15, 20
#1:	       ldga	1048576 -> r1
#2:	       s2add	r15, 16 -> r3
	;;
#0:	       ldih	1023 -> r1
#1:	       add	r3, 0 -> r0
	;;
#0:	       ldx	$mem, 0 -> r2
#1:	       or	r0, 4 -> r0
	;;
#0:	       or	r2, r1 -> r2
#1:	       ldi	0 -> r1
	;;
#0:	       br	.BB36_9
#1:	       stm.a	r1, r15, 16
	;;
#0:	       stm.a	r2, r0, 0
	;;
#0:	       ldm.f	r15, 64
	;;
.BB36_22:                               ; %bb17
#3:	       ldiu	2047 -> r3.23
#0:	       ldi	0 -> r13
	;;
#3:	       ldim	511 -> r3.23
	;;
#3:	       cmpult	r3.23, r4 -> c1
	;;
#0:	if  c1 br @	.BB36_27
	;;
.BB36_23:                               ; %bb18
#0:	       brz eq @	r1, .BB36_25
	;;
.BB36_24:                               ; %bb.i.i31
#0:	       bbh	clz r1 -> r3
#1:	       br @	.BB36_26
	;;
.BB36_25:                               ; %bb1.i.i32
#0:	       bbh	clz r0 -> r2
	;;
#0:	       s2add	r2, 8 -> r3
	;;
.BB36_26:                               ; %normalize.exit34
#0:	       ldi	12 -> r4
#1:	       callg	___ashldi3
#2:	       sub	r3, 11 -> r2
	;;
#0:	       sub	r4, r3 -> r13
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB36_27:                               ; %bb19
#3:	       cmpult	r3.23, r12 -> c1
#0:	       or	r0, 0 -> r0.23
#1:	       or	r1, 0 -> r14
	;;
#0:	if  c1 br @	.BB36_32
	;;
.BB36_28:                               ; %bb20
#0:	       brz eq @	r11, .BB36_30
	;;
.BB36_29:                               ; %bb.i.i
#0:	       bbh	clz r11 -> r1
#1:	       br @	.BB36_31
	;;
.BB36_30:                               ; %bb1.i.i
#0:	       bbh	clz r10 -> r0
	;;
#0:	       s2add	r0, 8 -> r1
	;;
.BB36_31:                               ; %normalize.exit
#0:	       add	r13, r1 -> r0
#1:	       callg	___ashldi3
#2:	       sub	r1, 11 -> r2
#3:	       or	r11, 0 -> r1
	;;
#0:	       sub	r0, 12 -> r13
#1:	       or	r10, 0 -> r0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r10
#1:	       or	r1, 0 -> r11
	;;
.BB36_32:                               ; %normalize.exit
#0:	       or	r0.23, 0 -> r0
#1:	       or	r14, 0 -> r1
	;;
.BB36_33:                               ; %bb21
#0:	       or	r0, 0 -> r12
#1:	       ldiu	0 -> r0
#2:	       ldiu	819 -> r2
#3:	       ldi	0 -> r3
	;;
#0:	       ldim	512 -> r0
#1:	       ldim	158 -> r2
#2:	       ldi	0 -> r14
	;;
#0:	       or	r11, r0 -> r0
#1:	       ldih	936 -> r2
	;;
#3:	       or	r1, 0 -> r3.23
#0:	       stm.s	r0, r15, 4
#1:	       sr	r10, 21 -> r1
#2:	       sl	r0, 11 -> r0
	;;
#0:	       callg	___muldi3
#1:	       or	r1, r0 -> r1.23
#2:	       ldi	0 -> r1
	;;
#1:	       sub	r2, r1.23 -> r11
	;;
#0:	       or	r11, 0 -> r0
#1:	       or	r1.23, 0 -> r2
	;;
	       nop	0
	;;
#0:	       sub	r14, r1 -> r0
#1:	       ldi	0 -> r1
#2:	       or	r11, 0 -> r2
#3:	       ldi	0 -> r3
	;;
#0:	       callg	___muldi3
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       sr	r0, 31 -> r2
#1:	       sl	r1, 1 -> r0
#2:	       ldi	0 -> r1
#3:	       ldi	0 -> r3
	;;
#0:	       callg	___muldi3
#2:	       or	r2, r0 -> r11
#1:	       or	r1.23, 0 -> r2
	;;
#0:	       or	r11, 0 -> r0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       sub	r14, r1 -> r0
#1:	       ldi	0 -> r1
#2:	       or	r11, 0 -> r2
#3:	       ldi	0 -> r3
	;;
#0:	       callg	___muldi3
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       sr	r0, 31 -> r2
#1:	       sl	r1, 1 -> r0
#2:	       ldi	0 -> r1
#3:	       ldi	0 -> r3
	;;
#0:	       callg	___muldi3
#2:	       or	r2, r0 -> r11
#1:	       or	r1.23, 0 -> r2
	;;
#0:	       or	r11, 0 -> r0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       sub	r14, r1 -> r0
#1:	       ldi	0 -> r1
#2:	       or	r11, 0 -> r2
#3:	       ldi	0 -> r3
	;;
#0:	       callg	___muldi3
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       sr	r0, 31 -> r2
#1:	       sl	r1, 1 -> r0
#2:	       ldi	0 -> r1
#3:	       ldi	0 -> r3
	;;
#0:	       callg	___muldi3
#2:	       or	r2, r0 -> r0
#1:	       or	r1.23, 0 -> r2
	;;
#3:	       sub	r0, 1 -> r3.24
	;;
#3:	       or	r3.24, 0 -> r0
	;;
	       nop	0
	;;
#1:	       or	r0, 0 -> r1.23
#0:	       or	r1, 0 -> r11
#2:	       sl	r10, 11 -> r2
#3:	       ldi	0 -> r1
	;;
#0:	       callg	___muldi3
#3:	       or	r3.24, 0 -> r0
#1:	       ldi	0 -> r3
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       callg	___muldi3
#1:	       carr	r1.23, r1 -> r0
#3:	       or	r3.24, 0 -> r2
#2:	       ldi	0 -> r3
	;;
#1:	       add	r1.23, r1 -> r1.23
#0:	       add	r11, r0 -> r0
	;;
#0:	       sub	r14, r0 -> r1
#1:	       borr	r14, r1.23 -> r0
	;;
#0:	       sub	r1, r0 -> r0
#1:	       ldi	0 -> r1
	;;
#2:	       or	r0, 0 -> r11
#0:	       or	r1, 0 -> r0.23
#1:	       sub	r14, r1.23 -> r0
#3:	       ldi	0 -> r1
	;;
#0:	       callg	___muldi3
#3:	       or	r3.24, 0 -> r2
#1:	       ldi	0 -> r3
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       carr	r11, r1 -> r2
#1:	       add	r11, r1 -> r11
#2:	       ldi	-2 -> r0
	;;
#0:	       add	r0.23, r2 -> r3
#1:	       carr	r11, r0 -> r1
#2:	       sr	r12, 30 -> r2
	;;
#3:	       sl	r3.23, 2 -> r0
#0:	       add	r3, r1 -> r1
#1:	       ldi	0 -> r3
	;;
#1:	       or	r2, r0 -> r0
#2:	       ldga	0 -> r2
#0:	       sub	r1, 1 -> r0.24
#3:	       ldi	0 -> r1
	;;
#0:	       callg	___muldi3
#1:	       ldih	2 -> r2
	;;
#3:	       or	r0, r2 -> r3.23
#0:	       or	r0.24, 0 -> r0
	;;
#3:	       or	r3.23, 0 -> r2
	;;
	       nop	0
	;;
#1:	       sub	r11, 2 -> r1.23
#0:	       or	r1, 0 -> r0.23
#2:	       ldi	0 -> r1
#3:	       ldi	0 -> r3
	;;
#0:	       callg	___muldi3
#1:	       or	r0, 0 -> r1.25
#3:	       or	r3.23, 0 -> r2
	;;
#1:	       or	r1.23, 0 -> r0
	;;
	       nop	0
	;;
	       nop	0
	;;
#2:	       sl	r12, 2 -> r2.25
#1:	       or	r0, 0 -> r1.24
#3:	       or	r1, 0 -> r11
#0:	       or	r0.24, 0 -> r0
	;;
#0:	       callg	___muldi3
#1:	       ldi	0 -> r1
#2:	       or	r2.25, 0 -> r2
#3:	       ldi	0 -> r3
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       callg	___muldi3
#2:	       or	r0, 0 -> r2.26
#1:	       or	r1.23, 0 -> r0
#3:	       ldi	0 -> r3
	;;
#2:	       or	r1, 0 -> r2.24
#0:	       ldi	0 -> r1
	;;
#2:	       or	r2.25, 0 -> r2
	;;
#2:	       ldi	-4 -> r2.23
	;;
#2:	       and	r2.26, r2.23 -> r3
#0:	       ldm.s	r15, 12
#1:	       add	r11, r1.25 -> r4
	;;
#0:	       add	r1, r3 -> r0
#2:	       carr	r1, r3 -> r1
#1:	       carr	r11, r1.25 -> r2
	;;
#1:	       carr	r0, r1.24 -> r0
#0:	       add	r0.23, r2 -> r3
#2:	       carr	r4, r2.24 -> r2
	;;
#0:	       add	r1, r0 -> r5
#1:	       ldx	$mem, 0 -> r0
#2:	       add	r3, r2 -> r2
#3:	       ldiu	2047 -> r3
	;;
#0:	       ldm.s	r15, 8
#2:	       add	r4, r2.24 -> r4
#1:	       ldim	1023 -> r3
	;;
#3:	       add	r4, r5 -> r3.23
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       sub	r1, r0 -> r0
#1:	       carr	r4, r5 -> r1
	;;
#0:	       add	r2, r1 -> r11
#1:	       add	r13, r0 -> r13
	;;
#0:	       cmpult	r3, r11 -> c1
	;;
#0:	if  c1 br @	.BB36_35
	;;
.BB36_34:                               ; %bb22
#0:	       ldm.s	r15, 16
#1:	       or	r11, 0 -> r1
#2:	       or	r10, 0 -> r2
#3:	       sl	r12, 21 -> r12
	;;
#3:	       or	r3.23, 0 -> r0
	;;
#0:	       callg	___muldi3
#1:	       ldx	$mem, 0 -> r3
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       br @	.BB36_36
#1:	       sub	r12, r1 -> r2
#2:	       borr	r14, r0 -> r1
#3:	       sub	r13, 1 -> r13
	;;
.BB36_35:                               ; %bb23
#0:	       ldm.s	r15, 16
#1:	       sl	r11, 31 -> r0
#2:	       sr	r11, 1 -> r11
#3:	       or	r10, 0 -> r2
	;;
#3:	       sr	r3.23, 1 -> r1
#0:	       sl	r12, 20 -> r12
	;;
#0:	       callg	___muldi3
#3:	       or	r1, r0 -> r3.23
#1:	       or	r11, 0 -> r1
#2:	       ldx	$mem, 0 -> r3
	;;
#3:	       or	r3.23, 0 -> r0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       sub	r12, r1 -> r2
#1:	       borr	r14, r0 -> r1
	;;
.BB36_36:                               ; %bb23
#0:	       sub	r14, r0 -> r3
#1:	       ldi	1023 -> r0
#2:	       sub	r2, r1 -> r2
	;;
#0:	       add	r13, r0 -> r5
#1:	       ldiu	2047 -> r0
	;;
#0:	       cmplt	r5, r0 -> c1
	;;
#0:	if  c1 br @	.BB36_38
	;;
.BB36_37:                               ; %bb25
#0:	       ldm.s	r15, 20
#1:	       ldga	1048576 -> r1
#2:	       s2add	r15, 16 -> r3
	;;
#0:	       ldih	1023 -> r1
#1:	       add	r3, 8 -> r0
	;;
#0:	       ldx	$mem, 0 -> r2
#1:	       or	r0, 4 -> r0
	;;
#0:	       or	r2, r1 -> r2
#1:	       ldi	0 -> r1
	;;
#0:	       br	.BB36_9
#1:	       stm.a	r1, r15, 18
	;;
#0:	       stm.a	r2, r0, 0
	;;
#0:	       ldm.f	r15, 72
	;;
.BB36_38:                               ; %bb26
#0:	       ldi	0 -> r0
	;;
#0:	       cmplt	r0, r5 -> c1
	;;
#0:	if  c1 br @	.BB36_40
	;;
.BB36_39:                               ; %bb27
#0:	       ldi	0 -> r1
#1:	       s2add	r15, 16 -> r2
	;;
#0:	       stm.a	r1, r15, 20
#1:	       add	r2, 16 -> r0
	;;
#0:	       ldm.s	r15, 20
#1:	       or	r0, 4 -> r0
	;;
#0:	       br	.BB36_9
#1:	       ldx	$mem, 0 -> r1
	;;
#0:	       stm.a	r1, r0, 0
	;;
#0:	       ldm.f	r15, 80
	;;
.BB36_40:                               ; %bb28
#0:	       ldm.s	r15, 16
#1:	       carr	r3, r3 -> r1
#2:	       add	r2, r2 -> r0
#3:	       ldiu	2047 -> r4
	;;
#0:	       add	r0, r1 -> r2
#1:	       add	r3, r3 -> r1
#2:	       ldim	511 -> r4
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       cmpeq	r2, r0 -> c2
#1:	       cmpult	r0, r2 -> c1
#2:	       sl	r5, 20 -> r0
#3:	       ldm.s	r15, 20
	;;
#0:	if  c2 cmpult	r10, r1 -> c1
#1:	       and	r11, r4 -> r1
#2:	       s2add	r15, 16 -> r5
	;;
#0:	       ldx	$c1 -> r3
#1:	       or	r0, r1 -> r2
#2:	       add	r5, 24 -> r4
	;;
#3:	       carr	r3, r3.23 -> r1
	;;
#3:	       add	r3, r3.23 -> r0
#0:	       add	r2, r1 -> r3
#1:	       ldi	0 -> r1
	;;
#0:	       or	r0, r1 -> r2
#1:	       ldx	$mem, 0 -> r0
#2:	       or	r4, 4 -> r1
	;;
#0:	       br	.BB36_5
#1:	       or	r3, r0 -> r0
#2:	       stm.a	r2, r15, 22
	;;
#0:	       stm.a	r0, r1, 0
	;;
#0:	       ldm.f	r15, 88
	;;
	.align	4
___divdf3_end:

	.globl	___ashrdi3
	.align	4
___ashrdi3:                             ; @__ashrdi3
	.size	___ashrdi3_end-___ashrdi3
___ashrdi3_start:
; BB#0:                                 ; %entry
#0:	       btest	r2, 5 -> c1
#1:	       wb.s	r15, 6
#2:	       sub	r15, 24 -> r15
	;;
#0:	if  c1 br @	.BB37_4
	;;
.BB37_1:                                ; %bb1
#0:	       brz eq @	r2, .BB37_3
	;;
.BB37_2:                                ; %bb3
#0:	       ldi	32 -> r3
#1:	       sr	r0, r2 -> r0
	;;
#0:	       sub	r3, r2 -> r3
	;;
#0:	       sl	r1, r3 -> r3
#1:	       sra	r1, r2 -> r1
	;;
#0:	       or	r3, r0 -> r0
	;;
.BB37_3:                                ; %bb5
#0:	       add	r15, 24 -> r15
#1:	       jop	ret
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB37_4:                                ; %bb
#0:	       ldi	-32 -> r0
#1:	       jop	ret
#2:	       add	r15, 24 -> r15
	;;
#0:	       add	r2, r0 -> r0
	;;
#0:	       sra	r1, r0 -> r0
#1:	       sra	r1, 31 -> r1
	;;
	       nop	0
	;;
	.align	4
___ashrdi3_end:

	.globl	___divdi3
	.align	4
___divdi3:                              ; @__divdi3
	.size	___divdi3_end-___divdi3
___divdi3_start:
; BB#0:                                 ; %entry
#0:	       ldiu	48 -> r5
#1:	       wb.s	r15, 12
#2:	       sra	r1, 31 -> r8
#3:	       sra	r3, 31 -> r7
	;;
#0:	       sub	r15, r5 -> r15
#1:	       xor	r8, r1 -> r4
#2:	       xor	r7, r2 -> r9
	;;
#0:	       stm.s	r10, r15, 5
#1:	       ldx	$rb, 0 -> r10
#2:	       sub	r4, r8 -> r6
#3:	       borr	r9, r7 -> r4
	;;
#3:	       xor	r8, r0 -> r3.16
#0:	       stm.s	r10, r15, 4
#1:	       ldx	$ro, 0 -> r10
#2:	       xor	r7, r3 -> r0
	;;
#0:	       stm.s	r10, r15, 3
#1:	       sub	r0, r7 -> r5
#2:	       or	r15, 0 -> r0
#3:	       xor	r3, r1 -> r10
	;;
#3:	       borr	r3.16, r8 -> r2
#0:	       stm.a	0, r0, 0
#1:	       sub	r5, r4 -> r3
	;;
#0:	       callg	___udivmoddi4
#1:	       sub	r6, r2 -> r1
#2:	       sub	r9, r7 -> r2
	;;
#3:	       sub	r3.16, r8 -> r0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       sra	r10, 31 -> r3
#1:	       ldm.s	r15, 12
	;;
#0:	       xor	r0, r3 -> r2
#1:	       xor	r1, r3 -> r1
	;;
#0:	       sub	r2, r3 -> r0
#1:	       sub	r1, r3 -> r1
#2:	       borr	r2, r3 -> r2
	;;
#0:	       sub	r1, r2 -> r1
#1:	       ldx	$mem, 0 -> r2
	;;
#0:	       stx	r2 -> $ro
	;;
#0:	       ldm.s	r15, 16
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       stx	r2 -> $rb
	;;
#0:	       ldm.s	r15, 20
#1:	       s2add	r15, 12 -> r15
	;;
#0:	       jop	ret
#1:	       ldx	$mem, 0 -> r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
___divdi3_end:

	.globl	___ashldi3
	.align	4
___ashldi3:                             ; @__ashldi3
	.size	___ashldi3_end-___ashldi3
___ashldi3_start:
; BB#0:                                 ; %entry
#0:	       btest	r2, 5 -> c1
#1:	       or	r0, 0 -> r3
#2:	       wb.s	r15, 6
#3:	       sub	r15, 24 -> r15
	;;
#0:	if  c1 br @	.BB39_4
	;;
.BB39_1:                                ; %bb1
#0:	       brz eq @	r2, .BB39_3
	;;
.BB39_2:                                ; %bb3
#0:	       ldi	32 -> r0
#1:	       jop	ret
#2:	       sl	r1, r2 -> r1
#3:	       add	r15, 24 -> r15
	;;
#0:	       sub	r0, r2 -> r4
#1:	       sl	r3, r2 -> r0
	;;
#0:	       sr	r3, r4 -> r2
	;;
#0:	       or	r1, r2 -> r1
	;;
.BB39_3:                                ; %bb5
#0:	       or	r3, 0 -> r0
#1:	       jop	ret
#2:	       add	r15, 24 -> r15
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB39_4:                                ; %bb
#0:	       ldi	-32 -> r1
#1:	       jop	ret
#2:	       ldi	0 -> r0
#3:	       add	r15, 24 -> r15
	;;
#0:	       add	r2, r1 -> r1
	;;
#0:	       sl	r3, r1 -> r1
	;;
	       nop	0
	;;
	.align	4
___ashldi3_end:

	.globl	___umoddi3
	.align	4
___umoddi3:                             ; @__umoddi3
	.size	___umoddi3_end-___umoddi3
___umoddi3_start:
; BB#0:                                 ; %entry
#0:	       ldiu	64 -> r6
#1:	       wb.s	r15, 16
	;;
#0:	       sub	r15, r6 -> r15
#1:	       ldx	$rb, 0 -> r6
	;;
#0:	       stm.s	r10, r15, 9
#1:	       add	r15, 16 -> r5
#2:	       or	r15, 0 -> r4
	;;
#0:	       stm.s	r6, r15, 8
#1:	       ldx	$ro, 0 -> r6
#2:	       or	r5, 4 -> r10
	;;
#0:	       stm.s	r6, r15, 7
	;;
#0:	       stm.a	r5, r4, 0
	;;
#0:	       callg	___udivmoddi4
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldm.f	r15, 16
	;;
#0:	       ldx	$mem, 0 -> r0
#1:	       ldm.f	r10, 0
	;;
#0:	       ldx	$mem, 0 -> r1
#1:	       ldm.s	r15, 28
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       stx	r2 -> $ro
	;;
#0:	       ldm.s	r15, 32
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       stx	r2 -> $rb
	;;
#0:	       ldm.s	r15, 36
#1:	       s2add	r15, 16 -> r15
	;;
#0:	       jop	ret
#1:	       ldx	$mem, 0 -> r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
___umoddi3_end:

	.globl	___udivsi3
	.align	4
___udivsi3:                             ; @__udivsi3
	.size	___udivsi3_end-___udivsi3
___udivsi3_start:
; BB#0:                                 ; %entry
#0:	       or	r0, 0 -> r6
#1:	       cmpeq	r1, 0 -> c2
#2:	       ldi	0 -> r0
#3:	       wb.s	r15, 6
	;;
#0:	       cmpeq	r6, 0 -> c1
#1:	       sub	r15, 24 -> r15
	;;
#0:	       comb	or c2, c1 -> c1
	;;
#0:	if !c1 bbh	clz r1 -> r4
#1:	if !c1 bbh	clz r6 -> r5
#2:	if !c1 ldi	31 -> r3
#3:	if !c1 ldi	0 -> r0
	;;
#0:	if !c1 sub	r4, r5 -> r2
	;;
#0:	if !c1 cmpult	r3, r2 -> c1
	;;
#0:	if  c1 br @	.BB41_6
	;;
.BB41_1:                                ; %bb5
#0:	       cmpeq	r2, r3 -> c1
	;;
#0:	if  c1 br @	.BB41_7
	;;
.BB41_2:                                ; %bb7
#0:	       ldi	31 -> r0
#1:	       ldi	0 -> r8
	;;
#0:	       sub	r0, r2 -> r0
#1:	       add	r2, 1 -> r2
	;;
#0:	       brz eq @	r2, .BB41_5
#1:	       sl	r6, r0 -> r7
	;;
.BB41_3:                                ; %bb.nph
#0:	       add	r4, 1 -> r0
#1:	       sub	r1, 1 -> r9
#2:	       ldi	0 -> r8
#3:	       sr	r6, r2 -> r2
	;;
#0:	       sub	r0, r5 -> r5
	;;
.BB41_4:                                ; %bb8
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sr	r7, 31 -> r0
#1:	       sl	r2, 1 -> r2
#2:	       sub	r5, 1 -> r5
	;;
#0:	       or	r0, r2 -> r4
	;;
#0:	       sub	r9, r4 -> r0
	;;
#0:	       brz ne	r5, .BB41_4
#1:	       sra	r0, 31 -> r3
#2:	       sl	r7, 1 -> r0
	;;
#0:	       and	r3, r1 -> r2
#1:	       or	r0, r8 -> r7
#2:	       and	r3, 1 -> r8
	;;
#0:	       sub	r4, r2 -> r2
	;;
.BB41_5:                                ; %bb10
#0:	       sl	r7, 1 -> r0
	;;
#0:	       or	r0, r8 -> r0
	;;
.BB41_6:                                ; %bb11
#0:	       add	r15, 24 -> r15
#1:	       jop	ret
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB41_7:
#0:	       or	r6, 0 -> r0
#1:	       jop	ret
#2:	       add	r15, 24 -> r15
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
___udivsi3_end:

	.globl	___divsf3
	.align	4
___divsf3:                              ; @__divsf3
	.size	___divsf3_end-___divsf3
___divsf3_start:
; BB#0:                                 ; %entry
#0:	       ldiu	72 -> r3
#1:	       wb.s	r15, 18
#2:	       stx	r0 -> $f0
#3:	       ldga	0 -> r0
	;;
#0:	       sub	r15, r3 -> r15
#1:	       ldx	$f0 -> r4
#2:	       ldih	1024 -> r0
#3:	       ldiu	2047 -> r7
	;;
#0:	       stm.s	r10, r15, 13
#1:	       stx	r1 -> $f0
#2:	       sr	r4, 23 -> r2
#3:	       ldim	1023 -> r7
	;;
#0:	       stm.s	r11, r15, 12
#1:	       ldx	$f0 -> r5
#2:	       bbh	zext8 r2 -> r2
#3:	       or	r7, 0 -> r6
	;;
#0:	       stm.s	r12, r15, 11
#1:	       xor	r5, r4 -> r3
#2:	       sr	r5, 23 -> r1
#3:	       ldx	$rb, 0 -> r8
	;;
#0:	       stm.s	r13, r15, 10
#1:	       bbh	zext8 r1 -> r13
#2:	       and	r3, r0 -> r10
#3:	       ldi	253 -> r1
	;;
#0:	       stm.s	r14, r15, 9
#1:	       sub	r2, 1 -> r0
#2:	       ldih	3 -> r6
	;;
#0:	       stm.s	r0.23, r15, 8
#1:	       cmpult	r1, r0 -> c1
#2:	       and	r4, r6 -> r12
#3:	       and	r5, r6 -> r3
	;;
#1:	       stm.s	r1.23, r15, 7
	;;
#2:	       stm.s	r2.23, r15, 6
	;;
#3:	       stm.s	r3.23, r15, 5
	;;
#3:	       stm.s	r3.24, r15, 4
	;;
#0:	if  c1 br	.BB42_2
#1:	       stm.s	r8, r15, 3
#2:	       ldx	$ro, 0 -> r8
	;;
#0:	       stm.s	r8, r15, 2
	;;
#0:	       stm.s	r2, r15, 1
	;;
.BB42_1:                                ; %bb
#0:	       sub	r13, 1 -> r1
#1:	       ldi	254 -> r0
#2:	       ldi	0 -> r14
	;;
#0:	       cmpult	r1, r0 -> c1
	;;
#0:	if  c1 br @	.BB42_19
	;;
.BB42_2:                                ; %bb1
#0:	       ldiu	1 -> r0
#1:	       ldih	1023 -> r7
	;;
#0:	       ldim	0 -> r0
#1:	       and	r4, r7 -> r1
	;;
#0:	       ldih	1020 -> r0
	;;
#0:	       cmpult	r1, r0 -> c1
	;;
#0:	if  c1 br @	.BB42_4
	;;
.BB42_3:                                ; %bb2
#0:	       ldga	0 -> r0
	;;
#0:	       br	.BB42_9
#1:	       ldih	2 -> r0
	;;
#0:	       or	r4, r0 -> r0
	;;
#0:	       stx	r0 -> $f0
	;;
.BB42_4:                                ; %bb3
#0:	       and	r5, r7 -> r6
	;;
#0:	       cmpult	r6, r0 -> c1
	;;
#0:	if  c1 br @	.BB42_6
	;;
.BB42_5:                                ; %bb4
#0:	       ldga	0 -> r0
	;;
#0:	       br	.BB42_9
#1:	       ldih	2 -> r0
	;;
#0:	       or	r5, r0 -> r0
	;;
#0:	       stx	r0 -> $f0
	;;
.BB42_6:                                ; %bb5
#0:	       ldga	0 -> r0
	;;
#0:	       ldih	1020 -> r0
	;;
#0:	       cmpne	r1, r0 -> c1
	;;
#0:	if  c1 br @	.BB42_11
	;;
.BB42_7:                                ; %bb6
#0:	       cmpne	r6, r0 -> c1
	;;
#0:	if  c1 br @	.BB42_10
	;;
.BB42_8:                                ; %bb7
#0:	       fop	fnan -> f0
	;;
.BB42_9:                                ; %bb7
#0:	       ldm.s	r15, 8
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       stx	r0 -> $ro
	;;
#0:	       ldm.s	r15, 12
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       stx	r0 -> $rb
	;;
#0:	       ldm.s	r15, 16
	;;
#3:	       ldx	$mem, 0 -> r3.24
	;;
#0:	       ldm.s	r15, 20
	;;
#3:	       ldx	$mem, 0 -> r3.23
	;;
#0:	       ldm.s	r15, 24
	;;
#2:	       ldx	$mem, 0 -> r2.23
	;;
#0:	       ldm.s	r15, 28
	;;
#1:	       ldx	$mem, 0 -> r1.23
	;;
#0:	       ldm.s	r15, 32
	;;
#0:	       ldx	$mem, 0 -> r0.23
	;;
#0:	       ldm.s	r15, 36
	;;
#0:	       ldx	$mem, 0 -> r14
	;;
#0:	       ldm.s	r15, 40
	;;
#0:	       ldx	$mem, 0 -> r13
	;;
#0:	       ldm.s	r15, 44
	;;
#0:	       ldx	$mem, 0 -> r12
	;;
#0:	       ldm.s	r15, 48
	;;
#0:	       ldx	$mem, 0 -> r11
	;;
#0:	       ldm.s	r15, 52
#1:	       s2add	r15, 18 -> r15
	;;
#0:	       jop	ret
#1:	       ldx	$mem, 0 -> r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB42_10:                               ; %bb8
#0:	       or	r10, r1 -> r0
#1:	       br	.BB42_9
	;;
#0:	       stx	r0 -> $f0
	;;
	       nop	0
	;;
.BB42_11:                               ; %bb9
#0:	       cmpne	r6, r0 -> c1
	;;
#0:	if  c1 br @	.BB42_13
	;;
.BB42_12:                               ; %bb10
#0:	       stx	r10 -> $f0
#1:	       br @	.BB42_9
	;;
.BB42_13:                               ; %bb11
#0:	       brz ne @	r1, .BB42_16
	;;
.BB42_14:                               ; %bb12
#0:	       brz eq @	r6, .BB42_8
	;;
.BB42_15:                               ; %bb14
#0:	       stx	r10 -> $f0
#1:	       br @	.BB42_9
	;;
.BB42_16:                               ; %bb15
#0:	       brz ne @	r6, .BB42_18
	;;
.BB42_17:                               ; %bb16
#0:	       ldga	0 -> r0
	;;
#0:	       br	.BB42_9
#1:	       ldih	1020 -> r0
	;;
#0:	       or	r10, r0 -> r0
	;;
#0:	       stx	r0 -> $f0
	;;
.BB42_18:                               ; %bb17
#0:	       ldiu	2047 -> r4
#1:	       ldi	0 -> r14
	;;
#0:	       ldim	1023 -> r4
	;;
#0:	       ldih	3 -> r4
	;;
#0:	       cmpult	r4, r1 -> c1
	;;
#0:	if !c1 bbh	clz r12 -> r2
#1:	if !c1 ldi	9 -> r0
	;;
#0:	if !c1 sub	r2, 8 -> r1
#1:	if !c1 sub	r0, r2 -> r14
	;;
#0:	if !c1 sl	r12, r1 -> r12
#1:	       cmpult	r4, r6 -> c1
	;;
#0:	if !c1 bbh	clz r3 -> r0
	;;
#0:	if !c1 sub	r0, 8 -> r1
#1:	if !c1 add	r14, r0 -> r0
	;;
#0:	if !c1 sl	r3, r1 -> r3
#1:	if !c1 sub	r0, 9 -> r14
	;;
.BB42_19:                               ; %bb21
#0:	       ldga	0 -> r1
#1:	       ldiu	819 -> r0
	;;
#0:	       ldih	4 -> r1
#1:	       ldim	158 -> r0
	;;
#0:	       or	r3, r1 -> r11
#1:	       ldih	936 -> r0
#2:	       ldi	0 -> r1
#3:	       ldi	0 -> r3
	;;
#0:	       callg	___muldi3
#3:	       sl	r11, 8 -> r3.24
#2:	       ldi	0 -> r2.23
	;;
#3:	       sub	r0, r3.24 -> r3.23
	;;
#3:	       or	r3.23, 0 -> r0
	;;
#3:	       or	r3.24, 0 -> r2
	;;
#0:	       callg	___muldi3
#2:	       sub	r2.23, r1 -> r0
#1:	       ldi	0 -> r1
#3:	       ldi	0 -> r3
	;;
#3:	       or	r3.23, 0 -> r2
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       sr	r0, 31 -> r2
#1:	       sl	r1, 1 -> r0
#2:	       ldi	0 -> r1
#3:	       ldi	0 -> r3
	;;
#1:	       callg	___muldi3
#0:	       or	r2, r0 -> r0.23
#3:	       or	r3.24, 0 -> r2
	;;
#0:	       or	r0.23, 0 -> r0
	;;
	       nop	0
	;;
	       nop	0
	;;
#2:	       sub	r2.23, r1 -> r0
#1:	       ldi	0 -> r1
#0:	       or	r0.23, 0 -> r2
#3:	       ldi	0 -> r3
	;;
#0:	       callg	___muldi3
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       sr	r0, 31 -> r2
#1:	       sl	r1, 1 -> r0
#2:	       ldi	0 -> r1
#3:	       ldi	0 -> r3
	;;
#0:	       callg	___muldi3
#1:	       or	r2, r0 -> r1.23
#3:	       or	r3.24, 0 -> r2
	;;
#1:	       or	r1.23, 0 -> r0
	;;
	       nop	0
	;;
	       nop	0
	;;
#2:	       sub	r2.23, r1 -> r0
#0:	       ldi	0 -> r1
#1:	       or	r1.23, 0 -> r2
#3:	       ldi	0 -> r3
	;;
#0:	       callg	___muldi3
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       sr	r0, 31 -> r2
#1:	       sl	r1, 1 -> r0
#2:	       ldm.s	r15, 4
#3:	       sl	r12, 1 -> r1
	;;
#0:	       or	r2, r0 -> r0
#1:	       ldga	0 -> r2
#2:	       ldi	0 -> r3
	;;
#0:	       ldih	8 -> r2
#1:	       sub	r0, 2 -> r0
	;;
#0:	       callg	___muldi3
#1:	       or	r1, r2 -> r2
#2:	       ldx	$mem, 0 -> r1
	;;
#0:	       sub	r1, r13 -> r13
#1:	       ldi	0 -> r1
	;;
#3:	       ldiu	2047 -> r3.23
	;;
	       nop	0
	;;
#3:	       ldim	1023 -> r3.23
#0:	       add	r14, r13 -> r3
	;;
#3:	       ldih	7 -> r3.23
	;;
#3:	       cmpult	r3.23, r1 -> c1
	;;
#0:	if  c1 br @	.BB42_21
	;;
.BB42_20:                               ; %bb22
#1:	       mul	r1, r11 -> $mul1.0
#0:	       br	.BB42_22
#2:	       sl	r12, 24 -> r2
#3:	       sub	r3, 1 -> r3
	;;
#1:	       ldx	$mul1.0, 0 -> r0
	;;
#0:	       sub	r2, r0 -> r4
	;;
.BB42_21:                               ; %bb23
#0:	       sr	r1, 1 -> r1
#1:	       sl	r12, 23 -> r2
	;;
#0:	       mul	r1, r11 -> $mul0.0
	;;
#0:	       ldx	$mul0.0, 0 -> r0
	;;
#0:	       sub	r2, r0 -> r4
	;;
.BB42_22:                               ; %bb24
#0:	       ldi	127 -> r0
	;;
#0:	       add	r3, r0 -> r2
#1:	       ldi	255 -> r0
	;;
#0:	       cmplt	r2, r0 -> c1
	;;
#0:	if !c1 br @	.BB42_17
	;;
.BB42_23:                               ; %bb26
#0:	       ldi	0 -> r0
	;;
#0:	       cmplt	r0, r2 -> c1
	;;
#0:	if !c1 br @	.BB42_12
	;;
.BB42_24:                               ; %bb28
#0:	       ldiu	2047 -> r3
#1:	       sl	r4, 1 -> r0
#2:	       sl	r2, 23 -> r2
	;;
#0:	       ldim	1023 -> r3
#1:	       cmpult	r11, r0 -> c1
	;;
#0:	       ldih	3 -> r3
#1:	       ldx	$c1 -> r0
	;;
#0:	       and	r1, r3 -> r1
	;;
#0:	       or	r2, r1 -> r1
	;;
#0:	       br	.BB42_9
#1:	       add	r0, r1 -> r0
	;;
#0:	       or	r0, r10 -> r0
	;;
#0:	       stx	r0 -> $f0
	;;
	.align	4
___divsf3_end:

	.globl	___lshrdi3
	.align	4
___lshrdi3:                             ; @__lshrdi3
	.size	___lshrdi3_end-___lshrdi3
___lshrdi3_start:
; BB#0:                                 ; %entry
#0:	       btest	r2, 5 -> c1
#1:	       wb.s	r15, 6
#2:	       sub	r15, 24 -> r15
	;;
#0:	if  c1 br @	.BB43_4
	;;
.BB43_1:                                ; %bb1
#0:	       brz eq @	r2, .BB43_3
	;;
.BB43_2:                                ; %bb3
#0:	       ldi	32 -> r3
#1:	       sr	r0, r2 -> r0
	;;
#0:	       sub	r3, r2 -> r3
	;;
#0:	       sl	r1, r3 -> r3
#1:	       sr	r1, r2 -> r1
	;;
#0:	       or	r3, r0 -> r0
	;;
.BB43_3:                                ; %bb5
#0:	       add	r15, 24 -> r15
#1:	       jop	ret
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB43_4:                                ; %bb
#0:	       ldi	-32 -> r0
#1:	       jop	ret
#2:	       add	r15, 24 -> r15
	;;
#0:	       add	r2, r0 -> r0
	;;
#0:	       sr	r1, r0 -> r0
#1:	       ldi	0 -> r1
	;;
	       nop	0
	;;
	.align	4
___lshrdi3_end:

	.globl	___udivdi3
	.align	4
___udivdi3:                             ; @__udivdi3
	.size	___udivdi3_end-___udivdi3
___udivdi3_start:
; BB#0:                                 ; %entry
#0:	       ldiu	48 -> r5
#1:	       wb.s	r15, 12
	;;
#0:	       sub	r15, r5 -> r15
#1:	       ldx	$rb, 0 -> r5
	;;
#0:	       stm.s	r5, r15, 5
#1:	       ldx	$ro, 0 -> r5
#2:	       or	r15, 0 -> r4
	;;
#0:	       stm.s	r5, r15, 4
	;;
#0:	       stm.a	0, r4, 0
	;;
#0:	       callg	___udivmoddi4
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldm.s	r15, 16
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       stx	r2 -> $ro
	;;
#0:	       ldm.s	r15, 20
#1:	       s2add	r15, 12 -> r15
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       stx	r2 -> $rb
	;;
#0:	       jop	ret
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
___udivdi3_end:

	.align	4
___udivmoddi4:                          ; @__udivmoddi4
	.size	___udivmoddi4_end-___udivmoddi4
___udivmoddi4_start:
; BB#0:                                 ; %entry
#0:	       ldiu	48 -> r4
#1:	       wb.s	r15, 12
	;;
#0:	       sub	r15, r4 -> r15
#1:	       ldx	$rb, 0 -> r4
	;;
#0:	       stm.s	r10, r15, 7
#1:	       or	r3, 0 -> r10
	;;
#0:	       stm.s	r11, r15, 6
#1:	       or	r1, 0 -> r11
	;;
#0:	       stm.s	r12, r15, 5
#1:	       or	r2, 0 -> r12
	;;
#0:	       stm.s	r13, r15, 4
#1:	       or	r0, 0 -> r13
	;;
#0:	       stm.s	r14, r15, 3
	;;
#0:	       stm.s	r4, r15, 2
#1:	       ldx	$ro, 0 -> r4
	;;
#0:	       brz ne	r11, .BB45_8
#1:	       stm.s	r4, r15, 1
	;;
#0:	       ldm.f	r15, 48
	;;
#0:	       ldx	$mem, 0 -> r14
	;;
.BB45_1:                                ; %bb
#0:	       brz ne @	r10, .BB45_5
	;;
.BB45_2:                                ; %bb1
#0:	       brz eq @	r14, .BB45_4
	;;
.BB45_3:                                ; %bb2
#0:	       or	r13, 0 -> r0
#1:	       or	r12, 0 -> r1
#2:	       stm.a	0, r14, 1
	;;
#0:	       callg	___umodsi3
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       stm.a	r0, r14, 0
	;;
.BB45_4:                                ; %bb3
#0:	       or	r13, 0 -> r0
#1:	       callg	___udivsi3
#2:	       or	r12, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       br @	.BB45_43
#1:	       ldi	0 -> r1
	;;
.BB45_5:                                ; %bb4
#0:	       cmpeq	r14, 0 -> c3
#1:	       ldi	0 -> r1
	;;
#0:	if  c3 br @	.BB45_43
#1:	       or	r1, 0 -> r0
	;;
.BB45_6:                                ; %bb5
#0:	       stm.a	r13, r14, 0
	;;
#0:	       stm.a	0, r14, 1
	;;
.BB45_7:                                ; %bb5
#0:	       ldi	0 -> r0
#1:	       br	.BB45_43
	;;
#0:	       or	r0, 0 -> r1
	;;
	       nop	0
	;;
.BB45_8:                                ; %bb7
#0:	       brz ne @	r12, .BB45_25
	;;
.BB45_9:                                ; %bb8
#0:	       brz ne @	r10, .BB45_13
	;;
.BB45_10:                               ; %bb9
#0:	       brz eq @	r14, .BB45_12
	;;
.BB45_11:                               ; %bb10
#0:	       or	r11, 0 -> r0
#1:	       or	r12, 0 -> r1
#2:	       stm.a	0, r14, 1
	;;
#0:	       callg	___umodsi3
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       stm.a	r0, r14, 0
	;;
.BB45_12:                               ; %bb11
#0:	       or	r11, 0 -> r0
#1:	       callg	___udivsi3
#2:	       or	r12, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       br @	.BB45_43
#1:	       ldi	0 -> r1
	;;
.BB45_13:                               ; %bb12
#0:	       brz ne @	r13, .BB45_17
	;;
.BB45_14:                               ; %bb13
#0:	       brz eq @	r14, .BB45_16
	;;
.BB45_15:                               ; %bb14
#0:	       or	r11, 0 -> r0
#1:	       or	r10, 0 -> r1
#2:	       stm.a	0, r14, 0
	;;
#0:	       callg	___umodsi3
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       stm.a	r0, r14, 1
	;;
.BB45_16:                               ; %bb15
#0:	       or	r11, 0 -> r0
#1:	       callg	___udivsi3
#2:	       or	r10, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       br @	.BB45_43
#1:	       ldi	0 -> r1
	;;
.BB45_17:                               ; %bb16
#0:	       sub	r10, 1 -> r1
	;;
#0:	       and	r1, r10 -> r0
	;;
#0:	       brz ne @	r0, .BB45_21
	;;
.BB45_18:                               ; %bb17
#0:	       brz eq @	r14, .BB45_20
	;;
.BB45_19:                               ; %bb18
#0:	       and	r1, r11 -> r0
#1:	       stm.a	r13, r14, 0
	;;
#0:	       stm.a	r0, r14, 1
	;;
.BB45_20:                               ; %bb19
#0:	       bbh	ctz r10 -> r0
#1:	       br	.BB45_43
#2:	       ldi	0 -> r1
	;;
#0:	       sr	r11, r0 -> r0
	;;
	       nop	0
	;;
.BB45_21:                               ; %bb20
#0:	       bbh	clz r10 -> r1
#1:	       bbh	clz r11 -> r0
	;;
#0:	       sub	r1, r0 -> r2
	;;
#0:	       cmpult	r2, 31 -> c1
	;;
#0:	if  c1 br @	.BB45_24
	;;
.BB45_22:                               ; %bb21
#0:	       cmpeq	r14, 0 -> c3
#1:	       ldi	0 -> r1
	;;
#0:	if  c3 br @	.BB45_43
#1:	       or	r1, 0 -> r0
	;;
.BB45_23:                               ; %bb22
#0:	       stm.a	r13, r14, 0
#1:	       br	.BB45_7
	;;
#0:	       stm.a	r11, r14, 1
	;;
	       nop	0
	;;
.BB45_24:                               ; %bb24
#0:	       ldi	31 -> r0
#1:	       add	r2, 1 -> r1
	;;
#0:	       sub	r0, r2 -> r0
#1:	       sr	r13, r1 -> r3
#2:	       ldi	0 -> r2
#3:	       sr	r11, r1 -> r5
	;;
#0:	       br	.BB45_37
#1:	       sl	r11, r0 -> r4
#2:	       sl	r13, r0 -> r7
	;;
#0:	       or	r4, r3 -> r3
	;;
	       nop	0
	;;
.BB45_25:                               ; %bb25
#0:	       brz ne @	r10, .BB45_33
	;;
.BB45_26:                               ; %bb26
#0:	       sub	r12, 1 -> r1
	;;
#0:	       and	r1, r12 -> r0
	;;
#0:	       brz ne @	r0, .BB45_32
	;;
.BB45_27:                               ; %bb27
#0:	       brz eq @	r14, .BB45_29
	;;
.BB45_28:                               ; %bb29
#0:	       and	r1, r13 -> r0
	;;
#0:	       stm.a	r0, r14, 0
	;;
#0:	       stm.a	0, r14, 1
	;;
.BB45_29:                               ; %bb30
#0:	       cmpeq	r12, 1 -> c1
	;;
#0:	if !c1 br @	.BB45_31
	;;
.BB45_30:
#0:	       or	r13, 0 -> r0
#1:	       br @	.BB45_43
#2:	       or	r11, 0 -> r1
	;;
.BB45_31:                               ; %bb32
#0:	       ldi	32 -> r0
#1:	       bbh	ctz r12 -> r2
	;;
#0:	       br	.BB45_43
#1:	       sub	r0, r2 -> r0
	;;
#0:	       sl	r11, r0 -> r1
#1:	       sr	r13, r2 -> r0
	;;
#0:	       or	r1, r0 -> r0
#1:	       sr	r11, r2 -> r1
	;;
.BB45_32:                               ; %bb33
#0:	       bbh	clz r12 -> r1
#1:	       bbh	clz r11 -> r0
#2:	       ldi	31 -> r2
	;;
#0:	       sub	r1, r0 -> r5
#1:	       ldi	33 -> r0
	;;
#0:	       xor	r5, -1 -> r4
#1:	       add	r5, r0 -> r1
#2:	       sub	r2, r5 -> r6
#3:	       ldi	-2 -> r0
	;;
#0:	       add	r5, 1 -> r3
#2:	       sub	r0, r5 -> r2.16
#1:	       sl	r11, r6 -> r2
#3:	       sr	r13, r1 -> r9
	;;
#1:	       sr	r13, r3 -> r0
#2:	       sl	r11, r4 -> r8
#3:	       sra	r4, 31 -> r7
#0:	       sr	r11, r1 -> r0.16
	;;
#1:	       or	r2, r0 -> r1.16
#3:	       sl	r13, r4 -> r3.16
#0:	       sra	r5, 31 -> r0
#2:	       or	r9, r8 -> r9
	;;
#0:	       sra	r3, 31 -> r5
#1:	       sr	r11, r3 -> r8
#2:	       sl	r13, r6 -> r2
	;;
#2:	       sra	r2.16, 31 -> r4
#0:	       and	r9, r5 -> r6
#1:	       and	r1.16, r7 -> r3
#3:	       and	r2, r7 -> r2
	;;
#1:	       br	.BB45_37
#3:	       and	r3.16, r0 -> r0
#2:	       and	r8, r4 -> r4
#0:	       and	r0.16, r5 -> r5
	;;
#0:	       or	r3, r0 -> r7
#1:	       or	r6, r4 -> r3
	;;
	       nop	0
	;;
.BB45_33:                               ; %bb34
#0:	       bbh	clz r10 -> r1
#1:	       bbh	clz r11 -> r0
#2:	       ldi	32 -> r2
	;;
#0:	       sub	r1, r0 -> r3
	;;
#0:	       cmpult	r3, r2 -> c1
	;;
#0:	if  c1 br @	.BB45_36
	;;
.BB45_34:                               ; %bb35
#0:	       ldi	0 -> r1
#1:	       brz eq	r14, .BB45_43
	;;
#0:	       or	r1, 0 -> r0
	;;
	       nop	0
	;;
.BB45_35:                               ; %bb36
#0:	       br @	.BB45_23
	;;
.BB45_36:                               ; %bb38
#0:	       ldi	31 -> r0
#1:	       add	r3, 1 -> r1
#2:	       sub	r3, 31 -> r2
	;;
#0:	       sub	r0, r3 -> r4
#1:	       sra	r2, 31 -> r6
#2:	       sr	r13, r1 -> r0
#3:	       sr	r11, r1 -> r5
	;;
#0:	       and	r0, r6 -> r3
#1:	       sl	r11, r4 -> r0
#2:	       ldi	0 -> r2
#3:	       sl	r13, r4 -> r7
	;;
#0:	       or	r3, r0 -> r3
#1:	       and	r5, r6 -> r5
	;;
.BB45_37:                               ; %bb41.preheader
#0:	       ldi	0 -> r4
#1:	       brz eq	r1, .BB45_41
	;;
#0:	       or	r4, 0 -> r6
	;;
	       nop	0
	;;
.BB45_38:                               ; %bb.nph
#0:	       ldi	-1 -> r0
#1:	       sr	r3, 31 -> r6
#2:	       sl	r5, 1 -> r5
#3:	       sr	r2, 31 -> r4
	;;
#1:	       carr	r12, r0 -> r0
#2:	       or	r6, r5 -> r8
#0:	       ldi	-2 -> r0.16
	;;
#0:	       add	r10, r0 -> r9
#1:	       sl	r7, 1 -> r0
	;;
#1:	       or	r4, r0 -> r6
#2:	       ldi	0 -> r4
#0:	       sub	r9, 1 -> r0.17
	;;
#3:	       sr	r7, 31 -> r3.17
	;;
#3:	       sub	r12, 1 -> r3.16
	;;
.BB45_39:                               ; %bb40
                                        ; =>This Inner Loop Header: Depth=1
#1:	       sl	r3, 1 -> r5
#0:	       and	r8, r0.16 -> r7
#2:	       sr	r3, 31 -> r0
#3:	       sr	r2, 31 -> r9
	;;
#1:	       or	r7, r0 -> r8
#0:	       and	r6, r0.16 -> r7
#2:	       sub	r1, 1 -> r1
	;;
#3:	       or	r3.17, r5 -> r5
#0:	       sub	r0.17, r8 -> r3
#1:	       or	r7, r9 -> r7
	;;
#3:	       borr	r3.16, r5 -> r0
#0:	       sl	r7, 1 -> r9
	;;
#0:	       sub	r3, r0 -> r0
	;;
#1:	       sra	r0, 31 -> r1.17
#3:	       sl	r2, 1 -> r3.17
	;;
#1:	       and	r1.17, r10 -> r0
	;;
#1:	       and	r1.17, r12 -> r3
#0:	       sub	r8, r0 -> r2
	;;
#0:	       borr	r5, r3 -> r0
#1:	       sub	r5, r3 -> r3
	;;
#0:	       sub	r2, r0 -> r5
#1:	       sr	r3, 31 -> r8
	;;
#3:	       or	r3.17, r4 -> r2
#0:	       sl	r5, 1 -> r0
#1:	       and	r1.17, 1 -> r4
	;;
#0:	       brz ne	r1, .BB45_39
#1:	       sr	r2, 31 -> r1.16
#2:	       or	r8, r0 -> r8
	;;
#1:	       or	r1.16, r9 -> r0
#3:	       sr	r6, 31 -> r3.17
	;;
#0:	       or	r0, 0 -> r6
	;;
.BB45_40:                               ; %bb41.bb42_crit_edge
#0:	       ldi	0 -> r6
	;;
.BB45_41:                               ; %bb42
#0:	       carr	r2, r2 -> r1
#1:	       brz eq	r14, .BB45_43
#2:	       add	r7, r7 -> r0
#3:	       add	r2, r2 -> r2
	;;
#0:	       add	r0, r1 -> r1
#1:	       or	r2, r4 -> r0
	;;
#0:	       or	r1, r6 -> r1
	;;
.BB45_42:                               ; %bb43
#0:	       stm.a	r3, r14, 0
	;;
#0:	       stm.a	r5, r14, 1
	;;
.BB45_43:                               ; %bb45
#0:	       ldm.s	r15, 4
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       stx	r2 -> $ro
	;;
#0:	       ldm.s	r15, 8
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       stx	r2 -> $rb
	;;
#0:	       ldm.s	r15, 12
	;;
#0:	       ldx	$mem, 0 -> r14
	;;
#0:	       ldm.s	r15, 16
	;;
#0:	       ldx	$mem, 0 -> r13
	;;
#0:	       ldm.s	r15, 20
	;;
#0:	       ldx	$mem, 0 -> r12
	;;
#0:	       ldm.s	r15, 24
	;;
#0:	       ldx	$mem, 0 -> r11
	;;
#0:	       ldm.s	r15, 28
#1:	       s2add	r15, 12 -> r15
	;;
#0:	       jop	ret
#1:	       ldx	$mem, 0 -> r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
___udivmoddi4_end:

	.globl	___divsi3
	.align	4
___divsi3:                              ; @__divsi3
	.size	___divsi3_end-___divsi3
___divsi3_start:
; BB#0:                                 ; %entry
#0:	       cmpeq	r1, 0 -> c2
#1:	       cmpeq	r0, 0 -> c1
#2:	       ldi	0 -> r2
#3:	       wb.s	r15, 6
	;;
#0:	       comb	or c2, c1 -> c1
#1:	       sub	r15, 24 -> r15
	;;
#0:	if  c1 br @	.BB46_8
	;;
.BB46_1:                                ; %bb3.i
#0:	       sra	r0, 31 -> r5
#1:	       sra	r1, 31 -> r4
	;;
#0:	       xor	r5, r0 -> r3
#1:	       xor	r4, r1 -> r2
	;;
#0:	       sub	r3, r5 -> r6
#1:	       sub	r2, r4 -> r5
#2:	       ldi	31 -> r3
#3:	       ldi	0 -> r2
	;;
#0:	       bbh	clz r5 -> r9
#1:	       bbh	clz r6 -> r1.16
	;;
#1:	       sub	r9, r1.16 -> r4
	;;
#0:	       cmpult	r3, r4 -> c1
	;;
#0:	if  c1 br @	.BB46_8
	;;
.BB46_2:                                ; %bb5.i
#0:	       cmpeq	r4, r3 -> c1
	;;
#0:	if !c1 br @	.BB46_4
	;;
.BB46_3:
#0:	       or	r6, 0 -> r2
#1:	       br @	.BB46_8
	;;
.BB46_4:                                ; %bb7.i
#0:	       ldi	31 -> r2
#1:	       ldi	0 -> r8
	;;
#0:	       sub	r2, r4 -> r3
#1:	       add	r4, 1 -> r2
	;;
#0:	       brz eq @	r2, .BB46_7
#1:	       sl	r6, r3 -> r7
	;;
.BB46_5:                                ; %bb.nph.i
#0:	       add	r9, 1 -> r3
#1:	       ldi	0 -> r8
	;;
#1:	       sub	r3, r1.16 -> r9
#3:	       sub	r5, 1 -> r3.16
#0:	       sr	r6, r2 -> r3
	;;
.BB46_6:                                ; %bb8.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sr	r7, 31 -> r2
#1:	       sl	r3, 1 -> r3
#2:	       sub	r9, 1 -> r9
	;;
#0:	       or	r2, r3 -> r6
	;;
#3:	       sub	r3.16, r6 -> r2
	;;
#0:	       brz ne	r9, .BB46_6
#1:	       sra	r2, 31 -> r4
#2:	       sl	r7, 1 -> r2
	;;
#0:	       and	r4, r5 -> r3
#1:	       or	r2, r8 -> r7
#2:	       and	r4, 1 -> r8
	;;
#0:	       sub	r6, r3 -> r3
	;;
.BB46_7:                                ; %bb10.i
#0:	       sl	r7, 1 -> r2
	;;
#0:	       or	r2, r8 -> r2
	;;
.BB46_8:                                ; %__udivsi3.exit
#0:	       xor	r1, r0 -> r0
#1:	       jop	ret
#2:	       add	r15, 24 -> r15
	;;
#0:	       sra	r0, 31 -> r1
	;;
#0:	       xor	r2, r1 -> r0
	;;
#0:	       sub	r0, r1 -> r0
	;;
	.align	4
___divsi3_end:

	.section	.rodata,"a",@progbits
	.align	32                      ; @pad.2704
_pad.2704:
	.ascii	 "\200\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"

	.section	.data.rel.ro.local,"aw",@progbits
	.align	32                      ; @test.2537
_test.2537:
	.long	._.str
	.long	._.str1
	.long	._.str2
	.long	._.str3
	.long	._.str4
	.long	._.str5
	.long	._.str6
	.long	._.str7
	.long	._.str8
	.long	._.str9
	.long	._.str10
	.long	._.str11
	.long	._.str12
	.long	._.str13

	.section	.rodata,"a",@progbits
	.align	4                       ; @.str
._.str:
	.byte	0

	.align	16                      ; @.str1
._.str1:
	.ascii	 "d41d8cd98f00b204e9800998ecf8427e\000"

	.align	4                       ; @.str2
._.str2:
	.ascii	 "a\000"

	.align	16                      ; @.str3
._.str3:
	.ascii	 "0cc175b9c0f1b6a831c399e269772661\000"

	.align	4                       ; @.str4
._.str4:
	.ascii	 "abc\000"

	.align	16                      ; @.str5
._.str5:
	.ascii	 "900150983cd24fb0d6963f7d28e17f72\000"

	.align	4                       ; @.str6
._.str6:
	.ascii	 "message digest\000"

	.align	16                      ; @.str7
._.str7:
	.ascii	 "f96b697d7cb7938d525a2f31aaf161d0\000"

	.align	16                      ; @.str8
._.str8:
	.ascii	 "abcdefghijklmnopqrstuvwxyz\000"

	.align	16                      ; @.str9
._.str9:
	.ascii	 "c3fcd3d76192e4007dfb496cca67e13b\000"

	.align	16                      ; @.str10
._.str10:
	.ascii	 "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789\000"

	.align	16                      ; @.str11
._.str11:
	.ascii	 "d174ab98d277d9f5a5611c2c9f419d9f\000"

	.align	16                      ; @.str12
._.str12:
	.ascii	 "12345678901234567890123456789012345678901234567890123456789012345678901234567890\000"

	.align	16                      ; @.str13
._.str13:
	.ascii	 "57edf4a22be3c955ac49da2e2107b67a\000"

	.align	4                       ; @.str14
._.str14:
	.ascii	 "%02x\000"

	.align	4                       ; @.str15
._.str15:
	.ascii	 "MD5 (\"%s\") = \000"

	.align	16                      ; @.str16
._.str16:
	.ascii	 "**** ERROR, should be: %s\n\000"

	.align	16                      ; @.str17
._.str17:
	.ascii	 "md5 self-test completed successfully.\000"

	.align	4                       ; @.str18
._.str18:
	.ascii	 "\n\000"

	.align	4                       ; @.str25
._.str25:
	.ascii	 "C\000"

	.section	.data.rel.local,"aw",@progbits
	.align	32                      ; @impure_data
_impure_data:
	.long	0                       ; 0x0
	.long	_impure_data+748
	.long	_impure_data+852
	.long	_impure_data+956
	.long	0                       ; 0x0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.long	0                       ; 0x0
	.long	._.str25
	.long	0                       ; 0x0
	.long	0
	.long	0
	.long	0                       ; 0x0
	.long	0
	.long	0
	.long	0                       ; 0x0
	.long	0
	.long	0                       ; 0x0
	.long	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.long	0                       ; 0x0
	.quad	1                       ; 0x1
	.short	13070                   ; 0x330e
	.short	43981                   ; 0xabcd
	.short	4660                    ; 0x1234
	.short	58989                   ; 0xe66d
	.short	57068                   ; 0xdeec
	.short	5                       ; 0x5
	.short	11                      ; 0xb
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.long	0                       ; 0x0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.long	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.long	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0
	.byte	0

	.section	.rodata,"a",@progbits
	.align	4                       ; @.str26
._.str26:
	.ascii	 "INF\000"

	.align	4                       ; @.str127
._.str127:
	.ascii	 "inf\000"

	.align	4                       ; @.str228
._.str228:
	.ascii	 "NAN\000"

	.align	4                       ; @.str329
._.str329:
	.ascii	 "nan\000"

	.align	4                       ; @.str531
._.str531:
	.ascii	 "(null)\000"

	.align	16                      ; @.str733
._.str733:
	.ascii	 "bug in vfprintf: bad base\000"

	.align	4                       ; @blanks.3634
_blanks.3634:
	.ascii	 "                "

	.align	4                       ; @zeroes.3635
_zeroes.3635:
	.ascii	 "0000000000000000"

	.align	4                       ; @.str834
._.str834:
	.ascii	 "0\000"

	.align	4                       ; @.str36
._.str36:
	.ascii	 "INF\000"

	.align	4                       ; @.str137
._.str137:
	.ascii	 "inf\000"

	.align	4                       ; @.str238
._.str238:
	.ascii	 "NAN\000"

	.align	4                       ; @.str339
._.str339:
	.ascii	 "nan\000"

	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16                      ; @.str440
._.str440:
	.ascii	 "0123456789abcdef\000"

	.section	.rodata,"a",@progbits
	.align	4                       ; @.str541
._.str541:
	.ascii	 "(null)\000"

	.section	.rodata.str1.16,"aMS",@progbits,1
	.align	16                      ; @.str642
._.str642:
	.ascii	 "0123456789ABCDEF\000"

	.section	.rodata,"a",@progbits
	.align	16                      ; @.str743
._.str743:
	.ascii	 "bug in vfprintf: bad base\000"

	.align	4                       ; @blanks.3668
_blanks.3668:
	.ascii	 "                "

	.align	4                       ; @zeroes.3669
_zeroes.3669:
	.ascii	 "0000000000000000"

	.align	4                       ; @.str844
._.str844:
	.ascii	 "0\000"

	.align	4                       ; @.str61
._.str61:
	.ascii	 "Infinity\000"

	.align	4                       ; @.str162
._.str162:
	.ascii	 "NaN\000"

	.align	4                       ; @.str263
._.str263:
	.ascii	 "0\000"

	.align	4                       ; @.str69
._.str69:
	.ascii	 ".\000"

	.section	.data.rel.local,"aw",@progbits
	.align	32                      ; @__malloc_av_
___malloc_av_:
	.long	0
	.long	0
	.long	___malloc_av_
	.long	___malloc_av_
	.long	___malloc_av_+8
	.long	___malloc_av_+8
	.long	___malloc_av_+16
	.long	___malloc_av_+16
	.long	___malloc_av_+24
	.long	___malloc_av_+24
	.long	___malloc_av_+32
	.long	___malloc_av_+32
	.long	___malloc_av_+40
	.long	___malloc_av_+40
	.long	___malloc_av_+48
	.long	___malloc_av_+48
	.long	___malloc_av_+56
	.long	___malloc_av_+56
	.long	___malloc_av_+64
	.long	___malloc_av_+64
	.long	___malloc_av_+72
	.long	___malloc_av_+72
	.long	___malloc_av_+80
	.long	___malloc_av_+80
	.long	___malloc_av_+88
	.long	___malloc_av_+88
	.long	___malloc_av_+96
	.long	___malloc_av_+96
	.long	___malloc_av_+104
	.long	___malloc_av_+104
	.long	___malloc_av_+112
	.long	___malloc_av_+112
	.long	___malloc_av_+120
	.long	___malloc_av_+120
	.long	___malloc_av_+128
	.long	___malloc_av_+128
	.long	___malloc_av_+136
	.long	___malloc_av_+136
	.long	___malloc_av_+144
	.long	___malloc_av_+144
	.long	___malloc_av_+152
	.long	___malloc_av_+152
	.long	___malloc_av_+160
	.long	___malloc_av_+160
	.long	___malloc_av_+168
	.long	___malloc_av_+168
	.long	___malloc_av_+176
	.long	___malloc_av_+176
	.long	___malloc_av_+184
	.long	___malloc_av_+184
	.long	___malloc_av_+192
	.long	___malloc_av_+192
	.long	___malloc_av_+200
	.long	___malloc_av_+200
	.long	___malloc_av_+208
	.long	___malloc_av_+208
	.long	___malloc_av_+216
	.long	___malloc_av_+216
	.long	___malloc_av_+224
	.long	___malloc_av_+224
	.long	___malloc_av_+232
	.long	___malloc_av_+232
	.long	___malloc_av_+240
	.long	___malloc_av_+240
	.long	___malloc_av_+248
	.long	___malloc_av_+248
	.long	___malloc_av_+256
	.long	___malloc_av_+256
	.long	___malloc_av_+264
	.long	___malloc_av_+264
	.long	___malloc_av_+272
	.long	___malloc_av_+272
	.long	___malloc_av_+280
	.long	___malloc_av_+280
	.long	___malloc_av_+288
	.long	___malloc_av_+288
	.long	___malloc_av_+296
	.long	___malloc_av_+296
	.long	___malloc_av_+304
	.long	___malloc_av_+304
	.long	___malloc_av_+312
	.long	___malloc_av_+312
	.long	___malloc_av_+320
	.long	___malloc_av_+320
	.long	___malloc_av_+328
	.long	___malloc_av_+328
	.long	___malloc_av_+336
	.long	___malloc_av_+336
	.long	___malloc_av_+344
	.long	___malloc_av_+344
	.long	___malloc_av_+352
	.long	___malloc_av_+352
	.long	___malloc_av_+360
	.long	___malloc_av_+360
	.long	___malloc_av_+368
	.long	___malloc_av_+368
	.long	___malloc_av_+376
	.long	___malloc_av_+376
	.long	___malloc_av_+384
	.long	___malloc_av_+384
	.long	___malloc_av_+392
	.long	___malloc_av_+392
	.long	___malloc_av_+400
	.long	___malloc_av_+400
	.long	___malloc_av_+408
	.long	___malloc_av_+408
	.long	___malloc_av_+416
	.long	___malloc_av_+416
	.long	___malloc_av_+424
	.long	___malloc_av_+424
	.long	___malloc_av_+432
	.long	___malloc_av_+432
	.long	___malloc_av_+440
	.long	___malloc_av_+440
	.long	___malloc_av_+448
	.long	___malloc_av_+448
	.long	___malloc_av_+456
	.long	___malloc_av_+456
	.long	___malloc_av_+464
	.long	___malloc_av_+464
	.long	___malloc_av_+472
	.long	___malloc_av_+472
	.long	___malloc_av_+480
	.long	___malloc_av_+480
	.long	___malloc_av_+488
	.long	___malloc_av_+488
	.long	___malloc_av_+496
	.long	___malloc_av_+496
	.long	___malloc_av_+504
	.long	___malloc_av_+504
	.long	___malloc_av_+512
	.long	___malloc_av_+512
	.long	___malloc_av_+520
	.long	___malloc_av_+520
	.long	___malloc_av_+528
	.long	___malloc_av_+528
	.long	___malloc_av_+536
	.long	___malloc_av_+536
	.long	___malloc_av_+544
	.long	___malloc_av_+544
	.long	___malloc_av_+552
	.long	___malloc_av_+552
	.long	___malloc_av_+560
	.long	___malloc_av_+560
	.long	___malloc_av_+568
	.long	___malloc_av_+568
	.long	___malloc_av_+576
	.long	___malloc_av_+576
	.long	___malloc_av_+584
	.long	___malloc_av_+584
	.long	___malloc_av_+592
	.long	___malloc_av_+592
	.long	___malloc_av_+600
	.long	___malloc_av_+600
	.long	___malloc_av_+608
	.long	___malloc_av_+608
	.long	___malloc_av_+616
	.long	___malloc_av_+616
	.long	___malloc_av_+624
	.long	___malloc_av_+624
	.long	___malloc_av_+632
	.long	___malloc_av_+632
	.long	___malloc_av_+640
	.long	___malloc_av_+640
	.long	___malloc_av_+648
	.long	___malloc_av_+648
	.long	___malloc_av_+656
	.long	___malloc_av_+656
	.long	___malloc_av_+664
	.long	___malloc_av_+664
	.long	___malloc_av_+672
	.long	___malloc_av_+672
	.long	___malloc_av_+680
	.long	___malloc_av_+680
	.long	___malloc_av_+688
	.long	___malloc_av_+688
	.long	___malloc_av_+696
	.long	___malloc_av_+696
	.long	___malloc_av_+704
	.long	___malloc_av_+704
	.long	___malloc_av_+712
	.long	___malloc_av_+712
	.long	___malloc_av_+720
	.long	___malloc_av_+720
	.long	___malloc_av_+728
	.long	___malloc_av_+728
	.long	___malloc_av_+736
	.long	___malloc_av_+736
	.long	___malloc_av_+744
	.long	___malloc_av_+744
	.long	___malloc_av_+752
	.long	___malloc_av_+752
	.long	___malloc_av_+760
	.long	___malloc_av_+760
	.long	___malloc_av_+768
	.long	___malloc_av_+768
	.long	___malloc_av_+776
	.long	___malloc_av_+776
	.long	___malloc_av_+784
	.long	___malloc_av_+784
	.long	___malloc_av_+792
	.long	___malloc_av_+792
	.long	___malloc_av_+800
	.long	___malloc_av_+800
	.long	___malloc_av_+808
	.long	___malloc_av_+808
	.long	___malloc_av_+816
	.long	___malloc_av_+816
	.long	___malloc_av_+824
	.long	___malloc_av_+824
	.long	___malloc_av_+832
	.long	___malloc_av_+832
	.long	___malloc_av_+840
	.long	___malloc_av_+840
	.long	___malloc_av_+848
	.long	___malloc_av_+848
	.long	___malloc_av_+856
	.long	___malloc_av_+856
	.long	___malloc_av_+864
	.long	___malloc_av_+864
	.long	___malloc_av_+872
	.long	___malloc_av_+872
	.long	___malloc_av_+880
	.long	___malloc_av_+880
	.long	___malloc_av_+888
	.long	___malloc_av_+888
	.long	___malloc_av_+896
	.long	___malloc_av_+896
	.long	___malloc_av_+904
	.long	___malloc_av_+904
	.long	___malloc_av_+912
	.long	___malloc_av_+912
	.long	___malloc_av_+920
	.long	___malloc_av_+920
	.long	___malloc_av_+928
	.long	___malloc_av_+928
	.long	___malloc_av_+936
	.long	___malloc_av_+936
	.long	___malloc_av_+944
	.long	___malloc_av_+944
	.long	___malloc_av_+952
	.long	___malloc_av_+952
	.long	___malloc_av_+960
	.long	___malloc_av_+960
	.long	___malloc_av_+968
	.long	___malloc_av_+968
	.long	___malloc_av_+976
	.long	___malloc_av_+976
	.long	___malloc_av_+984
	.long	___malloc_av_+984
	.long	___malloc_av_+992
	.long	___malloc_av_+992
	.long	___malloc_av_+1000
	.long	___malloc_av_+1000
	.long	___malloc_av_+1008
	.long	___malloc_av_+1008
	.long	___malloc_av_+1016
	.long	___malloc_av_+1016

	.data
	.align	4                       ; @__malloc_sbrk_base
___malloc_sbrk_base:
	.long	4294967295

	.local	___malloc_current_mallinfo.0 ; @__malloc_current_mallinfo.0
                                        ; @__malloc_current_mallinfo.0
	.comm	___malloc_current_mallinfo.0,4,32
	.local	___malloc_max_sbrked_mem ; @__malloc_max_sbrked_mem
                                        ; @__malloc_max_sbrked_mem
	.comm	___malloc_max_sbrked_mem,4,4
	.local	___malloc_max_total_mem ; @__malloc_max_total_mem
                                        ; @__malloc_max_total_mem
	.comm	___malloc_max_total_mem,4,4
	.section	.rodata,"a",@progbits
	.align	32                      ; @__mprec_tens
___mprec_tens:
	.quad	4607182418800017408     ; double 1.000000e+00
	.quad	4621819117588971520     ; double 1.000000e+01
	.quad	4636737291354636288     ; double 1.000000e+02
	.quad	4652007308841189376     ; double 1.000000e+03
	.quad	4666723172467343360     ; double 1.000000e+04
	.quad	4681608360884174848     ; double 1.000000e+05
	.quad	4696837146684686336     ; double 1.000000e+06
	.quad	4711630319722168320     ; double 1.000000e+07
	.quad	4726483295884279808     ; double 1.000000e+08
	.quad	4741671816366391296     ; double 1.000000e+09
	.quad	4756540486875873280     ; double 1.000000e+10
	.quad	4771362005757984768     ; double 1.000000e+11
	.quad	4786511204640096256     ; double 1.000000e+12
	.quad	4801453603149578240     ; double 1.000000e+13
	.quad	4816244402031689728     ; double 1.000000e+14
	.quad	4831355200913801216     ; double 1.000000e+15
	.quad	4846369599423283200     ; double 1.000000e+16
	.quad	4861130398305394688     ; double 1.000000e+17
	.quad	4876203697187506176     ; double 1.000000e+18
	.quad	4891288408196988160     ; double 1.000000e+19
	.quad	4906019910204099648     ; double 1.000000e+20
	.quad	4921056587992461136     ; double 1.000000e+21
	.quad	4936209963552724370     ; double 1.000000e+22
	.quad	4950912855330343670     ; double 1.000000e+23
	.quad	4965913770331839924     ; double 1.000000e+24

	.align	4                       ; @p05.2269
_p05.2269:
	.long	5                       ; 0x5
	.long	25                      ; 0x19
	.long	125                     ; 0x7d

	.align	32                      ; @__mprec_bigtens
___mprec_bigtens:
	.quad	4846369599423283200     ; double 1.000000e+16
	.quad	5085611494797045271     ; double 1.000000e+32
	.quad	5564284217833028085     ; double 1.000000e+64
	.quad	6521906365687930162     ; double 1.000000e+128
	.quad	8436737289693151036     ; double 1.000000e+256

	.local	_heap_end.1081          ; @heap_end.1081
                                        ; @heap_end.1081
	.comm	_heap_end.1081,4,4
