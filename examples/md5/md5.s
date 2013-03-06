	.file	"md5.opt.bc"
                                        ; Start of file scope inline assembly
.stabs "_fstat is not implemented and will always fail",30,0,0,0
.stabs "_fstat",1,0,0,0

.stabs "_getpid is not implemented and will always fail",30,0,0,0
.stabs "_getpid",1,0,0,0

.stabs "_kill is not implemented and will always fail",30,0,0,0
.stabs "_kill",1,0,0,0

.stabs "_lseek is not implemented and will always fail",30,0,0,0
.stabs "_lseek",1,0,0,0

                                        ; End of file scope inline assembly
	.text
	.type	_md5_process,@function
_md5_process:                           ; @md5_process
	.funsz	_md5_process_end-_md5_process
_md5_process_start:
; BB#0:
#3:	       ldx	$rb, 0 -> r3.30
#0:	       ldx	$ro, 0 -> r0.30
#1:	       wb.s	r15, 72
#2:	       addi	-288 -> r15
	;;
#3:	       or	r1, 0 -> r3.17
#0:	       ldiu	256 -> r2
#1:	       ldiu	128 -> r3
	;;
#0:	       add	r15, r2 -> r2
	;;
#0:	       stm.s	r10, r2, 3
	;;
#0:	       stm.s	r11, r2, 2
	;;
#0:	       stm.s	r12, r2, 1
	;;
#0:	       stm.s	r13, r2, 0
#1:	       add	r15, r3 -> r2
	;;
#0:	       stm.s	r14, r2, 31
	;;
#0:	       stm.s	r0.23, r2, 30
	;;
#1:	       stm.s	r1.23, r2, 29
#0:	       or	r0, 0 -> r0.23
#3:	       and	r3.17, 3 -> r0
	;;
#2:	       stm.s	r2.23, r2, 28
	;;
#1:	       stm.s	r1.24, r2, 27
	;;
#2:	       stm.s	r2.24, r2, 26
	;;
#1:	       stm.s	r1.25, r2, 25
	;;
#2:	       stm.s	r2.25, r2, 24
	;;
#1:	       stm.s	r1.26, r2, 23
	;;
#2:	       stm.s	r2.26, r2, 22
	;;
#1:	       stm.s	r1.27, r2, 21
	;;
#2:	       stm.s	r2.27, r2, 20
	;;
#1:	       stm.s	r1.28, r2, 19
	;;
#2:	       stm.s	r2.28, r2, 18
	;;
#1:	       stm.s	r1.29, r2, 17
	;;
#2:	       stm.s	r2.29, r2, 16
	;;
#3:	       stm.s	r3.30, r2, 15
	;;
#0:	       stm.s	r0.30, r2, 14
	;;
#0:	       ldm.f	r0.23, 20
	;;
#1:	       or	r31, 0 -> r12
#0:	       ldm.f	r0.23, 16
	;;
#1:	       brz eq	r0, .BB0_2
#2:	       or	r31, 0 -> r10
#0:	       ldm.f	r0.23, 12
	;;
#1:	       or	r31, 0 -> r11
#0:	       ldm.f	r0.23, 8
	;;
#0:	       or	r31, 0 -> r14
	;;
.BB0_1:
#3:	       or	r3.17, 0 -> r1
#0:	       callg	_memcpy
#1:	       s2add	r15, 24 -> r3
#2:	       ldi	64 -> r2
	;;
#0:	       add	r3, 24 -> r13
	;;
#0:	       or	r13, 0 -> r0
	;;
	       nop	0
	;;
#3:	       or	r13, 0 -> r3.17
	;;
.BB0_2:
#3:	       ldm.f	r3.17, 0
#2:	       ldiu	1774 -> r2.20
#1:	       ldiu	33 -> r1.21
#0:	       ldiu	lo11{ ___mem_emergency } -> r0.30
	;;
#3:	       ldiu	1878 -> r3.16
#2:	       ldim	953 -> r2.20
#1:	       ldim	641 -> r1.21
#0:	       ldga	1025016 -> r0.16
	;;
#3:	       ldim	246 -> r3.16
#2:	       ldih	1549 -> r2.20
#1:	       ldih	589 -> r1.21
#0:	       ldih	2023 -> r0.16
	;;
#3:	       ldih	1862 -> r3.16
#2:	       ldiu	1967 -> r2.22
#1:	       ldiu	1378 -> r1.19
#0:	       ldga	845536 -> r0.17
	;;
#2:	       ldim	897 -> r2.22
#1:	       ldim	964 -> r1.19
#3:	       ldiu	lo11{ ___mem_emergency } -> r3.30
#0:	       ldih	2033 -> r0.17
	;;
#2:	       ldih	1963 -> r2.22
#1:	       ldih	1968 -> r1.19
#3:	       ldiu	1943 -> r3.19
#0:	       xor	r11, -1 -> r0
	;;
#2:	       ldiu	1578 -> r2.21
#1:	       ldiu	lo11{ ___mem_emergency } -> r1.30
#3:	       ldim	351 -> r3.19
#0:	       stm.s	r31, r15, 16
	;;
#2:	       ldim	248 -> r2.21
#1:	       ldiu	93 -> r1.22
#3:	       ldih	537 -> r3.19
#0:	       ldm.s	r15, 64
	;;
#2:	       ldih	572 -> r2.21
#1:	       ldim	482 -> r1.22
#0:	       and	r10, r11 -> r1
#3:	       and	r12, r0 -> r0
	;;
#2:	       ldiu	1555 -> r2.19
#1:	       ldih	1713 -> r1.22
#0:	       or	r0, r1 -> r0
#3:	       or	r31, 0 -> r2
	;;
#2:	       ldim	520 -> r2.19
#1:	       ldiu	1107 -> r1.23
#0:	       add	r14, r0 -> r1
#3:	       ldga	697464 -> r3
	;;
#2:	       ldih	1345 -> r2.19
#1:	       ldim	130 -> r1.23
#0:	       add	r1, r2 -> r0
#3:	       ldiu	290 -> r2
	;;
#2:	       ldiu	1281 -> r2.17
#1:	       ldih	18 -> r1.23
#0:	       stm.s	r2, r15, 27
#3:	       ldih	1723 -> r3
	;;
#3:	       ldm.f	r3.17, 8
#2:	       ldim	210 -> r2.17
#1:	       ldiu	1665 -> r1.17
#0:	       add	r0, r3 -> r1
	;;
#2:	       ldih	2026 -> r2.17
#1:	       ldim	60 -> r1.17
#0:	       ldiu	1665 -> r0
#3:	       ldiu	729 -> r2
	;;
#2:	       ldga	45888 -> r2.16
#1:	       ldih	1733 -> r1.17
#0:	       stm.s	r31, r15, 15
#3:	       rl	r1, 7 -> r1
	;;
#3:	       ldm.f	r3.17, 4
#2:	       add	r1, r11 -> r2.18
#1:	       ldiu	1510 -> r1.24
#0:	       ldiu	219 -> r13
	;;
#2:	       ldih	1538 -> r2.16
#1:	       ldim	57 -> r1.24
#0:	       ldim	14 -> r13
#3:	       ldiu	1967 -> r3
	;;
#2:	       ldiu	lo11{ ___mem_emergency } -> r2.30
#1:	       ldih	271 -> r1.24
#0:	       stm.s	r31, r15, 14
#3:	       ldih	289 -> r13
	;;
#1:	       ldiu	2006 -> r1.27
#2:	       ldiu	935 -> r2.25
#0:	       stm.s	r0, r15, 28
#3:	       ldiu	1734 -> r0
	;;
#1:	       ldim	736 -> r1.27
#2:	       ldim	644 -> r2.25
#0:	       stm.s	r2, r15, 17
#3:	       ldiu	1162 -> r2
	;;
#1:	       ldih	1561 -> r1.27
#2:	       ldih	1372 -> r2.25
#0:	       stm.s	r2, r15, 29
#3:	       ldiu	2042 -> r2
	;;
#1:	       ldiu	1415 -> r1.26
#2:	       ldiu	57 -> r2.28
#0:	       stm.s	r2, r15, 24
#3:	       ldiu	133 -> r2
	;;
#1:	       ldim	673 -> r1.26
#2:	       ldim	628 -> r2.28
#0:	       stm.s	r2, r15, 23
#3:	       ldiu	1285 -> r2
	;;
#1:	       ldih	1958 -> r1.26
#2:	       ldih	2020 -> r2.28
#0:	       stm.s	r2, r15, 22
#3:	       ldiu	485 -> r2
	;;
#1:	       ldiu	1261 -> r1.28
#2:	       ldiu	451 -> r2.26
#0:	       stm.s	r2, r15, 21
#3:	       ldiu	1961 -> r2
	;;
#1:	       ldim	834 -> r1.28
#2:	       ldim	875 -> r2.26
#0:	       stm.s	r2, r15, 26
#3:	       ldim	158 -> r3
	;;
#1:	       ldih	554 -> r1.28
#2:	       ldih	810 -> r2.26
#0:	       stm.s	r0, r15, 25
#3:	       ldiu	1637 -> r0
	;;
#1:	       ldiu	261 -> r1.29
#2:	       ldiu	1170 -> r2.27
#0:	       stm.s	r0, r15, 20
#3:	       ldiu	565 -> r0
	;;
#1:	       ldim	125 -> r1.29
#2:	       ldim	409 -> r2.27
#0:	       stm.s	r0, r15, 18
#3:	       ldiu	1615 -> r0
	;;
#1:	       ldih	1359 -> r1.29
#2:	       ldih	1144 -> r2.27
#0:	       stm.s	r0, r15, 19
#3:	       ldih	1114 -> r3
	;;
#3:	       ldm.f	r3.17, 12
#1:	       ldiu	322 -> r1.18
#2:	       ldiu	1489 -> r2.29
#0:	       ldiu	945 -> r2
	;;
#1:	       ldim	1863 -> r1.18
#2:	       ldim	139 -> r2.29
#0:	       ldim	2027 -> r2
#3:	       ldiu	1982 -> r7
	;;
#1:	       ldga	342028 -> r1.16
#2:	       ldih	1068 -> r2.29
#0:	       stm.s	r31, r15, 13
#3:	       ldim	922 -> r7
	;;
#1:	       ldih	2031 -> r1.16
#2:	       ldiu	417 -> r2.24
#0:	       ldm.s	r15, 60
#3:	       ldih	1098 -> r7
	;;
#1:	       ldiu	57 -> r1.25
#2:	       ldim	258 -> r2.24
#0:	       ldiu	290 -> r6
#3:	       ldiu	403 -> r5
	;;
#1:	       ldim	666 -> r1.25
#2:	       ldih	624 -> r2.24
#0:	       or	r31, 0 -> r0
#3:	       ldim	514 -> r6
	;;
#3:	       ldm.f	r3.17, 16
#1:	       ldih	1742 -> r1.25
#2:	       ldiu	1666 -> r2.23
#0:	       add	r10, r0 -> r14
	;;
#2:	       ldim	623 -> r2.23
#0:	       ldih	860 -> r6
#1:	       ldim	782 -> r5
#3:	       ldiu	910 -> r4
	;;
#2:	       ldih	1978 -> r2.23
#0:	       stm.s	r31, r15, 12
#1:	       ldih	2028 -> r5
#3:	       ldim	808 -> r4
	;;
#0:	       ldm.s	r15, 56
#1:	       ldih	1331 -> r4
#2:	       ldiu	593 -> r9
#3:	       ldiu	1962 -> r8
	;;
#0:	       ldim	971 -> r9
#1:	       ldim	728 -> r8
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldih	306 -> r9
#2:	       ldih	1869 -> r8
	;;
#3:	       ldm.f	r3.17, 20
	;;
#3:	       add	r12, r0 -> r3.18
	;;
#0:	       stm.s	r31, r15, 11
	;;
#3:	       ldm.f	r3.17, 24
	;;
#0:	       stm.s	r31, r15, 10
	;;
#3:	       ldm.f	r3.17, 28
	;;
#0:	       stm.s	r31, r15, 9
	;;
#0:	       ldm.s	r15, 116
	;;
#0:	       or	r31, 0 -> r1
	;;
#0:	       ldim	329 -> r1
	;;
#0:	       stm.s	r1, r15, 29
	;;
#0:	       ldm.s	r15, 68
	;;
#0:	       or	r31, 0 -> r1
	;;
#0:	       ldim	480 -> r1
	;;
#0:	       stm.s	r1, r15, 17
#1:	       ldga	39128 -> r1
	;;
#3:	       ldm.f	r3.17, 32
#0:	       ldih	844 -> r1
	;;
#0:	       stm.s	r31, r15, 8
	;;
#0:	       ldm.s	r15, 108
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       ldim	940 -> r0
	;;
#0:	       stm.s	r0, r15, 27
	;;
#0:	       ldm.s	r15, 112
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       ldim	574 -> r0
	;;
#0:	       stm.s	r0, r15, 28
	;;
#3:	       ldm.f	r3.17, 36
	;;
#0:	       stm.s	r31, r15, 7
	;;
#3:	       ldm.f	r3.17, 40
	;;
#0:	       stm.s	r31, r15, 6
	;;
#0:	       ldm.s	r15, 104
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       ldim	985 -> r0
	;;
#0:	       stm.s	r0, r15, 26
	;;
#3:	       ldm.f	r3.17, 44
	;;
#0:	       stm.s	r31, r15, 5
	;;
#3:	       ldm.f	r3.17, 48
	;;
#0:	       stm.s	r31, r15, 4
	;;
#0:	       ldm.s	r15, 84
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       ldim	883 -> r0
	;;
#0:	       stm.s	r0, r15, 21
	;;
#0:	       ldm.s	r15, 88
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       ldim	259 -> r0
	;;
#0:	       stm.s	r0, r15, 22
	;;
#0:	       ldm.s	r15, 92
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       ldim	486 -> r0
	;;
#0:	       stm.s	r0, r15, 23
	;;
#0:	       ldm.s	r15, 96
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       ldim	36 -> r0
	;;
#0:	       stm.s	r0, r15, 24
	;;
#0:	       ldm.s	r15, 100
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       ldim	879 -> r0
	;;
#0:	       stm.s	r0, r15, 25
	;;
#3:	       ldm.f	r3.17, 56
	;;
#0:	       stm.s	r31, r15, 3
	;;
#3:	       ldm.f	r3.17, 52
	;;
#0:	       stm.s	r31, r15, 2
	;;
#0:	       ldm.s	r15, 80
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       ldim	394 -> r0
	;;
#0:	       stm.s	r0, r15, 20
	;;
#3:	       ldm.f	r3.17, 60
	;;
#0:	       stm.s	r31, r15, 1
	;;
#0:	       ldm.s	r15, 76
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       ldim	271 -> r0
	;;
#0:	       stm.s	r0, r15, 19
	;;
#0:	       ldm.s	r15, 72
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       ldim	862 -> r0
	;;
#0:	       stm.s	r0, r15, 18
#2:	       xor	r2.18, -1 -> r0
	;;
#0:	       and	r10, r0 -> r12
#2:	       and	r2.18, r11 -> r0
#1:	       ldm.s	r15, 52
	;;
#0:	       or	r0, r12 -> r0
	;;
#3:	       add	r3.18, r0 -> r3.17
#0:	       or	r31, 0 -> r0
#1:	       ldm.s	r15, 48
	;;
#0:	       add	r11, r0 -> r10
	;;
#3:	       add	r3.17, r3.16 -> r0
	;;
#3:	       ldga	1309640 -> r3.16
#0:	       rl	r0, 12 -> r0
	;;
#2:	       add	r0, r2.18 -> r12
#3:	       ldih	1854 -> r3.16
	;;
#3:	       ldga	82708 -> r3.17
#0:	       xor	r12, -1 -> r0
	;;
#3:	       ldih	1304 -> r3.17
#0:	       and	r11, r0 -> r11
	;;
#2:	       and	r12, r2.18 -> r0
	;;
#0:	       or	r0, r11 -> r0
	;;
#0:	       add	r14, r0 -> r0
#1:	       ldiu	913 -> r14
	;;
#0:	       add	r0, r13 -> r0
#1:	       ldim	218 -> r14
	;;
#0:	       rl	r0, 17 -> r0
#1:	       ldih	1884 -> r14
	;;
#0:	       add	r0, r12 -> r11
	;;
#0:	       xor	r11, -1 -> r0
	;;
#2:	       and	r2.18, r0 -> r13
#0:	       and	r11, r12 -> r0
	;;
#0:	       or	r0, r13 -> r0
#1:	       ldiu	699 -> r13
	;;
#0:	       add	r10, r0 -> r0
#1:	       ldim	762 -> r13
	;;
#2:	       add	r0, r2.20 -> r0
#0:	       ldih	342 -> r13
	;;
#0:	       rl	r0, 22 -> r0
	;;
#0:	       add	r0, r11 -> r10
	;;
#0:	       xor	r10, -1 -> r0
	;;
#2:	       and	r12, r0 -> r2.20
#0:	       and	r10, r11 -> r0
	;;
#2:	       or	r0, r2.20 -> r2.20
#0:	       or	r31, 0 -> r0
#1:	       ldm.s	r15, 44
	;;
#2:	       add	r0, r2.18 -> r0
	;;
#2:	       add	r0, r2.20 -> r0
	;;
#2:	       add	r0, r2.22 -> r0
	;;
#0:	       rl	r0, 7 -> r0
	;;
#2:	       add	r0, r10 -> r2.22
	;;
#2:	       xor	r2.22, -1 -> r0
	;;
#2:	       and	r11, r0 -> r2.18
	;;
#2:	       and	r2.22, r10 -> r0
	;;
#2:	       or	r0, r2.18 -> r2.18
#0:	       or	r31, 0 -> r0
#1:	       ldm.s	r15, 40
	;;
#0:	       add	r0, r12 -> r0
	;;
#2:	       add	r0, r2.18 -> r0
	;;
#2:	       add	r0, r2.21 -> r0
	;;
#0:	       rl	r0, 12 -> r0
	;;
#2:	       add	r0, r2.22 -> r2.20
	;;
#2:	       xor	r2.20, -1 -> r0
	;;
#2:	       and	r10, r0 -> r2.18
	;;
#2:	       and	r2.20, r2.22 -> r0
	;;
#2:	       or	r0, r2.18 -> r2.18
#0:	       or	r31, 0 -> r0
#1:	       ldm.s	r15, 68
	;;
#0:	       add	r0, r11 -> r0
	;;
#2:	       add	r0, r2.18 -> r0
	;;
#2:	       add	r0, r2.19 -> r0
	;;
#0:	       rl	r0, 17 -> r0
	;;
#2:	       add	r0, r2.20 -> r2.18
	;;
#2:	       xor	r2.18, -1 -> r0
	;;
#2:	       and	r2.22, r0 -> r2.19
	;;
#2:	       and	r2.18, r2.20 -> r0
	;;
#2:	       or	r0, r2.19 -> r2.19
#0:	       or	r31, 0 -> r0
	;;
#0:	       ldih	827 -> r0
	;;
#0:	       stm.s	r0, r15, 17
	;;
#0:	       ldm.s	r15, 116
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       ldih	1129 -> r0
	;;
#0:	       stm.s	r0, r15, 29
	;;
#0:	       ldm.s	r15, 36
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldm.s	r15, 112
	;;
#0:	       add	r0, r10 -> r0
	;;
#2:	       add	r0, r2.19 -> r0
	;;
#2:	       add	r0, r2.17 -> r0
	;;
#0:	       rl	r0, 22 -> r0
	;;
#2:	       add	r0, r2.18 -> r2.17
	;;
#2:	       xor	r2.17, -1 -> r0
	;;
#2:	       and	r2.20, r0 -> r2.19
	;;
#2:	       and	r2.17, r2.18 -> r0
	;;
#2:	       or	r0, r2.19 -> r2.19
#0:	       or	r31, 0 -> r0
	;;
#0:	       ldih	1083 -> r0
	;;
#0:	       stm.s	r0, r15, 28
	;;
#0:	       ldm.s	r15, 108
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       ldih	876 -> r0
	;;
#0:	       stm.s	r0, r15, 27
	;;
#0:	       ldm.s	r15, 32
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldm.s	r15, 28
	;;
#2:	       add	r0, r2.22 -> r0
	;;
#2:	       add	r0, r2.19 -> r0
	;;
#0:	       add	r0, r1 -> r0
	;;
#0:	       rl	r0, 7 -> r0
	;;
#2:	       add	r0, r2.17 -> r2.19
	;;
#2:	       xor	r2.19, -1 -> r0
	;;
#2:	       and	r2.18, r0 -> r1
	;;
#2:	       and	r2.19, r2.17 -> r0
	;;
#0:	       or	r0, r1 -> r1
#1:	       or	r31, 0 -> r0
#2:	       ldm.s	r15, 104
	;;
#2:	       add	r0, r2.20 -> r0
	;;
#0:	       add	r0, r1 -> r0
	;;
#0:	       add	r0, r3 -> r0
#1:	       ldga	2026052 -> r3
	;;
#0:	       rl	r0, 12 -> r0
#1:	       ldih	1317 -> r3
	;;
#2:	       add	r0, r2.19 -> r2.20
	;;
#2:	       xor	r2.20, -1 -> r0
	;;
#2:	       and	r2.17, r0 -> r1
	;;
#2:	       and	r2.20, r2.19 -> r0
	;;
#0:	       or	r0, r1 -> r1
#1:	       or	r31, 0 -> r0
	;;
#0:	       ldih	606 -> r0
	;;
#0:	       stm.s	r0, r15, 26
	;;
#0:	       ldm.s	r15, 24
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldm.s	r15, 20
	;;
#2:	       add	r0, r2.18 -> r0
	;;
#0:	       add	r0, r1 -> r0
	;;
#0:	       add	r0, r2 -> r0
#1:	       ldga	1788768 -> r2
	;;
#0:	       rl	r0, 17 -> r0
#1:	       ldih	1973 -> r2
	;;
#2:	       add	r0, r2.20 -> r2.21
	;;
#2:	       xor	r2.21, -1 -> r0
	;;
#2:	       and	r2.19, r0 -> r1
	;;
#2:	       and	r2.21, r2.20 -> r0
	;;
#0:	       or	r0, r1 -> r1
#1:	       or	r31, 0 -> r0
#2:	       ldm.s	r15, 100
	;;
#2:	       add	r0, r2.17 -> r0
	;;
#0:	       add	r0, r1 -> r0
	;;
#0:	       add	r0, r7 -> r0
	;;
#0:	       rl	r0, 22 -> r0
	;;
#2:	       add	r0, r2.21 -> r2.17
	;;
#2:	       xor	r2.17, -1 -> r0
	;;
#2:	       and	r2.20, r0 -> r1
	;;
#2:	       and	r2.17, r2.21 -> r0
	;;
#0:	       or	r0, r1 -> r7
#1:	       or	r31, 0 -> r0
#2:	       ldga	2079856 -> r1
	;;
#0:	       ldih	324 -> r0
#1:	       ldih	1525 -> r1
	;;
#0:	       stm.s	r0, r15, 25
	;;
#0:	       ldm.s	r15, 96
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       ldih	1877 -> r0
	;;
#0:	       stm.s	r0, r15, 24
	;;
#0:	       ldm.s	r15, 92
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       ldih	1703 -> r0
	;;
#0:	       stm.s	r0, r15, 23
	;;
#0:	       ldm.s	r15, 88
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       ldih	36 -> r0
	;;
#0:	       stm.s	r0, r15, 22
	;;
#0:	       ldm.s	r15, 84
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       ldih	1846 -> r0
	;;
#0:	       stm.s	r0, r15, 21
	;;
#0:	       ldm.s	r15, 16
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldm.s	r15, 8
	;;
#2:	       add	r0, r2.19 -> r2.18
	;;
#2:	       add	r2.18, r7 -> r7
#0:	       or	r31, 0 -> r0
#1:	       ldm.s	r15, 12
	;;
#2:	       add	r0, r2.20 -> r2.19
#0:	       add	r7, r6 -> r6
	;;
#0:	       rl	r6, 7 -> r6
#1:	       or	r31, 0 -> r0
#2:	       ldm.s	r15, 4
	;;
#2:	       add	r6, r2.17 -> r2.18
	;;
#2:	       xor	r2.18, -1 -> r6
	;;
#2:	       and	r2.21, r6 -> r7
	;;
#2:	       and	r2.18, r2.17 -> r6
	;;
#2:	       add	r0, r2.21 -> r0
#0:	       or	r6, r7 -> r6
	;;
#2:	       add	r2.19, r6 -> r6
	;;
#0:	       add	r6, r5 -> r5
	;;
#0:	       rl	r5, 12 -> r5
	;;
#2:	       add	r5, r2.18 -> r5
	;;
#2:	       and	r5, r2.18 -> r2.19
#0:	       xor	r5, -1 -> r7
	;;
#2:	       and	r2.17, r7 -> r6
	;;
#2:	       or	r2.19, r6 -> r6
	;;
#0:	       add	r0, r6 -> r0
	;;
#0:	       add	r0, r4 -> r0
	;;
#0:	       rl	r0, 17 -> r0
	;;
#1:	       add	r0, r5 -> r1.20
	;;
#1:	       xor	r1.20, -1 -> r6
	;;
#1:	       and	r1.20, r5 -> r4
#2:	       and	r2.18, r6 -> r0
	;;
#1:	       and	r1.20, r7 -> r7
#0:	       or	r4, r0 -> r11
#2:	       or	r31, 0 -> r4
#3:	       ldm.s	r15, 80
	;;
#2:	       add	r4, r2.17 -> r4
#0:	       ldga	163064 -> r0
	;;
#2:	       ldga	598596 -> r2.17
#0:	       or	r31, 0 -> r12
#1:	       add	r4, r11 -> r10
#3:	       ldih	253 -> r0
	;;
#1:	       add	r10, r1.21 -> r4
#2:	       ldih	1953 -> r2.17
#0:	       ldih	1573 -> r12
	;;
#0:	       stm.s	r12, r15, 20
#1:	       rl	r4, 22 -> r4
	;;
#1:	       add	r4, r1.20 -> r1.21
#0:	       ldm.s	r15, 76
	;;
#1:	       and	r1.21, r5 -> r4
	;;
#1:	       and	r1.21, r6 -> r6
#0:	       or	r31, 0 -> r12
#2:	       or	r4, r7 -> r11
#3:	       ldiu	1149 -> r7
	;;
#0:	       ldih	893 -> r12
#1:	       ldim	1534 -> r7
	;;
#0:	       stm.s	r12, r15, 19
	;;
#0:	       ldm.s	r15, 56
	;;
#0:	       or	r31, 0 -> r4
#1:	       ldm.s	r15, 72
	;;
#2:	       add	r4, r2.18 -> r4
	;;
#0:	       or	r31, 0 -> r10
#1:	       add	r4, r11 -> r4
	;;
#1:	       add	r4, r1.19 -> r4
#0:	       ldih	1513 -> r10
	;;
#0:	       stm.s	r10, r15, 18
#1:	       rl	r4, 5 -> r4
	;;
#1:	       add	r4, r1.21 -> r1.19
#0:	       ldm.s	r15, 40
	;;
#1:	       and	r1.19, r1.20 -> r4
	;;
#1:	       or	r31, 0 -> r11
#0:	       ldm.f	r0.23, 8
#2:	       or	r4, r6 -> r6
	;;
#0:	       add	r11, r5 -> r4
	;;
#2:	       stm.a	r31, r2.30, 0
#0:	       add	r4, r6 -> r4
#1:	       xor	r1.21, -1 -> r6
	;;
#2:	       add	r4, r2.16 -> r4
#1:	       and	r1.19, r6 -> r6
#0:	       ldm.s	r15, 20
	;;
#2:	       ldiu	lo11{ ___mem_emergency } -> r2.30
#0:	       rl	r4, 9 -> r4
	;;
#1:	       add	r4, r1.19 -> r5
	;;
#1:	       and	r5, r1.21 -> r4
	;;
#0:	       or	r4, r6 -> r12
#1:	       or	r31, 0 -> r4
#2:	       ldmg.d	___mem_emergency
	;;
#1:	       add	r4, r1.20 -> r4
	;;
#3:	       stm.a	r31, r3.30, 0
#0:	       add	r4, r12 -> r4
	;;
#3:	       ldiu	lo11{ ___mem_emergency } -> r3.30
#0:	       ldm.s	r15, 64
#1:	       add	r4, r9 -> r4
	;;
#0:	       rl	r4, 14 -> r4
	;;
#0:	       or	r31, 0 -> r6
#1:	       ldmg.d	___mem_emergency
#2:	       add	r4, r5 -> r9
	;;
#1:	       add	r6, r1.21 -> r6
	;;
#1:	       stm.a	r31, r1.30, 0
	;;
#1:	       xor	r1.19, -1 -> r1.21
#0:	       ldm.s	r15, 44
	;;
#1:	       ldiu	lo11{ ___mem_emergency } -> r1.30
	;;
#0:	       or	r31, 0 -> r4
#1:	       ldmg.d	___mem_emergency
	;;
#1:	       add	r4, r1.19 -> r1.20
	;;
#3:	       stm.a	r31, r3.30, 0
#1:	       and	r9, r1.19 -> r4
	;;
#1:	       and	r5, r1.21 -> r1.19
#3:	       ldiu	lo11{ ___mem_emergency } -> r3.30
#0:	       ldm.s	r15, 24
	;;
#1:	       or	r4, r1.19 -> r4
	;;
#1:	       xor	r5, -1 -> r1.19
#0:	       add	r6, r4 -> r6
#2:	       or	r31, 0 -> r4
#3:	       ldmg.d	___mem_emergency
	;;
#1:	       and	r9, r1.19 -> r1.21
#0:	       add	r6, r8 -> r10
#2:	       xor	r9, -1 -> r8
	;;
#1:	       add	r4, r5 -> r1.19
#2:	       stm.a	r31, r2.30, 0
#0:	       rl	r10, 20 -> r4
	;;
#2:	       ldiu	lo11{ ___mem_emergency } -> r2.30
#0:	       add	r4, r9 -> r6
#1:	       ldm.s	r15, 4
	;;
#0:	       and	r6, r5 -> r4
#1:	       and	r6, r8 -> r8
	;;
#1:	       or	r4, r1.21 -> r4
	;;
#1:	       add	r1.20, r4 -> r5
#0:	       or	r31, 0 -> r4
#2:	       ldmg.d	___mem_emergency
	;;
#1:	       add	r4, r9 -> r1.21
	;;
#1:	       add	r5, r1.22 -> r4
#2:	       stm.a	r31, r2.30, 0
	;;
#1:	       xor	r6, -1 -> r1.20
#2:	       ldiu	lo11{ ___mem_emergency } -> r2.30
#0:	       rl	r4, 5 -> r4
#3:	       ldm.s	r15, 48
	;;
#0:	       add	r4, r6 -> r5
	;;
#1:	       xor	r5, -1 -> r1.22
#0:	       and	r5, r9 -> r4
#2:	       or	r31, 0 -> r11
#3:	       ldmg.d	___mem_emergency
	;;
#0:	       or	r4, r8 -> r9
#1:	       add	r11, r6 -> r12
	;;
#1:	       add	r1.19, r9 -> r4
#0:	       stm.a	r31, r0.30, 0
	;;
#1:	       add	r4, r1.23 -> r4
#0:	       ldiu	lo11{ ___mem_emergency } -> r0.30
#2:	       ldm.s	r15, 28
	;;
#0:	       rl	r4, 9 -> r4
	;;
#1:	       add	r4, r5 -> r1.19
	;;
#1:	       and	r1.19, r6 -> r4
	;;
#1:	       and	r5, r1.20 -> r6
	;;
#1:	       and	r1.19, r1.22 -> r1.22
#0:	       or	r4, r6 -> r4
#2:	       or	r31, 0 -> r6
#3:	       ldmg.d	___mem_emergency
	;;
#1:	       add	r1.21, r4 -> r4
#0:	       add	r6, r5 -> r6
	;;
#1:	       add	r4, r1.17 -> r4
#0:	       stm.a	r31, r0.30, 0
	;;
#1:	       xor	r1.19, -1 -> r1.17
#0:	       ldiu	lo11{ ___mem_emergency } -> r0.30
#2:	       rl	r4, 14 -> r4
#3:	       ldm.s	r15, 12
	;;
#1:	       add	r4, r1.19 -> r9
	;;
#1:	       and	r9, r5 -> r1.21
#0:	       or	r31, 0 -> r4
#2:	       ldmg.d	___mem_emergency
#3:	       xor	r9, -1 -> r5
	;;
#1:	       add	r4, r1.19 -> r1.20
	;;
#1:	       or	r1.21, r1.22 -> r4
#3:	       stm.a	r31, r3.30, 0
	;;
#1:	       and	r9, r1.17 -> r1.17
#3:	       ldiu	lo11{ ___mem_emergency } -> r3.30
#0:	       add	r12, r4 -> r4
#2:	       ldm.s	r15, 52
	;;
#3:	       add	r4, r3.16 -> r4
	;;
#0:	       rl	r4, 20 -> r4
	;;
#0:	       add	r4, r9 -> r8
	;;
#1:	       and	r8, r1.19 -> r4
	;;
#1:	       or	r4, r1.17 -> r4
	;;
#1:	       and	r8, r5 -> r1.21
#0:	       add	r6, r4 -> r4
#2:	       xor	r8, -1 -> r6
	;;
#1:	       add	r4, r1.24 -> r4
	;;
#0:	       rl	r4, 5 -> r4
	;;
#1:	       add	r4, r8 -> r1.17
#0:	       or	r31, 0 -> r4
#2:	       ldmg.d	___mem_emergency
	;;
#1:	       and	r1.17, r9 -> r1.19
	;;
#1:	       add	r4, r9 -> r1.22
	;;
#1:	       or	r1.19, r1.21 -> r4
	;;
#1:	       add	r1.20, r4 -> r4
	;;
#1:	       stm.a	r31, r1.30, 0
	;;
#1:	       add	r4, r1.27 -> r4
#0:	       ldm.s	r15, 32
	;;
#1:	       and	r1.17, r6 -> r6
#0:	       rl	r4, 9 -> r4
	;;
#1:	       add	r4, r1.17 -> r1.19
#0:	       or	r31, 0 -> r9
#2:	       ldmg.d	___mem_emergency
	;;
#1:	       and	r1.19, r8 -> r4
#0:	       add	r9, r8 -> r10
	;;
#3:	       stm.a	r31, r3.30, 0
#1:	       xor	r1.17, -1 -> r5
#0:	       or	r4, r6 -> r4
	;;
#1:	       add	r1.22, r4 -> r4
#3:	       ldiu	lo11{ ___mem_emergency } -> r3.30
#0:	       ldm.s	r15, 8
	;;
#1:	       add	r4, r1.26 -> r4
	;;
#1:	       and	r1.19, r5 -> r1.21
#0:	       rl	r4, 14 -> r4
	;;
#1:	       add	r4, r1.19 -> r8
#0:	       or	r31, 0 -> r4
#2:	       ldmg.d	___mem_emergency
	;;
#1:	       and	r8, r1.17 -> r1.20
#0:	       xor	r8, -1 -> r5
	;;
#2:	       stm.a	r31, r2.30, 0
#1:	       add	r4, r1.17 -> r1.22
	;;
#1:	       xor	r1.19, -1 -> r6
#2:	       ldiu	lo11{ ___mem_emergency } -> r2.30
#0:	       ldm.s	r15, 60
	;;
#1:	       ldiu	lo11{ ___mem_emergency } -> r1.30
#0:	       and	r8, r6 -> r6
	;;
#0:	       or	r31, 0 -> r4
#1:	       ldmg.d	___mem_emergency
	;;
#1:	       add	r4, r1.19 -> r1.17
	;;
#1:	       or	r1.20, r1.21 -> r4
#2:	       stm.a	r31, r2.30, 0
	;;
#2:	       ldiu	lo11{ ___mem_emergency } -> r2.30
#0:	       add	r10, r4 -> r4
#1:	       ldm.s	r15, 36
	;;
#1:	       add	r4, r1.28 -> r4
	;;
#0:	       rl	r4, 20 -> r4
	;;
#0:	       add	r4, r8 -> r9
	;;
#1:	       and	r9, r1.19 -> r4
	;;
#0:	       or	r4, r6 -> r4
	;;
#1:	       add	r1.22, r4 -> r4
	;;
#1:	       add	r4, r1.29 -> r4
	;;
#1:	       and	r9, r5 -> r1.22
#0:	       rl	r4, 5 -> r4
#2:	       xor	r9, -1 -> r5
	;;
#1:	       add	r4, r9 -> r1.19
#0:	       or	r31, 0 -> r4
#2:	       ldmg.d	___mem_emergency
	;;
#1:	       and	r1.19, r8 -> r1.21
	;;
#1:	       stm.a	r31, r1.30, 0
	;;
#1:	       add	r4, r8 -> r1.20
#0:	       ldm.s	r15, 16
	;;
#1:	       or	r1.21, r1.22 -> r4
	;;
#1:	       add	r1.17, r4 -> r4
#0:	       or	r31, 0 -> r11
#2:	       ldmg.d	___mem_emergency
	;;
#0:	       add	r4, r0.16 -> r4
#1:	       and	r1.19, r5 -> r8
#2:	       add	r11, r9 -> r12
	;;
#0:	       stm.a	r31, r0.30, 0
#1:	       xor	r1.19, -1 -> r6
#2:	       rl	r4, 9 -> r4
	;;
#1:	       add	r4, r1.19 -> r1.17
#0:	       ldiu	lo11{ ___mem_emergency } -> r0.30
#2:	       ldm.s	r15, 44
	;;
#1:	       and	r1.17, r9 -> r1.21
	;;
#1:	       and	r1.17, r6 -> r6
#0:	       or	r31, 0 -> r4
#2:	       ldmg.d	___mem_emergency
	;;
#1:	       add	r4, r1.19 -> r9
	;;
#2:	       stm.a	r31, r2.30, 0
#1:	       or	r1.21, r8 -> r4
	;;
#1:	       add	r1.20, r4 -> r8
#2:	       ldiu	lo11{ ___mem_emergency } -> r2.30
#0:	       ldm.s	r15, 68
	;;
#1:	       ldiu	lo11{ ___mem_emergency } -> r1.30
	;;
#0:	       or	r31, 0 -> r10
#1:	       ldmg.d	___mem_emergency
	;;
#0:	       add	r8, r10 -> r4
	;;
#0:	       stm.a	r31, r0.30, 0
#1:	       rl	r4, 14 -> r4
	;;
#1:	       add	r4, r1.17 -> r8
#0:	       ldiu	lo11{ ___mem_emergency } -> r0.30
#2:	       ldm.s	r15, 32
	;;
#1:	       and	r8, r1.19 -> r1.19
	;;
#1:	       xor	r8, r1.17 -> r1.20
#0:	       or	r31, 0 -> r4
#2:	       ldmg.d	___mem_emergency
	;;
#1:	       add	r4, r1.17 -> r1.17
	;;
#3:	       stm.a	r31, r3.30, 0
#1:	       or	r1.19, r6 -> r4
	;;
#3:	       ldiu	lo11{ ___mem_emergency } -> r3.30
#0:	       ldm.s	r15, 116
#1:	       add	r12, r4 -> r5
	;;
#0:	       or	r31, 0 -> r11
#1:	       ldmg.d	___mem_emergency
	;;
#0:	       add	r5, r11 -> r4
	;;
#1:	       stm.a	r31, r1.30, 0
#0:	       rl	r4, 20 -> r4
	;;
#1:	       ldiu	lo11{ ___mem_emergency } -> r1.30
#0:	       add	r4, r8 -> r5
#2:	       ldm.s	r15, 20
	;;
#1:	       xor	r1.20, r5 -> r1.19
#0:	       xor	r5, r8 -> r6
	;;
#1:	       add	r9, r1.19 -> r4
#0:	       or	r31, 0 -> r12
#2:	       ldmg.d	___mem_emergency
	;;
#1:	       add	r4, r1.18 -> r4
#0:	       add	r12, r8 -> r8
	;;
#3:	       stm.a	r31, r3.30, 0
#0:	       rl	r4, 4 -> r4
	;;
#3:	       ldiu	lo11{ ___mem_emergency } -> r3.30
#0:	       add	r4, r5 -> r9
#1:	       ldm.s	r15, 12
	;;
#1:	       xor	r9, r5 -> r1.18
#0:	       xor	r6, r9 -> r4
	;;
#1:	       add	r1.17, r4 -> r6
#0:	       or	r31, 0 -> r4
#2:	       ldmg.d	___mem_emergency
	;;
#1:	       add	r4, r5 -> r1.17
	;;
#0:	       stm.a	r31, r0.30, 0
	;;
#0:	       ldiu	lo11{ ___mem_emergency } -> r0.30
#1:	       ldm.s	r15, 112
	;;
#0:	       or	r31, 0 -> r5
#1:	       ldmg.d	___mem_emergency
	;;
#0:	       add	r6, r5 -> r4
	;;
#0:	       stm.a	r31, r0.30, 0
#1:	       rl	r4, 11 -> r4
	;;
#0:	       ldiu	lo11{ ___mem_emergency } -> r0.30
#1:	       add	r4, r9 -> r6
#2:	       ldm.s	r15, 56
	;;
#1:	       xor	r1.18, r6 -> r4
#0:	       xor	r6, r9 -> r5
	;;
#0:	       add	r8, r4 -> r8
#1:	       or	r31, 0 -> r4
#2:	       ldmg.d	___mem_emergency
	;;
#1:	       add	r4, r9 -> r1.18
	;;
#1:	       stm.a	r31, r1.30, 0
	;;
#1:	       ldiu	lo11{ ___mem_emergency } -> r1.30
#0:	       ldm.s	r15, 108
	;;
#0:	       or	r31, 0 -> r10
#1:	       ldmg.d	___mem_emergency
	;;
#0:	       add	r8, r10 -> r4
	;;
#1:	       stm.a	r31, r1.30, 0
#0:	       rl	r4, 16 -> r4
	;;
#1:	       ldiu	lo11{ ___mem_emergency } -> r1.30
#0:	       add	r4, r6 -> r8
#2:	       ldm.s	r15, 48
	;;
#0:	       xor	r5, r8 -> r4
#1:	       xor	r8, r6 -> r9
	;;
#1:	       add	r1.17, r4 -> r5
#0:	       or	r31, 0 -> r4
#2:	       ldmg.d	___mem_emergency
	;;
#1:	       add	r4, r6 -> r1.17
	;;
#1:	       add	r5, r1.16 -> r4
	;;
#1:	       stm.a	r31, r1.30, 0
#0:	       rl	r4, 23 -> r4
	;;
#1:	       ldiu	lo11{ ___mem_emergency } -> r1.30
#0:	       add	r4, r8 -> r6
#2:	       ldm.s	r15, 36
	;;
#1:	       xor	r6, r8 -> r1.16
#0:	       xor	r9, r6 -> r4
	;;
#1:	       add	r1.18, r4 -> r5
#0:	       or	r31, 0 -> r4
#2:	       ldmg.d	___mem_emergency
	;;
#0:	       add	r5, r3 -> r3
#1:	       add	r4, r8 -> r4
	;;
#2:	       stm.a	r31, r2.30, 0
#0:	       rl	r3, 4 -> r3
	;;
#2:	       ldiu	lo11{ ___mem_emergency } -> r2.30
#0:	       add	r3, r6 -> r8
#1:	       ldm.s	r15, 24
	;;
#1:	       xor	r1.16, r8 -> r3
	;;
#1:	       add	r1.17, r3 -> r5
#0:	       or	r31, 0 -> r3
#2:	       ldmg.d	___mem_emergency
	;;
#1:	       xor	r8, r6 -> r1.18
#0:	       add	r3, r6 -> r9
	;;
#2:	       stm.a	r31, r2.30, 0
	;;
#2:	       ldiu	lo11{ ___mem_emergency } -> r2.30
#0:	       ldm.s	r15, 104
	;;
#0:	       or	r31, 0 -> r3
#1:	       ldmg.d	___mem_emergency
	;;
#0:	       add	r5, r3 -> r3
	;;
#2:	       stm.a	r31, r2.30, 0
#0:	       rl	r3, 11 -> r3
	;;
#2:	       ldiu	lo11{ ___mem_emergency } -> r2.30
#0:	       add	r3, r8 -> r6
#1:	       ldm.s	r15, 8
	;;
#1:	       xor	r1.18, r6 -> r3
#0:	       xor	r6, r8 -> r5
	;;
#0:	       add	r4, r3 -> r4
#1:	       or	r31, 0 -> r3
#2:	       ldmg.d	___mem_emergency
	;;
#0:	       add	r4, r2 -> r2
#1:	       add	r3, r8 -> r8
	;;
#2:	       stm.a	r31, r2.30, 0
#0:	       rl	r2, 16 -> r2
	;;
#2:	       ldiu	lo11{ ___mem_emergency } -> r2.30
#0:	       add	r2, r6 -> r3
#1:	       ldm.s	r15, 64
	;;
#0:	       xor	r5, r3 -> r2
#1:	       xor	r3, r6 -> r4
	;;
#0:	       or	r31, 0 -> r5
#1:	       ldmg.d	___mem_emergency
#2:	       add	r9, r2 -> r2
	;;
#0:	       add	r2, r1 -> r1
#1:	       add	r5, r6 -> r5
	;;
#2:	       stm.a	r31, r2.30, 0
#0:	       rl	r1, 23 -> r1
	;;
#2:	       ldiu	lo11{ ___mem_emergency } -> r2.30
#0:	       add	r1, r3 -> r2
#1:	       ldm.s	r15, 52
	;;
#0:	       xor	r4, r2 -> r1
#1:	       xor	r2, r3 -> r6
	;;
#0:	       add	r8, r1 -> r8
#1:	       or	r31, 0 -> r1
#2:	       ldmg.d	___mem_emergency
	;;
#0:	       add	r1, r3 -> r4
	;;
#3:	       stm.a	r31, r3.30, 0
	;;
#3:	       ldiu	lo11{ ___mem_emergency } -> r3.30
#0:	       ldm.s	r15, 100
	;;
#0:	       or	r31, 0 -> r3
#1:	       ldmg.d	___mem_emergency
	;;
#0:	       add	r8, r3 -> r1
	;;
#3:	       stm.a	r31, r3.30, 0
#0:	       rl	r1, 4 -> r1
	;;
#3:	       ldiu	lo11{ ___mem_emergency } -> r3.30
#0:	       add	r1, r2 -> r3
#1:	       ldm.s	r15, 40
	;;
#0:	       xor	r6, r3 -> r1
#1:	       xor	r3, r2 -> r9
	;;
#0:	       add	r5, r1 -> r5
#1:	       or	r31, 0 -> r1
#2:	       ldmg.d	___mem_emergency
	;;
#0:	       add	r1, r2 -> r6
	;;
#0:	       stm.a	r31, r0.30, 0
	;;
#0:	       ldiu	lo11{ ___mem_emergency } -> r0.30
#1:	       ldm.s	r15, 96
	;;
#0:	       or	r31, 0 -> r2
#1:	       ldmg.d	___mem_emergency
	;;
#0:	       add	r5, r2 -> r1
	;;
#3:	       stm.a	r31, r3.30, 0
#0:	       rl	r1, 11 -> r1
	;;
#3:	       ldiu	lo11{ ___mem_emergency } -> r3.30
#0:	       add	r1, r3 -> r2
#1:	       ldm.s	r15, 28
	;;
#0:	       xor	r9, r2 -> r1
#1:	       xor	r2, r3 -> r8
	;;
#0:	       add	r4, r1 -> r11
#1:	       or	r31, 0 -> r1
#2:	       ldmg.d	___mem_emergency
	;;
#0:	       add	r1, r3 -> r4
	;;
#1:	       stm.a	r31, r1.30, 0
	;;
#1:	       ldiu	lo11{ ___mem_emergency } -> r1.30
#0:	       ldm.s	r15, 92
	;;
#0:	       or	r31, 0 -> r3
#1:	       ldmg.d	___mem_emergency
	;;
#0:	       add	r11, r3 -> r1
	;;
#0:	       stm.a	r31, r0.30, 0
#1:	       rl	r1, 16 -> r1
	;;
#0:	       ldiu	lo11{ ___mem_emergency } -> r0.30
#1:	       add	r1, r2 -> r12
#2:	       ldm.s	r15, 16
	;;
#0:	       xor	r8, r12 -> r1
#1:	       xor	r12, r2 -> r9
	;;
#0:	       add	r6, r1 -> r3
#1:	       or	r31, 0 -> r1
#2:	       ldmg.d	___mem_emergency
	;;
#0:	       add	r1, r2 -> r2
	;;
#2:	       stm.a	r31, r2.30, 0
	;;
#2:	       ldiu	lo11{ ___mem_emergency } -> r2.30
#0:	       ldm.s	r15, 88
	;;
#0:	       or	r31, 0 -> r1
#1:	       ldmg.d	___mem_emergency
	;;
#0:	       add	r3, r1 -> r1
	;;
#1:	       stm.a	r31, r1.30, 0
#0:	       rl	r1, 23 -> r1
	;;
#1:	       ldiu	lo11{ ___mem_emergency } -> r1.30
#0:	       add	r1, r12 -> r3
#2:	       ldm.s	r15, 60
	;;
#0:	       xor	r9, r3 -> r1
#1:	       xor	r3, r12 -> r8
	;;
#0:	       add	r4, r1 -> r6
#1:	       or	r31, 0 -> r1
#2:	       ldmg.d	___mem_emergency
	;;
#0:	       add	r1, r3 -> r4
	;;
#1:	       stm.a	r31, r1.30, 0
	;;
#1:	       ldiu	lo11{ ___mem_emergency } -> r1.30
#0:	       ldm.s	r15, 4
	;;
#0:	       or	r31, 0 -> r1
#1:	       ldmg.d	___mem_emergency
	;;
#0:	       add	r1, r12 -> r5
#1:	       add	r6, r1.25 -> r1
	;;
#3:	       stm.a	r31, r3.30, 0
#0:	       rl	r1, 4 -> r1
	;;
#3:	       ldiu	lo11{ ___mem_emergency } -> r3.30
#0:	       add	r1, r3 -> r10
#1:	       ldm.s	r15, 84
	;;
#0:	       xor	r8, r10 -> r1
#1:	       xor	r10, r3 -> r3
	;;
#0:	       add	r2, r1 -> r2
#1:	       or	r31, 0 -> r1
#2:	       ldmg.d	___mem_emergency
	;;
#0:	       add	r2, r1 -> r1
	;;
#1:	       stm.a	r31, r1.30, 0
#0:	       rl	r1, 11 -> r1
	;;
#1:	       ldiu	lo11{ ___mem_emergency } -> r1.30
#0:	       add	r1, r10 -> r2
#2:	       ldm.s	r15, 64
	;;
#0:	       xor	r3, r2 -> r3
#1:	       xor	r2, r10 -> r1
#2:	       xor	r2, -1 -> r9
	;;
#0:	       add	r5, r3 -> r11
#1:	       or	r31, 0 -> r3
#2:	       ldmg.d	___mem_emergency
	;;
#0:	       add	r3, r10 -> r5
#1:	       add	r11, r0 -> r0
	;;
#2:	       stm.a	r31, r2.30, 0
#0:	       rl	r0, 16 -> r0
	;;
#2:	       ldiu	lo11{ ___mem_emergency } -> r2.30
#0:	       ldm.s	r15, 12
#1:	       add	r0, r2 -> r12
	;;
#0:	       xor	r1, r12 -> r0
#1:	       xor	r12, -1 -> r1
	;;
#0:	       or	r31, 0 -> r3
#1:	       ldmg.d	___mem_emergency
#2:	       add	r4, r0 -> r10
	;;
#0:	       add	r3, r12 -> r3
	;;
#0:	       stm.a	r31, r0.30, 0
	;;
#0:	       ldiu	lo11{ ___mem_emergency } -> r0.30
#1:	       ldm.s	r15, 36
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldmg.d	___mem_emergency
	;;
#0:	       add	r0, r2 -> r4
	;;
#0:	       stm.a	r31, r0.30, 0
	;;
#0:	       ldiu	lo11{ ___mem_emergency } -> r0.30
#1:	       ldm.s	r15, 80
	;;
#0:	       or	r31, 0 -> r2
#1:	       ldmg.d	___mem_emergency
	;;
#0:	       add	r10, r2 -> r0
	;;
#3:	       stm.a	r31, r3.30, 0
#0:	       rl	r0, 23 -> r0
	;;
#3:	       ldiu	lo11{ ___mem_emergency } -> r3.30
#0:	       add	r0, r12 -> r6
#1:	       ldm.s	r15, 16
	;;
#0:	       or	r6, r9 -> r0
#1:	       xor	r6, -1 -> r9
	;;
#0:	       xor	r0, r12 -> r0
	;;
#0:	       add	r5, r0 -> r0
	;;
#2:	       add	r0, r2.17 -> r0
	;;
#0:	       rl	r0, 6 -> r0
	;;
#0:	       add	r0, r6 -> r8
	;;
#2:	       or	r8, r1 -> r2.16
#0:	       or	r31, 0 -> r1
#1:	       ldmg.d	___mem_emergency
#3:	       xor	r8, -1 -> r2
	;;
#0:	       add	r1, r8 -> r1
	;;
#3:	       stm.a	r31, r3.30, 0
	;;
#3:	       ldiu	lo11{ ___mem_emergency } -> r3.30
#0:	       ldm.s	r15, 44
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldmg.d	___mem_emergency
	;;
#0:	       add	r0, r6 -> r11
#2:	       xor	r2.16, r6 -> r0
	;;
#1:	       stm.a	r31, r1.30, 0
#0:	       add	r4, r0 -> r0
	;;
#3:	       add	r0, r3.19 -> r0
#1:	       ldiu	lo11{ ___mem_emergency } -> r1.30
#0:	       ldm.s	r15, 24
	;;
#0:	       rl	r0, 10 -> r0
	;;
#0:	       add	r0, r8 -> r6
	;;
#2:	       xor	r6, -1 -> r2.17
#0:	       or	r6, r9 -> r0
	;;
#0:	       xor	r0, r8 -> r0
	;;
#0:	       add	r3, r0 -> r0
	;;
#2:	       add	r0, r2.25 -> r0
	;;
#0:	       rl	r0, 15 -> r0
	;;
#0:	       add	r0, r6 -> r9
	;;
#0:	       or	r9, r2 -> r8
#1:	       or	r31, 0 -> r2
#2:	       ldmg.d	___mem_emergency
#3:	       xor	r9, -1 -> r3
	;;
#0:	       add	r2, r9 -> r2
	;;
#1:	       stm.a	r31, r1.30, 0
	;;
#1:	       ldiu	lo11{ ___mem_emergency } -> r1.30
#0:	       ldm.s	r15, 52
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldmg.d	___mem_emergency
	;;
#0:	       add	r0, r6 -> r12
#1:	       xor	r8, r6 -> r0
	;;
#3:	       stm.a	r31, r3.30, 0
#0:	       add	r11, r0 -> r0
	;;
#2:	       add	r0, r2.28 -> r0
#3:	       ldiu	lo11{ ___mem_emergency } -> r3.30
#0:	       ldm.s	r15, 32
	;;
#0:	       rl	r0, 21 -> r0
	;;
#2:	       add	r0, r9 -> r2.16
	;;
#2:	       or	r2.16, r2.17 -> r0
	;;
#2:	       xor	r2.16, -1 -> r6
#0:	       xor	r0, r9 -> r0
	;;
#0:	       add	r1, r0 -> r0
#1:	       or	r31, 0 -> r1
#2:	       ldmg.d	___mem_emergency
	;;
#2:	       add	r0, r2.26 -> r0
	;;
#3:	       stm.a	r31, r3.30, 0
#0:	       rl	r0, 6 -> r0
	;;
#2:	       add	r0, r2.16 -> r9
#0:	       ldm.s	r15, 56
	;;
#0:	       or	r9, r3 -> r3
#1:	       xor	r9, -1 -> r8
#2:	       add	r1, r9 -> r1
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldmg.d	___mem_emergency
	;;
#2:	       add	r0, r2.16 -> r5
	;;
#2:	       xor	r3, r2.16 -> r0
	;;
#2:	       stm.a	r31, r2.30, 0
#0:	       add	r12, r0 -> r0
	;;
#2:	       add	r0, r2.27 -> r0
#0:	       ldm.s	r15, 40
	;;
#2:	       ldiu	lo11{ ___mem_emergency } -> r2.30
#0:	       rl	r0, 10 -> r0
	;;
#2:	       add	r0, r9 -> r2.16
	;;
#2:	       or	r2.16, r6 -> r0
	;;
#2:	       xor	r2.16, -1 -> r4
#0:	       xor	r0, r9 -> r0
	;;
#0:	       add	r2, r0 -> r0
#1:	       or	r31, 0 -> r2
#2:	       ldmg.d	___mem_emergency
	;;
#0:	       add	r0, r7 -> r0
	;;
#0:	       stm.a	r31, r0.30, 0
#1:	       rl	r0, 15 -> r0
	;;
#2:	       add	r0, r2.16 -> r7
#0:	       ldiu	lo11{ ___mem_emergency } -> r0.30
#1:	       ldm.s	r15, 4
	;;
#0:	       or	r7, r8 -> r3
#1:	       xor	r7, -1 -> r8
#2:	       add	r2, r7 -> r2
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldmg.d	___mem_emergency
	;;
#2:	       add	r0, r2.16 -> r6
	;;
#1:	       stm.a	r31, r1.30, 0
#2:	       xor	r3, r2.16 -> r0
	;;
#1:	       ldiu	lo11{ ___mem_emergency } -> r1.30
#0:	       add	r5, r0 -> r0
#2:	       ldm.s	r15, 76
	;;
#2:	       add	r0, r2.29 -> r0
	;;
#0:	       rl	r0, 21 -> r0
#1:	       or	r31, 0 -> r3
#2:	       ldmg.d	___mem_emergency
	;;
#0:	       add	r0, r7 -> r10
	;;
#0:	       stm.a	r31, r0.30, 0
#1:	       or	r10, r4 -> r0
#2:	       xor	r10, -1 -> r4
	;;
#0:	       ldiu	lo11{ ___mem_emergency } -> r0.30
#1:	       xor	r0, r7 -> r0
#2:	       ldm.s	r15, 48
	;;
#0:	       add	r1, r0 -> r1
	;;
#0:	       add	r1, r3 -> r0
#1:	       or	r31, 0 -> r3
#2:	       ldmg.d	___mem_emergency
	;;
#0:	       rl	r0, 6 -> r0
	;;
#1:	       stm.a	r31, r1.30, 0
#0:	       add	r0, r10 -> r7
	;;
#2:	       xor	r7, -1 -> r2.16
#0:	       ldm.s	r15, 8
#1:	       or	r7, r8 -> r1
#3:	       add	r3, r7 -> r3
	;;
#0:	       xor	r1, r10 -> r1
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldmg.d	___mem_emergency
	;;
#0:	       add	r0, r10 -> r11
#1:	       add	r6, r1 -> r0
	;;
#0:	       add	r0, r0.17 -> r0
	;;
#0:	       stm.a	r31, r0.30, 0
#1:	       rl	r0, 10 -> r0
	;;
#0:	       ldiu	lo11{ ___mem_emergency } -> r0.30
#1:	       add	r0, r7 -> r12
#2:	       ldm.s	r15, 60
	;;
#0:	       or	r12, r4 -> r0
	;;
#0:	       xor	r0, r7 -> r0
	;;
#0:	       add	r2, r0 -> r0
#1:	       xor	r12, -1 -> r2
	;;
#3:	       add	r0, r3.17 -> r0
	;;
#0:	       rl	r0, 15 -> r0
	;;
#0:	       add	r0, r12 -> r6
#1:	       or	r31, 0 -> r0
#2:	       ldmg.d	___mem_emergency
	;;
#2:	       or	r6, r2.16 -> r1
#0:	       add	r0, r6 -> r4
#1:	       xor	r6, -1 -> r9
	;;
#0:	       stm.a	r31, r0.30, 0
#1:	       xor	r1, r12 -> r1
	;;
#0:	       ldm.s	r15, 20
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldmg.d	___mem_emergency
	;;
#0:	       add	r0, r12 -> r10
#1:	       add	r11, r1 -> r0
	;;
#2:	       add	r0, r2.24 -> r0
	;;
#2:	       stm.a	r31, r2.30, 0
#0:	       rl	r0, 21 -> r0
	;;
#0:	       add	r0, r6 -> r11
#1:	       ldm.s	r15, 28
	;;
#0:	       or	r11, r2 -> r0
#1:	       xor	r11, -1 -> r2
	;;
#0:	       xor	r0, r6 -> r0
	;;
#0:	       add	r3, r0 -> r0
	;;
#2:	       add	r0, r2.23 -> r0
	;;
#0:	       rl	r0, 6 -> r0
	;;
#0:	       add	r0, r11 -> r3
#1:	       or	r31, 0 -> r0
#2:	       ldmg.d	___mem_emergency
	;;
#0:	       add	r0, r11 -> r8
#1:	       or	r3, r9 -> r1
#2:	       xor	r3, -1 -> r6
	;;
#0:	       add	r3, r31 -> r0
#1:	       xor	r1, r11 -> r1
	;;
#0:	       stm.a	r0, r0.23, 2
#1:	       add	r10, r1 -> r1
	;;
#0:	       ldm.s	r15, 72
	;;
#1:	       or	r31, 0 -> r0
#0:	       ldm.f	r0.23, 12
	;;
#0:	       add	r1, r0 -> r0
	;;
#0:	       rl	r0, 10 -> r0
	;;
#0:	       add	r0, r3 -> r12
	;;
#0:	       or	r12, r2 -> r0
	;;
#0:	       xor	r0, r3 -> r0
	;;
#0:	       add	r4, r0 -> r0
	;;
#0:	       add	r0, r13 -> r0
	;;
#0:	       rl	r0, 15 -> r0
	;;
#0:	       add	r0, r12 -> r3
	;;
#0:	       or	r3, r6 -> r0
#1:	       add	r3, r31 -> r1
	;;
#0:	       xor	r0, r12 -> r0
	;;
#0:	       add	r8, r0 -> r0
	;;
#0:	       add	r0, r14 -> r0
	;;
#0:	       rl	r0, 21 -> r0
	;;
#0:	       add	r1, r0 -> r0
	;;
#0:	       stm.a	r0, r0.23, 3
	;;
#0:	       ldm.f	r0.23, 16
	;;
#0:	       add	r3, r31 -> r0
	;;
#0:	       stm.a	r0, r0.23, 4
	;;
#0:	       ldm.f	r0.23, 20
	;;
#0:	       add	r12, r31 -> r0
	;;
#0:	       stm.a	r0, r0.23, 5
	;;
#0:	       ldm.s	r15, 184
	;;
#0:	       stx	r31 -> $ro
#1:	       ldm.s	r15, 188
	;;
#0:	       stx	r31 -> $rb
#1:	       ldm.s	r15, 192
	;;
#2:	       or	r31, 0 -> r2.29
#0:	       ldm.s	r15, 196
	;;
#1:	       or	r31, 0 -> r1.29
#0:	       ldm.s	r15, 200
	;;
#2:	       or	r31, 0 -> r2.28
#0:	       ldm.s	r15, 204
	;;
#1:	       or	r31, 0 -> r1.28
#0:	       ldm.s	r15, 208
	;;
#2:	       or	r31, 0 -> r2.27
#0:	       ldm.s	r15, 212
	;;
#1:	       or	r31, 0 -> r1.27
#0:	       ldm.s	r15, 216
	;;
#2:	       or	r31, 0 -> r2.26
#0:	       ldm.s	r15, 220
	;;
#1:	       or	r31, 0 -> r1.26
#0:	       ldm.s	r15, 224
	;;
#2:	       or	r31, 0 -> r2.25
#0:	       ldm.s	r15, 228
	;;
#1:	       or	r31, 0 -> r1.25
#0:	       ldm.s	r15, 232
	;;
#2:	       or	r31, 0 -> r2.24
#0:	       ldm.s	r15, 236
	;;
#1:	       or	r31, 0 -> r1.24
#0:	       ldm.s	r15, 240
	;;
#2:	       or	r31, 0 -> r2.23
#0:	       ldm.s	r15, 244
	;;
#1:	       or	r31, 0 -> r1.23
#0:	       ldm.s	r15, 248
	;;
#0:	       or	r31, 0 -> r0.23
#1:	       ldm.s	r15, 252
	;;
#0:	       or	r31, 0 -> r14
#1:	       ldm.s	r15, 256
	;;
#0:	       or	r31, 0 -> r13
#1:	       ldm.s	r15, 260
	;;
#0:	       or	r31, 0 -> r12
#1:	       ldm.s	r15, 264
	;;
#0:	       or	r31, 0 -> r11
#1:	       ldm.s	r15, 268
#2:	       addi	288 -> r15
	;;
#0:	       jop	ret
#1:	       or	r31, 0 -> r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
_md5_process_end:
.tmp0:
	.size	_md5_process, .tmp0-_md5_process

	.globl	_main
	.type	_main,@function
_main:                                  ; @main
	.funsz	_main_end-_main
_main_start:
; BB#0:
#2:	       ldx	$rb, 0 -> r2.30
#3:	       ldx	$ro, 0 -> r3.30
#0:	       ldiu	lo11{ ___mem_emergency } -> r0.30
#1:	       wb.s	r15, 88
	;;
#0:	       addi	-352 -> r15
#1:	       ldiu	256 -> r0
#2:	       ldiu	128 -> r1
#3:	       ldga	32896 -> r2
	;;
#0:	       add	r15, r0 -> r0
#1:	       add	r15, r1 -> r1
	;;
#0:	       stm.s	r10, r0, 19
	;;
#0:	       stm.s	r11, r0, 18
	;;
#0:	       stm.s	r12, r0, 17
	;;
#0:	       stm.s	r13, r0, 16
	;;
#0:	       stm.s	r14, r0, 15
	;;
#0:	       stm.s	r0.23, r0, 14
	;;
#1:	       stm.s	r1.23, r0, 13
#0:	       ldi	0 -> r0.23
	;;
#2:	       stm.s	r2.23, r0, 12
#1:	       ldi	63 -> r1.23
	;;
#3:	       stm.s	r3.23, r0, 11
#2:	       ldiu	1791 -> r2.23
	;;
#0:	       stm.s	r0.24, r0, 10
#2:	       ldim	991 -> r2.23
	;;
#1:	       stm.s	r1.24, r0, 9
#0:	       ldiu	1278 -> r0.24
#2:	       ldih	2039 -> r2.23
	;;
#2:	       stm.s	r2.24, r0, 8
#0:	       ldim	859 -> r0.24
	;;
#3:	       stm.s	r3.24, r0, 7
#0:	       ldih	1221 -> r0.24
#2:	       ldi	-4 -> r2.24
	;;
#1:	       stm.s	r1.25, r0, 6
#3:	       ldiu	905 -> r3.24
	;;
#2:	       stm.s	r2.25, r0, 5
#3:	       ldim	437 -> r3.24
	;;
#3:	       stm.s	r3.25, r0, 4
#2:	       ldi	0 -> r2.25
	;;
#1:	       stm.s	r1.26, r0, 3
#3:	       ldih	1918 -> r3.24
	;;
#2:	       stm.s	r2.26, r0, 2
	;;
#3:	       stm.s	r3.26, r0, 1
#2:	       ldiu	769 -> r2.26
	;;
#1:	       stm.s	r1.27, r0, 0
#2:	       ldim	164 -> r2.26
#0:	       ldiu	1142 -> r0
	;;
#1:	       stm.s	r1.28, r1, 31
#2:	       ldih	826 -> r2.26
	;;
#1:	       stm.s	r1.29, r1, 30
	;;
#2:	       stm.s	r2.30, r1, 29
	;;
#3:	       stm.s	r3.30, r1, 28
#2:	       ldiu	lo11{ ___mem_emergency } -> r2.30
#0:	       s2add	r15, 24 -> r1
	;;
#1:	       add	r1, 0 -> r1.24
#3:	       add	r1, 24 -> r3.23
#0:	       stm.s	r0, r15, 8
	;;
#1:	       or	r1.24, 4 -> r1.29
#3:	       ldiu	lo11{ ___mem_emergency } -> r3.30
#0:	       ldm.s	r15, 32
	;;
#0:	       or	r31, 0 -> r3
	;;
#0:	       ldim	586 -> r3
	;;
#0:	       stm.s	r3, r15, 8
	;;
#0:	       ldm.s	r15, 32
	;;
#0:	       or	r31, 0 -> r1
	;;
#0:	       ldih	129 -> r1
	;;
#0:	       stm.s	r1, r15, 8
#1:	       ldiu	192 -> r1
	;;
#0:	       stm.s	r2, r15, 10
#1:	       add	r15, r1 -> r1
	;;
#0:	       ldm.s	r15, 40
#1:	       add	r1, 24 -> r1
	;;
#0:	       or	r31, 0 -> r3
	;;
#0:	       ldih	1028 -> r3
	;;
#0:	       stm.s	r3, r15, 10
	;;
#0:	       stm.s	r1, r15, 7
	;;
#0:	       ldm.s	r15, 28
	;;
#0:	       or	r31, 0 -> r2
	;;
#0:	       or	r2, 1 -> r0
#1:	       ldiu	2047 -> r2
	;;
#0:	       stm.s	r0, r15, 4
	;;
#0:	       ldm.s	r15, 28
	;;
#0:	       or	r31, 0 -> r3
	;;
#0:	       or	r3, 2 -> r0
	;;
#0:	       stm.s	r0, r15, 3
	;;
#0:	       ldm.s	r15, 28
	;;
#0:	       or	r31, 0 -> r1
	;;
#0:	       or	r1, 3 -> r0
#1:	       s2add	r15, 16 -> r1
	;;
#0:	       add	r1, 16 -> r11
#1:	       s2add	r15, 8 -> r1
#2:	       stm.s	r0, r15, 2
	;;
#0:	       add	r1, 12 -> r14
#1:	       ldiu	160 -> r1
	;;
#0:	       add	r15, r1 -> r1
	;;
#3:	       add	r1, 24 -> r3.25
#0:	       ldiu	224 -> r1
	;;
#3:	       or	r3.25, 4 -> r0
#0:	       add	r15, r1 -> r1
	;;
#0:	       stm.s	r0, r15, 5
#1:	       add	r1, 0 -> r0
	;;
#3:	       or	r0, 4 -> r3.26
#0:	       stm.s	r2, r15, 6
	;;
#0:	       ldm.s	r15, 24
	;;
#0:	       or	r31, 0 -> r3
	;;
#0:	       ldim	2043 -> r3
	;;
#0:	       stm.s	r3, r15, 6
	;;
.BB1_1:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB1_38 Depth 2
                                        ;     Child Loop BB1_34 Depth 2
                                        ;     Child Loop BB1_33 Depth 2
                                        ;     Child Loop BB1_2 Depth 2
                                        ;     Child Loop BB1_7 Depth 2
                                        ;     Child Loop BB1_5 Depth 2
                                        ;     Child Loop BB1_11 Depth 2
                                        ;     Child Loop BB1_21 Depth 2
                                        ;     Child Loop BB1_29 Depth 2
                                        ;     Child Loop BB1_51 Depth 2
                                        ;     Child Loop BB1_49 Depth 2
                                        ;     Child Loop BB1_46 Depth 2
                                        ;     Child Loop BB1_43 Depth 2
#1:	       stm.a	0, r1.29, 0
	;;
#0:	       stm.a	0, r15, 24
	;;
#2:	       stm.a	r2.26, r15, 26
	;;
#3:	       stm.a	r3.24, r15, 27
	;;
#0:	       stm.a	r0.24, r15, 28
	;;
#0:	       ldm.s	r15, 32
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       stm.a	r0, r15, 29
#1:	       ldga	_do_test.test -> r0
	;;
#0:	       ldmr.f	r0.23, r0, 2
	;;
#1:	       or	r31, 0 -> r1.25
	;;
#1:	       or	r1.25, 0 -> r0
	;;
.BB1_2:                                 ;   Parent Loop BB1_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       or	r0, 0 -> r2
	;;
#0:	       and	r2, 3 -> r0
	;;
#0:	       brz eq @	r0, .BB1_4
	;;
.BB1_3:                                 ;   in Loop: Header=BB1_2 Depth=2
#0:	       ldm.f	r2, 0
#1:	       add	r2, 1 -> r0
	;;
#0:	       bbh	mzext8 r2 -> r1
	;;
#0:	       brz ne @	r1, .BB1_2
	;;
#0:	       brz eq @	r1, .BB1_8
	;;
.BB1_4:                                 ;   in Loop: Header=BB1_1 Depth=1
#0:	       ldm.f	r2, 0
	;;
#0:	       stm.a	r31, r0.30, 0
#2:	       add	r31, r2.23 -> r0
	;;
#0:	       ldm.s	r15, 40
	;;
#0:	       or	r31, 0 -> r1
#1:	       ldmg.d	___mem_emergency
	;;
#0:	       and	r31, r1 -> r3
#1:	       ldm.s	r15, 40
	;;
#0:	       or	r31, 0 -> r1
	;;
#0:	       xor	r3, r1 -> r1
	;;
#0:	       and	r1, r0 -> r0
	;;
#0:	       brz ne @	r0, .BB1_6
	;;
.BB1_5:                                 ; %.lr.ph5.i
                                        ;   Parent Loop BB1_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r2, 4
#1:	       add	r2, 4 -> r2
	;;
#3:	       stm.a	r31, r3.30, 0
#2:	       add	r31, r2.23 -> r0
	;;
#0:	       ldm.s	r15, 40
	;;
#0:	       or	r31, 0 -> r1
#1:	       ldmg.d	___mem_emergency
	;;
#0:	       and	r31, r1 -> r3
#1:	       ldm.s	r15, 40
	;;
#0:	       or	r31, 0 -> r1
	;;
#0:	       xor	r3, r1 -> r1
	;;
#0:	       and	r1, r0 -> r0
	;;
#0:	       brz eq @	r0, .BB1_5
	;;
.BB1_6:                                 ; %._crit_edge6.i
                                        ;   in Loop: Header=BB1_1 Depth=1
#0:	       ldm.f	r2, 0
	;;
#0:	       bbh	mzext8 r2 -> r0
	;;
#0:	       brz eq @	r0, .BB1_8
	;;
.BB1_7:                                 ; %.lr.ph.i
                                        ;   Parent Loop BB1_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r2, 1
#1:	       add	r2, 1 -> r1
	;;
#0:	       or	r1, 0 -> r2
	;;
#0:	       bbh	mzext8 r1 -> r0
	;;
#0:	       brz ne @	r0, .BB1_7
	;;
.BB1_8:                                 ; %._crit_edge.i
                                        ;   in Loop: Header=BB1_1 Depth=1
#1:	       sub	r2, r1.25 -> r12
	;;
#0:	       cmp lt	r12, 1 -> c1
	;;
#0:	if  c1 br @	.BB1_16
	;;
.BB1_9:                                 ; %.preheader.i
                                        ;   in Loop: Header=BB1_1 Depth=1
#0:	       ldi	64 -> r3
#1:	       sra	r12, 29 -> r0
#2:	       sl	r12, 3 -> r2
	;;
#1:	       stm.a	r0, r1.29, 0
#0:	       cmp lt	r12, r3 -> c1
	;;
#0:	if  c1 br @	.BB1_14
#1:	       stm.a	r2, r15, 24
	;;
.BB1_10:                                ; %.lr.ph.i12.preheader
                                        ;   in Loop: Header=BB1_1 Depth=1
#1:	       or	r12, 0 -> r1.26
#0:	       ldi	-64 -> r0
	;;
#1:	       addi	-64 -> r1.26
	;;
#1:	       and	r1.26, r0 -> r13
	;;
#1:	       or	r1.25, 0 -> r10
	;;
.BB1_11:                                ; %.lr.ph.i12
                                        ;   Parent Loop BB1_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       s2add	r15, 24 -> r2
#1:	       callg	_md5_process
#2:	       or	r10, 0 -> r1
	;;
#0:	       add	r2, 0 -> r0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       addi	-64 -> r12
#1:	       s2add	r10, 16 -> r10
	;;
#1:	       cmp gt	r12, r1.23 -> c1
	;;
#0:	if  c1 br @	.BB1_11
	;;
.BB1_12:                                ; %._crit_edge.i13
                                        ;   in Loop: Header=BB1_1 Depth=1
#1:	       cmp eq	r1.26, r13 -> c1
	;;
#0:	if  c1 br @	.BB1_16
	;;
.BB1_13:                                ;   in Loop: Header=BB1_1 Depth=1
#1:	       add	r13, r1.25 -> r0
#0:	       br	.BB1_15
	;;
#1:	       sub	r1.26, r13 -> r12
#0:	       s2add	r0, 16 -> r1
	;;
	       nop	0
	;;
.BB1_14:                                ;   in Loop: Header=BB1_1 Depth=1
#1:	       or	r1.25, 0 -> r1
	;;
.BB1_15:                                ; %._crit_edge.i13.thread
                                        ;   in Loop: Header=BB1_1 Depth=1
#3:	       or	r3.23, 0 -> r0
#0:	       callg	_memcpy
#1:	       or	r12, 0 -> r2
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB1_16:                                ; %md5_append.exit
                                        ;   in Loop: Header=BB1_1 Depth=1
#0:	       ldm.f	r15, 96
#1:	       ldiu	192 -> r3
#2:	       ldiu	192 -> r5
#3:	       ldiu	192 -> r13
	;;
#0:	       add	r15, r3 -> r3
#1:	       add	r15, r5 -> r5
	;;
#0:	       or	r31, 0 -> r2
	;;
#0:	       stmb.a	r2, r3, 24
#1:	       sr	r2, 8 -> r1
	;;
#0:	       ldm.s	r15, 16
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       stmb.a	r1, r0, 0
#1:	       sr	r2, 16 -> r1
#2:	       sr	r2, 3 -> r0
	;;
#1:	       and	r0, r1.23 -> r12
#0:	       ldm.s	r15, 12
	;;
#0:	       or	r31, 0 -> r3
	;;
#0:	       stmb.a	r1, r3, 0
#1:	       sr	r2, 24 -> r1
	;;
#0:	       ldm.s	r15, 8
	;;
#0:	       or	r31, 0 -> r3
#1:	       ldm.f	r1.29, 0
	;;
#0:	       stmb.a	r1, r3, 0
#1:	       ldi	55 -> r3
	;;
#0:	       stmb.a	r31, r5, 28
#1:	       sr	r31, 8 -> r1
#2:	       add	r15, r13 -> r5
	;;
#0:	       stmb.a	r1, r5, 29
#1:	       sub	r3, r0 -> r1
#2:	       ldiu	192 -> r5
#3:	       sr	r31, 24 -> r3
	;;
#1:	       and	r1, r1.23 -> r4
#0:	       sr	r31, 16 -> r1
#2:	       add	r15, r5 -> r5
	;;
#0:	       stmb.a	r1, r5, 30
#1:	       add	r4, 1 -> r13
	;;
#0:	       sra	r13, 29 -> r1
#1:	       stmb.a	r3, r5, 31
#2:	       sl	r13, 3 -> r3
	;;
#0:	       add	r2, r3 -> r0
#1:	       add	r1, r31 -> r1
#2:	       ldga	_md5_finish.pad -> r3
	;;
#1:	       stm.a	r1, r1.29, 0
#0:	       cmpu ge	r0, r2 -> c1
	;;
#0:	       brz eq	r12, .BB1_19
#1:	       stm.a	r0, r15, 24
#2:	if !c1 add	r1, 1 -> r0
	;;
#1:	if !c1 stm.a	r0, r1.29, 0
	;;
#0:	       stm.s	r3, r15, 9
	;;
.BB1_17:                                ;   in Loop: Header=BB1_1 Depth=1
#0:	       ldi	64 -> r0
#1:	       add	r13, r12 -> r1
#2:	       ldi	64 -> r3
#3:	       or	r13, 0 -> r10
	;;
#0:	       callg	_memcpy
	;;
#0:	       sub	r0, r12 -> r2
#1:	       add	r1.24, r12 -> r0
#2:	       cmp gt	r1, r3 -> c1
#3:	       ldga	_md5_finish.pad -> r1
	;;
#0:	if  c1 or	r2, 0 -> r10
#1:	       add	r0, 24 -> r0
	;;
#0:	       or	r10, 0 -> r2
	;;
#0:	       add	r10, r12 -> r1
#1:	       ldi	64 -> r0
	;;
#0:	       cmp lt	r1, r0 -> c1
	;;
#0:	if  c1 br @	.BB1_25
	;;
.BB1_18:                                ;   in Loop: Header=BB1_1 Depth=1
#3:	       or	r3.23, 0 -> r1
#0:	       callg	_md5_process
#1:	       s2add	r15, 24 -> r12
	;;
#0:	       add	r12, 0 -> r0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldga	_md5_finish.pad -> r0
#1:	       sub	r13, r10 -> r13
	;;
#0:	       add	r0, r10 -> r0
	;;
#0:	       stm.s	r0, r15, 9
	;;
.BB1_19:                                ; %.preheader.i.i
                                        ;   in Loop: Header=BB1_1 Depth=1
#0:	       ldi	64 -> r0
	;;
#0:	       cmp lt	r13, r0 -> c1
	;;
#0:	if  c1 br @	.BB1_23
	;;
.BB1_20:                                ; %.lr.ph.i.i.preheader
                                        ;   in Loop: Header=BB1_1 Depth=1
#1:	       or	r13, 0 -> r1.26
#0:	       ldm.s	r15, 36
#2:	       ldi	-64 -> r0
	;;
#1:	       addi	-64 -> r1.26
	;;
#1:	       and	r1.26, r0 -> r10
#0:	       or	r31, 0 -> r3
	;;
#0:	       or	r3, 0 -> r12
	;;
.BB1_21:                                ; %.lr.ph.i.i
                                        ;   Parent Loop BB1_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#1:	       or	r1.24, 0 -> r0
#0:	       callg	_md5_process
#2:	       or	r12, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       addi	-64 -> r13
#1:	       s2add	r12, 16 -> r12
	;;
#1:	       cmp gt	r13, r1.23 -> c1
	;;
#0:	if  c1 br @	.BB1_21
	;;
.BB1_22:                                ; %._crit_edge.i.i.loopexit
                                        ;   in Loop: Header=BB1_1 Depth=1
#1:	       sub	r1.26, r10 -> r13
#0:	       ldm.s	r15, 36
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       add	r10, r0 -> r0
	;;
#0:	       s2add	r0, 16 -> r0
	;;
#0:	       stm.s	r0, r15, 9
	;;
.BB1_23:                                ; %._crit_edge.i.i
                                        ;   in Loop: Header=BB1_1 Depth=1
#0:	       brz eq @	r13, .BB1_25
	;;
.BB1_24:                                ;   in Loop: Header=BB1_1 Depth=1
#0:	       callg	_memcpy
	;;
#3:	       or	r3.23, 0 -> r0
#0:	       ldm.s	r15, 36
#1:	       or	r13, 0 -> r2
	;;
#0:	       or	r31, 0 -> r1
	;;
	       nop	0
	;;
.BB1_25:                                ; %md5_append.exit.i
                                        ;   in Loop: Header=BB1_1 Depth=1
#1:	       ldm.f	r1.29, 0
#0:	       ldi	8 -> r10
	;;
#0:	       or	r31, 0 -> r2
#1:	       ldm.f	r15, 96
	;;
#0:	       s2add	r31, 16 -> r1
#1:	       sr	r31, 3 -> r0
	;;
#1:	       and	r0, r1.23 -> r1.28
#0:	       cmpu ge	r1, r31 -> c1
#2:	       stm.a	r1, r15, 24
	;;
#0:	if !c1 add	r2, 1 -> r0
	;;
#1:	if !c1 stm.a	r0, r1.29, 0
	;;
#1:	       brz eq	r1.28, .BB1_32
#0:	       ldm.s	r15, 28
	;;
#0:	       or	r31, 0 -> r12
	;;
	       nop	0
	;;
.BB1_26:                                ;   in Loop: Header=BB1_1 Depth=1
#1:	       add	r1.28, 8 -> r1
#0:	       ldiu	192 -> r12
#2:	       ldi	64 -> r0
#3:	       ldi	64 -> r3
	;;
#0:	       callg	_memcpy
	;;
#1:	       sub	r0, r1.28 -> r2
#0:	       add	r15, r12 -> r12
#2:	       cmpu gt	r1, r3 -> c1
#3:	       ldi	8 -> r10
	;;
#1:	       add	r1.24, r1.28 -> r0
#0:	if  c1 or	r2, 0 -> r10
#2:	       add	r12, 24 -> r13
	;;
#0:	       add	r0, 24 -> r0
#1:	       or	r13, 0 -> r1
#2:	       or	r10, 0 -> r2
	;;
#1:	       add	r10, r1.28 -> r1
#0:	       ldi	64 -> r0
#2:	       ldi	0 -> r2
	;;
#0:	       cmp lt	r1, r0 -> c1
#1:	       ldi	0 -> r1
	;;
#0:	if  c1 br @	.BB1_33
	;;
.BB1_27:                                ; %.preheader.i4.i
                                        ;   in Loop: Header=BB1_1 Depth=1
#3:	       or	r3.23, 0 -> r1
#0:	       callg	_md5_process
#1:	       s2add	r15, 24 -> r12
	;;
#0:	       add	r12, 0 -> r0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldi	8 -> r0
#1:	       add	r13, r10 -> r12
#2:	       ldi	64 -> r3
	;;
#0:	       sub	r0, r10 -> r10
	;;
#0:	       cmp lt	r10, r3 -> c1
	;;
#0:	if  c1 br @	.BB1_31
	;;
.BB1_28:                                ; %.lr.ph.i7.i.preheader
                                        ;   in Loop: Header=BB1_1 Depth=1
#0:	       ldi	-9 -> r0
#1:	       ldi	-65 -> r3
#2:	       ldi	-65 -> r2
	;;
#1:	       sub	r0, r1.28 -> r1
#0:	       ldi	-64 -> r0
	;;
#0:	       cmpu gt	r1, r3 -> c1
	;;
#0:	if  c1 or	r1, 0 -> r2
	;;
#1:	       add	r2, r1.28 -> r1.27
	;;
#1:	       addi	-55 -> r1.27
	;;
#1:	       and	r1.27, r0 -> r1.26
	;;
#1:	       sub	r1.26, r2 -> r0
	;;
#1:	       sub	r0, r1.28 -> r1.28
	;;
.BB1_29:                                ; %.lr.ph.i7.i
                                        ;   Parent Loop BB1_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       s2add	r15, 24 -> r2
#1:	       callg	_md5_process
#2:	       or	r12, 0 -> r1
	;;
#0:	       add	r2, 0 -> r0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       addi	-64 -> r10
#1:	       s2add	r12, 16 -> r12
	;;
#1:	       cmp gt	r10, r1.23 -> c1
	;;
#0:	if  c1 br @	.BB1_29
	;;
.BB1_30:                                ; %._crit_edge.i10.i.loopexit
                                        ;   in Loop: Header=BB1_1 Depth=1
#1:	       add	r1.28, r13 -> r12
	;;
#1:	       sub	r1.27, r1.26 -> r10
#0:	       addi	63 -> r12
	;;
.BB1_31:                                ; %._crit_edge.i10.i
                                        ;   in Loop: Header=BB1_1 Depth=1
#0:	       ldi	0 -> r2
#1:	       brz eq @	r10, .BB1_33
#2:	       ldi	0 -> r1
	;;
.BB1_32:                                ; %._crit_edge.i10.thread.i
                                        ;   in Loop: Header=BB1_1 Depth=1
#3:	       or	r3.23, 0 -> r0
#0:	       callg	_memcpy
#1:	       or	r12, 0 -> r1
#2:	       or	r10, 0 -> r2
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldi	0 -> r2
#1:	       ldi	0 -> r1
	;;
.BB1_33:                                ; %md5_append.exit11.i
                                        ;   Parent Loop BB1_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#2:	       and	r1, r2.24 -> r0
#0:	       add	r11, r1 -> r3
#1:	       cmp ne	r1, 15 -> c1
#3:	       add	r1, 1 -> r1
	;;
#1:	       add	r1.24, r0 -> r0
#0:	       ldi	-16 -> r10
#2:	       or	r14, 0 -> r12
	;;
#0:	if  c1 br	.BB1_33
#1:	       ldm.f	r0, 8
#2:	       and	r2, 24 -> r0
#3:	       add	r2, 8 -> r2
	;;
#0:	       sr	r31, r0 -> r0
	;;
#0:	       stmb.a	r0, r3, 0
	;;
.BB1_34:                                ; %md5_finish.exit
                                        ;   Parent Loop BB1_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       add	r11, r10 -> r0
#1:	       callg	_sprintf
	;;
#0:	       ldm.f	r0, 16
	;;
#0:	       bbh	mzext8 r0 -> r1
#1:	       or	r12, 0 -> r0
	;;
	       nop	0
	;;
#0:	       add	r12, 2 -> r12
#1:	       add	r10, 1 -> r10
	;;
#0:	       brz ne @	r10, .BB1_34
	;;
.BB1_35:                                ;   in Loop: Header=BB1_1 Depth=1
#0:	       or	r0.23, 1 -> r0
#1:	       ldga	_do_test.test -> r1
	;;
#0:	       ldmr.f	r0, r1, 2
	;;
#0:	       and	r31, 3 -> r0
#1:	       or	r31, 0 -> r10
	;;
#0:	       brz ne @	r0, .BB1_40
	;;
.BB1_36:                                ;   in Loop: Header=BB1_1 Depth=1
#0:	       or	r10, 0 -> r4
#1:	       br @	.BB1_38
#2:	       or	r14, 0 -> r3
	;;
.BB1_37:                                ;   in Loop: Header=BB1_38 Depth=2
#0:	       add	r4, 4 -> r4
#1:	       add	r3, 4 -> r3
	;;
.BB1_38:                                ;   Parent Loop BB1_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r4, 0
	;;
#0:	       or	r31, 0 -> r1
#1:	       ldm.f	r3, 0
	;;
#0:	       cmp ne	r31, r1 -> c1
#1:	       or	r31, 0 -> r0
	;;
#0:	if  c1 br @	.BB1_41
	;;
.BB1_39:                                ;   in Loop: Header=BB1_38 Depth=2
#2:	       add	r0, r2.23 -> r2
#0:	       ldm.s	r15, 40
	;;
#0:	       or	r31, 0 -> r1
#1:	       ldm.s	r15, 40
	;;
#0:	       and	r0, r1 -> r0
	;;
#0:	       or	r31, 0 -> r1
	;;
#0:	       xor	r0, r1 -> r0
	;;
#0:	       and	r0, r2 -> r0
	;;
#0:	       brz eq @	r0, .BB1_37
	;;
#0:	       br @	.BB1_56
	;;
.BB1_40:                                ; %..preheader.i17.preheader_crit_edge
                                        ;   in Loop: Header=BB1_1 Depth=1
#0:	       ldm.f	r10, 0
#1:	       s2add	r15, 8 -> r2
#2:	       or	r10, 0 -> r4
	;;
#0:	       add	r2, 12 -> r3
	;;
#0:	       bbh	mzext8 r10 -> r1
#1:	       ldm.f	r15, 44
	;;
#0:	       bbh	mzext8 r3 -> r0
	;;
.BB1_41:                                ; %.preheader.i17.preheader
                                        ;   in Loop: Header=BB1_1 Depth=1
#0:	       bbh	zext8 r0 -> r0
#1:	       bbh	zext8 r1 -> r1
	;;
#0:	       cmp eq	r0, r1 -> c1
#1:	       cmp ne	r0, 0 -> c2
	;;
#0:	       comb	and c2, c1 -> c2
	;;
#0:	if !c2 br @	.BB1_44
	;;
.BB1_42:                                ; %.preheader.i17.preheader1
                                        ;   in Loop: Header=BB1_1 Depth=1
#0:	       add	r4, 1 -> r1
#1:	       add	r3, 1 -> r0
	;;
.BB1_43:                                ; %.preheader.i17
                                        ;   Parent Loop BB1_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r1, 0
	;;
#0:	       bbh	mzext8 r1 -> r3
#1:	       ldm.f	r0, 0
#2:	       add	r1, 1 -> r1
	;;
#0:	       bbh	mzext8 r0 -> r2
#1:	       add	r0, 1 -> r0
	;;
#0:	       cmp eq	r2, r3 -> c1
#1:	       cmp ne	r2, 0 -> c2
	;;
#0:	       comb	and c2, c1 -> c2
	;;
#0:	if  c2 br @	.BB1_43
	;;
.BB1_44:                                ; %strcmp.exit
                                        ;   in Loop: Header=BB1_1 Depth=1
#0:	if  c1 br @	.BB1_56
	;;
.BB1_45:                                ;   in Loop: Header=BB1_1 Depth=1
#1:	       or	r1.25, 0 -> r1
#0:	       callg	_printf
#2:	       ldga	._.str15 -> r0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       or	r14, 0 -> r2
	;;
.BB1_46:                                ;   Parent Loop BB1_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       and	r2, 3 -> r0
	;;
#0:	       brz eq @	r0, .BB1_48
	;;
.BB1_47:                                ;   in Loop: Header=BB1_46 Depth=2
#0:	       ldm.f	r2, 0
#1:	       add	r2, 1 -> r3
#2:	       or	r2, 0 -> r0
	;;
#0:	       bbh	mzext8 r2 -> r1
#1:	       or	r3, 0 -> r2
	;;
#0:	       brz ne @	r1, .BB1_46
	;;
#0:	       brz eq @	r1, .BB1_53
	;;
.BB1_48:                                ;   in Loop: Header=BB1_1 Depth=1
#0:	       ldm.f	r2, 0
	;;
#2:	       stm.a	r31, r2.30, 0
	;;
#2:	       add	r31, r2.23 -> r0
#0:	       ldm.s	r15, 40
	;;
#0:	       or	r31, 0 -> r1
#1:	       ldmg.d	___mem_emergency
	;;
#0:	       and	r31, r1 -> r3
#1:	       ldm.s	r15, 40
	;;
#0:	       or	r31, 0 -> r1
	;;
#0:	       xor	r3, r1 -> r1
	;;
#0:	       and	r1, r0 -> r0
	;;
#0:	       brz ne @	r0, .BB1_50
	;;
.BB1_49:                                ; %.lr.ph5.i24
                                        ;   Parent Loop BB1_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#1:	       ldiu	lo11{ ___mem_emergency } -> r1.30
#0:	       ldm.f	r2, 4
#2:	       add	r2, 4 -> r2
	;;
#1:	       stm.a	r31, r1.30, 0
#2:	       add	r31, r2.23 -> r0
	;;
#0:	       ldm.s	r15, 40
	;;
#0:	       or	r31, 0 -> r1
#1:	       ldmg.d	___mem_emergency
	;;
#0:	       and	r31, r1 -> r3
#1:	       ldm.s	r15, 40
	;;
#0:	       or	r31, 0 -> r1
	;;
#0:	       xor	r3, r1 -> r1
	;;
#0:	       and	r1, r0 -> r0
	;;
#0:	       brz eq @	r0, .BB1_49
	;;
.BB1_50:                                ; %._crit_edge6.i26
                                        ;   in Loop: Header=BB1_1 Depth=1
#0:	       ldm.f	r2, 0
	;;
#0:	       bbh	mzext8 r2 -> r0
	;;
#0:	       brz eq @	r0, .BB1_52
	;;
.BB1_51:                                ; %.lr.ph.i28
                                        ;   Parent Loop BB1_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r2, 1
#1:	       add	r2, 1 -> r1
	;;
#0:	       or	r1, 0 -> r2
	;;
#0:	       bbh	mzext8 r1 -> r0
	;;
#0:	       brz ne @	r0, .BB1_51
	;;
.BB1_52:                                ; %._crit_edge.i30
                                        ;   in Loop: Header=BB1_1 Depth=1
#0:	       or	r2, 0 -> r0
	;;
.BB1_53:                                ; %strlen.exit32
                                        ;   in Loop: Header=BB1_1 Depth=1
#0:	       ldiu	128 -> r3
#1:	       sub	r0, r14 -> r1
#2:	       ldga	._.str18 -> r2
	;;
#0:	       add	r15, r3 -> r3
	;;
#0:	       stm.a	r14, r3, 14
	;;
#0:	       ldm.s	r15, 20
	;;
#0:	       or	r31, 0 -> r3
#1:	       ldmg.d	_impure_data+8
	;;
#0:	       stm.a	r1, r3, 0
#1:	       ldiu	128 -> r3
	;;
#0:	       add	r15, r3 -> r3
	;;
#0:	       stm.a	r2, r3, 16
#1:	       ldiu	128 -> r3
#2:	       add	r1, 1 -> r2
	;;
#0:	       add	r15, r3 -> r1
	;;
#0:	       stm.a	r2, r1, 26
#1:	       or	r31, 0 -> r2
	;;
#3:	       stm.a	r3.25, r1, 24
	;;
#3:	       stm.a	2, r3.26, 0
	;;
#0:	       stm.a	1, r1, 17
	;;
#0:	       ldm.f	r2, 12
	;;
#0:	       bbh	mzext16 r2 -> r0
	;;
#0:	       btest	r0, 13 -> c1
	;;
#0:	if  c1 br @	.BB1_55
	;;
.BB1_54:                                ;   in Loop: Header=BB1_1 Depth=1
#1:	       ldiu	lo11{ ___mem_emergency } -> r1.30
#0:	       ldga	8192 -> r1
	;;
#0:	       or	r0, r1 -> r0
	;;
#0:	       stmh.a	r0, r2, 6
	;;
#0:	       ldm.f	r2, 100
	;;
#1:	       stm.a	r31, r1.30, 0
	;;
#0:	       ldm.s	r15, 24
	;;
#0:	       or	r31, 0 -> r3
#1:	       ldmg.d	___mem_emergency
	;;
#0:	       and	r31, r3 -> r0
	;;
#0:	       stm.a	r0, r2, 25
	;;
.BB1_55:                                ; %puts.exit21
                                        ;   in Loop: Header=BB1_1 Depth=1
#0:	       ldiu	224 -> r12
#1:	       callg	___sfvwrite_r
#2:	       or	r2, 0 -> r0
	;;
#0:	       add	r15, r12 -> r12
	;;
#0:	       add	r12, 0 -> r1
	;;
	       nop	0
	;;
#0:	       callg	_printf
#1:	       ldga	._.str16 -> r0
#2:	       or	r10, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#2:	       ldi	1 -> r2.25
	;;
.BB1_56:                                ; %strcmp.exit.thread
                                        ;   in Loop: Header=BB1_1 Depth=1
#0:	       add	r0.23, 2 -> r0.23
	;;
#0:	       cmp lt	r0.23, 14 -> c1
	;;
#0:	if  c1 br @	.BB1_1
	;;
.BB1_57:
#2:	       brz ne @	r2.25, .BB1_69
	;;
.BB1_58:
#0:	       ldga	._.str17 -> r1
	;;
.BB1_59:                                ; =>This Inner Loop Header: Depth=1
#0:	       and	r1, 3 -> r0
	;;
#0:	       brz eq @	r0, .BB1_61
	;;
.BB1_60:                                ;   in Loop: Header=BB1_59 Depth=1
#0:	       ldm.f	r1, 0
#1:	       add	r1, 1 -> r2
#2:	       or	r1, 0 -> r3
	;;
#0:	       bbh	mzext8 r1 -> r0
#1:	       or	r2, 0 -> r1
	;;
#0:	       brz ne @	r0, .BB1_59
	;;
#0:	       brz eq @	r0, .BB1_66
	;;
.BB1_61:
#0:	       ldiu	1791 -> r4
#1:	       ldga	32896 -> r2
#2:	       ldm.f	r1, 0
	;;
#0:	       ldim	991 -> r4
#1:	       ldih	1028 -> r2
	;;
#0:	       ldih	2039 -> r4
#1:	       and	r31, r2 -> r0
	;;
#0:	       add	r31, r4 -> r3
#1:	       xor	r0, r2 -> r0
	;;
#0:	       and	r0, r3 -> r0
	;;
#0:	       brz ne @	r0, .BB1_63
	;;
.BB1_62:                                ; %.lr.ph5.i3
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r1, 4
#1:	       add	r1, 4 -> r1
	;;
#0:	       and	r31, r2 -> r0
#1:	       add	r31, r4 -> r3
	;;
#0:	       xor	r0, r2 -> r0
	;;
#0:	       and	r0, r3 -> r0
	;;
#0:	       brz eq @	r0, .BB1_62
	;;
.BB1_63:                                ; %._crit_edge6.i5
#0:	       ldm.f	r1, 0
	;;
#0:	       bbh	mzext8 r1 -> r0
	;;
#0:	       brz eq @	r0, .BB1_65
	;;
.BB1_64:                                ; %.lr.ph.i7
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r1, 1
#1:	       add	r1, 1 -> r3
	;;
#0:	       or	r3, 0 -> r1
	;;
#0:	       bbh	mzext8 r3 -> r0
	;;
#0:	       brz ne @	r0, .BB1_64
	;;
#0:	       brz eq @	r0, .BB1_66
	;;
.BB1_65:
#0:	       or	r1, 0 -> r3
	;;
.BB1_66:                                ; %strlen.exit11
#0:	       ldiu	128 -> r4
#1:	       ldga	._.str17 -> r0
#2:	       ldga	._.str18 -> r2
	;;
#0:	       add	r15, r4 -> r4
	;;
#0:	       stm.a	r0, r4, 14
#1:	       sub	r3, r0 -> r0
#2:	       ldiu	128 -> r3
	;;
#0:	       ldm.s	r15, 20
#1:	       add	r15, r3 -> r3
	;;
#0:	       or	r31, 0 -> r1
#1:	       ldmg.d	_impure_data+8
	;;
#0:	       stm.a	r0, r1, 0
#1:	       add	r0, 1 -> r0
	;;
#0:	       stm.a	r2, r3, 16
#1:	       ldiu	128 -> r3
#2:	       ldiu	192 -> r2
	;;
#0:	       add	r15, r3 -> r1
	;;
#0:	       stm.a	r0, r1, 20
	;;
#3:	       stm.a	r3.25, r1, 18
	;;
#0:	       stm.a	1, r1, 17
#1:	       add	r15, r2 -> r1
	;;
#0:	       add	r1, 8 -> r3
	;;
#0:	       or	r3, 4 -> r0
	;;
#0:	       stm.a	2, r0, 0
#1:	       or	r31, 0 -> r0
	;;
#0:	       ldm.f	r0, 12
	;;
#0:	       bbh	mzext16 r0 -> r2
	;;
#0:	       btest	r2, 13 -> c1
	;;
#0:	if  c1 br @	.BB1_68
	;;
.BB1_67:
#0:	       ldga	8192 -> r1
	;;
#0:	       or	r2, r1 -> r1
	;;
#0:	       stmh.a	r1, r0, 6
#1:	       ldiu	2047 -> r1
	;;
#0:	       ldm.f	r0, 100
#1:	       ldim	2043 -> r1
	;;
#0:	       and	r31, r1 -> r1
	;;
#0:	       stm.a	r1, r0, 25
	;;
.BB1_68:                                ; %puts.exit
#0:	       ldiu	192 -> r10
#1:	       callg	___sfvwrite_r
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       add	r10, 8 -> r1
	;;
	       nop	0
	;;
.BB1_69:                                ; %do_test.exit
#0:	       ldm.s	r15, 240
#1:	       ldi	0 -> r0
	;;
#0:	       stx	r31 -> $ro
#1:	       ldm.s	r15, 244
	;;
#0:	       stx	r31 -> $rb
#1:	       ldm.s	r15, 248
	;;
#1:	       or	r31, 0 -> r1.29
#0:	       ldm.s	r15, 252
	;;
#1:	       or	r31, 0 -> r1.28
#0:	       ldm.s	r15, 256
	;;
#1:	       or	r31, 0 -> r1.27
#0:	       ldm.s	r15, 260
	;;
#3:	       or	r31, 0 -> r3.26
#0:	       ldm.s	r15, 264
	;;
#2:	       or	r31, 0 -> r2.26
#0:	       ldm.s	r15, 268
	;;
#1:	       or	r31, 0 -> r1.26
#0:	       ldm.s	r15, 272
	;;
#3:	       or	r31, 0 -> r3.25
#0:	       ldm.s	r15, 276
	;;
#2:	       or	r31, 0 -> r2.25
#0:	       ldm.s	r15, 280
	;;
#1:	       or	r31, 0 -> r1.25
#0:	       ldm.s	r15, 284
	;;
#3:	       or	r31, 0 -> r3.24
#0:	       ldm.s	r15, 288
	;;
#2:	       or	r31, 0 -> r2.24
#0:	       ldm.s	r15, 292
	;;
#1:	       or	r31, 0 -> r1.24
#0:	       ldm.s	r15, 296
	;;
#0:	       or	r31, 0 -> r0.24
#1:	       ldm.s	r15, 300
	;;
#3:	       or	r31, 0 -> r3.23
#0:	       ldm.s	r15, 304
	;;
#2:	       or	r31, 0 -> r2.23
#0:	       ldm.s	r15, 308
	;;
#1:	       or	r31, 0 -> r1.23
#0:	       ldm.s	r15, 312
	;;
#0:	       or	r31, 0 -> r0.23
#1:	       ldm.s	r15, 316
	;;
#0:	       or	r31, 0 -> r14
#1:	       ldm.s	r15, 320
	;;
#0:	       or	r31, 0 -> r13
#1:	       ldm.s	r15, 324
	;;
#0:	       or	r31, 0 -> r12
#1:	       ldm.s	r15, 328
	;;
#0:	       or	r31, 0 -> r11
#1:	       ldm.s	r15, 332
#2:	       addi	352 -> r15
	;;
#0:	       jop	ret
#1:	       or	r31, 0 -> r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
_main_end:
.tmp1:
	.size	_main, .tmp1-_main

	.globl	_memcpy
	.type	_memcpy,@function
_memcpy:                                ; @memcpy
	.funsz	_memcpy_end-_memcpy
_memcpy_start:
; BB#0:
#0:	       or	r2, 0 -> r4
#1:	       or	r1, 0 -> r2
#2:	       or	r0, 0 -> r5
	;;
#0:	       cmpu lt	r4, 16 -> c1
	;;
#0:	if  c1 br @	.BB2_2
	;;
.BB2_1:
#0:	       or	r2, r5 -> r0
	;;
#0:	       and	r0, 3 -> r0
	;;
#0:	       brz eq @	r0, .BB2_3
	;;
.BB2_2:
#0:	       or	r2, 0 -> r3
#1:	       br @	.BB2_9
#2:	       or	r5, 0 -> r0
	;;
.BB2_3:
#0:	       cmpu gt	r4, 15 -> c1
	;;
#0:	if !c1 br @	.BB2_6
	;;
.BB2_4:
#0:	       or	r5, 0 -> r1
	;;
.BB2_5:                                 ; %.lr.ph10
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r2, 0
#1:	       sub	r4, 16 -> r4
#2:	       add	r1, 16 -> r0
#3:	       add	r2, 16 -> r3
	;;
#0:	       cmpu gt	r4, 15 -> c1
	;;
#0:	       stm.a	r31, r1, 0
	;;
#0:	       ldm.f	r2, 4
	;;
#0:	       stm.a	r31, r1, 1
	;;
#0:	       ldm.f	r2, 8
	;;
#0:	if !c1 br	.BB2_8
#1:	if  c1 br	.BB2_5
#2:	       stm.a	r31, r1, 2
	;;
#0:	       ldm.f	r2, 12
#1:	       or	r3, 0 -> r2
	;;
#0:	       stm.a	r31, r1, 3
#1:	       or	r0, 0 -> r1
	;;
.BB2_6:
#0:	       or	r2, 0 -> r3
#1:	       br @	.BB2_8
#2:	       or	r5, 0 -> r0
	;;
.BB2_7:                                 ; %.lr.ph
                                        ;   in Loop: Header=BB2_8 Depth=1
#0:	       ldm.f	r3, 0
#1:	       add	r3, 4 -> r3
#2:	       sub	r4, 4 -> r4
	;;
#0:	       stm.a	r31, r0, 0
#1:	       add	r0, 4 -> r0
	;;
.BB2_8:                                 ; %.preheader
                                        ; =>This Inner Loop Header: Depth=1
#0:	       cmpu gt	r4, 3 -> c1
	;;
#0:	if  c1 br @	.BB2_7
	;;
.BB2_9:                                 ; %.preheader14
#0:	       brz eq @	r4, .BB2_11
	;;
.BB2_10:                                ; %.lr.ph18
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r3, 0
#1:	       sub	r4, 1 -> r4
	;;
#0:	       brz ne	r4, .BB2_10
#1:	       bbh	mzext8 r3 -> r1
#2:	       add	r3, 1 -> r3
	;;
#0:	       stmb.a	r1, r0, 0
#1:	       add	r0, 1 -> r0
	;;
	       nop	0
	;;
.BB2_11:                                ; %._crit_edge19
#0:	       or	r5, 0 -> r0
#1:	       jop	ret
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
_memcpy_end:
.tmp2:
	.size	_memcpy, .tmp2-_memcpy

	.globl	_memmove
	.type	_memmove,@function
_memmove:                               ; @memmove
	.funsz	_memmove_end-_memmove
_memmove_start:
; BB#0:
#0:	       or	r1, 0 -> r3
#1:	       or	r0, 0 -> r5
#2:	       or	r2, 0 -> r4
	;;
#0:	       cmpu ge	r3, r5 -> c1
	;;
#0:	if !c1 add	r3, r4 -> r2
	;;
#0:	if !c1 cmpu le	r2, r5 -> c1
	;;
#0:	if  c1 br @	.BB3_3
	;;
.BB3_1:
#0:	       brz eq @	r4, .BB3_14
	;;
.BB3_2:                                 ; =>This Inner Loop Header: Depth=1
#0:	       add	r3, r4 -> r1
	;;
#0:	       ldm.f	r1, -1
#1:	       sub	r1, 1 -> r0
#2:	       add	r5, r4 -> r1
#3:	       sub	r4, 1 -> r4
	;;
#0:	       brz ne	r4, .BB3_2
#1:	       sub	r1, 1 -> r1
	;;
#0:	       brz eq	r4, .BB3_14
#1:	       bbh	mzext8 r0 -> r0
	;;
#0:	       stmb.a	r0, r1, 0
	;;
	       nop	0
	;;
.BB3_3:
#0:	       cmpu lt	r4, 16 -> c1
	;;
#0:	if  c1 br @	.BB3_5
	;;
.BB3_4:
#0:	       or	r3, r5 -> r0
	;;
#0:	       and	r0, 3 -> r0
	;;
#0:	       brz eq @	r0, .BB3_6
	;;
.BB3_5:
#0:	       or	r3, 0 -> r2
#1:	       br @	.BB3_12
#2:	       or	r5, 0 -> r0
	;;
.BB3_6:
#0:	       cmpu gt	r4, 15 -> c1
	;;
#0:	if !c1 br @	.BB3_9
	;;
.BB3_7:
#0:	       or	r5, 0 -> r1
	;;
.BB3_8:                                 ; %.lr.ph10
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r3, 0
#1:	       sub	r4, 16 -> r4
#2:	       add	r1, 16 -> r0
#3:	       add	r3, 16 -> r2
	;;
#0:	       cmpu gt	r4, 15 -> c1
	;;
#0:	       stm.a	r31, r1, 0
	;;
#0:	       ldm.f	r3, 4
	;;
#0:	       stm.a	r31, r1, 1
	;;
#0:	       ldm.f	r3, 8
	;;
#0:	if !c1 br	.BB3_11
#1:	if  c1 br	.BB3_8
#2:	       stm.a	r31, r1, 2
	;;
#0:	       ldm.f	r3, 12
#1:	       or	r2, 0 -> r3
	;;
#0:	       stm.a	r31, r1, 3
#1:	       or	r0, 0 -> r1
	;;
.BB3_9:
#0:	       or	r3, 0 -> r2
#1:	       br @	.BB3_11
#2:	       or	r5, 0 -> r0
	;;
.BB3_10:                                ; %.lr.ph
                                        ;   in Loop: Header=BB3_11 Depth=1
#0:	       ldm.f	r2, 0
#1:	       add	r2, 4 -> r2
#2:	       sub	r4, 4 -> r4
	;;
#0:	       stm.a	r31, r0, 0
#1:	       add	r0, 4 -> r0
	;;
.BB3_11:                                ; %.preheader
                                        ; =>This Inner Loop Header: Depth=1
#0:	       cmpu gt	r4, 3 -> c1
	;;
#0:	if  c1 br @	.BB3_10
	;;
.BB3_12:                                ; %.preheader14
#0:	       brz eq @	r4, .BB3_14
	;;
.BB3_13:                                ; %.lr.ph18
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r2, 0
#1:	       sub	r4, 1 -> r4
	;;
#0:	       brz ne	r4, .BB3_13
#1:	       bbh	mzext8 r2 -> r1
#2:	       add	r2, 1 -> r2
	;;
#0:	       stmb.a	r1, r0, 0
#1:	       add	r0, 1 -> r0
	;;
	       nop	0
	;;
.BB3_14:                                ; %.loopexit
#0:	       or	r5, 0 -> r0
#1:	       jop	ret
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
_memmove_end:
.tmp3:
	.size	_memmove, .tmp3-_memmove

	.globl	_memset
	.type	_memset,@function
_memset:                                ; @memset
	.funsz	_memset_end-_memset
_memset_start:
; BB#0:
#0:	       or	r1, 0 -> r4
#1:	       br	.BB4_2
#2:	       or	r0, 0 -> r5
#3:	       ldi	0 -> r6
	;;
#0:	       bbh	zext8 r4 -> r3
	;;
	       nop	0
	;;
.BB4_1:                                 ;   in Loop: Header=BB4_2 Depth=1
#0:	       add	r6, 1 -> r6
#1:	       stmb.a	r4, r0, 0
	;;
.BB4_2:                                 ; =>This Inner Loop Header: Depth=1
#0:	       add	r5, r6 -> r0
	;;
#0:	       and	r0, 3 -> r1
	;;
#0:	       brz eq @	r1, .BB4_4
	;;
.BB4_3:                                 ;   in Loop: Header=BB4_2 Depth=1
#0:	       cmp eq	r2, r6 -> c1
	;;
#0:	if  c1 br @	.BB4_11
#1:	if !c1 br @	.BB4_1
	;;
.BB4_4:
#0:	       sub	r2, r6 -> r2
	;;
#0:	       cmpu lt	r2, 4 -> c1
	;;
#0:	if  c1 br @	.BB4_9
	;;
.BB4_5:
#0:	       sl	r3, 8 -> r0
#1:	       cmpu gt	r2, 15 -> c1
	;;
#0:	if !c1 br	.BB4_7
#1:	       or	r0, r3 -> r1
	;;
#0:	       sl	r1, 16 -> r0
	;;
#0:	       or	r0, r1 -> r1
#1:	       add	r5, r6 -> r0
	;;
.BB4_6:                                 ; %.lr.ph8
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sub	r2, 16 -> r2
#1:	       stm.a	r1, r0, 0
	;;
#0:	       cmpu gt	r2, 15 -> c1
#1:	       stm.a	r1, r0, 1
	;;
#0:	if !c1 br	.BB4_8
#1:	if  c1 br	.BB4_6
#2:	       stm.a	r1, r0, 2
	;;
#0:	       stm.a	r1, r0, 3
#1:	       add	r0, 16 -> r0
	;;
	       nop	0
	;;
.BB4_7:                                 ; %.lr.ph
#0:	       stm.a	r1, r0, 0
#1:	       add	r0, 4 -> r0
#2:	       sub	r2, 4 -> r2
	;;
.BB4_8:                                 ; %.lr.ph
#0:	       cmpu gt	r2, 3 -> c1
	;;
#0:	if  c1 br @	.BB4_7
	;;
.BB4_9:                                 ; %.preheader11
#0:	       brz eq @	r2, .BB4_11
	;;
.BB4_10:                                ; %.lr.ph14
                                        ; =>This Inner Loop Header: Depth=1
#0:	       stmb.a	r4, r0, 0
#1:	       add	r0, 1 -> r0
#2:	       sub	r2, 1 -> r2
	;;
#0:	       brz ne @	r2, .BB4_10
	;;
.BB4_11:                                ; %.loopexit
#0:	       or	r5, 0 -> r0
#1:	       jop	ret
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
_memset_end:
.tmp4:
	.size	_memset, .tmp4-_memset

	.type	_printf,@function
_printf:                                ; @printf
	.funsz	_printf_end-_printf
_printf_start:
; BB#0:
#0:	       wb.s	r15, 8
#1:	       addi	-32 -> r15
#2:	       ldx	$rb, 0 -> r5
#3:	       ldx	$ro, 0 -> r9
	;;
#0:	       stm.s	r5, r15, 3
#1:	       or	r0, 0 -> r4
#2:	       add	r15, 20 -> r0
	;;
#0:	       stm.s	r9, r15, 2
	;;
#0:	       ldmg.d	_impure_data+8
	;;
#0:	       stm.a	r0, r15, 1
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldm.f	r15, 4
	;;
#0:	       stm.a	r2, r15, 6
	;;
#0:	       stm.a	r1, r15, 5
#1:	       or	r4, 0 -> r1
#2:	       or	r31, 0 -> r2
	;;
#0:	       callg	__vfprintf_r
	;;
#0:	       stm.a	r3, r15, 7
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldm.s	r15, 8
	;;
#0:	       stx	r31 -> $ro
#1:	       ldm.s	r15, 12
#2:	       addi	32 -> r15
	;;
#0:	       stx	r31 -> $rb
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
.tmp5:
	.size	_printf, .tmp5-_printf

	.type	_sprintf,@function
_sprintf:                               ; @sprintf
	.funsz	_sprintf_end-_sprintf
_sprintf_start:
; BB#0:
#3:	       ldx	$f10 -> r3.30
#0:	       wb.s	r15, 128
#1:	       addi	-512 -> r15
#2:	       ldiu	384 -> r4
	;;
#0:	       ldx	$f11 -> r0.30
#1:	       add	r15, r4 -> r4
	;;
#1:	       ldx	$f12 -> r1.30
#0:	       stm.s	r10, r4, 23
	;;
#2:	       ldx	$f13 -> r2.30
#0:	       stm.s	r11, r4, 22
#1:	       ldiu	256 -> r11
	;;
#0:	       stm.s	r12, r4, 21
	;;
#0:	       stm.s	r13, r4, 20
	;;
#0:	       stm.s	r14, r4, 19
#1:	       ldiu	384 -> r14
	;;
#0:	       stm.s	r0.23, r4, 18
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
#2:	       stm.s	r2.26, r4, 4
	;;
#3:	       stm.s	r3.26, r4, 3
	;;
#0:	       stm.s	r0.27, r4, 2
	;;
#1:	       stm.s	r1.27, r4, 1
	;;
#2:	       stm.s	r2.27, r4, 0
#0:	       add	r15, r11 -> r4
	;;
#3:	       stm.s	r3.27, r4, 31
	;;
#0:	       stm.s	r0.28, r4, 30
	;;
#2:	       stm.s	r2.28, r4, 29
	;;
#3:	       stm.s	r3.28, r4, 28
	;;
#2:	       stm.s	r2.29, r4, 27
	;;
#3:	       stm.s	r3.29, r4, 26
	;;
#3:	       stm.s	r3.30, r4, 25
	;;
#0:	       stm.s	r0.30, r4, 24
#3:	       ldx	$rb, 0 -> r3.30
	;;
#1:	       stm.s	r1.30, r4, 23
#0:	       ldx	$ro, 0 -> r0.30
	;;
#2:	       stm.s	r2.30, r4, 22
	;;
#3:	       stm.s	r3.30, r4, 21
	;;
#0:	       stm.s	r0.30, r4, 20
#1:	       add	r15, r14 -> r4
	;;
#0:	       stm.a	r3, r4, 31
#1:	       s2add	r15, 16 -> r3
	;;
#0:	       stm.a	r1, r4, 29
#1:	       ldi	520 -> r1
	;;
#0:	       stmh.a	r1, r3, 10
#1:	       s2add	r15, 16 -> r3
	;;
#0:	       stm.a	r2, r4, 30
#1:	       ldiu	2047 -> r2
	;;
#0:	       ldim	1023 -> r2
#1:	       stm.a	r0, r15, 18
	;;
#0:	       stm.a	r0, r15, 22
#1:	       ldih	1023 -> r2
#2:	       ldiu	2047 -> r0
	;;
#0:	       stm.a	r2, r15, 20
#1:	       ldim	31 -> r0
	;;
#0:	       stm.a	r2, r15, 23
	;;
#0:	       stmh.a	r0, r3, 11
#1:	       ldiu	480 -> r0
#2:	       ldiu	128 -> r3
	;;
#0:	       add	r15, r0 -> r1
	;;
#0:	       add	r1, 20 -> r2
#1:	       add	r15, r3 -> r1
#2:	       ldga	._.str391 -> r3
	;;
#0:	       stm.a	r2, r1, 12
#1:	       ldga	._.str391 -> r2
#2:	       add	r3, 1 -> r11
	;;
#0:	       and	r2, 3 -> r0
#1:	       ldm.f	r15, 176
	;;
#0:	       cmp eq	r0, 0 -> c2
#1:	       and	r11, 3 -> r0
	;;
#0:	       cmp eq	r0, 0 -> c1
#1:	       or	r31, 0 -> r14
	;;
#0:	       comb	or c2, c1 -> c1
	;;
#0:	if !c1 br @	.BB6_6
	;;
.BB6_1:
#0:	       ldga	._.str391 -> r0
#1:	       ldiu	1791 -> r3
#2:	       ldga	32896 -> r2
	;;
#0:	       or	r0, 0 -> r4
#1:	       ldim	991 -> r3
#2:	       ldih	1028 -> r2
	;;
#0:	if !c2 add	r4, 1 -> r4 ; aiaf
#1:	       ldih	2039 -> r3
	;;
#0:	       ldm.f	r4, 0
	;;
#0:	       and	r31, r2 -> r0
#1:	       add	r31, r3 -> r1
	;;
#0:	       xor	r0, r2 -> r0
	;;
#0:	       and	r0, r1 -> r0
	;;
#0:	       brz ne @	r0, .BB6_3
	;;
.BB6_2:                                 ; %.lr.ph5.i.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r4, 4
#1:	       add	r4, 4 -> r4
	;;
#0:	       and	r31, r2 -> r0
#1:	       add	r31, r3 -> r1
	;;
#0:	       xor	r0, r2 -> r0
	;;
#0:	       and	r0, r1 -> r0
	;;
#0:	       brz eq @	r0, .BB6_2
	;;
.BB6_3:                                 ; %._crit_edge6.i.i
#0:	       ldm.f	r4, 0
	;;
#0:	       bbh	mzext8 r4 -> r0
	;;
#0:	       brz eq @	r0, .BB6_5
	;;
.BB6_4:                                 ; %.lr.ph.i2.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r4, 1
#1:	       add	r4, 1 -> r11
	;;
#0:	       or	r11, 0 -> r4
	;;
#0:	       bbh	mzext8 r11 -> r0
	;;
#0:	       brz ne @	r0, .BB6_4
	;;
#0:	       brz eq @	r0, .BB6_6
	;;
.BB6_5:
#0:	       or	r4, 0 -> r11
	;;
.BB6_6:                                 ; %strlen.exit.i
#0:	       ldiu	256 -> r1
#1:	       s2add	r15, 16 -> r3
#2:	       ldm.f	r15, 84
	;;
#0:	       add	r15, r1 -> r1
#1:	       add	r3, 8 -> r0
	;;
#0:	       stm.a	0, r1, 12
#1:	       bbh	mzext8 r0 -> r0
	;;
#0:	       btest	r0, 7 -> !c1
	;;
#0:	if  c1 br @	.BB6_10
	;;
.BB6_7:
#0:	       ldm.f	r15, 88
	;;
#0:	       brz ne @	r31, .BB6_10
	;;
.BB6_8:
#0:	       ldi	64 -> r10
#1:	       callg	__malloc_r
#2:	       ldi	64 -> r0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       cmp eq	r0, 0 -> c3
#1:	       stm.a	r0, r15, 18
	;;
#0:	if  c3 br @	.BB6_352
#1:	       stm.a	r0, r15, 22
	;;
.BB6_9:
#0:	       stm.a	r10, r15, 23
	;;
.BB6_10:
#0:	       ldi	31 -> r0.23
#3:	       ldi	17 -> r3.29
#2:	       ldi	16 -> r2.26
#1:	       ldi	88 -> r1.23
	;;
#0:	       ldi	102 -> r0.28
#1:	       ldi	37 -> r1.25
#2:	       ldi	0 -> r2.29
#3:	       ldiu	lo11{ ___mem_emergency } -> r3.30
	;;
#0:	       ldiu	224 -> r1
#1:	       ldiu	256 -> r2
#2:	       ldga	._.str391 -> r0
#3:	       ldiu	288 -> r3
	;;
#0:	       sub	r11, r0 -> r0.27
#1:	       add	r15, r1 -> r1
#2:	       ldga	._.str14 -> r0
#3:	       fop	dzero -> d6
	;;
#3:	       add	r1, 0 -> r3.28
#0:	       add	r15, r2 -> r1
#1:	       ldiu	192 -> r2
#2:	       fop	dzero -> d5
	;;
#3:	       stm.a	r3.28, r1, 8
	;;
#0:	       stm.a	0, r1, 10
#1:	       add	r15, r3 -> r1
#2:	       ldiu	288 -> r3
	;;
#0:	       add	r1, 0 -> r0.26
#1:	       stm.s	r0, r15, 15
#2:	       ldiu	288 -> r0
	;;
#0:	       or	r0.26, 4 -> r0.24
#1:	       add	r15, r0 -> r1
	;;
#2:	       add	r1, 20 -> r2.27
#0:	       stm.a	0, r0.24, 0
#1:	       add	r15, r2 -> r1
#3:	       ldiu	224 -> r2
	;;
#2:	       or	r2.27, 3 -> r0
	;;
#2:	       add	r1, 31 -> r2.28
#0:	       stm.s	r0, r15, 10
#1:	       add	r15, r3 -> r1
	;;
#2:	       or	r2.27, 2 -> r0
#1:	       add	r1, 24 -> r1.27
	;;
#0:	       stm.s	r0, r15, 7
#1:	       ldiu	320 -> r0
	;;
#0:	       add	r15, r0 -> r1
#1:	       ldiu	160 -> r0
	;;
#0:	       add	r1, 15 -> r1
	;;
#0:	       stm.s	r1, r15, 6
#1:	       add	r15, r2 -> r1
	;;
#0:	       add	r1, 0 -> r3
#1:	       add	r15, r0 -> r1
#2:	       ldiu	160 -> r0
	;;
#0:	       stm.s	r3, r15, 9
#1:	       ldiu	320 -> r3
#2:	       add	r1, 24 -> r2
	;;
#0:	       add	r15, r3 -> r1
#1:	       stm.s	r2, r15, 5
#2:	       ldi	0 -> r2
#3:	       ldi	0 -> r3
	;;
#1:	       add	r1, 4 -> r1.26
#0:	       s2add	r15, 16 -> r1
	;;
#1:	       add	r1, 8 -> r1.24
#0:	       add	r15, r0 -> r1
	;;
#0:	       add	r1, 20 -> r1
	;;
#0:	       br	.BB6_12
#1:	       stm.s	r1, r15, 8
	;;
#0:	       stm.s	r2, r15, 13
	;;
#0:	       stm.s	r3, r15, 12
	;;
.BB6_11:                                ;   in Loop: Header=BB6_12 Depth=1
#3:	       cmp gt	r3.23, r3.27 -> c1
#0:	       ldm.s	r15, 52
	;;
#3:	if  c1 or	r3.23, 0 -> r3.27
	;;
#0:	       or	r31, 0 -> r0
	;;
#3:	       add	r3.27, r0 -> r0
	;;
#0:	       stm.s	r0, r15, 13
	;;
#0:	       stm.a	0, r0.24, 0
	;;
.BB6_12:                                ; %.outer260.i
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB6_213 Depth 2
                                        ;     Child Loop BB6_91 Depth 2
                                        ;     Child Loop BB6_15 Depth 2
                                        ;       Child Loop BB6_29 Depth 3
                                        ;         Child Loop BB6_31 Depth 4
                                        ;           Child Loop BB6_37 Depth 5
                                        ;           Child Loop BB6_34 Depth 5
                                        ;       Child Loop BB6_17 Depth 3
                                        ;     Child Loop BB6_309 Depth 2
                                        ;     Child Loop BB6_306 Depth 2
                                        ;     Child Loop BB6_259 Depth 2
                                        ;     Child Loop BB6_303 Depth 2
                                        ;     Child Loop BB6_301 Depth 2
                                        ;     Child Loop BB6_278 Depth 2
                                        ;     Child Loop BB6_315 Depth 2
                                        ;     Child Loop BB6_322 Depth 2
                                        ;     Child Loop BB6_318 Depth 2
                                        ;     Child Loop BB6_344 Depth 2
                                        ;     Child Loop BB6_342 Depth 2
                                        ;     Child Loop BB6_333 Depth 2
                                        ;     Child Loop BB6_296 Depth 2
                                        ;     Child Loop BB6_292 Depth 2
                                        ;     Child Loop BB6_63 Depth 2
                                        ;     Child Loop BB6_82 Depth 2
                                        ;     Child Loop BB6_201 Depth 2
                                        ;     Child Loop BB6_174 Depth 2
                                        ;     Child Loop BB6_166 Depth 2
                                        ;     Child Loop BB6_142 Depth 2
                                        ;     Child Loop BB6_126 Depth 2
#3:	       or	r3.28, 0 -> r10
#0:	       br @	.BB6_15
	;;
.BB6_13:                                ;   in Loop: Header=BB6_15 Depth=2
#1:	       ldiu	lo11{ ___mem_emergency } -> r1.30
#0:	       ldm.f	r14, 0
	;;
#1:	       stm.a	r31, r1.30, 0
	;;
#0:	       ldm.s	r15, 52
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldmg.d	___mem_emergency
	;;
#0:	       stmh.a	r0, r31, 0
	;;
.BB6_14:                                ;   in Loop: Header=BB6_15 Depth=2
#0:	       add	r14, 4 -> r14
	;;
.BB6_15:                                ;   Parent Loop BB6_12 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB6_29 Depth 3
                                        ;         Child Loop BB6_31 Depth 4
                                        ;           Child Loop BB6_37 Depth 5
                                        ;           Child Loop BB6_34 Depth 5
                                        ;       Child Loop BB6_17 Depth 3
#0:	       ldi	0 -> r12
#1:	       br @	.BB6_17
	;;
.BB6_16:                                ;   in Loop: Header=BB6_17 Depth=3
#0:	       add	r12, 1 -> r12
	;;
.BB6_17:                                ;   Parent Loop BB6_12 Depth=1
                                        ;     Parent Loop BB6_15 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
#0:	       ldm.s	r15, 60
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldm.s	r15, 60
	;;
#0:	       add	r0, r12 -> r11
	;;
#0:	       or	r31, 0 -> r3
	;;
#0:	       ldmr.f	r12, r3, 0
	;;
#0:	       bbh	mzext8 r11 -> r1
	;;
#0:	       brz eq @	r1, .BB6_19
	;;
.BB6_18:                                ;   in Loop: Header=BB6_17 Depth=3
#0:	       bbh	zext8 r1 -> r0
	;;
#1:	       cmp eq	r0, r1.25 -> c1
	;;
#0:	if !c1 br @	.BB6_16
	;;
.BB6_19:                                ;   in Loop: Header=BB6_15 Depth=2
#0:	       brz eq @	r12, .BB6_25
	;;
.BB6_20:                                ;   in Loop: Header=BB6_15 Depth=2
#0:	       ldm.s	r15, 60
#1:	       ldiu	256 -> r1
	;;
#0:	       add	r15, r1 -> r1
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       stm.a	r0, r10, 0
	;;
#0:	       stm.a	r12, r10, 1
	;;
#0:	       ldm.f	r15, 296
	;;
#0:	       add	r31, r12 -> r3
	;;
#0:	       stm.a	r3, r1, 10
	;;
#0:	       ldm.f	r0.24, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#0:	       stm.a	r0, r0.24, 0
#1:	       cmp lt	r0, 8 -> c1
	;;
#0:	if  c1 br @	.BB6_23
	;;
.BB6_21:                                ;   in Loop: Header=BB6_15 Depth=2
#0:	       s2add	r15, 16 -> r10
#1:	       callg	___ssprint_r
#2:	       ldiu	288 -> r13
	;;
#0:	       add	r10, 8 -> r0
#1:	       add	r15, r13 -> r10
	;;
#0:	       add	r10, 0 -> r1
	;;
	       nop	0
	;;
#0:	       cmp ne	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB6_353
	;;
.BB6_22:                                ;   in Loop: Header=BB6_15 Depth=2
#0:	       ldiu	224 -> r0
#1:	       br	.BB6_24
	;;
#0:	       add	r15, r0 -> r0
	;;
#0:	       add	r0, 0 -> r10
	;;
.BB6_23:                                ;   in Loop: Header=BB6_15 Depth=2
#0:	       add	r10, 8 -> r10
	;;
.BB6_24:                                ;   in Loop: Header=BB6_15 Depth=2
#0:	       ldm.s	r15, 60
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       ldmr.f	r12, r0, 0
	;;
#0:	       bbh	mzext8 r11 -> r1
#1:	       ldm.s	r15, 52
	;;
#0:	       or	r31, 0 -> r3
	;;
#0:	       add	r12, r3 -> r0
	;;
#0:	       stm.s	r0, r15, 13
	;;
.BB6_25:                                ;   in Loop: Header=BB6_15 Depth=2
#0:	       bbh	zext8 r1 -> r0
	;;
#0:	       cmp eq	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB6_349
	;;
.BB6_26:                                ;   in Loop: Header=BB6_15 Depth=2
#2:	       ldi	-1 -> r2.25
#3:	       ldi	0 -> r3.24
#0:	       add	r11, 1 -> r0
#1:	       ldi	0 -> r3
	;;
#0:	       br	.BB6_29
#1:	       stm.s	r0, r15, 15
#2:	       ldi	0 -> r0
#3:	       ldiu	320 -> r1
	;;
#0:	       add	r15, r1 -> r1
	;;
#0:	       stmb.a	0, r1, 4
	;;
.BB6_27:                                ;   in Loop: Header=BB6_29 Depth=3
#3:	       or	r3.24, 16 -> r3.24
	;;
.BB6_28:                                ;   in Loop: Header=BB6_29 Depth=3
#3:	       or	r3.23, 0 -> r0
	;;
.BB6_29:                                ; %.backedge.i
                                        ;   Parent Loop BB6_12 Depth=1
                                        ;     Parent Loop BB6_15 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB6_31 Depth 4
                                        ;           Child Loop BB6_37 Depth 5
                                        ;           Child Loop BB6_34 Depth 5
#0:	       ldiu	lo11{ ___mem_emergency } -> r0.30
#1:	       ldm.s	r15, 60
	;;
#0:	       or	r31, 0 -> r1
	;;
#0:	       ldm.f	r1, 0
	;;
#0:	       stm.a	r31, r0.30, 0
	;;
#0:	       ldm.s	r15, 60
	;;
#0:	       or	r31, 0 -> r2
#1:	       ldmg.d	___mem_emergency
	;;
#0:	       br	.BB6_31
#1:	       bbh	msext8 r2 -> r11
#2:	       ldm.s	r15, 60
	;;
#0:	       or	r31, 0 -> r2
	;;
#0:	       add	r2, 1 -> r2
	;;
.BB6_30:                                ; %._crit_edge.i
                                        ;   in Loop: Header=BB6_31 Depth=4
#2:	       ldi	-1 -> r2.25
#0:	       cmp gt	r0, -1 -> c1
	;;
#2:	if  c1 or	r0, 0 -> r2.25
#3:	       or	r3.23, 0 -> r0
	;;
.BB6_31:                                ; %.loopexit82.i
                                        ;   Parent Loop BB6_12 Depth=1
                                        ;     Parent Loop BB6_15 Depth=2
                                        ;       Parent Loop BB6_29 Depth=3
                                        ; =>      This Loop Header: Depth=4
                                        ;           Child Loop BB6_37 Depth 5
                                        ;           Child Loop BB6_34 Depth 5
#0:	       cmp gt	r11, r0.23 -> c1
#3:	       or	r0, 0 -> r3.23
#1:	       or	r2, 0 -> r2
	;;
#0:	if !c1 br @	.BB6_56
#1:	       stm.s	r2, r15, 15
	;;
.BB6_32:                                ; %.loopexit82.i
                                        ;   in Loop: Header=BB6_31 Depth=4
#0:	       or	r11, 0 -> r2
	;;
#0:	       addi	-32 -> r2
	;;
#1:	       cmpu gt	r2, r1.23 -> c1
	;;
#0:	if  c1 br @	.BB6_57
	;;
.BB6_33:                                ; %.loopexit82.i
                                        ;   in Loop: Header=BB6_31 Depth=4
#0:	       ldga	.JTI6_0 -> r0.16
#1:	       ldga	._.str649 -> r1.16
#2:	       ldi	88 -> r1
#3:	       ldi	117 -> r4
	;;
#0:	       s2add	r0.16, r2 -> r2
#1:	       ldi	111 -> r13
#2:	       ldi	0 -> r0
	;;
#0:	       ldm.d	r2, 0
	;;
#0:	       jop	brind	r31
	;;
.BB6_34:                                ; %.preheader81.i
                                        ;   Parent Loop BB6_12 Depth=1
                                        ;     Parent Loop BB6_15 Depth=2
                                        ;       Parent Loop BB6_29 Depth=3
                                        ;         Parent Loop BB6_31 Depth=4
                                        ; =>        This Inner Loop Header: Depth=5
#1:	       ldiu	lo11{ ___mem_emergency } -> r1.30
#0:	       mul	r0, 10 -> $mul0.0
#2:	       ldm.s	r15, 60
	;;
#0:	       ldx	$mul0.0, r11 -> r0
	;;
#0:	       or	r31, 0 -> r1
#1:	       ldm.s	r15, 60
#2:	       addi	-48 -> r0
	;;
#0:	       add	r1, 1 -> r2
	;;
#0:	       or	r31, 0 -> r1
	;;
#0:	       ldm.f	r1, 0
	;;
#1:	       stm.a	r31, r1.30, 0
	;;
#0:	       ldm.s	r15, 60
	;;
#0:	       or	r31, 0 -> r1
#1:	       ldmg.d	___mem_emergency
	;;
#0:	       bbh	msext8 r1 -> r11
	;;
#0:	       or	r11, 0 -> r1
	;;
#0:	       addi	-48 -> r1
	;;
#0:	       cmpu lt	r1, 10 -> c1
#1:	       or	r2, 0 -> r1
	;;
#0:	if !c1 br @	.BB6_31
#1:	if  c1 br @	.BB6_34
#2:	       stm.s	r1, r15, 15
	;;
.BB6_35:                                ;   in Loop: Header=BB6_31 Depth=4
#2:	       ldiu	lo11{ ___mem_emergency } -> r2.30
#0:	       ldm.s	r15, 60
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       ldm.f	r0, 0
#1:	       ldi	42 -> r0
	;;
#2:	       stm.a	r31, r2.30, 0
	;;
#0:	       ldm.s	r15, 60
	;;
#0:	       or	r31, 0 -> r1
#1:	       ldmg.d	___mem_emergency
	;;
#0:	       bbh	mzext8 r1 -> r1
#1:	       ldm.s	r15, 60
	;;
#0:	       cmp eq	r1, r0 -> c1
	;;
#0:	if  c1 br	.BB6_50
#1:	       or	r31, 0 -> r2
	;;
#0:	       add	r2, 1 -> r2
	;;
	       nop	0
	;;
.BB6_36:                                ; %.preheader86.i
                                        ;   in Loop: Header=BB6_31 Depth=4
#0:	       bbh	sext8 r1 -> r11
#1:	       ldi	0 -> r0
	;;
#0:	       or	r11, 0 -> r1
	;;
#0:	       addi	-48 -> r1
	;;
#0:	       cmpu lt	r1, 10 -> c1
	;;
#0:	if !c1 br @	.BB6_30
	;;
.BB6_37:                                ; %.lr.ph.i
                                        ;   Parent Loop BB6_12 Depth=1
                                        ;     Parent Loop BB6_15 Depth=2
                                        ;       Parent Loop BB6_29 Depth=3
                                        ;         Parent Loop BB6_31 Depth=4
                                        ; =>        This Inner Loop Header: Depth=5
#1:	       mul	r0, 10 -> $mul1.0
#0:	       ldm.f	r2, 0
#2:	       add	r2, 1 -> r4
	;;
#1:	       ldx	$mul1.0, r1 -> r0
	;;
#0:	       bbh	msext8 r2 -> r11
#1:	       or	r4, 0 -> r2
	;;
#0:	       or	r11, 0 -> r1
	;;
#0:	       addi	-48 -> r1
	;;
#0:	       cmpu lt	r1, 10 -> c1
	;;
#0:	if !c1 br @	.BB6_30
#1:	if  c1 br @	.BB6_37
	;;
.BB6_38:                                ;   in Loop: Header=BB6_29 Depth=3
#3:	       or	r3.23, 0 -> r0
#0:	       bbh	zext8 r3 -> r1
	;;
#0:	       brz ne @	r1, .BB6_29
	;;
.BB6_39:                                ;   in Loop: Header=BB6_29 Depth=3
#0:	       ldi	32 -> r3
#1:	       br @	.BB6_45
	;;
.BB6_40:                                ;   in Loop: Header=BB6_29 Depth=3
#3:	       or	r3.24, 1 -> r3.24
#0:	       br @	.BB6_28
	;;
.BB6_41:                                ;   in Loop: Header=BB6_29 Depth=3
#0:	       ldm.f	r14, 0
#1:	       add	r14, 4 -> r2
	;;
#0:	       or	r2, 0 -> r14
	;;
#0:	       cmp gt	r31, -1 -> c1
#1:	       or	r31, 0 -> r0
	;;
#0:	if  c1 br @	.BB6_29
	;;
.BB6_42:                                ;   in Loop: Header=BB6_29 Depth=3
#0:	       ldi	0 -> r1
#1:	       or	r2, 0 -> r14
	;;
#3:	       sub	r1, r0 -> r3.23
	;;
.BB6_43:                                ; %.loopexit92.i
                                        ;   in Loop: Header=BB6_29 Depth=3
#3:	       or	r3.24, 4 -> r3.24
#0:	       br @	.BB6_28
	;;
.BB6_44:                                ;   in Loop: Header=BB6_29 Depth=3
#0:	       ldi	43 -> r3
	;;
.BB6_45:                                ;   in Loop: Header=BB6_29 Depth=3
#0:	       ldiu	320 -> r1
#1:	       br	.BB6_28
	;;
#0:	       add	r15, r1 -> r1
	;;
#0:	       stmb.a	r3, r1, 4
	;;
.BB6_46:                                ;   in Loop: Header=BB6_29 Depth=3
#0:	       ldi	128 -> r0
#1:	       br @	.BB6_49
	;;
.BB6_47:                                ;   in Loop: Header=BB6_29 Depth=3
#3:	       or	r3.24, 8 -> r3.24
#0:	       br @	.BB6_28
	;;
.BB6_48:                                ;   in Loop: Header=BB6_29 Depth=3
#0:	       ldi	64 -> r0
	;;
.BB6_49:                                ;   in Loop: Header=BB6_29 Depth=3
#3:	       or	r3.24, r0 -> r3.24
#0:	       br @	.BB6_28
	;;
.BB6_50:                                ;   in Loop: Header=BB6_29 Depth=3
#2:	       ldi	-1 -> r2.25
#3:	       or	r3.23, 0 -> r0
#0:	       ldm.f	r14, 0
#1:	       add	r14, 4 -> r14
	;;
#0:	       br	.BB6_29
#1:	       or	r2, 0 -> r1
	;;
#0:	       cmp gt	r31, -1 -> c1
#1:	       stm.s	r1, r15, 15
	;;
#2:	if  c1 or	r31, 0 -> r2.25
	;;
.BB6_51:                                ;   in Loop: Header=BB6_15 Depth=2
#3:	       btest	r3.24, 4 -> !c1
	;;
#0:	if !c1 br @	.BB6_54
	;;
.BB6_52:                                ;   in Loop: Header=BB6_15 Depth=2
#3:	       btest	r3.24, 6 -> !c1
	;;
#0:	if !c1 br @	.BB6_13
	;;
.BB6_53:                                ;   in Loop: Header=BB6_15 Depth=2
#2:	       ldiu	lo11{ ___mem_emergency } -> r2.30
#0:	       br	.BB6_55
#1:	       ldm.f	r14, 0
	;;
#2:	       stm.a	r31, r2.30, 0
	;;
	       nop	0
	;;
.BB6_54:                                ;   in Loop: Header=BB6_15 Depth=2
#0:	       ldiu	lo11{ ___mem_emergency } -> r0.30
#1:	       ldm.f	r14, 0
	;;
#0:	       stm.a	r31, r0.30, 0
	;;
.BB6_55:                                ;   in Loop: Header=BB6_15 Depth=2
#0:	       ldm.s	r15, 52
#1:	       br	.BB6_14
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldmg.d	___mem_emergency
	;;
#0:	       stm.a	r0, r31, 0
	;;
.BB6_56:                                ; %.loopexit82.i
                                        ;   in Loop: Header=BB6_12 Depth=1
#0:	       cmp eq	r11, 0 -> c3
	;;
#0:	if  c3 br @	.BB6_349
	;;
.BB6_57:                                ;   in Loop: Header=BB6_12 Depth=1
#2:	       ldi	0 -> r2.23
#0:	       ldiu	160 -> r1
#1:	       ldiu	320 -> r3
	;;
#2:	       ldi	1 -> r2.24
#0:	       add	r15, r1 -> r1
	;;
#2:	       or	r2.23, 0 -> r12
#0:	       stmb.a	r11, r1, 24
#1:	       add	r15, r3 -> r1
	;;
#0:	       stmb.a	0, r1, 4
	;;
#0:	       ldm.s	r15, 20
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       stm.s	r0, r15, 14
	;;
.BB6_58:                                ;   in Loop: Header=BB6_12 Depth=1
#0:	       or	r11, 0 -> r13
	;;
.BB6_59:                                ; %._crit_edge644.i
                                        ;   in Loop: Header=BB6_12 Depth=1
#2:	       cmp gt	r12, r2.24 -> c1
#3:	       and	r3.24, 2 -> r3.25
#0:	       ldm.f	r15, 324
	;;
#2:	       or	r2.24, 0 -> r0
	;;
#1:	       bbh	mzext8 r1.26 -> r1
#0:	if  c1 or	r12, 0 -> r0
	;;
#0:	       cmp ne	r1, 0 -> c2
#1:	       or	r0, 0 -> r1
	;;
#0:	if  c2 add	r1, 1 -> r1
	;;
#3:	       add	r1, 2 -> r3.27
	;;
#3:	       sr	r3.25, 1 -> r1
	;;
#0:	       btest	r1, 0 -> c1
#1:	       ldx	$c2 -> r1
	;;
#3:	if !c1 add	r1, r0 -> r3.27 ; aaaf
#0:	       ldi	132 -> r0
	;;
#3:	       and	r3.24, r0 -> r3.26
	;;
#3:	       brz ne @	r3.26, .BB6_69
	;;
.BB6_60:                                ;   in Loop: Header=BB6_12 Depth=1
#3:	       sub	r3.23, r3.27 -> r11
	;;
#0:	       cmp lt	r11, 1 -> c1
	;;
#0:	if !c1 br @	.BB6_63
#1:	if  c1 br @	.BB6_69
	;;
.BB6_61:                                ;   in Loop: Header=BB6_63 Depth=2
#0:	       add	r10, 8 -> r10
	;;
.BB6_62:                                ;   in Loop: Header=BB6_63 Depth=2
#0:	       sub	r11, 16 -> r11
	;;
.BB6_63:                                ; %.preheader58.i
                                        ;   Parent Loop BB6_12 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#3:	       cmp lt	r11, r3.29 -> c1
#0:	       ldga	__svfprintf_r.blanks -> r0
	;;
#0:	if  c1 br @	.BB6_66
#1:	       stm.a	r0, r10, 0
	;;
.BB6_64:                                ;   in Loop: Header=BB6_63 Depth=2
#2:	       stm.a	r2.26, r10, 1
#0:	       ldiu	256 -> r1
	;;
#0:	       ldm.f	r15, 296
#1:	       add	r15, r1 -> r1
	;;
#0:	       add	r31, 16 -> r0
	;;
#0:	       stm.a	r0, r1, 10
	;;
#0:	       ldm.f	r0.24, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#0:	       stm.a	r0, r0.24, 0
#1:	       cmp lt	r0, 8 -> c1
	;;
#0:	if  c1 br @	.BB6_61
	;;
.BB6_65:                                ;   in Loop: Header=BB6_63 Depth=2
#1:	       or	r1.24, 0 -> r0
#2:	       callg	___ssprint_r
#0:	       or	r0.26, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz eq @	r0, .BB6_62
#3:	       or	r3.28, 0 -> r10
	;;
#0:	       br @	.BB6_353
	;;
.BB6_66:                                ;   in Loop: Header=BB6_12 Depth=1
#0:	       stm.a	r11, r10, 1
#1:	       ldiu	256 -> r1
	;;
#0:	       ldm.f	r15, 296
#1:	       add	r15, r1 -> r1
	;;
#0:	       add	r31, r11 -> r0
	;;
#0:	       stm.a	r0, r1, 10
	;;
#0:	       ldm.f	r0.24, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#0:	       stm.a	r0, r0.24, 0
#1:	       cmp gt	r0, 7 -> c1
	;;
#0:	if !c1 br @	.BB6_68
	;;
.BB6_67:                                ;   in Loop: Header=BB6_12 Depth=1
#1:	       or	r1.24, 0 -> r0
#2:	       callg	___ssprint_r
#0:	       or	r0.26, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz eq @	r0, .BB6_69
#3:	       or	r3.28, 0 -> r10
	;;
#0:	       br @	.BB6_353
	;;
.BB6_68:                                ; %._crit_edge641.i
                                        ;   in Loop: Header=BB6_12 Depth=1
#0:	       add	r10, 8 -> r10
	;;
.BB6_69:                                ; %._crit_edge642.i
                                        ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldm.f	r15, 324
	;;
#1:	       bbh	mzext8 r1.26 -> r0
	;;
#0:	       brz eq @	r0, .BB6_74
	;;
.BB6_70:                                ;   in Loop: Header=BB6_12 Depth=1
#1:	       stm.a	r1.26, r10, 0
#0:	       ldiu	256 -> r1
	;;
#0:	       stm.a	1, r10, 1
#1:	       add	r15, r1 -> r1
	;;
#0:	       ldm.f	r15, 296
	;;
#0:	       add	r31, 1 -> r0
	;;
#0:	       stm.a	r0, r1, 10
	;;
#0:	       ldm.f	r0.24, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#0:	       stm.a	r0, r0.24, 0
#1:	       cmp lt	r0, 8 -> c1
	;;
#0:	if  c1 br @	.BB6_73
	;;
.BB6_71:                                ;   in Loop: Header=BB6_12 Depth=1
#0:	       s2add	r15, 16 -> r10
#1:	       callg	___ssprint_r
#2:	       ldiu	288 -> r11
	;;
#0:	       add	r10, 8 -> r0
#1:	       add	r15, r11 -> r10
	;;
#0:	       add	r10, 0 -> r1
	;;
	       nop	0
	;;
#0:	       cmp ne	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB6_353
	;;
.BB6_72:                                ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldiu	224 -> r0
#1:	       br	.BB6_74
	;;
#0:	       add	r15, r0 -> r0
	;;
#0:	       add	r0, 0 -> r10
	;;
.BB6_73:                                ;   in Loop: Header=BB6_12 Depth=1
#0:	       add	r10, 8 -> r10
	;;
.BB6_74:                                ;   in Loop: Header=BB6_12 Depth=1
#3:	       brz eq @	r3.25, .BB6_78
	;;
.BB6_75:                                ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldm.s	r15, 32
#1:	       ldiu	256 -> r1
	;;
#0:	       add	r15, r1 -> r1
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       stm.a	r0, r10, 0
	;;
#0:	       stm.a	2, r10, 1
	;;
#0:	       ldm.f	r15, 296
	;;
#0:	       add	r31, 2 -> r3
	;;
#0:	       stm.a	r3, r1, 10
	;;
#0:	       ldm.f	r0.24, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#0:	       stm.a	r0, r0.24, 0
#1:	       cmp lt	r0, 8 -> c1
	;;
#0:	if  c1 br @	.BB6_77
	;;
.BB6_76:                                ;   in Loop: Header=BB6_12 Depth=1
#1:	       or	r1.24, 0 -> r0
#2:	       callg	___ssprint_r
#0:	       or	r0.26, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz eq @	r0, .BB6_78
#3:	       or	r3.28, 0 -> r10
	;;
#0:	       br @	.BB6_353
	;;
.BB6_77:                                ;   in Loop: Header=BB6_12 Depth=1
#0:	       add	r10, 8 -> r10
	;;
.BB6_78:                                ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldi	128 -> r0
	;;
#3:	       cmp ne	r3.26, r0 -> c1
	;;
#0:	if  c1 br @	.BB6_88
	;;
.BB6_79:                                ;   in Loop: Header=BB6_12 Depth=1
#3:	       sub	r3.23, r3.27 -> r11
	;;
#0:	       cmp lt	r11, 1 -> c1
	;;
#0:	if !c1 br @	.BB6_82
#1:	if  c1 br @	.BB6_88
	;;
.BB6_80:                                ;   in Loop: Header=BB6_82 Depth=2
#0:	       add	r10, 8 -> r10
	;;
.BB6_81:                                ;   in Loop: Header=BB6_82 Depth=2
#0:	       sub	r11, 16 -> r11
	;;
.BB6_82:                                ; %.preheader52.i
                                        ;   Parent Loop BB6_12 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#3:	       cmp lt	r11, r3.29 -> c1
#0:	       ldga	__svfprintf_r.zeroes -> r0
	;;
#0:	if  c1 br @	.BB6_85
#1:	       stm.a	r0, r10, 0
	;;
.BB6_83:                                ;   in Loop: Header=BB6_82 Depth=2
#2:	       stm.a	r2.26, r10, 1
#0:	       ldiu	256 -> r1
	;;
#0:	       ldm.f	r15, 296
#1:	       add	r15, r1 -> r1
	;;
#0:	       add	r31, 16 -> r0
	;;
#0:	       stm.a	r0, r1, 10
	;;
#0:	       ldm.f	r0.24, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#0:	       stm.a	r0, r0.24, 0
#1:	       cmp lt	r0, 8 -> c1
	;;
#0:	if  c1 br @	.BB6_80
	;;
.BB6_84:                                ;   in Loop: Header=BB6_82 Depth=2
#1:	       or	r1.24, 0 -> r0
#2:	       callg	___ssprint_r
#0:	       or	r0.26, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz eq @	r0, .BB6_81
#3:	       or	r3.28, 0 -> r10
	;;
#0:	       br @	.BB6_353
	;;
.BB6_85:                                ;   in Loop: Header=BB6_12 Depth=1
#0:	       stm.a	r11, r10, 1
#1:	       ldiu	256 -> r1
	;;
#0:	       ldm.f	r15, 296
#1:	       add	r15, r1 -> r1
	;;
#0:	       add	r31, r11 -> r0
	;;
#0:	       stm.a	r0, r1, 10
	;;
#0:	       ldm.f	r0.24, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#0:	       stm.a	r0, r0.24, 0
#1:	       cmp lt	r0, 8 -> c1
	;;
#0:	if  c1 br @	.BB6_87
	;;
.BB6_86:                                ;   in Loop: Header=BB6_12 Depth=1
#1:	       or	r1.24, 0 -> r0
#2:	       callg	___ssprint_r
#0:	       or	r0.26, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz eq @	r0, .BB6_88
#3:	       or	r3.28, 0 -> r10
	;;
#0:	       br @	.BB6_353
	;;
.BB6_87:                                ;   in Loop: Header=BB6_12 Depth=1
#0:	       add	r10, 8 -> r10
	;;
.BB6_88:                                ;   in Loop: Header=BB6_12 Depth=1
#2:	       sub	r12, r2.24 -> r11
	;;
#0:	       cmp lt	r11, 1 -> c1
	;;
#0:	if !c1 br @	.BB6_91
#1:	if  c1 br @	.BB6_97
	;;
.BB6_89:                                ;   in Loop: Header=BB6_91 Depth=2
#0:	       add	r10, 8 -> r10
	;;
.BB6_90:                                ;   in Loop: Header=BB6_91 Depth=2
#0:	       sub	r11, 16 -> r11
	;;
.BB6_91:                                ; %.preheader46.i
                                        ;   Parent Loop BB6_12 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#3:	       cmp lt	r11, r3.29 -> c1
#0:	       ldga	__svfprintf_r.zeroes -> r0
	;;
#0:	if  c1 br @	.BB6_94
#1:	       stm.a	r0, r10, 0
	;;
.BB6_92:                                ;   in Loop: Header=BB6_91 Depth=2
#2:	       stm.a	r2.26, r10, 1
#0:	       ldiu	256 -> r1
	;;
#0:	       ldm.f	r15, 296
#1:	       add	r15, r1 -> r1
	;;
#0:	       add	r31, 16 -> r0
	;;
#0:	       stm.a	r0, r1, 10
	;;
#0:	       ldm.f	r0.24, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#0:	       stm.a	r0, r0.24, 0
#1:	       cmp lt	r0, 8 -> c1
	;;
#0:	if  c1 br @	.BB6_89
	;;
.BB6_93:                                ;   in Loop: Header=BB6_91 Depth=2
#1:	       or	r1.24, 0 -> r0
#2:	       callg	___ssprint_r
#0:	       or	r0.26, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz eq @	r0, .BB6_90
#3:	       or	r3.28, 0 -> r10
	;;
#0:	       br @	.BB6_353
	;;
.BB6_94:                                ;   in Loop: Header=BB6_12 Depth=1
#0:	       stm.a	r11, r10, 1
#1:	       ldiu	256 -> r1
	;;
#0:	       ldm.f	r15, 296
#1:	       add	r15, r1 -> r1
	;;
#0:	       add	r31, r11 -> r0
	;;
#0:	       stm.a	r0, r1, 10
	;;
#0:	       ldm.f	r0.24, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#0:	       stm.a	r0, r0.24, 0
#1:	       cmp lt	r0, 8 -> c1
	;;
#0:	if  c1 br @	.BB6_96
	;;
.BB6_95:                                ;   in Loop: Header=BB6_12 Depth=1
#1:	       or	r1.24, 0 -> r0
#2:	       callg	___ssprint_r
#0:	       or	r0.26, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz eq @	r0, .BB6_97
#3:	       or	r3.28, 0 -> r10
	;;
#0:	       br @	.BB6_353
	;;
.BB6_96:                                ;   in Loop: Header=BB6_12 Depth=1
#0:	       add	r10, 8 -> r10
	;;
.BB6_97:                                ;   in Loop: Header=BB6_12 Depth=1
#3:	       btest	r3.24, 8 -> c1
	;;
#0:	if  c1 br @	.BB6_100
	;;
.BB6_98:                                ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldm.s	r15, 56
#1:	       ldiu	256 -> r1
	;;
#0:	       add	r15, r1 -> r1
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       stm.a	r0, r10, 0
	;;
#2:	       stm.a	r2.24, r10, 1
	;;
#0:	       ldm.f	r15, 296
	;;
#2:	       add	r31, r2.24 -> r0
	;;
#0:	       stm.a	r0, r1, 10
	;;
#0:	       ldm.f	r0.24, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#0:	       stm.a	r0, r0.24, 0
#1:	       cmp lt	r0, 8 -> c1
	;;
#0:	if  c1 br @	.BB6_104
	;;
.BB6_99:                                ;   in Loop: Header=BB6_12 Depth=1
#1:	       or	r1.24, 0 -> r0
#2:	       callg	___ssprint_r
#0:	       or	r0.26, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#3:	       or	r3.28, 0 -> r10
#0:	       cmp eq	r0, 0 -> c3
	;;
#0:	if !c3 br @	.BB6_353
#1:	if  c3 br @	.BB6_209
	;;
.BB6_100:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       cmp lt	r13, r0.28 -> c1
	;;
#0:	if  c1 br @	.BB6_107
	;;
.BB6_101:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       fop	dcmp	d5, d6 -> f0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r0
	;;
#0:	       btest	r0, 9 -> c1
	;;
#0:	if  c1 br @	.BB6_111
	;;
.BB6_102:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldga	._.str277 -> r0
#1:	       ldiu	256 -> r1
	;;
#0:	       stm.a	r0, r10, 0
#1:	       add	r15, r1 -> r1
	;;
#0:	       stm.a	1, r10, 1
	;;
#0:	       ldm.f	r15, 296
	;;
#0:	       add	r31, 1 -> r3
	;;
#0:	       stm.a	r3, r1, 10
	;;
#0:	       ldm.f	r0.24, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#0:	       stm.a	r0, r0.24, 0
#1:	       cmp lt	r0, 8 -> c1
	;;
#0:	if  c1 br @	.BB6_130
	;;
.BB6_103:                               ;   in Loop: Header=BB6_12 Depth=1
#1:	       or	r1.24, 0 -> r0
#2:	       callg	___ssprint_r
#0:	       or	r0.26, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#3:	       or	r3.28, 0 -> r10
#0:	       cmp eq	r0, 0 -> c3
	;;
#0:	if !c3 br @	.BB6_353
#1:	if  c3 br @	.BB6_131
	;;
.BB6_104:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       add	r10, 8 -> r10
#1:	       br @	.BB6_209
	;;
.BB6_105:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldm.s	r15, 56
#1:	       ldiu	256 -> r1
	;;
#0:	       add	r15, r1 -> r1
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       stm.a	r0, r10, 0
	;;
#0:	       stm.a	1, r10, 1
	;;
#0:	       ldm.f	r15, 296
	;;
#0:	       add	r31, 1 -> r3
	;;
#0:	       stm.a	r3, r1, 10
	;;
#0:	       ldm.f	r0.24, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#0:	       stm.a	r0, r0.24, 0
#1:	       cmp lt	r0, 8 -> c1
	;;
#0:	if !c1 br @	.BB6_155
	;;
.BB6_106:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       add	r10, 8 -> r1
#1:	       br @	.BB6_157
	;;
.BB6_107:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldm.f	r15, 304
	;;
#0:	       cmp gt	r31, 1 -> c1
	;;
#3:	if !c1 btest	r3.24, 0 -> c1
	;;
#0:	if !c1 br @	.BB6_105
	;;
.BB6_108:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldm.s	r15, 56
#1:	       ldiu	256 -> r1
	;;
#0:	       add	r15, r1 -> r1
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       stm.a	r0, r10, 0
	;;
#0:	       stm.a	1, r10, 1
	;;
#0:	       ldm.f	r15, 296
	;;
#0:	       add	r31, 1 -> r3
	;;
#0:	       stm.a	r3, r1, 10
	;;
#0:	       ldm.f	r0.24, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#0:	       stm.a	r0, r0.24, 0
#1:	       cmp lt	r0, 8 -> c1
	;;
#0:	if  c1 br @	.BB6_115
	;;
.BB6_109:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       s2add	r15, 16 -> r10
#1:	       callg	___ssprint_r
#2:	       ldiu	288 -> r13
	;;
#0:	       add	r10, 8 -> r0
#1:	       add	r15, r13 -> r10
	;;
#0:	       add	r10, 0 -> r1
	;;
	       nop	0
	;;
#0:	       cmp ne	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB6_353
	;;
.BB6_110:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldiu	224 -> r1
#1:	       br	.BB6_116
	;;
#0:	       add	r15, r1 -> r1
	;;
#0:	       add	r1, 0 -> r0
	;;
.BB6_111:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldm.f	r15, 316
	;;
#0:	       cmp gt	r31, 0 -> c3
	;;
#0:	if  c3 br @	.BB6_134
	;;
.BB6_112:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldga	._.str277 -> r0
#1:	       ldiu	256 -> r1
	;;
#0:	       stm.a	r0, r10, 0
#1:	       add	r15, r1 -> r1
	;;
#0:	       stm.a	1, r10, 1
	;;
#0:	       ldm.f	r15, 296
	;;
#0:	       add	r31, 1 -> r3
	;;
#0:	       stm.a	r3, r1, 10
	;;
#0:	       ldm.f	r0.24, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#0:	       stm.a	r0, r0.24, 0
#1:	       cmp lt	r0, 8 -> c1
	;;
#0:	if  c1 br @	.BB6_146
	;;
.BB6_113:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       s2add	r15, 16 -> r10
#1:	       callg	___ssprint_r
#2:	       ldiu	288 -> r13
	;;
#0:	       add	r10, 8 -> r0
#1:	       add	r15, r13 -> r10
	;;
#0:	       add	r10, 0 -> r1
	;;
	       nop	0
	;;
#0:	       cmp ne	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB6_353
	;;
.BB6_114:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldiu	224 -> r0
#1:	       br	.BB6_147
	;;
#0:	       add	r15, r0 -> r0
	;;
#0:	       add	r0, 0 -> r10
	;;
.BB6_115:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       add	r10, 8 -> r0
	;;
.BB6_116:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldga	._.str391 -> r1
#1:	       ldiu	256 -> r2
	;;
#0:	       stm.a	r1, r0, 0
#1:	       add	r15, r2 -> r2
	;;
#0:	       stm.a	r0.27, r0, 1
	;;
#0:	       ldm.f	r15, 296
	;;
#0:	       add	r31, r0.27 -> r1
	;;
#0:	       stm.a	r1, r2, 10
	;;
#0:	       ldm.f	r0.24, 0
	;;
#0:	       add	r31, 1 -> r1
	;;
#0:	       stm.a	r1, r0.24, 0
#1:	       cmp lt	r1, 8 -> c1
	;;
#0:	if  c1 br @	.BB6_119
	;;
.BB6_117:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       s2add	r15, 16 -> r10
#1:	       callg	___ssprint_r
#2:	       ldiu	288 -> r13
	;;
#0:	       add	r10, 8 -> r0
#1:	       add	r15, r13 -> r10
	;;
#0:	       add	r10, 0 -> r1
	;;
	       nop	0
	;;
#0:	       cmp ne	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB6_353
	;;
.BB6_118:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldiu	224 -> r0
#1:	       br	.BB6_120
	;;
#0:	       add	r15, r0 -> r0
	;;
#0:	       add	r0, 0 -> r1
	;;
.BB6_119:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       add	r0, 8 -> r1
	;;
.BB6_120:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       fop	dcmp	d5, d6 -> f0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r0
	;;
#0:	       btest	r0, 0 -> c1
	;;
#0:	if  c1 br @	.BB6_123
	;;
.BB6_121:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldm.s	r15, 56
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       add	r0, 1 -> r0
	;;
#0:	       stm.a	r0, r1, 0
	;;
#0:	       ldm.f	r15, 304
	;;
#0:	       sub	r31, 1 -> r2
	;;
#0:	       stm.a	r2, r1, 1
#1:	       ldiu	256 -> r2
	;;
#0:	       ldm.f	r15, 296
#1:	       add	r15, r2 -> r2
	;;
#0:	       or	r31, 0 -> r3
#1:	       ldm.f	r15, 304
	;;
#0:	       add	r31, r3 -> r0
	;;
#0:	       sub	r0, 1 -> r0
	;;
#0:	       stm.a	r0, r2, 10
	;;
#0:	       ldm.f	r0.24, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#0:	       stm.a	r0, r0.24, 0
#1:	       cmp lt	r0, 8 -> c1
	;;
#0:	if !c1 br @	.BB6_155
	;;
.BB6_122:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       add	r1, 8 -> r1
#1:	       br @	.BB6_157
	;;
.BB6_123:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldm.f	r15, 304
	;;
#0:	       sub	r31, 1 -> r10
	;;
#0:	       cmp lt	r10, 1 -> c1
	;;
#0:	if !c1 br @	.BB6_126
#1:	if  c1 br @	.BB6_157
	;;
.BB6_124:                               ;   in Loop: Header=BB6_126 Depth=2
#0:	       add	r1, 8 -> r1
	;;
.BB6_125:                               ;   in Loop: Header=BB6_126 Depth=2
#0:	       sub	r10, 16 -> r10
	;;
.BB6_126:                               ; %.preheader40.i
                                        ;   Parent Loop BB6_12 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#3:	       cmp lt	r10, r3.29 -> c1
#0:	       ldga	__svfprintf_r.zeroes -> r0
	;;
#0:	if  c1 br @	.BB6_153
#1:	       stm.a	r0, r1, 0
	;;
.BB6_127:                               ;   in Loop: Header=BB6_126 Depth=2
#2:	       stm.a	r2.26, r1, 1
#0:	       ldiu	256 -> r2
	;;
#0:	       ldm.f	r15, 296
#1:	       add	r15, r2 -> r2
	;;
#0:	       add	r31, 16 -> r0
	;;
#0:	       stm.a	r0, r2, 10
	;;
#0:	       ldm.f	r0.24, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#0:	       stm.a	r0, r0.24, 0
#1:	       cmp lt	r0, 8 -> c1
	;;
#0:	if  c1 br @	.BB6_124
	;;
.BB6_128:                               ;   in Loop: Header=BB6_126 Depth=2
#0:	       s2add	r15, 16 -> r11
#1:	       callg	___ssprint_r
#2:	       ldiu	288 -> r13
	;;
#0:	       add	r11, 8 -> r0
#1:	       add	r15, r13 -> r11
	;;
#0:	       add	r11, 0 -> r1
	;;
	       nop	0
	;;
#0:	       cmp ne	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB6_353
	;;
.BB6_129:                               ;   in Loop: Header=BB6_126 Depth=2
#0:	       ldiu	224 -> r0
#1:	       br	.BB6_125
	;;
#0:	       add	r15, r0 -> r0
	;;
#0:	       add	r0, 0 -> r1
	;;
.BB6_130:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       add	r10, 8 -> r10
	;;
.BB6_131:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldm.f	r15, 304
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldm.f	r15, 316
	;;
#0:	       cmp lt	r31, r0 -> c1
	;;
#3:	if !c1 btest	r3.24, 0 -> c1
	;;
#0:	if !c1 br @	.BB6_209
	;;
.BB6_132:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldga	._.str391 -> r0
#1:	       ldiu	256 -> r1
	;;
#0:	       stm.a	r0, r10, 0
#1:	       add	r15, r1 -> r1
	;;
#0:	       stm.a	r0.27, r10, 1
	;;
#0:	       ldm.f	r15, 296
	;;
#0:	       add	r31, r0.27 -> r0
	;;
#0:	       stm.a	r0, r1, 10
	;;
#0:	       ldm.f	r0.24, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#0:	       stm.a	r0, r0.24, 0
#1:	       cmp lt	r0, 8 -> c1
	;;
#0:	if  c1 br @	.BB6_138
	;;
.BB6_133:                               ;   in Loop: Header=BB6_12 Depth=1
#1:	       or	r1.24, 0 -> r0
#2:	       callg	___ssprint_r
#0:	       or	r0.26, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz eq @	r0, .BB6_139
#3:	       or	r3.28, 0 -> r10
	;;
#0:	       br @	.BB6_353
	;;
.BB6_134:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldm.f	r15, 304
	;;
#2:	       cmp gt	r31, r2.23 -> c1
#0:	       or	r31, 0 -> r11
	;;
#2:	if  c1 or	r2.23, 0 -> r11
	;;
#0:	       cmp lt	r11, 1 -> c1
	;;
#0:	if  c1 br @	.BB6_171
	;;
.BB6_135:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldm.s	r15, 56
#1:	       ldiu	256 -> r1
	;;
#0:	       add	r15, r1 -> r1
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       stm.a	r0, r10, 0
	;;
#0:	       stm.a	r11, r10, 1
	;;
#0:	       ldm.f	r15, 296
	;;
#0:	       add	r31, r11 -> r3
	;;
#0:	       stm.a	r3, r1, 10
	;;
#0:	       ldm.f	r0.24, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#0:	       stm.a	r0, r0.24, 0
#1:	       cmp lt	r0, 8 -> c1
	;;
#0:	if  c1 br @	.BB6_170
	;;
.BB6_136:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       s2add	r15, 16 -> r10
#1:	       callg	___ssprint_r
#2:	       ldiu	288 -> r13
	;;
#0:	       add	r10, 8 -> r0
#1:	       add	r15, r13 -> r10
	;;
#0:	       add	r10, 0 -> r1
	;;
	       nop	0
	;;
#0:	       cmp ne	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB6_353
	;;
.BB6_137:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldiu	224 -> r0
#1:	       br	.BB6_171
	;;
#0:	       add	r15, r0 -> r0
	;;
#0:	       add	r0, 0 -> r10
	;;
.BB6_138:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       add	r10, 8 -> r10
	;;
.BB6_139:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldm.f	r15, 304
	;;
#0:	       sub	r31, 1 -> r11
	;;
#0:	       cmp lt	r11, 1 -> c1
	;;
#0:	if !c1 br @	.BB6_142
#1:	if  c1 br @	.BB6_209
	;;
.BB6_140:                               ;   in Loop: Header=BB6_142 Depth=2
#0:	       add	r10, 8 -> r10
	;;
.BB6_141:                               ;   in Loop: Header=BB6_142 Depth=2
#0:	       sub	r11, 16 -> r11
	;;
.BB6_142:                               ; %.preheader34.i
                                        ;   Parent Loop BB6_12 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#3:	       cmp lt	r11, r3.29 -> c1
#0:	       ldga	__svfprintf_r.zeroes -> r0
	;;
#0:	if  c1 br @	.BB6_159
#1:	       stm.a	r0, r10, 0
	;;
.BB6_143:                               ;   in Loop: Header=BB6_142 Depth=2
#2:	       stm.a	r2.26, r10, 1
#0:	       ldiu	256 -> r1
	;;
#0:	       ldm.f	r15, 296
#1:	       add	r15, r1 -> r1
	;;
#0:	       add	r31, 16 -> r0
	;;
#0:	       stm.a	r0, r1, 10
	;;
#0:	       ldm.f	r0.24, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#0:	       stm.a	r0, r0.24, 0
#1:	       cmp lt	r0, 8 -> c1
	;;
#0:	if  c1 br @	.BB6_140
	;;
.BB6_144:                               ;   in Loop: Header=BB6_142 Depth=2
#0:	       s2add	r15, 16 -> r10
#1:	       callg	___ssprint_r
#2:	       ldiu	288 -> r13
	;;
#0:	       add	r10, 8 -> r0
#1:	       add	r15, r13 -> r10
	;;
#0:	       add	r10, 0 -> r1
	;;
	       nop	0
	;;
#0:	       cmp ne	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB6_353
	;;
.BB6_145:                               ;   in Loop: Header=BB6_142 Depth=2
#0:	       ldiu	224 -> r0
#1:	       br	.BB6_141
	;;
#0:	       add	r15, r0 -> r0
	;;
#0:	       add	r0, 0 -> r10
	;;
.BB6_146:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       add	r10, 8 -> r10
	;;
.BB6_147:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldm.f	r15, 316
	;;
#0:	       brz ne @	r31, .BB6_150
	;;
.BB6_148:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldm.f	r15, 304
	;;
#0:	       brz ne @	r31, .BB6_150
	;;
.BB6_149:                               ;   in Loop: Header=BB6_12 Depth=1
#3:	       btest	r3.24, 0 -> c1
	;;
#0:	if !c1 br @	.BB6_209
	;;
.BB6_150:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldga	._.str391 -> r0
#1:	       ldiu	256 -> r1
	;;
#0:	       stm.a	r0, r10, 0
#1:	       add	r15, r1 -> r1
	;;
#0:	       stm.a	r0.27, r10, 1
	;;
#0:	       ldm.f	r15, 296
	;;
#0:	       add	r31, r0.27 -> r0
	;;
#0:	       stm.a	r0, r1, 10
	;;
#0:	       ldm.f	r0.24, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#0:	       stm.a	r0, r0.24, 0
#1:	       cmp lt	r0, 8 -> c1
	;;
#0:	if  c1 br @	.BB6_161
	;;
.BB6_151:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       s2add	r15, 16 -> r10
#1:	       callg	___ssprint_r
#2:	       ldiu	288 -> r13
	;;
#0:	       add	r10, 8 -> r0
#1:	       add	r15, r13 -> r10
	;;
#0:	       add	r10, 0 -> r1
	;;
	       nop	0
	;;
#0:	       cmp ne	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB6_353
	;;
.BB6_152:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldiu	224 -> r1
#1:	       br	.BB6_162
	;;
#0:	       add	r15, r1 -> r1
	;;
#0:	       add	r1, 0 -> r0
	;;
.BB6_153:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       stm.a	r10, r1, 1
#1:	       ldiu	256 -> r2
	;;
#0:	       ldm.f	r15, 296
#1:	       add	r15, r2 -> r2
	;;
#0:	       add	r31, r10 -> r0
	;;
#0:	       stm.a	r0, r2, 10
	;;
#0:	       ldm.f	r0.24, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#0:	       stm.a	r0, r0.24, 0
#1:	       cmp lt	r0, 8 -> c1
	;;
#0:	if !c1 br @	.BB6_155
	;;
.BB6_154:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       add	r1, 8 -> r1
#1:	       br @	.BB6_157
	;;
.BB6_155:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       s2add	r15, 16 -> r10
#1:	       callg	___ssprint_r
#2:	       ldiu	288 -> r13
	;;
#0:	       add	r10, 8 -> r0
#1:	       add	r15, r13 -> r10
	;;
#0:	       add	r10, 0 -> r1
	;;
	       nop	0
	;;
#0:	       cmp ne	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB6_353
	;;
.BB6_156:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldiu	224 -> r0
	;;
#0:	       add	r15, r0 -> r0
	;;
#0:	       add	r0, 0 -> r1
	;;
.BB6_157:                               ;   in Loop: Header=BB6_12 Depth=1
#2:	       stm.a	r2.27, r1, 0
#0:	       ldiu	256 -> r2
	;;
#2:	       stm.a	r2.29, r1, 1
#0:	       add	r15, r2 -> r2
	;;
#0:	       ldm.f	r15, 296
	;;
#2:	       add	r31, r2.29 -> r0
	;;
#0:	       stm.a	r0, r2, 10
	;;
#0:	       ldm.f	r0.24, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#0:	       stm.a	r0, r0.24, 0
#1:	       cmp lt	r0, 8 -> c1
	;;
#0:	if !c1 br @	.BB6_207
	;;
.BB6_158:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       add	r1, 8 -> r10
#1:	       br @	.BB6_209
	;;
.BB6_159:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       stm.a	r11, r10, 1
#1:	       ldiu	256 -> r1
	;;
#0:	       ldm.f	r15, 296
#1:	       add	r15, r1 -> r1
	;;
#0:	       add	r31, r11 -> r0
	;;
#0:	       stm.a	r0, r1, 10
	;;
#0:	       ldm.f	r0.24, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#0:	       stm.a	r0, r0.24, 0
#1:	       cmp lt	r0, 8 -> c1
	;;
#0:	if !c1 br @	.BB6_207
	;;
.BB6_160:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       add	r10, 8 -> r10
#1:	       br @	.BB6_209
	;;
.BB6_161:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       add	r10, 8 -> r0
	;;
.BB6_162:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldm.f	r15, 316
	;;
#0:	       or	r31, 0 -> r2
	;;
#0:	       cmp gt	r2, -1 -> c1
	;;
#0:	if  c1 br @	.BB6_195
	;;
.BB6_163:                               ; %.preheader.i
                                        ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldi	0 -> r1
#1:	       br	.BB6_166
	;;
#0:	       sub	r1, r2 -> r10
	;;
	       nop	0
	;;
.BB6_164:                               ;   in Loop: Header=BB6_166 Depth=2
#0:	       add	r0, 8 -> r0
	;;
.BB6_165:                               ;   in Loop: Header=BB6_166 Depth=2
#0:	       sub	r10, 16 -> r10
	;;
.BB6_166:                               ;   Parent Loop BB6_12 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#3:	       cmp lt	r10, r3.29 -> c1
#0:	       ldga	__svfprintf_r.zeroes -> r1
	;;
#0:	if  c1 br @	.BB6_181
#1:	       stm.a	r1, r0, 0
	;;
.BB6_167:                               ;   in Loop: Header=BB6_166 Depth=2
#2:	       stm.a	r2.26, r0, 1
#0:	       ldiu	256 -> r2
	;;
#0:	       ldm.f	r15, 296
#1:	       add	r15, r2 -> r2
	;;
#0:	       add	r31, 16 -> r1
	;;
#0:	       stm.a	r1, r2, 10
	;;
#0:	       ldm.f	r0.24, 0
	;;
#0:	       add	r31, 1 -> r1
	;;
#0:	       stm.a	r1, r0.24, 0
#1:	       cmp lt	r1, 8 -> c1
	;;
#0:	if  c1 br @	.BB6_164
	;;
.BB6_168:                               ;   in Loop: Header=BB6_166 Depth=2
#0:	       s2add	r15, 16 -> r11
#1:	       callg	___ssprint_r
#2:	       ldiu	288 -> r13
	;;
#0:	       add	r11, 8 -> r0
#1:	       add	r15, r13 -> r11
	;;
#0:	       add	r11, 0 -> r1
	;;
	       nop	0
	;;
#0:	       cmp ne	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB6_353
	;;
.BB6_169:                               ;   in Loop: Header=BB6_166 Depth=2
#0:	       ldiu	224 -> r1
#1:	       br	.BB6_165
	;;
#0:	       add	r15, r1 -> r1
	;;
#0:	       add	r1, 0 -> r0
	;;
.BB6_170:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       add	r10, 8 -> r10
	;;
.BB6_171:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       cmp gt	r11, 0 -> c1
#1:	       ldi	0 -> r0
	;;
#0:	if  c1 or	r11, 0 -> r0
	;;
#2:	       sub	r2.23, r0 -> r11
	;;
#0:	       cmp lt	r11, 1 -> c1
	;;
#0:	if !c1 br @	.BB6_174
#1:	if  c1 br @	.BB6_185
	;;
.BB6_172:                               ;   in Loop: Header=BB6_174 Depth=2
#0:	       add	r10, 8 -> r10
	;;
.BB6_173:                               ;   in Loop: Header=BB6_174 Depth=2
#0:	       sub	r11, 16 -> r11
	;;
.BB6_174:                               ; %.preheader28.i
                                        ;   Parent Loop BB6_12 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#3:	       cmp lt	r11, r3.29 -> c1
#0:	       ldga	__svfprintf_r.zeroes -> r0
	;;
#0:	if  c1 br @	.BB6_178
#1:	       stm.a	r0, r10, 0
	;;
.BB6_175:                               ;   in Loop: Header=BB6_174 Depth=2
#2:	       stm.a	r2.26, r10, 1
#0:	       ldiu	256 -> r1
	;;
#0:	       ldm.f	r15, 296
#1:	       add	r15, r1 -> r1
	;;
#0:	       add	r31, 16 -> r0
	;;
#0:	       stm.a	r0, r1, 10
	;;
#0:	       ldm.f	r0.24, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#0:	       stm.a	r0, r0.24, 0
#1:	       cmp lt	r0, 8 -> c1
	;;
#0:	if  c1 br @	.BB6_172
	;;
.BB6_176:                               ;   in Loop: Header=BB6_174 Depth=2
#0:	       s2add	r15, 16 -> r10
#1:	       callg	___ssprint_r
#2:	       ldiu	288 -> r13
	;;
#0:	       add	r10, 8 -> r0
#1:	       add	r15, r13 -> r10
	;;
#0:	       add	r10, 0 -> r1
	;;
	       nop	0
	;;
#0:	       cmp ne	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB6_353
	;;
.BB6_177:                               ;   in Loop: Header=BB6_174 Depth=2
#0:	       ldiu	224 -> r0
#1:	       br	.BB6_173
	;;
#0:	       add	r15, r0 -> r0
	;;
#0:	       add	r0, 0 -> r10
	;;
.BB6_178:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       stm.a	r11, r10, 1
#1:	       ldiu	256 -> r1
	;;
#0:	       ldm.f	r15, 296
#1:	       add	r15, r1 -> r1
	;;
#0:	       add	r31, r11 -> r0
	;;
#0:	       stm.a	r0, r1, 10
	;;
#0:	       ldm.f	r0.24, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#0:	       stm.a	r0, r0.24, 0
#1:	       cmp gt	r0, 7 -> c1
	;;
#0:	if !c1 br @	.BB6_184
	;;
.BB6_179:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       s2add	r15, 16 -> r10
#1:	       callg	___ssprint_r
#2:	       ldiu	288 -> r13
	;;
#0:	       add	r10, 8 -> r0
#1:	       add	r15, r13 -> r10
	;;
#0:	       add	r10, 0 -> r1
	;;
	       nop	0
	;;
#0:	       cmp ne	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB6_353
	;;
.BB6_180:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldiu	224 -> r0
#1:	       br	.BB6_185
	;;
#0:	       add	r15, r0 -> r0
	;;
#0:	       add	r0, 0 -> r10
	;;
.BB6_181:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       stm.a	r10, r0, 1
#1:	       ldiu	256 -> r2
	;;
#0:	       ldm.f	r15, 296
#1:	       add	r15, r2 -> r2
	;;
#0:	       add	r31, r10 -> r1
	;;
#0:	       stm.a	r1, r2, 10
	;;
#0:	       ldm.f	r0.24, 0
	;;
#0:	       add	r31, 1 -> r1
	;;
#0:	       stm.a	r1, r0.24, 0
#1:	       cmp lt	r1, 8 -> c1
	;;
#0:	if  c1 br @	.BB6_194
	;;
.BB6_182:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       s2add	r15, 16 -> r10
#1:	       callg	___ssprint_r
#2:	       ldiu	288 -> r13
	;;
#0:	       add	r10, 8 -> r0
#1:	       add	r15, r13 -> r10
	;;
#0:	       add	r10, 0 -> r1
	;;
	       nop	0
	;;
#0:	       cmp ne	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB6_353
	;;
.BB6_183:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldiu	224 -> r1
#1:	       br	.BB6_195
	;;
#0:	       add	r15, r1 -> r1
	;;
#0:	       add	r1, 0 -> r0
	;;
.BB6_184:                               ; %._crit_edge636.i
                                        ;   in Loop: Header=BB6_12 Depth=1
#0:	       add	r10, 8 -> r10
	;;
.BB6_185:                               ; %._crit_edge635.i
                                        ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldm.s	r15, 56
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldm.f	r15, 304
	;;
#2:	       add	r0, r2.23 -> r12
	;;
#0:	       or	r31, 0 -> r3
#1:	       ldm.f	r15, 316
	;;
#0:	       cmp lt	r31, r3 -> c1
	;;
#3:	if !c1 btest	r3.24, 0 -> c1
	;;
#0:	if !c1 br @	.BB6_190
	;;
.BB6_186:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldga	._.str391 -> r0
#1:	       ldiu	256 -> r1
	;;
#0:	       stm.a	r0, r10, 0
#1:	       add	r15, r1 -> r1
	;;
#0:	       stm.a	r0.27, r10, 1
	;;
#0:	       ldm.f	r15, 296
	;;
#0:	       add	r31, r0.27 -> r0
	;;
#0:	       stm.a	r0, r1, 10
	;;
#0:	       ldm.f	r0.24, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#0:	       stm.a	r0, r0.24, 0
#1:	       cmp gt	r0, 7 -> c1
	;;
#0:	if !c1 br @	.BB6_189
	;;
.BB6_187:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       s2add	r15, 16 -> r10
#1:	       callg	___ssprint_r
#2:	       ldiu	288 -> r13
	;;
#0:	       add	r10, 8 -> r0
#1:	       add	r15, r13 -> r10
	;;
#0:	       add	r10, 0 -> r1
	;;
	       nop	0
	;;
#0:	       cmp ne	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB6_353
	;;
.BB6_188:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldiu	224 -> r0
#1:	       br	.BB6_190
	;;
#0:	       add	r15, r0 -> r0
	;;
#0:	       add	r0, 0 -> r10
	;;
.BB6_189:                               ; %._crit_edge633.i
                                        ;   in Loop: Header=BB6_12 Depth=1
#0:	       add	r10, 8 -> r10
	;;
.BB6_190:                               ; %._crit_edge634.i
                                        ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldm.f	r15, 316
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldm.f	r15, 304
	;;
#0:	       sub	r31, r0 -> r11
#2:	       sub	r31, r2.23 -> r0
	;;
#0:	       cmp gt	r0, r11 -> c1
	;;
#2:	if !c1 sub	r31, r2.23 -> r11 ; aaaf
	;;
#0:	       cmp lt	r11, 1 -> c1
	;;
#0:	if  c1 br @	.BB6_198
	;;
.BB6_191:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       stm.a	r12, r10, 0
#1:	       ldiu	256 -> r1
	;;
#0:	       stm.a	r11, r10, 1
#1:	       add	r15, r1 -> r1
	;;
#0:	       ldm.f	r15, 296
	;;
#0:	       add	r31, r11 -> r0
	;;
#0:	       stm.a	r0, r1, 10
	;;
#0:	       ldm.f	r0.24, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#0:	       stm.a	r0, r0.24, 0
#1:	       cmp gt	r0, 7 -> c1
	;;
#0:	if !c1 br @	.BB6_197
	;;
.BB6_192:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       s2add	r15, 16 -> r10
#1:	       callg	___ssprint_r
#2:	       ldiu	288 -> r13
	;;
#0:	       add	r10, 8 -> r0
#1:	       add	r15, r13 -> r10
	;;
#0:	       add	r10, 0 -> r1
	;;
	       nop	0
	;;
#0:	       cmp ne	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB6_353
	;;
.BB6_193:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldiu	224 -> r0
#1:	       br	.BB6_198
	;;
#0:	       add	r15, r0 -> r0
	;;
#0:	       add	r0, 0 -> r10
	;;
.BB6_194:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       add	r0, 8 -> r0
	;;
.BB6_195:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldm.s	r15, 56
#1:	       ldiu	256 -> r2
	;;
#0:	       add	r15, r2 -> r2
	;;
#0:	       or	r31, 0 -> r1
	;;
#0:	       stm.a	r1, r0, 0
	;;
#0:	       ldm.f	r15, 304
	;;
#0:	       stm.a	r31, r0, 1
	;;
#0:	       ldm.f	r15, 304
	;;
#0:	       or	r31, 0 -> r3
#1:	       ldm.f	r15, 296
	;;
#0:	       add	r31, r3 -> r1
	;;
#0:	       stm.a	r1, r2, 10
	;;
#0:	       ldm.f	r0.24, 0
	;;
#0:	       add	r31, 1 -> r1
	;;
#0:	       stm.a	r1, r0.24, 0
#1:	       cmp lt	r1, 8 -> c1
	;;
#0:	if !c1 br @	.BB6_207
	;;
.BB6_196:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       add	r0, 8 -> r10
#1:	       br @	.BB6_209
	;;
.BB6_197:                               ; %._crit_edge631.i
                                        ;   in Loop: Header=BB6_12 Depth=1
#0:	       add	r10, 8 -> r10
	;;
.BB6_198:                               ; %._crit_edge632.i
                                        ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldm.f	r15, 316
#1:	       ldi	0 -> r0
#2:	       cmp gt	r11, 0 -> c1
#3:	       ldi	0 -> r1
	;;
#0:	       sub	r0, r11 -> r0
	;;
#0:	       or	r31, 0 -> r3
#1:	       ldm.f	r15, 304
#2:	if  c1 or	r0, 0 -> r1
	;;
#0:	       sub	r31, r3 -> r0
	;;
#0:	       add	r0, r1 -> r11
	;;
#0:	       cmp lt	r11, 1 -> c1
	;;
#0:	if !c1 br @	.BB6_201
#1:	if  c1 br @	.BB6_209
	;;
.BB6_199:                               ;   in Loop: Header=BB6_201 Depth=2
#0:	       add	r10, 8 -> r10
	;;
.BB6_200:                               ;   in Loop: Header=BB6_201 Depth=2
#0:	       sub	r11, 16 -> r11
	;;
.BB6_201:                               ; %.preheader22.i
                                        ;   Parent Loop BB6_12 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#3:	       cmp lt	r11, r3.29 -> c1
#0:	       ldga	__svfprintf_r.zeroes -> r0
	;;
#0:	if  c1 br @	.BB6_205
#1:	       stm.a	r0, r10, 0
	;;
.BB6_202:                               ;   in Loop: Header=BB6_201 Depth=2
#2:	       stm.a	r2.26, r10, 1
#0:	       ldiu	256 -> r1
	;;
#0:	       ldm.f	r15, 296
#1:	       add	r15, r1 -> r1
	;;
#0:	       add	r31, 16 -> r0
	;;
#0:	       stm.a	r0, r1, 10
	;;
#0:	       ldm.f	r0.24, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#0:	       stm.a	r0, r0.24, 0
#1:	       cmp lt	r0, 8 -> c1
	;;
#0:	if  c1 br @	.BB6_199
	;;
.BB6_203:                               ;   in Loop: Header=BB6_201 Depth=2
#0:	       s2add	r15, 16 -> r10
#1:	       callg	___ssprint_r
#2:	       ldiu	288 -> r13
	;;
#0:	       add	r10, 8 -> r0
#1:	       add	r15, r13 -> r10
	;;
#0:	       add	r10, 0 -> r1
	;;
	       nop	0
	;;
#0:	       cmp ne	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB6_353
	;;
.BB6_204:                               ;   in Loop: Header=BB6_201 Depth=2
#0:	       ldiu	224 -> r0
#1:	       br	.BB6_200
	;;
#0:	       add	r15, r0 -> r0
	;;
#0:	       add	r0, 0 -> r10
	;;
.BB6_205:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       stm.a	r11, r10, 1
#1:	       ldiu	256 -> r1
	;;
#0:	       ldm.f	r15, 296
#1:	       add	r15, r1 -> r1
	;;
#0:	       add	r31, r11 -> r0
	;;
#0:	       stm.a	r0, r1, 10
	;;
#0:	       ldm.f	r0.24, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#0:	       stm.a	r0, r0.24, 0
#1:	       cmp lt	r0, 8 -> c1
	;;
#0:	if !c1 br @	.BB6_207
	;;
.BB6_206:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       add	r10, 8 -> r10
#1:	       br @	.BB6_209
	;;
.BB6_207:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       s2add	r15, 16 -> r10
#1:	       callg	___ssprint_r
#2:	       ldiu	288 -> r13
	;;
#0:	       add	r10, 8 -> r0
#1:	       add	r15, r13 -> r10
	;;
#0:	       add	r10, 0 -> r1
	;;
	       nop	0
	;;
#0:	       cmp ne	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB6_353
	;;
.BB6_208:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldiu	224 -> r0
	;;
#0:	       add	r15, r0 -> r0
	;;
#0:	       add	r0, 0 -> r10
	;;
.BB6_209:                               ;   in Loop: Header=BB6_12 Depth=1
#3:	       btest	r3.24, 2 -> !c1
	;;
#0:	if  c1 br @	.BB6_218
	;;
.BB6_210:                               ;   in Loop: Header=BB6_12 Depth=1
#3:	       sub	r3.23, r3.27 -> r11
	;;
#0:	       cmp lt	r11, 1 -> c1
	;;
#0:	if !c1 br @	.BB6_213
#1:	if  c1 br @	.BB6_218
	;;
.BB6_211:                               ;   in Loop: Header=BB6_213 Depth=2
#0:	       add	r10, 8 -> r10
	;;
.BB6_212:                               ;   in Loop: Header=BB6_213 Depth=2
#0:	       sub	r11, 16 -> r11
	;;
.BB6_213:                               ; %.preheader76.i
                                        ;   Parent Loop BB6_12 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#3:	       cmp lt	r11, r3.29 -> c1
#0:	       ldga	__svfprintf_r.blanks -> r0
	;;
#0:	if  c1 br @	.BB6_216
#1:	       stm.a	r0, r10, 0
	;;
.BB6_214:                               ;   in Loop: Header=BB6_213 Depth=2
#2:	       stm.a	r2.26, r10, 1
#0:	       ldiu	256 -> r1
	;;
#0:	       ldm.f	r15, 296
#1:	       add	r15, r1 -> r1
	;;
#0:	       add	r31, 16 -> r0
	;;
#0:	       stm.a	r0, r1, 10
	;;
#0:	       ldm.f	r0.24, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#0:	       stm.a	r0, r0.24, 0
#1:	       cmp lt	r0, 8 -> c1
	;;
#0:	if  c1 br @	.BB6_211
	;;
.BB6_215:                               ;   in Loop: Header=BB6_213 Depth=2
#1:	       or	r1.24, 0 -> r0
#2:	       callg	___ssprint_r
#0:	       or	r0.26, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz eq @	r0, .BB6_212
#3:	       or	r3.28, 0 -> r10
	;;
#0:	       br @	.BB6_353
	;;
.BB6_216:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       stm.a	r11, r10, 1
#1:	       ldiu	256 -> r1
	;;
#0:	       ldm.f	r15, 296
#1:	       add	r15, r1 -> r1
	;;
#0:	       add	r31, r11 -> r0
	;;
#0:	       stm.a	r0, r1, 10
	;;
#0:	       ldm.f	r0.24, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#0:	       stm.a	r0, r0.24, 0
#1:	       cmp lt	r0, 8 -> c1
	;;
#0:	if  c1 br @	.BB6_218
	;;
.BB6_217:                               ;   in Loop: Header=BB6_12 Depth=1
#1:	       or	r1.24, 0 -> r0
#2:	       callg	___ssprint_r
#0:	       or	r0.26, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       cmp ne	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB6_353
	;;
.BB6_218:                               ; %._crit_edge639.i
                                        ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldm.f	r15, 296
	;;
#0:	       cmp eq	r31, 0 -> c3
	;;
#0:	if  c3 br @	.BB6_11
	;;
.BB6_219:                               ;   in Loop: Header=BB6_12 Depth=1
#1:	       or	r1.24, 0 -> r0
#2:	       callg	___ssprint_r
#0:	       or	r0.26, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       cmp eq	r0, 0 -> c3
	;;
#0:	if !c3 br @	.BB6_353
#1:	if  c3 br @	.BB6_11
	;;
.BB6_220:                               ;   in Loop: Header=BB6_12 Depth=1
#3:	       or	r3.24, 16 -> r3.24
#0:	       ldi	68 -> r11
	;;
.BB6_221:                               ; %.loopexit93.i
                                        ;   in Loop: Header=BB6_12 Depth=1
#3:	       btest	r3.24, 4 -> !c1
	;;
#0:	if !c1 br @	.BB6_245
	;;
.BB6_222:                               ;   in Loop: Header=BB6_12 Depth=1
#3:	       btest	r3.24, 6 -> !c1
#0:	       ldm.f	r14, 0
	;;
#0:	if  c1 br @	.BB6_246
#1:	       or	r31, 0 -> r12
	;;
.BB6_223:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       bbh	sext16 r12 -> r12
#1:	       br @	.BB6_246
	;;
.BB6_224:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldm.f	r14, 0
#1:	       s2add	r15, 16 -> r4
#2:	       ldiu	0 -> r5
	;;
#0:	       add	r4, 0 -> r3
	;;
#0:	       stx	r31 -> $f10
#1:	       ldm.f	r14, 4
#2:	       add	r14, 8 -> r14
	;;
#0:	       stx	r31 -> $f0
	;;
#0:	       fop	fmov	f0 -> f11
	;;
#0:	       ldx	$f10 -> r0
	;;
#0:	       stm.a	r0, r15, 16
#1:	       ldx	$f11 -> r1
#2:	       or	r3, 4 -> r0
	;;
#0:	       stm.a	r1, r0, 0
#1:	       ldiu	0 -> r1
	;;
#0:	       ldm.f	r0, 0
#1:	       ldih	1024 -> r1
	;;
#0:	       or	r31, 0 -> r2
#1:	       ldm.f	r15, 64
	;;
#0:	       cmp eq	r2, r1 -> c2
	;;
#0:	       or	r31, 0 -> r3
	;;
#0:	       cmp eq	r3, 0 -> c1
#1:	       or	r2, r3 -> r0
	;;
#0:	       comb	and c2, c1 -> c2
#1:	       cmp eq	r0, 0 -> c3
	;;
#0:	       comb	or c3, c2 -> c1
	;;
#0:	if  c1 br @	.BB6_248
	;;
.BB6_225:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldga	1048576 -> r1
#1:	       ldiu	0 -> r4
#2:	       ldim	512 -> r5
#3:	       ldga	1048576 -> r0
	;;
#0:	       ldih	1023 -> r1
#1:	       ldih	1023 -> r4
#2:	       cmpu lt	r2, r5 -> c3
	;;
#0:	       add	r2, r1 -> r1
	;;
#0:	       cmpu lt	r1, r4 -> c2
#1:	       ldiu	0 -> r1
	;;
#0:	       ldim	1536 -> r1
	;;
#0:	       add	r2, r1 -> r1
	;;
#0:	       cmpu lt	r1, r4 -> c1
	;;
#0:	       comb	or c1, c2 -> c2
	;;
#0:	       comb	or c2, c3 -> c1
	;;
#0:	if  c1 br @	.BB6_248
	;;
.BB6_226:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldih	1024 -> r0
#1:	       cmp lt	r2, 0 -> c1
	;;
#0:	       cmpu lt	r2, r0 -> c2
	;;
#0:	       comb	and c1, c2 -> c1
	;;
#0:	if  c1 br @	.BB6_248
	;;
.BB6_227:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldiu	0 -> r0
#1:	       ldga	1048576 -> r1
#2:	       cmp eq	r3, 0 -> c3
	;;
#0:	       ldim	1536 -> r0
#1:	       ldih	1023 -> r1
	;;
#0:	       cmp eq	r2, r0 -> c2
#1:	       cmp eq	r2, r1 -> c1
	;;
#0:	       comb	or c1, c2 -> c2
	;;
#0:	       comb	and c2, c3 -> c1
	;;
#0:	if !c1 br @	.BB6_247
	;;
.BB6_228:                               ; %__fpclassifyd.exit.i
                                        ;   in Loop: Header=BB6_12 Depth=1
#0:	       fop	dzero -> d0
#1:	       ldi	72 -> r3
	;;
#0:	       fop	dcmp	d5, d0 -> f0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r0
	;;
#0:	       btest	r0, 13 -> c1
	;;
#0:	       br	.BB6_273
#1:	if !c1 ldiu	320 -> r1
#2:	if !c1 ldi	45 -> r0
	;;
#0:	if !c1 add	r15, r1 -> r1
	;;
#0:	if !c1 stmb.a	r0, r1, 4
#1:	       cmp lt	r11, r3 -> c1
#2:	       ldga	._.str43 -> r1
#3:	       ldga	._.str144 -> r0
	;;
.BB6_229:                               ;   in Loop: Header=BB6_12 Depth=1
#3:	       or	r3.24, 16 -> r3.24
#0:	       ldi	79 -> r13
	;;
.BB6_230:                               ; %.loopexit94.i
                                        ;   in Loop: Header=BB6_12 Depth=1
#3:	       btest	r3.24, 4 -> !c1
	;;
#0:	if !c1 br @	.BB6_254
	;;
.BB6_231:                               ;   in Loop: Header=BB6_12 Depth=1
#3:	       btest	r3.24, 6 -> !c1
#0:	       ldm.f	r14, 0
	;;
#0:	if  c1 br @	.BB6_255
#1:	       or	r31, 0 -> r12
	;;
.BB6_232:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       bbh	zext16 r12 -> r12
#1:	       br @	.BB6_255
	;;
.BB6_233:                               ;   in Loop: Header=BB6_12 Depth=1
#3:	       or	r3.24, 16 -> r3.24
#0:	       ldi	85 -> r4
	;;
.BB6_234:                               ; %.loopexit95.i
                                        ;   in Loop: Header=BB6_12 Depth=1
#3:	       btest	r3.24, 4 -> !c1
	;;
#0:	if !c1 br @	.BB6_256
	;;
.BB6_235:                               ;   in Loop: Header=BB6_12 Depth=1
#3:	       btest	r3.24, 6 -> !c1
#0:	       ldm.f	r14, 0
	;;
#0:	if  c1 br @	.BB6_257
#1:	       or	r31, 0 -> r12
	;;
.BB6_236:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       bbh	zext16 r12 -> r12
#1:	       br @	.BB6_257
	;;
.BB6_237:                               ;   in Loop: Header=BB6_12 Depth=1
#2:	       ldi	0 -> r2.23
#0:	       ldm.f	r14, 0
#1:	       ldiu	160 -> r1
#3:	       ldi	99 -> r13
	;;
#2:	       ldi	1 -> r2.24
#0:	       add	r15, r1 -> r1
#1:	       ldiu	160 -> r2
	;;
#2:	       or	r2.23, 0 -> r12
#0:	       bbh	mzext8 r14 -> r0
#1:	       add	r14, 4 -> r14
	;;
#0:	       stmb.a	r0, r1, 24
#1:	       ldiu	320 -> r0
	;;
#0:	       add	r15, r0 -> r1
	;;
#0:	       br	.BB6_59
#1:	       stmb.a	0, r1, 4
#2:	       add	r15, r2 -> r1
	;;
#0:	       add	r1, 24 -> r3
	;;
#0:	       stm.s	r3, r15, 14
	;;
.BB6_238:                               ;   in Loop: Header=BB6_12 Depth=1
#3:	       or	r3.24, 2 -> r3.24
#0:	       ldiu	160 -> r1
#1:	       ldm.f	r14, 0
#2:	       ldi	48 -> r0
	;;
#0:	       add	r15, r1 -> r1
#1:	       add	r14, 4 -> r14
#2:	       ldi	120 -> r13
#3:	       ldga	._.str447 -> r3
	;;
#0:	       stmb.a	r0, r1, 20
	;;
#3:	       stm.a	r31, r3.30, 0
	;;
#0:	       ldm.s	r15, 32
	;;
#0:	       or	r31, 0 -> r2
#1:	       ldmg.d	___mem_emergency
	;;
#0:	       br	.BB6_267
#1:	       or	r2, 1 -> r0
#2:	       ldi	2 -> r2
	;;
#0:	       or	r31, 0 -> r12
#1:	       stmb.a	r13, r0, 0
	;;
#0:	       stm.s	r3, r15, 12
	;;
.BB6_239:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldiu	320 -> r1
#1:	       add	r14, 4 -> r5
	;;
#0:	       add	r15, r1 -> r1
	;;
#0:	       stmb.a	0, r1, 4
	;;
#0:	       ldm.f	r14, 0
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       stm.s	r0, r15, 14
	;;
#0:	       ldm.s	r15, 56
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       brz ne @	r0, .BB6_258
	;;
.BB6_240:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       br	.BB6_313
	;;
#2:	       cmpu gt	r2.25, 6 -> c1
#0:	       ldi	6 -> r0
#1:	       ldi	115 -> r13
#3:	       ldga	._.str548 -> r3
	;;
#2:	if  c1 or	r0, 0 -> r2.25
#0:	       stm.s	r3, r15, 14
	;;
.BB6_241:                               ; %.loopexit96.i.loopexit12
                                        ;   in Loop: Header=BB6_12 Depth=1
#1:	       ldga	._.str447 -> r1.16
#0:	       ldi	120 -> r1
	;;
.BB6_242:                               ; %.loopexit96.i
                                        ;   in Loop: Header=BB6_12 Depth=1
#3:	       btest	r3.24, 4 -> !c1
	;;
#0:	if !c1 br @	.BB6_263
	;;
.BB6_243:                               ;   in Loop: Header=BB6_12 Depth=1
#3:	       btest	r3.24, 6 -> !c1
#0:	       ldm.f	r14, 0
	;;
#0:	if  c1 br @	.BB6_264
#1:	       or	r31, 0 -> r12
	;;
.BB6_244:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       bbh	zext16 r12 -> r12
#1:	       br @	.BB6_264
	;;
.BB6_245:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldm.f	r14, 0
	;;
#0:	       or	r31, 0 -> r12
	;;
.BB6_246:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       cmp gt	r12, -1 -> c1
#1:	       ldi	1 -> r2
#2:	       add	r14, 4 -> r14
#3:	       or	r11, 0 -> r13
	;;
#0:	if !c1 ldi	0 -> r3
#1:	if !c1 ldi	1 -> r2
#2:	if !c1 ldiu	320 -> r1
#3:	if !c1 ldi	45 -> r0
	;;
#0:	       br	.BB6_268
#1:	if !c1 sub	r3, r12 -> r12
#2:	if !c1 add	r15, r1 -> r1
	;;
#0:	if !c1 stmb.a	r0, r1, 4
	;;
	       nop	0
	;;
.BB6_247:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	if !c1 br @	.BB6_272
	;;
.BB6_248:                               ; %.thread
                                        ;   in Loop: Header=BB6_12 Depth=1
#2:	       cmp eq	r2.25, -1 -> c1
#0:	       ldi	6 -> r12
	;;
#0:	if  c1 br @	.BB6_252
	;;
.BB6_249:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldi	32 -> r0
#1:	       ldi	103 -> r3
	;;
#0:	       or	r11, r0 -> r1
	;;
#0:	       cmp eq	r1, r3 -> c1
	;;
#0:	if !c1 br @	.BB6_251
	;;
.BB6_250:                               ;   in Loop: Header=BB6_12 Depth=1
#2:	       cmp eq	r2.25, 0 -> c1
#0:	       ldi	1 -> r0
	;;
#2:	if  c1 or	r0, 0 -> r2.25
	;;
.BB6_251:                               ;   in Loop: Header=BB6_12 Depth=1
#2:	       or	r2.25, 0 -> r12
	;;
.BB6_252:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldiu	320 -> r13
#1:	       ldiu	288 -> r8
#2:	       ldiu	288 -> r9
#3:	       ldx	$f11 -> r1
	;;
#0:	       add	r15, r13 -> r13
#1:	       or	r12, 0 -> r2
	;;
#0:	       add	r13, 0 -> r0.25
#1:	       add	r15, r8 -> r13
	;;
#0:	       stm.a	r0.25, r15, 0
#1:	       add	r13, 28 -> r0
#2:	       add	r15, r9 -> r13
	;;
#0:	       stm.a	r0, r15, 1
#1:	       ldi	256 -> r0
#2:	       add	r13, 16 -> r3
	;;
#0:	       callg	_cvt
	;;
#3:	       or	r3.24, r0 -> r3.25
#0:	       stm.a	r11, r15, 2
#1:	       ldx	$f10 -> r0
	;;
#0:	       stm.a	r3, r15, 3
	;;
#3:	       or	r3.25, 0 -> r3
	;;
#0:	       ldi	32 -> r3
#1:	       stm.s	r0, r15, 14
#2:	       ldi	103 -> r13
	;;
#0:	       or	r11, r3 -> r0
	;;
#0:	       cmp eq	r0, r13 -> c1
	;;
#0:	if !c1 br @	.BB6_274
	;;
.BB6_253:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldm.f	r15, 316
#1:	       sub	r11, 2 -> r0
	;;
#0:	       br	.BB6_275
#1:	       cmp gt	r31, r12 -> c2
#2:	       cmp lt	r31, -3 -> c1
	;;
#0:	       comb	or c1, c2 -> c1
	;;
#0:	if  c1 or	r0, 0 -> r13
	;;
.BB6_254:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldm.f	r14, 0
	;;
#0:	       or	r31, 0 -> r12
	;;
.BB6_255:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       add	r14, 4 -> r14
#1:	       br @	.BB6_267
#2:	       ldi	0 -> r2
	;;
.BB6_256:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldm.f	r14, 0
	;;
#0:	       or	r31, 0 -> r12
	;;
.BB6_257:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       add	r14, 4 -> r14
#1:	       br @	.BB6_267
#2:	       ldi	1 -> r2
#3:	       or	r4, 0 -> r13
	;;
.BB6_258:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldm.s	r15, 56
#2:	       brz lt	r2.25, .BB6_278
#1:	       ldi	0 -> r2
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       or	r0, 0 -> r1
	;;
.BB6_259:                               ; %.preheader11
                                        ;   Parent Loop BB6_12 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.s	r15, 56
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       add	r0, r2 -> r4
	;;
#0:	       and	r4, 3 -> r0
	;;
#0:	       brz eq @	r0, .BB6_280
	;;
.BB6_260:                               ;   in Loop: Header=BB6_259 Depth=2
#2:	       cmp eq	r2.25, r2 -> c1
	;;
#0:	if  c1 br @	.BB6_330
	;;
.BB6_261:                               ;   in Loop: Header=BB6_259 Depth=2
#0:	       ldm.f	r4, 0
#1:	       add	r2, 1 -> r2
	;;
#0:	       bbh	mzext8 r4 -> r0
	;;
#0:	       brz ne @	r0, .BB6_259
	;;
.BB6_262:                               ; %memchr.exit.i.loopexit10
                                        ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldm.s	r15, 56
	;;
#0:	       br	.BB6_311
#1:	       or	r31, 0 -> r0
	;;
#0:	       add	r0, r2 -> r0
	;;
#0:	       sub	r0, 1 -> r2
	;;
.BB6_263:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldm.f	r14, 0
	;;
#0:	       or	r31, 0 -> r12
	;;
.BB6_264:                               ;   in Loop: Header=BB6_12 Depth=1
#3:	       btest	r3.24, 0 -> c1
#0:	       cmp eq	r12, 0 -> c3
#1:	       add	r14, 4 -> r14
#2:	       ldi	2 -> r2
	;;
#0:	       comb	and !c1, !c1 -> c2
	;;
#0:	       comb	or c2, c3 -> c1
	;;
#0:	if  c1 br @	.BB6_266
	;;
.BB6_265:                               ;   in Loop: Header=BB6_12 Depth=1
#3:	       or	r3.24, 2 -> r3.24
#0:	       ldiu	160 -> r3
#1:	       ldi	48 -> r0
#2:	       ldi	2 -> r2
	;;
#0:	       add	r15, r3 -> r3
	;;
#0:	       stmb.a	r0, r3, 20
	;;
#0:	       ldm.s	r15, 32
	;;
#0:	       or	r31, 0 -> r3
	;;
#0:	       or	r3, 1 -> r0
	;;
#0:	       stmb.a	r1, r0, 0
	;;
.BB6_266:                               ;   in Loop: Header=BB6_12 Depth=1
#1:	       stm.s	r1.16, r15, 12
#0:	       or	r1, 0 -> r13
	;;
.BB6_267:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldiu	320 -> r0
	;;
#0:	       add	r15, r0 -> r0
	;;
#0:	       stmb.a	0, r0, 4
	;;
.BB6_268:                               ;   in Loop: Header=BB6_12 Depth=1
#2:	       cmp gt	r2.25, -1 -> c1
#0:	       ldi	-129 -> r0
	;;
#3:	       and	r3.24, r0 -> r0
	;;
#3:	if  c1 or	r0, 0 -> r3.24
#2:	       or	r12, r2.25 -> r0
	;;
#0:	       brz ne @	r0, .BB6_282
	;;
.BB6_269:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       bbh	zext8 r2 -> r0
#1:	       ldm.s	r15, 36
	;;
#0:	       cmp ne	r0, 0 -> c3
	;;
#0:	if  c3 br	.BB6_337
#1:	       or	r31, 0 -> r1
	;;
#0:	       stm.s	r1, r15, 14
	;;
	       nop	0
	;;
.BB6_270:                               ;   in Loop: Header=BB6_12 Depth=1
#3:	       btest	r3.24, 0 -> c1
#0:	       ldm.s	r15, 36
	;;
#0:	if !c1 br	.BB6_337
#1:	       or	r31, 0 -> r0
	;;
#0:	       stm.s	r0, r15, 14
	;;
	       nop	0
	;;
.BB6_271:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldi	48 -> r0
#1:	       br @	.BB6_286
	;;
.BB6_272:                               ; %__fpclassifyd.exit15.i
                                        ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldi	72 -> r0
#1:	       ldga	._.str245 -> r1
	;;
#0:	       cmp lt	r11, r0 -> c1
#1:	       ldga	._.str346 -> r0
	;;
.BB6_273:                               ;   in Loop: Header=BB6_12 Depth=1
#2:	       ldi	0 -> r2.23
#0:	       stm.s	r0, r15, 14
#1:	       ldi	-129 -> r0
	;;
#3:	       and	r3.24, r0 -> r3.24
#2:	       ldi	3 -> r2.24
#0:	       ldm.s	r15, 56
	;;
#2:	       or	r2.23, 0 -> r12
	;;
#0:	       br	.BB6_58
#1:	       or	r31, 0 -> r3
	;;
#0:	if  c1 or	r1, 0 -> r3
	;;
#0:	       stm.s	r3, r15, 14
	;;
.BB6_274:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       or	r11, 0 -> r13
	;;
.BB6_275:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldi	101 -> r0
	;;
#0:	       cmp gt	r13, r0 -> c1
	;;
#0:	if  c1 br @	.BB6_287
	;;
.BB6_276:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldm.f	r15, 316
#1:	       ldiu	256 -> r3
#2:	       ldiu	288 -> r2
#3:	       ldi	1 -> r1
	;;
#0:	       add	r15, r3 -> r3
#1:	       ldi	0 -> r12
	;;
#0:	       sub	r31, 1 -> r0
#1:	       sub	r1, r31 -> r11
	;;
#0:	       stm.a	r0, r3, 15
#1:	       add	r15, r2 -> r3
#2:	       cmp lt	r0, 0 -> c1
#3:	       ldi	43 -> r2
	;;
#0:	       stmb.a	r13, r3, 20
#1:	       ldi	-1 -> r3
#2:	       ldi	45 -> r0
	;;
#0:	if !c1 add	r31, r3 -> r11 ; aaaf
#1:	if  c1 or	r0, 0 -> r2
	;;
#2:	       or	r2.27, 1 -> r0
#0:	       cmp lt	r11, 10 -> c1
	;;
#0:	if !c1 br @	.BB6_292
#1:	       stmb.a	r2, r0, 0
	;;
.BB6_277:                               ;   in Loop: Header=BB6_12 Depth=1
#2:	       or	r2.27, 2 -> r1
#0:	       ldi	48 -> r0
	;;
#0:	       stmb.a	r0, r1, 0
#1:	       or	r1.27, 0 -> r0
#2:	       s2add	r11, 12 -> r1
	;;
#0:	       br	.BB6_297
#1:	       ldm.s	r15, 40
	;;
#0:	       or	r31, 0 -> r3
	;;
#0:	       stmb.a	r1, r3, 0
	;;
.BB6_278:                               ; %.preheader
                                        ;   Parent Loop BB6_12 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       or	r1, 0 -> r2
	;;
#0:	       and	r2, 3 -> r0
	;;
#0:	       brz eq @	r0, .BB6_300
	;;
.BB6_279:                               ;   in Loop: Header=BB6_278 Depth=2
#0:	       ldm.f	r2, 0
#1:	       add	r2, 1 -> r1
	;;
#0:	       bbh	mzext8 r2 -> r0
	;;
#0:	       brz ne @	r0, .BB6_278
	;;
#0:	       br @	.BB6_304
	;;
.BB6_280:                               ;   in Loop: Header=BB6_12 Depth=1
#2:	       sub	r2.25, r2 -> r3
	;;
#0:	       cmpu lt	r3, 4 -> c1
	;;
#0:	if  c1 br @	.BB6_308
	;;
.BB6_281:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldm.s	r15, 56
#1:	       br	.BB6_306
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       add	r0, r2 -> r4
	;;
.BB6_282:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       bbh	zext8 r2 -> r0
	;;
#0:	       cmp eq	r0, 2 -> c1
	;;
#0:	if  c1 br @	.BB6_314
	;;
.BB6_283:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       cmp eq	r0, 1 -> c1
	;;
#0:	if !c1 br @	.BB6_317
	;;
.BB6_284:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       cmpu gt	r12, 9 -> c1
	;;
#0:	if  c1 br @	.BB6_321
	;;
.BB6_285:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       s2add	r12, 12 -> r0
	;;
.BB6_286:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldiu	192 -> r1
#1:	       br	.BB6_336
	;;
#0:	       add	r15, r1 -> r1
	;;
#0:	       stmb.a	r0, r1, 31
#2:	       or	r2.28, 0 -> r0
	;;
.BB6_287:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldi	102 -> r0
#1:	       ldm.f	r15, 316
	;;
#0:	       cmp ne	r13, r0 -> c1
	;;
#0:	if  c1 br @	.BB6_324
#2:	       or	r31, 0 -> r2.23
	;;
.BB6_288:                               ;   in Loop: Header=BB6_12 Depth=1
#2:	       cmp lt	r2.23, 1 -> c1
	;;
#0:	if  c1 br @	.BB6_326
	;;
.BB6_289:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       brz ne @	r12, .BB6_291
	;;
.BB6_290:                               ;   in Loop: Header=BB6_12 Depth=1
#3:	       btest	r3.24, 0 -> c1
	;;
#0:	if !c1 br @	.BB6_329
	;;
.BB6_291:                               ;   in Loop: Header=BB6_12 Depth=1
#2:	       add	r12, r2.23 -> r0
#0:	       br	.BB6_339
	;;
#2:	       add	r0, 1 -> r2.24
	;;
	       nop	0
	;;
.BB6_292:                               ; %.preheader.i.i
                                        ;   Parent Loop BB6_12 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldiu	320 -> r2
#1:	       callg	___modsi3
#2:	       or	r11, 0 -> r0
#3:	       ldi	10 -> r1
	;;
#0:	       add	r15, r2 -> r2
	;;
#3:	       add	r2, 8 -> r3.27
	;;
#3:	       add	r3.27, r12 -> r3.26
	;;
#0:	       callg	___divsi3
#1:	       ldi	99 -> r3
#2:	       s2add	r0, 12 -> r0
#3:	       ldi	10 -> r1
	;;
#3:	       stmb.a	r0, r3.26, 6
#0:	       cmp gt	r11, r3 -> c1
#1:	       or	r11, 0 -> r0
	;;
#0:	       ldx	$c1, 0 -> r2
	;;
#0:	       stm.s	r2, r15, 11
	;;
#0:	       ldm.s	r15, 44
#1:	       or	r0, 0 -> r11
#2:	       sub	r12, 1 -> r12
	;;
#0:	       stx	r31 -> $c1
	;;
#0:	if  c1 br @	.BB6_292
	;;
.BB6_293:                               ;   in Loop: Header=BB6_12 Depth=1
#3:	       add	r3.27, r12 -> r2
#0:	       s2add	r11, 12 -> r3
	;;
#0:	       stmb.a	r3, r2, 6
#1:	       add	r2, 6 -> r1
	;;
#0:	       ldm.s	r15, 24
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldm.s	r15, 28
	;;
#0:	       cmpu ge	r1, r0 -> c1
	;;
#0:	if  c1 br @	.BB6_297
#1:	       or	r31, 0 -> r0
	;;
.BB6_294:                               ; %.lr.ph.i.i
                                        ;   in Loop: Header=BB6_12 Depth=1
#2:	       or	r2.27, 2 -> r1
#0:	       brz eq	r12, .BB6_297
#1:	       ldm.s	r15, 40
	;;
#0:	       or	r31, 0 -> r0
#1:	       stmb.a	r3, r1, 0
	;;
#0:	       sub	r0, r12 -> r0
	;;
.BB6_295:                               ; %._crit_edge.i.i.preheader
                                        ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldi	0 -> r1
#1:	       ldi	0 -> r4
	;;
#0:	       sub	r1, r12 -> r3
	;;
.BB6_296:                               ; %._crit_edge.i.i
                                        ;   Parent Loop BB6_12 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       add	r2, r4 -> r5
#1:	       sub	r3, 1 -> r3
	;;
#0:	       ldm.f	r5, 7
#1:	       add	r5, 3 -> r1
	;;
#0:	       bbh	mzext8 r1 -> r5
#1:	       ldm.s	r15, 40
	;;
#0:	       brz ne	r3, .BB6_296
#1:	       or	r31, 0 -> r1
	;;
#0:	       add	r1, r4 -> r1
#1:	       add	r4, 1 -> r4
	;;
#0:	       stmb.a	r5, r1, 0
	;;
.BB6_297:                               ; %exponent.exit.i
                                        ;   in Loop: Header=BB6_12 Depth=1
#2:	       sub	r0, r2.27 -> r2.29
#0:	       ldm.f	r15, 304
	;;
#2:	       add	r2.29, r31 -> r2.24
#0:	       cmp gt	r31, 1 -> c1
	;;
#0:	if  c1 br @	.BB6_299
	;;
.BB6_298:                               ;   in Loop: Header=BB6_12 Depth=1
#3:	       btest	r3.24, 0 -> c1
#2:	       ldi	0 -> r2.23
	;;
#0:	if !c1 br @	.BB6_339
	;;
.BB6_299:                               ;   in Loop: Header=BB6_12 Depth=1
#2:	       add	r2.24, 1 -> r2.24
#0:	       br	.BB6_339
	;;
#2:	       ldi	0 -> r2.23
	;;
	       nop	0
	;;
.BB6_300:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldiu	1791 -> r4
#1:	       ldga	32896 -> r1
#2:	       ldm.f	r2, 0
	;;
#0:	       ldim	991 -> r4
#1:	       ldih	1028 -> r1
	;;
#0:	       ldih	2039 -> r4
#1:	       and	r31, r1 -> r0
	;;
#0:	       add	r31, r4 -> r3
#1:	       xor	r0, r1 -> r0
	;;
#0:	       and	r0, r3 -> r0
	;;
#0:	       brz ne @	r0, .BB6_302
	;;
.BB6_301:                               ; %.lr.ph5.i22.i
                                        ;   Parent Loop BB6_12 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r2, 4
#1:	       add	r2, 4 -> r2
	;;
#0:	       and	r31, r1 -> r0
#1:	       add	r31, r4 -> r3
	;;
#0:	       xor	r0, r1 -> r0
	;;
#0:	       and	r0, r3 -> r0
	;;
#0:	       brz eq @	r0, .BB6_301
	;;
.BB6_302:                               ; %._crit_edge6.i24.i
                                        ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldm.f	r2, 0
	;;
#0:	       bbh	mzext8 r2 -> r0
	;;
#0:	       brz eq @	r0, .BB6_304
	;;
.BB6_303:                               ; %.lr.ph.i26.i
                                        ;   Parent Loop BB6_12 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r2, 1
#1:	       add	r2, 1 -> r1
	;;
#0:	       or	r1, 0 -> r2
	;;
#0:	       bbh	mzext8 r1 -> r0
	;;
#0:	       brz ne @	r0, .BB6_303
	;;
.BB6_304:                               ;   in Loop: Header=BB6_12 Depth=1
#2:	       ldi	0 -> r2.23
#0:	       ldm.s	r15, 56
#1:	       ldi	115 -> r13
	;;
#0:	       br	.BB6_332
#2:	       or	r2.23, 0 -> r12
	;;
#0:	       or	r31, 0 -> r0
	;;
#2:	       sub	r2, r0 -> r2.24
	;;
.BB6_305:                               ;   in Loop: Header=BB6_306 Depth=2
#0:	       add	r4, 4 -> r4
#1:	       sub	r3, 4 -> r3
	;;
.BB6_306:                               ;   Parent Loop BB6_12 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       cmpu lt	r3, 4 -> c1
	;;
#0:	if  c1 br @	.BB6_308
	;;
.BB6_307:                               ;   in Loop: Header=BB6_306 Depth=2
#0:	       ldiu	1791 -> r0
#1:	       ldga	32896 -> r1
#2:	       ldm.f	r4, 0
	;;
#0:	       ldim	991 -> r0
#1:	       ldih	1028 -> r1
	;;
#0:	       ldih	2039 -> r0
	;;
#0:	       add	r31, r0 -> r2
#1:	       and	r31, r1 -> r0
	;;
#0:	       xor	r0, r1 -> r0
	;;
#0:	       and	r0, r2 -> r0
	;;
#0:	       brz eq @	r0, .BB6_305
	;;
.BB6_308:                               ; %.preheader.i18.i.preheader
                                        ;   in Loop: Header=BB6_12 Depth=1
#0:	       sub	r4, 1 -> r0
	;;
.BB6_309:                               ; %.preheader.i18.i
                                        ;   Parent Loop BB6_12 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       brz eq @	r3, .BB6_330
	;;
.BB6_310:                               ;   in Loop: Header=BB6_309 Depth=2
#0:	       ldm.f	r0, 1
#1:	       add	r0, 1 -> r2
#2:	       sub	r3, 1 -> r3
	;;
#0:	       or	r2, 0 -> r0
	;;
#0:	       bbh	mzext8 r2 -> r1
	;;
#0:	       brz ne @	r1, .BB6_309
	;;
.BB6_311:                               ; %memchr.exit.i
                                        ;   in Loop: Header=BB6_12 Depth=1
#0:	       brz eq @	r2, .BB6_330
	;;
.BB6_312:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldm.s	r15, 56
#1:	       ldi	115 -> r13
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldm.s	r15, 56
	;;
#0:	       sub	r2, r0 -> r0
	;;
#2:	       cmp gt	r0, r2.25 -> c1
#0:	       or	r31, 0 -> r0
	;;
#2:	if !c1 sub	r2, r0 -> r2.25 ; aaaf
	;;
.BB6_313:                               ;   in Loop: Header=BB6_12 Depth=1
#2:	       ldi	0 -> r2.23
#0:	       br @	.BB6_331
	;;
.BB6_314:                               ;   in Loop: Header=BB6_12 Depth=1
#2:	       or	r2.28, 0 -> r3
	;;
.BB6_315:                               ; %.preheader64.i
                                        ;   Parent Loop BB6_12 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.s	r15, 48
#1:	       and	r12, 15 -> r0
#2:	       sr	r12, 4 -> r12
	;;
#0:	       or	r31, 0 -> r1
#1:	       ldm.s	r15, 48
	;;
#0:	       add	r1, r0 -> r2
	;;
#0:	       or	r31, 0 -> r1
	;;
#0:	       brz ne	r12, .BB6_315
#1:	       ldmr.f	r0, r1, 0
	;;
#0:	       bbh	mzext8 r2 -> r0
	;;
#0:	       stmb.a	r0, r3, 0
#1:	       sub	r3, 1 -> r3
	;;
.BB6_316:                               ; %.loopexit65.i.loopexit
                                        ;   in Loop: Header=BB6_12 Depth=1
#0:	       add	r3, 1 -> r0
#1:	       br @	.BB6_336
	;;
.BB6_317:                               ;   in Loop: Header=BB6_12 Depth=1
#2:	       or	r2.28, 0 -> r2
#0:	       brz ne	r0, .BB6_333
#1:	       ldga	._.str750 -> r1
	;;
#0:	       stm.s	r2, r15, 14
	;;
	       nop	0
	;;
.BB6_318:                               ; %.preheader67.i
                                        ;   Parent Loop BB6_12 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.s	r15, 56
#1:	       and	r12, 7 -> r0
#2:	       ldi	48 -> r1
#3:	       sr	r12, 3 -> r12
	;;
#0:	       or	r0, r1 -> r0
	;;
#0:	       or	r31, 0 -> r2
	;;
#0:	       stmb.a	r0, r2, 0
	;;
#0:	       ldm.s	r15, 56
	;;
#0:	       brz ne	r12, .BB6_318
#1:	       or	r31, 0 -> r3
	;;
#0:	       sub	r3, 1 -> r2
	;;
#0:	       stm.s	r2, r15, 14
	;;
.BB6_319:                               ;   in Loop: Header=BB6_12 Depth=1
#3:	       btest	r3.24, 0 -> c1
#0:	       cmp eq	r0, r1 -> c3
	;;
#0:	       comb	and !c1, !c1 -> c2
	;;
#0:	       comb	or c2, c3 -> c1
	;;
#0:	if  c1 br @	.BB6_335
	;;
.BB6_320:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldm.s	r15, 56
#1:	       br	.BB6_337
#2:	       ldi	48 -> r0
	;;
#0:	       or	r31, 0 -> r1
	;;
#0:	       stmb.a	r0, r1, 0
	;;
.BB6_321:                               ;   in Loop: Header=BB6_12 Depth=1
#2:	       or	r2.28, 0 -> r11
	;;
.BB6_322:                               ; %.preheader70.i
                                        ;   Parent Loop BB6_12 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       or	r12, 0 -> r0
#1:	       callg	___umodsi3
#2:	       ldi	10 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       callg	___udivsi3
#1:	       or	r0, 0 -> r1
#2:	       ldi	48 -> r3
	;;
#0:	       or	r1, r3 -> r0
#1:	       ldi	10 -> r1
	;;
#0:	       stmb.a	r0, r11, 0
#1:	       or	r12, 0 -> r0
	;;
	       nop	0
	;;
#0:	       cmpu gt	r12, 9 -> c1
#1:	       sub	r11, 1 -> r11
#2:	       or	r0, 0 -> r12
	;;
#0:	if  c1 br @	.BB6_322
	;;
.BB6_323:                               ; %.loopexit65.i.loopexit9
                                        ;   in Loop: Header=BB6_12 Depth=1
#0:	       add	r11, 1 -> r0
#1:	       br @	.BB6_336
	;;
.BB6_324:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldm.f	r15, 304
	;;
#0:	       or	r31, 0 -> r2
	;;
#2:	       cmp lt	r2.23, r2 -> c1
	;;
#0:	if !c1 br @	.BB6_338
	;;
.BB6_325:                               ;   in Loop: Header=BB6_12 Depth=1
#2:	       cmp gt	r2.23, 0 -> c1
#0:	       br	.BB6_339
#1:	       ldi	1 -> r0
#3:	       ldi	2 -> r1
	;;
#2:	if !c1 sub	r1, r2.23 -> r0 ; aaaf
	;;
#2:	       add	r2, r0 -> r2.24
	;;
.BB6_326:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       brz ne @	r12, .BB6_328
	;;
.BB6_327:                               ;   in Loop: Header=BB6_12 Depth=1
#3:	       btest	r3.24, 0 -> c1
#2:	       ldi	1 -> r2.24
	;;
#0:	if !c1 br @	.BB6_339
	;;
.BB6_328:                               ;   in Loop: Header=BB6_12 Depth=1
#2:	       add	r12, 2 -> r2.24
#0:	       br @	.BB6_339
	;;
.BB6_329:                               ;   in Loop: Header=BB6_12 Depth=1
#2:	       or	r2.23, 0 -> r2.24
#0:	       br @	.BB6_339
	;;
.BB6_330:                               ;   in Loop: Header=BB6_12 Depth=1
#2:	       ldi	0 -> r2.23
#0:	       ldi	115 -> r13
	;;
.BB6_331:                               ;   in Loop: Header=BB6_12 Depth=1
#2:	       or	r2.23, 0 -> r12
	;;
#2:	       or	r2.25, 0 -> r2.24
	;;
.BB6_332:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       or	r5, 0 -> r14
#1:	       br @	.BB6_59
	;;
.BB6_333:                               ; %.preheader10
                                        ;   Parent Loop BB6_12 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       and	r1, 3 -> r0
	;;
#0:	       brz eq @	r0, .BB6_341
	;;
.BB6_334:                               ;   in Loop: Header=BB6_333 Depth=2
#0:	       ldm.f	r1, 0
#1:	       add	r1, 1 -> r3
#2:	       or	r1, 0 -> r0
	;;
#0:	       bbh	mzext8 r1 -> r2
#1:	       or	r3, 0 -> r1
	;;
#0:	       brz ne @	r2, .BB6_333
	;;
#0:	       brz eq @	r2, .BB6_346
	;;
.BB6_335:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldm.s	r15, 56
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       add	r0, 1 -> r0
	;;
.BB6_336:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       stm.s	r0, r15, 14
	;;
.BB6_337:                               ; %.loopexit65.i
                                        ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldm.s	r15, 36
#1:	       br	.BB6_347
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldm.s	r15, 56
	;;
#0:	       or	r31, 0 -> r1
	;;
.BB6_338:                               ;   in Loop: Header=BB6_12 Depth=1
#3:	       and	r3.24, 1 -> r0
	;;
#2:	       add	r2.23, r0 -> r2.24
	;;
.BB6_339:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldm.f	r15, 320
#1:	       ldi	0 -> r12
	;;
#0:	       bbh	mzext8 r0.25 -> r0
	;;
#0:	       brz eq @	r0, .BB6_348
	;;
.BB6_340:                               ;   in Loop: Header=BB6_12 Depth=1
#3:	       or	r3.25, 0 -> r3.24
#0:	       ldi	0 -> r12
#1:	       ldiu	320 -> r1
#2:	       ldi	45 -> r0
	;;
#0:	       br	.BB6_59
#1:	       add	r15, r1 -> r1
	;;
#0:	       stmb.a	r0, r1, 4
	;;
	       nop	0
	;;
.BB6_341:                               ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldiu	1791 -> r3
#1:	       ldga	32896 -> r0
#2:	       ldm.f	r1, 0
	;;
#0:	       ldim	991 -> r3
#1:	       ldih	1028 -> r0
	;;
#0:	       ldih	2039 -> r3
#1:	       and	r31, r0 -> r2
	;;
#0:	       add	r31, r3 -> r4
#1:	       xor	r2, r0 -> r2
	;;
#0:	       and	r2, r4 -> r2
	;;
#0:	       brz ne @	r2, .BB6_343
	;;
.BB6_342:                               ; %.lr.ph5.i33.i
                                        ;   Parent Loop BB6_12 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r1, 4
#1:	       add	r1, 4 -> r1
	;;
#0:	       and	r31, r0 -> r2
#1:	       add	r31, r3 -> r4
	;;
#0:	       xor	r2, r0 -> r2
	;;
#0:	       and	r2, r4 -> r2
	;;
#0:	       brz eq @	r2, .BB6_342
	;;
.BB6_343:                               ; %._crit_edge6.i35.i
                                        ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldm.f	r1, 0
	;;
#0:	       bbh	mzext8 r1 -> r0
	;;
#0:	       brz eq @	r0, .BB6_345
	;;
.BB6_344:                               ; %.lr.ph.i37.i
                                        ;   Parent Loop BB6_12 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r1, 1
#1:	       add	r1, 1 -> r2
	;;
#0:	       or	r2, 0 -> r1
	;;
#0:	       bbh	mzext8 r2 -> r0
	;;
#0:	       brz ne @	r0, .BB6_344
	;;
.BB6_345:                               ; %._crit_edge.i39.i
                                        ;   in Loop: Header=BB6_12 Depth=1
#0:	       or	r1, 0 -> r0
	;;
.BB6_346:                               ; %strlen.exit41.i
                                        ;   in Loop: Header=BB6_12 Depth=1
#0:	       ldga	._.str750 -> r1
	;;
#0:	       stm.s	r1, r15, 14
#1:	       ldga	._.str750 -> r1
	;;
.BB6_347:                               ; %strlen.exit41.i
                                        ;   in Loop: Header=BB6_12 Depth=1
#2:	       sub	r0, r1 -> r2.24
#0:	       br	.BB6_59
	;;
#2:	       ldi	0 -> r2.23
	;;
#2:	       or	r2.25, 0 -> r12
	;;
.BB6_348:                               ;   in Loop: Header=BB6_12 Depth=1
#3:	       or	r3.25, 0 -> r3.24
#0:	       br @	.BB6_59
	;;
.BB6_349:                               ; %.loopexit97.i
#0:	       ldm.f	r15, 296
	;;
#0:	       brz eq @	r31, .BB6_351
	;;
.BB6_350:
#0:	       s2add	r15, 16 -> r10
#1:	       callg	___ssprint_r
#2:	       ldiu	288 -> r14
	;;
#0:	       add	r10, 8 -> r0
#1:	       add	r15, r14 -> r10
	;;
#0:	       add	r10, 0 -> r1
	;;
	       nop	0
	;;
#0:	       brz ne @	r0, .BB6_353
	;;
.BB6_351:
#0:	       stm.a	0, r0.24, 0
#1:	       br @	.BB6_353
	;;
.BB6_352:
#0:	       ldga	_impure_data -> r0
	;;
#0:	       stm.a	12, r0, 0
	;;
.BB6_353:                               ; %_svfprintf_r.exit
#0:	       ldm.f	r15, 72
	;;
#0:	       stmb.a	0, r31, 0
	;;
#0:	       ldm.s	r15, 336
	;;
#0:	       stx	r31 -> $ro
#1:	       ldm.s	r15, 340
	;;
#0:	       stx	r31 -> $rb
#1:	       ldm.s	r15, 344
	;;
#0:	       stx	r31 -> $f13
#1:	       ldm.s	r15, 348
	;;
#0:	       stx	r31 -> $f12
#1:	       ldm.s	r15, 352
	;;
#0:	       stx	r31 -> $f11
#1:	       ldm.s	r15, 356
	;;
#0:	       stx	r31 -> $f10
#1:	       ldm.s	r15, 360
	;;
#3:	       or	r31, 0 -> r3.29
#0:	       ldm.s	r15, 364
	;;
#2:	       or	r31, 0 -> r2.29
#0:	       ldm.s	r15, 368
	;;
#3:	       or	r31, 0 -> r3.28
#0:	       ldm.s	r15, 372
	;;
#2:	       or	r31, 0 -> r2.28
#0:	       ldm.s	r15, 376
	;;
#0:	       or	r31, 0 -> r0.28
#1:	       ldm.s	r15, 380
	;;
#3:	       or	r31, 0 -> r3.27
#0:	       ldm.s	r15, 384
	;;
#2:	       or	r31, 0 -> r2.27
#0:	       ldm.s	r15, 388
	;;
#1:	       or	r31, 0 -> r1.27
#0:	       ldm.s	r15, 392
	;;
#0:	       or	r31, 0 -> r0.27
#1:	       ldm.s	r15, 396
	;;
#3:	       or	r31, 0 -> r3.26
#0:	       ldm.s	r15, 400
	;;
#2:	       or	r31, 0 -> r2.26
#0:	       ldm.s	r15, 404
	;;
#1:	       or	r31, 0 -> r1.26
#0:	       ldm.s	r15, 408
	;;
#0:	       or	r31, 0 -> r0.26
#1:	       ldm.s	r15, 412
	;;
#3:	       or	r31, 0 -> r3.25
#0:	       ldm.s	r15, 416
	;;
#2:	       or	r31, 0 -> r2.25
#0:	       ldm.s	r15, 420
	;;
#1:	       or	r31, 0 -> r1.25
#0:	       ldm.s	r15, 424
	;;
#0:	       or	r31, 0 -> r0.25
#1:	       ldm.s	r15, 428
	;;
#3:	       or	r31, 0 -> r3.24
#0:	       ldm.s	r15, 432
	;;
#2:	       or	r31, 0 -> r2.24
#0:	       ldm.s	r15, 436
	;;
#1:	       or	r31, 0 -> r1.24
#0:	       ldm.s	r15, 440
	;;
#0:	       or	r31, 0 -> r0.24
#1:	       ldm.s	r15, 444
	;;
#3:	       or	r31, 0 -> r3.23
#0:	       ldm.s	r15, 448
	;;
#2:	       or	r31, 0 -> r2.23
#0:	       ldm.s	r15, 452
	;;
#1:	       or	r31, 0 -> r1.23
#0:	       ldm.s	r15, 456
	;;
#0:	       or	r31, 0 -> r0.23
#1:	       ldm.s	r15, 460
	;;
#0:	       or	r31, 0 -> r14
#1:	       ldm.s	r15, 464
	;;
#0:	       or	r31, 0 -> r13
#1:	       ldm.s	r15, 468
	;;
#0:	       or	r31, 0 -> r12
#1:	       ldm.s	r15, 472
	;;
#0:	       or	r31, 0 -> r11
#1:	       ldm.s	r15, 476
#2:	       addi	512 -> r15
	;;
#0:	       jop	ret
#1:	       or	r31, 0 -> r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
_sprintf_end:
.tmp6:
	.size	_sprintf, .tmp6-_sprintf
	.section	.rodata,"a",@progbits
	.align	4
.JTI6_0:
	.long	.BB6_38-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_40-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_41-_sprintf_start
	.long	.BB6_44-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_43-_sprintf_start
	.long	.BB6_35-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_46-_sprintf_start
	.long	.BB6_34-_sprintf_start
	.long	.BB6_34-_sprintf_start
	.long	.BB6_34-_sprintf_start
	.long	.BB6_34-_sprintf_start
	.long	.BB6_34-_sprintf_start
	.long	.BB6_34-_sprintf_start
	.long	.BB6_34-_sprintf_start
	.long	.BB6_34-_sprintf_start
	.long	.BB6_34-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_220-_sprintf_start
	.long	.BB6_224-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_224-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_47-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_229-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_233-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_242-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_237-_sprintf_start
	.long	.BB6_221-_sprintf_start
	.long	.BB6_224-_sprintf_start
	.long	.BB6_224-_sprintf_start
	.long	.BB6_224-_sprintf_start
	.long	.BB6_48-_sprintf_start
	.long	.BB6_221-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_27-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_51-_sprintf_start
	.long	.BB6_230-_sprintf_start
	.long	.BB6_238-_sprintf_start
	.long	.BB6_27-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_239-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_234-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_57-_sprintf_start
	.long	.BB6_241-_sprintf_start

	.text
	.type	___sfvwrite_r,@function
___sfvwrite_r:                          ; @__sfvwrite_r
	.funsz	___sfvwrite_r_end-___sfvwrite_r
___sfvwrite_r_start:
; BB#0:
#0:	       wb.s	r15, 22
#1:	       addi	-88 -> r15
#2:	       ldx	$rb, 0 -> r2
#3:	       ldx	$ro, 0 -> r3
	;;
#0:	       stm.s	r10, r15, 17
#1:	       or	r1, 0 -> r10
	;;
#0:	       stm.s	r11, r15, 16
	;;
#0:	       stm.s	r12, r15, 15
#1:	       or	r0, 0 -> r12
#2:	       ldi	0 -> r0
	;;
#0:	       stm.s	r13, r15, 14
	;;
#0:	       stm.s	r14, r15, 13
	;;
#1:	       stm.s	r1.23, r15, 12
	;;
#2:	       stm.s	r2.23, r15, 11
	;;
#3:	       stm.s	r3.23, r15, 10
	;;
#1:	       stm.s	r1.24, r15, 9
	;;
#2:	       stm.s	r2.24, r15, 8
	;;
#1:	       stm.s	r1.25, r15, 7
	;;
#2:	       stm.s	r2.25, r15, 6
	;;
#1:	       stm.s	r1.26, r15, 5
	;;
#2:	       stm.s	r2.26, r15, 4
	;;
#0:	       stm.s	r2, r15, 3
	;;
#0:	       stm.s	r3, r15, 2
	;;
#0:	       ldm.f	r10, 8
	;;
#0:	       cmp eq	r31, 0 -> c3
	;;
#0:	if  c3 br @	.BB7_139
	;;
.BB7_1:
#0:	       ldm.f	r12, 12
	;;
#0:	       bbh	mzext16 r12 -> r0
	;;
#0:	       btest	r0, 3 -> !c1
	;;
#0:	if  c1 br @	.BB7_3
	;;
.BB7_2:
#0:	       ldm.f	r12, 16
	;;
#0:	       brz ne @	r31, .BB7_5
	;;
.BB7_3:
#0:	       or	r12, 0 -> r0
#1:	       callg	___swsetup_r
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldm.f	r12, 12
#1:	       or	r0, 0 -> r1
	;;
#0:	       brz eq @	r1, .BB7_5
#1:	       bbh	mzext16 r12 -> r0
	;;
.BB7_4:
#0:	       ldi	64 -> r1
#1:	       ldga	_impure_data -> r3
	;;
#0:	       br	.BB7_48
#1:	       or	r0, r1 -> r0
	;;
#0:	       stmh.a	r0, r12, 6
	;;
#0:	       stm.a	9, r3, 0
	;;
.BB7_5:                                 ; %._crit_edge18
#0:	       bbh	sext16 r0 -> r0
#1:	       ldm.f	r10, 0
	;;
#0:	       btest	r0, 1 -> !c1
	;;
#0:	if  c1 br @	.BB7_7
#1:	       or	r31, 0 -> r13
	;;
.BB7_6:                                 ; %.preheader
#3:	       ldiu	1024 -> r3.23
#0:	       br @	.BB7_10
#1:	       ldi	0 -> r11
#2:	       ldi	0 -> r14
	;;
.BB7_7:
#0:	       btest	r0, 0 -> c1
	;;
#0:	if !c1 br @	.BB7_13
	;;
.BB7_8:                                 ; %.preheader3
#1:	       ldiu	522 -> r1.24
#2:	       ldi	0 -> r2.23
#0:	       ldga	32896 -> r0
#3:	       ldi	0 -> r14
	;;
#1:	       ldiu	1791 -> r1.23
#2:	       ldi	0 -> r2.25
#0:	       stm.s	r0, r15, 1
	;;
#1:	       ldim	321 -> r1.24
#2:	       ldi	0 -> r2.24
#0:	       ldm.s	r15, 4
	;;
#1:	       ldim	991 -> r1.23
#2:	       ldi	0 -> r2.26
	;;
#0:	       br	.BB7_15
#1:	       ldih	80 -> r1.24
#2:	       or	r31, 0 -> r3
	;;
#1:	       ldih	2039 -> r1.23
#0:	       ldih	1028 -> r3
	;;
#0:	       stm.s	r3, r15, 1
	;;
.BB7_9:                                 ;   in Loop: Header=BB7_10 Depth=1
#0:	       ldm.f	r13, 4
#1:	       add	r13, 8 -> r0
	;;
#0:	       or	r31, 0 -> r14
#1:	       ldm.f	r13, 0
#2:	       or	r0, 0 -> r13
	;;
#0:	       or	r31, 0 -> r11
	;;
.BB7_10:                                ; =>This Inner Loop Header: Depth=1
#0:	       brz eq @	r14, .BB7_9
	;;
.BB7_11:                                ;   in Loop: Header=BB7_10 Depth=1
#3:	       cmpu lt	r14, r3.23 -> c1
#0:	       ldm.f	r12, 28
#1:	       ldiu	1024 -> r3
#2:	       ldga	_impure_data -> r0
	;;
#0:	if  c1 or	r14, 0 -> r3
#1:	       or	r11, 0 -> r2
	;;
#0:	       or	r31, 0 -> r1
#1:	       ldm.f	r12, 36
	;;
#0:	       jop	call	r31
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r1
	;;
#0:	       cmp lt	r1, 1 -> c1
	;;
#0:	if  c1 br @	.BB7_47
	;;
.BB7_12:                                ;   in Loop: Header=BB7_10 Depth=1
#0:	       ldm.f	r10, 8
#1:	       sub	r14, r1 -> r14
#2:	       add	r11, r1 -> r11
	;;
#0:	       cmp eq	r31, r1 -> c1
#1:	       sub	r31, r1 -> r0
	;;
#0:	if  c1 br @	.BB7_139
#1:	if !c1 br @	.BB7_10
#2:	       stm.a	r0, r10, 2
#3:	       ldi	0 -> r0
	;;
.BB7_13:                                ; %.preheader9
#3:	       ldiu	895 -> r3.23
#1:	       ldi	0 -> r1.23
#2:	       ldiu	1152 -> r2.23
#0:	       ldi	128 -> r14
	;;
#0:	       br	.BB7_71
#3:	       ldim	31 -> r3.23
#1:	       ldi	0 -> r1.25
	;;
#1:	       ldi	0 -> r1.24
	;;
	       nop	0
	;;
.BB7_14:                                ;   in Loop: Header=BB7_15 Depth=1
#2:	       ldi	0 -> r2.25
#0:	       ldm.f	r13, 4
#1:	       add	r13, 8 -> r0
	;;
#0:	       or	r31, 0 -> r14
#1:	       ldm.f	r13, 0
#2:	       or	r0, 0 -> r13
	;;
#2:	       or	r31, 0 -> r2.24
	;;
.BB7_15:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB7_36 Depth 2
                                        ;     Child Loop BB7_27 Depth 2
                                        ;     Child Loop BB7_24 Depth 2
                                        ;     Child Loop BB7_17 Depth 2
                                        ;     Child Loop BB7_58 Depth 2
                                        ;     Child Loop BB7_56 Depth 2
                                        ;     Child Loop BB7_54 Depth 2
                                        ;     Child Loop BB7_41 Depth 2
                                        ;     Child Loop BB7_65 Depth 2
                                        ;     Child Loop BB7_63 Depth 2
                                        ;     Child Loop BB7_61 Depth 2
#0:	       brz eq @	r14, .BB7_14
	;;
.BB7_16:                                ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldi	0 -> r1
#2:	       brz ne @	r2.25, .BB7_33
	;;
.BB7_17:                                ; %.preheader2
                                        ;   Parent Loop BB7_15 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#2:	       add	r2.24, r1 -> r3
	;;
#0:	       and	r3, 3 -> r0
	;;
#0:	       brz eq @	r0, .BB7_21
	;;
.BB7_18:                                ;   in Loop: Header=BB7_17 Depth=2
#0:	       cmp eq	r14, r1 -> c1
	;;
#0:	if  c1 br @	.BB7_30
	;;
.BB7_19:                                ;   in Loop: Header=BB7_17 Depth=2
#0:	       ldm.f	r3, 0
#1:	       add	r1, 1 -> r1
	;;
#0:	       bbh	mzext8 r3 -> r0
	;;
#0:	       cmp eq	r0, 10 -> c1
	;;
#0:	if !c1 br @	.BB7_17
	;;
.BB7_20:                                ; %memchr.exit.loopexit3
                                        ;   in Loop: Header=BB7_15 Depth=1
#2:	       add	r2.24, r1 -> r0
#0:	       br	.BB7_29
	;;
#0:	       sub	r0, 1 -> r1
	;;
	       nop	0
	;;
.BB7_21:                                ;   in Loop: Header=BB7_15 Depth=1
#0:	       sub	r14, r1 -> r4
	;;
#0:	       cmpu lt	r4, 4 -> c1
	;;
#0:	if  c1 br @	.BB7_26
	;;
.BB7_22:                                ;   in Loop: Header=BB7_15 Depth=1
#2:	       add	r2.24, r1 -> r3
#0:	       br @	.BB7_24
	;;
.BB7_23:                                ;   in Loop: Header=BB7_24 Depth=2
#0:	       add	r3, 4 -> r3
#1:	       sub	r4, 4 -> r4
	;;
.BB7_24:                                ;   Parent Loop BB7_15 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       cmpu lt	r4, 4 -> c1
	;;
#0:	if  c1 br @	.BB7_26
	;;
.BB7_25:                                ;   in Loop: Header=BB7_24 Depth=2
#0:	       ldm.f	r3, 0
	;;
#1:	       xor	r31, r1.24 -> r0
#0:	       ldm.s	r15, 4
	;;
#1:	       add	r0, r1.23 -> r2
	;;
#0:	       or	r31, 0 -> r1
#1:	       ldm.s	r15, 4
	;;
#0:	       and	r0, r1 -> r0
	;;
#0:	       or	r31, 0 -> r1
	;;
#0:	       xor	r0, r1 -> r0
	;;
#0:	       and	r0, r2 -> r0
	;;
#0:	       brz eq @	r0, .BB7_23
	;;
.BB7_26:                                ; %.preheader.i1.preheader
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       sub	r3, 1 -> r0
	;;
.BB7_27:                                ; %.preheader.i1
                                        ;   Parent Loop BB7_15 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       brz eq @	r4, .BB7_30
	;;
.BB7_28:                                ;   in Loop: Header=BB7_27 Depth=2
#0:	       ldm.f	r0, 1
#1:	       add	r0, 1 -> r1
#2:	       sub	r4, 1 -> r4
	;;
#0:	       bbh	mzext8 r1 -> r0
	;;
#0:	       cmp eq	r0, 10 -> c1
#1:	       or	r1, 0 -> r0
	;;
#0:	if !c1 br @	.BB7_27
	;;
.BB7_29:                                ; %memchr.exit
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       brz ne @	r1, .BB7_31
	;;
.BB7_30:                                ; %memchr.exit.thread
                                        ;   in Loop: Header=BB7_15 Depth=1
#2:	       add	r14, 1 -> r2.26
#0:	       br @	.BB7_32
	;;
.BB7_31:                                ;   in Loop: Header=BB7_15 Depth=1
#0:	       add	r1, 1 -> r0
	;;
#2:	       sub	r0, r2.24 -> r2.26
	;;
.BB7_32:                                ; %memchr.exit.thread
                                        ;   in Loop: Header=BB7_15 Depth=1
#2:	       ldi	1 -> r2.25
	;;
.BB7_33:                                ; %._crit_edge17
                                        ;   in Loop: Header=BB7_15 Depth=1
#2:	       cmpu lt	r14, r2.26 -> c1
#0:	       ldm.f	r12, 8
	;;
#2:	       or	r2.26, 0 -> r3
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldm.f	r12, 20
#2:	if  c1 or	r14, 0 -> r3
	;;
#0:	       or	r31, 0 -> r4
#1:	       ldm.f	r12, 16
	;;
#0:	       add	r4, r0 -> r11
	;;
#0:	       or	r31, 0 -> r2
#1:	       ldm.f	r12, 0
#2:	       cmp gt	r3, r11 -> c2
	;;
#0:	       cmpu gt	r31, r2 -> c3
#1:	       or	r31, 0 -> r2
	;;
#0:	       comb	and c3, c2 -> c1
	;;
#0:	if !c1 br @	.BB7_37
	;;
.BB7_34:                                ;   in Loop: Header=BB7_15 Depth=1
#2:	       cmpu ge	r2.24, r2 -> c1
	;;
#2:	if !c1 add	r2.24, r11 -> r0
	;;
#0:	if !c1 cmpu le	r0, r2 -> c1
	;;
#0:	if  c1 br @	.BB7_42
	;;
.BB7_35:                                ;   in Loop: Header=BB7_15 Depth=1
#0:	       or	r11, 0 -> r3
#1:	       brz eq @	r11, .BB7_59
	;;
.BB7_36:                                ;   Parent Loop BB7_15 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#2:	       add	r2.24, r3 -> r1
	;;
#0:	       ldm.f	r1, -1
#1:	       sub	r1, 1 -> r0
	;;
#0:	       bbh	mzext8 r0 -> r1
#1:	       add	r2, r3 -> r0
#2:	       sub	r3, 1 -> r3
	;;
#0:	       brz ne	r3, .BB7_36
#1:	       sub	r0, 1 -> r0
	;;
#0:	       brz eq	r3, .BB7_59
#1:	       stmb.a	r1, r0, 0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB7_37:                                ;   in Loop: Header=BB7_15 Depth=1
#0:	       cmp lt	r3, r4 -> c1
	;;
#0:	if !c1 br @	.BB7_46
	;;
.BB7_38:                                ;   in Loop: Header=BB7_15 Depth=1
#2:	       cmpu ge	r2.24, r2 -> c1
	;;
#2:	if !c1 add	r2.24, r3 -> r0
	;;
#0:	if !c1 cmpu le	r0, r2 -> c1
	;;
#0:	if  c1 br @	.BB7_49
	;;
.BB7_39:                                ;   in Loop: Header=BB7_15 Depth=1
#0:	       cmp eq	r3, 0 -> c3
	;;
#0:	if  c3 br @	.BB7_66
	;;
.BB7_40:                                ; %.lr.ph24.i45
                                        ;   in Loop: Header=BB7_15 Depth=1
#2:	       xor	r2.26, -1 -> r0
#0:	       xor	r14, -1 -> r1
	;;
#0:	       cmpu gt	r0, r1 -> c1
	;;
#0:	if !c1 xor	r14, -1 -> r0 ; aiaf
	;;
#2:	       sub	r2.23, r0 -> r4
	;;
.BB7_41:                                ;   Parent Loop BB7_15 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#2:	       add	r2.24, r4 -> r1
	;;
#0:	       ldm.f	r1, -2
#1:	       sub	r1, 2 -> r0
	;;
#0:	       bbh	mzext8 r0 -> r1
#1:	       add	r2, r4 -> r0
#2:	       sub	r4, 1 -> r4
	;;
#0:	       cmp eq	r4, 1 -> c1
#1:	       sub	r0, 2 -> r0
	;;
#0:	if  c1 br @	.BB7_66
#1:	if !c1 br @	.BB7_41
#2:	       stmb.a	r1, r0, 0
	;;
.BB7_42:                                ;   in Loop: Header=BB7_15 Depth=1
#0:	       cmpu lt	r11, 16 -> c1
	;;
#0:	if  c1 br @	.BB7_45
	;;
.BB7_43:                                ;   in Loop: Header=BB7_15 Depth=1
#2:	       or	r2, r2.24 -> r0
	;;
#0:	       and	r0, 3 -> r0
	;;
#0:	       brz ne @	r0, .BB7_45
	;;
.BB7_44:                                ;   in Loop: Header=BB7_15 Depth=1
#2:	       or	r2.24, 0 -> r3
#0:	       br	.BB7_54
#1:	       cmpu gt	r11, 15 -> c1
#3:	       or	r11, 0 -> r4
	;;
#2:	       or	r2.24, 0 -> r1
	;;
	       nop	0
	;;
.BB7_45:                                ;   in Loop: Header=BB7_15 Depth=1
#2:	       or	r2.24, 0 -> r3
#0:	       br @	.BB7_57
#1:	       or	r11, 0 -> r4
	;;
.BB7_46:                                ;   in Loop: Header=BB7_15 Depth=1
#2:	       or	r2.24, 0 -> r2
#0:	       ldm.f	r12, 28
#1:	       ldga	_impure_data -> r0
#3:	       or	r4, 0 -> r3
	;;
#0:	       or	r31, 0 -> r1
#1:	       ldm.f	r12, 36
	;;
#0:	       jop	call	r31
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r11
	;;
#0:	       cmp lt	r11, 1 -> c1
	;;
#0:	if !c1 br @	.BB7_67
	;;
.BB7_47:                                ; %.loopexit2
#0:	       ldm.f	r12, 12
#1:	       ldi	64 -> r0
	;;
#0:	       bbh	mzext16 r12 -> r1
	;;
#0:	       or	r1, r0 -> r0
	;;
#0:	       stmh.a	r0, r12, 6
	;;
.BB7_48:                                ; %.loopexit2
#0:	       ldi	-1 -> r0
#1:	       br @	.BB7_139
	;;
.BB7_49:                                ;   in Loop: Header=BB7_15 Depth=1
#0:	       cmpu lt	r3, 16 -> c1
	;;
#0:	if  c1 br @	.BB7_52
	;;
.BB7_50:                                ;   in Loop: Header=BB7_15 Depth=1
#2:	       or	r2, r2.24 -> r0
	;;
#0:	       and	r0, 3 -> r0
	;;
#0:	       brz ne @	r0, .BB7_52
	;;
.BB7_51:                                ;   in Loop: Header=BB7_15 Depth=1
#2:	       or	r2.24, 0 -> r4
#0:	       br	.BB7_61
#1:	       cmpu gt	r3, 15 -> c1
#3:	       or	r3, 0 -> r5
	;;
#2:	       or	r2.24, 0 -> r1
	;;
	       nop	0
	;;
.BB7_52:                                ;   in Loop: Header=BB7_15 Depth=1
#2:	       or	r2.24, 0 -> r4
#0:	       br @	.BB7_64
#1:	       or	r3, 0 -> r5
	;;
.BB7_53:                                ; %.lr.ph10.i114
                                        ;   in Loop: Header=BB7_54 Depth=2
#0:	       ldm.f	r1, 0
#1:	       sub	r4, 16 -> r4
#2:	       add	r1, 16 -> r3
#3:	       add	r0, 16 -> r2
	;;
#0:	       cmpu gt	r4, 15 -> c1
	;;
#0:	       stm.a	r31, r0, 0
	;;
#0:	       ldm.f	r1, 4
	;;
#0:	       stm.a	r31, r0, 1
	;;
#0:	       ldm.f	r1, 8
	;;
#0:	       stm.a	r31, r0, 2
	;;
#0:	       ldm.f	r1, 12
#1:	       or	r3, 0 -> r1
	;;
#0:	       stm.a	r31, r0, 3
	;;
.BB7_54:                                ;   Parent Loop BB7_15 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       or	r2, 0 -> r0
#1:	if  c1 br @	.BB7_53
#2:	if !c1 br @	.BB7_56
	;;
.BB7_55:                                ; %.lr.ph.i118
                                        ;   in Loop: Header=BB7_56 Depth=2
#0:	       ldm.f	r3, 0
#1:	       add	r3, 4 -> r3
#2:	       sub	r4, 4 -> r4
	;;
#0:	       stm.a	r31, r2, 0
#1:	       add	r2, 4 -> r2
	;;
.BB7_56:                                ; %.lr.ph.i118
                                        ;   Parent Loop BB7_15 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       cmpu gt	r4, 3 -> c1
	;;
#0:	if  c1 br @	.BB7_55
	;;
.BB7_57:                                ; %.preheader14.i126
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       brz eq @	r4, .BB7_59
	;;
.BB7_58:                                ; %.lr.ph18.i130
                                        ;   Parent Loop BB7_15 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r3, 0
#1:	       sub	r4, 1 -> r4
	;;
#0:	       brz ne	r4, .BB7_58
#1:	       bbh	mzext8 r3 -> r0
#2:	       add	r3, 1 -> r3
	;;
#0:	       stmb.a	r0, r2, 0
#1:	       add	r2, 1 -> r2
	;;
	       nop	0
	;;
.BB7_59:                                ; %memmove.exit131
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       callg	__fflush_r
	;;
#0:	       ldm.f	r12, 0
	;;
#0:	       add	r31, r11 -> r0
	;;
#0:	       stm.a	r0, r12, 0
#1:	       or	r12, 0 -> r0
	;;
#0:	       brz eq @	r0, .BB7_67
	;;
#0:	       brz ne @	r0, .BB7_47
	;;
.BB7_60:                                ; %.lr.ph10.i56
                                        ;   in Loop: Header=BB7_61 Depth=2
#0:	       ldm.f	r1, 0
#1:	       sub	r5, 16 -> r5
#2:	       add	r1, 16 -> r4
#3:	       add	r0, 16 -> r2
	;;
#0:	       cmpu gt	r5, 15 -> c1
	;;
#0:	       stm.a	r31, r0, 0
	;;
#0:	       ldm.f	r1, 4
	;;
#0:	       stm.a	r31, r0, 1
	;;
#0:	       ldm.f	r1, 8
	;;
#0:	       stm.a	r31, r0, 2
	;;
#0:	       ldm.f	r1, 12
#1:	       or	r4, 0 -> r1
	;;
#0:	       stm.a	r31, r0, 3
	;;
.BB7_61:                                ;   Parent Loop BB7_15 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       or	r2, 0 -> r0
#1:	if  c1 br @	.BB7_60
#2:	if !c1 br @	.BB7_63
	;;
.BB7_62:                                ; %.lr.ph.i60
                                        ;   in Loop: Header=BB7_63 Depth=2
#0:	       ldm.f	r4, 0
#1:	       add	r4, 4 -> r4
#2:	       sub	r5, 4 -> r5
	;;
#0:	       stm.a	r31, r2, 0
#1:	       add	r2, 4 -> r2
	;;
.BB7_63:                                ; %.lr.ph.i60
                                        ;   Parent Loop BB7_15 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       cmpu gt	r5, 3 -> c1
	;;
#0:	if  c1 br @	.BB7_62
	;;
.BB7_64:                                ; %.preheader14.i68
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       brz eq @	r5, .BB7_66
	;;
.BB7_65:                                ; %.lr.ph18.i72
                                        ;   Parent Loop BB7_15 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r4, 0
#1:	       sub	r5, 1 -> r5
	;;
#0:	       brz ne	r5, .BB7_65
#1:	       bbh	mzext8 r4 -> r0
#2:	       add	r4, 1 -> r4
	;;
#0:	       stmb.a	r0, r2, 0
#1:	       add	r2, 1 -> r2
	;;
	       nop	0
	;;
.BB7_66:                                ; %memmove.exit73
                                        ;   in Loop: Header=BB7_15 Depth=1
#0:	       ldm.f	r12, 8
#1:	       or	r3, 0 -> r11
	;;
#0:	       sub	r31, r3 -> r0
	;;
#0:	       stm.a	r0, r12, 2
	;;
#0:	       ldm.f	r12, 0
	;;
#0:	       add	r31, r3 -> r2
	;;
#0:	       stm.a	r2, r12, 0
	;;
.BB7_67:                                ;   in Loop: Header=BB7_15 Depth=1
#2:	       cmp ne	r2.26, r11 -> c1
	;;
#0:	if  c1 br @	.BB7_69
	;;
.BB7_68:                                ;   in Loop: Header=BB7_15 Depth=1
#0:	       or	r12, 0 -> r0
#1:	       callg	__fflush_r
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz ne @	r0, .BB7_47
#2:	       ldi	0 -> r2.25
	;;
.BB7_69:                                ;   in Loop: Header=BB7_15 Depth=1
#2:	       sub	r2.26, r11 -> r2.26
#0:	       ldm.f	r10, 8
#1:	       sub	r14, r11 -> r14
	;;
#2:	       add	r2.24, r11 -> r2.24
	;;
#0:	       cmp eq	r31, r11 -> c1
#1:	       sub	r31, r11 -> r0
	;;
#0:	if  c1 br @	.BB7_139
#1:	if !c1 br @	.BB7_15
#2:	       stm.a	r0, r10, 2
#3:	       ldi	0 -> r0
	;;
.BB7_70:                                ;   in Loop: Header=BB7_71 Depth=1
#0:	       ldm.f	r13, 4
#1:	       add	r13, 8 -> r0
	;;
#1:	       or	r31, 0 -> r1.24
#0:	       ldm.f	r13, 0
#2:	       or	r0, 0 -> r13
	;;
#1:	       or	r31, 0 -> r1.25
	;;
.BB7_71:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB7_118 Depth 2
                                        ;     Child Loop BB7_112 Depth 2
                                        ;     Child Loop BB7_102 Depth 2
                                        ;     Child Loop BB7_100 Depth 2
                                        ;     Child Loop BB7_128 Depth 2
                                        ;     Child Loop BB7_126 Depth 2
                                        ;     Child Loop BB7_124 Depth 2
                                        ;     Child Loop BB7_86 Depth 2
                                        ;     Child Loop BB7_135 Depth 2
                                        ;     Child Loop BB7_133 Depth 2
                                        ;     Child Loop BB7_131 Depth 2
                                        ;     Child Loop BB7_76 Depth 2
                                        ;     Child Loop BB7_108 Depth 2
                                        ;     Child Loop BB7_106 Depth 2
                                        ;     Child Loop BB7_104 Depth 2
#1:	       brz eq @	r1.24, .BB7_70
	;;
.BB7_72:                                ;   in Loop: Header=BB7_71 Depth=1
#0:	       ldm.f	r12, 8
	;;
#0:	       or	r31, 0 -> r11
#1:	       ldm.f	r12, 12
	;;
#0:	       bbh	msext16 r12 -> r3
	;;
#0:	       btest	r3, 9 -> !c1
	;;
#0:	if !c1 br @	.BB7_77
	;;
.BB7_73:                                ;   in Loop: Header=BB7_71 Depth=1
#1:	       cmpu gt	r1.24, r11 -> c2
#0:	       ldm.f	r12, 16
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldm.f	r12, 0
	;;
#0:	       cmpu gt	r31, r0 -> c1
#1:	       or	r31, 0 -> r2
	;;
#0:	       comb	and c1, c2 -> c1
	;;
#0:	if !c1 br @	.BB7_83
	;;
.BB7_74:                                ;   in Loop: Header=BB7_71 Depth=1
#1:	       cmpu ge	r1.25, r2 -> c1
	;;
#1:	if !c1 add	r1.25, r11 -> r0
	;;
#0:	if !c1 cmpu le	r0, r2 -> c1
	;;
#0:	if  c1 br @	.BB7_87
	;;
.BB7_75:                                ;   in Loop: Header=BB7_71 Depth=1
#0:	       cmp eq	r11, 0 -> c3
#1:	       or	r11, 0 -> r3
	;;
#0:	if  c3 br @	.BB7_109
	;;
.BB7_76:                                ;   Parent Loop BB7_71 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#1:	       add	r1.25, r3 -> r1
	;;
#0:	       ldm.f	r1, -1
#1:	       sub	r1, 1 -> r0
	;;
#0:	       bbh	mzext8 r0 -> r1
#1:	       add	r2, r3 -> r0
#2:	       sub	r3, 1 -> r3
	;;
#0:	       brz ne	r3, .BB7_76
#1:	       sub	r0, 1 -> r0
	;;
#0:	       stmb.a	r1, r0, 0
	;;
	       nop	0
	;;
#0:	       br @	.BB7_109
	;;
.BB7_77:                                ;   in Loop: Header=BB7_71 Depth=1
#1:	       cmpu lt	r1.24, r11 -> c1
	;;
#0:	if  c1 br @	.BB7_115
	;;
.BB7_78:                                ;   in Loop: Header=BB7_71 Depth=1
#2:	       and	r3, r2.23 -> r0
	;;
#0:	       cmp eq	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB7_115
	;;
.BB7_79:                                ;   in Loop: Header=BB7_71 Depth=1
#0:	       ldm.f	r12, 16
#1:	       btest	r3, 10 -> !c1
	;;
#0:	       or	r31, 0 -> r2
#1:	       ldm.f	r12, 0
	;;
#1:	       sub	r31, r2 -> r1.26
#0:	       ldm.f	r12, 20
	;;
#1:	       add	r1.24, r1.26 -> r0
	;;
#0:	       mul	r31, 3 -> $mul0.0
#1:	       add	r0, 1 -> r11
	;;
#0:	       ldx	$mul0.0, 0 -> r0
	;;
#0:	       sr	r0, 31 -> r0
	;;
#0:	       ldx	$mul0.0, r0 -> r1
	;;
#0:	if !c1 br	.BB7_96
#1:	       sra	r1, 1 -> r0
	;;
#0:	       cmpu lt	r0, r11 -> c2
	;;
#0:	if !c2 sra	r1, 1 -> r11 ; aiaf
	;;
.BB7_80:                                ;   in Loop: Header=BB7_71 Depth=1
#0:	       or	r2, 0 -> r0
#1:	       callg	__realloc_r
#2:	       or	r11, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r1
	;;
#0:	       cmp ne	r1, 0 -> c3
	;;
#0:	if  c3 br @	.BB7_114
	;;
.BB7_81:
#0:	       callg	__free_r
	;;
#0:	       ldm.f	r12, 16
	;;
#0:	       or	r31, 0 -> r0
	;;
	       nop	0
	;;
.BB7_82:
#0:	       ldga	_impure_data -> r0
#1:	       br	.BB7_47
	;;
#0:	       stm.a	12, r0, 0
	;;
	       nop	0
	;;
.BB7_83:                                ;   in Loop: Header=BB7_71 Depth=1
#0:	       ldm.f	r12, 20
	;;
#0:	       or	r31, 0 -> r3
	;;
#1:	       cmpu lt	r1.24, r3 -> c1
	;;
#0:	if !c1 br @	.BB7_91
	;;
.BB7_84:                                ;   in Loop: Header=BB7_71 Depth=1
#1:	       cmpu ge	r1.25, r2 -> c1
	;;
#0:	if  c1 br @	.BB7_92
	;;
.BB7_85:                                ;   in Loop: Header=BB7_71 Depth=1
#1:	       add	r1.25, r1.24 -> r0
	;;
#1:	       or	r1.24, 0 -> r3
#0:	       cmpu le	r0, r2 -> c1
	;;
#0:	if  c1 br @	.BB7_92
	;;
.BB7_86:                                ;   Parent Loop BB7_71 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#1:	       add	r1.25, r3 -> r1
	;;
#0:	       ldm.f	r1, -1
#1:	       sub	r1, 1 -> r0
	;;
#0:	       bbh	mzext8 r0 -> r1
#1:	       add	r2, r3 -> r0
#2:	       sub	r3, 1 -> r3
	;;
#0:	       brz ne	r3, .BB7_86
#1:	       sub	r0, 1 -> r0
	;;
#0:	       stmb.a	r1, r0, 0
	;;
	       nop	0
	;;
#0:	       br @	.BB7_136
	;;
.BB7_87:                                ;   in Loop: Header=BB7_71 Depth=1
#0:	       cmpu lt	r11, 16 -> c1
	;;
#0:	if  c1 br @	.BB7_90
	;;
.BB7_88:                                ;   in Loop: Header=BB7_71 Depth=1
#1:	       or	r2, r1.25 -> r0
	;;
#0:	       and	r0, 3 -> r0
	;;
#0:	       brz ne @	r0, .BB7_90
	;;
.BB7_89:                                ;   in Loop: Header=BB7_71 Depth=1
#1:	       or	r1.25, 0 -> r3
#0:	       br	.BB7_104
#2:	       cmpu gt	r11, 15 -> c1
#3:	       or	r11, 0 -> r4
	;;
#1:	       or	r1.25, 0 -> r1
	;;
	       nop	0
	;;
.BB7_90:                                ;   in Loop: Header=BB7_71 Depth=1
#1:	       or	r1.25, 0 -> r3
#0:	       br @	.BB7_107
#2:	       or	r11, 0 -> r4
	;;
.BB7_91:                                ;   in Loop: Header=BB7_71 Depth=1
#1:	       or	r1.25, 0 -> r2
#0:	       ldm.f	r12, 28
#2:	       ldga	_impure_data -> r0
	;;
#0:	       or	r31, 0 -> r1
#1:	       ldm.f	r12, 36
	;;
#0:	       jop	call	r31
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r11
	;;
#0:	       cmp lt	r11, 1 -> c1
	;;
#0:	if  c1 br @	.BB7_47
#1:	if !c1 br @	.BB7_138
	;;
.BB7_92:                                ;   in Loop: Header=BB7_71 Depth=1
#1:	       cmpu lt	r1.24, 16 -> c1
	;;
#0:	if  c1 br @	.BB7_95
	;;
.BB7_93:                                ;   in Loop: Header=BB7_71 Depth=1
#1:	       or	r2, r1.25 -> r0
	;;
#0:	       and	r0, 3 -> r0
	;;
#0:	       brz ne @	r0, .BB7_95
	;;
.BB7_94:                                ;   in Loop: Header=BB7_71 Depth=1
#1:	       cmpu gt	r1.24, 15 -> c1
	;;
#0:	       br	.BB7_131
#1:	       or	r1.25, 0 -> r3
	;;
#1:	       or	r1.24, 0 -> r4
	;;
#1:	       or	r1.25, 0 -> r1
	;;
.BB7_95:                                ;   in Loop: Header=BB7_71 Depth=1
#1:	       or	r1.25, 0 -> r3
#0:	       br	.BB7_134
	;;
#1:	       or	r1.24, 0 -> r4
	;;
	       nop	0
	;;
.BB7_96:                                ;   in Loop: Header=BB7_71 Depth=1
#0:	       or	r11, 0 -> r0
#1:	       callg	__malloc_r
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r1
	;;
#0:	       brz eq @	r1, .BB7_82
	;;
.BB7_97:                                ;   in Loop: Header=BB7_71 Depth=1
#1:	       cmpu lt	r1.26, 16 -> c1
#0:	       ldm.f	r12, 16
	;;
#0:	if  c1 br @	.BB7_110
#1:	       or	r31, 0 -> r5
	;;
.BB7_98:                                ;   in Loop: Header=BB7_71 Depth=1
#0:	       or	r5, r1 -> r0
	;;
#0:	       and	r0, 3 -> r0
	;;
#0:	       brz ne @	r0, .BB7_110
	;;
.BB7_99:                                ;   in Loop: Header=BB7_71 Depth=1
#1:	       cmpu gt	r1.26, 15 -> c1
#0:	       or	r1, 0 -> r3
#2:	       or	r5, 0 -> r2
#3:	       or	r1, 0 -> r0
	;;
#0:	if !c1 br @	.BB7_102
#1:	       or	r1.26, 0 -> r4
	;;
.BB7_100:                               ; %.lr.ph10.i
                                        ;   Parent Loop BB7_71 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r2, 0
#1:	       sub	r4, 16 -> r4
#2:	       add	r0, 16 -> r3
#3:	       add	r2, 16 -> r5
	;;
#0:	       cmpu gt	r4, 15 -> c1
	;;
#0:	       stm.a	r31, r0, 0
	;;
#0:	       ldm.f	r2, 4
	;;
#0:	       stm.a	r31, r0, 1
	;;
#0:	       ldm.f	r2, 8
	;;
#0:	if !c1 br	.BB7_102
#1:	if  c1 br	.BB7_100
#2:	       stm.a	r31, r0, 2
	;;
#0:	       ldm.f	r2, 12
#1:	       or	r5, 0 -> r2
	;;
#0:	       stm.a	r31, r0, 3
#1:	       or	r3, 0 -> r0
	;;
.BB7_101:                               ; %.lr.ph.i
                                        ;   in Loop: Header=BB7_102 Depth=2
#0:	       ldm.f	r5, 0
#1:	       add	r5, 4 -> r5
#2:	       sub	r4, 4 -> r4
	;;
#0:	       stm.a	r31, r3, 0
#1:	       add	r3, 4 -> r3
	;;
.BB7_102:                               ; %.lr.ph.i
                                        ;   Parent Loop BB7_71 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       cmpu gt	r4, 3 -> c1
	;;
#0:	if !c1 br @	.BB7_111
#1:	if  c1 br @	.BB7_101
	;;
.BB7_103:                               ; %.lr.ph10.i27
                                        ;   in Loop: Header=BB7_104 Depth=2
#0:	       ldm.f	r1, 0
#1:	       sub	r4, 16 -> r4
#2:	       add	r1, 16 -> r3
#3:	       add	r0, 16 -> r2
	;;
#0:	       cmpu gt	r4, 15 -> c1
	;;
#0:	       stm.a	r31, r0, 0
	;;
#0:	       ldm.f	r1, 4
	;;
#0:	       stm.a	r31, r0, 1
	;;
#0:	       ldm.f	r1, 8
	;;
#0:	       stm.a	r31, r0, 2
	;;
#0:	       ldm.f	r1, 12
#1:	       or	r3, 0 -> r1
	;;
#0:	       stm.a	r31, r0, 3
	;;
.BB7_104:                               ;   Parent Loop BB7_71 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       or	r2, 0 -> r0
#1:	if  c1 br @	.BB7_103
#2:	if !c1 br @	.BB7_106
	;;
.BB7_105:                               ; %.lr.ph.i31
                                        ;   in Loop: Header=BB7_106 Depth=2
#0:	       ldm.f	r3, 0
#1:	       add	r3, 4 -> r3
#2:	       sub	r4, 4 -> r4
	;;
#0:	       stm.a	r31, r2, 0
#1:	       add	r2, 4 -> r2
	;;
.BB7_106:                               ; %.lr.ph.i31
                                        ;   Parent Loop BB7_71 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       cmpu gt	r4, 3 -> c1
	;;
#0:	if  c1 br @	.BB7_105
	;;
.BB7_107:                               ; %.preheader14.i39
                                        ;   in Loop: Header=BB7_71 Depth=1
#0:	       brz eq @	r4, .BB7_109
	;;
.BB7_108:                               ; %.lr.ph18.i43
                                        ;   Parent Loop BB7_71 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r3, 0
#1:	       sub	r4, 1 -> r4
	;;
#0:	       brz ne	r4, .BB7_108
#1:	       bbh	mzext8 r3 -> r0
#2:	       add	r3, 1 -> r3
	;;
#0:	       stmb.a	r0, r2, 0
#1:	       add	r2, 1 -> r2
	;;
	       nop	0
	;;
.BB7_109:                               ; %memmove.exit44
                                        ;   in Loop: Header=BB7_71 Depth=1
#0:	       callg	__fflush_r
	;;
#0:	       ldm.f	r12, 0
	;;
#0:	       add	r31, r11 -> r0
	;;
#0:	       stm.a	r0, r12, 0
#1:	       or	r12, 0 -> r0
	;;
#0:	       cmp ne	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB7_47
#1:	if !c3 br @	.BB7_138
	;;
.BB7_110:                               ;   in Loop: Header=BB7_71 Depth=1
#1:	       or	r1.26, 0 -> r4
#0:	       or	r1, 0 -> r3
	;;
.BB7_111:                               ; %.preheader14.i
                                        ;   in Loop: Header=BB7_71 Depth=1
#0:	       brz eq @	r4, .BB7_113
	;;
.BB7_112:                               ; %.lr.ph18.i
                                        ;   Parent Loop BB7_71 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r5, 0
#1:	       sub	r4, 1 -> r4
	;;
#0:	       brz ne	r4, .BB7_112
#1:	       bbh	mzext8 r5 -> r0
#2:	       add	r5, 1 -> r5
	;;
#0:	       stmb.a	r0, r3, 0
#1:	       add	r3, 1 -> r3
	;;
	       nop	0
	;;
.BB7_113:                               ; %memcpy.exit
                                        ;   in Loop: Header=BB7_71 Depth=1
#0:	       ldm.f	r12, 12
	;;
#0:	       bbh	mzext16 r12 -> r0
	;;
#3:	       and	r0, r3.23 -> r0
	;;
#0:	       or	r0, r14 -> r0
	;;
#0:	       stmh.a	r0, r12, 6
	;;
.BB7_114:                               ;   in Loop: Header=BB7_71 Depth=1
#1:	       add	r1, r1.26 -> r0
#0:	       stm.a	r1, r12, 4
	;;
#0:	       stm.a	r0, r12, 0
#1:	       sub	r11, r1.26 -> r0
	;;
#0:	       stm.a	r11, r12, 5
#1:	       or	r1.24, 0 -> r11
	;;
#0:	       stm.a	r0, r12, 2
	;;
.BB7_115:                               ; %._crit_edge
                                        ;   in Loop: Header=BB7_71 Depth=1
#1:	       cmpu lt	r1.24, r11 -> c1
#0:	       ldm.f	r12, 0
#2:	       or	r11, 0 -> r5
	;;
#1:	if  c1 or	r1.24, 0 -> r5
	;;
#1:	       cmpu ge	r1.25, r31 -> c1
#0:	       or	r31, 0 -> r4
	;;
#1:	if !c1 add	r1.25, r5 -> r0
	;;
#0:	if !c1 cmpu le	r0, r4 -> c1
	;;
#0:	if  c1 br @	.BB7_119
	;;
.BB7_116:                               ;   in Loop: Header=BB7_71 Depth=1
#0:	       brz eq @	r5, .BB7_129
	;;
.BB7_117:                               ; %.lr.ph24.i
                                        ;   in Loop: Header=BB7_71 Depth=1
#1:	       xor	r1.24, -1 -> r1
#0:	       xor	r11, -1 -> r0
	;;
#0:	       cmpu gt	r0, r1 -> c1
	;;
#1:	if !c1 xor	r1.24, -1 -> r0 ; aiaf
	;;
#1:	       sub	r1.23, r0 -> r2
	;;
.BB7_118:                               ;   Parent Loop BB7_71 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#1:	       add	r1.25, r2 -> r1
#0:	       add	r4, r2 -> r3
#2:	       sub	r2, 1 -> r2
	;;
#0:	       cmp eq	r2, 1 -> c1
#1:	       ldm.f	r1, -2
#2:	       sub	r1, 2 -> r0
	;;
#0:	if  c1 br	.BB7_129
#1:	if !c1 br	.BB7_118
#2:	       bbh	mzext8 r0 -> r1
#3:	       sub	r3, 2 -> r0
	;;
#0:	       stmb.a	r1, r0, 0
	;;
	       nop	0
	;;
.BB7_119:                               ;   in Loop: Header=BB7_71 Depth=1
#0:	       cmpu lt	r5, 16 -> c1
	;;
#0:	if  c1 br @	.BB7_122
	;;
.BB7_120:                               ;   in Loop: Header=BB7_71 Depth=1
#1:	       or	r4, r1.25 -> r0
	;;
#0:	       and	r0, 3 -> r0
	;;
#0:	       brz ne @	r0, .BB7_122
	;;
.BB7_121:                               ;   in Loop: Header=BB7_71 Depth=1
#1:	       or	r1.25, 0 -> r2
#0:	       br	.BB7_124
#2:	       cmpu gt	r5, 15 -> c1
#3:	       or	r5, 0 -> r3
	;;
#1:	       or	r1.25, 0 -> r1
	;;
	       nop	0
	;;
.BB7_122:                               ;   in Loop: Header=BB7_71 Depth=1
#1:	       or	r1.25, 0 -> r2
#0:	       br @	.BB7_127
#2:	       or	r5, 0 -> r3
	;;
.BB7_123:                               ; %.lr.ph10.i7
                                        ;   in Loop: Header=BB7_124 Depth=2
#0:	       ldm.f	r1, 0
#1:	       sub	r3, 16 -> r3
#2:	       add	r1, 16 -> r2
#3:	       add	r0, 16 -> r4
	;;
#0:	       cmpu gt	r3, 15 -> c1
	;;
#0:	       stm.a	r31, r0, 0
	;;
#0:	       ldm.f	r1, 4
	;;
#0:	       stm.a	r31, r0, 1
	;;
#0:	       ldm.f	r1, 8
	;;
#0:	       stm.a	r31, r0, 2
	;;
#0:	       ldm.f	r1, 12
#1:	       or	r2, 0 -> r1
	;;
#0:	       stm.a	r31, r0, 3
	;;
.BB7_124:                               ;   Parent Loop BB7_71 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       or	r4, 0 -> r0
#1:	if  c1 br @	.BB7_123
#2:	if !c1 br @	.BB7_126
	;;
.BB7_125:                               ; %.lr.ph.i10
                                        ;   in Loop: Header=BB7_126 Depth=2
#0:	       ldm.f	r2, 0
#1:	       add	r2, 4 -> r2
#2:	       sub	r3, 4 -> r3
	;;
#0:	       stm.a	r31, r4, 0
#1:	       add	r4, 4 -> r4
	;;
.BB7_126:                               ; %.lr.ph.i10
                                        ;   Parent Loop BB7_71 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       cmpu gt	r3, 3 -> c1
	;;
#0:	if  c1 br @	.BB7_125
	;;
.BB7_127:                               ; %.preheader14.i14
                                        ;   in Loop: Header=BB7_71 Depth=1
#0:	       brz eq @	r3, .BB7_129
	;;
.BB7_128:                               ; %.lr.ph18.i15
                                        ;   Parent Loop BB7_71 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r2, 0
#1:	       sub	r3, 1 -> r3
	;;
#0:	       brz ne	r3, .BB7_128
#1:	       bbh	mzext8 r2 -> r0
#2:	       add	r2, 1 -> r2
	;;
#0:	       stmb.a	r0, r4, 0
#1:	       add	r4, 1 -> r4
	;;
	       nop	0
	;;
.BB7_129:                               ; %memmove.exit
                                        ;   in Loop: Header=BB7_71 Depth=1
#0:	       ldm.f	r12, 8
	;;
#0:	       sub	r31, r5 -> r0
	;;
#0:	       br	.BB7_137
#1:	       stm.a	r0, r12, 2
	;;
#0:	       ldm.f	r12, 0
	;;
#0:	       add	r31, r5 -> r0
	;;
.BB7_130:                               ; %.lr.ph10.i85
                                        ;   in Loop: Header=BB7_131 Depth=2
#0:	       ldm.f	r1, 0
#1:	       sub	r4, 16 -> r4
#2:	       add	r1, 16 -> r3
#3:	       add	r0, 16 -> r2
	;;
#0:	       cmpu gt	r4, 15 -> c1
	;;
#0:	       stm.a	r31, r0, 0
	;;
#0:	       ldm.f	r1, 4
	;;
#0:	       stm.a	r31, r0, 1
	;;
#0:	       ldm.f	r1, 8
	;;
#0:	       stm.a	r31, r0, 2
	;;
#0:	       ldm.f	r1, 12
#1:	       or	r3, 0 -> r1
	;;
#0:	       stm.a	r31, r0, 3
	;;
.BB7_131:                               ;   Parent Loop BB7_71 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       or	r2, 0 -> r0
#1:	if  c1 br @	.BB7_130
#2:	if !c1 br @	.BB7_133
	;;
.BB7_132:                               ; %.lr.ph.i89
                                        ;   in Loop: Header=BB7_133 Depth=2
#0:	       ldm.f	r3, 0
#1:	       add	r3, 4 -> r3
#2:	       sub	r4, 4 -> r4
	;;
#0:	       stm.a	r31, r2, 0
#1:	       add	r2, 4 -> r2
	;;
.BB7_133:                               ; %.lr.ph.i89
                                        ;   Parent Loop BB7_71 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       cmpu gt	r4, 3 -> c1
	;;
#0:	if  c1 br @	.BB7_132
	;;
.BB7_134:                               ; %.preheader14.i97
                                        ;   in Loop: Header=BB7_71 Depth=1
#0:	       brz eq @	r4, .BB7_136
	;;
.BB7_135:                               ; %.lr.ph18.i101
                                        ;   Parent Loop BB7_71 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r3, 0
#1:	       sub	r4, 1 -> r4
	;;
#0:	       brz ne	r4, .BB7_135
#1:	       bbh	mzext8 r3 -> r0
#2:	       add	r3, 1 -> r3
	;;
#0:	       stmb.a	r0, r2, 0
#1:	       add	r2, 1 -> r2
	;;
	       nop	0
	;;
.BB7_136:                               ; %memmove.exit102
                                        ;   in Loop: Header=BB7_71 Depth=1
#0:	       ldm.f	r12, 8
	;;
#1:	       sub	r31, r1.24 -> r0
	;;
#0:	       stm.a	r0, r12, 2
	;;
#0:	       ldm.f	r12, 0
	;;
#1:	       add	r31, r1.24 -> r0
	;;
.BB7_137:                               ; %memmove.exit102
                                        ;   in Loop: Header=BB7_71 Depth=1
#1:	       or	r1.24, 0 -> r11
#0:	       stm.a	r0, r12, 0
	;;
.BB7_138:                               ;   in Loop: Header=BB7_71 Depth=1
#1:	       sub	r1.24, r11 -> r1.24
#0:	       ldm.f	r10, 8
	;;
#1:	       add	r1.25, r11 -> r1.25
	;;
#0:	       cmp eq	r31, r11 -> c1
#1:	       sub	r31, r11 -> r0
	;;
#0:	if !c1 br @	.BB7_71
#1:	       stm.a	r0, r10, 2
#2:	       ldi	0 -> r0
	;;
.BB7_139:                               ; %.loopexit
#0:	       ldm.s	r15, 8
	;;
#0:	       stx	r31 -> $ro
#1:	       ldm.s	r15, 12
	;;
#0:	       stx	r31 -> $rb
#1:	       ldm.s	r15, 16
	;;
#2:	       or	r31, 0 -> r2.26
#0:	       ldm.s	r15, 20
	;;
#1:	       or	r31, 0 -> r1.26
#0:	       ldm.s	r15, 24
	;;
#2:	       or	r31, 0 -> r2.25
#0:	       ldm.s	r15, 28
	;;
#1:	       or	r31, 0 -> r1.25
#0:	       ldm.s	r15, 32
	;;
#2:	       or	r31, 0 -> r2.24
#0:	       ldm.s	r15, 36
	;;
#1:	       or	r31, 0 -> r1.24
#0:	       ldm.s	r15, 40
	;;
#3:	       or	r31, 0 -> r3.23
#0:	       ldm.s	r15, 44
	;;
#2:	       or	r31, 0 -> r2.23
#0:	       ldm.s	r15, 48
	;;
#1:	       or	r31, 0 -> r1.23
#0:	       ldm.s	r15, 52
	;;
#0:	       or	r31, 0 -> r14
#1:	       ldm.s	r15, 56
	;;
#0:	       or	r31, 0 -> r13
#1:	       ldm.s	r15, 60
	;;
#0:	       or	r31, 0 -> r12
#1:	       ldm.s	r15, 64
	;;
#0:	       or	r31, 0 -> r11
#1:	       ldm.s	r15, 68
#2:	       addi	88 -> r15
	;;
#0:	       jop	ret
#1:	       or	r31, 0 -> r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
___sfvwrite_r_end:
.tmp7:
	.size	___sfvwrite_r, .tmp7-___sfvwrite_r

	.type	_cvt,@function
_cvt:                                   ; @cvt
	.funsz	_cvt_end-_cvt
_cvt_start:
; BB#0:
#0:	       wb.s	r15, 28
#1:	       addi	-112 -> r15
#2:	       ldx	$f10 -> r4
	;;
#0:	       stm.s	r10, r15, 19
#1:	       stx	r1 -> $f0
#2:	       or	r2, 0 -> r10
	;;
#0:	       stm.s	r11, r15, 18
	;;
#0:	       stm.s	r12, r15, 17
#1:	       ldx	$f11 -> r12
	;;
#0:	       stm.s	r13, r15, 16
#1:	       ldx	$rb, 0 -> r13
#2:	       stx	r0 -> $f10
	;;
#0:	       stm.s	r14, r15, 15
#1:	       ldx	$ro, 0 -> r14
	;;
#0:	       stm.s	r4, r15, 14
	;;
#0:	       stm.s	r12, r15, 13
	;;
#0:	       stm.s	r13, r15, 12
#1:	       or	r3, 0 -> r13
#2:	       add	r15, 24 -> r3
	;;
#0:	       stm.s	r14, r15, 11
#1:	       fop	fmov	f0 -> f11
	;;
#0:	       stm.a	r0, r15, 6
#1:	       ldx	$f11 -> r1
#2:	       or	r3, 4 -> r0
	;;
#0:	       stm.a	r1, r0, 0
	;;
#0:	       ldm.f	r0, 0
#1:	       ldi	0 -> r0
	;;
#0:	       or	r31, 0 -> r2
#1:	       ldm.f	r15, 124
	;;
#0:	       cmp gt	r2, -1 -> c1
#1:	       ldi	32 -> r2
	;;
#0:	       or	r31, 0 -> r11
#1:	       ldm.f	r15, 120
#2:	if !c1 ldi	45 -> r0
#3:	if !c1 fop	dneg	d5 -> d5
	;;
#0:	       or	r31, 0 -> r14
#1:	       ldm.f	r15, 116
	;;
#0:	       or	r14, r2 -> r1
#1:	       ldi	3 -> r2
	;;
#0:	       or	r31, 0 -> r12
#1:	       ldm.f	r15, 112
	;;
#0:	       or	r31, 0 -> r3
	;;
#0:	       stmb.a	r0, r3, 0
#1:	       ldi	102 -> r3
	;;
#0:	       cmp eq	r1, r3 -> c1
	;;
#0:	if  c1 br @	.BB8_2
	;;
.BB8_1:
#0:	       ldi	101 -> r0
#1:	       ldi	2 -> r2
	;;
#0:	       cmp eq	r1, r0 -> c1
	;;
#0:	if  c1 add	r10, 1 -> r10
#1:	if  c1 ldi	2 -> r2
	;;
.BB8_2:
#0:	       s2add	r15, 8 -> r4
#1:	       stm.a	r12, r15, 0
#2:	       ldx	$f11 -> r1
	;;
#0:	       callg	__dtoa_r
#1:	       add	r4, 8 -> r0
#2:	       s2add	r15, 8 -> r4
	;;
#0:	       stm.a	r0, r15, 1
#1:	       add	r4, 4 -> r3
#2:	       ldx	$f10 -> r0
	;;
#0:	       stm.a	r3, r15, 2
#1:	       or	r10, 0 -> r3
	;;
	       nop	0
	;;
#0:	       ldi	101 -> r3
#1:	       or	r0, 0 -> r4
	;;
#0:	       cmp gt	r14, r3 -> c1
	;;
#0:	if  c1 br @	.BB8_5
	;;
.BB8_3:
#0:	       ldi	70 -> r0
	;;
#0:	       cmp eq	r14, r0 -> c1
	;;
#0:	if  c1 br @	.BB8_9
	;;
.BB8_4:
#0:	       ldi	71 -> r0
	;;
#0:	       cmp eq	r14, r0 -> c1
	;;
#0:	if  c1 br @	.BB8_7
#1:	if !c1 br @	.BB8_13
	;;
.BB8_5:
#0:	       ldi	102 -> r0
	;;
#0:	       cmp eq	r14, r0 -> c1
	;;
#0:	if  c1 br @	.BB8_9
	;;
.BB8_6:
#0:	       ldi	103 -> r0
	;;
#0:	       cmp ne	r14, r0 -> c1
	;;
#0:	if  c1 br @	.BB8_13
	;;
.BB8_7:
#0:	       btest	r13, 0 -> c1
	;;
#0:	if !c1 br @	.BB8_19
	;;
.BB8_8:
#0:	       ldi	32 -> r0
#1:	       ldi	102 -> r3
	;;
#0:	       or	r14, r0 -> r1
	;;
#0:	       cmp eq	r1, r3 -> c1
	;;
#0:	if !c1 br @	.BB8_13
	;;
.BB8_9:
#0:	       ldm.f	r4, 0
#1:	       fop	dzero -> d0
#2:	       ldi	48 -> r0
	;;
#0:	       bbh	mzext8 r4 -> r1
#1:	       fop	dcmp	d5, d0 -> f0
	;;
#0:	       cmp eq	r1, r0 -> c2
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r3
	;;
#0:	       btest	r3, 9 -> c1
	;;
#0:	       comb	and c2, c1 -> c1
	;;
#0:	if !c1 br @	.BB8_11
	;;
.BB8_10:
#0:	       ldi	1 -> r0
#1:	       br	.BB8_12
	;;
#0:	       sub	r0, r10 -> r0
	;;
#0:	       stm.a	r0, r12, 0
	;;
.BB8_11:                                ; %._crit_edge
#0:	       ldm.f	r12, 0
	;;
#0:	       or	r31, 0 -> r0
	;;
.BB8_12:
#0:	       add	r0, r10 -> r10
	;;
.BB8_13:
#0:	       fop	dzero -> d0
#1:	       add	r4, r10 -> r3
	;;
#0:	       fop	dcmp	d5, d0 -> f0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r0
	;;
#0:	       btest	r0, 9 -> c1
	;;
#0:	if  c1 br @	.BB8_15
	;;
.BB8_14:                                ; %.preheader.thread
#0:	       or	r3, 0 -> r0
#1:	       br @	.BB8_20
#2:	       stm.a	r3, r15, 9
	;;
.BB8_15:                                ; %.preheader
#0:	       ldm.f	r15, 36
	;;
#0:	       cmpu ge	r31, r3 -> c1
#1:	       or	r31, 0 -> r1
	;;
#0:	if  c1 br @	.BB8_18
	;;
.BB8_16:
#0:	       ldi	48 -> r2
	;;
.BB8_17:                                ; %.lr.ph
                                        ; =>This Inner Loop Header: Depth=1
#0:	       add	r1, 1 -> r0
	;;
#0:	       stm.a	r0, r15, 9
	;;
#0:	       stmb.a	r2, r1, 0
	;;
#0:	       ldm.f	r15, 36
	;;
#0:	       cmpu lt	r31, r3 -> c1
#1:	       or	r31, 0 -> r1
#2:	       or	r31, 0 -> r0
	;;
#0:	if !c1 br @	.BB8_20
#1:	if  c1 br @	.BB8_17
	;;
.BB8_18:
#0:	       or	r1, 0 -> r0
#1:	       br @	.BB8_20
	;;
.BB8_19:                                ; %._crit_edge1
#0:	       ldm.f	r15, 36
	;;
#0:	       or	r31, 0 -> r0
	;;
.BB8_20:                                ; %.loopexit
#0:	       sub	r0, r4 -> r0
	;;
#0:	       stm.a	r0, r11, 0
#1:	       or	r4, 0 -> r0
	;;
#0:	       ldm.s	r15, 44
	;;
#0:	       stx	r31 -> $ro
#1:	       ldm.s	r15, 48
	;;
#0:	       stx	r31 -> $rb
#1:	       ldm.s	r15, 52
	;;
#0:	       stx	r31 -> $f11
#1:	       ldm.s	r15, 56
	;;
#0:	       stx	r31 -> $f10
#1:	       ldm.s	r15, 60
	;;
#0:	       or	r31, 0 -> r14
#1:	       ldm.s	r15, 64
	;;
#0:	       or	r31, 0 -> r13
#1:	       ldm.s	r15, 68
	;;
#0:	       or	r31, 0 -> r12
#1:	       ldm.s	r15, 72
	;;
#0:	       or	r31, 0 -> r11
#1:	       ldm.s	r15, 76
#2:	       addi	112 -> r15
	;;
#0:	       jop	ret
#1:	       or	r31, 0 -> r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
_cvt_end:
.tmp8:
	.size	_cvt, .tmp8-_cvt

	.type	__vfprintf_r,@function
__vfprintf_r:                           ; @_vfprintf_r
	.funsz	__vfprintf_r_end-__vfprintf_r
__vfprintf_r_start:
; BB#0:
#2:	       ldx	$f10 -> r2.30
#0:	       ldiu	1544 -> r3
#1:	       wb.s	r15, 386
	;;
#3:	       ldx	$f11 -> r3.30
#0:	       sub	r15, r3 -> r15
#1:	       ldiu	1408 -> r3
	;;
#0:	       ldx	$f12 -> r0.30
#1:	       add	r15, r3 -> r3
	;;
#1:	       ldx	$f13 -> r1.30
#0:	       stm.s	r10, r3, 25
#2:	       or	r1, 0 -> r10
	;;
#0:	       stm.s	r11, r3, 24
	;;
#0:	       stm.s	r12, r3, 23
	;;
#0:	       stm.s	r13, r3, 22
	;;
#0:	       stm.s	r14, r3, 21
	;;
#0:	       stm.s	r0.23, r3, 20
	;;
#1:	       stm.s	r1.23, r3, 19
	;;
#2:	       stm.s	r2.23, r3, 18
	;;
#3:	       stm.s	r3.23, r3, 17
	;;
#0:	       stm.s	r0.24, r3, 16
#3:	       or	r2, 0 -> r3.23
	;;
#1:	       stm.s	r1.24, r3, 15
	;;
#2:	       stm.s	r2.24, r3, 14
	;;
#3:	       stm.s	r3.24, r3, 13
	;;
#0:	       stm.s	r0.25, r3, 12
	;;
#1:	       stm.s	r1.25, r3, 11
	;;
#2:	       stm.s	r2.25, r3, 10
	;;
#3:	       stm.s	r3.25, r3, 9
	;;
#0:	       stm.s	r0.26, r3, 8
	;;
#1:	       stm.s	r1.26, r3, 7
#0:	       or	r0, 0 -> r0.26
#2:	       ldga	._.str391 -> r0
	;;
#2:	       stm.s	r2.26, r3, 6
#0:	       and	r0, 3 -> r0
	;;
#3:	       stm.s	r3.26, r3, 5
#0:	       cmp eq	r0, 0 -> c2
#1:	       ldga	._.str391 -> r0
	;;
#0:	       stm.s	r0.27, r3, 4
#1:	       add	r0, 1 -> r11
	;;
#1:	       stm.s	r1.27, r3, 3
#0:	       and	r11, 3 -> r0
	;;
#2:	       stm.s	r2.27, r3, 2
#0:	       cmp eq	r0, 0 -> c1
	;;
#3:	       stm.s	r3.27, r3, 1
#0:	       comb	or c2, c1 -> c1
	;;
#0:	       stm.s	r0.28, r3, 0
#1:	       ldiu	1280 -> r3
	;;
#0:	       add	r15, r3 -> r3
	;;
#1:	       stm.s	r1.28, r3, 31
	;;
#2:	       stm.s	r2.28, r3, 30
	;;
#0:	       stm.s	r0.29, r3, 29
	;;
#1:	       stm.s	r1.29, r3, 28
	;;
#2:	       stm.s	r2.29, r3, 27
	;;
#2:	       stm.s	r2.30, r3, 26
	;;
#3:	       stm.s	r3.30, r3, 25
#2:	       ldx	$rb, 0 -> r2.30
	;;
#0:	       stm.s	r0.30, r3, 24
#3:	       ldx	$ro, 0 -> r3.30
	;;
#0:	if !c1 br	.BB9_6
#1:	       stm.s	r1.30, r3, 23
	;;
#2:	       stm.s	r2.30, r3, 22
	;;
#3:	       stm.s	r3.30, r3, 21
	;;
.BB9_1:
#0:	       ldga	._.str391 -> r0
#1:	       ldiu	1791 -> r3
#2:	       ldga	32896 -> r2
	;;
#0:	       or	r0, 0 -> r4
#1:	       ldim	991 -> r3
#2:	       ldih	1028 -> r2
	;;
#0:	if !c2 add	r4, 1 -> r4 ; aiaf
#1:	       ldih	2039 -> r3
	;;
#0:	       ldm.f	r4, 0
	;;
#0:	       and	r31, r2 -> r0
#1:	       add	r31, r3 -> r1
	;;
#0:	       xor	r0, r2 -> r0
	;;
#0:	       and	r0, r1 -> r0
	;;
#0:	       brz ne @	r0, .BB9_3
	;;
.BB9_2:                                 ; %.lr.ph5.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r4, 4
#1:	       add	r4, 4 -> r4
	;;
#0:	       and	r31, r2 -> r0
#1:	       add	r31, r3 -> r1
	;;
#0:	       xor	r0, r2 -> r0
	;;
#0:	       and	r0, r1 -> r0
	;;
#0:	       brz eq @	r0, .BB9_2
	;;
.BB9_3:                                 ; %._crit_edge6.i
#0:	       ldm.f	r4, 0
	;;
#0:	       bbh	mzext8 r4 -> r0
	;;
#0:	       brz eq @	r0, .BB9_5
	;;
.BB9_4:                                 ; %.lr.ph.i2
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r4, 1
#1:	       add	r4, 1 -> r11
	;;
#0:	       or	r11, 0 -> r4
	;;
#0:	       bbh	mzext8 r11 -> r0
	;;
#0:	       brz ne @	r0, .BB9_4
	;;
#0:	       brz eq @	r0, .BB9_6
	;;
.BB9_5:
#0:	       or	r4, 0 -> r11
	;;
.BB9_6:                                 ; %.loopexit60
#0:	       ldiu	128 -> r0
#1:	       ldmg.d	_impure_data+56
	;;
#0:	       brz ne	r31, .BB9_8
#1:	       add	r15, r0 -> r0
	;;
#0:	       stm.a	0, r0, 18
	;;
	       nop	0
	;;
.BB9_7:
#0:	       callg	___sinit
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB9_8:
#0:	       ldm.f	r0.26, 12
	;;
#0:	       bbh	mzext16 r0.26 -> r2
	;;
#0:	       btest	r2, 13 -> c1
	;;
#0:	if  c1 br @	.BB9_10
	;;
.BB9_9:
#0:	       ldga	8192 -> r0
	;;
#0:	       or	r2, r0 -> r2
#1:	       ldiu	2047 -> r0
	;;
#0:	       stmh.a	r2, r0.26, 6
#1:	       ldim	2043 -> r0
	;;
#0:	       ldm.f	r0.26, 100
	;;
#0:	       and	r31, r0 -> r0
	;;
#0:	       stm.a	r0, r0.26, 25
	;;
.BB9_10:
#0:	       btest	r2, 3 -> !c1
#1:	       ldga	._.str391 -> r0
	;;
#1:	if  c1 br @	.BB9_12
#0:	       sub	r11, r0 -> r0.29
	;;
.BB9_11:
#0:	       ldm.f	r0.26, 16
	;;
#0:	       brz ne @	r31, .BB9_14
	;;
.BB9_12:
#0:	       or	r0.26, 0 -> r0
#1:	       callg	___swsetup_r
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#3:	       ldi	-1 -> r3.25
#0:	       cmp ne	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB9_359
	;;
.BB9_13:                                ; %._crit_edge646
#0:	       ldm.f	r0.26, 12
	;;
#0:	       bbh	mzext16 r0.26 -> r2
	;;
.BB9_14:
#0:	       and	r2, 26 -> r0
	;;
#0:	       cmp ne	r0, 10 -> c1
	;;
#0:	if  c1 br @	.BB9_18
	;;
.BB9_15:
#0:	       ldm.f	r0.26, 14
	;;
#0:	       add	r0.26, 2 -> r0
	;;
#0:	       bbh	msext16 r0 -> r1
	;;
#0:	       brz lt @	r1, .BB9_18
	;;
.BB9_16:
#0:	       ldiu	2045 -> r0
#1:	       ldiu	1216 -> r3
#2:	       ldiu	224 -> r12
#3:	       ldiu	1152 -> r13
	;;
#0:	       ldim	31 -> r0
#1:	       add	r15, r12 -> r12
#2:	       ldiu	1280 -> r14
	;;
#0:	       and	r2, r0 -> r0
#1:	       add	r15, r3 -> r2
#2:	       ldiu	1216 -> r3
	;;
#0:	       stmh.a	r0, r2, 26
#1:	       ldiu	1280 -> r2
#2:	       add	r12, 8 -> r0
#3:	       ldiu	1280 -> r12
	;;
#0:	       ldm.f	r0.26, 100
#1:	       add	r15, r2 -> r2
#2:	       add	r15, r12 -> r12
	;;
#0:	       stm.a	r31, r2, 19
#1:	       add	r15, r3 -> r2
	;;
#0:	       stmh.a	r1, r2, 27
#1:	       ldiu	1248 -> r2
#2:	       ldiu	1024 -> r1
	;;
#0:	       ldm.f	r0.26, 28
#1:	       add	r15, r2 -> r2
	;;
#0:	       add	r2, 8 -> r11
	;;
#3:	       or	r3.23, 0 -> r2
#0:	       stm.a	r31, r12, 1
#1:	       ldiu	1280 -> r12
	;;
#0:	       ldm.f	r0.26, 36
#1:	       add	r15, r12 -> r12
	;;
#0:	       stm.a	r31, r12, 3
#1:	       add	r15, r13 -> r12
	;;
#0:	       stm.a	r0, r12, 26
	;;
#0:	       stm.a	r0, r12, 30
#1:	       or	r11, 0 -> r0
	;;
#0:	       callg	__vfprintf_r
	;;
#0:	       stm.a	r1, r12, 28
	;;
#0:	       stm.a	r1, r12, 31
#1:	       add	r15, r14 -> r12
#2:	       or	r10, 0 -> r1
	;;
#0:	       stm.a	0, r12, 0
	;;
#0:	       or	r0, 0 -> r10
	;;
#0:	       cmp lt	r10, 0 -> c3
	;;
#0:	if  c3 br @	.BB9_357
	;;
.BB9_17:
#0:	       ldiu	1248 -> r12
#1:	       callg	__fflush_r
	;;
#0:	       add	r15, r12 -> r12
	;;
#0:	       add	r12, 8 -> r0
	;;
	       nop	0
	;;
#0:	       br	.BB9_358
#3:	       ldi	-1 -> r3.25
#1:	       cmp eq	r0, 0 -> c1
	;;
#3:	if  c1 or	r10, 0 -> r3.25
	;;
	       nop	0
	;;
.BB9_18:
#3:	       ldi	17 -> r3.26
#1:	       ldi	16 -> r1.29
#0:	       ldi	37 -> r0.28
#2:	       ldiu	lo11{ ___mem_emergency } -> r2.30
	;;
#3:	       ldi	0 -> r3.25
#0:	       ldiu	lo11{ ___mem_emergency } -> r0.30
#1:	       s2add	r15, 24 -> r1
#2:	       ldiu	128 -> r2
	;;
#1:	       add	r1, 24 -> r1.28
#3:	       ldiu	lo11{ ___mem_emergency } -> r3.30
#0:	       add	r15, r2 -> r1
#2:	       ldiu	160 -> r3
	;;
#1:	       stm.a	r1.28, r1, 14
#0:	       ldiu	192 -> r0
#2:	       fop	dzero -> d5
#3:	       ldi	31 -> r14
	;;
#0:	       stm.a	0, r1, 16
#1:	       add	r15, r3 -> r1
#2:	       ldi	88 -> r13
#3:	       fop	dzero -> d6
	;;
#1:	       add	r1, 24 -> r1.27
#0:	       add	r15, r0 -> r1
	;;
#1:	       or	r1.27, 4 -> r1.23
#0:	       add	r1, 12 -> r0
#2:	       s2add	r15, 24 -> r1
	;;
#2:	       add	r1, 23 -> r2.27
#0:	       stm.s	r0, r15, 11
	;;
#1:	       stm.a	0, r1.23, 0
	;;
#0:	       ldm.s	r15, 44
	;;
#0:	       or	r31, 0 -> r1
	;;
#0:	       or	r1, 3 -> r0
#1:	       ldiu	192 -> r1
	;;
#0:	       add	r15, r1 -> r1
#1:	       stm.s	r0, r15, 12
	;;
#0:	       add	r1, 16 -> r2
#1:	       ldiu	224 -> r1
	;;
#0:	       stm.s	r2, r15, 7
#1:	       add	r15, r1 -> r1
#2:	       s2add	r15, 16 -> r2
	;;
#0:	       ldm.s	r15, 44
#1:	       add	r1, 7 -> r1
	;;
#0:	       or	r31, 0 -> r3
	;;
#0:	       or	r3, 2 -> r0
#1:	       add	r2, 16 -> r3
#2:	       ldi	0 -> r2
	;;
#0:	       stm.s	r0, r15, 9
#1:	       ldiu	192 -> r0
	;;
#0:	       stm.s	r1, r15, 8
#1:	       s2add	r15, 24 -> r1
	;;
#2:	       add	r1, 24 -> r2.28
#0:	       add	r15, r0 -> r1
#1:	       stm.s	r3, r15, 6
#3:	       ldi	0 -> r3
	;;
#0:	       add	r1, 28 -> r1
	;;
#0:	       br	.BB9_20
#1:	       stm.s	r1, r15, 10
#2:	       s2add	r15, 16 -> r1
	;;
#2:	       add	r1, 12 -> r2.29
#0:	       stm.s	r2, r15, 13
	;;
#0:	       stm.s	r3, r15, 14
	;;
.BB9_19:                                ;   in Loop: Header=BB9_20 Depth=1
#1:	       stm.a	0, r1.23, 0
	;;
.BB9_20:                                ; %.outer260
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB9_279 Depth 2
                                        ;     Child Loop BB9_97 Depth 2
                                        ;     Child Loop BB9_23 Depth 2
                                        ;       Child Loop BB9_37 Depth 3
                                        ;         Child Loop BB9_39 Depth 4
                                        ;           Child Loop BB9_45 Depth 5
                                        ;           Child Loop BB9_42 Depth 5
                                        ;       Child Loop BB9_25 Depth 3
                                        ;     Child Loop BB9_313 Depth 2
                                        ;     Child Loop BB9_310 Depth 2
                                        ;     Child Loop BB9_244 Depth 2
                                        ;     Child Loop BB9_307 Depth 2
                                        ;     Child Loop BB9_305 Depth 2
                                        ;     Child Loop BB9_267 Depth 2
                                        ;     Child Loop BB9_348 Depth 2
                                        ;     Child Loop BB9_346 Depth 2
                                        ;     Child Loop BB9_337 Depth 2
                                        ;     Child Loop BB9_319 Depth 2
                                        ;     Child Loop BB9_326 Depth 2
                                        ;     Child Loop BB9_322 Depth 2
                                        ;     Child Loop BB9_300 Depth 2
                                        ;     Child Loop BB9_296 Depth 2
                                        ;     Child Loop BB9_69 Depth 2
                                        ;     Child Loop BB9_88 Depth 2
                                        ;     Child Loop BB9_257 Depth 2
                                        ;     Child Loop BB9_180 Depth 2
                                        ;     Child Loop BB9_172 Depth 2
                                        ;     Child Loop BB9_148 Depth 2
                                        ;     Child Loop BB9_132 Depth 2
#1:	       or	r1.28, 0 -> r12
#0:	       br @	.BB9_23
	;;
.BB9_21:                                ;   in Loop: Header=BB9_23 Depth=2
#3:	       ldm.f	r3.23, 0
	;;
#3:	       stm.a	r3.25, r31, 0
	;;
.BB9_22:                                ;   in Loop: Header=BB9_23 Depth=2
#3:	       add	r3.23, 4 -> r3.23
	;;
.BB9_23:                                ;   Parent Loop BB9_20 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB9_37 Depth 3
                                        ;         Child Loop BB9_39 Depth 4
                                        ;           Child Loop BB9_45 Depth 5
                                        ;           Child Loop BB9_42 Depth 5
                                        ;       Child Loop BB9_25 Depth 3
#3:	       ldi	0 -> r3.24
#0:	       br @	.BB9_25
	;;
.BB9_24:                                ;   in Loop: Header=BB9_25 Depth=3
#3:	       add	r3.24, 1 -> r3.24
	;;
.BB9_25:                                ;   Parent Loop BB9_20 Depth=1
                                        ;     Parent Loop BB9_23 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
#3:	       ldmr.f	r3.24, r10, 0
	;;
#3:	       add	r10, r3.24 -> r11
	;;
#0:	       bbh	mzext8 r11 -> r0
	;;
#0:	       brz eq @	r0, .BB9_27
	;;
.BB9_26:                                ;   in Loop: Header=BB9_25 Depth=3
#0:	       bbh	zext8 r0 -> r1
	;;
#0:	       cmp eq	r1, r0.28 -> c1
	;;
#0:	if !c1 br @	.BB9_24
	;;
.BB9_27:                                ;   in Loop: Header=BB9_23 Depth=2
#3:	       brz eq @	r3.24, .BB9_33
	;;
.BB9_28:                                ;   in Loop: Header=BB9_23 Depth=2
#0:	       stm.a	r10, r12, 0
#1:	       ldiu	128 -> r1
	;;
#3:	       stm.a	r3.24, r12, 1
#0:	       add	r15, r1 -> r1
	;;
#0:	       ldm.f	r15, 192
	;;
#3:	       add	r31, r3.24 -> r0
	;;
#0:	       stm.a	r0, r1, 16
	;;
#1:	       ldm.f	r1.23, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#1:	       stm.a	r0, r1.23, 0
#0:	       cmp lt	r0, 8 -> c1
	;;
#0:	if  c1 br @	.BB9_31
	;;
.BB9_29:                                ;   in Loop: Header=BB9_23 Depth=2
#0:	       or	r0.26, 0 -> r0
#1:	       callg	___sprint_r
#2:	       ldiu	160 -> r12
	;;
#0:	       add	r15, r12 -> r12
	;;
#0:	       add	r12, 24 -> r1
	;;
	       nop	0
	;;
#0:	       cmp ne	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB9_356
	;;
.BB9_30:                                ;   in Loop: Header=BB9_23 Depth=2
#0:	       s2add	r15, 24 -> r0
#1:	       br	.BB9_32
	;;
#0:	       add	r0, 24 -> r12
	;;
	       nop	0
	;;
.BB9_31:                                ;   in Loop: Header=BB9_23 Depth=2
#0:	       add	r12, 8 -> r12
	;;
.BB9_32:                                ;   in Loop: Header=BB9_23 Depth=2
#3:	       ldmr.f	r3.24, r10, 0
	;;
#3:	       add	r3.24, r3.25 -> r3.25
	;;
#0:	       bbh	mzext8 r11 -> r0
	;;
.BB9_33:                                ;   in Loop: Header=BB9_23 Depth=2
#0:	       bbh	zext8 r0 -> r0
	;;
#0:	       cmp eq	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB9_353
	;;
.BB9_34:                                ;   in Loop: Header=BB9_23 Depth=2
#2:	       ldi	-1 -> r2.23
#0:	       ldi	0 -> r0.23
#1:	       add	r11, 1 -> r10
#3:	       ldi	0 -> r4
	;;
#0:	       br	.BB9_37
#1:	       ldi	0 -> r0
#2:	       ldiu	192 -> r1
	;;
#0:	       add	r15, r1 -> r1
	;;
#0:	       stmb.a	0, r1, 28
	;;
.BB9_35:                                ;   in Loop: Header=BB9_37 Depth=3
#0:	       or	r0.23, 16 -> r0.23
	;;
.BB9_36:                                ;   in Loop: Header=BB9_37 Depth=3
#3:	       or	r3.24, 0 -> r0
	;;
.BB9_37:                                ; %.backedge
                                        ;   Parent Loop BB9_20 Depth=1
                                        ;     Parent Loop BB9_23 Depth=2
                                        ; =>    This Loop Header: Depth=3
                                        ;         Child Loop BB9_39 Depth 4
                                        ;           Child Loop BB9_45 Depth 5
                                        ;           Child Loop BB9_42 Depth 5
#0:	       ldm.f	r10, 0
#1:	       br	.BB9_39
#2:	       add	r10, 1 -> r3
	;;
#0:	       bbh	msext8 r10 -> r11
	;;
	       nop	0
	;;
.BB9_38:                                ; %._crit_edge
                                        ;   in Loop: Header=BB9_39 Depth=4
#2:	       ldi	-1 -> r2.23
#0:	       cmp gt	r0, -1 -> c1
	;;
#2:	if  c1 or	r0, 0 -> r2.23
#3:	       or	r3.24, 0 -> r0
	;;
.BB9_39:                                ; %.loopexit82
                                        ;   Parent Loop BB9_20 Depth=1
                                        ;     Parent Loop BB9_23 Depth=2
                                        ;       Parent Loop BB9_37 Depth=3
                                        ; =>      This Loop Header: Depth=4
                                        ;           Child Loop BB9_45 Depth 5
                                        ;           Child Loop BB9_42 Depth 5
#3:	       or	r0, 0 -> r3.24
#0:	       cmp gt	r11, r14 -> c1
#1:	       or	r3, 0 -> r10
	;;
#0:	if !c1 br @	.BB9_62
	;;
.BB9_40:                                ; %.loopexit82
                                        ;   in Loop: Header=BB9_39 Depth=4
#0:	       or	r11, 0 -> r2
	;;
#0:	       addi	-32 -> r2
	;;
#0:	       cmpu gt	r2, r13 -> c1
	;;
#0:	if  c1 br @	.BB9_63
	;;
.BB9_41:                                ; %.loopexit82
                                        ;   in Loop: Header=BB9_39 Depth=4
#0:	       ldga	.JTI9_0 -> r0.16
#1:	       ldga	._.str649 -> r3
#2:	       ldi	88 -> r1
#3:	       ldi	117 -> r5
	;;
#0:	       ldi	111 -> r0.24
#1:	       ldi	0 -> r0
	;;
#0:	       s2add	r0.16, r2 -> r2
	;;
#0:	       ldm.d	r2, 0
	;;
#0:	       jop	brind	r31
	;;
.BB9_42:                                ; %.preheader81
                                        ;   Parent Loop BB9_20 Depth=1
                                        ;     Parent Loop BB9_23 Depth=2
                                        ;       Parent Loop BB9_37 Depth=3
                                        ;         Parent Loop BB9_39 Depth=4
                                        ; =>        This Inner Loop Header: Depth=5
#0:	       mul	r0, 10 -> $mul0.0
#1:	       ldm.f	r10, 0
#2:	       add	r10, 1 -> r3
	;;
#0:	       ldx	$mul0.0, r11 -> r0
	;;
#0:	       bbh	msext8 r10 -> r11
#1:	       addi	-48 -> r0
#2:	       or	r3, 0 -> r10
	;;
#0:	       or	r11, 0 -> r1
	;;
#0:	       addi	-48 -> r1
	;;
#0:	       cmpu lt	r1, 10 -> c1
	;;
#0:	if !c1 br @	.BB9_39
#1:	if  c1 br @	.BB9_42
	;;
.BB9_43:                                ;   in Loop: Header=BB9_39 Depth=4
#0:	       ldm.f	r10, 0
#1:	       ldi	42 -> r0
#2:	       add	r10, 1 -> r3
	;;
#0:	       bbh	mzext8 r10 -> r1
	;;
#0:	       cmp eq	r1, r0 -> c1
	;;
#0:	if  c1 br @	.BB9_58
	;;
.BB9_44:                                ; %.preheader86
                                        ;   in Loop: Header=BB9_39 Depth=4
#0:	       bbh	sext8 r1 -> r11
#1:	       ldi	0 -> r0
	;;
#0:	       or	r11, 0 -> r1
	;;
#0:	       addi	-48 -> r1
	;;
#0:	       cmpu lt	r1, 10 -> c1
	;;
#0:	if !c1 br @	.BB9_38
	;;
.BB9_45:                                ; %.lr.ph
                                        ;   Parent Loop BB9_20 Depth=1
                                        ;     Parent Loop BB9_23 Depth=2
                                        ;       Parent Loop BB9_37 Depth=3
                                        ;         Parent Loop BB9_39 Depth=4
                                        ; =>        This Inner Loop Header: Depth=5
#1:	       mul	r0, 10 -> $mul1.0
#0:	       ldm.f	r3, 0
#2:	       add	r3, 1 -> r2
	;;
#1:	       ldx	$mul1.0, r1 -> r0
	;;
#0:	       bbh	msext8 r3 -> r11
#1:	       or	r2, 0 -> r3
	;;
#0:	       or	r11, 0 -> r1
	;;
#0:	       addi	-48 -> r1
	;;
#0:	       cmpu lt	r1, 10 -> c1
	;;
#0:	if !c1 br @	.BB9_38
#1:	if  c1 br @	.BB9_45
	;;
.BB9_46:                                ;   in Loop: Header=BB9_37 Depth=3
#3:	       or	r3.24, 0 -> r0
#0:	       bbh	zext8 r4 -> r1
	;;
#0:	       brz ne @	r1, .BB9_37
	;;
.BB9_47:                                ;   in Loop: Header=BB9_37 Depth=3
#0:	       ldi	32 -> r4
#1:	       br @	.BB9_53
	;;
.BB9_48:                                ;   in Loop: Header=BB9_37 Depth=3
#0:	       or	r0.23, 1 -> r0.23
#1:	       br @	.BB9_36
	;;
.BB9_49:                                ;   in Loop: Header=BB9_37 Depth=3
#3:	       ldm.f	r3.23, 0
	;;
#3:	       add	r3.23, 4 -> r2
	;;
#3:	       or	r2, 0 -> r3.23
#0:	       cmp gt	r31, -1 -> c1
#1:	       or	r31, 0 -> r0
	;;
#0:	if  c1 br @	.BB9_37
	;;
.BB9_50:                                ;   in Loop: Header=BB9_37 Depth=3
#3:	       or	r2, 0 -> r3.23
#0:	       ldi	0 -> r1
	;;
#3:	       sub	r1, r0 -> r3.24
	;;
.BB9_51:                                ; %.loopexit92
                                        ;   in Loop: Header=BB9_37 Depth=3
#0:	       or	r0.23, 4 -> r0.23
#1:	       br @	.BB9_36
	;;
.BB9_52:                                ;   in Loop: Header=BB9_37 Depth=3
#0:	       ldi	43 -> r4
	;;
.BB9_53:                                ;   in Loop: Header=BB9_37 Depth=3
#0:	       ldiu	192 -> r1
#1:	       br	.BB9_36
	;;
#0:	       add	r15, r1 -> r1
	;;
#0:	       stmb.a	r4, r1, 28
	;;
.BB9_54:                                ;   in Loop: Header=BB9_37 Depth=3
#0:	       ldi	128 -> r0
#1:	       br @	.BB9_57
	;;
.BB9_55:                                ;   in Loop: Header=BB9_37 Depth=3
#0:	       or	r0.23, 8 -> r0.23
#1:	       br @	.BB9_36
	;;
.BB9_56:                                ;   in Loop: Header=BB9_37 Depth=3
#0:	       ldi	64 -> r0
	;;
.BB9_57:                                ;   in Loop: Header=BB9_37 Depth=3
#0:	       or	r0.23, r0 -> r0.23
#1:	       br @	.BB9_36
	;;
.BB9_58:                                ;   in Loop: Header=BB9_37 Depth=3
#3:	       ldm.f	r3.23, 0
#2:	       ldi	-1 -> r2.23
#0:	       or	r3, 0 -> r10
	;;
#0:	       br	.BB9_37
#3:	       add	r3.23, 4 -> r3.23
	;;
#3:	       or	r3.24, 0 -> r0
#0:	       cmp gt	r31, -1 -> c1
	;;
#2:	if  c1 or	r31, 0 -> r2.23
	;;
.BB9_59:                                ;   in Loop: Header=BB9_23 Depth=2
#0:	       btest	r0.23, 4 -> !c1
	;;
#0:	if !c1 br @	.BB9_21
	;;
.BB9_60:                                ;   in Loop: Header=BB9_23 Depth=2
#0:	       btest	r0.23, 6 -> !c1
	;;
#0:	if  c1 br @	.BB9_21
	;;
.BB9_61:                                ;   in Loop: Header=BB9_23 Depth=2
#3:	       ldm.f	r3.23, 0
#0:	       br	.BB9_22
	;;
#3:	       stmh.a	r3.25, r31, 0
	;;
	       nop	0
	;;
.BB9_62:                                ; %.loopexit82
                                        ;   in Loop: Header=BB9_20 Depth=1
#0:	       cmp eq	r11, 0 -> c3
	;;
#0:	if  c3 br @	.BB9_353
	;;
.BB9_63:                                ;   in Loop: Header=BB9_20 Depth=1
#2:	       ldi	0 -> r2.26
#0:	       s2add	r15, 16 -> r1
#1:	       ldiu	192 -> r3
	;;
#2:	       ldi	1 -> r2.25
#0:	       stmb.a	r11, r1, 16
#1:	       add	r15, r3 -> r1
	;;
#2:	       or	r2.26, 0 -> r2.24
#0:	       stmb.a	0, r1, 28
	;;
#0:	       ldm.s	r15, 24
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       stm.s	r0, r15, 15
	;;
.BB9_64:                                ;   in Loop: Header=BB9_20 Depth=1
#0:	       or	r11, 0 -> r0.24
	;;
.BB9_65:                                ; %._crit_edge644
                                        ;   in Loop: Header=BB9_20 Depth=1
#1:	       ldiu	lo11{ ___mem_emergency } -> r1.30
#2:	       cmp gt	r2.24, r2.25 -> c1
#0:	       and	r0.23, 2 -> r0.25
#3:	       ldm.f	r15, 220
	;;
#2:	       or	r2.25, 0 -> r0
	;;
#1:	       stm.a	r31, r1.30, 0
#2:	if  c1 or	r2.24, 0 -> r0
	;;
#0:	       ldm.s	r15, 40
	;;
#0:	       or	r31, 0 -> r1
#1:	       ldmg.d	___mem_emergency
	;;
#0:	       bbh	mzext8 r1 -> r1
	;;
#0:	       cmp ne	r1, 0 -> c2
#1:	       or	r0, 0 -> r1
	;;
#0:	if  c2 add	r1, 1 -> r1
	;;
#3:	       add	r1, 2 -> r3.27
#0:	       sr	r0.25, 1 -> r1
	;;
#0:	       btest	r1, 0 -> c1
#1:	       ldx	$c2 -> r1
	;;
#3:	if !c1 add	r1, r0 -> r3.27 ; aaaf
#0:	       ldi	132 -> r0
	;;
#0:	       and	r0.23, r0 -> r0.27
	;;
#0:	       brz ne @	r0.27, .BB9_75
	;;
.BB9_66:                                ;   in Loop: Header=BB9_20 Depth=1
#3:	       sub	r3.24, r3.27 -> r11
	;;
#0:	       cmp lt	r11, 1 -> c1
	;;
#0:	if !c1 br @	.BB9_69
#1:	if  c1 br @	.BB9_75
	;;
.BB9_67:                                ;   in Loop: Header=BB9_69 Depth=2
#0:	       add	r12, 8 -> r12
	;;
.BB9_68:                                ;   in Loop: Header=BB9_69 Depth=2
#0:	       sub	r11, 16 -> r11
	;;
.BB9_69:                                ; %.preheader58
                                        ;   Parent Loop BB9_20 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#3:	       cmp lt	r11, r3.26 -> c1
#0:	       ldga	__vfprintf_r.blanks -> r0
	;;
#0:	if  c1 br @	.BB9_72
#1:	       stm.a	r0, r12, 0
	;;
.BB9_70:                                ;   in Loop: Header=BB9_69 Depth=2
#1:	       stm.a	r1.29, r12, 1
#0:	       ldiu	128 -> r1
	;;
#0:	       ldm.f	r15, 192
#1:	       add	r15, r1 -> r1
	;;
#0:	       add	r31, 16 -> r0
	;;
#0:	       stm.a	r0, r1, 16
	;;
#1:	       ldm.f	r1.23, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#1:	       stm.a	r0, r1.23, 0
#0:	       cmp lt	r0, 8 -> c1
	;;
#0:	if  c1 br @	.BB9_67
	;;
.BB9_71:                                ;   in Loop: Header=BB9_69 Depth=2
#0:	       or	r0.26, 0 -> r0
#2:	       callg	___sprint_r
#1:	       or	r1.27, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz eq @	r0, .BB9_68
#1:	       or	r1.28, 0 -> r12
	;;
#0:	       br @	.BB9_356
	;;
.BB9_72:                                ;   in Loop: Header=BB9_20 Depth=1
#0:	       stm.a	r11, r12, 1
#1:	       ldiu	128 -> r1
	;;
#0:	       ldm.f	r15, 192
#1:	       add	r15, r1 -> r1
	;;
#0:	       add	r31, r11 -> r0
	;;
#0:	       stm.a	r0, r1, 16
	;;
#1:	       ldm.f	r1.23, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#1:	       stm.a	r0, r1.23, 0
#0:	       cmp gt	r0, 7 -> c1
	;;
#0:	if !c1 br @	.BB9_74
	;;
.BB9_73:                                ;   in Loop: Header=BB9_20 Depth=1
#0:	       or	r0.26, 0 -> r0
#2:	       callg	___sprint_r
#1:	       or	r1.27, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz eq @	r0, .BB9_75
#1:	       or	r1.28, 0 -> r12
	;;
#0:	       br @	.BB9_356
	;;
.BB9_74:                                ; %._crit_edge641
                                        ;   in Loop: Header=BB9_20 Depth=1
#0:	       add	r12, 8 -> r12
	;;
.BB9_75:                                ; %._crit_edge642
                                        ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldm.f	r15, 220
	;;
#0:	       stm.a	r31, r0.30, 0
	;;
#0:	       ldm.s	r15, 40
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldmg.d	___mem_emergency
	;;
#0:	       bbh	mzext8 r0 -> r0
	;;
#0:	       brz eq @	r0, .BB9_80
	;;
.BB9_76:                                ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldm.s	r15, 40
#1:	       ldiu	128 -> r1
	;;
#0:	       add	r15, r1 -> r1
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       stm.a	r0, r12, 0
	;;
#0:	       stm.a	1, r12, 1
	;;
#0:	       ldm.f	r15, 192
	;;
#0:	       add	r31, 1 -> r3
	;;
#0:	       stm.a	r3, r1, 16
	;;
#1:	       ldm.f	r1.23, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#1:	       stm.a	r0, r1.23, 0
#0:	       cmp lt	r0, 8 -> c1
	;;
#0:	if  c1 br @	.BB9_79
	;;
.BB9_77:                                ;   in Loop: Header=BB9_20 Depth=1
#0:	       or	r0.26, 0 -> r0
#1:	       callg	___sprint_r
#2:	       ldiu	160 -> r11
	;;
#0:	       add	r15, r11 -> r11
	;;
#0:	       add	r11, 24 -> r1
	;;
	       nop	0
	;;
#0:	       cmp ne	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB9_356
	;;
.BB9_78:                                ;   in Loop: Header=BB9_20 Depth=1
#0:	       s2add	r15, 24 -> r0
#1:	       br	.BB9_80
	;;
#0:	       add	r0, 24 -> r12
	;;
	       nop	0
	;;
.BB9_79:                                ;   in Loop: Header=BB9_20 Depth=1
#0:	       add	r12, 8 -> r12
	;;
.BB9_80:                                ;   in Loop: Header=BB9_20 Depth=1
#0:	       brz eq @	r0.25, .BB9_84
	;;
.BB9_81:                                ;   in Loop: Header=BB9_20 Depth=1
#2:	       stm.a	r2.29, r12, 0
#0:	       ldiu	128 -> r1
	;;
#0:	       stm.a	2, r12, 1
#1:	       add	r15, r1 -> r1
	;;
#0:	       ldm.f	r15, 192
	;;
#0:	       add	r31, 2 -> r0
	;;
#0:	       stm.a	r0, r1, 16
	;;
#1:	       ldm.f	r1.23, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#1:	       stm.a	r0, r1.23, 0
#0:	       cmp lt	r0, 8 -> c1
	;;
#0:	if  c1 br @	.BB9_83
	;;
.BB9_82:                                ;   in Loop: Header=BB9_20 Depth=1
#0:	       or	r0.26, 0 -> r0
#2:	       callg	___sprint_r
#1:	       or	r1.27, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz eq @	r0, .BB9_84
#1:	       or	r1.28, 0 -> r12
	;;
#0:	       br @	.BB9_356
	;;
.BB9_83:                                ;   in Loop: Header=BB9_20 Depth=1
#0:	       add	r12, 8 -> r12
	;;
.BB9_84:                                ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldi	128 -> r0
	;;
#0:	       cmp ne	r0.27, r0 -> c1
	;;
#0:	if  c1 br @	.BB9_94
	;;
.BB9_85:                                ;   in Loop: Header=BB9_20 Depth=1
#3:	       sub	r3.24, r3.27 -> r11
	;;
#0:	       cmp lt	r11, 1 -> c1
	;;
#0:	if !c1 br @	.BB9_88
#1:	if  c1 br @	.BB9_94
	;;
.BB9_86:                                ;   in Loop: Header=BB9_88 Depth=2
#0:	       add	r12, 8 -> r12
	;;
.BB9_87:                                ;   in Loop: Header=BB9_88 Depth=2
#0:	       sub	r11, 16 -> r11
	;;
.BB9_88:                                ; %.preheader52
                                        ;   Parent Loop BB9_20 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#3:	       cmp lt	r11, r3.26 -> c1
#0:	       ldga	__vfprintf_r.zeroes -> r0
	;;
#0:	if  c1 br @	.BB9_91
#1:	       stm.a	r0, r12, 0
	;;
.BB9_89:                                ;   in Loop: Header=BB9_88 Depth=2
#1:	       stm.a	r1.29, r12, 1
#0:	       ldiu	128 -> r1
	;;
#0:	       ldm.f	r15, 192
#1:	       add	r15, r1 -> r1
	;;
#0:	       add	r31, 16 -> r0
	;;
#0:	       stm.a	r0, r1, 16
	;;
#1:	       ldm.f	r1.23, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#1:	       stm.a	r0, r1.23, 0
#0:	       cmp lt	r0, 8 -> c1
	;;
#0:	if  c1 br @	.BB9_86
	;;
.BB9_90:                                ;   in Loop: Header=BB9_88 Depth=2
#0:	       or	r0.26, 0 -> r0
#2:	       callg	___sprint_r
#1:	       or	r1.27, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz eq @	r0, .BB9_87
#1:	       or	r1.28, 0 -> r12
	;;
#0:	       br @	.BB9_356
	;;
.BB9_91:                                ;   in Loop: Header=BB9_20 Depth=1
#0:	       stm.a	r11, r12, 1
#1:	       ldiu	128 -> r1
	;;
#0:	       ldm.f	r15, 192
#1:	       add	r15, r1 -> r1
	;;
#0:	       add	r31, r11 -> r0
	;;
#0:	       stm.a	r0, r1, 16
	;;
#1:	       ldm.f	r1.23, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#1:	       stm.a	r0, r1.23, 0
#0:	       cmp lt	r0, 8 -> c1
	;;
#0:	if  c1 br @	.BB9_93
	;;
.BB9_92:                                ;   in Loop: Header=BB9_20 Depth=1
#0:	       or	r0.26, 0 -> r0
#2:	       callg	___sprint_r
#1:	       or	r1.27, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz eq @	r0, .BB9_94
#1:	       or	r1.28, 0 -> r12
	;;
#0:	       br @	.BB9_356
	;;
.BB9_93:                                ;   in Loop: Header=BB9_20 Depth=1
#0:	       add	r12, 8 -> r12
	;;
.BB9_94:                                ;   in Loop: Header=BB9_20 Depth=1
#2:	       sub	r2.24, r2.25 -> r11
	;;
#0:	       cmp lt	r11, 1 -> c1
	;;
#0:	if !c1 br @	.BB9_97
#1:	if  c1 br @	.BB9_103
	;;
.BB9_95:                                ;   in Loop: Header=BB9_97 Depth=2
#0:	       add	r12, 8 -> r12
	;;
.BB9_96:                                ;   in Loop: Header=BB9_97 Depth=2
#0:	       sub	r11, 16 -> r11
	;;
.BB9_97:                                ; %.preheader46
                                        ;   Parent Loop BB9_20 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#3:	       cmp lt	r11, r3.26 -> c1
#0:	       ldga	__vfprintf_r.zeroes -> r0
	;;
#0:	if  c1 br @	.BB9_100
#1:	       stm.a	r0, r12, 0
	;;
.BB9_98:                                ;   in Loop: Header=BB9_97 Depth=2
#1:	       stm.a	r1.29, r12, 1
#0:	       ldiu	128 -> r1
	;;
#0:	       ldm.f	r15, 192
#1:	       add	r15, r1 -> r1
	;;
#0:	       add	r31, 16 -> r0
	;;
#0:	       stm.a	r0, r1, 16
	;;
#1:	       ldm.f	r1.23, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#1:	       stm.a	r0, r1.23, 0
#0:	       cmp lt	r0, 8 -> c1
	;;
#0:	if  c1 br @	.BB9_95
	;;
.BB9_99:                                ;   in Loop: Header=BB9_97 Depth=2
#0:	       or	r0.26, 0 -> r0
#2:	       callg	___sprint_r
#1:	       or	r1.27, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz eq @	r0, .BB9_96
#1:	       or	r1.28, 0 -> r12
	;;
#0:	       br @	.BB9_356
	;;
.BB9_100:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       stm.a	r11, r12, 1
#1:	       ldiu	128 -> r1
	;;
#0:	       ldm.f	r15, 192
#1:	       add	r15, r1 -> r1
	;;
#0:	       add	r31, r11 -> r0
	;;
#0:	       stm.a	r0, r1, 16
	;;
#1:	       ldm.f	r1.23, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#1:	       stm.a	r0, r1.23, 0
#0:	       cmp lt	r0, 8 -> c1
	;;
#0:	if  c1 br @	.BB9_102
	;;
.BB9_101:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       or	r0.26, 0 -> r0
#2:	       callg	___sprint_r
#1:	       or	r1.27, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz eq @	r0, .BB9_103
#1:	       or	r1.28, 0 -> r12
	;;
#0:	       br @	.BB9_356
	;;
.BB9_102:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       add	r12, 8 -> r12
	;;
.BB9_103:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       btest	r0.23, 8 -> c1
	;;
#0:	if  c1 br @	.BB9_106
	;;
.BB9_104:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldm.s	r15, 60
#1:	       ldiu	128 -> r1
	;;
#0:	       add	r15, r1 -> r1
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       stm.a	r0, r12, 0
	;;
#2:	       stm.a	r2.25, r12, 1
	;;
#0:	       ldm.f	r15, 192
	;;
#2:	       add	r31, r2.25 -> r0
	;;
#0:	       stm.a	r0, r1, 16
	;;
#1:	       ldm.f	r1.23, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#1:	       stm.a	r0, r1.23, 0
#0:	       cmp lt	r0, 8 -> c1
	;;
#0:	if  c1 br @	.BB9_110
	;;
.BB9_105:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       or	r0.26, 0 -> r0
#2:	       callg	___sprint_r
#1:	       or	r1.27, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#1:	       or	r1.28, 0 -> r12
#0:	       cmp eq	r0, 0 -> c3
	;;
#0:	if !c3 br @	.BB9_356
#1:	if  c3 br @	.BB9_275
	;;
.BB9_106:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldi	102 -> r0
	;;
#0:	       cmp lt	r0.24, r0 -> c1
	;;
#0:	if  c1 br @	.BB9_113
	;;
.BB9_107:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       fop	dcmp	d6, d5 -> f0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r0
	;;
#0:	       btest	r0, 9 -> c1
	;;
#0:	if  c1 br @	.BB9_117
	;;
.BB9_108:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldga	._.str277 -> r0
#1:	       ldiu	128 -> r1
	;;
#0:	       stm.a	r0, r12, 0
#1:	       add	r15, r1 -> r1
	;;
#0:	       stm.a	1, r12, 1
	;;
#0:	       ldm.f	r15, 192
	;;
#0:	       add	r31, 1 -> r3
	;;
#0:	       stm.a	r3, r1, 16
	;;
#1:	       ldm.f	r1.23, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#1:	       stm.a	r0, r1.23, 0
#0:	       cmp lt	r0, 8 -> c1
	;;
#0:	if  c1 br @	.BB9_136
	;;
.BB9_109:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       or	r0.26, 0 -> r0
#2:	       callg	___sprint_r
#1:	       or	r1.27, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#1:	       or	r1.28, 0 -> r12
#0:	       cmp eq	r0, 0 -> c3
	;;
#0:	if !c3 br @	.BB9_356
#1:	if  c3 br @	.BB9_137
	;;
.BB9_110:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       add	r12, 8 -> r12
#1:	       br @	.BB9_275
	;;
.BB9_111:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldm.s	r15, 60
#1:	       ldiu	128 -> r1
	;;
#0:	       add	r15, r1 -> r1
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       stm.a	r0, r12, 0
	;;
#0:	       stm.a	1, r12, 1
	;;
#0:	       ldm.f	r15, 192
	;;
#0:	       add	r31, 1 -> r3
	;;
#0:	       stm.a	r3, r1, 16
	;;
#1:	       ldm.f	r1.23, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#1:	       stm.a	r0, r1.23, 0
#0:	       cmp lt	r0, 8 -> c1
	;;
#0:	if !c1 br @	.BB9_161
	;;
.BB9_112:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       add	r12, 8 -> r1
#1:	       br @	.BB9_163
	;;
.BB9_113:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldm.f	r15, 200
	;;
#0:	       cmp gt	r31, 1 -> c1
	;;
#0:	if !c1 btest	r0.23, 0 -> c1
	;;
#0:	if !c1 br @	.BB9_111
	;;
.BB9_114:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldm.s	r15, 60
#1:	       ldiu	128 -> r1
	;;
#0:	       add	r15, r1 -> r1
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       stm.a	r0, r12, 0
	;;
#0:	       stm.a	1, r12, 1
	;;
#0:	       ldm.f	r15, 192
	;;
#0:	       add	r31, 1 -> r3
	;;
#0:	       stm.a	r3, r1, 16
	;;
#1:	       ldm.f	r1.23, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#1:	       stm.a	r0, r1.23, 0
#0:	       cmp lt	r0, 8 -> c1
	;;
#0:	if  c1 br @	.BB9_121
	;;
.BB9_115:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       or	r0.26, 0 -> r0
#1:	       callg	___sprint_r
#2:	       ldiu	160 -> r11
	;;
#0:	       add	r15, r11 -> r11
	;;
#0:	       add	r11, 24 -> r1
	;;
	       nop	0
	;;
#0:	       cmp ne	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB9_356
	;;
.BB9_116:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       s2add	r15, 24 -> r1
#1:	       br	.BB9_122
	;;
#0:	       add	r1, 24 -> r0
	;;
	       nop	0
	;;
.BB9_117:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldm.f	r15, 212
	;;
#0:	       cmp gt	r31, 0 -> c3
	;;
#0:	if  c3 br @	.BB9_140
	;;
.BB9_118:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldga	._.str277 -> r0
#1:	       ldiu	128 -> r1
	;;
#0:	       stm.a	r0, r12, 0
#1:	       add	r15, r1 -> r1
	;;
#0:	       stm.a	1, r12, 1
	;;
#0:	       ldm.f	r15, 192
	;;
#0:	       add	r31, 1 -> r3
	;;
#0:	       stm.a	r3, r1, 16
	;;
#1:	       ldm.f	r1.23, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#1:	       stm.a	r0, r1.23, 0
#0:	       cmp lt	r0, 8 -> c1
	;;
#0:	if  c1 br @	.BB9_152
	;;
.BB9_119:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       or	r0.26, 0 -> r0
#1:	       callg	___sprint_r
#2:	       ldiu	160 -> r11
	;;
#0:	       add	r15, r11 -> r11
	;;
#0:	       add	r11, 24 -> r1
	;;
	       nop	0
	;;
#0:	       cmp ne	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB9_356
	;;
.BB9_120:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       s2add	r15, 24 -> r0
#1:	       br	.BB9_153
	;;
#0:	       add	r0, 24 -> r12
	;;
	       nop	0
	;;
.BB9_121:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       add	r12, 8 -> r0
	;;
.BB9_122:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldga	._.str391 -> r1
#1:	       ldiu	128 -> r2
	;;
#0:	       stm.a	r1, r0, 0
#1:	       add	r15, r2 -> r2
	;;
#0:	       stm.a	r0.29, r0, 1
	;;
#0:	       ldm.f	r15, 192
	;;
#0:	       add	r31, r0.29 -> r1
	;;
#0:	       stm.a	r1, r2, 16
	;;
#1:	       ldm.f	r1.23, 0
	;;
#0:	       add	r31, 1 -> r1
	;;
#1:	       stm.a	r1, r1.23, 0
#0:	       cmp lt	r1, 8 -> c1
	;;
#0:	if  c1 br @	.BB9_125
	;;
.BB9_123:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       or	r0.26, 0 -> r0
#1:	       callg	___sprint_r
#2:	       ldiu	160 -> r11
	;;
#0:	       add	r15, r11 -> r11
	;;
#0:	       add	r11, 24 -> r1
	;;
	       nop	0
	;;
#0:	       cmp ne	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB9_356
	;;
.BB9_124:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       s2add	r15, 24 -> r0
#1:	       br	.BB9_126
	;;
#0:	       add	r0, 24 -> r1
	;;
	       nop	0
	;;
.BB9_125:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       add	r0, 8 -> r1
	;;
.BB9_126:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       fop	dcmp	d6, d5 -> f0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r0
	;;
#0:	       btest	r0, 0 -> c1
	;;
#0:	if  c1 br @	.BB9_129
	;;
.BB9_127:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldm.s	r15, 60
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       add	r0, 1 -> r0
	;;
#0:	       stm.a	r0, r1, 0
	;;
#0:	       ldm.f	r15, 200
	;;
#0:	       sub	r31, 1 -> r2
	;;
#0:	       stm.a	r2, r1, 1
#1:	       ldiu	128 -> r2
	;;
#0:	       ldm.f	r15, 192
#1:	       add	r15, r2 -> r2
	;;
#0:	       or	r31, 0 -> r3
#1:	       ldm.f	r15, 200
	;;
#0:	       add	r31, r3 -> r0
	;;
#0:	       sub	r0, 1 -> r0
	;;
#0:	       stm.a	r0, r2, 16
	;;
#1:	       ldm.f	r1.23, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#1:	       stm.a	r0, r1.23, 0
#0:	       cmp lt	r0, 8 -> c1
	;;
#0:	if !c1 br @	.BB9_161
	;;
.BB9_128:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       add	r1, 8 -> r1
#1:	       br @	.BB9_163
	;;
.BB9_129:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldm.f	r15, 200
	;;
#0:	       sub	r31, 1 -> r11
	;;
#0:	       cmp lt	r11, 1 -> c1
	;;
#0:	if !c1 br @	.BB9_132
#1:	if  c1 br @	.BB9_163
	;;
.BB9_130:                               ;   in Loop: Header=BB9_132 Depth=2
#0:	       add	r1, 8 -> r1
	;;
.BB9_131:                               ;   in Loop: Header=BB9_132 Depth=2
#0:	       sub	r11, 16 -> r11
	;;
.BB9_132:                               ; %.preheader40
                                        ;   Parent Loop BB9_20 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#3:	       cmp lt	r11, r3.26 -> c1
#0:	       ldga	__vfprintf_r.zeroes -> r0
	;;
#0:	if  c1 br @	.BB9_159
#1:	       stm.a	r0, r1, 0
	;;
.BB9_133:                               ;   in Loop: Header=BB9_132 Depth=2
#1:	       stm.a	r1.29, r1, 1
#0:	       ldiu	128 -> r2
	;;
#0:	       ldm.f	r15, 192
#1:	       add	r15, r2 -> r2
	;;
#0:	       add	r31, 16 -> r0
	;;
#0:	       stm.a	r0, r2, 16
	;;
#1:	       ldm.f	r1.23, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#1:	       stm.a	r0, r1.23, 0
#0:	       cmp lt	r0, 8 -> c1
	;;
#0:	if  c1 br @	.BB9_130
	;;
.BB9_134:                               ;   in Loop: Header=BB9_132 Depth=2
#0:	       or	r0.26, 0 -> r0
#1:	       callg	___sprint_r
#2:	       ldiu	160 -> r12
	;;
#0:	       add	r15, r12 -> r12
	;;
#0:	       add	r12, 24 -> r1
	;;
	       nop	0
	;;
#0:	       cmp ne	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB9_356
	;;
.BB9_135:                               ;   in Loop: Header=BB9_132 Depth=2
#0:	       s2add	r15, 24 -> r0
#1:	       br	.BB9_131
	;;
#0:	       add	r0, 24 -> r1
	;;
	       nop	0
	;;
.BB9_136:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       add	r12, 8 -> r12
	;;
.BB9_137:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldm.f	r15, 200
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldm.f	r15, 212
	;;
#0:	       cmp lt	r31, r0 -> c1
	;;
#0:	if !c1 btest	r0.23, 0 -> c1
	;;
#0:	if !c1 br @	.BB9_275
	;;
.BB9_138:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldga	._.str391 -> r0
#1:	       ldiu	128 -> r1
	;;
#0:	       stm.a	r0, r12, 0
#1:	       add	r15, r1 -> r1
	;;
#0:	       stm.a	r0.29, r12, 1
	;;
#0:	       ldm.f	r15, 192
	;;
#0:	       add	r31, r0.29 -> r0
	;;
#0:	       stm.a	r0, r1, 16
	;;
#1:	       ldm.f	r1.23, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#1:	       stm.a	r0, r1.23, 0
#0:	       cmp lt	r0, 8 -> c1
	;;
#0:	if  c1 br @	.BB9_144
	;;
.BB9_139:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       or	r0.26, 0 -> r0
#2:	       callg	___sprint_r
#1:	       or	r1.27, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz eq @	r0, .BB9_145
#1:	       or	r1.28, 0 -> r12
	;;
#0:	       br @	.BB9_356
	;;
.BB9_140:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldm.f	r15, 200
	;;
#2:	       cmp gt	r31, r2.26 -> c1
#0:	       or	r31, 0 -> r11
	;;
#2:	if  c1 or	r2.26, 0 -> r11
	;;
#0:	       cmp lt	r11, 1 -> c1
	;;
#0:	if  c1 br @	.BB9_177
	;;
.BB9_141:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldm.s	r15, 60
#1:	       ldiu	128 -> r1
	;;
#0:	       add	r15, r1 -> r1
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       stm.a	r0, r12, 0
	;;
#0:	       stm.a	r11, r12, 1
	;;
#0:	       ldm.f	r15, 192
	;;
#0:	       add	r31, r11 -> r3
	;;
#0:	       stm.a	r3, r1, 16
	;;
#1:	       ldm.f	r1.23, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#1:	       stm.a	r0, r1.23, 0
#0:	       cmp lt	r0, 8 -> c1
	;;
#0:	if  c1 br @	.BB9_176
	;;
.BB9_142:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       or	r0.26, 0 -> r0
#1:	       callg	___sprint_r
#2:	       ldiu	160 -> r12
	;;
#0:	       add	r15, r12 -> r12
	;;
#0:	       add	r12, 24 -> r1
	;;
	       nop	0
	;;
#0:	       cmp ne	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB9_356
	;;
.BB9_143:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       s2add	r15, 24 -> r0
#1:	       br	.BB9_177
	;;
#0:	       add	r0, 24 -> r12
	;;
	       nop	0
	;;
.BB9_144:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       add	r12, 8 -> r12
	;;
.BB9_145:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldm.f	r15, 200
	;;
#0:	       sub	r31, 1 -> r11
	;;
#0:	       cmp lt	r11, 1 -> c1
	;;
#0:	if !c1 br @	.BB9_148
#1:	if  c1 br @	.BB9_275
	;;
.BB9_146:                               ;   in Loop: Header=BB9_148 Depth=2
#0:	       add	r12, 8 -> r12
	;;
.BB9_147:                               ;   in Loop: Header=BB9_148 Depth=2
#0:	       sub	r11, 16 -> r11
	;;
.BB9_148:                               ; %.preheader34
                                        ;   Parent Loop BB9_20 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#3:	       cmp lt	r11, r3.26 -> c1
#0:	       ldga	__vfprintf_r.zeroes -> r0
	;;
#0:	if  c1 br @	.BB9_165
#1:	       stm.a	r0, r12, 0
	;;
.BB9_149:                               ;   in Loop: Header=BB9_148 Depth=2
#1:	       stm.a	r1.29, r12, 1
#0:	       ldiu	128 -> r1
	;;
#0:	       ldm.f	r15, 192
#1:	       add	r15, r1 -> r1
	;;
#0:	       add	r31, 16 -> r0
	;;
#0:	       stm.a	r0, r1, 16
	;;
#1:	       ldm.f	r1.23, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#1:	       stm.a	r0, r1.23, 0
#0:	       cmp lt	r0, 8 -> c1
	;;
#0:	if  c1 br @	.BB9_146
	;;
.BB9_150:                               ;   in Loop: Header=BB9_148 Depth=2
#0:	       or	r0.26, 0 -> r0
#1:	       callg	___sprint_r
#2:	       ldiu	160 -> r12
	;;
#0:	       add	r15, r12 -> r12
	;;
#0:	       add	r12, 24 -> r1
	;;
	       nop	0
	;;
#0:	       cmp ne	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB9_356
	;;
.BB9_151:                               ;   in Loop: Header=BB9_148 Depth=2
#0:	       s2add	r15, 24 -> r0
#1:	       br	.BB9_147
	;;
#0:	       add	r0, 24 -> r12
	;;
	       nop	0
	;;
.BB9_152:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       add	r12, 8 -> r12
	;;
.BB9_153:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldm.f	r15, 212
	;;
#0:	       brz ne @	r31, .BB9_156
	;;
.BB9_154:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldm.f	r15, 200
	;;
#0:	       brz ne @	r31, .BB9_156
	;;
.BB9_155:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       btest	r0.23, 0 -> c1
	;;
#0:	if !c1 br @	.BB9_275
	;;
.BB9_156:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldga	._.str391 -> r0
#1:	       ldiu	128 -> r1
	;;
#0:	       stm.a	r0, r12, 0
#1:	       add	r15, r1 -> r1
	;;
#0:	       stm.a	r0.29, r12, 1
	;;
#0:	       ldm.f	r15, 192
	;;
#0:	       add	r31, r0.29 -> r0
	;;
#0:	       stm.a	r0, r1, 16
	;;
#1:	       ldm.f	r1.23, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#1:	       stm.a	r0, r1.23, 0
#0:	       cmp lt	r0, 8 -> c1
	;;
#0:	if  c1 br @	.BB9_167
	;;
.BB9_157:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       or	r0.26, 0 -> r0
#1:	       callg	___sprint_r
#2:	       ldiu	160 -> r11
	;;
#0:	       add	r15, r11 -> r11
	;;
#0:	       add	r11, 24 -> r1
	;;
	       nop	0
	;;
#0:	       cmp ne	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB9_356
	;;
.BB9_158:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       s2add	r15, 24 -> r1
#1:	       br	.BB9_168
	;;
#0:	       add	r1, 24 -> r0
	;;
	       nop	0
	;;
.BB9_159:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       stm.a	r11, r1, 1
#1:	       ldiu	128 -> r2
	;;
#0:	       ldm.f	r15, 192
#1:	       add	r15, r2 -> r2
	;;
#0:	       add	r31, r11 -> r0
	;;
#0:	       stm.a	r0, r2, 16
	;;
#1:	       ldm.f	r1.23, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#1:	       stm.a	r0, r1.23, 0
#0:	       cmp lt	r0, 8 -> c1
	;;
#0:	if !c1 br @	.BB9_161
	;;
.BB9_160:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       add	r1, 8 -> r1
#1:	       br @	.BB9_163
	;;
.BB9_161:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       or	r0.26, 0 -> r0
#1:	       callg	___sprint_r
#2:	       ldiu	160 -> r11
	;;
#0:	       add	r15, r11 -> r11
	;;
#0:	       add	r11, 24 -> r1
	;;
	       nop	0
	;;
#0:	       cmp ne	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB9_356
	;;
.BB9_162:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       s2add	r15, 24 -> r0
	;;
#0:	       add	r0, 24 -> r1
	;;
.BB9_163:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldm.s	r15, 44
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       stm.a	r0, r1, 0
	;;
#0:	       ldm.s	r15, 52
	;;
#0:	       or	r31, 0 -> r2
	;;
#0:	       stm.a	r2, r1, 1
#1:	       ldiu	128 -> r2
	;;
#0:	       ldm.f	r15, 192
#1:	       add	r15, r2 -> r2
	;;
#2:	       stm.a	r31, r2.30, 0
	;;
#0:	       ldm.s	r15, 52
	;;
#0:	       or	r31, 0 -> r3
#1:	       ldmg.d	___mem_emergency
	;;
#0:	       add	r31, r3 -> r0
	;;
#0:	       stm.a	r0, r2, 16
	;;
#1:	       ldm.f	r1.23, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#1:	       stm.a	r0, r1.23, 0
#0:	       cmp lt	r0, 8 -> c1
	;;
#0:	if !c1 br @	.BB9_273
	;;
.BB9_164:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       add	r1, 8 -> r12
#1:	       br @	.BB9_275
	;;
.BB9_165:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       stm.a	r11, r12, 1
#1:	       ldiu	128 -> r1
	;;
#0:	       ldm.f	r15, 192
#1:	       add	r15, r1 -> r1
	;;
#0:	       add	r31, r11 -> r0
	;;
#0:	       stm.a	r0, r1, 16
	;;
#1:	       ldm.f	r1.23, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#1:	       stm.a	r0, r1.23, 0
#0:	       cmp lt	r0, 8 -> c1
	;;
#0:	if !c1 br @	.BB9_273
	;;
.BB9_166:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       add	r12, 8 -> r12
#1:	       br @	.BB9_275
	;;
.BB9_167:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       add	r12, 8 -> r0
	;;
.BB9_168:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldm.f	r15, 212
	;;
#0:	       or	r31, 0 -> r2
	;;
#0:	       cmp gt	r2, -1 -> c1
	;;
#0:	if  c1 br @	.BB9_226
	;;
.BB9_169:                               ; %.preheader
                                        ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldi	0 -> r1
#1:	       br	.BB9_172
	;;
#0:	       sub	r1, r2 -> r11
	;;
	       nop	0
	;;
.BB9_170:                               ;   in Loop: Header=BB9_172 Depth=2
#0:	       add	r0, 8 -> r0
	;;
.BB9_171:                               ;   in Loop: Header=BB9_172 Depth=2
#0:	       sub	r11, 16 -> r11
	;;
.BB9_172:                               ;   Parent Loop BB9_20 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#3:	       cmp lt	r11, r3.26 -> c1
#0:	       ldga	__vfprintf_r.zeroes -> r1
	;;
#0:	if  c1 br @	.BB9_187
#1:	       stm.a	r1, r0, 0
	;;
.BB9_173:                               ;   in Loop: Header=BB9_172 Depth=2
#1:	       stm.a	r1.29, r0, 1
#0:	       ldiu	128 -> r2
	;;
#0:	       ldm.f	r15, 192
#1:	       add	r15, r2 -> r2
	;;
#0:	       add	r31, 16 -> r1
	;;
#0:	       stm.a	r1, r2, 16
	;;
#1:	       ldm.f	r1.23, 0
	;;
#0:	       add	r31, 1 -> r1
	;;
#1:	       stm.a	r1, r1.23, 0
#0:	       cmp lt	r1, 8 -> c1
	;;
#0:	if  c1 br @	.BB9_170
	;;
.BB9_174:                               ;   in Loop: Header=BB9_172 Depth=2
#0:	       or	r0.26, 0 -> r0
#1:	       callg	___sprint_r
#2:	       ldiu	160 -> r12
	;;
#0:	       add	r15, r12 -> r12
	;;
#0:	       add	r12, 24 -> r1
	;;
	       nop	0
	;;
#0:	       cmp ne	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB9_356
	;;
.BB9_175:                               ;   in Loop: Header=BB9_172 Depth=2
#0:	       s2add	r15, 24 -> r1
#1:	       br	.BB9_171
	;;
#0:	       add	r1, 24 -> r0
	;;
	       nop	0
	;;
.BB9_176:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       add	r12, 8 -> r12
	;;
.BB9_177:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       cmp gt	r11, 0 -> c1
#1:	       ldi	0 -> r0
	;;
#0:	if  c1 or	r11, 0 -> r0
	;;
#2:	       sub	r2.26, r0 -> r11
	;;
#0:	       cmp lt	r11, 1 -> c1
	;;
#0:	if !c1 br @	.BB9_180
#1:	if  c1 br @	.BB9_191
	;;
.BB9_178:                               ;   in Loop: Header=BB9_180 Depth=2
#0:	       add	r12, 8 -> r12
	;;
.BB9_179:                               ;   in Loop: Header=BB9_180 Depth=2
#0:	       sub	r11, 16 -> r11
	;;
.BB9_180:                               ; %.preheader28
                                        ;   Parent Loop BB9_20 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#3:	       cmp lt	r11, r3.26 -> c1
#0:	       ldga	__vfprintf_r.zeroes -> r0
	;;
#0:	if  c1 br @	.BB9_184
#1:	       stm.a	r0, r12, 0
	;;
.BB9_181:                               ;   in Loop: Header=BB9_180 Depth=2
#1:	       stm.a	r1.29, r12, 1
#0:	       ldiu	128 -> r1
	;;
#0:	       ldm.f	r15, 192
#1:	       add	r15, r1 -> r1
	;;
#0:	       add	r31, 16 -> r0
	;;
#0:	       stm.a	r0, r1, 16
	;;
#1:	       ldm.f	r1.23, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#1:	       stm.a	r0, r1.23, 0
#0:	       cmp lt	r0, 8 -> c1
	;;
#0:	if  c1 br @	.BB9_178
	;;
.BB9_182:                               ;   in Loop: Header=BB9_180 Depth=2
#0:	       or	r0.26, 0 -> r0
#1:	       callg	___sprint_r
#2:	       ldiu	160 -> r12
	;;
#0:	       add	r15, r12 -> r12
	;;
#0:	       add	r12, 24 -> r1
	;;
	       nop	0
	;;
#0:	       cmp ne	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB9_356
	;;
.BB9_183:                               ;   in Loop: Header=BB9_180 Depth=2
#0:	       s2add	r15, 24 -> r0
#1:	       br	.BB9_179
	;;
#0:	       add	r0, 24 -> r12
	;;
	       nop	0
	;;
.BB9_184:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       stm.a	r11, r12, 1
#1:	       ldiu	128 -> r1
	;;
#0:	       ldm.f	r15, 192
#1:	       add	r15, r1 -> r1
	;;
#0:	       add	r31, r11 -> r0
	;;
#0:	       stm.a	r0, r1, 16
	;;
#1:	       ldm.f	r1.23, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#1:	       stm.a	r0, r1.23, 0
#0:	       cmp gt	r0, 7 -> c1
	;;
#0:	if !c1 br @	.BB9_190
	;;
.BB9_185:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       or	r0.26, 0 -> r0
#1:	       callg	___sprint_r
#2:	       ldiu	160 -> r11
	;;
#0:	       add	r15, r11 -> r11
	;;
#0:	       add	r11, 24 -> r1
	;;
	       nop	0
	;;
#0:	       cmp ne	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB9_356
	;;
.BB9_186:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       s2add	r15, 24 -> r0
#1:	       br	.BB9_191
	;;
#0:	       add	r0, 24 -> r12
	;;
	       nop	0
	;;
.BB9_187:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       stm.a	r11, r0, 1
#1:	       ldiu	128 -> r2
	;;
#0:	       ldm.f	r15, 192
#1:	       add	r15, r2 -> r2
	;;
#0:	       add	r31, r11 -> r1
	;;
#0:	       stm.a	r1, r2, 16
	;;
#1:	       ldm.f	r1.23, 0
	;;
#0:	       add	r31, 1 -> r1
	;;
#1:	       stm.a	r1, r1.23, 0
#0:	       cmp lt	r1, 8 -> c1
	;;
#0:	if  c1 br @	.BB9_225
	;;
.BB9_188:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       or	r0.26, 0 -> r0
#1:	       callg	___sprint_r
#2:	       ldiu	160 -> r11
	;;
#0:	       add	r15, r11 -> r11
	;;
#0:	       add	r11, 24 -> r1
	;;
	       nop	0
	;;
#0:	       cmp ne	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB9_356
	;;
.BB9_189:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       s2add	r15, 24 -> r1
#1:	       br	.BB9_226
	;;
#0:	       add	r1, 24 -> r0
	;;
	       nop	0
	;;
.BB9_190:                               ; %._crit_edge636
                                        ;   in Loop: Header=BB9_20 Depth=1
#0:	       add	r12, 8 -> r12
	;;
.BB9_191:                               ; %._crit_edge635
                                        ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldm.s	r15, 60
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldm.f	r15, 200
	;;
#2:	       add	r0, r2.26 -> r2.23
	;;
#0:	       or	r31, 0 -> r3
#1:	       ldm.f	r15, 212
	;;
#0:	       cmp lt	r31, r3 -> c1
	;;
#0:	if !c1 btest	r0.23, 0 -> c1
	;;
#0:	if !c1 br @	.BB9_196
	;;
.BB9_192:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldga	._.str391 -> r0
#1:	       ldiu	128 -> r1
	;;
#0:	       stm.a	r0, r12, 0
#1:	       add	r15, r1 -> r1
	;;
#0:	       stm.a	r0.29, r12, 1
	;;
#0:	       ldm.f	r15, 192
	;;
#0:	       add	r31, r0.29 -> r0
	;;
#0:	       stm.a	r0, r1, 16
	;;
#1:	       ldm.f	r1.23, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#1:	       stm.a	r0, r1.23, 0
#0:	       cmp gt	r0, 7 -> c1
	;;
#0:	if !c1 br @	.BB9_195
	;;
.BB9_193:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       or	r0.26, 0 -> r0
#1:	       callg	___sprint_r
#2:	       ldiu	160 -> r11
	;;
#0:	       add	r15, r11 -> r11
	;;
#0:	       add	r11, 24 -> r1
	;;
	       nop	0
	;;
#0:	       cmp ne	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB9_356
	;;
.BB9_194:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       s2add	r15, 24 -> r0
#1:	       br	.BB9_196
	;;
#0:	       add	r0, 24 -> r12
	;;
	       nop	0
	;;
.BB9_195:                               ; %._crit_edge633
                                        ;   in Loop: Header=BB9_20 Depth=1
#0:	       add	r12, 8 -> r12
	;;
.BB9_196:                               ; %._crit_edge634
                                        ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldm.f	r15, 212
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldm.f	r15, 200
	;;
#0:	       sub	r31, r0 -> r11
#2:	       sub	r31, r2.26 -> r0
	;;
#0:	       cmp gt	r0, r11 -> c1
	;;
#2:	if !c1 sub	r31, r2.26 -> r11 ; aaaf
	;;
#0:	       cmp lt	r11, 1 -> c1
	;;
#0:	if  c1 br @	.BB9_229
	;;
.BB9_197:                               ;   in Loop: Header=BB9_20 Depth=1
#2:	       stm.a	r2.23, r12, 0
#0:	       ldiu	128 -> r1
	;;
#0:	       stm.a	r11, r12, 1
#1:	       add	r15, r1 -> r1
	;;
#0:	       ldm.f	r15, 192
	;;
#0:	       add	r31, r11 -> r0
	;;
#0:	       stm.a	r0, r1, 16
	;;
#1:	       ldm.f	r1.23, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#1:	       stm.a	r0, r1.23, 0
#0:	       cmp gt	r0, 7 -> c1
	;;
#0:	if !c1 br @	.BB9_228
	;;
.BB9_198:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       or	r0.26, 0 -> r0
#1:	       callg	___sprint_r
#2:	       ldiu	160 -> r12
	;;
#0:	       add	r15, r12 -> r12
	;;
#0:	       add	r12, 24 -> r1
	;;
	       nop	0
	;;
#0:	       cmp ne	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB9_356
	;;
.BB9_199:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       s2add	r15, 24 -> r0
#1:	       br	.BB9_229
	;;
#0:	       add	r0, 24 -> r12
	;;
	       nop	0
	;;
.BB9_200:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       or	r0.23, 16 -> r0.23
#1:	       ldi	68 -> r11
	;;
.BB9_201:                               ; %.loopexit93
                                        ;   in Loop: Header=BB9_20 Depth=1
#0:	       btest	r0.23, 4 -> !c1
	;;
#0:	if !c1 br @	.BB9_230
	;;
.BB9_202:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       btest	r0.23, 6 -> !c1
#3:	       ldm.f	r3.23, 0
	;;
#0:	if  c1 br @	.BB9_231
#2:	       or	r31, 0 -> r2.24
	;;
.BB9_203:                               ;   in Loop: Header=BB9_20 Depth=1
#2:	       bbh	sext16 r2.24 -> r2.24
#0:	       br @	.BB9_231
	;;
.BB9_204:                               ;   in Loop: Header=BB9_20 Depth=1
#3:	       ldm.f	r3.23, 0
#0:	       s2add	r15, 16 -> r4
#1:	       ldiu	0 -> r2
#2:	       ldiu	0 -> r5
	;;
#0:	       add	r4, 0 -> r3
#1:	       ldih	1024 -> r2
	;;
#0:	       stx	r31 -> $f12
	;;
#3:	       ldm.f	r3.23, 4
	;;
#3:	       add	r3.23, 8 -> r3.23
	;;
#0:	       stx	r31 -> $f0
	;;
#0:	       fop	fmov	f0 -> f13
	;;
#0:	       ldx	$f12 -> r0
	;;
#0:	       stm.a	r0, r15, 16
#1:	       ldx	$f13 -> r1
#2:	       or	r3, 4 -> r0
	;;
#0:	       stm.a	r1, r0, 0
	;;
#0:	       ldm.f	r0, 0
	;;
#0:	       or	r31, 0 -> r1
#1:	       ldm.f	r15, 64
	;;
#0:	       cmp eq	r1, r2 -> c2
	;;
#0:	       or	r31, 0 -> r3
	;;
#0:	       cmp eq	r3, 0 -> c1
#1:	       or	r1, r3 -> r0
	;;
#0:	       comb	and c2, c1 -> c2
#1:	       cmp eq	r0, 0 -> c3
	;;
#0:	       comb	or c3, c2 -> c1
	;;
#0:	if  c1 br @	.BB9_233
	;;
.BB9_205:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldga	1048576 -> r0
#1:	       ldiu	0 -> r4
#2:	       ldim	512 -> r5
#3:	       ldga	1048576 -> r2
	;;
#0:	       ldih	1023 -> r0
#1:	       ldih	1023 -> r4
#2:	       cmpu lt	r1, r5 -> c3
	;;
#0:	       add	r1, r0 -> r0
	;;
#0:	       cmpu lt	r0, r4 -> c2
#1:	       ldiu	0 -> r0
	;;
#0:	       ldim	1536 -> r0
	;;
#0:	       add	r1, r0 -> r0
	;;
#0:	       cmpu lt	r0, r4 -> c1
	;;
#0:	       comb	or c1, c2 -> c2
	;;
#0:	       comb	or c2, c3 -> c1
	;;
#0:	if  c1 br @	.BB9_233
	;;
.BB9_206:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldih	1024 -> r2
#1:	       cmp lt	r1, 0 -> c1
	;;
#0:	       cmpu lt	r1, r2 -> c2
	;;
#0:	       comb	and c1, c2 -> c1
	;;
#0:	if  c1 br @	.BB9_233
	;;
.BB9_207:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldiu	0 -> r0
#1:	       ldga	1048576 -> r2
#2:	       cmp eq	r3, 0 -> c3
	;;
#0:	       ldim	1536 -> r0
#1:	       ldih	1023 -> r2
	;;
#0:	       cmp eq	r1, r0 -> c2
#1:	       cmp eq	r1, r2 -> c1
	;;
#0:	       comb	or c1, c2 -> c2
	;;
#0:	       comb	and c2, c3 -> c1
	;;
#0:	if !c1 br @	.BB9_232
	;;
.BB9_208:                               ; %__fpclassifyd.exit
                                        ;   in Loop: Header=BB9_20 Depth=1
#0:	       fop	dzero -> d0
#1:	       ldi	72 -> r3
	;;
#0:	       fop	dcmp	d6, d0 -> f0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r0
	;;
#0:	       btest	r0, 13 -> c1
	;;
#0:	       br	.BB9_262
#1:	if !c1 ldiu	192 -> r1
#2:	if !c1 ldi	45 -> r0
	;;
#0:	if !c1 add	r15, r1 -> r1
	;;
#0:	if !c1 stmb.a	r0, r1, 28
#1:	       cmp lt	r11, r3 -> c1
#2:	       ldga	._.str43 -> r1
#3:	       ldga	._.str144 -> r0
	;;
.BB9_209:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       or	r0.23, 16 -> r0.23
	;;
#0:	       ldi	79 -> r0.24
	;;
.BB9_210:                               ; %.loopexit94
                                        ;   in Loop: Header=BB9_20 Depth=1
#0:	       btest	r0.23, 4 -> !c1
	;;
#0:	if !c1 br @	.BB9_239
	;;
.BB9_211:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       btest	r0.23, 6 -> !c1
#3:	       ldm.f	r3.23, 0
	;;
#0:	if  c1 br @	.BB9_240
#2:	       or	r31, 0 -> r2.24
	;;
.BB9_212:                               ;   in Loop: Header=BB9_20 Depth=1
#2:	       bbh	zext16 r2.24 -> r2.24
#0:	       br @	.BB9_240
	;;
.BB9_213:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       or	r0.23, 16 -> r0.23
#1:	       ldi	85 -> r5
	;;
.BB9_214:                               ; %.loopexit95
                                        ;   in Loop: Header=BB9_20 Depth=1
#0:	       btest	r0.23, 4 -> !c1
	;;
#0:	if !c1 br @	.BB9_241
	;;
.BB9_215:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       btest	r0.23, 6 -> !c1
#3:	       ldm.f	r3.23, 0
	;;
#0:	if  c1 br @	.BB9_242
#2:	       or	r31, 0 -> r2.24
	;;
.BB9_216:                               ;   in Loop: Header=BB9_20 Depth=1
#2:	       bbh	zext16 r2.24 -> r2.24
#0:	       br @	.BB9_242
	;;
.BB9_217:                               ;   in Loop: Header=BB9_20 Depth=1
#3:	       ldm.f	r3.23, 0
#2:	       ldi	0 -> r2.26
#0:	       ldi	99 -> r0.24
#1:	       s2add	r15, 16 -> r1
	;;
#2:	       ldi	1 -> r2.25
#0:	       s2add	r15, 16 -> r2
	;;
#3:	       bbh	mzext8 r3.23 -> r0
#2:	       or	r2.26, 0 -> r2.24
#0:	       add	r2, 16 -> r3
	;;
#3:	       add	r3.23, 4 -> r3.23
#0:	       stmb.a	r0, r1, 16
#1:	       ldiu	192 -> r0
	;;
#0:	       br	.BB9_65
#1:	       add	r15, r0 -> r1
	;;
#0:	       stmb.a	0, r1, 28
	;;
#0:	       stm.s	r3, r15, 15
	;;
.BB9_218:                               ;   in Loop: Header=BB9_20 Depth=1
#3:	       ldm.f	r3.23, 0
#0:	       or	r0.23, 2 -> r0.23
#1:	       ldi	2 -> r2
#2:	       ldi	48 -> r0
	;;
#3:	       add	r3.23, 4 -> r3.23
#0:	       ldi	120 -> r0.24
#1:	       s2add	r15, 16 -> r1
#2:	       ldga	._.str447 -> r3
	;;
#2:	       or	r31, 0 -> r2.24
#0:	       stmb.a	r0, r1, 12
	;;
#0:	       br	.BB9_250
#2:	       or	r2.29, 1 -> r0
	;;
#0:	       stmb.a	r0.24, r0, 0
	;;
#0:	       stm.s	r3, r15, 14
	;;
.BB9_219:                               ;   in Loop: Header=BB9_20 Depth=1
#3:	       add	r3.23, 4 -> r5
#0:	       ldiu	192 -> r1
	;;
#0:	       add	r15, r1 -> r1
	;;
#0:	       stmb.a	0, r1, 28
	;;
#3:	       ldm.f	r3.23, 0
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       stm.s	r0, r15, 15
	;;
#0:	       ldm.s	r15, 60
	;;
#0:	       or	r31, 0 -> r3
	;;
#0:	       cmp ne	r3, 0 -> c3
	;;
#0:	if  c3 br @	.BB9_243
	;;
.BB9_220:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       br	.BB9_317
	;;
#2:	       cmpu gt	r2.23, 6 -> c1
#0:	       ldi	115 -> r0.24
#1:	       ldi	6 -> r0
#3:	       ldga	._.str548 -> r3
	;;
#2:	if  c1 or	r0, 0 -> r2.23
#0:	       stm.s	r3, r15, 15
	;;
.BB9_221:                               ; %.loopexit96.loopexit12
                                        ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldga	._.str447 -> r3
#1:	       ldi	120 -> r1
	;;
.BB9_222:                               ; %.loopexit96
                                        ;   in Loop: Header=BB9_20 Depth=1
#0:	       btest	r0.23, 4 -> !c1
	;;
#0:	if !c1 br @	.BB9_248
	;;
.BB9_223:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       btest	r0.23, 6 -> !c1
#3:	       ldm.f	r3.23, 0
	;;
#0:	if  c1 br @	.BB9_249
#2:	       or	r31, 0 -> r2.24
	;;
.BB9_224:                               ;   in Loop: Header=BB9_20 Depth=1
#2:	       bbh	zext16 r2.24 -> r2.24
#0:	       br @	.BB9_249
	;;
.BB9_225:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       add	r0, 8 -> r0
	;;
.BB9_226:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldm.s	r15, 60
#1:	       ldiu	128 -> r2
	;;
#0:	       add	r15, r2 -> r2
	;;
#0:	       or	r31, 0 -> r1
	;;
#0:	       stm.a	r1, r0, 0
	;;
#0:	       ldm.f	r15, 200
	;;
#0:	       stm.a	r31, r0, 1
	;;
#0:	       ldm.f	r15, 200
	;;
#0:	       or	r31, 0 -> r3
#1:	       ldm.f	r15, 192
	;;
#0:	       add	r31, r3 -> r1
	;;
#0:	       stm.a	r1, r2, 16
	;;
#1:	       ldm.f	r1.23, 0
	;;
#0:	       add	r31, 1 -> r1
	;;
#1:	       stm.a	r1, r1.23, 0
#0:	       cmp lt	r1, 8 -> c1
	;;
#0:	if !c1 br @	.BB9_273
	;;
.BB9_227:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       add	r0, 8 -> r12
#1:	       br @	.BB9_275
	;;
.BB9_228:                               ; %._crit_edge631
                                        ;   in Loop: Header=BB9_20 Depth=1
#0:	       add	r12, 8 -> r12
	;;
.BB9_229:                               ; %._crit_edge632
                                        ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldm.f	r15, 212
#1:	       ldi	0 -> r0
#2:	       cmp gt	r11, 0 -> c1
#3:	       ldi	0 -> r1
	;;
#0:	       sub	r0, r11 -> r0
	;;
#0:	       or	r31, 0 -> r3
#1:	       ldm.f	r15, 200
#2:	if  c1 or	r0, 0 -> r1
	;;
#0:	       sub	r31, r3 -> r0
	;;
#0:	       add	r0, r1 -> r11
	;;
#0:	       cmp lt	r11, 1 -> c1
	;;
#0:	if !c1 br @	.BB9_257
#1:	if  c1 br @	.BB9_275
	;;
.BB9_230:                               ;   in Loop: Header=BB9_20 Depth=1
#3:	       ldm.f	r3.23, 0
	;;
#2:	       or	r31, 0 -> r2.24
	;;
.BB9_231:                               ;   in Loop: Header=BB9_20 Depth=1
#2:	       cmp gt	r2.24, -1 -> c1
#3:	       add	r3.23, 4 -> r3.23
#0:	       or	r11, 0 -> r0.24
#1:	       ldi	1 -> r2
	;;
#0:	if !c1 ldiu	192 -> r1
#1:	if !c1 ldi	45 -> r0
#2:	if !c1 ldi	1 -> r2
	;;
#0:	       br	.BB9_251
#1:	if !c1 add	r15, r1 -> r1
	;;
#0:	if !c1 stmb.a	r0, r1, 28
#1:	if !c1 ldi	0 -> r0
	;;
#2:	if !c1 sub	r0, r2.24 -> r2.24
	;;
.BB9_232:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	if !c1 br @	.BB9_261
	;;
.BB9_233:                               ; %.thread
                                        ;   in Loop: Header=BB9_20 Depth=1
#2:	       cmp eq	r2.23, -1 -> c1
	;;
#0:	if  c1 br @	.BB9_237
#2:	       ldi	6 -> r2.24
	;;
.BB9_234:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldi	32 -> r0
#1:	       ldi	103 -> r3
	;;
#0:	       or	r11, r0 -> r1
	;;
#0:	       cmp eq	r1, r3 -> c1
	;;
#0:	if !c1 br @	.BB9_236
	;;
.BB9_235:                               ;   in Loop: Header=BB9_20 Depth=1
#2:	       cmp eq	r2.23, 0 -> c1
#0:	       ldi	1 -> r0
	;;
#2:	if  c1 or	r0, 0 -> r2.23
	;;
.BB9_236:                               ;   in Loop: Header=BB9_20 Depth=1
#2:	       or	r2.23, 0 -> r2.24
	;;
.BB9_237:                               ;   in Loop: Header=BB9_20 Depth=1
#2:	       or	r2.24, 0 -> r2
#0:	       ldiu	192 -> r4
#1:	       ldiu	192 -> r8
#3:	       ldiu	192 -> r9
	;;
#0:	       add	r15, r4 -> r4
#1:	       ldx	$f13 -> r1
	;;
#1:	       add	r4, 24 -> r1.26
#0:	       add	r15, r8 -> r4
	;;
#1:	       stm.a	r1.26, r15, 0
#0:	       add	r4, 20 -> r0
#2:	       add	r15, r9 -> r4
	;;
#0:	       callg	_cvt54
	;;
#0:	       stm.a	r0, r15, 1
#1:	       ldi	256 -> r0
#2:	       add	r4, 8 -> r3
	;;
#0:	       or	r0.23, r0 -> r0.25
#1:	       stm.a	r11, r15, 2
#2:	       ldx	$f12 -> r0
	;;
#1:	       stm.a	r3, r15, 3
#0:	       or	r0.25, 0 -> r3
	;;
#0:	       ldi	103 -> r0.24
#1:	       ldi	32 -> r3
#2:	       stm.s	r0, r15, 15
	;;
#0:	       or	r11, r3 -> r0
	;;
#0:	       cmp eq	r0, r0.24 -> c1
	;;
#0:	if !c1 br @	.BB9_263
	;;
.BB9_238:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldm.f	r15, 212
#1:	       sub	r11, 2 -> r0
	;;
#0:	       br	.BB9_264
#2:	       cmp gt	r31, r2.24 -> c2
#1:	       cmp lt	r31, -3 -> c1
	;;
#0:	       comb	or c1, c2 -> c1
	;;
#0:	if  c1 or	r0, 0 -> r0.24
	;;
.BB9_239:                               ;   in Loop: Header=BB9_20 Depth=1
#3:	       ldm.f	r3.23, 0
	;;
#2:	       or	r31, 0 -> r2.24
	;;
.BB9_240:                               ;   in Loop: Header=BB9_20 Depth=1
#3:	       add	r3.23, 4 -> r3.23
#0:	       br @	.BB9_250
#1:	       ldi	0 -> r2
	;;
.BB9_241:                               ;   in Loop: Header=BB9_20 Depth=1
#3:	       ldm.f	r3.23, 0
	;;
#2:	       or	r31, 0 -> r2.24
	;;
.BB9_242:                               ;   in Loop: Header=BB9_20 Depth=1
#3:	       add	r3.23, 4 -> r3.23
#1:	       br @	.BB9_250
#0:	       or	r5, 0 -> r0.24
#2:	       ldi	1 -> r2
	;;
.BB9_243:                               ;   in Loop: Header=BB9_20 Depth=1
#2:	       cmp lt	r2.23, 0 -> c3
#0:	       ldm.s	r15, 60
#1:	       ldi	0 -> r2
	;;
#0:	if  c3 br	.BB9_267
#1:	       or	r31, 0 -> r0
	;;
#0:	       or	r0, 0 -> r1
	;;
	       nop	0
	;;
.BB9_244:                               ; %.preheader54
                                        ;   Parent Loop BB9_20 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.s	r15, 60
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       add	r0, r2 -> r4
	;;
#0:	       and	r4, 3 -> r0
	;;
#0:	       cmp eq	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB9_269
	;;
.BB9_245:                               ;   in Loop: Header=BB9_244 Depth=2
#2:	       cmp eq	r2.23, r2 -> c1
	;;
#0:	if  c1 br @	.BB9_334
	;;
.BB9_246:                               ;   in Loop: Header=BB9_244 Depth=2
#0:	       ldm.f	r4, 0
#1:	       add	r2, 1 -> r2
	;;
#0:	       bbh	mzext8 r4 -> r0
	;;
#0:	       brz ne @	r0, .BB9_244
	;;
.BB9_247:                               ; %memchr.exit.loopexit10
                                        ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldm.s	r15, 60
	;;
#0:	       br	.BB9_315
#1:	       or	r31, 0 -> r0
	;;
#0:	       add	r0, r2 -> r0
	;;
#0:	       sub	r0, 1 -> r2
	;;
.BB9_248:                               ;   in Loop: Header=BB9_20 Depth=1
#3:	       ldm.f	r3.23, 0
	;;
#2:	       or	r31, 0 -> r2.24
	;;
.BB9_249:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       btest	r0.23, 0 -> c1
#3:	       add	r3.23, 4 -> r3.23
#1:	       ldi	2 -> r2
	;;
#0:	       or	r1, 0 -> r0.24
#1:	       comb	and !c1, !c1 -> c2
#2:	       cmp eq	r2.24, 0 -> c1
	;;
#0:	       comb	or c2, c1 -> c1
	;;
#0:	if !c1 or	r0.23, 2 -> r0.23
#1:	if !c1 ldi	48 -> r0
#2:	if !c1 s2add	r15, 16 -> r4
#3:	if !c1 ldi	2 -> r2
	;;
#0:	if !c1 stmb.a	r0, r4, 12
#2:	if !c1 or	r2.29, 1 -> r0
	;;
#0:	if !c1 stmb.a	r1, r0, 0
	;;
#0:	       stm.s	r3, r15, 14
	;;
.BB9_250:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldiu	192 -> r0
	;;
#0:	       add	r15, r0 -> r0
	;;
#0:	       stmb.a	0, r0, 28
	;;
.BB9_251:                               ;   in Loop: Header=BB9_20 Depth=1
#2:	       cmp gt	r2.23, -1 -> c1
#0:	       ldi	-129 -> r0
	;;
#0:	       and	r0.23, r0 -> r0
	;;
#0:	if  c1 or	r0, 0 -> r0.23
#2:	       or	r2.24, r2.23 -> r0
	;;
#0:	       cmp ne	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB9_286
	;;
.BB9_252:                               ;   in Loop: Header=BB9_20 Depth=1
#2:	       or	r2.28, 0 -> r1
#0:	       bbh	zext8 r2 -> r0
	;;
#0:	       cmp ne	r0, 0 -> c3
#1:	       stm.s	r1, r15, 15
	;;
#0:	if  c3 br @	.BB9_341
	;;
.BB9_253:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       btest	r0.23, 0 -> c1
#2:	       or	r2.28, 0 -> r0
	;;
#0:	if !c1 br @	.BB9_341
#1:	       stm.s	r0, r15, 15
	;;
.BB9_254:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldi	48 -> r0
#1:	       br @	.BB9_290
	;;
.BB9_255:                               ;   in Loop: Header=BB9_257 Depth=2
#0:	       add	r12, 8 -> r12
	;;
.BB9_256:                               ;   in Loop: Header=BB9_257 Depth=2
#0:	       sub	r11, 16 -> r11
	;;
.BB9_257:                               ; %.preheader22
                                        ;   Parent Loop BB9_20 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#3:	       cmp lt	r11, r3.26 -> c1
#0:	       ldga	__vfprintf_r.zeroes -> r0
	;;
#0:	if  c1 br @	.BB9_271
#1:	       stm.a	r0, r12, 0
	;;
.BB9_258:                               ;   in Loop: Header=BB9_257 Depth=2
#1:	       stm.a	r1.29, r12, 1
#0:	       ldiu	128 -> r1
	;;
#0:	       ldm.f	r15, 192
#1:	       add	r15, r1 -> r1
	;;
#0:	       add	r31, 16 -> r0
	;;
#0:	       stm.a	r0, r1, 16
	;;
#1:	       ldm.f	r1.23, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#1:	       stm.a	r0, r1.23, 0
#0:	       cmp lt	r0, 8 -> c1
	;;
#0:	if  c1 br @	.BB9_255
	;;
.BB9_259:                               ;   in Loop: Header=BB9_257 Depth=2
#0:	       or	r0.26, 0 -> r0
#1:	       callg	___sprint_r
#2:	       ldiu	160 -> r12
	;;
#0:	       add	r15, r12 -> r12
	;;
#0:	       add	r12, 24 -> r1
	;;
	       nop	0
	;;
#0:	       cmp ne	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB9_356
	;;
.BB9_260:                               ;   in Loop: Header=BB9_257 Depth=2
#0:	       s2add	r15, 24 -> r0
#1:	       br	.BB9_256
	;;
#0:	       add	r0, 24 -> r12
	;;
	       nop	0
	;;
.BB9_261:                               ; %__fpclassifyd.exit15
                                        ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldi	72 -> r0
#1:	       ldga	._.str245 -> r1
	;;
#0:	       cmp lt	r11, r0 -> c1
#1:	       ldga	._.str346 -> r0
	;;
.BB9_262:                               ;   in Loop: Header=BB9_20 Depth=1
#2:	       ldi	0 -> r2.26
#0:	       stm.s	r0, r15, 15
#1:	       ldi	-129 -> r0
	;;
#0:	       and	r0.23, r0 -> r0.23
#2:	       ldi	3 -> r2.25
#1:	       ldm.s	r15, 60
	;;
#2:	       or	r2.26, 0 -> r2.24
	;;
#0:	       br	.BB9_64
#1:	       or	r31, 0 -> r3
	;;
#0:	if  c1 or	r1, 0 -> r3
	;;
#0:	       stm.s	r3, r15, 15
	;;
.BB9_263:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       or	r11, 0 -> r0.24
	;;
.BB9_264:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldi	101 -> r0
	;;
#0:	       cmp gt	r0.24, r0 -> c1
	;;
#0:	if  c1 br @	.BB9_291
	;;
.BB9_265:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldm.f	r15, 212
#1:	       ldiu	128 -> r3
#2:	       ldiu	192 -> r2
#3:	       ldi	1 -> r1
	;;
#0:	       add	r15, r3 -> r3
#1:	       ldi	0 -> r11
	;;
#0:	       sub	r31, 1 -> r0
	;;
#0:	       stm.a	r0, r3, 21
#1:	       add	r15, r2 -> r3
#2:	       cmp lt	r0, 0 -> c1
#3:	       ldi	43 -> r2
	;;
#0:	       stmb.a	r0.24, r3, 12
#1:	       ldi	45 -> r0
	;;
#3:	       stm.a	r31, r3.30, 0
#0:	if  c1 or	r0, 0 -> r2
	;;
#0:	       ldm.s	r15, 44
	;;
#0:	       or	r31, 0 -> r3
#1:	       ldmg.d	___mem_emergency
	;;
#0:	       or	r3, 1 -> r0
	;;
#2:	       sub	r1, r31 -> r2.23
#0:	       stmb.a	r2, r0, 0
#1:	       ldi	-1 -> r0
	;;
#2:	if !c1 add	r31, r0 -> r2.23 ; aaaf
	;;
#2:	       cmp lt	r2.23, 10 -> c1
	;;
#0:	if !c1 br @	.BB9_296
	;;
.BB9_266:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldm.s	r15, 44
#1:	       ldi	48 -> r2
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       or	r0, 2 -> r1
#2:	       s2add	r2.23, 12 -> r0
	;;
#0:	       stmb.a	r2, r1, 0
	;;
#0:	       ldm.s	r15, 48
	;;
#0:	       or	r31, 0 -> r3
	;;
#0:	       br	.BB9_301
#1:	       stmb.a	r0, r3, 0
	;;
#0:	       ldm.s	r15, 28
	;;
#0:	       or	r31, 0 -> r1
	;;
.BB9_267:                               ; %.preheader50
                                        ;   Parent Loop BB9_20 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       or	r1, 0 -> r2
	;;
#0:	       and	r2, 3 -> r0
	;;
#0:	       cmp eq	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB9_304
	;;
.BB9_268:                               ;   in Loop: Header=BB9_267 Depth=2
#0:	       ldm.f	r2, 0
#1:	       add	r2, 1 -> r1
	;;
#0:	       bbh	mzext8 r2 -> r0
	;;
#0:	       brz ne @	r0, .BB9_267
	;;
#0:	       br @	.BB9_308
	;;
.BB9_269:                               ;   in Loop: Header=BB9_20 Depth=1
#2:	       sub	r2.23, r2 -> r3
	;;
#0:	       cmpu lt	r3, 4 -> c1
	;;
#0:	if  c1 br @	.BB9_312
	;;
.BB9_270:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldm.s	r15, 60
#1:	       br	.BB9_310
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       add	r0, r2 -> r4
	;;
.BB9_271:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       stm.a	r11, r12, 1
#1:	       ldiu	128 -> r1
	;;
#0:	       ldm.f	r15, 192
#1:	       add	r15, r1 -> r1
	;;
#0:	       add	r31, r11 -> r0
	;;
#0:	       stm.a	r0, r1, 16
	;;
#1:	       ldm.f	r1.23, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#1:	       stm.a	r0, r1.23, 0
#0:	       cmp lt	r0, 8 -> c1
	;;
#0:	if !c1 br @	.BB9_273
	;;
.BB9_272:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       add	r12, 8 -> r12
#1:	       br @	.BB9_275
	;;
.BB9_273:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       or	r0.26, 0 -> r0
#1:	       callg	___sprint_r
#2:	       ldiu	160 -> r11
	;;
#0:	       add	r15, r11 -> r11
	;;
#0:	       add	r11, 24 -> r1
	;;
	       nop	0
	;;
#0:	       cmp ne	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB9_356
	;;
.BB9_274:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       s2add	r15, 24 -> r0
	;;
#0:	       add	r0, 24 -> r12
	;;
.BB9_275:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       btest	r0.23, 2 -> !c1
	;;
#0:	if  c1 br @	.BB9_284
	;;
.BB9_276:                               ;   in Loop: Header=BB9_20 Depth=1
#3:	       sub	r3.24, r3.27 -> r11
	;;
#0:	       cmp lt	r11, 1 -> c1
	;;
#0:	if !c1 br @	.BB9_279
#1:	if  c1 br @	.BB9_284
	;;
.BB9_277:                               ;   in Loop: Header=BB9_279 Depth=2
#0:	       add	r12, 8 -> r12
	;;
.BB9_278:                               ;   in Loop: Header=BB9_279 Depth=2
#0:	       sub	r11, 16 -> r11
	;;
.BB9_279:                               ; %.preheader76
                                        ;   Parent Loop BB9_20 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#3:	       cmp lt	r11, r3.26 -> c1
#0:	       ldga	__vfprintf_r.blanks -> r0
	;;
#0:	if  c1 br @	.BB9_282
#1:	       stm.a	r0, r12, 0
	;;
.BB9_280:                               ;   in Loop: Header=BB9_279 Depth=2
#1:	       stm.a	r1.29, r12, 1
#0:	       ldiu	128 -> r1
	;;
#0:	       ldm.f	r15, 192
#1:	       add	r15, r1 -> r1
	;;
#0:	       add	r31, 16 -> r0
	;;
#0:	       stm.a	r0, r1, 16
	;;
#1:	       ldm.f	r1.23, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#1:	       stm.a	r0, r1.23, 0
#0:	       cmp lt	r0, 8 -> c1
	;;
#0:	if  c1 br @	.BB9_277
	;;
.BB9_281:                               ;   in Loop: Header=BB9_279 Depth=2
#0:	       or	r0.26, 0 -> r0
#2:	       callg	___sprint_r
#1:	       or	r1.27, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz eq @	r0, .BB9_278
#1:	       or	r1.28, 0 -> r12
	;;
#0:	       br @	.BB9_356
	;;
.BB9_282:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       stm.a	r11, r12, 1
#1:	       ldiu	128 -> r1
	;;
#0:	       ldm.f	r15, 192
#1:	       add	r15, r1 -> r1
	;;
#0:	       add	r31, r11 -> r0
	;;
#0:	       stm.a	r0, r1, 16
	;;
#1:	       ldm.f	r1.23, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
#1:	       stm.a	r0, r1.23, 0
#0:	       cmp lt	r0, 8 -> c1
	;;
#0:	if  c1 br @	.BB9_284
	;;
.BB9_283:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       or	r0.26, 0 -> r0
#2:	       callg	___sprint_r
#1:	       or	r1.27, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       cmp ne	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB9_356
	;;
.BB9_284:                               ; %._crit_edge639
                                        ;   in Loop: Header=BB9_20 Depth=1
#3:	       cmp gt	r3.24, r3.27 -> c1
#0:	       ldm.f	r15, 192
	;;
#3:	if  c1 or	r3.24, 0 -> r3.27
	;;
#3:	       add	r3.27, r3.25 -> r3.25
#0:	       cmp eq	r31, 0 -> c3
	;;
#0:	if  c3 br @	.BB9_19
	;;
.BB9_285:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       or	r0.26, 0 -> r0
#2:	       callg	___sprint_r
#1:	       or	r1.27, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       cmp eq	r0, 0 -> c3
	;;
#0:	if !c3 br @	.BB9_356
#1:	if  c3 br @	.BB9_19
	;;
.BB9_286:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       bbh	zext8 r2 -> r0
	;;
#0:	       cmp eq	r0, 2 -> c1
	;;
#0:	if  c1 br @	.BB9_318
	;;
.BB9_287:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       cmp eq	r0, 1 -> c1
	;;
#0:	if !c1 br @	.BB9_321
	;;
.BB9_288:                               ;   in Loop: Header=BB9_20 Depth=1
#2:	       cmpu gt	r2.24, 9 -> c1
	;;
#0:	if  c1 br @	.BB9_325
	;;
.BB9_289:                               ;   in Loop: Header=BB9_20 Depth=1
#2:	       s2add	r2.24, 12 -> r0
	;;
.BB9_290:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       s2add	r15, 24 -> r1
#1:	       br	.BB9_340
	;;
#0:	       stmb.a	r0, r1, 23
#2:	       or	r2.27, 0 -> r0
	;;
	       nop	0
	;;
.BB9_291:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldi	102 -> r0
#1:	       ldm.f	r15, 212
	;;
#0:	       cmp ne	r0.24, r0 -> c1
	;;
#0:	if  c1 br @	.BB9_328
#2:	       or	r31, 0 -> r2.26
	;;
.BB9_292:                               ;   in Loop: Header=BB9_20 Depth=1
#2:	       cmp lt	r2.26, 1 -> c1
	;;
#0:	if  c1 br @	.BB9_330
	;;
.BB9_293:                               ;   in Loop: Header=BB9_20 Depth=1
#2:	       brz ne @	r2.24, .BB9_295
	;;
.BB9_294:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       btest	r0.23, 0 -> c1
	;;
#0:	if !c1 br @	.BB9_333
	;;
.BB9_295:                               ;   in Loop: Header=BB9_20 Depth=1
#2:	       add	r2.24, r2.26 -> r0
#0:	       br	.BB9_343
	;;
#2:	       add	r0, 1 -> r2.25
	;;
	       nop	0
	;;
.BB9_296:                               ; %.preheader.i
                                        ;   Parent Loop BB9_20 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#2:	       or	r2.23, 0 -> r0
#0:	       callg	___modsi3
#1:	       ldiu	224 -> r2
#3:	       ldi	10 -> r1
	;;
#0:	       add	r15, r2 -> r2
	;;
#1:	       add	r2, 0 -> r1.25
	;;
#1:	       add	r1.25, r11 -> r1.24
	;;
#0:	       s2add	r0, 12 -> r0
#1:	       ldi	10 -> r1
	;;
#1:	       stmb.a	r0, r1.24, 6
#0:	       ldi	99 -> r0
	;;
#0:	       callg	___divsi3
#2:	       cmp gt	r2.23, r0 -> c1
	;;
#2:	       or	r2.23, 0 -> r0
#0:	       ldx	$c1, 0 -> r2
	;;
#0:	       stm.s	r2, r15, 13
	;;
	       nop	0
	;;
#2:	       or	r0, 0 -> r2.23
#0:	       ldm.s	r15, 52
#1:	       sub	r11, 1 -> r11
	;;
#0:	       stx	r31 -> $c1
	;;
#0:	if  c1 br @	.BB9_296
	;;
.BB9_297:                               ;   in Loop: Header=BB9_20 Depth=1
#1:	       add	r1.25, r11 -> r2
#2:	       s2add	r2.23, 12 -> r0
	;;
#0:	       stmb.a	r0, r2, 6
#1:	       add	r2, 6 -> r3
	;;
#0:	       ldm.s	r15, 32
	;;
#0:	       or	r31, 0 -> r1
#1:	       ldm.s	r15, 36
	;;
#0:	       cmpu ge	r3, r1 -> c1
	;;
#0:	if  c1 br @	.BB9_301
#1:	       or	r31, 0 -> r1
	;;
.BB9_298:                               ; %.lr.ph.i
                                        ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldm.s	r15, 48
	;;
#0:	       or	r31, 0 -> r1
#1:	       ldm.s	r15, 44
	;;
#0:	       sub	r1, r11 -> r1
	;;
#0:	       brz eq	r11, .BB9_301
#1:	       or	r31, 0 -> r3
	;;
#0:	       or	r3, 2 -> r3
	;;
#0:	       stmb.a	r0, r3, 0
	;;
.BB9_299:                               ; %._crit_edge.i.preheader
                                        ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldi	0 -> r0
#1:	       ldi	0 -> r4
	;;
#0:	       sub	r0, r11 -> r3
	;;
.BB9_300:                               ; %._crit_edge.i
                                        ;   Parent Loop BB9_20 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       add	r2, r4 -> r5
#1:	       sub	r3, 1 -> r3
	;;
#0:	       ldm.f	r5, 7
#1:	       add	r5, 3 -> r0
	;;
#0:	       bbh	mzext8 r0 -> r5
#1:	       ldm.s	r15, 48
	;;
#0:	       brz ne	r3, .BB9_300
#1:	       or	r31, 0 -> r0
	;;
#0:	       add	r0, r4 -> r0
#1:	       add	r4, 1 -> r4
	;;
#0:	       stmb.a	r5, r0, 0
	;;
.BB9_301:                               ; %exponent.exit
                                        ;   in Loop: Header=BB9_20 Depth=1
#1:	       ldiu	lo11{ ___mem_emergency } -> r1.30
#0:	       ldm.s	r15, 44
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       sub	r1, r0 -> r0
	;;
#0:	       stm.s	r0, r15, 13
	;;
#0:	       ldm.f	r15, 200
	;;
#1:	       stm.a	r31, r1.30, 0
	;;
#0:	       ldm.s	r15, 52
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldmg.d	___mem_emergency
	;;
#2:	       add	r0, r31 -> r2.25
#0:	       cmp gt	r31, 1 -> c1
	;;
#0:	if  c1 br @	.BB9_303
	;;
.BB9_302:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       btest	r0.23, 0 -> c1
#2:	       ldi	0 -> r2.26
	;;
#0:	if !c1 br @	.BB9_343
	;;
.BB9_303:                               ;   in Loop: Header=BB9_20 Depth=1
#2:	       add	r2.25, 1 -> r2.25
#0:	       br	.BB9_343
	;;
#2:	       ldi	0 -> r2.26
	;;
	       nop	0
	;;
.BB9_304:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldiu	1791 -> r4
#1:	       ldga	32896 -> r1
#2:	       ldm.f	r2, 0
	;;
#0:	       ldim	991 -> r4
#1:	       ldih	1028 -> r1
	;;
#0:	       ldih	2039 -> r4
#1:	       and	r31, r1 -> r0
	;;
#0:	       add	r31, r4 -> r3
#1:	       xor	r0, r1 -> r0
	;;
#0:	       and	r0, r3 -> r0
	;;
#0:	       brz ne @	r0, .BB9_306
	;;
.BB9_305:                               ; %.lr.ph5.i22
                                        ;   Parent Loop BB9_20 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r2, 4
#1:	       add	r2, 4 -> r2
	;;
#0:	       and	r31, r1 -> r0
#1:	       add	r31, r4 -> r3
	;;
#0:	       xor	r0, r1 -> r0
	;;
#0:	       and	r0, r3 -> r0
	;;
#0:	       brz eq @	r0, .BB9_305
	;;
.BB9_306:                               ; %._crit_edge6.i24
                                        ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldm.f	r2, 0
	;;
#0:	       bbh	mzext8 r2 -> r0
	;;
#0:	       brz eq @	r0, .BB9_308
	;;
.BB9_307:                               ; %.lr.ph.i26
                                        ;   Parent Loop BB9_20 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r2, 1
#1:	       add	r2, 1 -> r1
	;;
#0:	       or	r1, 0 -> r2
	;;
#0:	       bbh	mzext8 r1 -> r0
	;;
#0:	       brz ne @	r0, .BB9_307
	;;
.BB9_308:                               ;   in Loop: Header=BB9_20 Depth=1
#2:	       ldi	0 -> r2.26
#0:	       ldi	115 -> r0.24
#1:	       ldm.s	r15, 60
	;;
#0:	       br	.BB9_336
#2:	       or	r2.26, 0 -> r2.24
	;;
#0:	       or	r31, 0 -> r0
	;;
#2:	       sub	r2, r0 -> r2.25
	;;
.BB9_309:                               ;   in Loop: Header=BB9_310 Depth=2
#0:	       add	r4, 4 -> r4
#1:	       sub	r3, 4 -> r3
	;;
.BB9_310:                               ;   Parent Loop BB9_20 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       cmpu lt	r3, 4 -> c1
	;;
#0:	if  c1 br @	.BB9_312
	;;
.BB9_311:                               ;   in Loop: Header=BB9_310 Depth=2
#0:	       ldiu	1791 -> r0
#1:	       ldga	32896 -> r1
#2:	       ldm.f	r4, 0
	;;
#0:	       ldim	991 -> r0
#1:	       ldih	1028 -> r1
	;;
#0:	       ldih	2039 -> r0
	;;
#0:	       add	r31, r0 -> r2
#1:	       and	r31, r1 -> r0
	;;
#0:	       xor	r0, r1 -> r0
	;;
#0:	       and	r0, r2 -> r0
	;;
#0:	       brz eq @	r0, .BB9_309
	;;
.BB9_312:                               ; %.preheader.i18.preheader
                                        ;   in Loop: Header=BB9_20 Depth=1
#0:	       sub	r4, 1 -> r0
	;;
.BB9_313:                               ; %.preheader.i18
                                        ;   Parent Loop BB9_20 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       brz eq @	r3, .BB9_334
	;;
.BB9_314:                               ;   in Loop: Header=BB9_313 Depth=2
#0:	       ldm.f	r0, 1
#1:	       add	r0, 1 -> r2
#2:	       sub	r3, 1 -> r3
	;;
#0:	       or	r2, 0 -> r0
	;;
#0:	       bbh	mzext8 r2 -> r1
	;;
#0:	       brz ne @	r1, .BB9_313
	;;
.BB9_315:                               ; %memchr.exit
                                        ;   in Loop: Header=BB9_20 Depth=1
#0:	       brz eq @	r2, .BB9_334
	;;
.BB9_316:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldi	115 -> r0.24
#1:	       ldm.s	r15, 60
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldm.s	r15, 60
	;;
#0:	       sub	r2, r0 -> r0
	;;
#2:	       cmp gt	r0, r2.23 -> c1
#0:	       or	r31, 0 -> r0
	;;
#2:	if !c1 sub	r2, r0 -> r2.23 ; aaaf
	;;
.BB9_317:                               ;   in Loop: Header=BB9_20 Depth=1
#2:	       ldi	0 -> r2.26
#0:	       br @	.BB9_335
	;;
.BB9_318:                               ;   in Loop: Header=BB9_20 Depth=1
#2:	       or	r2.27, 0 -> r3
	;;
.BB9_319:                               ; %.preheader64
                                        ;   Parent Loop BB9_20 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#2:	       and	r2.24, 15 -> r0
#0:	       ldm.s	r15, 56
	;;
#2:	       sr	r2.24, 4 -> r2.24
	;;
#0:	       or	r31, 0 -> r1
#1:	       ldm.s	r15, 56
	;;
#0:	       add	r1, r0 -> r2
	;;
#0:	       or	r31, 0 -> r1
	;;
#2:	       brz ne	r2.24, .BB9_319
#0:	       ldmr.f	r0, r1, 0
	;;
#0:	       bbh	mzext8 r2 -> r0
	;;
#0:	       stmb.a	r0, r3, 0
#1:	       sub	r3, 1 -> r3
	;;
.BB9_320:                               ; %.loopexit65.loopexit
                                        ;   in Loop: Header=BB9_20 Depth=1
#0:	       add	r3, 1 -> r0
#1:	       br @	.BB9_340
	;;
.BB9_321:                               ;   in Loop: Header=BB9_20 Depth=1
#2:	       or	r2.27, 0 -> r2
#0:	       brz ne	r0, .BB9_337
#1:	       ldga	._.str750 -> r1
	;;
#0:	       stm.s	r2, r15, 15
	;;
	       nop	0
	;;
.BB9_322:                               ; %.preheader67
                                        ;   Parent Loop BB9_20 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#2:	       and	r2.24, 7 -> r0
#0:	       ldm.s	r15, 60
#1:	       ldi	48 -> r1
	;;
#2:	       sr	r2.24, 3 -> r2.24
#0:	       or	r0, r1 -> r0
	;;
#0:	       or	r31, 0 -> r2
	;;
#0:	       stmb.a	r0, r2, 0
	;;
#0:	       ldm.s	r15, 60
	;;
#2:	       brz ne	r2.24, .BB9_322
#0:	       or	r31, 0 -> r3
	;;
#0:	       sub	r3, 1 -> r2
	;;
#0:	       stm.s	r2, r15, 15
	;;
.BB9_323:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       btest	r0.23, 0 -> c1
#1:	       cmp eq	r0, r1 -> c3
	;;
#0:	       comb	and !c1, !c1 -> c2
	;;
#0:	       comb	or c2, c3 -> c1
	;;
#0:	if  c1 br @	.BB9_339
	;;
.BB9_324:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldm.s	r15, 60
#1:	       br	.BB9_341
#2:	       ldi	48 -> r0
	;;
#0:	       or	r31, 0 -> r1
	;;
#0:	       stmb.a	r0, r1, 0
	;;
.BB9_325:                               ;   in Loop: Header=BB9_20 Depth=1
#2:	       or	r2.27, 0 -> r11
	;;
.BB9_326:                               ; %.preheader70
                                        ;   Parent Loop BB9_20 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#2:	       or	r2.24, 0 -> r0
#0:	       callg	___umodsi3
#1:	       ldi	10 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       callg	___udivsi3
#1:	       or	r0, 0 -> r1
#2:	       ldi	48 -> r3
	;;
#0:	       or	r1, r3 -> r0
#1:	       ldi	10 -> r1
	;;
#0:	       stmb.a	r0, r11, 0
#2:	       or	r2.24, 0 -> r0
	;;
	       nop	0
	;;
#2:	       cmpu gt	r2.24, 9 -> c1
#0:	       sub	r11, 1 -> r11
	;;
#0:	if  c1 br @	.BB9_326
#2:	       or	r0, 0 -> r2.24
	;;
.BB9_327:                               ; %.loopexit65.loopexit9
                                        ;   in Loop: Header=BB9_20 Depth=1
#0:	       add	r11, 1 -> r0
#1:	       br @	.BB9_340
	;;
.BB9_328:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldm.f	r15, 200
	;;
#0:	       or	r31, 0 -> r2
	;;
#2:	       cmp lt	r2.26, r2 -> c1
	;;
#0:	if !c1 br @	.BB9_342
	;;
.BB9_329:                               ;   in Loop: Header=BB9_20 Depth=1
#2:	       cmp gt	r2.26, 0 -> c1
#0:	       br	.BB9_343
#1:	       ldi	1 -> r0
#3:	       ldi	2 -> r1
	;;
#2:	if !c1 sub	r1, r2.26 -> r0 ; aaaf
	;;
#2:	       add	r2, r0 -> r2.25
	;;
.BB9_330:                               ;   in Loop: Header=BB9_20 Depth=1
#2:	       brz ne @	r2.24, .BB9_332
	;;
.BB9_331:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       btest	r0.23, 0 -> c1
#2:	       ldi	1 -> r2.25
	;;
#0:	if !c1 br @	.BB9_343
	;;
.BB9_332:                               ;   in Loop: Header=BB9_20 Depth=1
#2:	       add	r2.24, 2 -> r2.25
#0:	       br @	.BB9_343
	;;
.BB9_333:                               ;   in Loop: Header=BB9_20 Depth=1
#2:	       or	r2.26, 0 -> r2.25
#0:	       br @	.BB9_343
	;;
.BB9_334:                               ;   in Loop: Header=BB9_20 Depth=1
#2:	       ldi	0 -> r2.26
#0:	       ldi	115 -> r0.24
	;;
.BB9_335:                               ;   in Loop: Header=BB9_20 Depth=1
#2:	       or	r2.26, 0 -> r2.24
	;;
#2:	       or	r2.23, 0 -> r2.25
	;;
.BB9_336:                               ;   in Loop: Header=BB9_20 Depth=1
#3:	       or	r5, 0 -> r3.23
#0:	       br @	.BB9_65
	;;
.BB9_337:                               ; %.preheader53
                                        ;   Parent Loop BB9_20 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       and	r1, 3 -> r0
	;;
#0:	       brz eq @	r0, .BB9_345
	;;
.BB9_338:                               ;   in Loop: Header=BB9_337 Depth=2
#0:	       ldm.f	r1, 0
#1:	       add	r1, 1 -> r3
#2:	       or	r1, 0 -> r0
	;;
#0:	       bbh	mzext8 r1 -> r2
#1:	       or	r3, 0 -> r1
	;;
#0:	       brz ne @	r2, .BB9_337
	;;
#0:	       brz eq @	r2, .BB9_350
	;;
.BB9_339:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldm.s	r15, 60
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       add	r0, 1 -> r0
	;;
.BB9_340:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       stm.s	r0, r15, 15
	;;
.BB9_341:                               ; %.loopexit65
                                        ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldm.s	r15, 60
#1:	       br	.BB9_351
	;;
#0:	       or	r31, 0 -> r0
	;;
#2:	       sub	r2.28, r0 -> r2.25
	;;
.BB9_342:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       and	r0.23, 1 -> r0
	;;
#2:	       add	r2.26, r0 -> r2.25
	;;
.BB9_343:                               ;   in Loop: Header=BB9_20 Depth=1
#2:	       ldi	0 -> r2.24
#0:	       ldm.f	r15, 216
	;;
#1:	       bbh	mzext8 r1.26 -> r0
	;;
#0:	       brz eq @	r0, .BB9_352
	;;
.BB9_344:                               ;   in Loop: Header=BB9_20 Depth=1
#2:	       ldi	0 -> r2.24
#0:	       or	r0.25, 0 -> r0.23
#1:	       ldiu	192 -> r1
#3:	       ldi	45 -> r0
	;;
#0:	       br	.BB9_65
#1:	       add	r15, r1 -> r1
	;;
#0:	       stmb.a	r0, r1, 28
	;;
	       nop	0
	;;
.BB9_345:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldiu	1791 -> r4
#1:	       ldga	32896 -> r0
#2:	       ldm.f	r1, 0
	;;
#0:	       ldim	991 -> r4
#1:	       ldih	1028 -> r0
	;;
#0:	       ldih	2039 -> r4
#1:	       and	r31, r0 -> r3
	;;
#0:	       add	r31, r4 -> r2
#1:	       xor	r3, r0 -> r3
	;;
#0:	       and	r3, r2 -> r2
	;;
#0:	       brz ne @	r2, .BB9_347
	;;
.BB9_346:                               ; %.lr.ph5.i33
                                        ;   Parent Loop BB9_20 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r1, 4
#1:	       add	r1, 4 -> r1
	;;
#0:	       and	r31, r0 -> r3
#1:	       add	r31, r4 -> r2
	;;
#0:	       xor	r3, r0 -> r3
	;;
#0:	       and	r3, r2 -> r2
	;;
#0:	       brz eq @	r2, .BB9_346
	;;
.BB9_347:                               ; %._crit_edge6.i35
                                        ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldm.f	r1, 0
	;;
#0:	       bbh	mzext8 r1 -> r0
	;;
#0:	       brz eq @	r0, .BB9_349
	;;
.BB9_348:                               ; %.lr.ph.i37
                                        ;   Parent Loop BB9_20 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r1, 1
#1:	       add	r1, 1 -> r2
	;;
#0:	       or	r2, 0 -> r1
	;;
#0:	       bbh	mzext8 r2 -> r0
	;;
#0:	       brz ne @	r0, .BB9_348
	;;
.BB9_349:                               ; %._crit_edge.i39
                                        ;   in Loop: Header=BB9_20 Depth=1
#0:	       or	r1, 0 -> r0
	;;
.BB9_350:                               ; %strlen.exit41
                                        ;   in Loop: Header=BB9_20 Depth=1
#0:	       ldga	._.str750 -> r1
	;;
#0:	       stm.s	r1, r15, 15
#1:	       ldga	._.str750 -> r1
	;;
#2:	       sub	r0, r1 -> r2.25
	;;
.BB9_351:                               ; %.loopexit65
                                        ;   in Loop: Header=BB9_20 Depth=1
#2:	       ldi	0 -> r2.26
#0:	       br	.BB9_65
	;;
#2:	       or	r2.23, 0 -> r2.24
	;;
	       nop	0
	;;
.BB9_352:                               ;   in Loop: Header=BB9_20 Depth=1
#0:	       or	r0.25, 0 -> r0.23
#1:	       br @	.BB9_65
	;;
.BB9_353:                               ; %.loopexit97
#0:	       ldm.f	r15, 192
	;;
#0:	       brz eq @	r31, .BB9_355
	;;
.BB9_354:
#0:	       or	r0.26, 0 -> r0
#1:	       callg	___sprint_r
#2:	       ldiu	160 -> r10
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       add	r10, 24 -> r1
	;;
	       nop	0
	;;
#0:	       brz ne @	r0, .BB9_356
	;;
.BB9_355:
#1:	       stm.a	0, r1.23, 0
	;;
.BB9_356:                               ; %._crit_edge630
#0:	       ldm.f	r0.26, 12
	;;
#0:	       bbh	mzext8 r0.26 -> r0
	;;
#0:	       br	.BB9_359
#1:	       sr	r0, 6 -> r0
	;;
#0:	       btest	r0, 0 -> c1
#1:	       ldi	-1 -> r0
	;;
#3:	if  c1 or	r0, 0 -> r3.25
	;;
.BB9_357:
#3:	       or	r10, 0 -> r3.25
	;;
.BB9_358:
#0:	       ldga	2048 -> r1
	;;
#0:	       add	r15, r1 -> r1
	;;
#0:	       ldm.f	r1, -780
	;;
#0:	       bbh	mzext8 r11 -> r0
	;;
#0:	       btest	r0, 6 -> !c1
	;;
#0:	if !c1 ldm.f	r0.26, 12
#1:	if !c1 ldi	64 -> r0
	;;
#0:	if !c1 bbh	mzext16 r0.26 -> r1
	;;
#0:	if !c1 or	r1, r0 -> r0
	;;
#0:	if !c1 stmh.a	r0, r0.26, 6
	;;
.BB9_359:                               ; %__sbprintf.exit
#3:	       or	r3.25, 0 -> r0
#0:	       ldga	2048 -> r1
	;;
#0:	       add	r15, r1 -> r1
	;;
#0:	       ldm.s	r1, -684
	;;
#0:	       stx	r31 -> $ro
#1:	       ldm.s	r1, -680
	;;
#0:	       stx	r31 -> $rb
#1:	       ldm.s	r1, -676
	;;
#0:	       stx	r31 -> $f13
#1:	       ldm.s	r1, -672
	;;
#0:	       stx	r31 -> $f12
#1:	       ldm.s	r1, -668
	;;
#0:	       stx	r31 -> $f11
#1:	       ldm.s	r1, -664
	;;
#0:	       stx	r31 -> $f10
#1:	       ldm.s	r1, -660
	;;
#2:	       or	r31, 0 -> r2.29
#0:	       ldm.s	r1, -656
	;;
#1:	       or	r31, 0 -> r1.29
#0:	       ldm.s	r1, -652
	;;
#0:	       or	r31, 0 -> r0.29
#1:	       ldm.s	r1, -648
	;;
#2:	       or	r31, 0 -> r2.28
#0:	       ldm.s	r1, -644
	;;
#1:	       or	r31, 0 -> r1.28
#0:	       ldm.s	r1, -640
	;;
#0:	       or	r31, 0 -> r0.28
#1:	       ldm.s	r1, -636
	;;
#3:	       or	r31, 0 -> r3.27
#0:	       ldm.s	r1, -632
	;;
#2:	       or	r31, 0 -> r2.27
#0:	       ldm.s	r1, -628
	;;
#1:	       or	r31, 0 -> r1.27
#0:	       ldm.s	r1, -624
	;;
#0:	       or	r31, 0 -> r0.27
#1:	       ldm.s	r1, -620
	;;
#3:	       or	r31, 0 -> r3.26
#0:	       ldm.s	r1, -616
	;;
#2:	       or	r31, 0 -> r2.26
#0:	       ldm.s	r1, -612
	;;
#1:	       or	r31, 0 -> r1.26
#0:	       ldm.s	r1, -608
	;;
#0:	       or	r31, 0 -> r0.26
#1:	       ldm.s	r1, -604
	;;
#3:	       or	r31, 0 -> r3.25
#0:	       ldm.s	r1, -600
	;;
#2:	       or	r31, 0 -> r2.25
#0:	       ldm.s	r1, -596
	;;
#1:	       or	r31, 0 -> r1.25
#0:	       ldm.s	r1, -592
	;;
#0:	       or	r31, 0 -> r0.25
#1:	       ldm.s	r1, -588
	;;
#3:	       or	r31, 0 -> r3.24
#0:	       ldm.s	r1, -584
	;;
#2:	       or	r31, 0 -> r2.24
#0:	       ldm.s	r1, -580
	;;
#1:	       or	r31, 0 -> r1.24
#0:	       ldm.s	r1, -576
	;;
#0:	       or	r31, 0 -> r0.24
#1:	       ldm.s	r1, -572
	;;
#3:	       or	r31, 0 -> r3.23
#0:	       ldm.s	r1, -568
	;;
#2:	       or	r31, 0 -> r2.23
#0:	       ldm.s	r1, -564
	;;
#1:	       or	r31, 0 -> r1.23
#0:	       ldm.s	r1, -560
	;;
#0:	       or	r31, 0 -> r0.23
#1:	       ldm.s	r1, -556
	;;
#0:	       or	r31, 0 -> r14
#1:	       ldm.s	r1, -552
	;;
#0:	       or	r31, 0 -> r13
#1:	       ldm.s	r1, -548
	;;
#0:	       or	r31, 0 -> r12
#1:	       ldm.s	r1, -544
	;;
#0:	       or	r31, 0 -> r11
#1:	       ldm.s	r1, -540
#2:	       ldiu	1544 -> r1
	;;
#0:	       add	r15, r1 -> r15
	;;
#0:	       jop	ret
#1:	       or	r31, 0 -> r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
__vfprintf_r_end:
.tmp9:
	.size	__vfprintf_r, .tmp9-__vfprintf_r
	.section	.rodata,"a",@progbits
	.align	4
.JTI9_0:
	.long	.BB9_46-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_48-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_49-__vfprintf_r_start
	.long	.BB9_52-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_51-__vfprintf_r_start
	.long	.BB9_43-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_54-__vfprintf_r_start
	.long	.BB9_42-__vfprintf_r_start
	.long	.BB9_42-__vfprintf_r_start
	.long	.BB9_42-__vfprintf_r_start
	.long	.BB9_42-__vfprintf_r_start
	.long	.BB9_42-__vfprintf_r_start
	.long	.BB9_42-__vfprintf_r_start
	.long	.BB9_42-__vfprintf_r_start
	.long	.BB9_42-__vfprintf_r_start
	.long	.BB9_42-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_200-__vfprintf_r_start
	.long	.BB9_204-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_204-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_55-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_209-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_213-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_222-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_217-__vfprintf_r_start
	.long	.BB9_201-__vfprintf_r_start
	.long	.BB9_204-__vfprintf_r_start
	.long	.BB9_204-__vfprintf_r_start
	.long	.BB9_204-__vfprintf_r_start
	.long	.BB9_56-__vfprintf_r_start
	.long	.BB9_201-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_35-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_59-__vfprintf_r_start
	.long	.BB9_210-__vfprintf_r_start
	.long	.BB9_218-__vfprintf_r_start
	.long	.BB9_35-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_219-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_214-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_63-__vfprintf_r_start
	.long	.BB9_221-__vfprintf_r_start

	.text
	.type	_cvt54,@function
_cvt54:                                 ; @cvt54
	.funsz	_cvt54_end-_cvt54
_cvt54_start:
; BB#0:
#0:	       wb.s	r15, 28
#1:	       addi	-112 -> r15
#2:	       ldx	$f10 -> r4
	;;
#0:	       stm.s	r10, r15, 19
#1:	       stx	r1 -> $f0
#2:	       or	r2, 0 -> r10
	;;
#0:	       stm.s	r11, r15, 18
	;;
#0:	       stm.s	r12, r15, 17
#1:	       ldx	$f11 -> r12
	;;
#0:	       stm.s	r13, r15, 16
#1:	       ldx	$rb, 0 -> r13
#2:	       stx	r0 -> $f10
	;;
#0:	       stm.s	r14, r15, 15
#1:	       ldx	$ro, 0 -> r14
	;;
#0:	       stm.s	r4, r15, 14
	;;
#0:	       stm.s	r12, r15, 13
	;;
#0:	       stm.s	r13, r15, 12
#1:	       or	r3, 0 -> r13
#2:	       add	r15, 24 -> r3
	;;
#0:	       stm.s	r14, r15, 11
#1:	       fop	fmov	f0 -> f11
	;;
#0:	       stm.a	r0, r15, 6
#1:	       ldx	$f11 -> r1
#2:	       or	r3, 4 -> r0
	;;
#0:	       stm.a	r1, r0, 0
	;;
#0:	       ldm.f	r0, 0
#1:	       ldi	0 -> r0
	;;
#0:	       or	r31, 0 -> r2
#1:	       ldm.f	r15, 124
	;;
#0:	       cmp gt	r2, -1 -> c1
#1:	       ldi	32 -> r2
	;;
#0:	       or	r31, 0 -> r11
#1:	       ldm.f	r15, 120
#2:	if !c1 ldi	45 -> r0
#3:	if !c1 fop	dneg	d5 -> d5
	;;
#0:	       or	r31, 0 -> r14
#1:	       ldm.f	r15, 116
	;;
#0:	       or	r14, r2 -> r1
#1:	       ldi	3 -> r2
	;;
#0:	       or	r31, 0 -> r12
#1:	       ldm.f	r15, 112
	;;
#0:	       or	r31, 0 -> r3
	;;
#0:	       stmb.a	r0, r3, 0
#1:	       ldi	102 -> r3
	;;
#0:	       cmp eq	r1, r3 -> c1
	;;
#0:	if  c1 br @	.BB10_2
	;;
.BB10_1:
#0:	       ldi	101 -> r0
#1:	       ldi	2 -> r2
	;;
#0:	       cmp eq	r1, r0 -> c1
	;;
#0:	if  c1 add	r10, 1 -> r10
#1:	if  c1 ldi	2 -> r2
	;;
.BB10_2:
#0:	       s2add	r15, 8 -> r4
#1:	       stm.a	r12, r15, 0
#2:	       ldx	$f11 -> r1
	;;
#0:	       callg	__dtoa_r
#1:	       add	r4, 8 -> r0
#2:	       s2add	r15, 8 -> r4
	;;
#0:	       stm.a	r0, r15, 1
#1:	       add	r4, 4 -> r3
#2:	       ldx	$f10 -> r0
	;;
#0:	       stm.a	r3, r15, 2
#1:	       or	r10, 0 -> r3
	;;
	       nop	0
	;;
#0:	       ldi	101 -> r3
#1:	       or	r0, 0 -> r4
	;;
#0:	       cmp gt	r14, r3 -> c1
	;;
#0:	if  c1 br @	.BB10_5
	;;
.BB10_3:
#0:	       ldi	70 -> r0
	;;
#0:	       cmp eq	r14, r0 -> c1
	;;
#0:	if  c1 br @	.BB10_9
	;;
.BB10_4:
#0:	       ldi	71 -> r0
	;;
#0:	       cmp eq	r14, r0 -> c1
	;;
#0:	if  c1 br @	.BB10_7
#1:	if !c1 br @	.BB10_13
	;;
.BB10_5:
#0:	       ldi	102 -> r0
	;;
#0:	       cmp eq	r14, r0 -> c1
	;;
#0:	if  c1 br @	.BB10_9
	;;
.BB10_6:
#0:	       ldi	103 -> r0
	;;
#0:	       cmp ne	r14, r0 -> c1
	;;
#0:	if  c1 br @	.BB10_13
	;;
.BB10_7:
#0:	       btest	r13, 0 -> c1
	;;
#0:	if !c1 br @	.BB10_19
	;;
.BB10_8:
#0:	       ldi	32 -> r0
#1:	       ldi	102 -> r3
	;;
#0:	       or	r14, r0 -> r1
	;;
#0:	       cmp eq	r1, r3 -> c1
	;;
#0:	if !c1 br @	.BB10_13
	;;
.BB10_9:
#0:	       ldm.f	r4, 0
#1:	       fop	dzero -> d0
#2:	       ldi	48 -> r0
	;;
#0:	       bbh	mzext8 r4 -> r1
#1:	       fop	dcmp	d5, d0 -> f0
	;;
#0:	       cmp eq	r1, r0 -> c2
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r3
	;;
#0:	       btest	r3, 9 -> c1
	;;
#0:	       comb	and c2, c1 -> c1
	;;
#0:	if !c1 br @	.BB10_11
	;;
.BB10_10:
#0:	       ldi	1 -> r0
#1:	       br	.BB10_12
	;;
#0:	       sub	r0, r10 -> r0
	;;
#0:	       stm.a	r0, r12, 0
	;;
.BB10_11:                               ; %._crit_edge
#0:	       ldm.f	r12, 0
	;;
#0:	       or	r31, 0 -> r0
	;;
.BB10_12:
#0:	       add	r0, r10 -> r10
	;;
.BB10_13:
#0:	       fop	dzero -> d0
#1:	       add	r4, r10 -> r3
	;;
#0:	       fop	dcmp	d5, d0 -> f0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r0
	;;
#0:	       btest	r0, 9 -> c1
	;;
#0:	if  c1 br @	.BB10_15
	;;
.BB10_14:                               ; %.preheader.thread
#0:	       or	r3, 0 -> r0
#1:	       br @	.BB10_20
#2:	       stm.a	r3, r15, 9
	;;
.BB10_15:                               ; %.preheader
#0:	       ldm.f	r15, 36
	;;
#0:	       cmpu ge	r31, r3 -> c1
#1:	       or	r31, 0 -> r1
	;;
#0:	if  c1 br @	.BB10_18
	;;
.BB10_16:
#0:	       ldi	48 -> r2
	;;
.BB10_17:                               ; %.lr.ph
                                        ; =>This Inner Loop Header: Depth=1
#0:	       add	r1, 1 -> r0
	;;
#0:	       stm.a	r0, r15, 9
	;;
#0:	       stmb.a	r2, r1, 0
	;;
#0:	       ldm.f	r15, 36
	;;
#0:	       cmpu lt	r31, r3 -> c1
#1:	       or	r31, 0 -> r1
#2:	       or	r31, 0 -> r0
	;;
#0:	if !c1 br @	.BB10_20
#1:	if  c1 br @	.BB10_17
	;;
.BB10_18:
#0:	       or	r1, 0 -> r0
#1:	       br @	.BB10_20
	;;
.BB10_19:                               ; %._crit_edge1
#0:	       ldm.f	r15, 36
	;;
#0:	       or	r31, 0 -> r0
	;;
.BB10_20:                               ; %.loopexit
#0:	       sub	r0, r4 -> r0
	;;
#0:	       stm.a	r0, r11, 0
#1:	       or	r4, 0 -> r0
	;;
#0:	       ldm.s	r15, 44
	;;
#0:	       stx	r31 -> $ro
#1:	       ldm.s	r15, 48
	;;
#0:	       stx	r31 -> $rb
#1:	       ldm.s	r15, 52
	;;
#0:	       stx	r31 -> $f11
#1:	       ldm.s	r15, 56
	;;
#0:	       stx	r31 -> $f10
#1:	       ldm.s	r15, 60
	;;
#0:	       or	r31, 0 -> r14
#1:	       ldm.s	r15, 64
	;;
#0:	       or	r31, 0 -> r13
#1:	       ldm.s	r15, 68
	;;
#0:	       or	r31, 0 -> r12
#1:	       ldm.s	r15, 72
	;;
#0:	       or	r31, 0 -> r11
#1:	       ldm.s	r15, 76
#2:	       addi	112 -> r15
	;;
#0:	       jop	ret
#1:	       or	r31, 0 -> r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
_cvt54_end:
.tmp10:
	.size	_cvt54, .tmp10-_cvt54

	.type	___sinit,@function
___sinit:                               ; @__sinit
	.funsz	___sinit_end-___sinit
___sinit_start:
; BB#0:
#0:	       ldmg.d	_impure_data+56
	;;
#0:	       cmp ne	r31, 0 -> c3
	;;
#0:	if  c3 br @	.BB11_41
	;;
.BB11_1:
#0:	       ldga	_impure_data -> r1
#1:	       ldga	__cleanup_r -> r0
#2:	       ldga	_impure_data+740 -> r2
#3:	       ldga	_impure_data+748 -> r3
	;;
#0:	       stm.a	r0, r1, 15
#1:	       ldga	_impure_data+736 -> r0
#2:	       ldi	-8 -> r5
	;;
#0:	       stm.a	1, r1, 14
#1:	       ldga	_impure_data+744 -> r1
	;;
#0:	       stm.a	0, r0, 0
	;;
#0:	       stm.a	3, r2, 0
	;;
#0:	       stm.a	r3, r1, 0
	;;
#0:	       ldmg.d	_impure_data+4
	;;
#0:	       stm.a	0, r31, 0
#1:	       or	r31, 0 -> r4
	;;
#0:	       stm.a	0, r31, 1
	;;
#0:	       stm.a	0, r31, 2
	;;
#0:	       stmh.a	4, r31, 6
	;;
#0:	       stm.a	0, r31, 25
	;;
#0:	       stmh.a	0, r31, 13
	;;
#0:	       stmh.a	0, r31, 12
	;;
#0:	       stmh.a	0, r31, 11
	;;
#0:	       stmh.a	0, r31, 10
	;;
#0:	       br	.BB11_3
#1:	       stmh.a	0, r31, 9
	;;
#0:	       stmh.a	0, r31, 8
	;;
#0:	       stmh.a	0, r31, 7
	;;
.BB11_2:                                ;   in Loop: Header=BB11_3 Depth=1
#0:	       add	r5, 1 -> r5
#1:	       stmb.a	0, r3, 0
	;;
.BB11_3:                                ; =>This Inner Loop Header: Depth=1
#0:	       add	r4, r5 -> r1
	;;
#0:	       s2add	r1, 25 -> r3
	;;
#0:	       and	r3, 3 -> r0
	;;
#0:	       brz eq @	r0, .BB11_5
	;;
.BB11_4:                                ;   in Loop: Header=BB11_3 Depth=1
#0:	       brz ne @	r5, .BB11_2
	;;
#0:	       brz eq @	r5, .BB11_14
	;;
.BB11_5:
#0:	       ldi	0 -> r0
	;;
#0:	       sub	r0, r5 -> r0
	;;
#0:	       cmpu lt	r0, 4 -> c1
	;;
#0:	if  c1 br @	.BB11_12
	;;
.BB11_6:
#0:	       cmpu lt	r0, 16 -> c1
#1:	       s2add	r1, 25 -> r3
	;;
#0:	if  c1 br @	.BB11_10
	;;
.BB11_7:                                ; %.lr.ph8.i.preheader
#0:	       ldi	-16 -> r1
	;;
#0:	       sub	r1, r5 -> r2
#1:	       ldi	-16 -> r1
	;;
#0:	       and	r2, r1 -> r1
	;;
.BB11_8:                                ; %.lr.ph8.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sub	r0, 16 -> r0
#1:	       stm.a	0, r3, 3
	;;
#0:	       cmpu gt	r0, 15 -> c1
#1:	       stm.a	0, r3, 2
	;;
#0:	if  c1 br	.BB11_8
#1:	       stm.a	0, r3, 1
	;;
#0:	       stm.a	0, r3, 0
#1:	       add	r3, 16 -> r3
	;;
	       nop	0
	;;
.BB11_9:                                ; %.preheader.i
#0:	       add	r4, r1 -> r0
#1:	       ldi	0 -> r2
	;;
#0:	       add	r0, r5 -> r0
	;;
#0:	       br	.BB11_11
#1:	       s2add	r0, 29 -> r3
#2:	       sub	r2, r1 -> r0
	;;
#0:	       sub	r0, r5 -> r0
	;;
#0:	       sub	r0, 16 -> r0
	;;
.BB11_10:                               ; %.lr.ph.i
#0:	       stm.a	0, r3, 0
#1:	       add	r3, 4 -> r3
#2:	       sub	r0, 4 -> r0
	;;
.BB11_11:                               ; %.lr.ph.i
#0:	       cmpu gt	r0, 3 -> c1
	;;
#0:	if  c1 br @	.BB11_10
	;;
.BB11_12:                               ; %.preheader11.i
#0:	       brz eq @	r0, .BB11_14
	;;
.BB11_13:                               ; %.lr.ph14.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       stmb.a	0, r3, 0
#1:	       add	r3, 1 -> r3
#2:	       sub	r0, 1 -> r0
	;;
#0:	       brz ne @	r0, .BB11_13
	;;
.BB11_14:                               ; %memset.exit
#0:	       stm.a	r4, r4, 7
#1:	       ldga	___sread -> r0
#2:	       ldga	___swrite -> r1
#3:	       ldga	___sseek -> r2
	;;
#0:	       stm.a	r0, r4, 8
#1:	       ldga	___sclose -> r3
#2:	       ldi	-8 -> r5
	;;
#0:	       stm.a	r1, r4, 9
	;;
#0:	       stm.a	r2, r4, 10
	;;
#0:	       stm.a	r3, r4, 11
	;;
#0:	       ldmg.d	_impure_data+8
	;;
#0:	       stm.a	0, r31, 0
#1:	       or	r31, 0 -> r4
	;;
#0:	       stm.a	0, r31, 1
	;;
#0:	       stm.a	0, r31, 2
	;;
#0:	       stmh.a	9, r31, 6
	;;
#0:	       stm.a	0, r31, 25
	;;
#0:	       stmh.a	1, r31, 7
	;;
#0:	       br	.BB11_16
#1:	       stm.a	0, r31, 4
	;;
#0:	       stm.a	0, r31, 5
	;;
#0:	       stm.a	0, r31, 6
	;;
.BB11_15:                               ;   in Loop: Header=BB11_16 Depth=1
#0:	       add	r5, 1 -> r5
#1:	       stmb.a	0, r3, 0
	;;
.BB11_16:                               ; =>This Inner Loop Header: Depth=1
#0:	       add	r4, r5 -> r1
	;;
#0:	       s2add	r1, 25 -> r3
	;;
#0:	       and	r3, 3 -> r0
	;;
#0:	       brz eq @	r0, .BB11_18
	;;
.BB11_17:                               ;   in Loop: Header=BB11_16 Depth=1
#0:	       brz ne @	r5, .BB11_15
	;;
#0:	       brz eq @	r5, .BB11_27
	;;
.BB11_18:
#0:	       ldi	0 -> r0
	;;
#0:	       sub	r0, r5 -> r0
	;;
#0:	       cmpu lt	r0, 4 -> c1
	;;
#0:	if  c1 br @	.BB11_25
	;;
.BB11_19:
#0:	       cmpu lt	r0, 16 -> c1
#1:	       s2add	r1, 25 -> r3
	;;
#0:	if  c1 br @	.BB11_23
	;;
.BB11_20:                               ; %.lr.ph8.i25.preheader
#0:	       ldi	-16 -> r1
	;;
#0:	       sub	r1, r5 -> r2
#1:	       ldi	-16 -> r1
	;;
#0:	       and	r2, r1 -> r1
	;;
.BB11_21:                               ; %.lr.ph8.i25
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sub	r0, 16 -> r0
#1:	       stm.a	0, r3, 3
	;;
#0:	       cmpu gt	r0, 15 -> c1
#1:	       stm.a	0, r3, 2
	;;
#0:	if  c1 br	.BB11_21
#1:	       stm.a	0, r3, 1
	;;
#0:	       stm.a	0, r3, 0
#1:	       add	r3, 16 -> r3
	;;
	       nop	0
	;;
.BB11_22:                               ; %.preheader.i22
#0:	       add	r4, r1 -> r0
#1:	       ldi	0 -> r2
	;;
#0:	       add	r0, r5 -> r0
	;;
#0:	       br	.BB11_24
#1:	       s2add	r0, 29 -> r3
#2:	       sub	r2, r1 -> r0
	;;
#0:	       sub	r0, r5 -> r0
	;;
#0:	       sub	r0, 16 -> r0
	;;
.BB11_23:                               ; %.lr.ph.i28
#0:	       stm.a	0, r3, 0
#1:	       add	r3, 4 -> r3
#2:	       sub	r0, 4 -> r0
	;;
.BB11_24:                               ; %.lr.ph.i28
#0:	       cmpu gt	r0, 3 -> c1
	;;
#0:	if  c1 br @	.BB11_23
	;;
.BB11_25:                               ; %.preheader11.i34
#0:	       brz eq @	r0, .BB11_27
	;;
.BB11_26:                               ; %.lr.ph14.i37
                                        ; =>This Inner Loop Header: Depth=1
#0:	       stmb.a	0, r3, 0
#1:	       add	r3, 1 -> r3
#2:	       sub	r0, 1 -> r0
	;;
#0:	       brz ne @	r0, .BB11_26
	;;
.BB11_27:                               ; %memset.exit38
#0:	       stm.a	r4, r4, 7
#1:	       ldga	___sread -> r0
#2:	       ldga	___swrite -> r1
#3:	       ldga	___sseek -> r2
	;;
#0:	       stm.a	r0, r4, 8
#1:	       ldga	___sclose -> r3
#2:	       ldi	18 -> r0
#3:	       ldi	-8 -> r5
	;;
#0:	       stm.a	r1, r4, 9
	;;
#0:	       stm.a	r2, r4, 10
	;;
#0:	       stm.a	r3, r4, 11
	;;
#0:	       ldmg.d	_impure_data+12
	;;
#0:	       stm.a	0, r31, 0
#1:	       or	r31, 0 -> r4
	;;
#0:	       stm.a	0, r31, 1
	;;
#0:	       stm.a	0, r31, 2
	;;
#0:	       stmh.a	r0, r31, 6
	;;
#0:	       stm.a	0, r31, 25
	;;
#0:	       stmh.a	2, r31, 7
	;;
#0:	       br	.BB11_29
#1:	       stm.a	0, r31, 4
	;;
#0:	       stm.a	0, r31, 5
	;;
#0:	       stm.a	0, r31, 6
	;;
.BB11_28:                               ;   in Loop: Header=BB11_29 Depth=1
#0:	       add	r5, 1 -> r5
#1:	       stmb.a	0, r3, 0
	;;
.BB11_29:                               ; =>This Inner Loop Header: Depth=1
#0:	       add	r4, r5 -> r1
	;;
#0:	       s2add	r1, 25 -> r3
	;;
#0:	       and	r3, 3 -> r0
	;;
#0:	       brz eq @	r0, .BB11_31
	;;
.BB11_30:                               ;   in Loop: Header=BB11_29 Depth=1
#0:	       brz ne @	r5, .BB11_28
	;;
#0:	       brz eq @	r5, .BB11_40
	;;
.BB11_31:
#0:	       ldi	0 -> r0
	;;
#0:	       sub	r0, r5 -> r0
	;;
#0:	       cmpu lt	r0, 4 -> c1
	;;
#0:	if  c1 br @	.BB11_38
	;;
.BB11_32:
#0:	       cmpu lt	r0, 16 -> c1
#1:	       s2add	r1, 25 -> r3
	;;
#0:	if  c1 br @	.BB11_36
	;;
.BB11_33:                               ; %.lr.ph8.i6.preheader
#0:	       ldi	-16 -> r1
	;;
#0:	       sub	r1, r5 -> r2
#1:	       ldi	-16 -> r1
	;;
#0:	       and	r2, r1 -> r1
	;;
.BB11_34:                               ; %.lr.ph8.i6
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sub	r0, 16 -> r0
#1:	       stm.a	0, r3, 3
	;;
#0:	       cmpu gt	r0, 15 -> c1
#1:	       stm.a	0, r3, 2
	;;
#0:	if  c1 br	.BB11_34
#1:	       stm.a	0, r3, 1
	;;
#0:	       stm.a	0, r3, 0
#1:	       add	r3, 16 -> r3
	;;
	       nop	0
	;;
.BB11_35:                               ; %.preheader.i3
#0:	       add	r4, r1 -> r0
#1:	       ldi	0 -> r2
	;;
#0:	       add	r0, r5 -> r0
	;;
#0:	       br	.BB11_37
#1:	       s2add	r0, 29 -> r3
#2:	       sub	r2, r1 -> r0
	;;
#0:	       sub	r0, r5 -> r0
	;;
#0:	       sub	r0, 16 -> r0
	;;
.BB11_36:                               ; %.lr.ph.i9
#0:	       stm.a	0, r3, 0
#1:	       add	r3, 4 -> r3
#2:	       sub	r0, 4 -> r0
	;;
.BB11_37:                               ; %.lr.ph.i9
#0:	       cmpu gt	r0, 3 -> c1
	;;
#0:	if  c1 br @	.BB11_36
	;;
.BB11_38:                               ; %.preheader11.i15
#0:	       brz eq @	r0, .BB11_40
	;;
.BB11_39:                               ; %.lr.ph14.i18
                                        ; =>This Inner Loop Header: Depth=1
#0:	       stmb.a	0, r3, 0
#1:	       add	r3, 1 -> r3
#2:	       sub	r0, 1 -> r0
	;;
#0:	       brz ne @	r0, .BB11_39
	;;
.BB11_40:                               ; %memset.exit19
#0:	       stm.a	r4, r4, 7
#1:	       ldga	___sread -> r0
#2:	       ldga	___swrite -> r1
#3:	       ldga	___sseek -> r2
	;;
#0:	       stm.a	r0, r4, 8
#1:	       ldga	___sclose -> r3
	;;
#0:	       stm.a	r1, r4, 9
	;;
#0:	       stm.a	r2, r4, 10
	;;
#0:	       stm.a	r3, r4, 11
	;;
.BB11_41:
#0:	       jop	ret
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
___sinit_end:
.tmp11:
	.size	___sinit, .tmp11-___sinit

	.type	__cleanup_r,@function
__cleanup_r:                            ; @_cleanup_r
	.funsz	__cleanup_r_end-__cleanup_r
__cleanup_r_start:
; BB#0:
#0:	       wb.s	r15, 12
#1:	       addi	-48 -> r15
#2:	       ldx	$rb, 0 -> r1
#3:	       ldx	$ro, 0 -> r3
	;;
#0:	       stm.s	r10, r15, 7
	;;
#0:	       stm.s	r11, r15, 6
	;;
#0:	       stm.s	r12, r15, 5
#1:	       or	r0, 0 -> r12
	;;
#0:	       stm.s	r13, r15, 4
#1:	       addi	736 -> r12
	;;
#0:	       brz eq	r12, .BB12_22
#1:	       stm.s	r14, r15, 3
	;;
#0:	       stm.s	r1, r15, 2
	;;
#0:	       stm.s	r3, r15, 1
	;;
.BB12_1:
#0:	       ldiu	2047 -> r13
	;;
#0:	       ldim	31 -> r13
	;;
.BB12_2:                                ; %.lr.ph6.i
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB12_4 Depth 2
#0:	       ldm.f	r12, 4
	;;
#0:	       or	r31, 0 -> r10
	;;
#0:	       cmp lt	r10, 1 -> c1
	;;
#0:	if  c1 br @	.BB12_21
	;;
.BB12_3:                                ; %.lr.ph.i
                                        ;   in Loop: Header=BB12_2 Depth=1
#0:	       ldm.f	r12, 8
	;;
#0:	       s2add	r31, 17 -> r11
	;;
.BB12_4:                                ;   Parent Loop BB12_2 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r11, -56
	;;
#0:	       bbh	mzext16 r11 -> r1
	;;
#0:	       cmpu lt	r1, 2 -> c1
	;;
#0:	if  c1 br @	.BB12_20
	;;
.BB12_5:                                ;   in Loop: Header=BB12_4 Depth=2
#0:	       ldm.f	r11, -54
#1:	       or	r11, 0 -> r14
#2:	       sub	r11, 2 -> r0
	;;
#0:	       addi	-68 -> r14
	;;
#0:	       bbh	mzext16 r0 -> r0
#1:	       cmp eq	r14, 0 -> c1
	;;
#0:	       cmp eq	r0, r13 -> c2
	;;
#0:	       comb	or c2, c1 -> c1
	;;
#0:	if  c1 br @	.BB12_20
	;;
.BB12_6:                                ;   in Loop: Header=BB12_4 Depth=2
#0:	       ldmg.d	_impure_data+56
	;;
#0:	       brz ne @	r31, .BB12_8
	;;
.BB12_7:                                ;   in Loop: Header=BB12_4 Depth=2
#0:	       callg	___sinit
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldm.f	r11, -56
	;;
#0:	       bbh	mzext16 r11 -> r1
	;;
.BB12_8:                                ;   in Loop: Header=BB12_4 Depth=2
#0:	       bbh	zext16 r1 -> r0
	;;
#0:	       brz eq @	r0, .BB12_20
	;;
.BB12_9:                                ;   in Loop: Header=BB12_4 Depth=2
#0:	       or	r14, 0 -> r0
#1:	       callg	__fflush_r
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldm.f	r11, -24
	;;
#0:	       or	r31, 0 -> r2
	;;
#0:	       brz eq @	r2, .BB12_11
	;;
.BB12_10:                               ;   in Loop: Header=BB12_4 Depth=2
#0:	       ldm.f	r11, -40
#1:	       ldga	_impure_data -> r0
	;;
#0:	       or	r31, 0 -> r1
	;;
#0:	       jop	call	r2
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB12_11:                               ;   in Loop: Header=BB12_4 Depth=2
#0:	       ldm.f	r11, -56
	;;
#0:	       bbh	mzext8 r11 -> r0
	;;
#0:	       btest	r0, 7 -> !c1
	;;
#0:	if  c1 br @	.BB12_13
	;;
.BB12_12:                               ;   in Loop: Header=BB12_4 Depth=2
#0:	       callg	__free_r
	;;
#0:	       ldm.f	r11, -52
	;;
#0:	       or	r31, 0 -> r0
	;;
	       nop	0
	;;
.BB12_13:                               ;   in Loop: Header=BB12_4 Depth=2
#0:	       ldm.f	r11, -20
	;;
#0:	       or	r31, 0 -> r1
	;;
#0:	       brz eq @	r1, .BB12_17
	;;
.BB12_14:                               ;   in Loop: Header=BB12_4 Depth=2
#0:	       sub	r11, 4 -> r0
	;;
#0:	       cmp eq	r0, r1 -> c1
	;;
#0:	if  c1 br @	.BB12_16
	;;
.BB12_15:                               ;   in Loop: Header=BB12_4 Depth=2
#0:	       or	r1, 0 -> r0
#1:	       callg	__free_r
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB12_16:                               ;   in Loop: Header=BB12_4 Depth=2
#0:	       sub	r11, 20 -> r0
	;;
#0:	       stm.a	0, r0, 0
	;;
.BB12_17:                               ;   in Loop: Header=BB12_4 Depth=2
#0:	       ldm.f	r11, 0
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       brz eq @	r0, .BB12_19
	;;
.BB12_18:                               ;   in Loop: Header=BB12_4 Depth=2
#0:	       callg	__free_r
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       stm.a	0, r11, 0
	;;
.BB12_19:                               ;   in Loop: Header=BB12_4 Depth=2
#0:	       or	r11, 0 -> r0
	;;
#0:	       addi	-56 -> r0
	;;
#0:	       stmh.a	0, r0, 0
	;;
.BB12_20:                               ; %fclose.exit.i
                                        ;   in Loop: Header=BB12_4 Depth=2
#0:	       sub	r10, 1 -> r10
#1:	       s2add	r11, 26 -> r11
	;;
#0:	       brz gt @	r10, .BB12_4
	;;
.BB12_21:                               ; %._crit_edge.i
                                        ;   in Loop: Header=BB12_2 Depth=1
#0:	       ldm.f	r12, 0
	;;
#0:	       brz ne @	r31, .BB12_2
#1:	       or	r31, 0 -> r12
	;;
.BB12_22:                               ; %_fwalk.exit
#0:	       ldm.s	r15, 4
	;;
#0:	       stx	r31 -> $ro
#1:	       ldm.s	r15, 8
	;;
#0:	       stx	r31 -> $rb
#1:	       ldm.s	r15, 12
	;;
#0:	       or	r31, 0 -> r14
#1:	       ldm.s	r15, 16
	;;
#0:	       or	r31, 0 -> r13
#1:	       ldm.s	r15, 20
	;;
#0:	       or	r31, 0 -> r12
#1:	       ldm.s	r15, 24
	;;
#0:	       or	r31, 0 -> r11
#1:	       ldm.s	r15, 28
#2:	       addi	48 -> r15
	;;
#0:	       jop	ret
#1:	       or	r31, 0 -> r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
__cleanup_r_end:
.tmp12:
	.size	__cleanup_r, .tmp12-__cleanup_r

	.type	___sprint_r,@function
___sprint_r:                            ; @__sprint_r
	.funsz	___sprint_r_end-___sprint_r
___sprint_r_start:
; BB#0:
#0:	       wb.s	r15, 18
#1:	       addi	-72 -> r15
#2:	       ldx	$rb, 0 -> r2
#3:	       ldx	$ro, 0 -> r3
	;;
#0:	       stm.s	r10, r15, 13
	;;
#0:	       stm.s	r11, r15, 12
	;;
#0:	       stm.s	r12, r15, 11
	;;
#0:	       stm.s	r13, r15, 10
	;;
#0:	       stm.s	r14, r15, 9
#1:	       or	r1, 0 -> r14
	;;
#0:	       stm.s	r0.23, r15, 8
	;;
#2:	       stm.s	r2.23, r15, 7
	;;
#3:	       stm.s	r3.23, r15, 6
#2:	       or	r0, 0 -> r2.23
	;;
#2:	       stm.s	r2.24, r15, 5
	;;
#3:	       stm.s	r3.24, r15, 4
	;;
#3:	       stm.s	r3.25, r15, 3
	;;
#0:	       stm.s	r2, r15, 2
	;;
#0:	       stm.s	r3, r15, 1
	;;
#0:	       ldm.f	r14, 8
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       brz eq @	r0, .BB13_3
	;;
.BB13_1:
#2:	       ldm.f	r2.23, 101
	;;
#2:	       add	r2.23, 1 -> r1
	;;
#0:	       bbh	mzext8 r1 -> r1
	;;
#0:	       btest	r1, 5 -> !c1
	;;
#0:	if  c1 br @	.BB13_4
	;;
.BB13_2:
#3:	       ldi	255 -> r3.24
#0:	       br	.BB13_6
#1:	       ldm.f	r14, 0
	;;
#3:	       ldi	254 -> r3.23
	;;
#3:	       ldi	-4 -> r3.25
#2:	       or	r31, 0 -> r2.24
	;;
.BB13_3:
#0:	       ldi	0 -> r1
#1:	       br @	.BB13_24
#2:	       stm.a	0, r14, 1
	;;
.BB13_4:
#2:	       or	r2.23, 0 -> r0
#0:	       callg	___sfvwrite_r
#1:	       or	r14, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       br @	.BB13_23
#1:	       or	r0, 0 -> r1
	;;
.BB13_5:                                ;   in Loop: Header=BB13_6 Depth=1
#3:	       and	r13, r3.25 -> r0
#2:	       add	r2.24, 8 -> r2.24
#0:	       ldm.f	r14, 8
	;;
#0:	       sub	r31, r0 -> r0
	;;
#0:	       stm.a	r0, r14, 2
	;;
.BB13_6:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB13_8 Depth 2
#0:	       ldi	0 -> r1
#1:	       brz eq @	r0, .BB13_23
	;;
.BB13_7:                                ;   in Loop: Header=BB13_6 Depth=1
#2:	       ldm.f	r2.24, 0
#0:	       ldi	0 -> r10
	;;
#0:	       or	r31, 0 -> r0.23
#2:	       ldm.f	r2.24, 4
	;;
#0:	       sr	r31, 2 -> r12
#1:	       or	r31, 0 -> r13
	;;
.BB13_8:                                ;   Parent Loop BB13_6 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       cmp ge	r10, r12 -> c1
	;;
#0:	if  c1 br @	.BB13_5
	;;
.BB13_9:                                ;   in Loop: Header=BB13_8 Depth=2
#0:	       ldmr.f	r10, r0.23, 2
	;;
#0:	       or	r31, 0 -> r11
#2:	       ldm.f	r2.23, 12
	;;
#2:	       bbh	mzext16 r2.23 -> r1
	;;
#0:	       btest	r1, 13 -> c1
	;;
#0:	if  c1 br @	.BB13_11
	;;
.BB13_10:                               ;   in Loop: Header=BB13_8 Depth=2
#0:	       ldga	8192 -> r0
	;;
#0:	       or	r1, r0 -> r1
#1:	       ldga	8192 -> r0
	;;
#2:	       stmh.a	r1, r2.23, 6
	;;
#2:	       ldm.f	r2.23, 100
	;;
#0:	       or	r31, r0 -> r0
	;;
#2:	       stm.a	r0, r2.23, 25
	;;
.BB13_11:                               ;   in Loop: Header=BB13_8 Depth=2
#3:	       cmpu gt	r11, r3.24 -> c2
#0:	       sub	r11, 1 -> r0
	;;
#3:	       cmpu gt	r0, r3.23 -> c1
	;;
#0:	       comb	and c1, c2 -> c1
	;;
#0:	if  c1 br @	.BB13_22
	;;
.BB13_12:                               ; %_wcrtomb_r.exit.i
                                        ;   in Loop: Header=BB13_8 Depth=2
#2:	       ldm.f	r2.23, 8
	;;
#0:	       sub	r31, 1 -> r0
	;;
#2:	       stm.a	r0, r2.23, 2
#0:	       cmp gt	r0, -1 -> c1
	;;
#0:	if  c1 br @	.BB13_15
	;;
.BB13_13:                               ;   in Loop: Header=BB13_8 Depth=2
#2:	       ldm.f	r2.23, 24
	;;
#0:	       cmp lt	r0, r31 -> c1
	;;
#0:	if !c1 br @	.BB13_16
	;;
.BB13_14:                               ;   in Loop: Header=BB13_8 Depth=2
#0:	       bbh	zext8 r11 -> r0
#1:	       br @	.BB13_18
	;;
.BB13_15:                               ;   in Loop: Header=BB13_8 Depth=2
#2:	       ldm.f	r2.23, 0
	;;
#0:	       br	.BB13_20
#1:	       stmb.a	r11, r31, 0
	;;
#2:	       ldm.f	r2.23, 0
	;;
#0:	       add	r31, 1 -> r0
	;;
.BB13_16:                               ;   in Loop: Header=BB13_8 Depth=2
#2:	       ldm.f	r2.23, 0
	;;
#0:	       stmb.a	r11, r31, 0
	;;
#2:	       ldm.f	r2.23, 0
	;;
#0:	       or	r31, 0 -> r1
	;;
#0:	       ldm.f	r1, 0
	;;
#0:	       bbh	mzext8 r1 -> r0
	;;
#0:	       cmp eq	r0, 10 -> c1
	;;
#0:	if !c1 br @	.BB13_19
	;;
.BB13_17:                               ;   in Loop: Header=BB13_8 Depth=2
#0:	       ldi	10 -> r0
	;;
.BB13_18:                               ;   in Loop: Header=BB13_8 Depth=2
#2:	       or	r2.23, 0 -> r1
#0:	       callg	___swbuf_r
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       cmp eq	r0, -1 -> c1
#1:	       ldi	-1 -> r1
	;;
#0:	if  c1 br @	.BB13_23
#1:	if !c1 br @	.BB13_21
	;;
.BB13_19:                               ;   in Loop: Header=BB13_8 Depth=2
#0:	       add	r1, 1 -> r0
	;;
.BB13_20:                               ;   in Loop: Header=BB13_8 Depth=2
#2:	       stm.a	r0, r2.23, 0
	;;
.BB13_21:                               ; %_fputwc_r.exit
                                        ;   in Loop: Header=BB13_8 Depth=2
#0:	       cmp eq	r11, -1 -> c1
#1:	       add	r10, 1 -> r10
#2:	       ldi	-1 -> r1
	;;
#0:	if  c1 br @	.BB13_23
#1:	if !c1 br @	.BB13_8
	;;
.BB13_22:
#2:	       stm.a	0, r2.23, 23
#0:	       ldga	_impure_data -> r2
#1:	       ldi	138 -> r0
#3:	       ldi	64 -> r3
	;;
#0:	       stm.a	r0, r2, 0
#1:	       or	r1, r3 -> r0
#2:	       ldi	-1 -> r1
	;;
#2:	       stmh.a	r0, r2.23, 6
	;;
.BB13_23:                               ; %.loopexit
#0:	       stm.a	0, r14, 2
	;;
#0:	       stm.a	0, r14, 1
	;;
.BB13_24:
#0:	       ldm.s	r15, 4
#1:	       or	r1, 0 -> r0
	;;
#0:	       stx	r31 -> $ro
#1:	       ldm.s	r15, 8
	;;
#0:	       stx	r31 -> $rb
#1:	       ldm.s	r15, 12
	;;
#3:	       or	r31, 0 -> r3.25
#0:	       ldm.s	r15, 16
	;;
#3:	       or	r31, 0 -> r3.24
#0:	       ldm.s	r15, 20
	;;
#2:	       or	r31, 0 -> r2.24
#0:	       ldm.s	r15, 24
	;;
#3:	       or	r31, 0 -> r3.23
#0:	       ldm.s	r15, 28
	;;
#2:	       or	r31, 0 -> r2.23
#0:	       ldm.s	r15, 32
	;;
#0:	       or	r31, 0 -> r0.23
#1:	       ldm.s	r15, 36
	;;
#0:	       or	r31, 0 -> r14
#1:	       ldm.s	r15, 40
	;;
#0:	       or	r31, 0 -> r13
#1:	       ldm.s	r15, 44
	;;
#0:	       or	r31, 0 -> r12
#1:	       ldm.s	r15, 48
	;;
#0:	       or	r31, 0 -> r11
#1:	       ldm.s	r15, 52
#2:	       addi	72 -> r15
	;;
#0:	       jop	ret
#1:	       or	r31, 0 -> r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
___sprint_r_end:
.tmp13:
	.size	___sprint_r, .tmp13-___sprint_r

	.type	___ssprint_r,@function
___ssprint_r:                           ; @__ssprint_r
	.funsz	___ssprint_r_end-___ssprint_r
___ssprint_r_start:
; BB#0:
#0:	       wb.s	r15, 18
#1:	       addi	-72 -> r15
#2:	       ldx	$rb, 0 -> r2
#3:	       ldx	$ro, 0 -> r3
	;;
#0:	       stm.s	r10, r15, 13
	;;
#0:	       stm.s	r11, r15, 12
	;;
#0:	       stm.s	r12, r15, 11
	;;
#0:	       stm.s	r13, r15, 10
	;;
#0:	       stm.s	r14, r15, 9
#1:	       or	r1, 0 -> r14
	;;
#2:	       stm.s	r2.23, r15, 8
	;;
#3:	       stm.s	r3.23, r15, 7
	;;
#2:	       stm.s	r2.24, r15, 6
#3:	       or	r0, 0 -> r3.23
	;;
#3:	       stm.s	r3.24, r15, 5
	;;
#2:	       stm.s	r2.25, r15, 4
	;;
#2:	       stm.s	r2.26, r15, 3
	;;
#0:	       stm.s	r2, r15, 2
	;;
#0:	       stm.s	r3, r15, 1
	;;
#0:	       ldm.f	r14, 8
	;;
#0:	       cmp eq	r31, 0 -> c3
	;;
#0:	if  c3 br @	.BB14_38
	;;
.BB14_1:                                ; %.preheader
#2:	       ldi	0 -> r2.23
#3:	       ldiu	1152 -> r3.24
#0:	       ldm.f	r14, 0
#1:	       ldiu	895 -> r13
	;;
#0:	       br	.BB14_3
	;;
#2:	       ldi	0 -> r2.24
#0:	       ldim	31 -> r13
#1:	       ldi	128 -> r12
#3:	       ldi	0 -> r1
	;;
#0:	       or	r31, 0 -> r10
	;;
.BB14_2:                                ;   in Loop: Header=BB14_3 Depth=1
#0:	       ldm.f	r10, 4
#1:	       add	r10, 8 -> r0
	;;
#0:	       or	r31, 0 -> r1
#1:	       ldm.f	r10, 0
#2:	       or	r0, 0 -> r10
	;;
#2:	       or	r31, 0 -> r2.24
	;;
.BB14_3:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB14_25 Depth 2
                                        ;     Child Loop BB14_19 Depth 2
                                        ;     Child Loop BB14_16 Depth 2
                                        ;     Child Loop BB14_14 Depth 2
                                        ;     Child Loop BB14_35 Depth 2
                                        ;     Child Loop BB14_33 Depth 2
                                        ;     Child Loop BB14_31 Depth 2
#2:	       or	r1, 0 -> r2.25
	;;
#2:	       brz eq @	r2.25, .BB14_2
	;;
.BB14_4:                                ;   in Loop: Header=BB14_3 Depth=1
#3:	       ldm.f	r3.23, 8
	;;
#2:	       cmpu lt	r2.25, r31 -> c1
#0:	       or	r31, 0 -> r2
	;;
#0:	if  c1 br @	.BB14_22
	;;
.BB14_5:                                ;   in Loop: Header=BB14_3 Depth=1
#3:	       ldm.f	r3.23, 12
	;;
#3:	       bbh	mzext16 r3.23 -> r3
	;;
#3:	       and	r3, r3.24 -> r0
	;;
#0:	       brz eq @	r0, .BB14_22
	;;
.BB14_6:                                ;   in Loop: Header=BB14_3 Depth=1
#3:	       ldm.f	r3.23, 16
#0:	       btest	r3, 10 -> !c1
	;;
#0:	       or	r31, 0 -> r2
	;;
#3:	       ldm.f	r3.23, 0
	;;
#2:	       sub	r31, r2 -> r2.26
#3:	       ldm.f	r3.23, 20
	;;
#2:	       add	r2.25, r2.26 -> r0
	;;
#0:	       mul	r31, 3 -> $mul0.0
#1:	       add	r0, 1 -> r11
	;;
#0:	       ldx	$mul0.0, 0 -> r0
	;;
#0:	       sr	r0, 31 -> r0
	;;
#0:	       ldx	$mul0.0, r0 -> r1
	;;
#0:	if !c1 br	.BB14_10
#1:	       sra	r1, 1 -> r0
	;;
#0:	       cmpu lt	r0, r11 -> c2
	;;
#0:	if !c2 sra	r1, 1 -> r11 ; aiaf
	;;
.BB14_7:                                ;   in Loop: Header=BB14_3 Depth=1
#0:	       or	r2, 0 -> r0
#1:	       callg	__realloc_r
#2:	       or	r11, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r1
	;;
#0:	       brz ne @	r1, .BB14_21
	;;
.BB14_8:
#0:	       callg	__free_r
	;;
#3:	       ldm.f	r3.23, 16
	;;
#0:	       or	r31, 0 -> r0
	;;
	       nop	0
	;;
.BB14_9:                                ; %.loopexit
#0:	       ldga	_impure_data -> r0
	;;
#0:	       stm.a	12, r0, 0
#1:	       ldi	64 -> r0
	;;
#3:	       ldm.f	r3.23, 12
	;;
#3:	       bbh	mzext16 r3.23 -> r1
	;;
#0:	       or	r1, r0 -> r0
	;;
#0:	       br	.BB14_39
#3:	       stmh.a	r0, r3.23, 6
#1:	       ldi	-1 -> r0
	;;
#0:	       stm.a	0, r14, 2
	;;
#0:	       stm.a	0, r14, 1
	;;
.BB14_10:                               ;   in Loop: Header=BB14_3 Depth=1
#0:	       or	r11, 0 -> r0
#1:	       callg	__malloc_r
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r1
	;;
#0:	       brz eq @	r1, .BB14_9
	;;
.BB14_11:                               ;   in Loop: Header=BB14_3 Depth=1
#2:	       cmpu lt	r2.26, 16 -> c1
#3:	       ldm.f	r3.23, 16
	;;
#0:	if  c1 br @	.BB14_17
#1:	       or	r31, 0 -> r5
	;;
.BB14_12:                               ;   in Loop: Header=BB14_3 Depth=1
#0:	       or	r5, r1 -> r0
	;;
#0:	       and	r0, 3 -> r0
	;;
#0:	       brz ne @	r0, .BB14_17
	;;
.BB14_13:                               ;   in Loop: Header=BB14_3 Depth=1
#2:	       cmpu gt	r2.26, 15 -> c1
#0:	       or	r1, 0 -> r3
#1:	       or	r5, 0 -> r2
#3:	       or	r1, 0 -> r0
	;;
#0:	if !c1 br @	.BB14_16
#2:	       or	r2.26, 0 -> r4
	;;
.BB14_14:                               ; %.lr.ph10.i
                                        ;   Parent Loop BB14_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r2, 0
#1:	       sub	r4, 16 -> r4
#2:	       add	r0, 16 -> r3
#3:	       add	r2, 16 -> r5
	;;
#0:	       cmpu gt	r4, 15 -> c1
	;;
#0:	       stm.a	r31, r0, 0
	;;
#0:	       ldm.f	r2, 4
	;;
#0:	       stm.a	r31, r0, 1
	;;
#0:	       ldm.f	r2, 8
	;;
#0:	if !c1 br	.BB14_16
#1:	if  c1 br	.BB14_14
#2:	       stm.a	r31, r0, 2
	;;
#0:	       ldm.f	r2, 12
#1:	       or	r5, 0 -> r2
	;;
#0:	       stm.a	r31, r0, 3
#1:	       or	r3, 0 -> r0
	;;
.BB14_15:                               ; %.lr.ph.i
                                        ;   in Loop: Header=BB14_16 Depth=2
#0:	       ldm.f	r5, 0
#1:	       add	r5, 4 -> r5
#2:	       sub	r4, 4 -> r4
	;;
#0:	       stm.a	r31, r3, 0
#1:	       add	r3, 4 -> r3
	;;
.BB14_16:                               ; %.lr.ph.i
                                        ;   Parent Loop BB14_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       cmpu gt	r4, 3 -> c1
	;;
#0:	if !c1 br @	.BB14_18
#1:	if  c1 br @	.BB14_15
	;;
.BB14_17:                               ;   in Loop: Header=BB14_3 Depth=1
#2:	       or	r2.26, 0 -> r4
#0:	       or	r1, 0 -> r3
	;;
.BB14_18:                               ; %.preheader14.i
                                        ;   in Loop: Header=BB14_3 Depth=1
#0:	       brz eq @	r4, .BB14_20
	;;
.BB14_19:                               ; %.lr.ph18.i
                                        ;   Parent Loop BB14_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r5, 0
#1:	       sub	r4, 1 -> r4
	;;
#0:	       brz ne	r4, .BB14_19
#1:	       bbh	mzext8 r5 -> r0
#2:	       add	r5, 1 -> r5
	;;
#0:	       stmb.a	r0, r3, 0
#1:	       add	r3, 1 -> r3
	;;
	       nop	0
	;;
.BB14_20:                               ; %memcpy.exit
                                        ;   in Loop: Header=BB14_3 Depth=1
#3:	       ldm.f	r3.23, 12
	;;
#3:	       bbh	mzext16 r3.23 -> r0
	;;
#0:	       and	r0, r13 -> r0
	;;
#0:	       or	r0, r12 -> r0
	;;
#3:	       stmh.a	r0, r3.23, 6
	;;
.BB14_21:                               ;   in Loop: Header=BB14_3 Depth=1
#3:	       stm.a	r1, r3.23, 4
#2:	       add	r1, r2.26 -> r0
	;;
#3:	       stm.a	r0, r3.23, 0
#2:	       or	r2.25, 0 -> r2
	;;
#3:	       stm.a	r11, r3.23, 5
#2:	       sub	r11, r2.26 -> r0
	;;
#3:	       stm.a	r0, r3.23, 2
	;;
.BB14_22:                               ; %._crit_edge
                                        ;   in Loop: Header=BB14_3 Depth=1
#3:	       ldm.f	r3.23, 0
#2:	       cmpu lt	r2.25, r2 -> c1
#0:	       or	r2, 0 -> r5
	;;
#2:	if  c1 or	r2.25, 0 -> r5
	;;
#2:	       cmpu ge	r2.24, r31 -> c1
#0:	       or	r31, 0 -> r4
	;;
#2:	if !c1 add	r2.24, r5 -> r0
	;;
#0:	if !c1 cmpu le	r0, r4 -> c1
	;;
#0:	if  c1 br @	.BB14_26
	;;
.BB14_23:                               ;   in Loop: Header=BB14_3 Depth=1
#0:	       brz eq @	r5, .BB14_36
	;;
.BB14_24:                               ; %.lr.ph24.i
                                        ;   in Loop: Header=BB14_3 Depth=1
#2:	       xor	r2.25, -1 -> r1
#0:	       xor	r2, -1 -> r0
	;;
#0:	       cmpu gt	r0, r1 -> c1
	;;
#2:	if !c1 xor	r2.25, -1 -> r0 ; aiaf
	;;
#2:	       sub	r2.23, r0 -> r2
	;;
.BB14_25:                               ;   Parent Loop BB14_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#2:	       add	r2.24, r2 -> r1
#0:	       add	r4, r2 -> r3
#1:	       sub	r2, 1 -> r2
	;;
#0:	       cmp eq	r2, 1 -> c1
#1:	       ldm.f	r1, -2
#2:	       sub	r1, 2 -> r0
	;;
#0:	if  c1 br	.BB14_36
#1:	if !c1 br	.BB14_25
#2:	       bbh	mzext8 r0 -> r1
#3:	       sub	r3, 2 -> r0
	;;
#0:	       stmb.a	r1, r0, 0
	;;
	       nop	0
	;;
.BB14_26:                               ;   in Loop: Header=BB14_3 Depth=1
#0:	       cmpu lt	r5, 16 -> c1
	;;
#0:	if  c1 br @	.BB14_29
	;;
.BB14_27:                               ;   in Loop: Header=BB14_3 Depth=1
#2:	       or	r4, r2.24 -> r0
	;;
#0:	       and	r0, 3 -> r0
	;;
#0:	       brz ne @	r0, .BB14_29
	;;
.BB14_28:                               ;   in Loop: Header=BB14_3 Depth=1
#2:	       or	r2.24, 0 -> r2
#0:	       br	.BB14_31
#1:	       cmpu gt	r5, 15 -> c1
#3:	       or	r5, 0 -> r3
	;;
#2:	       or	r2.24, 0 -> r1
	;;
	       nop	0
	;;
.BB14_29:                               ;   in Loop: Header=BB14_3 Depth=1
#2:	       or	r2.24, 0 -> r2
#0:	       br @	.BB14_34
#1:	       or	r5, 0 -> r3
	;;
.BB14_30:                               ; %.lr.ph10.i7
                                        ;   in Loop: Header=BB14_31 Depth=2
#0:	       ldm.f	r1, 0
#1:	       sub	r3, 16 -> r3
#2:	       add	r1, 16 -> r2
#3:	       add	r0, 16 -> r4
	;;
#0:	       cmpu gt	r3, 15 -> c1
	;;
#0:	       stm.a	r31, r0, 0
	;;
#0:	       ldm.f	r1, 4
	;;
#0:	       stm.a	r31, r0, 1
	;;
#0:	       ldm.f	r1, 8
	;;
#0:	       stm.a	r31, r0, 2
	;;
#0:	       ldm.f	r1, 12
#1:	       or	r2, 0 -> r1
	;;
#0:	       stm.a	r31, r0, 3
	;;
.BB14_31:                               ;   Parent Loop BB14_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       or	r4, 0 -> r0
#1:	if  c1 br @	.BB14_30
#2:	if !c1 br @	.BB14_33
	;;
.BB14_32:                               ; %.lr.ph.i10
                                        ;   in Loop: Header=BB14_33 Depth=2
#0:	       ldm.f	r2, 0
#1:	       add	r2, 4 -> r2
#2:	       sub	r3, 4 -> r3
	;;
#0:	       stm.a	r31, r4, 0
#1:	       add	r4, 4 -> r4
	;;
.BB14_33:                               ; %.lr.ph.i10
                                        ;   Parent Loop BB14_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       cmpu gt	r3, 3 -> c1
	;;
#0:	if  c1 br @	.BB14_32
	;;
.BB14_34:                               ; %.preheader14.i14
                                        ;   in Loop: Header=BB14_3 Depth=1
#0:	       brz eq @	r3, .BB14_36
	;;
.BB14_35:                               ; %.lr.ph18.i15
                                        ;   Parent Loop BB14_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r2, 0
#1:	       sub	r3, 1 -> r3
	;;
#0:	       brz ne	r3, .BB14_35
#1:	       bbh	mzext8 r2 -> r0
#2:	       add	r2, 1 -> r2
	;;
#0:	       stmb.a	r0, r4, 0
#1:	       add	r4, 1 -> r4
	;;
	       nop	0
	;;
.BB14_36:                               ; %memmove.exit
                                        ;   in Loop: Header=BB14_3 Depth=1
#3:	       ldm.f	r3.23, 8
#2:	       add	r2.24, r2.25 -> r2.24
#0:	       ldi	0 -> r1
	;;
#0:	       sub	r31, r5 -> r0
	;;
#3:	       stm.a	r0, r3.23, 2
	;;
#3:	       ldm.f	r3.23, 0
	;;
#0:	       add	r31, r5 -> r0
	;;
#3:	       stm.a	r0, r3.23, 0
	;;
#0:	       ldm.f	r14, 8
	;;
#2:	       cmp ne	r31, r2.25 -> c1
	;;
#0:	if  c1 br	.BB14_3
#2:	       sub	r31, r2.25 -> r0
	;;
#0:	       stm.a	r0, r14, 2
	;;
	       nop	0
	;;
.BB14_37:
#0:	       stm.a	0, r14, 2
	;;
.BB14_38:
#0:	       ldi	0 -> r0
#1:	       stm.a	0, r14, 1
	;;
.BB14_39:
#0:	       ldm.s	r15, 4
	;;
#0:	       stx	r31 -> $ro
#1:	       ldm.s	r15, 8
	;;
#0:	       stx	r31 -> $rb
#1:	       ldm.s	r15, 12
	;;
#2:	       or	r31, 0 -> r2.26
#0:	       ldm.s	r15, 16
	;;
#2:	       or	r31, 0 -> r2.25
#0:	       ldm.s	r15, 20
	;;
#3:	       or	r31, 0 -> r3.24
#0:	       ldm.s	r15, 24
	;;
#2:	       or	r31, 0 -> r2.24
#0:	       ldm.s	r15, 28
	;;
#3:	       or	r31, 0 -> r3.23
#0:	       ldm.s	r15, 32
	;;
#2:	       or	r31, 0 -> r2.23
#0:	       ldm.s	r15, 36
	;;
#0:	       or	r31, 0 -> r14
#1:	       ldm.s	r15, 40
	;;
#0:	       or	r31, 0 -> r13
#1:	       ldm.s	r15, 44
	;;
#0:	       or	r31, 0 -> r12
#1:	       ldm.s	r15, 48
	;;
#0:	       or	r31, 0 -> r11
#1:	       ldm.s	r15, 52
#2:	       addi	72 -> r15
	;;
#0:	       jop	ret
#1:	       or	r31, 0 -> r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
___ssprint_r_end:
.tmp14:
	.size	___ssprint_r, .tmp14-___ssprint_r

	.type	___swsetup_r,@function
___swsetup_r:                           ; @__swsetup_r
	.funsz	___swsetup_r_end-___swsetup_r
___swsetup_r_start:
; BB#0:
#0:	       wb.s	r15, 8
#1:	       addi	-32 -> r15
#2:	       ldx	$rb, 0 -> r1
#3:	       ldx	$ro, 0 -> r3
	;;
#0:	       stm.s	r10, r15, 3
	;;
#0:	       stm.s	r11, r15, 2
#1:	       or	r0, 0 -> r11
	;;
#0:	       stm.s	r1, r15, 1
	;;
#0:	       stm.s	r3, r15, 0
	;;
#0:	       ldmg.d	_impure_data+56
	;;
#0:	       brz ne @	r31, .BB15_2
	;;
.BB15_1:
#0:	       callg	___sinit
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB15_2:
#0:	       ldm.f	r11, 12
	;;
#0:	       bbh	msext16 r11 -> r3
	;;
#0:	       btest	r3, 3 -> c1
	;;
#0:	if  c1 br @	.BB15_11
	;;
.BB15_3:
#0:	       btest	r3, 4 -> !c1
#1:	       ldi	-1 -> r0
	;;
#0:	if  c1 br @	.BB15_27
	;;
.BB15_4:
#0:	       btest	r3, 2 -> !c1
	;;
#0:	if  c1 br @	.BB15_10
	;;
.BB15_5:
#0:	       ldm.f	r11, 48
	;;
#0:	       or	r31, 0 -> r1
	;;
#0:	       brz eq @	r1, .BB15_9
	;;
.BB15_6:
#0:	       s2add	r11, 16 -> r0
	;;
#0:	       cmp eq	r1, r0 -> c1
	;;
#0:	if  c1 br @	.BB15_8
	;;
.BB15_7:
#0:	       or	r1, 0 -> r0
#1:	       callg	__free_r
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldm.f	r11, 12
	;;
#0:	       bbh	mzext16 r11 -> r3
	;;
.BB15_8:
#0:	       stm.a	0, r11, 12
	;;
.BB15_9:
#0:	       ldiu	2011 -> r0
	;;
#0:	       ldim	31 -> r0
	;;
#0:	       and	r3, r0 -> r3
	;;
#0:	       stmh.a	r3, r11, 6
	;;
#0:	       stm.a	0, r11, 1
	;;
#0:	       ldm.f	r11, 16
	;;
#0:	       stm.a	r31, r11, 0
	;;
.BB15_10:
#0:	       or	r3, 8 -> r3
	;;
#0:	       stmh.a	r3, r11, 6
	;;
.BB15_11:                               ; %._crit_edge
#0:	       ldm.f	r11, 16
	;;
#0:	       brz ne @	r31, .BB15_21
	;;
.BB15_12:
#0:	       ldi	640 -> r0
#1:	       ldi	512 -> r2
	;;
#0:	       and	r3, r0 -> r1
	;;
#0:	       cmp eq	r1, r2 -> c1
	;;
#0:	if  c1 br @	.BB15_21
	;;
.BB15_13:
#0:	       btest	r3, 1 -> !c1
	;;
#0:	if !c1 br @	.BB15_20
	;;
.BB15_14:
#0:	       ldm.f	r11, 14
#1:	       add	r11, 2 -> r0
	;;
#0:	       bbh	msext16 r0 -> r0
	;;
#0:	       brz lt @	r0, .BB15_16
	;;
.BB15_15:                               ; %_fstat_r.exit.i
#0:	       ldga	_errno.b -> r0
#1:	       ldga	_impure_data -> r1
#2:	       ldi	88 -> r2
	;;
#0:	       stmb.a	1, r0, 0
	;;
#0:	       stm.a	r2, r1, 0
	;;
.BB15_16:
#0:	       ldga	2048 -> r0
#1:	       callg	__malloc_r
#2:	       btest	r3, 7 -> !c1
#3:	       ldi	64 -> r10
	;;
#0:	       or	r3, r0 -> r0
#1:	       ldiu	1024 -> r3
	;;
#0:	if  c1 or	r3, 0 -> r10
#1:	       stmh.a	r0, r11, 6
	;;
#0:	       or	r10, 0 -> r0
	;;
#0:	       or	r0, 0 -> r2
	;;
#0:	       brz eq @	r2, .BB15_18
	;;
.BB15_17:
#0:	       ldga	_impure_data -> r1
#1:	       ldga	__cleanup_r -> r0
	;;
#0:	       stm.a	r0, r1, 15
#1:	       ldi	128 -> r0
	;;
#0:	       ldm.f	r11, 12
	;;
#0:	       bbh	mzext16 r11 -> r1
	;;
#0:	       or	r1, r0 -> r3
	;;
#0:	       stmh.a	r3, r11, 6
	;;
#0:	       br	.BB15_21
#1:	       stm.a	r2, r11, 0
	;;
#0:	       stm.a	r2, r11, 4
	;;
#0:	       stm.a	r10, r11, 5
	;;
.BB15_18:
#0:	       ldm.f	r11, 12
	;;
#0:	       bbh	mzext16 r11 -> r3
	;;
#0:	       btest	r3, 9 -> c1
	;;
#0:	if  c1 br @	.BB15_21
	;;
.BB15_19:
#0:	       or	r3, 2 -> r3
	;;
#0:	       stmh.a	r3, r11, 6
	;;
.BB15_20:
#0:	       or	r11, 0 -> r0
	;;
#0:	       addi	67 -> r0
	;;
#0:	       stm.a	r0, r11, 0
	;;
#0:	       stm.a	r0, r11, 4
	;;
#0:	       stm.a	1, r11, 5
	;;
.BB15_21:                               ; %__smakebuf_r.exit
#0:	       btest	r3, 0 -> c1
	;;
#0:	if !c1 br @	.BB15_23
	;;
.BB15_22:
#0:	       stm.a	0, r11, 2
#1:	       ldi	0 -> r0
	;;
#0:	       br	.BB15_24
#1:	       ldm.f	r11, 20
	;;
#0:	       sub	r0, r31 -> r0
	;;
#0:	       stm.a	r0, r11, 6
	;;
.BB15_23:
#0:	       bbh	sext16 r3 -> r0
	;;
#0:	       btest	r0, 1 -> c1
#1:	       ldi	0 -> r0
	;;
#0:	if !c1 ldm.f	r11, 20
	;;
#0:	if !c1 or	r31, 0 -> r0
	;;
#0:	       stm.a	r0, r11, 2
	;;
.BB15_24:
#0:	       comb	and c1, !c1 -> c1
#1:	       ldm.f	r11, 16
	;;
#0:	       brz ne @	r31, .BB15_26
	;;
.BB15_25:
#0:	       sr	r3, 7 -> r0
	;;
#0:	       btest	r0, 0 -> c1
	;;
.BB15_26:
#0:	       ldx	$c1 -> r0
	;;
#0:	       sl	r0, 31 -> r0
	;;
#0:	       sra	r0, 31 -> r0
	;;
.BB15_27:
#0:	       ldm.s	r15, 0
	;;
#0:	       stx	r31 -> $ro
#1:	       ldm.s	r15, 4
	;;
#0:	       stx	r31 -> $rb
#1:	       ldm.s	r15, 8
	;;
#0:	       or	r31, 0 -> r11
#1:	       ldm.s	r15, 12
#2:	       addi	32 -> r15
	;;
#0:	       jop	ret
#1:	       or	r31, 0 -> r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
___swsetup_r_end:
.tmp15:
	.size	___swsetup_r, .tmp15-___swsetup_r

	.type	__dtoa_r,@function
__dtoa_r:                               ; @_dtoa_r
	.funsz	__dtoa_r_end-__dtoa_r
__dtoa_r_start:
; BB#0:
#0:	       ldx	$f10 -> r0.30
#1:	       wb.s	r15, 92
#2:	       addi	-368 -> r15
#3:	       ldiu	256 -> r4
	;;
#1:	       ldx	$f11 -> r1.30
#0:	       add	r15, r4 -> r4
#2:	       ldm.f	r15, 376
	;;
#2:	       ldx	$f12 -> r2.30
#0:	       stm.s	r10, r4, 23
	;;
#3:	       ldx	$f13 -> r3.30
#0:	       stm.s	r11, r4, 22
#1:	       or	r3, 0 -> r11
	;;
#0:	       stm.s	r12, r4, 21
#1:	       stx	r0 -> $f0
	;;
#0:	       stm.s	r13, r4, 20
#1:	       stx	r1 -> $f2
	;;
#0:	       stm.s	r14, r4, 19
#1:	       ldiu	128 -> r14
	;;
#0:	       stm.s	r0.23, r4, 18
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
#0:	       or	r31, 0 -> r0.25
	;;
#2:	       stm.s	r2.25, r4, 8
	;;
#3:	       stm.s	r3.25, r4, 7
	;;
#0:	       stm.s	r0.26, r4, 6
	;;
#1:	       stm.s	r1.26, r4, 5
	;;
#2:	       stm.s	r2.26, r4, 4
	;;
#3:	       stm.s	r3.26, r4, 3
	;;
#1:	       stm.s	r1.27, r4, 2
	;;
#2:	       stm.s	r2.27, r4, 1
#1:	       or	r2, 0 -> r1.27
#0:	       ldiu	128 -> r2
	;;
#3:	       stm.s	r3.27, r4, 0
#0:	       add	r15, r14 -> r4
#1:	       add	r15, r2 -> r2
	;;
#1:	       stm.s	r1.28, r4, 31
	;;
#3:	       stm.s	r3.28, r4, 30
	;;
#1:	       stm.s	r1.29, r4, 29
	;;
#0:	       stm.s	r0.30, r4, 28
	;;
#1:	       stm.s	r1.30, r4, 27
#0:	       ldx	$f14 -> r0.30
	;;
#2:	       stm.s	r2.30, r4, 26
#1:	       ldx	$f15 -> r1.30
	;;
#3:	       stm.s	r3.30, r4, 25
#2:	       ldx	$rb, 0 -> r2.30
	;;
#0:	       stm.s	r0.30, r4, 24
#3:	       ldx	$ro, 0 -> r3.30
	;;
#1:	       stm.s	r1.30, r4, 23
	;;
#2:	       stm.s	r2.30, r4, 22
	;;
#3:	       stm.s	r3.30, r4, 21
#0:	       fop	fmov	f2 -> f1
	;;
#0:	       stm.a	r0, r2, 18
#1:	       ldiu	192 -> r0
#2:	       ldx	$f1 -> r1
	;;
#0:	       add	r15, r0 -> r2
	;;
#0:	       add	r2, 8 -> r3
	;;
#0:	       or	r3, 4 -> r0
	;;
#0:	       stm.a	r1, r0, 0
	;;
#0:	       ldm.f	r0, 0
	;;
#0:	       or	r31, 0 -> r14
#1:	       ldm.f	r15, 372
	;;
#0:	       or	r31, 0 -> r4
#1:	       ldm.f	r15, 368
	;;
#0:	       or	r31, 0 -> r0.26
#1:	       ldmg.d	_impure_data+64
	;;
#0:	       or	r31, 0 -> r3
#1:	       ldm.f	r15, 200
	;;
#0:	       brz eq @	r3, .BB16_2
#3:	       or	r31, 0 -> r3.23
	;;
.BB16_1:                                ; %_Bfree.exit
#0:	       ldmg.d	_impure_data+68
#1:	       ldi	1 -> r0
#2:	       ldga	_impure_data -> r1
	;;
#0:	       or	r31, 0 -> r2
	;;
#0:	       stm.a	r2, r3, 1
	;;
#0:	       ldmg.d	_impure_data+68
	;;
#0:	       sl	r0, r31 -> r0
	;;
#0:	       stm.a	r0, r3, 2
	;;
#0:	       ldmg.d	_impure_data+76
	;;
#0:	       ldmr.f	r2, r31, 2
	;;
#0:	       stm.a	r31, r3, 0
	;;
#0:	       ldmg.d	_impure_data+76
	;;
#0:	       s2add	r31, r2 -> r2
	;;
#0:	       stm.a	r3, r2, 0
	;;
#0:	       stm.a	0, r1, 16
	;;
.BB16_2:
#0:	       cmp gt	r14, -1 -> c1
	;;
#0:	if !c1 br @	.BB16_4
	;;
.BB16_3:
#0:	       stm.a	0, r4, 0
#1:	       br @	.BB16_5
	;;
.BB16_4:
#0:	       ldiu	2047 -> r0
#1:	       stm.a	1, r4, 0
	;;
#0:	       ldim	1023 -> r0
	;;
#0:	       ldih	1023 -> r0
	;;
#0:	       and	r14, r0 -> r14
	;;
.BB16_5:
#0:	       ldga	1048576 -> r1
	;;
#0:	       ldih	1023 -> r1
	;;
#0:	       and	r14, r1 -> r0
	;;
#0:	       stm.s	r0, r15, 3
	;;
#0:	       ldm.s	r15, 12
	;;
#0:	       or	r31, 0 -> r3
	;;
#0:	       cmp ne	r3, r1 -> c1
	;;
#0:	if  c1 br @	.BB16_10
	;;
.BB16_6:
#0:	       ldiu	1807 -> r0
#1:	       ldga	._.str176 -> r3
	;;
#3:	       brz ne	r3.23, .BB16_8
#0:	       ldim	4 -> r0
	;;
#0:	       stm.a	r0, r0.26, 0
	;;
#0:	       stm.s	r3, r15, 7
	;;
.BB16_7:
#0:	       ldiu	2047 -> r0
#1:	       ldm.s	r15, 28
#2:	       ldga	._.str75 -> r1
	;;
#0:	       ldim	511 -> r0
	;;
#0:	       and	r14, r0 -> r0
#1:	       or	r31, 0 -> r3
	;;
#0:	       cmp eq	r0, 0 -> c1
	;;
#0:	if  c1 or	r1, 0 -> r3
	;;
#0:	       stm.s	r3, r15, 7
	;;
.BB16_8:
#0:	       cmp eq	r0.25, 0 -> c3
	;;
#0:	if  c3 br @	.BB16_426
	;;
.BB16_9:
#0:	       ldm.s	r15, 28
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldm.s	r15, 28
	;;
#0:	       add	r0, 3 -> r1
	;;
#0:	       or	r31, 0 -> r3
	;;
#0:	       ldm.f	r3, 3
	;;
#0:	       bbh	mzext8 r1 -> r0
#1:	       ldm.s	r15, 28
	;;
#0:	       cmp ne	r0, 0 -> c1
	;;
#0:	       or	r31, 0 -> r2
#1:	       ldm.s	r15, 28
	;;
#0:	       add	r2, 8 -> r1
	;;
#0:	       br	.BB16_426
#1:	       or	r31, 0 -> r3
	;;
#0:	if !c1 add	r3, 3 -> r1 ; aiaf
	;;
#0:	       stm.a	r1, r0.25, 0
	;;
.BB16_10:
#0:	       ldiu	192 -> r1
#1:	       fop	dzero -> d7
	;;
#0:	       add	r15, r1 -> r1
	;;
#0:	       add	r1, 0 -> r0
#1:	       ldiu	128 -> r1
	;;
#0:	       or	r0, 4 -> r0
#1:	       add	r15, r1 -> r1
	;;
#0:	       stm.a	r14, r0, 0
	;;
#3:	       stm.a	r3.23, r1, 16
	;;
#0:	       ldm.f	r15, 192
	;;
#0:	       stx	r31 -> $f10
#1:	       ldm.f	r0, 0
	;;
#0:	       stx	r31 -> $f0
	;;
#0:	       fop	fmov	f0 -> f11
	;;
#0:	       fop	dcmp	d5, d7 -> f0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r3
	;;
#0:	       btest	r3, 9 -> c1
	;;
#0:	if !c1 br @	.BB16_18
	;;
.BB16_11:
#0:	       ldmg.d	_impure_data+76
	;;
#0:	       brz ne @	r31, .BB16_36
#1:	       or	r31, 0 -> r3
	;;
.BB16_12:
#0:	       ldi	132 -> r0
#1:	       callg	__malloc_r
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r3
	;;
#0:	       brz eq @	r3, .BB16_20
	;;
.BB16_13:
#0:	       ldm.f	r3, -4
#1:	       ldi	-4 -> r0
	;;
#0:	       sub	r31, 4 -> r1
	;;
#0:	       and	r1, r0 -> r2
#1:	       ldi	36 -> r1
	;;
#0:	       cmpu gt	r2, r1 -> c1
	;;
#0:	if  c1 br @	.BB16_21
	;;
.BB16_14:
#0:	       cmpu lt	r2, 20 -> c1
#1:	       or	r3, 0 -> r0
	;;
#0:	if  c1 br @	.BB16_30
	;;
.BB16_15:
#0:	       cmpu lt	r2, 28 -> c1
#1:	       stm.a	0, r3, 0
	;;
#0:	if  c1 br @	.BB16_28
#1:	       stm.a	0, r3, 1
	;;
.BB16_16:
#0:	       ldi	36 -> r0
#1:	       stm.a	0, r3, 2
	;;
#0:	       cmpu lt	r2, r0 -> c1
#1:	       stm.a	0, r3, 3
	;;
#0:	if  c1 br @	.BB16_29
	;;
.BB16_17:
#0:	       add	r3, 24 -> r0
#1:	       br	.BB16_30
#2:	       stm.a	0, r3, 4
	;;
#0:	       stm.a	0, r3, 5
	;;
	       nop	0
	;;
.BB16_18:
#0:	       cmp eq	r0.25, 0 -> c3
#1:	       ldga	._.str277 -> r0
	;;
#1:	if  c3 br	.BB16_426
#0:	       stm.a	1, r0.26, 0
	;;
#0:	       stm.s	r0, r15, 7
	;;
	       nop	0
	;;
.BB16_19:
#0:	       ldga	._.str277 -> r0
#1:	       br	.BB16_426
	;;
#0:	       add	r0, 1 -> r0
	;;
#0:	       stm.a	r0, r0.25, 0
	;;
.BB16_20:                               ; %_calloc_r.exit.i.thread
#0:	       ldi	0 -> r13
#1:	       br	.BB16_60
#2:	       ldga	_impure_data -> r0
	;;
#0:	       stm.a	0, r0, 19
	;;
	       nop	0
	;;
.BB16_21:
#0:	       or	r3, 0 -> r0
#1:	       br @	.BB16_23
	;;
.BB16_22:                               ;   in Loop: Header=BB16_23 Depth=1
#0:	       stmb.a	0, r0, 0
#1:	       add	r0, 1 -> r0
#2:	       sub	r2, 1 -> r2
	;;
.BB16_23:                               ; %.preheader234
                                        ; =>This Inner Loop Header: Depth=1
#0:	       and	r0, 3 -> r1
	;;
#0:	       brz eq @	r1, .BB16_25
	;;
.BB16_24:                               ;   in Loop: Header=BB16_23 Depth=1
#0:	       brz ne @	r2, .BB16_22
	;;
#0:	       brz eq @	r2, .BB16_35
	;;
.BB16_25:
#0:	       cmpu lt	r2, 4 -> c1
	;;
#0:	if  c1 br @	.BB16_33
	;;
.BB16_26:
#0:	       cmpu gt	r2, 15 -> c1
	;;
#0:	if !c1 br @	.BB16_31
	;;
.BB16_27:                               ; %.lr.ph8.i.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sub	r2, 16 -> r2
#1:	       stm.a	0, r0, 3
	;;
#0:	       cmpu gt	r2, 15 -> c1
#1:	       stm.a	0, r0, 2
	;;
#0:	if !c1 br	.BB16_32
#1:	if  c1 br	.BB16_27
#2:	       stm.a	0, r0, 1
	;;
#0:	       stm.a	0, r0, 0
#1:	       add	r0, 16 -> r0
	;;
	       nop	0
	;;
.BB16_28:
#0:	       add	r3, 8 -> r0
#1:	       br @	.BB16_30
	;;
.BB16_29:
#0:	       add	r3, 16 -> r0
	;;
.BB16_30:
#0:	       stm.a	0, r0, 0
#1:	       br	.BB16_35
	;;
#0:	       stm.a	0, r0, 1
	;;
#0:	       stm.a	0, r0, 2
	;;
.BB16_31:                               ; %.lr.ph.i.i
#0:	       stm.a	0, r0, 0
#1:	       add	r0, 4 -> r0
#2:	       sub	r2, 4 -> r2
	;;
.BB16_32:                               ; %.lr.ph.i.i
#0:	       cmpu gt	r2, 3 -> c1
	;;
#0:	if  c1 br @	.BB16_31
	;;
.BB16_33:                               ; %.preheader11.i.i
#0:	       brz eq @	r2, .BB16_35
	;;
.BB16_34:                               ; %.lr.ph14.i.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       stmb.a	0, r0, 0
#1:	       add	r0, 1 -> r0
#2:	       sub	r2, 1 -> r2
	;;
#0:	       brz ne @	r2, .BB16_34
	;;
.BB16_35:                               ; %_calloc_r.exit.i
#0:	       ldga	_impure_data -> r0
	;;
#0:	       stm.a	r3, r0, 19
	;;
.BB16_36:
#0:	       ldm.f	r3, 4
	;;
#0:	       or	r31, 0 -> r2
	;;
#0:	       brz eq @	r2, .BB16_38
	;;
.BB16_37:
#0:	       ldm.f	r2, 0
#1:	       br	.BB16_59
	;;
#0:	       stm.a	r31, r3, 1
	;;
	       nop	0
	;;
.BB16_38:
#0:	       ldi	28 -> r0
#1:	       callg	__malloc_r
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r2
#1:	       ldi	0 -> r13
	;;
#0:	       brz eq @	r2, .BB16_60
	;;
.BB16_39:
#0:	       ldm.f	r2, -4
#1:	       ldi	-4 -> r0
	;;
#0:	       sub	r31, 4 -> r1
	;;
#0:	       and	r1, r0 -> r3
#1:	       ldi	36 -> r1
	;;
#0:	       cmpu gt	r3, r1 -> c1
	;;
#0:	if  c1 br @	.BB16_44
	;;
.BB16_40:
#0:	       cmpu lt	r3, 20 -> c1
#1:	       or	r2, 0 -> r0
	;;
#0:	if  c1 br @	.BB16_53
	;;
.BB16_41:
#0:	       cmpu lt	r3, 28 -> c1
#1:	       stm.a	0, r2, 0
	;;
#0:	if  c1 br @	.BB16_51
#1:	       stm.a	0, r2, 1
	;;
.BB16_42:
#0:	       ldi	36 -> r0
#1:	       stm.a	0, r2, 2
	;;
#0:	       cmpu lt	r3, r0 -> c1
#1:	       stm.a	0, r2, 3
	;;
#0:	if  c1 br @	.BB16_52
	;;
.BB16_43:
#0:	       add	r2, 24 -> r0
#1:	       br	.BB16_53
#2:	       stm.a	0, r2, 4
	;;
#0:	       stm.a	0, r2, 5
	;;
	       nop	0
	;;
.BB16_44:
#0:	       or	r2, 0 -> r0
#1:	       br @	.BB16_46
	;;
.BB16_45:                               ;   in Loop: Header=BB16_46 Depth=1
#0:	       stmb.a	0, r0, 0
#1:	       add	r0, 1 -> r0
#2:	       sub	r3, 1 -> r3
	;;
.BB16_46:                               ; %.preheader236
                                        ; =>This Inner Loop Header: Depth=1
#0:	       and	r0, 3 -> r1
	;;
#0:	       brz eq @	r1, .BB16_48
	;;
.BB16_47:                               ;   in Loop: Header=BB16_46 Depth=1
#0:	       brz ne @	r3, .BB16_45
	;;
#0:	       brz eq @	r3, .BB16_58
	;;
.BB16_48:
#0:	       cmpu lt	r3, 4 -> c1
	;;
#0:	if  c1 br @	.BB16_56
	;;
.BB16_49:
#0:	       cmpu gt	r3, 15 -> c1
	;;
#0:	if !c1 br @	.BB16_54
	;;
.BB16_50:                               ; %.lr.ph8.i10.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sub	r3, 16 -> r3
#1:	       stm.a	0, r0, 3
	;;
#0:	       cmpu gt	r3, 15 -> c1
#1:	       stm.a	0, r0, 2
	;;
#0:	if !c1 br	.BB16_55
#1:	if  c1 br	.BB16_50
#2:	       stm.a	0, r0, 1
	;;
#0:	       stm.a	0, r0, 0
#1:	       add	r0, 16 -> r0
	;;
	       nop	0
	;;
.BB16_51:
#0:	       add	r2, 8 -> r0
#1:	       br @	.BB16_53
	;;
.BB16_52:
#0:	       add	r2, 16 -> r0
	;;
.BB16_53:
#0:	       stm.a	0, r0, 0
#1:	       br	.BB16_58
	;;
#0:	       stm.a	0, r0, 1
	;;
#0:	       stm.a	0, r0, 2
	;;
.BB16_54:                               ; %.lr.ph.i13.i
#0:	       stm.a	0, r0, 0
#1:	       add	r0, 4 -> r0
#2:	       sub	r3, 4 -> r3
	;;
.BB16_55:                               ; %.lr.ph.i13.i
#0:	       cmpu gt	r3, 3 -> c1
	;;
#0:	if  c1 br @	.BB16_54
	;;
.BB16_56:                               ; %.preheader11.i19.i
#0:	       brz eq @	r3, .BB16_58
	;;
.BB16_57:                               ; %.lr.ph14.i22.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       stmb.a	0, r0, 0
#1:	       add	r0, 1 -> r0
#2:	       sub	r3, 1 -> r3
	;;
#0:	       brz ne @	r3, .BB16_57
	;;
.BB16_58:                               ; %_calloc_r.exit4.i
#0:	       stm.a	1, r2, 1
	;;
#0:	       stm.a	2, r2, 2
	;;
.BB16_59:
#0:	       stm.a	0, r2, 4
#1:	       or	r2, 0 -> r13
	;;
#0:	       stm.a	0, r2, 3
	;;
.BB16_60:                               ; %_Balloc.exit.i
#0:	       ldiu	2047 -> r4
#1:	       ldiu	0 -> r1
#2:	       ldiu	2047 -> r3
	;;
#0:	       ldim	511 -> r4
#1:	       ldim	512 -> r1
	;;
#0:	       and	r14, r4 -> r0
	;;
#0:	       stm.s	r0, r15, 4
	;;
#0:	       ldm.s	r15, 16
	;;
#0:	       or	r31, 0 -> r2
	;;
#0:	       or	r2, r1 -> r2
#1:	       sr	r14, 20 -> r1
	;;
#3:	       brz eq	r3.23, .BB16_65
#0:	       and	r1, r3 -> r1
	;;
#0:	       cmp ne	r1, 0 -> c1
	;;
#0:	if !c1 and	r14, r4 -> r2 ; aaaf
	;;
.BB16_61:
#3:	       and	r3.23, 7 -> r0
	;;
#0:	       brz eq @	r0, .BB16_69
	;;
.BB16_62:
#3:	       btest	r3.23, 0 -> c1
	;;
#0:	if  c1 br @	.BB16_88
#3:	       or	r3.23, 0 -> r3
	;;
.BB16_63:
#3:	       btest	r3.23, 1 -> !c1
	;;
#0:	if  c1 br @	.BB16_89
	;;
.BB16_64:
#3:	       sr	r3.23, 1 -> r3
#0:	       br @	.BB16_90
#1:	       ldi	1 -> r4
	;;
.BB16_65:
#0:	       and	r2, 7 -> r0
	;;
#0:	       brz eq @	r0, .BB16_77
	;;
.BB16_66:
#0:	       btest	r2, 0 -> c1
#1:	       ldi	0 -> r0
	;;
#0:	if  c1 br @	.BB16_95
	;;
.BB16_67:
#0:	       btest	r2, 1 -> !c1
	;;
#0:	if  c1 br @	.BB16_94
	;;
.BB16_68:
#0:	       sr	r2, 1 -> r2
#1:	       br @	.BB16_95
#2:	       ldi	1 -> r0
	;;
.BB16_69:
#3:	       bbh	zext16 r3.23 -> r0
	;;
#3:	       sr	r3.23, 16 -> r4
#0:	       cmp eq	r0, 0 -> c1
	;;
#3:	       or	r3.23, 0 -> r3
#0:	       ldx	$c1 -> r0
	;;
#0:	if  c1 or	r4, 0 -> r3
#1:	       sl	r0, 4 -> r5
	;;
#0:	       bbh	zext8 r3 -> r4
	;;
#0:	       brz ne @	r4, .BB16_71
	;;
.BB16_70:
#0:	       sr	r3, 8 -> r3
#1:	       or	r5, 8 -> r5
	;;
.BB16_71:
#0:	       and	r3, 15 -> r0
	;;
#0:	       brz ne @	r0, .BB16_73
	;;
.BB16_72:
#0:	       sr	r3, 4 -> r3
#1:	       add	r5, 4 -> r5
	;;
.BB16_73:
#0:	       and	r3, 3 -> r0
	;;
#0:	       brz ne @	r0, .BB16_75
	;;
.BB16_74:
#0:	       sr	r3, 2 -> r3
#1:	       add	r5, 2 -> r5
	;;
.BB16_75:
#0:	       btest	r3, 0 -> c1
	;;
#0:	if !c1 br @	.BB16_85
	;;
.BB16_76:
#0:	       or	r5, 0 -> r4
#1:	       br @	.BB16_87
	;;
.BB16_77:
#0:	       bbh	zext16 r2 -> r0
#1:	       sr	r2, 16 -> r3
#2:	       or	r2, 0 -> r5
	;;
#0:	       cmp eq	r0, 0 -> c1
	;;
#0:	if  c1 or	r3, 0 -> r5
#1:	       ldx	$c1 -> r0
	;;
#0:	       bbh	zext8 r5 -> r3
#1:	       sl	r0, 4 -> r4
	;;
#0:	       brz ne @	r3, .BB16_79
	;;
.BB16_78:
#0:	       sr	r5, 8 -> r5
#1:	       or	r4, 8 -> r4
	;;
.BB16_79:
#0:	       and	r5, 15 -> r0
	;;
#0:	       brz ne @	r0, .BB16_81
	;;
.BB16_80:
#0:	       sr	r5, 4 -> r5
#1:	       add	r4, 4 -> r4
	;;
.BB16_81:
#0:	       and	r5, 3 -> r0
	;;
#0:	       brz ne @	r0, .BB16_83
	;;
.BB16_82:
#0:	       sr	r5, 2 -> r5
#1:	       add	r4, 2 -> r4
	;;
.BB16_83:
#0:	       btest	r5, 0 -> c1
	;;
#0:	if !c1 br @	.BB16_92
	;;
.BB16_84:
#0:	       or	r4, 0 -> r0
#1:	       br @	.BB16_95
#2:	       or	r5, 0 -> r2
	;;
.BB16_85:
#0:	       sr	r3, 1 -> r0
#1:	       ldi	32 -> r4
	;;
#0:	       brz eq @	r0, .BB16_90
#3:	       or	r3.23, 0 -> r3
	;;
.BB16_86:
#0:	       add	r5, 1 -> r4
#1:	       or	r0, 0 -> r3
	;;
.BB16_87:                               ; %__lo0bits.exit.i
#0:	       brz ne @	r4, .BB16_90
	;;
.BB16_88:                               ; %__lo0bits.exit.thread29.i
#0:	       ldi	0 -> r4
#1:	       br @	.BB16_91
#2:	       stm.a	r3, r13, 5
	;;
.BB16_89:
#3:	       sr	r3.23, 2 -> r3
#0:	       ldi	2 -> r4
	;;
.BB16_90:                               ; %__lo0bits.exit.thread.i
#0:	       ldi	32 -> r0
	;;
#0:	       sub	r0, r4 -> r0
	;;
#0:	       sl	r2, r0 -> r0
#1:	       sr	r2, r4 -> r2
	;;
#0:	       or	r0, r3 -> r0
	;;
#0:	       stm.a	r0, r13, 5
	;;
.BB16_91:
#0:	       cmp ne	r2, 0 -> c1
#1:	       ldi	1 -> r6
#2:	       ldi	2 -> r0
#3:	       stm.a	r2, r13, 6
	;;
#0:	       br	.BB16_96
#1:	if  c1 or	r0, 0 -> r6
	;;
#0:	       stm.a	r6, r13, 4
	;;
	       nop	0
	;;
.BB16_92:
#0:	       sr	r5, 1 -> r3
#1:	       ldi	32 -> r0
	;;
#0:	       brz eq @	r3, .BB16_95
	;;
.BB16_93:
#0:	       add	r4, 1 -> r0
#1:	       br @	.BB16_95
#2:	       or	r3, 0 -> r2
	;;
.BB16_94:
#0:	       sr	r2, 2 -> r2
#1:	       ldi	2 -> r0
	;;
.BB16_95:                               ; %__lo0bits.exit16.i
#0:	       stm.a	r2, r13, 5
#1:	       s2add	r0, 8 -> r4
#2:	       ldi	1 -> r6
	;;
#0:	       stm.a	1, r13, 4
	;;
.BB16_96:
#0:	       brz eq @	r1, .BB16_98
	;;
.BB16_97:
#1:	       ldi	0 -> r1.29
#0:	       ldm.s	r15, 16
#2:	       ldiu	973 -> r3
#3:	       ldga	1048576 -> r0
	;;
#0:	       ldi	53 -> r2
#1:	       add	r1, r4 -> r5
#2:	       ldim	2047 -> r3
#3:	       ldih	511 -> r0
	;;
#0:	       br	.BB16_106
#1:	       sub	r2, r4 -> r1.25
#2:	       or	r31, 0 -> r2
#3:	       addi	-1023 -> r1
	;;
#1:	       add	r5, r3 -> r1.26
#0:	       or	r2, r0 -> r0
	;;
#3:	       or	r3.23, 0 -> r2
	;;
.BB16_98:
#0:	       s2add	r13, r6 -> r0
#1:	       ldiu	2047 -> r2
#2:	       ldi	16 -> r5
	;;
#0:	       ldm.f	r0, 16
#1:	       ldiu	2047 -> r0
#2:	       ldim	1023 -> r2
	;;
#0:	       ldim	31 -> r0
#1:	       or	r2, 0 -> r1
#2:	       ldih	127 -> r2
	;;
#0:	       cmpu gt	r31, r0 -> c2
#1:	       or	r31, 0 -> r3
#2:	       ldih	7 -> r1
#3:	       ldi	0 -> r0
	;;
#0:	if !c2 sl	r3, 16 -> r3 ; aiaf
#1:	if  c2 or	r0, 0 -> r5
#2:	       ldiu	2047 -> r0
	;;
#0:	       cmpu gt	r3, r1 -> c1
#1:	       ldim	1023 -> r0
#2:	       ldiu	974 -> r1
	;;
#0:	if !c1 sl	r3, 8 -> r3
#1:	if !c1 or	r5, 8 -> r5
#2:	       ldih	511 -> r0
#3:	       ldim	2047 -> r1
	;;
#1:	       add	r4, r1 -> r1.26
#0:	       cmpu gt	r3, r2 -> c2
#2:	       sl	r6, 5 -> r1
	;;
#0:	if !c2 sl	r3, 4 -> r3
#1:	if !c2 add	r5, 4 -> r5
	;;
#0:	       cmpu gt	r3, r0 -> c3
	;;
#0:	if !c3 sl	r3, 2 -> r3
#1:	if !c3 add	r5, 2 -> r5
	;;
#0:	       brz lt @	r3, .BB16_101
	;;
.BB16_99:
#0:	       btest	r3, 30 -> !c1
#1:	       ldi	32 -> r0
	;;
#0:	if  c1 br @	.BB16_102
	;;
.BB16_100:
#0:	       add	r5, 1 -> r0
#1:	       br @	.BB16_102
	;;
.BB16_101:
#0:	       or	r5, 0 -> r0
	;;
.BB16_102:
#1:	       sub	r1, r0 -> r1.25
#0:	       ldi	33 -> r0
	;;
#1:	       add	r1.25, r4 -> r1
	;;
#1:	       add	r1.25, r1.26 -> r3
#0:	       cmp lt	r1, r0 -> c1
	;;
#0:	if  c1 br @	.BB16_104
	;;
.BB16_103:
#0:	       ldiu	1042 -> r0
#1:	       ldi	-1010 -> r2
	;;
#0:	       add	r3, r0 -> r0
	;;
#0:	       br	.BB16_105
#3:	       sr	r3.23, r0 -> r1
#1:	       sub	r2, r3 -> r0
	;;
#0:	       sl	r14, r0 -> r0
	;;
#0:	       or	r0, r1 -> r0
	;;
.BB16_104:
#0:	       ldiu	1006 -> r0
	;;
#0:	       ldim	2047 -> r0
	;;
#0:	       sub	r0, r3 -> r0
	;;
#3:	       sl	r3.23, r0 -> r0
	;;
.BB16_105:
#1:	       ldi	1 -> r1.29
#0:	       ldiu	128 -> r4
#2:	       ldiu	160 -> r12
#3:	       ldga	1048576 -> r1
	;;
#0:	       add	r15, r4 -> r4
#1:	       ldih	537 -> r1
	;;
#0:	       stm.a	r0, r4, 12
#1:	       add	r15, r12 -> r4
#2:	       ldiu	0 -> r0
	;;
#0:	       add	r4, 16 -> r2
#1:	       ldim	512 -> r0
#2:	       ldiu	160 -> r4
	;;
#0:	       or	r2, 4 -> r2
#1:	       ldih	537 -> r0
#2:	       add	r15, r4 -> r4
	;;
#0:	       stm.a	r1, r2, 0
#1:	       ldiu	0 -> r1
#2:	       stx	r0 -> $f0
#3:	       ldga	1048576 -> r0
	;;
#0:	       ldim	0 -> r1
#1:	       ldm.f	r15, 176
#2:	       ldih	2032 -> r0
	;;
#0:	       ldih	0 -> r1
	;;
#0:	       stx	r1 -> $f4
#1:	       sub	r3, 1 -> r1
	;;
#0:	       stx	r31 -> $f2
	;;
#0:	       fop	fmov	f0 -> f5
#1:	       ldm.f	r2, 0
#2:	       add	r4, 24 -> r2
#3:	       ldiu	128 -> r4
	;;
#0:	       or	r2, 4 -> r3
#1:	       add	r15, r4 -> r4
	;;
#0:	       stx	r31 -> $f15
	;;
#0:	       fop	fmov	f15 -> f3
	;;
#0:	       fop	dsub	d1, d2 -> d0
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
#0:	       stm.a	r2, r4, 14
#1:	       ldx	$f1 -> r2
	;;
#0:	       stm.a	r2, r3, 0
	;;
#0:	       ldm.f	r3, 0
	;;
#0:	       add	r31, r0 -> r0
#1:	       ldm.f	r15, 184
	;;
#0:	       or	r31, 0 -> r2
	;;
.BB16_106:
#0:	       ldiu	160 -> r9
#1:	       ldiu	0 -> r8
#2:	       ldiu	0 -> r6
#3:	       ldiu	1959 -> r5
	;;
#0:	       add	r15, r9 -> r9
#1:	       ldim	0 -> r6
#2:	       ldim	768 -> r8
#3:	       ldiu	865 -> r4
	;;
#0:	       add	r9, 8 -> r3
#1:	       ldiu	128 -> r9
#2:	       ldih	0 -> r6
#3:	       ldih	1535 -> r8
	;;
#0:	       or	r3, 4 -> r7
#1:	       add	r15, r9 -> r9
#2:	       stx	r6 -> $f12
#3:	       ldiu	552 -> r6
	;;
#0:	       stm.a	r0, r7, 0
#1:	       ldiu	179 -> r0
#2:	       stx	r8 -> $f0
#3:	       ldim	488 -> r4
	;;
#0:	       stm.a	r2, r9, 10
#1:	       ldim	25 -> r0
#2:	       ldiu	507 -> r2
#3:	       ldim	592 -> r5
	;;
#0:	       ldm.f	r15, 168
#1:	       ldih	1115 -> r0
#2:	       ldim	1007 -> r2
#3:	       ldim	209 -> r6
	;;
#0:	       stx	r0 -> $f4
#1:	       ldih	644 -> r2
#2:	       ldih	795 -> r4
#3:	       ldih	510 -> r5
	;;
#0:	       or	r31, 0 -> r3
#1:	       ldm.f	r7, 0
#2:	       fop	fmov	f0 -> f13
#3:	       ldih	510 -> r6
	;;
#0:	       stx	r3 -> $f2
#1:	       ldiu	1043 -> r0
	;;
#0:	       stx	r31 -> $f4
#1:	       ldim	616 -> r0
	;;
#0:	       fop	fmov	f4 -> f3
#1:	       ldih	510 -> r0
	;;
#0:	       fop	dadd	d1, d6 -> d6
	;;
#0:	       stx	r2 -> $f6
	;;
#0:	       stx	r4 -> $f8
	;;
#0:	       stx	r5 -> $f5
	;;
#0:	       stx	r6 -> $f6
	;;
#0:	       fop	fmov	f5 -> f9
	;;
#0:	       fop	fmov	f6 -> f5
	;;
	       nop	0
	;;
#0:	       fop	dmac	d6, d4 -> d2
	;;
#0:	       stx	r1 -> $f14
	;;
#0:	       fop	si2df	f14 -> d7
	;;
#0:	       stx	r0 -> $f7
	;;
	       nop	0
	;;
#0:	       fop	fmov	f7 -> f7
	;;
#0:	       fop	dzero -> d1
	;;
	       nop	0
	;;
#0:	       fop	dmac	d7, d3 -> d2
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
#0:	       fop	dcmp	d2, d1 -> f15
	;;
#0:	       fop	df2si	d2 -> f1
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f15 -> r2
	;;
#0:	       btest	r2, 13 -> c1
#1:	       ldx	$f1 -> r3
	;;
#0:	if  c1 br @	.BB16_108
#1:	       stm.s	r3, r15, 6
	;;
.BB16_107:
#0:	       ldm.s	r15, 24
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       stx	r0 -> $f0
	;;
#0:	       fop	si2df	f0 -> d0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       fop	dcmp	d2, d0 -> f0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r3
	;;
#0:	       btest	r3, 0 -> c1
	;;
#0:	if !c1 ldm.s	r15, 24
	;;
#0:	if !c1 or	r31, 0 -> r0
	;;
#0:	if !c1 sub	r0, 1 -> r0
	;;
#0:	if !c1 stm.s	r0, r15, 6
	;;
.BB16_108:
#0:	       ldm.s	r15, 24
#1:	       ldi	1 -> r4
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       cmpu gt	r0, 22 -> c1
	;;
#0:	if  c1 br @	.BB16_110
	;;
.BB16_109:
#2:	       ldi	0 -> r2.27
#0:	       ldm.s	r15, 24
#1:	       ldga	___mprec_tens -> r0
	;;
#0:	       or	r31, 0 -> r2
	;;
#0:	       ldmr.f	r2, r0, 3
	;;
#0:	       stx	r31 -> $f0
#1:	       ldm.s	r15, 24
	;;
#0:	       or	r31, 0 -> r3
	;;
#0:	       sl	r3, 3 -> r2
#1:	       ldi	-1 -> r3
	;;
#0:	       add	r0, r2 -> r0
	;;
#0:	       ldm.f	r0, 4
	;;
#0:	       stx	r31 -> $f2
	;;
#0:	       fop	fmov	f2 -> f1
	;;
#0:	       fop	dcmp	d5, d0 -> f0
#1:	       ldm.s	r15, 24
	;;
	       nop	0
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       ldx	$f0 -> r2
	;;
#0:	       btest	r2, 2 -> c1
#1:	       ldi	0 -> r2
	;;
#0:	       br	.BB16_111
#1:	if  c1 or	r3, 0 -> r2
	;;
#0:	       add	r2, r0 -> r0
	;;
#0:	       stm.s	r0, r15, 6
	;;
.BB16_110:
#2:	       ldi	1 -> r2.27
	;;
.BB16_111:                              ; %._crit_edge212
#1:	       sub	r1.25, r1 -> r0
#2:	       ldi	0 -> r2.23
#0:	       ldm.s	r15, 24
	;;
#1:	       ldi	0 -> r1.24
#2:	       ldi	0 -> r2.26
#0:	       cmp gt	r0, 0 -> c1
	;;
#2:	if !c1 sub	r4, r0 -> r2.23 ; aaaf
#0:	       sub	r0, 1 -> r0
	;;
#1:	if  c1 or	r0, 0 -> r1.24
#0:	       or	r31, 0 -> r0
	;;
#0:	       brz lt @	r0, .BB16_113
	;;
.BB16_112:
#2:	       ldi	0 -> r2.24
#0:	       ldm.s	r15, 24
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldm.s	r15, 24
	;;
#0:	       br	.BB16_114
#1:	       add	r0, r1.24 -> r1.24
	;;
#0:	       or	r31, 0 -> r0
	;;
#2:	       or	r0, 0 -> r2.26
	;;
.BB16_113:
#0:	       ldm.s	r15, 24
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldm.s	r15, 24
	;;
#2:	       sub	r2.23, r0 -> r2.23
	;;
#0:	       or	r31, 0 -> r0
	;;
#2:	       sub	r2.26, r0 -> r2.24
	;;
.BB16_114:
#1:	       cmpu gt	r1.27, 9 -> c1
#3:	       ldi	1 -> r3.26
	;;
#1:	       ldi	0 -> r1.28
	;;
#1:	if  c1 or	r1.28, 0 -> r1.27
	;;
#1:	       cmp gt	r1.27, 5 -> c1
	;;
#1:	       sub	r1.27, 4 -> r0
#0:	       ldx	$c1, 0 -> r2
	;;
#0:	       stm.s	r2, r15, 2
	;;
#0:	       ldm.s	r15, 8
	;;
#0:	       stx	r31 -> $c1
	;;
#1:	if  c1 or	r0, 0 -> r1.27
#0:	       ldi	-1 -> r0
	;;
#1:	       cmpu gt	r1.27, 5 -> c1
#0:	       stm.s	r0, r15, 5
	;;
#0:	if  c1 br @	.BB16_118
	;;
.BB16_115:
#0:	       ldga	.JTI16_0 -> r0
	;;
#1:	       s2add	r0, r1.27 -> r0
	;;
#0:	       ldm.d	r0, 0
#1:	       ldi	-1 -> r0
	;;
#0:	       jop	brind	r31
#1:	       or	r0, 0 -> r1.23
	;;
.BB16_116:
#3:	       ldi	0 -> r3.26
	;;
.BB16_117:
#0:	       cmp lt	r11, 1 -> c1
#1:	       ldi	1 -> r0
	;;
#0:	       br	.BB16_121
#1:	if  c1 or	r0, 0 -> r11
	;;
#1:	       or	r11, 0 -> r1.23
#0:	       or	r11, 0 -> r1
#2:	       or	r11, 0 -> r0
	;;
#0:	       stm.s	r0, r15, 5
	;;
.BB16_118:
#0:	       ldi	-1 -> r0
#1:	       br	.BB16_121
	;;
#1:	       or	r0, 0 -> r1.23
	;;
	       nop	0
	;;
.BB16_119:
#3:	       ldi	0 -> r3.26
	;;
.BB16_120:
#1:	       or	r11, 0 -> r1.28
#0:	       ldm.s	r15, 24
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       add	r0, r11 -> r0
	;;
#0:	       stm.s	r0, r15, 5
	;;
#0:	       ldm.s	r15, 20
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldm.s	r15, 20
	;;
#1:	       add	r0, 1 -> r1.23
	;;
#1:	       or	r1.23, 0 -> r1
#0:	       or	r31, 0 -> r3
	;;
#0:	       cmp gt	r3, -1 -> c1
	;;
#0:	if !c1 br @	.BB16_126
	;;
.BB16_121:
#0:	       cmpu lt	r1, 24 -> c1
#1:	       ldga	_impure_data -> r0
#2:	       ldi	0 -> r10
	;;
#0:	if  c1 br @	.BB16_125
#1:	       stm.a	0, r0, 17
	;;
.BB16_122:
#0:	       ldi	4 -> r0
#1:	       ldi	20 -> r3
	;;
.BB16_123:                              ; %.lr.ph149
                                        ; =>This Inner Loop Header: Depth=1
#0:	       s1add	r3, r0 -> r2
#1:	       sl	r0, 1 -> r0
#2:	       add	r10, 1 -> r10
	;;
#0:	       cmpu le	r2, r1 -> c1
	;;
#0:	if  c1 br @	.BB16_123
	;;
.BB16_124:                              ; %._crit_edge150
#0:	       ldga	_impure_data -> r0
	;;
#0:	       stm.a	r10, r0, 17
	;;
.BB16_125:                              ; %._crit_edge150
#1:	       or	r11, 0 -> r1.28
#0:	       br @	.BB16_127
	;;
.BB16_126:                              ; %.thread
#0:	       ldga	_impure_data -> r0
#1:	       ldi	0 -> r10
	;;
#0:	       stm.a	0, r0, 17
	;;
.BB16_127:                              ; %._crit_edge266
#0:	       ldmg.d	_impure_data+76
	;;
#0:	       brz ne @	r31, .BB16_150
#1:	       or	r31, 0 -> r1
	;;
.BB16_128:
#0:	       ldi	132 -> r0
#1:	       callg	__malloc_r
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r1
	;;
#0:	       brz eq @	r1, .BB16_134
	;;
.BB16_129:
#0:	       ldm.f	r1, -4
#1:	       ldi	-4 -> r0
	;;
#0:	       sub	r31, 4 -> r2
	;;
#0:	       and	r2, r0 -> r3
#1:	       ldi	36 -> r2
	;;
#0:	       cmpu gt	r3, r2 -> c1
	;;
#0:	if  c1 br @	.BB16_135
	;;
.BB16_130:
#0:	       cmpu lt	r3, 20 -> c1
#1:	       or	r1, 0 -> r0
	;;
#0:	if  c1 br @	.BB16_144
	;;
.BB16_131:
#0:	       cmpu lt	r3, 28 -> c1
#1:	       stm.a	0, r1, 0
	;;
#0:	if  c1 br @	.BB16_142
#1:	       stm.a	0, r1, 1
	;;
.BB16_132:
#0:	       ldi	36 -> r0
#1:	       stm.a	0, r1, 2
	;;
#0:	       cmpu lt	r3, r0 -> c1
#1:	       stm.a	0, r1, 3
	;;
#0:	if  c1 br @	.BB16_143
	;;
.BB16_133:
#0:	       add	r1, 24 -> r0
#1:	       br	.BB16_144
#2:	       stm.a	0, r1, 4
	;;
#0:	       stm.a	0, r1, 5
	;;
	       nop	0
	;;
.BB16_134:                              ; %_calloc_r.exit111.thread
#0:	       ldga	_impure_data -> r0
#1:	       br	.BB16_174
	;;
#0:	       stm.a	0, r0, 19
#1:	       ldi	0 -> r0
	;;
	       nop	0
	;;
.BB16_135:
#0:	       or	r1, 0 -> r0
#1:	       br @	.BB16_137
	;;
.BB16_136:                              ;   in Loop: Header=BB16_137 Depth=1
#0:	       stmb.a	0, r0, 0
#1:	       add	r0, 1 -> r0
#2:	       sub	r3, 1 -> r3
	;;
.BB16_137:                              ; %.preheader238
                                        ; =>This Inner Loop Header: Depth=1
#0:	       and	r0, 3 -> r2
	;;
#0:	       brz eq @	r2, .BB16_139
	;;
.BB16_138:                              ;   in Loop: Header=BB16_137 Depth=1
#0:	       brz ne @	r3, .BB16_136
	;;
#0:	       brz eq @	r3, .BB16_149
	;;
.BB16_139:
#0:	       cmpu lt	r3, 4 -> c1
	;;
#0:	if  c1 br @	.BB16_147
	;;
.BB16_140:
#0:	       cmpu gt	r3, 15 -> c1
	;;
#0:	if !c1 br @	.BB16_145
	;;
.BB16_141:                              ; %.lr.ph8.i117
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sub	r3, 16 -> r3
#1:	       stm.a	0, r0, 3
	;;
#0:	       cmpu gt	r3, 15 -> c1
#1:	       stm.a	0, r0, 2
	;;
#0:	if !c1 br	.BB16_146
#1:	if  c1 br	.BB16_141
#2:	       stm.a	0, r0, 1
	;;
#0:	       stm.a	0, r0, 0
#1:	       add	r0, 16 -> r0
	;;
	       nop	0
	;;
.BB16_142:
#0:	       add	r1, 8 -> r0
#1:	       br @	.BB16_144
	;;
.BB16_143:
#0:	       add	r1, 16 -> r0
	;;
.BB16_144:
#0:	       stm.a	0, r0, 0
#1:	       br	.BB16_149
	;;
#0:	       stm.a	0, r0, 1
	;;
#0:	       stm.a	0, r0, 2
	;;
.BB16_145:                              ; %.lr.ph.i120
#0:	       stm.a	0, r0, 0
#1:	       add	r0, 4 -> r0
#2:	       sub	r3, 4 -> r3
	;;
.BB16_146:                              ; %.lr.ph.i120
#0:	       cmpu gt	r3, 3 -> c1
	;;
#0:	if  c1 br @	.BB16_145
	;;
.BB16_147:                              ; %.preheader11.i126
#0:	       brz eq @	r3, .BB16_149
	;;
.BB16_148:                              ; %.lr.ph14.i129
                                        ; =>This Inner Loop Header: Depth=1
#0:	       stmb.a	0, r0, 0
#1:	       add	r0, 1 -> r0
#2:	       sub	r3, 1 -> r3
	;;
#0:	       brz ne @	r3, .BB16_148
	;;
.BB16_149:                              ; %_calloc_r.exit111
#0:	       ldga	_impure_data -> r0
	;;
#0:	       stm.a	r1, r0, 19
	;;
.BB16_150:
#0:	       ldmr.f	r10, r1, 2
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       brz eq @	r0, .BB16_152
	;;
.BB16_151:
#0:	       ldm.f	r0, 0
#1:	       br	.BB16_173
#2:	       s2add	r1, r10 -> r1
	;;
#0:	       stm.a	r31, r1, 0
	;;
	       nop	0
	;;
.BB16_152:
#0:	       ldi	1 -> r0
#1:	       callg	__malloc_r
#2:	       ldi	20 -> r3
	;;
#0:	       sl	r0, r10 -> r11
	;;
#0:	       s2add	r3, r11 -> r0
	;;
	       nop	0
	;;
#0:	       brz eq	r0, .BB16_175
#1:	       ldi	0 -> r1
	;;
#0:	       stm.s	r1, r15, 7
	;;
	       nop	0
	;;
.BB16_153:
#0:	       ldm.f	r0, -4
#1:	       ldi	-4 -> r1
	;;
#0:	       sub	r31, 4 -> r2
	;;
#0:	       and	r2, r1 -> r3
#1:	       ldi	36 -> r2
	;;
#0:	       cmpu gt	r3, r2 -> c1
	;;
#0:	if  c1 br @	.BB16_158
	;;
.BB16_154:
#0:	       cmpu lt	r3, 20 -> c1
#1:	       or	r0, 0 -> r1
	;;
#0:	if  c1 br @	.BB16_167
	;;
.BB16_155:
#0:	       cmpu lt	r3, 28 -> c1
#1:	       stm.a	0, r0, 0
	;;
#0:	if  c1 br @	.BB16_165
#1:	       stm.a	0, r0, 1
	;;
.BB16_156:
#0:	       ldi	36 -> r1
#1:	       stm.a	0, r0, 2
	;;
#0:	       cmpu lt	r3, r1 -> c1
#1:	       stm.a	0, r0, 3
	;;
#0:	if  c1 br @	.BB16_166
	;;
.BB16_157:
#0:	       add	r0, 24 -> r1
#1:	       br	.BB16_167
#2:	       stm.a	0, r0, 4
	;;
#0:	       stm.a	0, r0, 5
	;;
	       nop	0
	;;
.BB16_158:
#0:	       or	r0, 0 -> r1
#1:	       br @	.BB16_160
	;;
.BB16_159:                              ;   in Loop: Header=BB16_160 Depth=1
#0:	       stmb.a	0, r1, 0
#1:	       add	r1, 1 -> r1
#2:	       sub	r3, 1 -> r3
	;;
.BB16_160:                              ; %.preheader240
                                        ; =>This Inner Loop Header: Depth=1
#0:	       and	r1, 3 -> r2
	;;
#0:	       brz eq @	r2, .BB16_162
	;;
.BB16_161:                              ;   in Loop: Header=BB16_160 Depth=1
#0:	       brz ne @	r3, .BB16_159
	;;
#0:	       brz eq @	r3, .BB16_172
	;;
.BB16_162:
#0:	       cmpu lt	r3, 4 -> c1
	;;
#0:	if  c1 br @	.BB16_170
	;;
.BB16_163:
#0:	       cmpu gt	r3, 15 -> c1
	;;
#0:	if !c1 br @	.BB16_168
	;;
.BB16_164:                              ; %.lr.ph8.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sub	r3, 16 -> r3
#1:	       stm.a	0, r1, 3
	;;
#0:	       cmpu gt	r3, 15 -> c1
#1:	       stm.a	0, r1, 2
	;;
#0:	if !c1 br	.BB16_169
#1:	if  c1 br	.BB16_164
#2:	       stm.a	0, r1, 1
	;;
#0:	       stm.a	0, r1, 0
#1:	       add	r1, 16 -> r1
	;;
	       nop	0
	;;
.BB16_165:
#0:	       add	r0, 8 -> r1
#1:	       br @	.BB16_167
	;;
.BB16_166:
#0:	       add	r0, 16 -> r1
	;;
.BB16_167:
#0:	       stm.a	0, r1, 0
#1:	       br	.BB16_172
	;;
#0:	       stm.a	0, r1, 1
	;;
#0:	       stm.a	0, r1, 2
	;;
.BB16_168:                              ; %.lr.ph.i
#0:	       stm.a	0, r1, 0
#1:	       add	r1, 4 -> r1
#2:	       sub	r3, 4 -> r3
	;;
.BB16_169:                              ; %.lr.ph.i
#0:	       cmpu gt	r3, 3 -> c1
	;;
#0:	if  c1 br @	.BB16_168
	;;
.BB16_170:                              ; %.preheader11.i
#0:	       brz eq @	r3, .BB16_172
	;;
.BB16_171:                              ; %.lr.ph14.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       stmb.a	0, r1, 0
#1:	       add	r1, 1 -> r1
#2:	       sub	r3, 1 -> r3
	;;
#0:	       brz ne @	r3, .BB16_171
	;;
.BB16_172:                              ; %_calloc_r.exit
#0:	       stm.a	r10, r0, 1
	;;
#0:	       stm.a	r11, r0, 2
	;;
.BB16_173:
#0:	       stm.a	0, r0, 4
	;;
#0:	       stm.a	0, r0, 3
	;;
.BB16_174:
#0:	       stm.s	r0, r15, 7
	;;
.BB16_175:                              ; %_Balloc.exit
#1:	       cmpu gt	r1.23, 14 -> c2
#0:	       ldm.s	r15, 28
#2:	       ldga	_impure_data -> r1
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       stm.a	r0, r1, 16
	;;
#0:	       ldm.s	r15, 8
	;;
#0:	       stx	r31 -> $c1
	;;
#0:	       comb	or c2, c1 -> c1
	;;
#0:	if  c1 br @	.BB16_204
	;;
.BB16_176:
#0:	       ldm.s	r15, 24
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       cmp lt	r0, 1 -> c1
	;;
#0:	if  c1 br @	.BB16_179
	;;
.BB16_177:
#2:	       ldi	2 -> r2.25
#0:	       ldm.s	r15, 24
#1:	       ldga	___mprec_tens -> r1
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       and	r0, 15 -> r0
	;;
#0:	       ldmr.f	r0, r1, 3
#1:	       sl	r0, 3 -> r0
	;;
#0:	       add	r1, r0 -> r0
	;;
#0:	       stx	r31 -> $f12
#1:	       ldm.f	r0, 4
	;;
#0:	       stx	r31 -> $f0
	;;
#0:	       fop	fmov	f0 -> f13
#1:	       ldm.s	r15, 24
	;;
#0:	       or	r31, 0 -> r3
	;;
#0:	       sra	r3, 4 -> r10
	;;
#0:	       btest	r10, 4 -> !c1
	;;
#0:	if  c1 br @	.BB16_185
	;;
.BB16_178:
#0:	       ldiu	1852 -> r0
#1:	       ldiu	2013 -> r3
#2:	       ldx	$f11 -> r1
	;;
#0:	       ldim	631 -> r0
#1:	       ldim	681 -> r3
	;;
#0:	       ldih	1019 -> r0
#1:	       ldih	936 -> r3
	;;
#0:	       stx	r0 -> $f0
	;;
#0:	       stx	r3 -> $f2
	;;
#0:	       callg	___divdf3
#1:	       fop	fmov	f2 -> f1
	;;
#0:	       ldx	$f0 -> r2
	;;
#0:	       ldx	$f1 -> r3
	;;
#0:	       ldx	$f10 -> r0
	;;
#2:	       ldi	3 -> r2.25
#0:	       ldiu	128 -> r3
#1:	       ldiu	128 -> r2
#3:	       and	r10, 15 -> r10
	;;
#0:	       add	r15, r3 -> r3
	;;
#0:	       add	r3, 8 -> r0
#1:	       add	r15, r2 -> r3
	;;
#0:	       or	r0, 4 -> r1
#1:	       ldx	$f0 -> r0
	;;
#0:	       stm.a	r0, r3, 2
#1:	       ldx	$f1 -> r3
	;;
#0:	       stm.a	r3, r1, 0
	;;
#0:	       br	.BB16_186
#1:	       ldm.f	r1, 0
	;;
#0:	       or	r31, 0 -> r1
#1:	       ldm.f	r15, 136
	;;
#0:	       or	r31, 0 -> r2
	;;
.BB16_179:
#2:	       ldi	2 -> r2.25
#3:	       or	r3.23, 0 -> r3.24
#0:	       ldm.s	r15, 24
#1:	       or	r14, 0 -> r11
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       brz eq @	r0, .BB16_192
	;;
.BB16_180:
#2:	       ldi	2 -> r2.25
#0:	       ldm.s	r15, 24
#1:	       ldi	0 -> r1
#3:	       ldiu	160 -> r3
	;;
#0:	       add	r15, r3 -> r3
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       sub	r1, r0 -> r2
#1:	       ldga	___mprec_tens -> r1
	;;
#0:	       and	r2, 15 -> r0
#1:	       sra	r2, 4 -> r2
	;;
#0:	       ldmr.f	r0, r1, 3
#1:	       sl	r0, 3 -> r0
	;;
#0:	       add	r1, r0 -> r0
	;;
#0:	       stx	r31 -> $f0
#1:	       ldm.f	r0, 4
#2:	       add	r3, 0 -> r0
#3:	       ldiu	128 -> r3
	;;
#0:	       or	r0, 4 -> r1
#1:	       add	r15, r3 -> r3
	;;
#0:	       stx	r31 -> $f2
	;;
#0:	       fop	fmov	f2 -> f1
	;;
#0:	       fop	dmul	d5, d0 -> d0
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
#1:	       ldx	$f1 -> r3
	;;
#0:	       stm.a	r3, r1, 0
	;;
#0:	       brz eq	r2, .BB16_192
#1:	       ldm.f	r1, 0
	;;
#0:	       or	r31, 0 -> r11
#1:	       ldm.f	r15, 160
	;;
#3:	       or	r31, 0 -> r3.24
	;;
.BB16_181:
#0:	       ldiu	128 -> r5
#1:	       ldiu	128 -> r12
#2:	       ldga	___mprec_bigtens -> r1
	;;
#0:	       add	r15, r5 -> r5
	;;
#0:	       add	r5, 24 -> r0
#1:	       add	r15, r12 -> r5
	;;
#0:	       add	r5, 16 -> r3
#1:	       or	r0, 4 -> r4
	;;
#0:	       or	r3, 4 -> r3
	;;
.BB16_182:                              ; %.lr.ph
                                        ; =>This Inner Loop Header: Depth=1
#0:	       btest	r2, 0 -> c1
	;;
#0:	if !c1 br @	.BB16_184
	;;
.BB16_183:                              ;   in Loop: Header=BB16_182 Depth=1
#2:	       add	r2.25, 1 -> r2.25
#0:	       ldiu	128 -> r5
#1:	       stm.a	r11, r4, 0
	;;
#0:	       add	r15, r5 -> r5
	;;
#3:	       stm.a	r3.24, r5, 6
#0:	       ldiu	128 -> r5
	;;
#0:	       ldm.f	r1, 0
#1:	       add	r15, r5 -> r5
	;;
#0:	       stx	r31 -> $f4
#1:	       ldm.f	r15, 152
	;;
#0:	       stx	r31 -> $f2
#1:	       ldm.f	r1, 4
	;;
#0:	       stx	r31 -> $f0
	;;
#0:	       fop	fmov	f0 -> f5
#1:	       ldm.f	r4, 0
	;;
#0:	       stx	r31 -> $f15
	;;
#0:	       fop	fmov	f15 -> f3
	;;
#0:	       fop	dmul	d1, d2 -> d0
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
#0:	       stm.a	r0, r5, 4
#1:	       ldx	$f1 -> r0
	;;
#0:	       stm.a	r0, r3, 0
	;;
#0:	       ldm.f	r3, 0
	;;
#0:	       or	r31, 0 -> r11
#1:	       ldm.f	r15, 144
	;;
#3:	       or	r31, 0 -> r3.24
	;;
.BB16_184:                              ;   in Loop: Header=BB16_182 Depth=1
#0:	       add	r1, 8 -> r1
#1:	       sra	r2, 1 -> r2
	;;
#0:	       brz ne @	r2, .BB16_182
	;;
#0:	       brz eq @	r2, .BB16_192
	;;
.BB16_185:
#3:	       or	r3.23, 0 -> r2
#0:	       or	r14, 0 -> r1
	;;
.BB16_186:                              ; %.preheader69
#0:	       brz eq @	r10, .BB16_191
	;;
.BB16_187:
#0:	       ldga	___mprec_bigtens -> r0
	;;
.BB16_188:                              ; %.lr.ph74
                                        ; =>This Inner Loop Header: Depth=1
#0:	       btest	r10, 0 -> c1
	;;
#0:	if !c1 br @	.BB16_190
	;;
.BB16_189:                              ;   in Loop: Header=BB16_188 Depth=1
#2:	       add	r2.25, 1 -> r2.25
#0:	       ldm.f	r0, 0
	;;
#0:	       stx	r31 -> $f0
#1:	       ldm.f	r0, 4
	;;
#0:	       stx	r31 -> $f2
	;;
#0:	       fop	fmov	f2 -> f1
	;;
#0:	       fop	dmul	d6, d0 -> d6
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
.BB16_190:                              ;   in Loop: Header=BB16_188 Depth=1
#0:	       add	r0, 8 -> r0
#1:	       sra	r10, 1 -> r10
	;;
#0:	       brz ne @	r10, .BB16_188
	;;
.BB16_191:                              ; %._crit_edge75
#0:	       ldiu	128 -> r10
#1:	       ldx	$f13 -> r3
	;;
#0:	       add	r15, r10 -> r10
	;;
#0:	       add	r10, 0 -> r0
#1:	       ldiu	128 -> r10
	;;
#0:	       or	r0, 4 -> r0
#1:	       add	r15, r10 -> r10
	;;
#0:	       stm.a	r1, r0, 0
	;;
#0:	       stm.a	r2, r10, 0
#1:	       ldx	$f12 -> r2
	;;
#0:	       ldm.f	r15, 128
	;;
#0:	       stx	r31 -> $f0
#1:	       ldm.f	r0, 0
	;;
#0:	       callg	___divdf3
#1:	       stx	r31 -> $f2
	;;
#0:	       fop	fmov	f2 -> f1
	;;
#0:	       ldx	$f0 -> r0
	;;
#0:	       ldx	$f1 -> r1
	;;
#0:	       s2add	r15, 24 -> r2
#1:	       ldx	$f1 -> r3
	;;
#0:	       add	r2, 24 -> r0
#1:	       ldx	$f0 -> r2
	;;
#0:	       or	r0, 4 -> r1
#1:	       stm.a	r2, r15, 30
	;;
#0:	       stm.a	r3, r1, 0
	;;
#0:	       ldm.f	r1, 0
	;;
#0:	       or	r31, 0 -> r11
#1:	       ldm.f	r15, 120
	;;
#3:	       or	r31, 0 -> r3.24
	;;
.BB16_192:                              ; %.loopexit
#2:	       brz eq @	r2.27, .BB16_196
	;;
.BB16_193:
#1:	       cmp gt	r1.23, 0 -> c2
#0:	       s2add	r15, 24 -> r1
#2:	       fop	done -> d7
	;;
#0:	       add	r1, 16 -> r0
	;;
#0:	       or	r0, 4 -> r0
	;;
#0:	       stm.a	r11, r0, 0
	;;
#3:	       stm.a	r3.24, r15, 28
	;;
#0:	       ldm.f	r15, 112
	;;
#0:	       stx	r31 -> $f4
#1:	       ldm.f	r0, 0
	;;
#0:	       stx	r31 -> $f0
	;;
#0:	       fop	fmov	f0 -> f5
	;;
#0:	       fop	dcmp	d2, d7 -> f0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r3
	;;
#0:	       btest	r3, 2 -> c1
	;;
#0:	       comb	and c1, c2 -> c1
	;;
#0:	if !c1 br @	.BB16_196
	;;
.BB16_194:
#0:	       ldm.s	r15, 20
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       cmp lt	r0, 1 -> c1
	;;
#0:	if  c1 br @	.BB16_204
	;;
.BB16_195:
#2:	       add	r2.25, 1 -> r2.25
#0:	       ldiu	0 -> r0
#1:	       ldiu	0 -> r1
#3:	       s2add	r15, 24 -> r2
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
#1:	       ldm.s	r15, 24
	;;
#0:	       fop	dmul	d2, d0 -> d0
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       sub	r0, 1 -> r12
#1:	       add	r2, 8 -> r0
	;;
#0:	       or	r0, 4 -> r1
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
#0:	       stm.a	r2, r15, 26
#1:	       ldx	$f1 -> r3
	;;
#0:	       stm.a	r3, r1, 0
	;;
#0:	       ldm.f	r1, 0
	;;
#0:	       br	.BB16_197
#1:	       or	r31, 0 -> r11
#2:	       ldm.f	r15, 104
	;;
#3:	       or	r31, 0 -> r3.24
#0:	       ldm.s	r15, 20
	;;
#0:	       or	r31, 0 -> r10
	;;
.BB16_196:
#1:	       or	r1.23, 0 -> r10
#0:	       ldm.s	r15, 24
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       or	r0, 0 -> r12
	;;
.BB16_197:
#0:	       s2add	r15, 24 -> r5
#1:	       ldiu	0 -> r4
#2:	       ldiu	0 -> r3
#3:	       cmp eq	r10, 0 -> c3
	;;
#0:	       add	r5, 0 -> r0
#1:	       ldim	0 -> r4
#2:	       s2add	r15, 16 -> r5
#3:	       ldih	2022 -> r3
	;;
#0:	       or	r0, 4 -> r2
#1:	       ldiu	0 -> r0
#2:	       ldih	0 -> r4
#3:	       ldiu	0 -> r1
	;;
#0:	       stm.a	r11, r2, 0
#1:	       ldim	896 -> r0
#2:	       stx	r4 -> $f4
	;;
#3:	       stm.a	r3.24, r15, 24
#0:	       ldih	512 -> r0
	;;
#0:	       ldm.f	r15, 96
#1:	       stx	r0 -> $f0
#2:	       add	r5, 24 -> r0
	;;
#0:	       fop	fmov	f0 -> f5
	;;
#2:	       stx	r2.25 -> $f0
	;;
#0:	       stx	r31 -> $f2
#1:	       ldm.f	r2, 0
#2:	       or	r0, 4 -> r2
	;;
#0:	       fop	si2df	f0 -> d0
	;;
#0:	       stx	r31 -> $f15
	;;
	       nop	0
	;;
#0:	       fop	fmov	f15 -> f3
	;;
#0:	       fop	dmac	d0, d1 -> d2
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
#0:	       ldx	$f4 -> r0
	;;
#0:	       stm.a	r0, r15, 22
#1:	       ldx	$f5 -> r0
	;;
#0:	       stm.a	r0, r2, 0
	;;
#0:	if  c3 br	.BB16_208
#1:	       ldm.f	r2, 0
	;;
#0:	       add	r31, r3 -> r2
#1:	       ldm.f	r15, 88
	;;
#0:	       or	r31, 0 -> r3
	;;
.BB16_198:
#3:	       cmp eq	r3.26, 0 -> c3
#0:	       sl	r10, 3 -> r1
#1:	       ldga	___mprec_tens -> r0
	;;
#0:	       add	r1, r0 -> r0
	;;
#0:	       ldm.f	r0, -8
	;;
#0:	if  c3 br	.BB16_211
#1:	       stx	r31 -> $f4
#2:	       ldm.f	r0, -4
	;;
#0:	       stx	r31 -> $f0
	;;
#0:	       fop	fmov	f0 -> f5
	;;
.BB16_199:
#0:	       s2add	r15, 16 -> r4
#1:	       fop	dhalf -> d0
	;;
#0:	       callg	___divdf3
#1:	       add	r4, 16 -> r0
#2:	       ldx	$f1 -> r1
	;;
#3:	       or	r0, 4 -> r3.25
#0:	       ldx	$f0 -> r0
	;;
#3:	       stm.a	r2, r3.25, 0
#0:	       ldx	$f4 -> r2
	;;
#0:	       stm.a	r3, r15, 20
#1:	       ldx	$f5 -> r3
	;;
#0:	       fop	dmov	d0 -> d2
#1:	       ldm.f	r15, 80
#2:	       s2add	r15, 16 -> r5
#3:	       ldiu	0 -> r1
	;;
#0:	       add	r5, 8 -> r0
#1:	       ldiu	0 -> r6
#2:	       s2add	r15, 16 -> r5
#3:	       ldim	128 -> r1
	;;
#0:	       stx	r31 -> $f0
#1:	       ldim	0 -> r6
#2:	       or	r0, 4 -> r3
#3:	       add	r5, 0 -> r0
	;;
#3:	       ldm.f	r3.25, 0
#0:	       ldi	1 -> r2
#1:	       ldih	0 -> r6
#2:	       ldih	513 -> r1
	;;
#0:	       or	r0, 4 -> r4
	;;
#0:	       stx	r31 -> $f2
	;;
#0:	       fop	fmov	f2 -> f1
	;;
#0:	       fop	dsub	d2, d0 -> d1
	;;
#0:	       fop	done -> d2
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       br	.BB16_201
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB16_200:                              ;   in Loop: Header=BB16_201 Depth=1
#0:	       stx	r6 -> $f0
#1:	       add	r2, 1 -> r2
	;;
#0:	       stx	r1 -> $f8
	;;
#0:	       fop	fmov	f8 -> f1
	;;
#0:	       fop	dmul	d1, d0 -> d1
	;;
#0:	       fop	dmul	d3, d0 -> d0
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
#0:	       stm.a	r0, r15, 16
#1:	       ldx	$f1 -> r0
	;;
#0:	       stm.a	r0, r4, 0
	;;
#0:	       ldm.f	r4, 0
	;;
#0:	       or	r31, 0 -> r11
#1:	       ldm.f	r15, 64
	;;
#3:	       or	r31, 0 -> r3.24
	;;
.BB16_201:                              ; =>This Inner Loop Header: Depth=1
#0:	       stm.a	r11, r3, 0
	;;
#3:	       stm.a	r3.24, r15, 18
	;;
#0:	       ldm.f	r15, 72
	;;
#0:	       stx	r31 -> $f6
#1:	       ldm.f	r3, 0
	;;
#0:	       stx	r31 -> $f0
	;;
#0:	       fop	fmov	f0 -> f7
#1:	       ldm.s	r15, 28
	;;
#0:	       fop	df2si	d3 -> f8
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       add	r0, r2 -> r0.23
	;;
#0:	       sub	r0.23, 1 -> r5
#1:	       fop	si2df	f8 -> d7
	;;
#0:	       ldx	$f8 -> r0
	;;
#0:	       s2add	r0, 12 -> r0
	;;
#0:	       fop	dsub	d3, d7 -> d3
#1:	       stmb.a	r0, r5, 0
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
#0:	       fop	dcmp	d3, d1 -> f0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r0
	;;
#0:	       btest	r0, 2 -> c1
	;;
#0:	if  c1 br @	.BB16_243
	;;
.BB16_202:                              ;   in Loop: Header=BB16_201 Depth=1
#0:	       fop	dsub	d2, d3 -> d0
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
#0:	       fop	dcmp	d0, d1 -> f0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r0
	;;
#0:	       btest	r0, 2 -> c1
	;;
#0:	if  c1 br @	.BB16_230
	;;
.BB16_203:                              ;   in Loop: Header=BB16_201 Depth=1
#0:	       cmp ge	r2, r10 -> c1
	;;
#0:	if !c1 br @	.BB16_200
	;;
.BB16_204:                              ; %.loopexit58
#1:	       cmp gt	r1.26, -1 -> c1
#0:	       ldm.s	r15, 24
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       cmp lt	r0, 15 -> c2
	;;
#0:	       comb	and c1, c2 -> c1
	;;
#0:	if !c1 br @	.BB16_219
	;;
.BB16_205:
#1:	       cmp lt	r1.23, 1 -> c2
#0:	       ldm.s	r15, 24
#2:	       ldga	___mprec_tens -> r1
	;;
#1:	       cmp lt	r1.28, 0 -> c1
	;;
#0:	       or	r31, 0 -> r0
#1:	       comb	and c1, c2 -> c1
	;;
#0:	       ldmr.f	r0, r1, 3
	;;
#0:	       stx	r31 -> $f12
#1:	       ldm.s	r15, 24
	;;
#0:	       or	r31, 0 -> r3
	;;
#0:	       sl	r3, 3 -> r0
	;;
#0:	       add	r1, r0 -> r0
	;;
#0:	if !c1 br	.BB16_223
#1:	       ldm.f	r0, 4
	;;
#0:	       stx	r31 -> $f0
	;;
#0:	       fop	fmov	f0 -> f13
	;;
.BB16_206:
#1:	       cmp lt	r1.23, 0 -> c3
#0:	       ldi	0 -> r11
	;;
#0:	if  c3 br @	.BB16_242
	;;
.BB16_207:
#0:	       ldiu	0 -> r0
#1:	       ldiu	0 -> r1
#2:	       ldi	0 -> r11
	;;
#0:	       ldim	0 -> r1
#1:	       ldim	640 -> r0
#2:	       or	r11, 0 -> r10
	;;
#0:	       ldih	0 -> r1
#1:	       ldih	512 -> r0
	;;
#0:	       stx	r1 -> $f0
	;;
#0:	       stx	r0 -> $f2
	;;
#0:	       fop	fmov	f2 -> f1
	;;
#0:	       fop	dmul	d6, d0 -> d0
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
#0:	       fop	dcmp	d5, d0 -> f0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r3
	;;
#0:	       btest	r3, 12 -> c1
	;;
#0:	if  c1 br @	.BB16_239
#1:	if !c1 br @	.BB16_415
	;;
.BB16_208:
#0:	       s2add	r15, 8 -> r11
#1:	       ldim	640 -> r1
#2:	       stx	r4 -> $f0
	;;
#0:	       add	r11, 16 -> r0
#1:	       ldih	1536 -> r1
#2:	       ldi	0 -> r11
	;;
#0:	       or	r0, 4 -> r0
#1:	       stx	r1 -> $f4
	;;
#0:	       stm.a	r2, r0, 0
	;;
#0:	       stm.a	r3, r15, 12
#1:	       fop	fmov	f4 -> f1
	;;
#0:	       fop	dadd	d1, d0 -> d2
#1:	       ldm.f	r15, 48
	;;
	       nop	0
	;;
#0:	       stx	r31 -> $f2
#1:	       ldm.f	r0, 0
	;;
	       nop	0
	;;
#0:	       stx	r31 -> $f0
	;;
#0:	       fop	fmov	f0 -> f3
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       fop	dcmp	d2, d1 -> f0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r3
	;;
#0:	       btest	r3, 4 -> c1
	;;
#0:	if  c1 br @	.BB16_238
	;;
.BB16_209:
#0:	       fop	dneg	d1 -> d0
#1:	       ldi	0 -> r11
	;;
#0:	       fop	dcmp	d2, d0 -> f0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r0
	;;
#0:	       btest	r0, 2 -> c1
	;;
#0:	if !c1 br @	.BB16_204
	;;
.BB16_210:
#0:	       or	r11, 0 -> r10
#1:	       br @	.BB16_415
	;;
.BB16_211:
#0:	       s2add	r15, 8 -> r4
#1:	       fop	df2si	d1 -> f12
#2:	       cmp eq	r10, 1 -> c1
	;;
#0:	       add	r4, 24 -> r0
	;;
#0:	       or	r0, 4 -> r1
	;;
#0:	       stm.a	r2, r1, 0
#1:	       fop	si2df	f12 -> d0
	;;
#0:	       stm.a	r3, r15, 14
#1:	       ldx	$f12 -> r0
	;;
#0:	       ldm.f	r15, 56
#1:	       s2add	r0, 12 -> r0
	;;
#0:	       fop	dsub	d1, d0 -> d4
	;;
#0:	       or	r31, 0 -> r2
#1:	       ldm.f	r1, 0
	;;
#0:	       stx	r2 -> $f6
	;;
#0:	       stx	r31 -> $f13
	;;
#0:	       fop	fmov	f13 -> f7
#1:	       ldm.s	r15, 28
	;;
	       nop	0
	;;
#0:	       or	r31, 0 -> r3
	;;
#0:	       stmb.a	r0, r3, 0
	;;
#0:	if  c1 br	.BB16_215
#1:	       ldm.s	r15, 28
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       add	r0, 1 -> r0.23
	;;
.BB16_212:                              ; %.lr.ph66.preheader
#0:	       ldiu	0 -> r2
#1:	       ldiu	0 -> r3
#2:	       sub	r10, 1 -> r1
	;;
#0:	       ldim	0 -> r3
#1:	       ldim	128 -> r2
	;;
#0:	       ldih	0 -> r3
#1:	       ldih	513 -> r2
	;;
.BB16_213:                              ; %.lr.ph66
                                        ; =>This Inner Loop Header: Depth=1
#0:	       add	r0.23, 1 -> r4
#1:	       stx	r3 -> $f0
#2:	       sub	r1, 1 -> r1
	;;
#0:	       stx	r2 -> $f2
	;;
#0:	       fop	fmov	f2 -> f1
	;;
#0:	       fop	dmul	d4, d0 -> d1
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
#0:	       fop	df2si	d1 -> f12
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       fop	si2df	f12 -> d7
	;;
#0:	       ldx	$f12 -> r0
	;;
#0:	       s2add	r0, 12 -> r0
	;;
#0:	       stmb.a	r0, r0.23, 0
#1:	       fop	dsub	d1, d7 -> d4
	;;
#0:	       or	r4, 0 -> r0.23
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz ne	r1, .BB16_213
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB16_214:                              ; %._crit_edge
#0:	       ldm.s	r15, 28
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       add	r0, r10 -> r0.23
	;;
.BB16_215:
#0:	       fop	dmul	d3, d2 -> d2
	;;
#0:	       fop	dhalf -> d1
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
#0:	       fop	dadd	d2, d1 -> d0
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
#0:	       fop	dcmp	d4, d0 -> f0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r0
	;;
#0:	       btest	r0, 4 -> c1
	;;
#0:	if  c1 br @	.BB16_230
	;;
.BB16_216:
#0:	       fop	dsub	d1, d2 -> d0
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
#0:	       fop	dcmp	d4, d0 -> f0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r0
	;;
#0:	       btest	r0, 13 -> c1
	;;
#0:	if  c1 br @	.BB16_204
	;;
.BB16_217:                              ; %.preheader.preheader
#0:	       add	r0.23, 1 -> r0.23
#1:	       ldi	48 -> r1
	;;
.BB16_218:                              ; %.preheader
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r0.23, -2
	;;
#0:	       sub	r0.23, 2 -> r0
	;;
#0:	       sub	r0.23, 1 -> r0.23
#1:	       bbh	mzext8 r0 -> r0
	;;
#0:	       cmp eq	r0, r1 -> c1
	;;
#0:	if !c1 br @	.BB16_244
#1:	if  c1 br @	.BB16_218
	;;
.BB16_219:
#0:	       ldi	0 -> r11
#3:	       brz eq @	r3.26, .BB16_227
	;;
.BB16_220:
#1:	       cmp gt	r1.27, 1 -> c1
	;;
#0:	if  c1 br @	.BB16_228
	;;
.BB16_221:
#1:	       cmp eq	r1.29, 0 -> c3
	;;
#0:	if  c3 br @	.BB16_247
	;;
.BB16_222:
#0:	       ldiu	1075 -> r0
#1:	       br	.BB16_248
	;;
#1:	       add	r1.26, r0 -> r0
	;;
	       nop	0
	;;
.BB16_223:                              ; %.preheader138.preheader
#1:	       sub	r1.23, 1 -> r1.23
#0:	       ldm.s	r15, 28
#2:	       s2add	r15, 8 -> r1
#3:	       ldiu	0 -> r11
	;;
#0:	       ldiu	0 -> r12
#1:	       ldim	128 -> r11
#2:	       fop	dzero -> d5
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldim	0 -> r12
#2:	       ldih	513 -> r11
	;;
#0:	       add	r0, 1 -> r0.23
#1:	       add	r1, 8 -> r0
#2:	       s2add	r15, 8 -> r1
#3:	       ldih	0 -> r12
	;;
#0:	       br	.BB16_225
#1:	       or	r0, 4 -> r1.24
#2:	       add	r1, 0 -> r3
	;;
#0:	       or	r3, 4 -> r10
	;;
	       nop	0
	;;
.BB16_224:                              ;   in Loop: Header=BB16_225 Depth=1
#0:	       add	r0.23, 1 -> r0.23
#1:	       sub	r1.23, 1 -> r1.23
#2:	       ldx	$f2 -> r0
	;;
#0:	       stm.a	r0, r15, 8
#1:	       ldx	$f3 -> r3
	;;
#0:	       stm.a	r3, r10, 0
	;;
#0:	       ldm.f	r10, 0
	;;
#0:	       or	r31, 0 -> r14
#1:	       ldm.f	r15, 32
	;;
#3:	       or	r31, 0 -> r3.23
	;;
.BB16_225:                              ; %.preheader138
                                        ; =>This Inner Loop Header: Depth=1
#1:	       stm.a	r14, r1.24, 0
#0:	       ldx	$f12 -> r2
	;;
#3:	       stm.a	r3.23, r15, 10
#0:	       ldx	$f13 -> r3
	;;
#0:	       ldm.f	r15, 40
	;;
#0:	       stx	r31 -> $f14
#1:	       ldm.f	r1.24, 0
	;;
#0:	       callg	___divdf3
#1:	       stx	r31 -> $f0
	;;
#0:	       fop	fmov	f0 -> f15
	;;
#0:	       ldx	$f14 -> r0
	;;
#0:	       ldx	$f15 -> r1
	;;
#0:	       sub	r0.23, 1 -> r1
#1:	       fop	df2si	d0 -> f6
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       fop	si2df	f6 -> d0
	;;
#0:	       ldx	$f6 -> r0
	;;
#0:	       s2add	r0, 12 -> r0
	;;
#0:	       fop	dmul	d0, d6 -> d0
#1:	       stmb.a	r0, r1, 0
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
#0:	       fop	dsub	d7, d0 -> d2
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#1:	       brz eq	r1.23, .BB16_231
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB16_226:                              ;   in Loop: Header=BB16_225 Depth=1
#0:	       stx	r12 -> $f0
	;;
#0:	       stx	r11 -> $f2
	;;
#0:	       fop	fmov	f2 -> f1
	;;
#0:	       fop	dmul	d2, d0 -> d1
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
#0:	       fop	dcmp	d1, d5 -> f0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r0
	;;
#0:	       btest	r0, 0 -> c1
	;;
#0:	if  c1 br @	.BB16_422
#1:	if !c1 br @	.BB16_224
	;;
.BB16_227:
#2:	       or	r2.24, 0 -> r10
#0:	       br	.BB16_297
	;;
#2:	       or	r2.23, 0 -> r12
	;;
	       nop	0
	;;
.BB16_228:
#1:	       sub	r1.23, 1 -> r0
	;;
#2:	       cmp lt	r2.24, r0 -> c1
	;;
#0:	if !c1 br @	.BB16_245
	;;
.BB16_229:
#2:	       sub	r2.26, r2.24 -> r1
#0:	       br	.BB16_246
#1:	       ldi	0 -> r10
	;;
#2:	       add	r1, r0 -> r2.26
	;;
#2:	       or	r0, 0 -> r2.24
	;;
.BB16_230:                              ; %.preheader132.loopexit
#0:	       or	r12, 0 -> r0
#1:	       br	.BB16_234
	;;
#0:	       stm.s	r0, r15, 6
	;;
	       nop	0
	;;
.BB16_231:
#0:	       fop	dadd	d2, d2 -> d1
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
#0:	       fop	dcmp	d1, d6 -> f0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r0
	;;
#0:	       btest	r0, 4 -> c1
	;;
#0:	if  c1 br @	.BB16_234
	;;
.BB16_232:
#0:	       fop	dcmp	d1, d6 -> f0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldx	$f0 -> r0
	;;
#0:	       btest	r0, 9 -> c1
	;;
#0:	if  c1 br @	.BB16_422
	;;
.BB16_233:
#0:	       ldx	$f6 -> r0
	;;
#0:	       btest	r0, 0 -> c1
	;;
#0:	if !c1 br @	.BB16_422
	;;
.BB16_234:                              ; %.preheader132
#0:	       ldm.s	r15, 28
#1:	       ldi	0 -> r0
#2:	       ldi	57 -> r2
	;;
#0:	       or	r31, 0 -> r1
	;;
#1:	       sub	r0, r1 -> r3
#0:	       sub	r0.23, 1 -> r0
	;;
.BB16_235:                              ; =>This Inner Loop Header: Depth=1
#0:	       or	r0, 0 -> r4
	;;
#0:	       ldm.f	r4, 0
	;;
#0:	       bbh	mzext8 r4 -> r0
	;;
#0:	       cmp ne	r0, r2 -> c1
	;;
#0:	if  c1 br @	.BB16_240
	;;
.BB16_236:                              ;   in Loop: Header=BB16_235 Depth=1
#0:	       sub	r4, 1 -> r0
	;;
#0:	       add	r0, r3 -> r1
	;;
#0:	       cmp ne	r1, -1 -> c1
	;;
#0:	if  c1 br @	.BB16_235
	;;
.BB16_237:
#0:	       ldm.s	r15, 28
#1:	       ldi	48 -> r0
	;;
#0:	       or	r31, 0 -> r1
	;;
#0:	       stmb.a	r0, r1, 0
	;;
#0:	       ldm.s	r15, 24
	;;
#0:	       or	r31, 0 -> r3
	;;
#0:	       add	r3, 1 -> r0
	;;
#0:	       br	.BB16_241
#1:	       stm.s	r0, r15, 6
#2:	       ldi	49 -> r0
	;;
#0:	       ldm.s	r15, 28
	;;
#0:	       or	r31, 0 -> r1
	;;
.BB16_238:
#0:	       or	r12, 0 -> r0
#1:	       or	r11, 0 -> r10
	;;
#0:	       stm.s	r0, r15, 6
	;;
.BB16_239:
#0:	       ldm.s	r15, 28
#1:	       ldi	49 -> r0
#2:	       ldi	0 -> r12
	;;
#0:	       or	r31, 0 -> r1
	;;
#0:	       stmb.a	r0, r1, 0
	;;
#0:	       ldm.s	r15, 24
	;;
#0:	       or	r31, 0 -> r3
	;;
#0:	       add	r3, 1 -> r0
	;;
#0:	       stm.s	r0, r15, 6
	;;
#0:	       br	.BB16_416
#1:	       ldm.s	r15, 28
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       add	r0, 1 -> r0.23
	;;
.BB16_240:                              ; %.loopexit133
#0:	       add	r0, 1 -> r0
#1:	       or	r4, 0 -> r1
	;;
.BB16_241:
#0:	       add	r4, 1 -> r0.23
#1:	       br @	.BB16_422
#2:	       stmb.a	r0, r1, 0
	;;
.BB16_242:
#0:	       or	r11, 0 -> r10
#1:	       br @	.BB16_415
	;;
.BB16_243:                              ; %.loopexit57.loopexit
#0:	       ldm.s	r15, 28
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       add	r0, r2 -> r0.23
	;;
.BB16_244:                              ; %.loopexit57.loopexit
#0:	       or	r12, 0 -> r0
#1:	       br	.BB16_422
	;;
#0:	       stm.s	r0, r15, 6
	;;
	       nop	0
	;;
.BB16_245:
#2:	       sub	r2.24, r0 -> r10
	;;
.BB16_246:
#1:	       cmp lt	r1.23, 0 -> c1
#0:	       ldi	0 -> r1
	;;
#1:	       or	r1.23, 0 -> r0
	;;
#0:	       br	.BB16_249
#2:	if  c1 or	r1, 0 -> r0
#1:	       sra	r1.23, 31 -> r1
	;;
#1:	       and	r1, r1.23 -> r1
	;;
#2:	       sub	r2.23, r1 -> r12
	;;
.BB16_247:
#0:	       ldi	54 -> r0
	;;
#1:	       sub	r0, r1.25 -> r0
	;;
.BB16_248:
#2:	       or	r2.24, 0 -> r10
	;;
#2:	       or	r2.23, 0 -> r12
	;;
.BB16_249:                              ; %._crit_edge265
#1:	       add	r0, r1.24 -> r1.24
#2:	       add	r0, r2.23 -> r2.23
#0:	       ldmg.d	_impure_data+76
	;;
#0:	       brz ne @	r31, .BB16_272
#1:	       or	r31, 0 -> r3
	;;
.BB16_250:
#0:	       ldi	132 -> r0
#1:	       callg	__malloc_r
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r3
	;;
#0:	       brz eq @	r3, .BB16_256
	;;
.BB16_251:
#0:	       ldm.f	r3, -4
#1:	       ldi	-4 -> r0
	;;
#0:	       sub	r31, 4 -> r1
	;;
#0:	       and	r1, r0 -> r2
#1:	       ldi	36 -> r1
	;;
#0:	       cmpu gt	r2, r1 -> c1
	;;
#0:	if  c1 br @	.BB16_257
	;;
.BB16_252:
#0:	       cmpu lt	r2, 20 -> c1
#1:	       or	r3, 0 -> r0
	;;
#0:	if  c1 br @	.BB16_266
	;;
.BB16_253:
#0:	       cmpu lt	r2, 28 -> c1
#1:	       stm.a	0, r3, 0
	;;
#0:	if  c1 br @	.BB16_264
#1:	       stm.a	0, r3, 1
	;;
.BB16_254:
#0:	       ldi	36 -> r0
#1:	       stm.a	0, r3, 2
	;;
#0:	       cmpu lt	r2, r0 -> c1
#1:	       stm.a	0, r3, 3
	;;
#0:	if  c1 br @	.BB16_265
	;;
.BB16_255:
#0:	       add	r3, 24 -> r0
#1:	       br	.BB16_266
#2:	       stm.a	0, r3, 4
	;;
#0:	       stm.a	0, r3, 5
	;;
	       nop	0
	;;
.BB16_256:                              ; %_calloc_r.exit35.thread
#0:	       ldi	0 -> r11
#1:	       br	.BB16_296
#2:	       ldga	_impure_data -> r0
	;;
#0:	       stm.a	0, r0, 19
	;;
	       nop	0
	;;
.BB16_257:
#0:	       or	r3, 0 -> r0
#1:	       br @	.BB16_259
	;;
.BB16_258:                              ;   in Loop: Header=BB16_259 Depth=1
#0:	       stmb.a	0, r0, 0
#1:	       add	r0, 1 -> r0
#2:	       sub	r2, 1 -> r2
	;;
.BB16_259:                              ; %.preheader243
                                        ; =>This Inner Loop Header: Depth=1
#0:	       and	r0, 3 -> r1
	;;
#0:	       brz eq @	r1, .BB16_261
	;;
.BB16_260:                              ;   in Loop: Header=BB16_259 Depth=1
#0:	       brz ne @	r2, .BB16_258
	;;
#0:	       brz eq @	r2, .BB16_271
	;;
.BB16_261:
#0:	       cmpu lt	r2, 4 -> c1
	;;
#0:	if  c1 br @	.BB16_269
	;;
.BB16_262:
#0:	       cmpu gt	r2, 15 -> c1
	;;
#0:	if !c1 br @	.BB16_267
	;;
.BB16_263:                              ; %.lr.ph8.i41
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sub	r2, 16 -> r2
#1:	       stm.a	0, r0, 3
	;;
#0:	       cmpu gt	r2, 15 -> c1
#1:	       stm.a	0, r0, 2
	;;
#0:	if !c1 br	.BB16_268
#1:	if  c1 br	.BB16_263
#2:	       stm.a	0, r0, 1
	;;
#0:	       stm.a	0, r0, 0
#1:	       add	r0, 16 -> r0
	;;
	       nop	0
	;;
.BB16_264:
#0:	       add	r3, 8 -> r0
#1:	       br @	.BB16_266
	;;
.BB16_265:
#0:	       add	r3, 16 -> r0
	;;
.BB16_266:
#0:	       stm.a	0, r0, 0
#1:	       br	.BB16_271
	;;
#0:	       stm.a	0, r0, 1
	;;
#0:	       stm.a	0, r0, 2
	;;
.BB16_267:                              ; %.lr.ph.i44
#0:	       stm.a	0, r0, 0
#1:	       add	r0, 4 -> r0
#2:	       sub	r2, 4 -> r2
	;;
.BB16_268:                              ; %.lr.ph.i44
#0:	       cmpu gt	r2, 3 -> c1
	;;
#0:	if  c1 br @	.BB16_267
	;;
.BB16_269:                              ; %.preheader11.i50
#0:	       brz eq @	r2, .BB16_271
	;;
.BB16_270:                              ; %.lr.ph14.i53
                                        ; =>This Inner Loop Header: Depth=1
#0:	       stmb.a	0, r0, 0
#1:	       add	r0, 1 -> r0
#2:	       sub	r2, 1 -> r2
	;;
#0:	       brz ne @	r2, .BB16_270
	;;
.BB16_271:                              ; %_calloc_r.exit35
#0:	       ldga	_impure_data -> r0
	;;
#0:	       stm.a	r3, r0, 19
	;;
.BB16_272:
#0:	       ldm.f	r3, 4
	;;
#0:	       or	r31, 0 -> r4
	;;
#0:	       brz eq @	r4, .BB16_274
	;;
.BB16_273:
#0:	       ldm.f	r4, 0
#1:	       br	.BB16_295
	;;
#0:	       stm.a	r31, r3, 1
	;;
	       nop	0
	;;
.BB16_274:
#0:	       ldi	28 -> r0
#1:	       callg	__malloc_r
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r4
#1:	       ldi	0 -> r11
	;;
#0:	       brz eq @	r4, .BB16_296
	;;
.BB16_275:
#0:	       ldm.f	r4, -4
#1:	       ldi	-4 -> r0
#2:	       ldi	36 -> r3
	;;
#0:	       sub	r31, 4 -> r1
	;;
#0:	       and	r1, r0 -> r2
	;;
#0:	       cmpu gt	r2, r3 -> c1
	;;
#0:	if  c1 br @	.BB16_280
	;;
.BB16_276:
#0:	       cmpu lt	r2, 20 -> c1
#1:	       or	r4, 0 -> r0
	;;
#0:	if  c1 br @	.BB16_289
	;;
.BB16_277:
#0:	       cmpu lt	r2, 28 -> c1
#1:	       stm.a	0, r4, 0
	;;
#0:	if  c1 br @	.BB16_287
#1:	       stm.a	0, r4, 1
	;;
.BB16_278:
#0:	       ldi	36 -> r0
#1:	       stm.a	0, r4, 2
	;;
#0:	       cmpu lt	r2, r0 -> c1
#1:	       stm.a	0, r4, 3
	;;
#0:	if  c1 br @	.BB16_288
	;;
.BB16_279:
#0:	       add	r4, 24 -> r0
#1:	       br	.BB16_289
#2:	       stm.a	0, r4, 4
	;;
#0:	       stm.a	0, r4, 5
	;;
	       nop	0
	;;
.BB16_280:
#0:	       or	r4, 0 -> r0
#1:	       br @	.BB16_282
	;;
.BB16_281:                              ;   in Loop: Header=BB16_282 Depth=1
#0:	       stmb.a	0, r0, 0
#1:	       add	r0, 1 -> r0
#2:	       sub	r2, 1 -> r2
	;;
.BB16_282:                              ; %.preheader245
                                        ; =>This Inner Loop Header: Depth=1
#0:	       and	r0, 3 -> r1
	;;
#0:	       brz eq @	r1, .BB16_284
	;;
.BB16_283:                              ;   in Loop: Header=BB16_282 Depth=1
#0:	       brz ne @	r2, .BB16_281
	;;
#0:	       brz eq @	r2, .BB16_294
	;;
.BB16_284:
#0:	       cmpu lt	r2, 4 -> c1
	;;
#0:	if  c1 br @	.BB16_292
	;;
.BB16_285:
#0:	       cmpu gt	r2, 15 -> c1
	;;
#0:	if !c1 br @	.BB16_290
	;;
.BB16_286:                              ; %.lr.ph8.i18
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sub	r2, 16 -> r2
#1:	       stm.a	0, r0, 3
	;;
#0:	       cmpu gt	r2, 15 -> c1
#1:	       stm.a	0, r0, 2
	;;
#0:	if !c1 br	.BB16_291
#1:	if  c1 br	.BB16_286
#2:	       stm.a	0, r0, 1
	;;
#0:	       stm.a	0, r0, 0
#1:	       add	r0, 16 -> r0
	;;
	       nop	0
	;;
.BB16_287:
#0:	       add	r4, 8 -> r0
#1:	       br @	.BB16_289
	;;
.BB16_288:
#0:	       add	r4, 16 -> r0
	;;
.BB16_289:
#0:	       stm.a	0, r0, 0
#1:	       br	.BB16_294
	;;
#0:	       stm.a	0, r0, 1
	;;
#0:	       stm.a	0, r0, 2
	;;
.BB16_290:                              ; %.lr.ph.i21
#0:	       stm.a	0, r0, 0
#1:	       add	r0, 4 -> r0
#2:	       sub	r2, 4 -> r2
	;;
.BB16_291:                              ; %.lr.ph.i21
#0:	       cmpu gt	r2, 3 -> c1
	;;
#0:	if  c1 br @	.BB16_290
	;;
.BB16_292:                              ; %.preheader11.i27
#0:	       brz eq @	r2, .BB16_294
	;;
.BB16_293:                              ; %.lr.ph14.i30
                                        ; =>This Inner Loop Header: Depth=1
#0:	       stmb.a	0, r0, 0
#1:	       add	r0, 1 -> r0
#2:	       sub	r2, 1 -> r2
	;;
#0:	       brz ne @	r2, .BB16_293
	;;
.BB16_294:                              ; %_calloc_r.exit12
#0:	       stm.a	1, r4, 1
	;;
#0:	       stm.a	2, r4, 2
	;;
.BB16_295:
#0:	       stm.a	0, r4, 4
#1:	       or	r4, 0 -> r11
	;;
#0:	       stm.a	0, r4, 3
	;;
.BB16_296:                              ; %__i2b.exit
#0:	       stm.a	1, r11, 5
	;;
#0:	       stm.a	1, r11, 4
	;;
.BB16_297:
#1:	       cmp gt	r1.24, 0 -> c2
#0:	       cmp gt	r12, 0 -> c1
	;;
#0:	       comb	and c1, c2 -> c1
	;;
#0:	if !c1 br @	.BB16_299
	;;
.BB16_298:
#1:	       cmp lt	r12, r1.24 -> c1
	;;
#1:	       or	r1.24, 0 -> r0
	;;
#0:	if  c1 or	r12, 0 -> r0
	;;
#1:	       sub	r1.24, r0 -> r1.24
#2:	       sub	r2.23, r0 -> r2.23
#0:	       sub	r12, r0 -> r12
	;;
.BB16_299:
#2:	       cmp lt	r2.24, 1 -> c1
	;;
#0:	if  c1 br @	.BB16_310
	;;
.BB16_300:
#3:	       brz eq @	r3.26, .BB16_304
	;;
.BB16_301:
#0:	       cmp lt	r10, 1 -> c1
	;;
#0:	if  c1 br @	.BB16_305
	;;
.BB16_302:
#0:	       or	r11, 0 -> r0
#1:	       callg	___pow5mult
#2:	       or	r10, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       callg	___multiply
#1:	       or	r0, 0 -> r11
#2:	       or	r13, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz eq @	r13, .BB16_306
#1:	       or	r0, 0 -> r2
	;;
.BB16_303:
#0:	       ldm.f	r13, 4
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldmg.d	_impure_data+76
	;;
#0:	       ldmr.f	r0, r31, 2
	;;
#0:	       stm.a	r31, r13, 0
	;;
#0:	       br	.BB16_306
#1:	       ldmg.d	_impure_data+76
	;;
#0:	       s2add	r31, r0 -> r0
	;;
#0:	       stm.a	r13, r0, 0
	;;
.BB16_304:
#2:	       or	r2.24, 0 -> r1
#0:	       br @	.BB16_308
#1:	       or	r13, 0 -> r0
	;;
.BB16_305:
#0:	       or	r13, 0 -> r2
	;;
.BB16_306:                              ; %_Bfree.exit32
#2:	       cmp eq	r2.24, r10 -> c1
	;;
#0:	if  c1 br @	.BB16_309
	;;
.BB16_307:
#2:	       sub	r2.24, r10 -> r1
#0:	       or	r2, 0 -> r0
	;;
.BB16_308:
#0:	       callg	___pow5mult
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       br @	.BB16_310
#1:	       or	r0, 0 -> r13
	;;
.BB16_309:
#0:	       or	r2, 0 -> r13
	;;
.BB16_310:                              ; %._crit_edge264
#0:	       ldmg.d	_impure_data+76
	;;
#0:	       brz ne @	r31, .BB16_333
#1:	       or	r31, 0 -> r1
	;;
.BB16_311:
#0:	       ldi	132 -> r0
#1:	       callg	__malloc_r
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r1
	;;
#0:	       brz eq @	r1, .BB16_317
	;;
.BB16_312:
#0:	       ldm.f	r1, -4
#1:	       ldi	-4 -> r0
	;;
#0:	       sub	r31, 4 -> r2
	;;
#0:	       and	r2, r0 -> r3
#1:	       ldi	36 -> r2
	;;
#0:	       cmpu gt	r3, r2 -> c1
	;;
#0:	if  c1 br @	.BB16_318
	;;
.BB16_313:
#0:	       cmpu lt	r3, 20 -> c1
#1:	       or	r1, 0 -> r0
	;;
#0:	if  c1 br @	.BB16_327
	;;
.BB16_314:
#0:	       cmpu lt	r3, 28 -> c1
#1:	       stm.a	0, r1, 0
	;;
#0:	if  c1 br @	.BB16_325
#1:	       stm.a	0, r1, 1
	;;
.BB16_315:
#0:	       ldi	36 -> r0
#1:	       stm.a	0, r1, 2
	;;
#0:	       cmpu lt	r3, r0 -> c1
#1:	       stm.a	0, r1, 3
	;;
#0:	if  c1 br @	.BB16_326
	;;
.BB16_316:
#0:	       add	r1, 24 -> r0
#1:	       br	.BB16_327
#2:	       stm.a	0, r1, 4
	;;
#0:	       stm.a	0, r1, 5
	;;
	       nop	0
	;;
.BB16_317:                              ; %_calloc_r.exit85.thread
#0:	       ldi	0 -> r10
#1:	       br	.BB16_357
#2:	       ldga	_impure_data -> r0
	;;
#0:	       stm.a	0, r0, 19
	;;
	       nop	0
	;;
.BB16_318:
#0:	       or	r1, 0 -> r0
#1:	       br @	.BB16_320
	;;
.BB16_319:                              ;   in Loop: Header=BB16_320 Depth=1
#0:	       stmb.a	0, r0, 0
#1:	       add	r0, 1 -> r0
#2:	       sub	r3, 1 -> r3
	;;
.BB16_320:                              ; %.preheader247
                                        ; =>This Inner Loop Header: Depth=1
#0:	       and	r0, 3 -> r2
	;;
#0:	       brz eq @	r2, .BB16_322
	;;
.BB16_321:                              ;   in Loop: Header=BB16_320 Depth=1
#0:	       brz ne @	r3, .BB16_319
	;;
#0:	       brz eq @	r3, .BB16_332
	;;
.BB16_322:
#0:	       cmpu lt	r3, 4 -> c1
	;;
#0:	if  c1 br @	.BB16_330
	;;
.BB16_323:
#0:	       cmpu gt	r3, 15 -> c1
	;;
#0:	if !c1 br @	.BB16_328
	;;
.BB16_324:                              ; %.lr.ph8.i91
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sub	r3, 16 -> r3
#1:	       stm.a	0, r0, 3
	;;
#0:	       cmpu gt	r3, 15 -> c1
#1:	       stm.a	0, r0, 2
	;;
#0:	if !c1 br	.BB16_329
#1:	if  c1 br	.BB16_324
#2:	       stm.a	0, r0, 1
	;;
#0:	       stm.a	0, r0, 0
#1:	       add	r0, 16 -> r0
	;;
	       nop	0
	;;
.BB16_325:
#0:	       add	r1, 8 -> r0
#1:	       br @	.BB16_327
	;;
.BB16_326:
#0:	       add	r1, 16 -> r0
	;;
.BB16_327:
#0:	       stm.a	0, r0, 0
#1:	       br	.BB16_332
	;;
#0:	       stm.a	0, r0, 1
	;;
#0:	       stm.a	0, r0, 2
	;;
.BB16_328:                              ; %.lr.ph.i94
#0:	       stm.a	0, r0, 0
#1:	       add	r0, 4 -> r0
#2:	       sub	r3, 4 -> r3
	;;
.BB16_329:                              ; %.lr.ph.i94
#0:	       cmpu gt	r3, 3 -> c1
	;;
#0:	if  c1 br @	.BB16_328
	;;
.BB16_330:                              ; %.preheader11.i100
#0:	       brz eq @	r3, .BB16_332
	;;
.BB16_331:                              ; %.lr.ph14.i103
                                        ; =>This Inner Loop Header: Depth=1
#0:	       stmb.a	0, r0, 0
#1:	       add	r0, 1 -> r0
#2:	       sub	r3, 1 -> r3
	;;
#0:	       brz ne @	r3, .BB16_331
	;;
.BB16_332:                              ; %_calloc_r.exit85
#0:	       ldga	_impure_data -> r0
	;;
#0:	       stm.a	r1, r0, 19
	;;
.BB16_333:
#0:	       ldm.f	r1, 4
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       brz eq @	r0, .BB16_335
	;;
.BB16_334:
#0:	       ldm.f	r0, 0
#1:	       br	.BB16_356
	;;
#0:	       stm.a	r31, r1, 1
	;;
	       nop	0
	;;
.BB16_335:
#0:	       ldi	28 -> r0
#1:	       callg	__malloc_r
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz eq @	r0, .BB16_357
#1:	       ldi	0 -> r10
	;;
.BB16_336:
#0:	       ldm.f	r0, -4
#1:	       ldi	-4 -> r1
	;;
#0:	       sub	r31, 4 -> r2
	;;
#0:	       and	r2, r1 -> r3
#1:	       ldi	36 -> r2
	;;
#0:	       cmpu gt	r3, r2 -> c1
	;;
#0:	if  c1 br @	.BB16_341
	;;
.BB16_337:
#0:	       cmpu lt	r3, 20 -> c1
#1:	       or	r0, 0 -> r1
	;;
#0:	if  c1 br @	.BB16_350
	;;
.BB16_338:
#0:	       cmpu lt	r3, 28 -> c1
#1:	       stm.a	0, r0, 0
	;;
#0:	if  c1 br @	.BB16_348
#1:	       stm.a	0, r0, 1
	;;
.BB16_339:
#0:	       ldi	36 -> r1
#1:	       stm.a	0, r0, 2
	;;
#0:	       cmpu lt	r3, r1 -> c1
#1:	       stm.a	0, r0, 3
	;;
#0:	if  c1 br @	.BB16_349
	;;
.BB16_340:
#0:	       add	r0, 24 -> r1
#1:	       br	.BB16_350
#2:	       stm.a	0, r0, 4
	;;
#0:	       stm.a	0, r0, 5
	;;
	       nop	0
	;;
.BB16_341:
#0:	       or	r0, 0 -> r1
#1:	       br @	.BB16_343
	;;
.BB16_342:                              ;   in Loop: Header=BB16_343 Depth=1
#0:	       stmb.a	0, r1, 0
#1:	       add	r1, 1 -> r1
#2:	       sub	r3, 1 -> r3
	;;
.BB16_343:                              ; %.preheader249
                                        ; =>This Inner Loop Header: Depth=1
#0:	       and	r1, 3 -> r2
	;;
#0:	       brz eq @	r2, .BB16_345
	;;
.BB16_344:                              ;   in Loop: Header=BB16_343 Depth=1
#0:	       brz ne @	r3, .BB16_342
	;;
#0:	       brz eq @	r3, .BB16_355
	;;
.BB16_345:
#0:	       cmpu lt	r3, 4 -> c1
	;;
#0:	if  c1 br @	.BB16_353
	;;
.BB16_346:
#0:	       cmpu gt	r3, 15 -> c1
	;;
#0:	if !c1 br @	.BB16_351
	;;
.BB16_347:                              ; %.lr.ph8.i67
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sub	r3, 16 -> r3
#1:	       stm.a	0, r1, 3
	;;
#0:	       cmpu gt	r3, 15 -> c1
#1:	       stm.a	0, r1, 2
	;;
#0:	if !c1 br	.BB16_352
#1:	if  c1 br	.BB16_347
#2:	       stm.a	0, r1, 1
	;;
#0:	       stm.a	0, r1, 0
#1:	       add	r1, 16 -> r1
	;;
	       nop	0
	;;
.BB16_348:
#0:	       add	r0, 8 -> r1
#1:	       br @	.BB16_350
	;;
.BB16_349:
#0:	       add	r0, 16 -> r1
	;;
.BB16_350:
#0:	       stm.a	0, r1, 0
#1:	       br	.BB16_355
	;;
#0:	       stm.a	0, r1, 1
	;;
#0:	       stm.a	0, r1, 2
	;;
.BB16_351:                              ; %.lr.ph.i70
#0:	       stm.a	0, r1, 0
#1:	       add	r1, 4 -> r1
#2:	       sub	r3, 4 -> r3
	;;
.BB16_352:                              ; %.lr.ph.i70
#0:	       cmpu gt	r3, 3 -> c1
	;;
#0:	if  c1 br @	.BB16_351
	;;
.BB16_353:                              ; %.preheader11.i76
#0:	       brz eq @	r3, .BB16_355
	;;
.BB16_354:                              ; %.lr.ph14.i79
                                        ; =>This Inner Loop Header: Depth=1
#0:	       stmb.a	0, r1, 0
#1:	       add	r1, 1 -> r1
#2:	       sub	r3, 1 -> r3
	;;
#0:	       brz ne @	r3, .BB16_354
	;;
.BB16_355:                              ; %_calloc_r.exit61
#0:	       stm.a	1, r0, 1
	;;
#0:	       stm.a	2, r0, 2
	;;
.BB16_356:
#0:	       stm.a	0, r0, 4
#1:	       or	r0, 0 -> r10
	;;
#0:	       stm.a	0, r0, 3
	;;
.BB16_357:                              ; %__i2b.exit58
#2:	       cmp lt	r2.26, 1 -> c1
#0:	       stm.a	1, r10, 5
	;;
#0:	if  c1 br @	.BB16_359
#1:	       stm.a	1, r10, 4
	;;
.BB16_358:
#2:	       or	r2.26, 0 -> r1
#0:	       callg	___pow5mult
#1:	       or	r10, 0 -> r0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r10
	;;
.BB16_359:
#3:	       cmp ne	r3.23, 0 -> c2
#1:	       cmp gt	r1.27, 1 -> c1
#0:	       ldi	0 -> r14
	;;
#0:	       comb	or c1, c2 -> c1
	;;
#0:	if  c1 br @	.BB16_361
	;;
.BB16_360:
#0:	       ldm.s	r15, 12
#1:	       ldi	0 -> r14
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldm.s	r15, 16
	;;
#0:	       cmp eq	r0, 0 -> c2
	;;
#0:	       or	r31, 0 -> r3
	;;
#0:	       cmp ne	r3, 0 -> c1
	;;
#0:	       comb	or c1, c2 -> c1
	;;
#1:	if !c1 add	r1.24, 1 -> r1.24
#2:	if !c1 add	r2.23, 1 -> r2.23
#0:	if !c1 ldi	1 -> r14
	;;
.BB16_361:
#0:	       ldi	1 -> r0
#2:	       brz eq @	r2.26, .BB16_367
	;;
.BB16_362:
#0:	       ldm.f	r10, 16
#1:	       ldiu	2047 -> r3
#2:	       ldi	16 -> r4
	;;
#0:	       ldim	1023 -> r3
	;;
#0:	       s2add	r10, r31 -> r0
#1:	       or	r3, 0 -> r1
#2:	       ldih	127 -> r3
	;;
#0:	       ldm.f	r0, 16
#1:	       ldiu	2047 -> r0
#2:	       ldih	7 -> r1
	;;
#0:	       ldim	31 -> r0
	;;
#0:	       cmpu gt	r31, r0 -> c2
#1:	       or	r31, 0 -> r2
#2:	       ldi	0 -> r0
	;;
#0:	if !c2 sl	r2, 16 -> r2 ; aiaf
#1:	if  c2 or	r0, 0 -> r4
#2:	       ldiu	2047 -> r0
	;;
#0:	       cmpu gt	r2, r1 -> c1
#1:	       ldim	1023 -> r0
	;;
#0:	if !c1 sl	r2, 8 -> r2
#1:	if !c1 or	r4, 8 -> r4
#2:	       ldih	511 -> r0
	;;
#0:	       cmpu gt	r2, r3 -> c2
	;;
#0:	if !c2 sl	r2, 4 -> r2
#1:	if !c2 add	r4, 4 -> r4
	;;
#0:	       cmpu gt	r2, r0 -> c3
	;;
#0:	if !c3 sl	r2, 2 -> r2
#1:	if !c3 add	r4, 2 -> r4
	;;
#0:	       brz lt @	r2, .BB16_365
	;;
.BB16_363:
#0:	       btest	r2, 30 -> !c1
#1:	       ldi	32 -> r0
	;;
#0:	if  c1 br @	.BB16_366
	;;
.BB16_364:
#0:	       add	r4, 1 -> r0
#1:	       br @	.BB16_366
	;;
.BB16_365:
#0:	       or	r4, 0 -> r0
	;;
.BB16_366:                              ; %__hi0bits.exit
#0:	       ldi	32 -> r1
	;;
#0:	       sub	r1, r0 -> r0
	;;
.BB16_367:
#1:	       add	r0, r1.24 -> r0
#0:	       ldi	0 -> r2
	;;
#0:	       and	r0, 31 -> r1
#1:	       ldi	32 -> r0
	;;
#0:	       cmp eq	r1, 0 -> c1
	;;
#0:	if !c1 sub	r0, r1 -> r2 ; aaaf
	;;
#0:	       cmpu lt	r2, 5 -> c1
	;;
#0:	if  c1 br @	.BB16_369
	;;
.BB16_368:
#0:	       sub	r2, 4 -> r0
#1:	       br @	.BB16_371
	;;
.BB16_369:
#0:	       cmpu gt	r2, 3 -> c1
	;;
#0:	if  c1 br @	.BB16_372
	;;
.BB16_370:
#0:	       add	r2, 28 -> r0
	;;
.BB16_371:
#1:	       add	r0, r1.24 -> r1.24
#2:	       add	r0, r2.23 -> r2.23
#0:	       add	r0, r12 -> r12
	;;
.BB16_372:
#2:	       cmp lt	r2.23, 1 -> c1
	;;
#0:	if  c1 br @	.BB16_374
	;;
.BB16_373:
#2:	       or	r2.23, 0 -> r1
#0:	       callg	___lshift
#1:	       or	r13, 0 -> r0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r13
	;;
.BB16_374:
#1:	       cmp lt	r1.24, 1 -> c1
	;;
#0:	if  c1 br @	.BB16_376
	;;
.BB16_375:
#1:	       or	r1.24, 0 -> r1
#0:	       callg	___lshift
#2:	       or	r10, 0 -> r0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r10
	;;
.BB16_376:
#2:	       brz eq @	r2.27, .BB16_384
	;;
.BB16_377:
#0:	       ldm.f	r10, 16
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldm.f	r13, 16
	;;
#0:	       cmp eq	r31, r0 -> c1
#1:	       or	r31, 0 -> r1
	;;
#0:	if !c1 br @	.BB16_381
	;;
.BB16_378:
#0:	       sl	r1, 2 -> r2
#1:	       add	r13, 20 -> r3
	;;
.BB16_379:                              ; =>This Inner Loop Header: Depth=1
#0:	       add	r10, r2 -> r0
	;;
#0:	       ldm.f	r0, 16
#1:	       add	r13, r2 -> r0
	;;
#0:	       or	r31, 0 -> r1
#1:	       ldm.f	r0, 16
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       cmp eq	r0, r1 -> c1
	;;
#0:	if !c1 br @	.BB16_382
	;;
.BB16_380:                              ;   in Loop: Header=BB16_379 Depth=1
#0:	       sub	r2, 4 -> r2
	;;
#0:	       add	r13, r2 -> r0
	;;
#0:	       add	r0, 20 -> r0
	;;
#0:	       cmpu gt	r0, r3 -> c1
	;;
#0:	if !c1 br @	.BB16_384
#1:	if  c1 br @	.BB16_379
	;;
.BB16_381:
#0:	       sub	r1, r0 -> r0
#1:	       br @	.BB16_383
	;;
.BB16_382:
#0:	       cmpu lt	r0, r1 -> c1
#1:	       ldi	1 -> r0
#2:	       ldi	-1 -> r3
	;;
#0:	if  c1 or	r3, 0 -> r0
	;;
.BB16_383:                              ; %__mcmp.exit108
#0:	       cmp gt	r0, -1 -> c1
	;;
#0:	if !c1 br @	.BB16_394
	;;
.BB16_384:
#1:	       or	r1.23, 0 -> r0
	;;
#0:	       stm.s	r0, r15, 5
	;;
.BB16_385:                              ; %__mcmp.exit108.thread
#1:	       cmp gt	r1.27, 2 -> c2
#0:	       ldm.s	r15, 20
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       cmp lt	r0, 1 -> c1
	;;
#0:	       comb	and c1, c2 -> c1
	;;
#0:	if !c1 br @	.BB16_391
	;;
.BB16_386:
#0:	       ldm.s	r15, 20
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       cmp lt	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB16_415
	;;
.BB16_387:
#0:	       or	r10, 0 -> r0
#1:	       callg	___multadd
#2:	       ldi	5 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r10
	;;
#0:	       ldm.f	r10, 16
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldm.f	r13, 16
	;;
#0:	       cmp eq	r31, r0 -> c1
#1:	       or	r31, 0 -> r1
	;;
#0:	if !c1 br @	.BB16_404
	;;
.BB16_388:
#0:	       sl	r1, 2 -> r2
#1:	       add	r13, 20 -> r3
	;;
.BB16_389:                              ; =>This Inner Loop Header: Depth=1
#0:	       add	r10, r2 -> r0
	;;
#0:	       ldm.f	r0, 16
#1:	       add	r13, r2 -> r0
	;;
#0:	       or	r31, 0 -> r1
#1:	       ldm.f	r0, 16
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       cmp eq	r0, r1 -> c1
	;;
#0:	if !c1 br @	.BB16_414
	;;
.BB16_390:                              ;   in Loop: Header=BB16_389 Depth=1
#0:	       sub	r2, 4 -> r2
	;;
#0:	       add	r13, r2 -> r0
	;;
#0:	       add	r0, 20 -> r0
	;;
#0:	       cmpu gt	r0, r3 -> c1
	;;
#0:	if !c1 br @	.BB16_415
#1:	if  c1 br @	.BB16_389
	;;
.BB16_391:
#3:	       brz eq @	r3.26, .BB16_396
	;;
.BB16_392:
#0:	       cmp lt	r12, 1 -> c1
	;;
#0:	if  c1 br @	.BB16_405
	;;
.BB16_393:
#0:	       or	r11, 0 -> r0
#1:	       callg	___lshift
#2:	       or	r12, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       br @	.BB16_406
#1:	       or	r0, 0 -> r12
	;;
.BB16_394:
#0:	       or	r13, 0 -> r0
#1:	       callg	___multadd
#2:	       ldi	10 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldm.s	r15, 24
#1:	       or	r0, 0 -> r13
	;;
#3:	       brz eq	r3.26, .BB16_385
#0:	       or	r31, 0 -> r3
	;;
#0:	       sub	r3, 1 -> r0
	;;
#0:	       stm.s	r0, r15, 6
	;;
.BB16_395:
#0:	       or	r11, 0 -> r0
#1:	       callg	___multadd
#2:	       ldi	10 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       br @	.BB16_385
#1:	       or	r0, 0 -> r11
	;;
.BB16_396:                              ; %.preheader78
#0:	       or	r13, 0 -> r0
#1:	       callg	_quorem
#2:	       or	r10, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       s2add	r0, 12 -> r0.23
#1:	       ldm.s	r15, 28
#2:	       ldi	0 -> r12
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       stmb.a	r0.23, r0, 0
	;;
#0:	       ldm.s	r15, 28
	;;
#0:	       or	r31, 0 -> r2
#1:	       ldm.s	r15, 20
	;;
#0:	       add	r2, 1 -> r14
	;;
#0:	       or	r31, 0 -> r3
	;;
#0:	       cmp lt	r3, 2 -> c1
	;;
#0:	if  c1 br @	.BB16_400
	;;
.BB16_397:                              ; %.lr.ph84
#0:	       ldm.s	r15, 20
#1:	       ldi	0 -> r12
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldm.s	r15, 28
	;;
#0:	       or	r31, 0 -> r1
#1:	       ldm.s	r15, 20
	;;
#0:	       add	r1, r0 -> r0.24
	;;
#0:	       or	r31, 0 -> r0
	;;
#3:	       sub	r0, 1 -> r3.23
	;;
.BB16_398:                              ; =>This Inner Loop Header: Depth=1
#0:	       or	r13, 0 -> r0
#1:	       callg	___multadd
#2:	       ldi	10 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       callg	_quorem
#1:	       or	r0, 0 -> r13
#2:	       or	r10, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       s2add	r0, 12 -> r0.23
#3:	       sub	r3.23, 1 -> r3.23
	;;
#3:	       brz ne @	r3.23, .BB16_398
#0:	       stmb.a	r0.23, r14, 0
#1:	       add	r14, 1 -> r14
	;;
.BB16_399:
#0:	       or	r0.24, 0 -> r14
	;;
.BB16_400:                              ; %.loopexit79
#0:	       or	r13, 0 -> r0
#1:	       callg	___lshift
#2:	       ldi	1 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r13
	;;
#0:	       ldm.f	r13, 16
	;;
#0:	       or	r31, 0 -> r1
#1:	       ldm.f	r10, 16
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       cmp eq	r1, r0 -> c1
	;;
#0:	if !c1 br @	.BB16_438
	;;
.BB16_401:
#0:	       ldi	16 -> r0
#1:	       add	r13, 20 -> r3
	;;
#0:	       s2add	r0, r1 -> r0
	;;
#0:	       add	r10, r0 -> r4
#1:	       add	r13, r0 -> r0
	;;
.BB16_402:                              ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r4, 0
	;;
#0:	       or	r31, 0 -> r1
#1:	       ldm.f	r0, 0
	;;
#0:	       or	r31, 0 -> r2
	;;
#0:	       cmp eq	r2, r1 -> c1
	;;
#0:	if !c1 br @	.BB16_439
	;;
.BB16_403:                              ;   in Loop: Header=BB16_402 Depth=1
#0:	       cmpu gt	r0, r3 -> c1
#1:	       sub	r4, 4 -> r4
#2:	       sub	r0, 4 -> r0
	;;
#0:	if !c1 br @	.BB16_442
#1:	if  c1 br @	.BB16_402
	;;
.BB16_404:
#0:	       sub	r1, r0 -> r0
	;;
#0:	       cmp gt	r0, 0 -> c3
	;;
#0:	if !c3 br @	.BB16_415
#1:	if  c3 br @	.BB16_239
	;;
.BB16_405:
#0:	       or	r11, 0 -> r12
	;;
.BB16_406:
#0:	       cmp eq	r14, 0 -> c3
#1:	       or	r12, 0 -> r11
	;;
#0:	if  c3 br @	.BB16_486
	;;
.BB16_407:
#0:	       ldm.f	r12, 4
	;;
#0:	       or	r31, 0 -> r11
#1:	       ldmg.d	_impure_data+76
	;;
#0:	       cmp ne	r31, 0 -> c3
#1:	       or	r31, 0 -> r3
	;;
#0:	if  c3 br @	.BB16_450
	;;
.BB16_408:
#0:	       ldi	132 -> r0
#1:	       callg	__malloc_r
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r3
	;;
#0:	       cmp eq	r3, 0 -> c3
	;;
#0:	if  c3 br @	.BB16_427
	;;
.BB16_409:
#0:	       ldm.f	r3, -4
#1:	       ldi	-4 -> r0
	;;
#0:	       sub	r31, 4 -> r1
	;;
#0:	       and	r1, r0 -> r2
#1:	       ldi	36 -> r1
	;;
#0:	       cmpu gt	r2, r1 -> c1
	;;
#0:	if  c1 br @	.BB16_428
	;;
.BB16_410:
#0:	       cmpu lt	r2, 20 -> c1
#1:	       or	r3, 0 -> r0
	;;
#0:	if  c1 br @	.BB16_431
	;;
.BB16_411:
#0:	       cmpu lt	r2, 28 -> c1
#1:	       stm.a	0, r3, 0
	;;
#0:	if  c1 br @	.BB16_429
#1:	       stm.a	0, r3, 1
	;;
.BB16_412:
#0:	       ldi	36 -> r0
#1:	       stm.a	0, r3, 2
	;;
#0:	       cmpu lt	r2, r0 -> c1
#1:	       stm.a	0, r3, 3
	;;
#0:	if  c1 br @	.BB16_430
	;;
.BB16_413:
#0:	       add	r3, 24 -> r0
#1:	       br	.BB16_431
#2:	       stm.a	0, r3, 4
	;;
#0:	       stm.a	0, r3, 5
	;;
	       nop	0
	;;
.BB16_414:
#0:	       cmpu lt	r0, r1 -> c1
#1:	       ldi	1 -> r0
#2:	       ldi	-1 -> r3
	;;
#0:	if  c1 or	r3, 0 -> r0
	;;
#0:	       cmp gt	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB16_239
	;;
.BB16_415:                              ; %__mcmp.exit134.thread
#1:	       xor	r1.28, -1 -> r0
#0:	       ldi	0 -> r12
	;;
#0:	       stm.s	r0, r15, 6
	;;
#0:	       ldm.s	r15, 28
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       or	r0, 0 -> r0.23
	;;
.BB16_416:                              ; %.loopexit89
#0:	       brz eq @	r10, .BB16_418
	;;
.BB16_417:
#0:	       ldm.f	r10, 4
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldmg.d	_impure_data+76
	;;
#0:	       ldmr.f	r0, r31, 2
	;;
#0:	       stm.a	r31, r10, 0
	;;
#0:	       ldmg.d	_impure_data+76
	;;
#0:	       s2add	r31, r0 -> r0
	;;
#0:	       stm.a	r10, r0, 0
	;;
.BB16_418:                              ; %_Bfree.exit4
#0:	       brz eq @	r11, .BB16_422
	;;
.BB16_419:
#0:	       cmp eq	r12, r11 -> c2
#1:	       cmp eq	r12, 0 -> c1
	;;
#0:	       comb	or c1, c2 -> c1
	;;
#0:	if  c1 br @	.BB16_421
	;;
.BB16_420:                              ; %_Bfree.exit3._Bfree.exit3.thread_crit_edge
#0:	       ldm.f	r12, 4
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldmg.d	_impure_data+76
	;;
#0:	       ldmr.f	r0, r31, 2
	;;
#0:	       stm.a	r31, r12, 0
	;;
#0:	       ldmg.d	_impure_data+76
	;;
#0:	       s2add	r31, r0 -> r0
	;;
#0:	       stm.a	r12, r0, 0
	;;
.BB16_421:                              ; %_Bfree.exit3.thread
#0:	       ldm.f	r11, 4
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldmg.d	_impure_data+76
	;;
#0:	       ldmr.f	r0, r31, 2
	;;
#0:	       stm.a	r31, r11, 0
	;;
#0:	       ldmg.d	_impure_data+76
	;;
#0:	       s2add	r31, r0 -> r0
	;;
#0:	       stm.a	r11, r0, 0
	;;
.BB16_422:                              ; %.loopexit57
#0:	       brz eq @	r13, .BB16_424
	;;
.BB16_423:
#0:	       ldm.f	r13, 4
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldmg.d	_impure_data+76
	;;
#0:	       ldmr.f	r0, r31, 2
	;;
#0:	       stm.a	r31, r13, 0
	;;
#0:	       ldmg.d	_impure_data+76
	;;
#0:	       s2add	r31, r0 -> r0
	;;
#0:	       stm.a	r13, r0, 0
	;;
.BB16_424:                              ; %_Bfree.exit1
#0:	       stmb.a	0, r0.23, 0
	;;
#0:	       ldm.s	r15, 24
	;;
#0:	       brz eq	r0.25, .BB16_426
#1:	       or	r31, 0 -> r0
	;;
#0:	       add	r0, 1 -> r0
	;;
#0:	       stm.a	r0, r0.26, 0
	;;
.BB16_425:
#0:	       stm.a	r0.23, r0.25, 0
	;;
.BB16_426:
#0:	       ldm.s	r15, 28
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldm.s	r15, 212
	;;
#0:	       stx	r31 -> $ro
#1:	       ldm.s	r15, 216
	;;
#0:	       stx	r31 -> $rb
#1:	       ldm.s	r15, 220
	;;
#0:	       stx	r31 -> $f15
#1:	       ldm.s	r15, 224
	;;
#0:	       stx	r31 -> $f14
#1:	       ldm.s	r15, 228
	;;
#0:	       stx	r31 -> $f13
#1:	       ldm.s	r15, 232
	;;
#0:	       stx	r31 -> $f12
#1:	       ldm.s	r15, 236
	;;
#0:	       stx	r31 -> $f11
#1:	       ldm.s	r15, 240
	;;
#0:	       stx	r31 -> $f10
#1:	       ldm.s	r15, 244
	;;
#1:	       or	r31, 0 -> r1.29
#0:	       ldm.s	r15, 248
	;;
#3:	       or	r31, 0 -> r3.28
#0:	       ldm.s	r15, 252
	;;
#1:	       or	r31, 0 -> r1.28
#0:	       ldm.s	r15, 256
	;;
#3:	       or	r31, 0 -> r3.27
#0:	       ldm.s	r15, 260
	;;
#2:	       or	r31, 0 -> r2.27
#0:	       ldm.s	r15, 264
	;;
#1:	       or	r31, 0 -> r1.27
#0:	       ldm.s	r15, 268
	;;
#3:	       or	r31, 0 -> r3.26
#0:	       ldm.s	r15, 272
	;;
#2:	       or	r31, 0 -> r2.26
#0:	       ldm.s	r15, 276
	;;
#1:	       or	r31, 0 -> r1.26
#0:	       ldm.s	r15, 280
	;;
#0:	       or	r31, 0 -> r0.26
#1:	       ldm.s	r15, 284
	;;
#3:	       or	r31, 0 -> r3.25
#0:	       ldm.s	r15, 288
	;;
#2:	       or	r31, 0 -> r2.25
#0:	       ldm.s	r15, 292
	;;
#1:	       or	r31, 0 -> r1.25
#0:	       ldm.s	r15, 296
	;;
#0:	       or	r31, 0 -> r0.25
#1:	       ldm.s	r15, 300
	;;
#3:	       or	r31, 0 -> r3.24
#0:	       ldm.s	r15, 304
	;;
#2:	       or	r31, 0 -> r2.24
#0:	       ldm.s	r15, 308
	;;
#1:	       or	r31, 0 -> r1.24
#0:	       ldm.s	r15, 312
	;;
#0:	       or	r31, 0 -> r0.24
#1:	       ldm.s	r15, 316
	;;
#3:	       or	r31, 0 -> r3.23
#0:	       ldm.s	r15, 320
	;;
#2:	       or	r31, 0 -> r2.23
#0:	       ldm.s	r15, 324
	;;
#1:	       or	r31, 0 -> r1.23
#0:	       ldm.s	r15, 328
	;;
#0:	       or	r31, 0 -> r0.23
#1:	       ldm.s	r15, 332
	;;
#0:	       or	r31, 0 -> r14
#1:	       ldm.s	r15, 336
	;;
#0:	       or	r31, 0 -> r13
#1:	       ldm.s	r15, 340
	;;
#0:	       or	r31, 0 -> r12
#1:	       ldm.s	r15, 344
	;;
#0:	       or	r31, 0 -> r11
#1:	       ldm.s	r15, 348
#2:	       addi	368 -> r15
	;;
#0:	       jop	ret
#1:	       or	r31, 0 -> r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB16_427:                              ; %_calloc_r.exit165.thread
#0:	       ldi	0 -> r2
#1:	       br	.BB16_474
#2:	       ldga	_impure_data -> r0
	;;
#0:	       stm.a	0, r0, 19
	;;
	       nop	0
	;;
.BB16_428:
#0:	       or	r3, 0 -> r0
#1:	       br @	.BB16_433
	;;
.BB16_429:
#0:	       add	r3, 8 -> r0
#1:	       br @	.BB16_431
	;;
.BB16_430:
#0:	       add	r3, 16 -> r0
	;;
.BB16_431:
#0:	       stm.a	0, r0, 0
#1:	       br	.BB16_449
	;;
#0:	       stm.a	0, r0, 1
	;;
#0:	       stm.a	0, r0, 2
	;;
.BB16_432:                              ;   in Loop: Header=BB16_433 Depth=1
#0:	       stmb.a	0, r0, 0
#1:	       add	r0, 1 -> r0
#2:	       sub	r2, 1 -> r2
	;;
.BB16_433:                              ; %.preheader251
                                        ; =>This Inner Loop Header: Depth=1
#0:	       and	r0, 3 -> r1
	;;
#0:	       brz eq @	r1, .BB16_435
	;;
.BB16_434:                              ;   in Loop: Header=BB16_433 Depth=1
#0:	       brz ne @	r2, .BB16_432
	;;
#0:	       brz eq @	r2, .BB16_449
	;;
.BB16_435:
#0:	       cmpu lt	r2, 4 -> c1
	;;
#0:	if  c1 br @	.BB16_447
	;;
.BB16_436:
#0:	       cmpu gt	r2, 15 -> c1
	;;
#0:	if !c1 br @	.BB16_445
	;;
.BB16_437:                              ; %.lr.ph8.i171
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sub	r2, 16 -> r2
#1:	       stm.a	0, r0, 3
	;;
#0:	       cmpu gt	r2, 15 -> c1
#1:	       stm.a	0, r0, 2
	;;
#0:	if !c1 br	.BB16_446
#1:	if  c1 br	.BB16_437
#2:	       stm.a	0, r0, 1
	;;
#0:	       stm.a	0, r0, 0
#1:	       add	r0, 16 -> r0
	;;
	       nop	0
	;;
.BB16_438:
#0:	       sub	r1, r0 -> r0
#1:	       br @	.BB16_440
	;;
.BB16_439:
#0:	       cmpu lt	r2, r1 -> c1
#1:	       ldi	1 -> r0
#2:	       ldi	-1 -> r3
	;;
#0:	if  c1 or	r3, 0 -> r0
	;;
.BB16_440:                              ; %__mcmp.exit
#0:	       cmp gt	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB16_640
	;;
.BB16_441:
#0:	       brz ne @	r0, .BB16_443
	;;
.BB16_442:                              ; %.thread233
#0:	       btest	r0.23, 0 -> c1
	;;
#0:	if  c1 br @	.BB16_640
	;;
.BB16_443:                              ; %.preheader88.preheader
#0:	       add	r14, 1 -> r0.23
#1:	       ldi	48 -> r1
	;;
.BB16_444:                              ; %.preheader88
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r0.23, -2
	;;
#0:	       sub	r0.23, 2 -> r0
	;;
#0:	       sub	r0.23, 1 -> r0.23
#1:	       bbh	mzext8 r0 -> r0
	;;
#0:	       cmp eq	r0, r1 -> c1
	;;
#0:	if !c1 br @	.BB16_416
#1:	if  c1 br @	.BB16_444
	;;
.BB16_445:                              ; %.lr.ph.i174
#0:	       stm.a	0, r0, 0
#1:	       add	r0, 4 -> r0
#2:	       sub	r2, 4 -> r2
	;;
.BB16_446:                              ; %.lr.ph.i174
#0:	       cmpu gt	r2, 3 -> c1
	;;
#0:	if  c1 br @	.BB16_445
	;;
.BB16_447:                              ; %.preheader11.i180
#0:	       brz eq @	r2, .BB16_449
	;;
.BB16_448:                              ; %.lr.ph14.i183
                                        ; =>This Inner Loop Header: Depth=1
#0:	       stmb.a	0, r0, 0
#1:	       add	r0, 1 -> r0
#2:	       sub	r2, 1 -> r2
	;;
#0:	       brz ne @	r2, .BB16_448
	;;
.BB16_449:                              ; %_calloc_r.exit165
#0:	       ldga	_impure_data -> r0
	;;
#0:	       stm.a	r3, r0, 19
	;;
.BB16_450:
#0:	       ldmr.f	r11, r3, 2
	;;
#0:	       or	r31, 0 -> r4
	;;
#0:	       brz eq @	r4, .BB16_452
	;;
.BB16_451:
#0:	       ldm.f	r4, 0
#1:	       br	.BB16_473
#2:	       s2add	r3, r11 -> r0
	;;
#0:	       stm.a	r31, r0, 0
	;;
	       nop	0
	;;
.BB16_452:
#0:	       ldi	1 -> r0
#1:	       callg	__malloc_r
#2:	       ldi	20 -> r3
	;;
#0:	       sl	r0, r11 -> r14
	;;
#0:	       s2add	r3, r14 -> r0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r4
#1:	       ldi	0 -> r2
	;;
#0:	       brz eq @	r4, .BB16_474
	;;
.BB16_453:
#0:	       ldm.f	r4, -4
#1:	       ldi	-4 -> r0
#2:	       ldi	36 -> r3
	;;
#0:	       sub	r31, 4 -> r1
	;;
#0:	       and	r1, r0 -> r2
	;;
#0:	       cmpu gt	r2, r3 -> c1
	;;
#0:	if  c1 br @	.BB16_458
	;;
.BB16_454:
#0:	       cmpu lt	r2, 20 -> c1
#1:	       or	r4, 0 -> r0
	;;
#0:	if  c1 br @	.BB16_461
	;;
.BB16_455:
#0:	       cmpu lt	r2, 28 -> c1
#1:	       stm.a	0, r4, 0
	;;
#0:	if  c1 br @	.BB16_459
#1:	       stm.a	0, r4, 1
	;;
.BB16_456:
#0:	       ldi	36 -> r0
#1:	       stm.a	0, r4, 2
	;;
#0:	       cmpu lt	r2, r0 -> c1
#1:	       stm.a	0, r4, 3
	;;
#0:	if  c1 br @	.BB16_460
	;;
.BB16_457:
#0:	       add	r4, 24 -> r0
#1:	       br	.BB16_461
#2:	       stm.a	0, r4, 4
	;;
#0:	       stm.a	0, r4, 5
	;;
	       nop	0
	;;
.BB16_458:
#0:	       or	r4, 0 -> r0
#1:	       br @	.BB16_463
	;;
.BB16_459:
#0:	       add	r4, 8 -> r0
#1:	       br @	.BB16_461
	;;
.BB16_460:
#0:	       add	r4, 16 -> r0
	;;
.BB16_461:
#0:	       stm.a	0, r0, 0
#1:	       br	.BB16_472
	;;
#0:	       stm.a	0, r0, 1
	;;
#0:	       stm.a	0, r0, 2
	;;
.BB16_462:                              ;   in Loop: Header=BB16_463 Depth=1
#0:	       stmb.a	0, r0, 0
#1:	       add	r0, 1 -> r0
#2:	       sub	r2, 1 -> r2
	;;
.BB16_463:                              ; %.preheader253
                                        ; =>This Inner Loop Header: Depth=1
#0:	       and	r0, 3 -> r1
	;;
#0:	       brz eq @	r1, .BB16_465
	;;
.BB16_464:                              ;   in Loop: Header=BB16_463 Depth=1
#0:	       brz ne @	r2, .BB16_462
	;;
#0:	       brz eq @	r2, .BB16_472
	;;
.BB16_465:
#0:	       cmpu lt	r2, 4 -> c1
	;;
#0:	if  c1 br @	.BB16_470
	;;
.BB16_466:
#0:	       cmpu gt	r2, 15 -> c1
	;;
#0:	if !c1 br @	.BB16_468
	;;
.BB16_467:                              ; %.lr.ph8.i146
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sub	r2, 16 -> r2
#1:	       stm.a	0, r0, 3
	;;
#0:	       cmpu gt	r2, 15 -> c1
#1:	       stm.a	0, r0, 2
	;;
#0:	if !c1 br	.BB16_469
#1:	if  c1 br	.BB16_467
#2:	       stm.a	0, r0, 1
	;;
#0:	       stm.a	0, r0, 0
#1:	       add	r0, 16 -> r0
	;;
	       nop	0
	;;
.BB16_468:                              ; %.lr.ph.i149
#0:	       stm.a	0, r0, 0
#1:	       add	r0, 4 -> r0
#2:	       sub	r2, 4 -> r2
	;;
.BB16_469:                              ; %.lr.ph.i149
#0:	       cmpu gt	r2, 3 -> c1
	;;
#0:	if  c1 br @	.BB16_468
	;;
.BB16_470:                              ; %.preheader11.i155
#0:	       brz eq @	r2, .BB16_472
	;;
.BB16_471:                              ; %.lr.ph14.i158
                                        ; =>This Inner Loop Header: Depth=1
#0:	       stmb.a	0, r0, 0
#1:	       add	r0, 1 -> r0
#2:	       sub	r2, 1 -> r2
	;;
#0:	       brz ne @	r2, .BB16_471
	;;
.BB16_472:                              ; %_calloc_r.exit140
#0:	       stm.a	r11, r4, 1
	;;
#0:	       stm.a	r14, r4, 2
	;;
.BB16_473:
#0:	       stm.a	0, r4, 4
#1:	       or	r4, 0 -> r2
	;;
#0:	       stm.a	0, r4, 3
	;;
.BB16_474:                              ; %_Balloc.exit137
#0:	       ldm.f	r12, 16
#1:	       ldi	8 -> r0
#2:	       add	r12, 12 -> r5
#3:	       add	r2, 12 -> r4
	;;
#0:	       s2add	r0, r31 -> r3
	;;
#0:	       cmpu lt	r3, 16 -> c1
	;;
#0:	if  c1 br @	.BB16_483
	;;
.BB16_475:
#0:	       or	r4, r5 -> r0
	;;
#0:	       and	r0, 3 -> r0
	;;
#0:	       brz ne @	r0, .BB16_483
	;;
.BB16_476:
#0:	       cmpu gt	r3, 15 -> c1
	;;
#0:	if  c1 br @	.BB16_478
	;;
.BB16_477:
#0:	       or	r5, 0 -> r1
#1:	       br @	.BB16_479
#2:	       or	r4, 0 -> r0
	;;
.BB16_478:                              ; %.lr.ph10.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r5, 0
#1:	       sub	r3, 16 -> r3
#2:	       add	r4, 16 -> r0
#3:	       add	r5, 16 -> r1
	;;
#0:	       cmpu gt	r3, 15 -> c1
	;;
#0:	       stm.a	r31, r4, 0
	;;
#0:	       ldm.f	r5, 4
	;;
#0:	       stm.a	r31, r4, 1
	;;
#0:	       ldm.f	r5, 8
	;;
#0:	if  c1 br	.BB16_478
#1:	       stm.a	r31, r4, 2
	;;
#0:	       ldm.f	r5, 12
#1:	       or	r1, 0 -> r5
	;;
#0:	       stm.a	r31, r4, 3
#1:	       or	r0, 0 -> r4
	;;
.BB16_479:                              ; %.preheader.i160
#0:	       cmpu gt	r3, 3 -> c1
	;;
#0:	if !c1 br @	.BB16_482
	;;
.BB16_480:
#0:	       or	r1, 0 -> r5
#1:	       or	r0, 0 -> r4
	;;
.BB16_481:                              ; %.lr.ph.i161
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sub	r3, 4 -> r3
#1:	       ldm.f	r5, 0
#2:	       add	r5, 4 -> r5
	;;
#0:	       cmpu gt	r3, 3 -> c1
	;;
#0:	if !c1 br @	.BB16_483
#1:	if  c1 br @	.BB16_481
#2:	       stm.a	r31, r4, 0
#3:	       add	r4, 4 -> r4
	;;
.BB16_482:
#0:	       or	r1, 0 -> r5
#1:	       or	r0, 0 -> r4
	;;
.BB16_483:                              ; %.preheader14.i
#0:	       brz eq @	r3, .BB16_485
	;;
.BB16_484:                              ; %.lr.ph18.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r5, 0
#1:	       sub	r3, 1 -> r3
	;;
#0:	       brz ne	r3, .BB16_484
#1:	       bbh	mzext8 r5 -> r0
#2:	       add	r5, 1 -> r5
	;;
#0:	       stmb.a	r0, r4, 0
#1:	       add	r4, 1 -> r4
	;;
	       nop	0
	;;
.BB16_485:                              ; %memcpy.exit
#0:	       or	r2, 0 -> r0
#1:	       callg	___lshift
#2:	       ldi	1 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r11
	;;
.BB16_486:                              ; %.preheader96
#3:	       and	r3.23, 1 -> r3.26
#2:	       add	r10, 16 -> r2.27
#0:	       ldm.s	r15, 28
	;;
#0:	       br	.BB16_488
#2:	       add	r10, 20 -> r2.26
#3:	       ldi	0 -> r3.28
	;;
#3:	       ldi	20 -> r3.27
#0:	       or	r31, 0 -> r0
	;;
#3:	       ldi	1 -> r3.25
#0:	       or	r0, 0 -> r14
	;;
.BB16_487:                              ;   in Loop: Header=BB16_488 Depth=1
#3:	       add	r3.25, 1 -> r3.25
#0:	       or	r0, 0 -> r11
	;;
.BB16_488:                              ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB16_609 Depth 2
                                        ;     Child Loop BB16_496 Depth 2
                                        ;     Child Loop BB16_490 Depth 2
                                        ;     Child Loop BB16_539 Depth 2
                                        ;     Child Loop BB16_535 Depth 2
                                        ;     Child Loop BB16_531 Depth 2
                                        ;     Child Loop BB16_562 Depth 2
                                        ;     Child Loop BB16_558 Depth 2
                                        ;     Child Loop BB16_554 Depth 2
                                        ;     Child Loop BB16_596 Depth 2
                                        ;     Child Loop BB16_569 Depth 2
                                        ;     Child Loop BB16_525 Depth 2
                                        ;     Child Loop BB16_513 Depth 2
                                        ;     Child Loop BB16_592 Depth 2
                                        ;     Child Loop BB16_588 Depth 2
                                        ;     Child Loop BB16_584 Depth 2
                                        ;     Child Loop BB16_599 Depth 2
                                        ;     Child Loop BB16_604 Depth 2
#0:	       or	r13, 0 -> r0
#1:	       callg	_quorem
#2:	       or	r10, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r0.24
#1:	       ldm.f	r12, 16
	;;
#0:	       s2add	r0.24, 12 -> r0.23
	;;
#0:	       or	r31, 0 -> r1
#1:	       ldm.f	r13, 16
	;;
#0:	       cmp eq	r31, r1 -> c1
#1:	       or	r31, 0 -> r0
	;;
#0:	if !c1 br @	.BB16_492
	;;
.BB16_489:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       s2add	r12, r0 -> r1
#1:	       s2add	r13, r0 -> r0
#2:	       add	r13, 20 -> r3
	;;
#0:	       add	r1, 16 -> r4
#1:	       add	r0, 16 -> r2
	;;
.BB16_490:                              ;   Parent Loop BB16_488 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r4, 0
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldm.f	r2, 0
	;;
#0:	       or	r31, 0 -> r1
	;;
#0:	       cmp eq	r1, r0 -> c1
	;;
#0:	if !c1 br @	.BB16_493
	;;
.BB16_491:                              ;   in Loop: Header=BB16_490 Depth=2
#1:	       ldi	0 -> r1.23
#0:	       cmpu gt	r2, r3 -> c1
#2:	       sub	r4, 4 -> r4
#3:	       sub	r2, 4 -> r2
	;;
#0:	if !c1 br @	.BB16_494
#1:	if  c1 br @	.BB16_490
	;;
.BB16_492:                              ;   in Loop: Header=BB16_488 Depth=1
#1:	       sub	r0, r1 -> r1.23
#0:	       br @	.BB16_494
	;;
.BB16_493:                              ;   in Loop: Header=BB16_488 Depth=1
#1:	       ldi	1 -> r1.23
#0:	       cmpu lt	r1, r0 -> c1
#2:	       ldi	-1 -> r0
	;;
#1:	if  c1 or	r0, 0 -> r1.23
	;;
.BB16_494:                              ; %__mcmp.exit188
                                        ;   in Loop: Header=BB16_488 Depth=1
#0:	       ldm.f	r11, 16
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldm.f	r10, 16
	;;
#0:	       cmp ne	r31, r0 -> c1
#1:	       or	r31, 0 -> r1
	;;
#0:	if  c1 br @	.BB16_501
	;;
.BB16_495:                              ;   in Loop: Header=BB16_488 Depth=1
#2:	       s2add	r2.27, r1 -> r3
#0:	       s2add	r11, r1 -> r0
	;;
#0:	       add	r0, 16 -> r0
	;;
.BB16_496:                              ;   Parent Loop BB16_488 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r0, 0
	;;
#0:	       or	r31, 0 -> r1
#1:	       ldm.f	r3, 0
	;;
#0:	       or	r31, 0 -> r2
	;;
#0:	       cmp eq	r2, r1 -> c1
	;;
#0:	if !c1 br @	.BB16_502
	;;
.BB16_497:                              ;   in Loop: Header=BB16_496 Depth=2
#2:	       cmpu gt	r3, r2.26 -> c1
#0:	       sub	r0, 4 -> r0
#1:	       sub	r3, 4 -> r3
	;;
#0:	if  c1 br @	.BB16_496
	;;
.BB16_498:                              ; %__mcmp.exit.thread.i
                                        ;   in Loop: Header=BB16_488 Depth=1
#0:	       ldmg.d	_impure_data+76
	;;
#0:	       cmp ne	r31, 0 -> c3
#1:	       or	r31, 0 -> r0
	;;
#0:	if  c3 br @	.BB16_541
	;;
.BB16_499:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       ldi	132 -> r0
#1:	       callg	__malloc_r
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz ne @	r0, .BB16_515
	;;
.BB16_500:                              ; %_calloc_r.exit.i210.thread
                                        ;   in Loop: Header=BB16_488 Depth=1
#0:	       ldi	0 -> r3
#1:	       br	.BB16_565
#2:	       ldga	_impure_data -> r0
	;;
#0:	       stm.a	0, r0, 19
	;;
	       nop	0
	;;
.BB16_501:                              ; %__mcmp.exit.i
                                        ;   in Loop: Header=BB16_488 Depth=1
#0:	       sub	r1, r0 -> r1
#1:	       br @	.BB16_503
	;;
.BB16_502:                              ; %__mcmp.exit.thread7.i
                                        ;   in Loop: Header=BB16_488 Depth=1
#0:	       ldi	1 -> r0
#1:	       cmpu lt	r2, r1 -> c1
#2:	       ldi	-1 -> r3
	;;
#0:	       or	r0, 0 -> r1
	;;
#0:	if  c1 or	r3, 0 -> r1
	;;
.BB16_503:                              ;   in Loop: Header=BB16_488 Depth=1
#2:	       or	r10, 0 -> r2.24
#0:	       cmp lt	r1, 0 -> c1
	;;
#2:	if  c1 or	r11, 0 -> r2.24
	;;
#2:	       ldm.f	r2.24, 4
	;;
#2:	       or	r11, 0 -> r2.25
	;;
#3:	       or	r31, 0 -> r3.24
#2:	if  c1 or	r10, 0 -> r2.25
#0:	       ldmg.d	_impure_data+76
	;;
#2:	       sr	r1, 31 -> r2.23
	;;
#0:	       cmp ne	r31, 0 -> c3
#1:	       or	r31, 0 -> r2
	;;
#0:	if  c3 br @	.BB16_571
	;;
.BB16_504:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       ldi	132 -> r0
#1:	       callg	__malloc_r
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r2
	;;
#0:	       brz ne @	r2, .BB16_506
	;;
.BB16_505:                              ; %_calloc_r.exit25.i.thread
                                        ;   in Loop: Header=BB16_488 Depth=1
#0:	       ldi	0 -> r3
#1:	       br	.BB16_595
#2:	       ldga	_impure_data -> r0
	;;
#0:	       stm.a	0, r0, 19
	;;
	       nop	0
	;;
.BB16_506:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       ldm.f	r2, -4
#1:	       ldi	-4 -> r0
	;;
#0:	       sub	r31, 4 -> r1
	;;
#0:	       and	r1, r0 -> r3
#1:	       ldi	36 -> r1
	;;
#0:	       cmpu gt	r3, r1 -> c1
	;;
#0:	if  c1 br @	.BB16_511
	;;
.BB16_507:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       cmpu lt	r3, 20 -> c1
#1:	       or	r2, 0 -> r0
	;;
#0:	if  c1 br @	.BB16_522
	;;
.BB16_508:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       cmpu lt	r3, 28 -> c1
#1:	       stm.a	0, r2, 0
	;;
#0:	if  c1 br @	.BB16_520
#1:	       stm.a	0, r2, 1
	;;
.BB16_509:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       ldi	36 -> r0
#1:	       stm.a	0, r2, 2
	;;
#0:	       cmpu lt	r3, r0 -> c1
#1:	       stm.a	0, r2, 3
	;;
#0:	if  c1 br @	.BB16_521
	;;
.BB16_510:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       add	r2, 24 -> r0
#1:	       br	.BB16_522
#2:	       stm.a	0, r2, 4
	;;
#0:	       stm.a	0, r2, 5
	;;
	       nop	0
	;;
.BB16_511:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       or	r2, 0 -> r1
#1:	       br @	.BB16_513
	;;
.BB16_512:                              ;   in Loop: Header=BB16_513 Depth=2
#0:	       stmb.a	0, r1, 0
#1:	       add	r1, 1 -> r1
#2:	       sub	r3, 1 -> r3
	;;
.BB16_513:                              ; %.preheader261
                                        ;   Parent Loop BB16_488 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       and	r1, 3 -> r0
	;;
#0:	       brz eq @	r0, .BB16_523
	;;
.BB16_514:                              ;   in Loop: Header=BB16_513 Depth=2
#0:	       brz ne @	r3, .BB16_512
	;;
#0:	       br @	.BB16_570
	;;
.BB16_515:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       ldm.f	r0, -4
#1:	       ldi	-4 -> r1
	;;
#0:	       sub	r31, 4 -> r2
	;;
#0:	       and	r2, r1 -> r3
#1:	       ldi	36 -> r2
	;;
#0:	       cmpu gt	r3, r2 -> c1
	;;
#0:	if  c1 br @	.BB16_526
	;;
.BB16_516:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       cmpu lt	r3, 20 -> c1
#1:	       or	r0, 0 -> r1
	;;
#0:	if  c1 br @	.BB16_529
	;;
.BB16_517:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       cmpu lt	r3, 28 -> c1
#1:	       stm.a	0, r0, 0
	;;
#0:	if  c1 br @	.BB16_527
#1:	       stm.a	0, r0, 1
	;;
.BB16_518:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       ldi	36 -> r1
#1:	       stm.a	0, r0, 2
	;;
#0:	       cmpu lt	r3, r1 -> c1
#1:	       stm.a	0, r0, 3
	;;
#0:	if  c1 br @	.BB16_528
	;;
.BB16_519:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       add	r0, 24 -> r1
#1:	       br	.BB16_529
#2:	       stm.a	0, r0, 4
	;;
#0:	       stm.a	0, r0, 5
	;;
	       nop	0
	;;
.BB16_520:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       add	r2, 8 -> r0
#1:	       br @	.BB16_522
	;;
.BB16_521:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       add	r2, 16 -> r0
	;;
.BB16_522:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       stm.a	0, r0, 0
#1:	       br	.BB16_570
	;;
#0:	       stm.a	0, r0, 1
	;;
#0:	       stm.a	0, r0, 2
	;;
.BB16_523:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       cmpu lt	r3, 4 -> c1
	;;
#0:	if  c1 br @	.BB16_568
	;;
.BB16_524:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       cmpu gt	r3, 15 -> c1
	;;
#0:	if !c1 br @	.BB16_566
	;;
.BB16_525:                              ; %.lr.ph8.i31.i
                                        ;   Parent Loop BB16_488 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       sub	r3, 16 -> r3
#1:	       stm.a	0, r1, 3
	;;
#0:	       cmpu gt	r3, 15 -> c1
#1:	       stm.a	0, r1, 2
	;;
#0:	if !c1 br	.BB16_567
#1:	if  c1 br	.BB16_525
#2:	       stm.a	0, r1, 1
	;;
#0:	       stm.a	0, r1, 0
#1:	       add	r1, 16 -> r1
	;;
	       nop	0
	;;
.BB16_526:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       or	r0, 0 -> r2
#1:	       br @	.BB16_531
	;;
.BB16_527:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       add	r0, 8 -> r1
#1:	       br @	.BB16_529
	;;
.BB16_528:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       add	r0, 16 -> r1
	;;
.BB16_529:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       stm.a	0, r1, 0
#1:	       br	.BB16_540
	;;
#0:	       stm.a	0, r1, 1
	;;
#0:	       stm.a	0, r1, 2
	;;
.BB16_530:                              ;   in Loop: Header=BB16_531 Depth=2
#0:	       stmb.a	0, r2, 0
#1:	       add	r2, 1 -> r2
#2:	       sub	r3, 1 -> r3
	;;
.BB16_531:                              ; %.preheader257
                                        ;   Parent Loop BB16_488 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       and	r2, 3 -> r1
	;;
#0:	       brz eq @	r1, .BB16_533
	;;
.BB16_532:                              ;   in Loop: Header=BB16_531 Depth=2
#0:	       brz ne @	r3, .BB16_530
	;;
#0:	       brz eq @	r3, .BB16_540
	;;
.BB16_533:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       cmpu lt	r3, 4 -> c1
	;;
#0:	if  c1 br @	.BB16_538
	;;
.BB16_534:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       cmpu gt	r3, 15 -> c1
	;;
#0:	if !c1 br @	.BB16_536
	;;
.BB16_535:                              ; %.lr.ph8.i.i195
                                        ;   Parent Loop BB16_488 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       sub	r3, 16 -> r3
#1:	       stm.a	0, r2, 3
	;;
#0:	       cmpu gt	r3, 15 -> c1
#1:	       stm.a	0, r2, 2
	;;
#0:	if !c1 br	.BB16_537
#1:	if  c1 br	.BB16_535
#2:	       stm.a	0, r2, 1
	;;
#0:	       stm.a	0, r2, 0
#1:	       add	r2, 16 -> r2
	;;
	       nop	0
	;;
.BB16_536:                              ; %.lr.ph.i.i198
                                        ;   in Loop: Header=BB16_488 Depth=1
#0:	       stm.a	0, r2, 0
#1:	       add	r2, 4 -> r2
#2:	       sub	r3, 4 -> r3
	;;
.BB16_537:                              ; %.lr.ph.i.i198
                                        ;   in Loop: Header=BB16_488 Depth=1
#0:	       cmpu gt	r3, 3 -> c1
	;;
#0:	if  c1 br @	.BB16_536
	;;
.BB16_538:                              ; %.preheader11.i.i204
                                        ;   in Loop: Header=BB16_488 Depth=1
#0:	       brz eq @	r3, .BB16_540
	;;
.BB16_539:                              ; %.lr.ph14.i.i207
                                        ;   Parent Loop BB16_488 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       stmb.a	0, r2, 0
#1:	       add	r2, 1 -> r2
#2:	       sub	r3, 1 -> r3
	;;
#0:	       brz ne @	r3, .BB16_539
	;;
.BB16_540:                              ; %_calloc_r.exit.i210
                                        ;   in Loop: Header=BB16_488 Depth=1
#0:	       ldga	_impure_data -> r1
	;;
#0:	       stm.a	r0, r1, 19
	;;
.BB16_541:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       ldm.f	r0, 0
	;;
#0:	       or	r31, 0 -> r4
	;;
#0:	       brz ne @	r4, .BB16_548
	;;
.BB16_542:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       ldi	24 -> r0
#1:	       callg	__malloc_r
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r4
#1:	       ldi	0 -> r3
	;;
#0:	       brz eq @	r4, .BB16_565
	;;
.BB16_543:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       ldm.f	r4, -4
#1:	       ldi	-4 -> r0
#2:	       ldi	36 -> r3
	;;
#0:	       sub	r31, 4 -> r1
	;;
#0:	       and	r1, r0 -> r2
	;;
#0:	       cmpu gt	r2, r3 -> c1
	;;
#0:	if  c1 br @	.BB16_549
	;;
.BB16_544:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       cmpu lt	r2, 20 -> c1
#1:	       or	r4, 0 -> r0
	;;
#0:	if  c1 br @	.BB16_552
	;;
.BB16_545:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       cmpu lt	r2, 28 -> c1
#1:	       stm.a	0, r4, 0
	;;
#0:	if  c1 br @	.BB16_550
#1:	       stm.a	0, r4, 1
	;;
.BB16_546:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       ldi	36 -> r0
#1:	       stm.a	0, r4, 2
	;;
#0:	       cmpu lt	r2, r0 -> c1
#1:	       stm.a	0, r4, 3
	;;
#0:	if  c1 br @	.BB16_551
	;;
.BB16_547:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       add	r4, 24 -> r0
#1:	       br	.BB16_552
#2:	       stm.a	0, r4, 4
	;;
#0:	       stm.a	0, r4, 5
	;;
	       nop	0
	;;
.BB16_548:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       ldm.f	r4, 0
#1:	       br	.BB16_564
	;;
#0:	       stm.a	r31, r0, 0
	;;
	       nop	0
	;;
.BB16_549:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       or	r4, 0 -> r1
#1:	       br @	.BB16_554
	;;
.BB16_550:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       add	r4, 8 -> r0
#1:	       br @	.BB16_552
	;;
.BB16_551:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       add	r4, 16 -> r0
	;;
.BB16_552:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       stm.a	0, r0, 0
#1:	       br	.BB16_563
	;;
#0:	       stm.a	0, r0, 1
	;;
#0:	       stm.a	0, r0, 2
	;;
.BB16_553:                              ;   in Loop: Header=BB16_554 Depth=2
#0:	       stmb.a	0, r1, 0
#1:	       add	r1, 1 -> r1
#2:	       sub	r2, 1 -> r2
	;;
.BB16_554:                              ; %.preheader255
                                        ;   Parent Loop BB16_488 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       and	r1, 3 -> r0
	;;
#0:	       brz eq @	r0, .BB16_556
	;;
.BB16_555:                              ;   in Loop: Header=BB16_554 Depth=2
#0:	       brz ne @	r2, .BB16_553
	;;
#0:	       brz eq @	r2, .BB16_563
	;;
.BB16_556:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       cmpu lt	r2, 4 -> c1
	;;
#0:	if  c1 br @	.BB16_561
	;;
.BB16_557:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       cmpu gt	r2, 15 -> c1
	;;
#0:	if !c1 br @	.BB16_559
	;;
.BB16_558:                              ; %.lr.ph8.i9.i
                                        ;   Parent Loop BB16_488 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       sub	r2, 16 -> r2
#1:	       stm.a	0, r1, 3
	;;
#0:	       cmpu gt	r2, 15 -> c1
#1:	       stm.a	0, r1, 2
	;;
#0:	if !c1 br	.BB16_560
#1:	if  c1 br	.BB16_558
#2:	       stm.a	0, r1, 1
	;;
#0:	       stm.a	0, r1, 0
#1:	       add	r1, 16 -> r1
	;;
	       nop	0
	;;
.BB16_559:                              ; %.lr.ph.i12.i
                                        ;   in Loop: Header=BB16_488 Depth=1
#0:	       stm.a	0, r1, 0
#1:	       add	r1, 4 -> r1
#2:	       sub	r2, 4 -> r2
	;;
.BB16_560:                              ; %.lr.ph.i12.i
                                        ;   in Loop: Header=BB16_488 Depth=1
#0:	       cmpu gt	r2, 3 -> c1
	;;
#0:	if  c1 br @	.BB16_559
	;;
.BB16_561:                              ; %.preheader11.i18.i
                                        ;   in Loop: Header=BB16_488 Depth=1
#0:	       brz eq @	r2, .BB16_563
	;;
.BB16_562:                              ; %.lr.ph14.i21.i
                                        ;   Parent Loop BB16_488 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       stmb.a	0, r1, 0
#1:	       add	r1, 1 -> r1
#2:	       sub	r2, 1 -> r2
	;;
#0:	       brz ne @	r2, .BB16_562
	;;
.BB16_563:                              ; %_calloc_r.exit3.i
                                        ;   in Loop: Header=BB16_488 Depth=1
#0:	       stm.a	0, r4, 1
	;;
#0:	       stm.a	1, r4, 2
	;;
.BB16_564:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       stm.a	0, r4, 4
#1:	       or	r4, 0 -> r3
	;;
#0:	       stm.a	0, r4, 3
	;;
.BB16_565:                              ; %_Balloc.exit6.i
                                        ;   in Loop: Header=BB16_488 Depth=1
#0:	       stm.a	1, r3, 4
#1:	       ldi	1 -> r4
	;;
#0:	       br	.BB16_606
#1:	       stm.a	0, r3, 5
	;;
#0:	       ldm.f	r3, 12
	;;
#2:	       or	r31, 0 -> r2.23
	;;
.BB16_566:                              ; %.lr.ph.i34.i
                                        ;   in Loop: Header=BB16_488 Depth=1
#0:	       stm.a	0, r1, 0
#1:	       add	r1, 4 -> r1
#2:	       sub	r3, 4 -> r3
	;;
.BB16_567:                              ; %.lr.ph.i34.i
                                        ;   in Loop: Header=BB16_488 Depth=1
#0:	       cmpu gt	r3, 3 -> c1
	;;
#0:	if  c1 br @	.BB16_566
	;;
.BB16_568:                              ; %.preheader11.i40.i
                                        ;   in Loop: Header=BB16_488 Depth=1
#0:	       brz eq @	r3, .BB16_570
	;;
.BB16_569:                              ; %.lr.ph14.i43.i
                                        ;   Parent Loop BB16_488 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       stmb.a	0, r1, 0
#1:	       add	r1, 1 -> r1
#2:	       sub	r3, 1 -> r3
	;;
#0:	       brz ne @	r3, .BB16_569
	;;
.BB16_570:                              ; %_calloc_r.exit25.i
                                        ;   in Loop: Header=BB16_488 Depth=1
#0:	       ldga	_impure_data -> r0
	;;
#0:	       stm.a	r2, r0, 19
	;;
.BB16_571:                              ;   in Loop: Header=BB16_488 Depth=1
#3:	       ldmr.f	r3.24, r2, 2
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       brz ne @	r0, .BB16_578
	;;
.BB16_572:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       ldi	1 -> r0
#1:	       callg	__malloc_r
	;;
#3:	       sl	r0, r3.24 -> r3.23
	;;
#3:	       s2add	r3.27, r3.23 -> r0
	;;
	       nop	0
	;;
#0:	       brz eq @	r0, .BB16_595
#1:	       ldi	0 -> r3
	;;
.BB16_573:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       ldm.f	r0, -4
#1:	       ldi	-4 -> r1
	;;
#0:	       sub	r31, 4 -> r2
	;;
#0:	       and	r2, r1 -> r3
#1:	       ldi	36 -> r2
	;;
#0:	       cmpu gt	r3, r2 -> c1
	;;
#0:	if  c1 br @	.BB16_579
	;;
.BB16_574:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       cmpu lt	r3, 20 -> c1
#1:	       or	r0, 0 -> r1
	;;
#0:	if  c1 br @	.BB16_582
	;;
.BB16_575:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       cmpu lt	r3, 28 -> c1
#1:	       stm.a	0, r0, 0
	;;
#0:	if  c1 br @	.BB16_580
#1:	       stm.a	0, r0, 1
	;;
.BB16_576:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       ldi	36 -> r1
#1:	       stm.a	0, r0, 2
	;;
#0:	       cmpu lt	r3, r1 -> c1
#1:	       stm.a	0, r0, 3
	;;
#0:	if  c1 br @	.BB16_581
	;;
.BB16_577:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       add	r0, 24 -> r1
#1:	       br	.BB16_582
#2:	       stm.a	0, r0, 4
	;;
#0:	       stm.a	0, r0, 5
	;;
	       nop	0
	;;
.BB16_578:                              ;   in Loop: Header=BB16_488 Depth=1
#3:	       s2add	r2, r3.24 -> r1
#0:	       br	.BB16_594
#1:	       ldm.f	r0, 0
	;;
#0:	       stm.a	r31, r1, 0
	;;
	       nop	0
	;;
.BB16_579:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       or	r0, 0 -> r2
#1:	       br @	.BB16_584
	;;
.BB16_580:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       add	r0, 8 -> r1
#1:	       br @	.BB16_582
	;;
.BB16_581:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       add	r0, 16 -> r1
	;;
.BB16_582:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       stm.a	0, r1, 0
#1:	       br	.BB16_593
	;;
#0:	       stm.a	0, r1, 1
	;;
#0:	       stm.a	0, r1, 2
	;;
.BB16_583:                              ;   in Loop: Header=BB16_584 Depth=2
#0:	       stmb.a	0, r2, 0
#1:	       add	r2, 1 -> r2
#2:	       sub	r3, 1 -> r3
	;;
.BB16_584:                              ; %.preheader259
                                        ;   Parent Loop BB16_488 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       and	r2, 3 -> r1
	;;
#0:	       brz eq @	r1, .BB16_586
	;;
.BB16_585:                              ;   in Loop: Header=BB16_584 Depth=2
#0:	       brz ne @	r3, .BB16_583
	;;
#0:	       brz eq @	r3, .BB16_593
	;;
.BB16_586:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       cmpu lt	r3, 4 -> c1
	;;
#0:	if  c1 br @	.BB16_591
	;;
.BB16_587:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       cmpu gt	r3, 15 -> c1
	;;
#0:	if !c1 br @	.BB16_589
	;;
.BB16_588:                              ; %.lr.ph8.i53.i
                                        ;   Parent Loop BB16_488 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       sub	r3, 16 -> r3
#1:	       stm.a	0, r2, 3
	;;
#0:	       cmpu gt	r3, 15 -> c1
#1:	       stm.a	0, r2, 2
	;;
#0:	if !c1 br	.BB16_590
#1:	if  c1 br	.BB16_588
#2:	       stm.a	0, r2, 1
	;;
#0:	       stm.a	0, r2, 0
#1:	       add	r2, 16 -> r2
	;;
	       nop	0
	;;
.BB16_589:                              ; %.lr.ph.i56.i
                                        ;   in Loop: Header=BB16_488 Depth=1
#0:	       stm.a	0, r2, 0
#1:	       add	r2, 4 -> r2
#2:	       sub	r3, 4 -> r3
	;;
.BB16_590:                              ; %.lr.ph.i56.i
                                        ;   in Loop: Header=BB16_488 Depth=1
#0:	       cmpu gt	r3, 3 -> c1
	;;
#0:	if  c1 br @	.BB16_589
	;;
.BB16_591:                              ; %.preheader11.i62.i
                                        ;   in Loop: Header=BB16_488 Depth=1
#0:	       brz eq @	r3, .BB16_593
	;;
.BB16_592:                              ; %.lr.ph14.i65.i
                                        ;   Parent Loop BB16_488 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       stmb.a	0, r2, 0
#1:	       add	r2, 1 -> r2
#2:	       sub	r3, 1 -> r3
	;;
#0:	       brz ne @	r3, .BB16_592
	;;
.BB16_593:                              ; %_calloc_r.exit47.i
                                        ;   in Loop: Header=BB16_488 Depth=1
#3:	       stm.a	r3.24, r0, 1
	;;
#3:	       stm.a	r3.23, r0, 2
	;;
.BB16_594:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       stm.a	0, r0, 4
#1:	       or	r0, 0 -> r3
	;;
#0:	       stm.a	0, r0, 3
	;;
.BB16_595:                              ; %_Balloc.exit.i213
                                        ;   in Loop: Header=BB16_488 Depth=1
#2:	       stm.a	r2.23, r3, 3
#0:	       add	r3, 20 -> r1
#1:	       ldi	0 -> r8
#3:	       ldi	0 -> r5
	;;
#2:	       ldm.f	r2.25, 16
	;;
#2:	       add	r2.25, 20 -> r2
	;;
#0:	       s2add	r2, r31 -> r6
#2:	       ldm.f	r2.24, 16
	;;
#0:	       or	r31, 0 -> r4
	;;
.BB16_596:                              ;   Parent Loop BB16_488 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#2:	       add	r2.24, r8 -> r7
#0:	       ldmr.f	r8, r2, 0
	;;
#0:	       or	r31, 0 -> r9
#1:	       ldm.f	r7, 20
	;;
#0:	       sr	r9, 16 -> r0
#1:	       bbh	zext16 r9 -> r9
	;;
#0:	       sr	r31, 16 -> r7
	;;
#0:	       sub	r7, r0 -> r7
#1:	       bbh	zext16 r31 -> r0
	;;
#0:	       sub	r0, r9 -> r0
	;;
#0:	       add	r0, r5 -> r5
	;;
#0:	       sra	r5, 16 -> r0
	;;
#0:	       add	r0, r7 -> r9
#1:	       add	r8, 4 -> r7
#2:	       bbh	zext16 r5 -> r0
	;;
#0:	       add	r2, r7 -> r5
	;;
#0:	       cmpu lt	r5, r6 -> c1
#1:	       add	r1, r8 -> r5
#2:	       sl	r9, 16 -> r8
	;;
#0:	if  c1 br	.BB16_596
#1:	       or	r8, r0 -> r0
#2:	       or	r7, 0 -> r8
	;;
#0:	       stm.a	r0, r5, 0
#1:	       sra	r9, 16 -> r5
	;;
	       nop	0
	;;
.BB16_597:                              ; %.preheader10.i
                                        ;   in Loop: Header=BB16_488 Depth=1
#2:	       s2add	r2.24, r4 -> r0
	;;
#2:	       add	r2.24, r7 -> r2
#0:	       add	r0, 20 -> r6
	;;
#0:	       add	r2, 20 -> r1
	;;
#0:	       cmpu ge	r1, r6 -> c1
#1:	       add	r3, r7 -> r1
	;;
#0:	if  c1 br @	.BB16_601
	;;
.BB16_598:                              ; %.lr.ph14.i217.preheader
                                        ;   in Loop: Header=BB16_488 Depth=1
#0:	       add	r1, 20 -> r8
#1:	       ldi	0 -> r7
	;;
.BB16_599:                              ; %.lr.ph14.i217
                                        ;   Parent Loop BB16_488 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       add	r2, r7 -> r0
	;;
#0:	       ldm.f	r0, 20
	;;
#0:	       bbh	zext16 r31 -> r0
#1:	       sr	r31, 16 -> r9
	;;
#0:	       add	r0, r5 -> r0
#1:	       add	r31, r5 -> r5
	;;
#0:	       sra	r0, 16 -> r0
#1:	       bbh	zext16 r5 -> r5
	;;
#0:	       add	r0, r9 -> r0.16
#1:	       add	r8, r7 -> r9
	;;
#0:	       sl	r0.16, 16 -> r0
	;;
#1:	       or	r0, r5 -> r0
#0:	       sra	r0.16, 16 -> r5
	;;
#0:	       stm.a	r0, r9, 0
#1:	       add	r2, r7 -> r0
#2:	       add	r7, 4 -> r7
	;;
#0:	       add	r0, 24 -> r0
	;;
#0:	       cmpu lt	r0, r6 -> c1
	;;
#0:	if  c1 br @	.BB16_599
	;;
.BB16_600:                              ; %.preheader.i216.loopexit
                                        ;   in Loop: Header=BB16_488 Depth=1
#0:	       add	r1, r7 -> r0
#1:	       br	.BB16_602
	;;
#0:	       add	r0, 20 -> r0
	;;
	       nop	0
	;;
.BB16_601:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       add	r1, 20 -> r0
	;;
.BB16_602:                              ; %.preheader.i216
                                        ;   in Loop: Header=BB16_488 Depth=1
#0:	       ldm.f	r0, -4
	;;
#0:	       brz ne @	r31, .BB16_605
	;;
.BB16_603:                              ; %.lr.ph.i218.preheader
                                        ;   in Loop: Header=BB16_488 Depth=1
#0:	       sub	r0, 8 -> r0
	;;
.BB16_604:                              ; %.lr.ph.i218
                                        ;   Parent Loop BB16_488 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r0, 0
#1:	       sub	r0, 4 -> r0
#2:	       sub	r4, 1 -> r4
	;;
#0:	       brz eq @	r31, .BB16_604
	;;
.BB16_605:                              ; %._crit_edge.i219
                                        ;   in Loop: Header=BB16_488 Depth=1
#0:	       stm.a	r4, r3, 4
	;;
.BB16_606:                              ; %__mdiff.exit
                                        ;   in Loop: Header=BB16_488 Depth=1
#0:	       ldi	1 -> r0
#2:	       brz ne @	r2.23, .BB16_613
	;;
.BB16_607:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       ldm.f	r13, 16
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       cmp eq	r0, r4 -> c1
	;;
#0:	if !c1 br @	.BB16_611
	;;
.BB16_608:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       s2add	r3, r4 -> r0
#1:	       s2add	r13, r4 -> r2
#2:	       add	r13, 20 -> r1
	;;
#0:	       add	r0, 16 -> r5
#1:	       add	r2, 16 -> r4
	;;
.BB16_609:                              ;   Parent Loop BB16_488 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r5, 0
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldm.f	r4, 0
	;;
#0:	       or	r31, 0 -> r2
	;;
#0:	       cmp eq	r2, r0 -> c1
	;;
#0:	if !c1 br @	.BB16_612
	;;
.BB16_610:                              ;   in Loop: Header=BB16_609 Depth=2
#0:	       cmpu gt	r4, r1 -> c1
#1:	       sub	r5, 4 -> r5
#2:	       sub	r4, 4 -> r4
#3:	       ldi	0 -> r0
	;;
#0:	if !c1 br @	.BB16_613
#1:	if  c1 br @	.BB16_609
	;;
.BB16_611:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       sub	r0, r4 -> r0
#1:	       br @	.BB16_613
	;;
.BB16_612:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       cmpu lt	r2, r0 -> c1
#1:	       ldi	1 -> r0
#2:	       ldi	-1 -> r1
	;;
#0:	if  c1 or	r1, 0 -> r0
	;;
.BB16_613:                              ; %__mcmp.exit224
                                        ;   in Loop: Header=BB16_488 Depth=1
#0:	       brz eq @	r3, .BB16_615
	;;
.BB16_614:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       ldm.f	r3, 4
	;;
#0:	       or	r31, 0 -> r1
#1:	       ldmg.d	_impure_data+76
	;;
#0:	       ldmr.f	r1, r31, 2
	;;
#0:	       stm.a	r31, r3, 0
	;;
#0:	       ldmg.d	_impure_data+76
	;;
#0:	       s2add	r31, r1 -> r1
	;;
#0:	       stm.a	r3, r1, 0
	;;
.BB16_615:                              ; %_Bfree.exit225
                                        ;   in Loop: Header=BB16_488 Depth=1
#3:	       or	r3.26, r3.28 -> r2
#1:	       or	r0, r1.27 -> r1
	;;
#0:	       or	r1, r2 -> r1
	;;
#0:	       brz eq @	r1, .BB16_622
	;;
.BB16_616:                              ;   in Loop: Header=BB16_488 Depth=1
#1:	       brz lt @	r1.23, .BB16_624
	;;
.BB16_617:                              ;   in Loop: Header=BB16_488 Depth=1
#1:	       or	r1.23, r1.27 -> r1
	;;
#0:	       or	r1, r2 -> r1
	;;
#0:	       brz eq @	r1, .BB16_624
	;;
.BB16_618:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       cmp lt	r0, 1 -> c1
	;;
#0:	if !c1 br @	.BB16_638
	;;
.BB16_619:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       stmb.a	r0.23, r14, 0
#1:	       add	r14, 1 -> r14
	;;
#0:	       ldm.s	r15, 20
	;;
#0:	       or	r31, 0 -> r0
	;;
#3:	       cmp eq	r3.25, r0 -> c1
	;;
#0:	if  c1 br @	.BB16_400
	;;
.BB16_620:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       or	r13, 0 -> r0
#1:	       callg	___multadd
#2:	       ldi	10 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       callg	___multadd
	;;
#0:	       cmp eq	r12, r11 -> c1
#1:	       or	r0, 0 -> r13
#2:	       or	r12, 0 -> r0
#3:	       ldi	10 -> r1
	;;
#0:	       ldx	$c1, 0 -> r2
	;;
#0:	       stm.s	r2, r15, 4
	;;
#0:	       ldm.s	r15, 16
#1:	       or	r0, 0 -> r12
	;;
#0:	       stx	r31 -> $c1
	;;
#0:	if  c1 br @	.BB16_487
	;;
.BB16_621:                              ;   in Loop: Header=BB16_488 Depth=1
#0:	       or	r11, 0 -> r0
#1:	       callg	___multadd
#2:	       ldi	10 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       br @	.BB16_487
	;;
.BB16_622:
#0:	       ldi	57 -> r0
	;;
#0:	       cmp eq	r0.23, r0 -> c1
	;;
#0:	if  c1 br @	.BB16_639
	;;
.BB16_623:
#0:	       addi	49 -> r0.24
#1:	       cmp gt	r1.23, 0 -> c1
	;;
#1:	       br	.BB16_416
#0:	if  c1 or	r0.24, 0 -> r0.23
	;;
#0:	       stmb.a	r0.23, r14, 0
	;;
#0:	       add	r14, 1 -> r0.23
	;;
.BB16_624:
#0:	       cmp lt	r0, 1 -> c1
	;;
#0:	if  c1 br @	.BB16_636
	;;
.BB16_625:
#0:	       or	r13, 0 -> r0
#1:	       callg	___lshift
#2:	       ldi	1 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r13
	;;
#0:	       ldm.f	r13, 16
	;;
#0:	       or	r31, 0 -> r1
#1:	       ldm.f	r10, 16
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       cmp eq	r1, r0 -> c1
	;;
#0:	if !c1 br @	.BB16_629
	;;
.BB16_626:
#0:	       ldi	16 -> r0
#1:	       add	r13, 20 -> r3
	;;
#0:	       s2add	r0, r1 -> r0
	;;
#0:	       add	r10, r0 -> r4
#1:	       add	r13, r0 -> r0
	;;
.BB16_627:                              ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r4, 0
	;;
#0:	       or	r31, 0 -> r1
#1:	       ldm.f	r0, 0
	;;
#0:	       or	r31, 0 -> r2
	;;
#0:	       cmp eq	r2, r1 -> c1
	;;
#0:	if !c1 br @	.BB16_630
	;;
.BB16_628:                              ;   in Loop: Header=BB16_627 Depth=1
#0:	       cmpu gt	r0, r3 -> c1
#1:	       sub	r4, 4 -> r4
#2:	       sub	r0, 4 -> r0
	;;
#0:	if !c1 br @	.BB16_633
#1:	if  c1 br @	.BB16_627
	;;
.BB16_629:
#0:	       sub	r1, r0 -> r0
#1:	       br @	.BB16_631
	;;
.BB16_630:
#0:	       cmpu lt	r2, r1 -> c1
#1:	       ldi	1 -> r0
#2:	       ldi	-1 -> r3
	;;
#0:	if  c1 or	r3, 0 -> r0
	;;
.BB16_631:                              ; %__mcmp.exit229
#0:	       brz gt @	r0, .BB16_634
	;;
.BB16_632:
#0:	       brz ne @	r0, .BB16_636
	;;
.BB16_633:                              ; %.thread231
#0:	       btest	r0.23, 0 -> c1
	;;
#0:	if !c1 br @	.BB16_636
	;;
.BB16_634:
#0:	       ldi	57 -> r0
	;;
#0:	       cmp eq	r0.23, r0 -> c1
	;;
#0:	if  c1 br @	.BB16_639
	;;
.BB16_635:
#0:	       addi	49 -> r0.24
#1:	       br @	.BB16_637
	;;
.BB16_636:
#0:	       or	r0.23, 0 -> r0.24
	;;
.BB16_637:
#0:	       add	r14, 1 -> r0.23
#1:	       br	.BB16_416
	;;
#0:	       stmb.a	r0.24, r14, 0
	;;
	       nop	0
	;;
.BB16_638:
#0:	       ldi	57 -> r0
	;;
#0:	       cmp ne	r0.23, r0 -> c1
	;;
#0:	if  c1 br @	.BB16_635
	;;
.BB16_639:
#0:	       ldi	57 -> r0
	;;
#0:	       stmb.a	r0, r14, 0
#1:	       add	r14, 1 -> r14
	;;
.BB16_640:                              ; %.preheader90
#0:	       ldi	57 -> r0
	;;
.BB16_641:                              ; =>This Inner Loop Header: Depth=1
#0:	       or	r14, 0 -> r0.23
	;;
#0:	       ldm.f	r0.23, -1
	;;
#0:	       sub	r0.23, 1 -> r14
	;;
#0:	       bbh	mzext8 r14 -> r2
	;;
#0:	       cmp ne	r2, r0 -> c1
	;;
#0:	if  c1 br @	.BB16_644
	;;
.BB16_642:                              ;   in Loop: Header=BB16_641 Depth=1
#0:	       ldm.s	r15, 28
	;;
#0:	       or	r31, 0 -> r1
	;;
#0:	       cmp ne	r1, r14 -> c1
	;;
#0:	if  c1 br @	.BB16_641
	;;
.BB16_643:
#0:	       ldm.s	r15, 28
#1:	       ldi	49 -> r0
	;;
#0:	       or	r31, 0 -> r1
	;;
#0:	       stmb.a	r0, r1, 0
	;;
#0:	       ldm.s	r15, 24
	;;
#0:	       br	.BB16_416
#1:	       or	r31, 0 -> r3
	;;
#0:	       add	r3, 1 -> r0
	;;
#0:	       stm.s	r0, r15, 6
	;;
.BB16_644:
#0:	       sub	r0.23, 1 -> r1
#1:	       br	.BB16_416
#2:	       add	r2, 1 -> r0
	;;
#0:	       stmb.a	r0, r1, 0
	;;
	       nop	0
	;;
	.align	4
__dtoa_r_end:
.tmp16:
	.size	__dtoa_r, .tmp16-__dtoa_r
	.section	.rodata,"a",@progbits
	.align	4
.JTI16_0:
	.long	.BB16_126-__dtoa_r_start
	.long	.BB16_126-__dtoa_r_start
	.long	.BB16_116-__dtoa_r_start
	.long	.BB16_119-__dtoa_r_start
	.long	.BB16_117-__dtoa_r_start
	.long	.BB16_120-__dtoa_r_start

	.text
	.type	_quorem,@function
_quorem:                                ; @quorem
	.funsz	_quorem_end-_quorem
_quorem_start:
; BB#0:
#0:	       wb.s	r15, 14
#1:	       addi	-56 -> r15
#2:	       ldx	$rb, 0 -> r2
#3:	       ldx	$ro, 0 -> r3
	;;
#0:	       stm.s	r10, r15, 9
	;;
#0:	       stm.s	r11, r15, 8
#1:	       or	r0, 0 -> r11
	;;
#0:	       stm.s	r12, r15, 7
	;;
#0:	       stm.s	r13, r15, 6
	;;
#0:	       stm.s	r14, r15, 5
#1:	       or	r1, 0 -> r14
#2:	       ldi	0 -> r1
	;;
#2:	       stm.s	r2.23, r15, 4
	;;
#2:	       stm.s	r2.24, r15, 3
	;;
#0:	       stm.s	r2, r15, 2
	;;
#0:	       stm.s	r3, r15, 1
	;;
#0:	       ldm.f	r14, 16
	;;
#2:	       or	r31, 0 -> r2.24
#0:	       ldm.f	r11, 16
	;;
#2:	       or	r31, 0 -> r2.23
	;;
#2:	       cmp lt	r2.23, r2.24 -> c1
	;;
#0:	if  c1 br @	.BB17_23
	;;
.BB17_1:
#2:	       sub	r2.24, 1 -> r10
#0:	       callg	___udivsi3
#1:	       add	r11, 20 -> r12
#3:	       add	r14, 20 -> r13
	;;
#0:	       ldmr.f	r10, r12, 2
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldmr.f	r10, r13, 2
	;;
#0:	       add	r31, 1 -> r1
	;;
#0:	       or	r0, 0 -> r1
#1:	       s2add	r13, r10 -> r4
	;;
#0:	       brz eq @	r1, .BB17_9
	;;
.BB17_2:
#0:	       s2add	r12, r10 -> r9
#1:	       ldi	0 -> r5
#2:	       or	r13, 0 -> r8
#3:	       or	r12, 0 -> r2
	;;
#0:	       ldi	0 -> r3
	;;
.BB17_3:                                ; %.preheader2
                                        ; =>This Inner Loop Header: Depth=1
#0:	       add	r2, 4 -> r0.17
#1:	       ldm.f	r8, 0
#2:	       add	r8, 4 -> r8
	;;
#0:	       cmpu le	r8, r4 -> c1
	;;
#0:	       sr	r31, 16 -> r0
	;;
#0:	       mul	r0, r1 -> $mul0.0
#1:	       bbh	zext16 r31 -> r0
#2:	       ldm.f	r2, 0
	;;
#1:	       mul	r0, r1 -> $mul1.0
	;;
#1:	       ldx	$mul1.0, r5 -> r5
#0:	       bbh	zext16 r31 -> r7
	;;
#0:	       sr	r5, 16 -> r0
	;;
#0:	       ldx	$mul0.0, r0 -> r0.16
#1:	       bbh	zext16 r5 -> r0
#2:	       sr	r31, 16 -> r5
	;;
#0:	       bbh	zext16 r0.16 -> r6
#1:	       sub	r7, r0 -> r0
	;;
#1:	       sub	r5, r6 -> r1.16
#0:	       sr	r0.16, 16 -> r5
#2:	       add	r0, r3 -> r6
	;;
#0:	       sra	r6, 16 -> r0
	;;
#1:	       add	r1.16, r0 -> r7
#0:	       bbh	zext16 r6 -> r0
	;;
#0:	if  c1 br	.BB17_3
#1:	       sl	r7, 16 -> r3
	;;
#0:	       or	r3, r0 -> r0
#1:	       sra	r7, 16 -> r3
	;;
#1:	       stm.a	r0, r2, 0
#0:	       or	r0.17, 0 -> r2
	;;
.BB17_4:
#0:	       ldm.f	r9, 0
	;;
#0:	       brz ne @	r31, .BB17_9
	;;
.BB17_5:                                ; %.preheader.preheader
#2:	       s2add	r11, r2.24 -> r0
	;;
#0:	       add	r0, 12 -> r0
	;;
.BB17_6:                                ; %.preheader
                                        ; =>This Inner Loop Header: Depth=1
#2:	       or	r10, 0 -> r2.23
#0:	       cmpu le	r0, r12 -> c1
	;;
#0:	if  c1 br @	.BB17_8
	;;
.BB17_7:                                ;   in Loop: Header=BB17_6 Depth=1
#2:	       sub	r2.23, 1 -> r10
#0:	       sub	r0, 4 -> r2
#1:	       ldm.f	r0, 0
	;;
#0:	       brz eq @	r31, .BB17_6
#1:	       or	r2, 0 -> r0
	;;
.BB17_8:                                ; %.critedge
#2:	       stm.a	r2.23, r11, 4
	;;
#2:	       or	r2.23, 0 -> r10
#0:	       ldm.f	r14, 16
	;;
#2:	       or	r31, 0 -> r2.24
	;;
.BB17_9:
#2:	       cmp eq	r2.23, r2.24 -> c1
	;;
#0:	if !c1 br @	.BB17_14
	;;
.BB17_10:
#0:	       ldi	16 -> r0
	;;
#2:	       s2add	r0, r2.24 -> r0
	;;
#0:	       add	r14, r0 -> r5
#1:	       add	r11, r0 -> r0
	;;
.BB17_11:                               ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r5, 0
	;;
#0:	       or	r31, 0 -> r2
#1:	       ldm.f	r0, 0
	;;
#0:	       or	r31, 0 -> r3
	;;
#0:	       cmp eq	r3, r2 -> c1
	;;
#0:	if !c1 br @	.BB17_15
	;;
.BB17_12:                               ;   in Loop: Header=BB17_11 Depth=1
#0:	       cmpu gt	r0, r12 -> c1
#1:	       sub	r5, 4 -> r5
#2:	       sub	r0, 4 -> r0
#3:	       ldi	0 -> r3
	;;
#0:	if  c1 br @	.BB17_11
	;;
.BB17_13:
#0:	       or	r12, 0 -> r2
#1:	       br @	.BB17_17
#2:	       ldi	0 -> r5
	;;
.BB17_14:
#2:	       sub	r2.23, r2.24 -> r0
#0:	       br @	.BB17_16
	;;
.BB17_15:
#0:	       cmpu lt	r3, r2 -> c1
#1:	       ldi	1 -> r0
#2:	       ldi	-1 -> r3
	;;
#0:	if  c1 or	r3, 0 -> r0
	;;
.BB17_16:                               ; %__mcmp.exit
#0:	       ldi	0 -> r3
#1:	       brz lt @	r0, .BB17_23
#2:	       or	r12, 0 -> r2
#3:	       ldi	0 -> r5
	;;
.BB17_17:                               ; %__mcmp.exit.thread
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r13, 0
#1:	       add	r13, 4 -> r13
	;;
#0:	       cmpu le	r13, r4 -> c1
	;;
#0:	       bbh	zext16 r31 -> r0
	;;
#0:	       add	r0, r3 -> r0
#1:	       add	r31, r3 -> r3
	;;
#0:	       sr	r0, 16 -> r6
#1:	       sr	r31, 16 -> r0
#2:	       ldm.f	r2, 0
#3:	       bbh	zext16 r3 -> r7
	;;
#0:	       add	r6, r0 -> r8
	;;
#0:	       bbh	zext16 r31 -> r3
#1:	       bbh	zext16 r8 -> r6
#2:	       sr	r31, 16 -> r0
	;;
#0:	       sub	r3, r7 -> r3
#1:	       sub	r0, r6 -> r6
#2:	       add	r2, 4 -> r7
	;;
#0:	       add	r3, r5 -> r5
	;;
#0:	       sra	r5, 16 -> r0
	;;
#0:	       add	r6, r0 -> r6
#1:	       bbh	zext16 r5 -> r0
	;;
#0:	if  c1 br	.BB17_17
#1:	       sl	r6, 16 -> r3
#2:	       sra	r6, 16 -> r5
	;;
#0:	       or	r3, r0 -> r0
#1:	       sr	r8, 16 -> r3
	;;
#0:	       stm.a	r0, r2, 0
#1:	       or	r7, 0 -> r2
	;;
.BB17_18:
#0:	       s2add	r11, r10 -> r0
#1:	       add	r1, 1 -> r1
	;;
#0:	       ldm.f	r0, 20
	;;
#0:	       brz ne @	r31, .BB17_23
	;;
.BB17_19:                               ; %.preheader3.preheader
#0:	       add	r0, 16 -> r0
	;;
.BB17_20:                               ; %.preheader3
                                        ; =>This Inner Loop Header: Depth=1
#0:	       cmpu le	r0, r12 -> c1
#1:	       or	r10, 0 -> r3
	;;
#0:	if  c1 br @	.BB17_22
	;;
.BB17_21:                               ;   in Loop: Header=BB17_20 Depth=1
#0:	       sub	r0, 4 -> r2
#1:	       ldm.f	r0, 0
#2:	       sub	r3, 1 -> r10
	;;
#0:	       brz eq @	r31, .BB17_20
#1:	       or	r2, 0 -> r0
	;;
.BB17_22:                               ; %.critedge1
#0:	       stm.a	r3, r11, 4
	;;
.BB17_23:
#0:	       ldm.s	r15, 4
#1:	       or	r1, 0 -> r0
	;;
#0:	       stx	r31 -> $ro
#1:	       ldm.s	r15, 8
	;;
#0:	       stx	r31 -> $rb
#1:	       ldm.s	r15, 12
	;;
#2:	       or	r31, 0 -> r2.24
#0:	       ldm.s	r15, 16
	;;
#2:	       or	r31, 0 -> r2.23
#0:	       ldm.s	r15, 20
	;;
#0:	       or	r31, 0 -> r14
#1:	       ldm.s	r15, 24
	;;
#0:	       or	r31, 0 -> r13
#1:	       ldm.s	r15, 28
	;;
#0:	       or	r31, 0 -> r12
#1:	       ldm.s	r15, 32
	;;
#0:	       or	r31, 0 -> r11
#1:	       ldm.s	r15, 36
#2:	       addi	56 -> r15
	;;
#0:	       jop	ret
#1:	       or	r31, 0 -> r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
_quorem_end:
.tmp17:
	.size	_quorem, .tmp17-_quorem

	.type	__fflush_r,@function
__fflush_r:                             ; @_fflush_r
	.funsz	__fflush_r_end-__fflush_r
__fflush_r_start:
; BB#0:
#0:	       wb.s	r15, 10
#1:	       addi	-40 -> r15
#2:	       ldx	$rb, 0 -> r1
#3:	       ldx	$ro, 0 -> r3
	;;
#0:	       stm.s	r10, r15, 5
	;;
#0:	       stm.s	r11, r15, 4
#1:	       or	r0, 0 -> r11
	;;
#0:	       stm.s	r12, r15, 3
	;;
#0:	       stm.s	r1, r15, 2
	;;
#0:	       stm.s	r3, r15, 1
	;;
#0:	       ldmg.d	_impure_data+56
	;;
#0:	       brz ne @	r31, .BB18_2
	;;
.BB18_1:
#0:	       callg	___sinit
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB18_2:
#0:	       ldm.f	r11, 12
#1:	       ldi	0 -> r2
	;;
#0:	       bbh	mzext16 r11 -> r1
	;;
#0:	       cmp eq	r1, 0 -> c3
	;;
#0:	if  c3 br @	.BB18_35
	;;
.BB18_3:
#0:	       bbh	sext16 r1 -> r0
	;;
#0:	       btest	r0, 3 -> c1
	;;
#0:	if !c1 br @	.BB18_12
	;;
.BB18_4:
#0:	       ldm.f	r11, 16
#1:	       ldi	0 -> r2
	;;
#0:	       or	r31, 0 -> r10
	;;
#0:	       cmp eq	r10, 0 -> c3
	;;
#0:	if  c3 br @	.BB18_35
	;;
.BB18_5:
#0:	       ldm.f	r11, 0
#1:	       and	r0, 3 -> r1
#2:	       ldi	0 -> r0
	;;
#0:	       brz ne @	r1, .BB18_7
#1:	       or	r31, 0 -> r2
#2:	       stm.a	r10, r11, 0
	;;
.BB18_6:
#0:	       ldm.f	r11, 20
	;;
#0:	       or	r31, 0 -> r0
	;;
.BB18_7:
#0:	       sub	r2, r10 -> r12
#1:	       br @	.BB18_9
#2:	       stm.a	r0, r11, 2
	;;
.BB18_8:                                ;   in Loop: Header=BB18_9 Depth=1
#0:	       sub	r12, r0 -> r12
#1:	       add	r10, r0 -> r10
	;;
.BB18_9:                                ; =>This Inner Loop Header: Depth=1
#0:	       cmp lt	r12, 1 -> c1
#1:	       ldi	0 -> r2
	;;
#0:	if  c1 br @	.BB18_35
	;;
.BB18_10:                               ;   in Loop: Header=BB18_9 Depth=1
#0:	       ldm.f	r11, 28
#1:	       ldga	_impure_data -> r0
#2:	       or	r10, 0 -> r2
#3:	       or	r12, 0 -> r3
	;;
#0:	       or	r31, 0 -> r1
#1:	       ldm.f	r11, 36
	;;
#0:	       jop	call	r31
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz gt @	r0, .BB18_8
	;;
.BB18_11:
#0:	       ldm.f	r11, 12
#1:	       ldi	-1 -> r2
#2:	       ldi	64 -> r0
	;;
#0:	       br	.BB18_35
#1:	       bbh	mzext16 r11 -> r1
	;;
#0:	       or	r1, r0 -> r0
	;;
#0:	       stmh.a	r0, r11, 6
	;;
.BB18_12:
#0:	       ldga	2048 -> r0
	;;
#0:	       or	r1, r0 -> r0
	;;
#0:	       stmh.a	r0, r11, 6
	;;
#0:	       ldm.f	r11, 4
	;;
#0:	       brz gt @	r31, .BB18_14
	;;
.BB18_13:
#0:	       ldm.f	r11, 60
#1:	       ldi	0 -> r2
	;;
#0:	       cmp lt	r31, 1 -> c1
	;;
#0:	if  c1 br @	.BB18_35
	;;
.BB18_14:
#0:	       ldm.f	r11, 40
#1:	       ldi	0 -> r2
	;;
#0:	       or	r31, 0 -> r4
	;;
#0:	       brz eq @	r4, .BB18_35
	;;
.BB18_15:
#0:	       btest	r1, 12 -> !c1
#1:	       ldmg.d	_impure_data
#2:	       ldga	_impure_data -> r0
	;;
#0:	if  c1 br @	.BB18_17
#1:	       or	r31, 0 -> r10
#2:	       stm.a	0, r0, 0
	;;
.BB18_16:
#0:	       ldm.f	r11, 80
#1:	       br	.BB18_19
	;;
#0:	       or	r31, 0 -> r2
	;;
	       nop	0
	;;
.BB18_17:
#0:	       ldm.f	r11, 28
#1:	       ldga	_impure_data -> r0
#2:	       ldi	0 -> r2
#3:	       ldi	1 -> r3
	;;
#0:	       or	r31, 0 -> r1
	;;
#0:	       jop	call	r4
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r2
	;;
#0:	       cmp ne	r2, -1 -> c1
	;;
#0:	if  c1 br @	.BB18_19
	;;
.BB18_18:
#0:	       ldmg.d	_impure_data
#1:	       ldi	-1 -> r2
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       brz ne @	r0, .BB18_31
	;;
.BB18_19:                               ; %._crit_edge2.i
#0:	       ldm.f	r11, 12
	;;
#0:	       bbh	mzext8 r11 -> r0
	;;
#0:	       btest	r0, 2 -> !c1
	;;
#0:	if  c1 br @	.BB18_22
	;;
.BB18_20:
#0:	       ldm.f	r11, 4
	;;
#0:	       sub	r2, r31 -> r2
#1:	       ldm.f	r11, 48
	;;
#0:	       brz eq @	r31, .BB18_22
	;;
.BB18_21:
#0:	       ldm.f	r11, 60
	;;
#0:	       sub	r2, r31 -> r2
	;;
.BB18_22:                               ; %._crit_edge.i
#0:	       ldm.f	r11, 28
#1:	       ldga	_impure_data -> r0
#2:	       ldi	0 -> r3
	;;
#0:	       or	r31, 0 -> r1
#1:	       ldm.f	r11, 40
	;;
#0:	       jop	call	r31
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r2
	;;
#0:	       cmp ne	r2, -1 -> c1
	;;
#0:	if  c1 br @	.BB18_25
	;;
.BB18_23:
#0:	       ldmg.d	_impure_data
	;;
#0:	       or	r31, 0 -> r1
	;;
#0:	       cmpu gt	r1, 29 -> c1
	;;
#0:	if  c1 br @	.BB18_11
	;;
.BB18_24:
#0:	       ldiu	1 -> r3
#1:	       ldi	1 -> r0
	;;
#0:	       sl	r0, r1 -> r1
#1:	       ldih	258 -> r3
	;;
#0:	       and	r1, r3 -> r0
	;;
#0:	       brz eq @	r0, .BB18_11
	;;
.BB18_25:
#0:	       ldm.f	r11, 12
#1:	       ldiu	2047 -> r0
	;;
#0:	       ldim	30 -> r0
	;;
#0:	       bbh	mzext16 r11 -> r1
	;;
#0:	       and	r1, r0 -> r0
#1:	       btest	r1, 12 -> !c1
	;;
#0:	       stmh.a	r0, r11, 6
	;;
#0:	if  c1 br	.BB18_27
#1:	       stm.a	0, r11, 1
	;;
#0:	       ldm.f	r11, 16
	;;
#0:	       stm.a	r31, r11, 0
	;;
.BB18_26:
#0:	       ldmg.d	_impure_data
#1:	       cmp ne	r2, -1 -> c2
	;;
#0:	       cmp eq	r31, 0 -> c1
	;;
#0:	       comb	or c2, c1 -> c1
	;;
#0:	if  c1 stm.a	r2, r11, 20
	;;
.BB18_27:
#0:	       ldga	_impure_data -> r0
#1:	       ldi	0 -> r2
	;;
#0:	       stm.a	r10, r0, 0
	;;
#0:	       ldm.f	r11, 48
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       brz eq @	r0, .BB18_35
	;;
.BB18_28:
#0:	       s2add	r11, 16 -> r1
	;;
#0:	       cmp eq	r0, r1 -> c1
	;;
#0:	if  c1 br @	.BB18_30
	;;
.BB18_29:
#0:	       callg	__free_r
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB18_30:
#0:	       stm.a	0, r11, 12
#1:	       br @	.BB18_34
	;;
.BB18_31:
#0:	       cmpu eq	r0, 22 -> c1
	;;
#0:	if  c1 br @	.BB18_33
	;;
.BB18_32:
#0:	       cmpu ne	r0, 29 -> c1
	;;
#0:	if  c1 br @	.BB18_11
	;;
.BB18_33:
#0:	       ldga	_impure_data -> r0
	;;
#0:	       stm.a	r10, r0, 0
	;;
.BB18_34:
#0:	       ldi	0 -> r2
	;;
.BB18_35:                               ; %__sflush_r.exit
#0:	       ldm.s	r15, 4
#1:	       or	r2, 0 -> r0
	;;
#0:	       stx	r31 -> $ro
#1:	       ldm.s	r15, 8
	;;
#0:	       stx	r31 -> $rb
#1:	       ldm.s	r15, 12
	;;
#0:	       or	r31, 0 -> r12
#1:	       ldm.s	r15, 16
	;;
#0:	       or	r31, 0 -> r11
#1:	       ldm.s	r15, 20
#2:	       addi	40 -> r15
	;;
#0:	       jop	ret
#1:	       or	r31, 0 -> r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
__fflush_r_end:
.tmp18:
	.size	__fflush_r, .tmp18-__fflush_r

	.type	__free_r,@function
__free_r:                               ; @_free_r
	.funsz	__free_r_end-__free_r
__free_r_start:
; BB#0:
#1:	       or	r0, 0 -> r1.16
	;;
#1:	       cmp eq	r1.16, 0 -> c3
	;;
#0:	if  c3 br @	.BB19_41
	;;
.BB19_1:
#1:	       ldm.f	r1.16, -4
#0:	       ldi	-2 -> r0
	;;
#1:	       sub	r1.16, 8 -> r2
	;;
#0:	       or	r31, 0 -> r1
	;;
#0:	       and	r1, r0 -> r7
#1:	       ldi	-4 -> r0
	;;
#1:	       add	r7, r1.16 -> r9
#0:	       sub	r7, 4 -> r5
	;;
#1:	       ldmr.f	r5, r1.16, 0
	;;
#0:	       and	r31, r0 -> r4
#1:	       ldmg.d	___malloc_av_+8
#2:	       sub	r9, 8 -> r0
	;;
#0:	       cmp ne	r0, r31 -> c1
	;;
#0:	if !c1 br @	.BB19_4
	;;
.BB19_2:
#1:	       add	r1.16, r5 -> r0
#0:	       btest	r1, 0 -> c1
	;;
#0:	if !c1 br @	.BB19_13
#1:	       stm.a	r4, r0, 0
	;;
.BB19_3:
#0:	       ldi	0 -> r8
#1:	       br @	.BB19_14
#2:	       or	r7, 0 -> r6
	;;
.BB19_4:
#0:	       btest	r1, 0 -> c1
#1:	       add	r4, r7 -> r3
	;;
#0:	if  c1 br @	.BB19_6
	;;
.BB19_5:
#1:	       ldm.f	r1.16, -8
#0:	       ldi	-8 -> r0
	;;
#0:	       or	r31, 0 -> r1
	;;
#0:	       sub	r0, r1 -> r0
#1:	       add	r1, r3 -> r3
	;;
#1:	       add	r1.16, r0 -> r2
	;;
#0:	       ldm.f	r2, 8
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldm.f	r2, 12
	;;
#0:	       stm.a	r31, r0, 3
	;;
#0:	       stm.a	r0, r31, 2
	;;
.BB19_6:
#0:	       or	r3, 1 -> r0
#1:	       ldga	___malloc_av_ -> r1
	;;
#0:	       stm.a	r0, r2, 1
	;;
#0:	       stm.a	r2, r1, 2
#1:	       ldga	131072 -> r1
	;;
#0:	       cmpu lt	r3, r1 -> c1
	;;
#0:	if  c1 br @	.BB19_41
	;;
.BB19_7:
#0:	       ldi	-4 -> r0
	;;
#0:	       and	r3, r0 -> r5
#1:	       ldiu	0 -> r3
	;;
#0:	       sub	r5, 17 -> r1
#1:	       ldim	2046 -> r3
	;;
#0:	       and	r1, r3 -> r4
#1:	       ldga	4096 -> r3
	;;
#0:	       cmp lt	r4, r3 -> c1
	;;
#0:	if  c1 br @	.BB19_41
	;;
.BB19_8:
#0:	       ldmg.d	__sbrk.heap_end
#1:	       ldga	_errno.b -> r0
	;;
#0:	       brz ne	r31, .BB19_10
#1:	       stmb.a	0, r0, 0
	;;
#0:	       or	r31, 0 -> r0.16
	;;
	       nop	0
	;;
.BB19_9:
#0:	       ldga	_end -> r0.16
#1:	       ldga	__sbrk.heap_end -> r0
	;;
#0:	       stm.a	r0.16, r0, 0
	;;
.BB19_10:                               ; %_sbrk_r.exit.i
#0:	       add	r2, r5 -> r0
#1:	       ldga	__sbrk.heap_end -> r3
	;;
#0:	       cmp ne	r0.16, r0 -> c1
	;;
#1:	if  c1 br @	.BB19_41
#0:	       stm.a	r0.16, r3, 0
	;;
.BB19_11:                               ; %_sbrk_r.exit8.i
#0:	       cmp ne	r0.16, -1 -> c1
#1:	       ldga	_errno.b -> r0
	;;
#1:	if !c1 br	.BB19_27
#0:	       sub	r0.16, r4 -> r1
#2:	       stmb.a	0, r0, 0
	;;
#0:	       stm.a	r1, r3, 0
	;;
	       nop	0
	;;
.BB19_12:
#0:	       sub	r5, r4 -> r0
	;;
#0:	       or	r0, 1 -> r0
	;;
#0:	       stm.a	r0, r2, 1
#1:	       ldga	___malloc_current_mallinfo.0 -> r0
	;;
#0:	       jop	ret
	;;
#0:	       ldmg.d	___malloc_current_mallinfo.0
	;;
#0:	       sub	r31, r4 -> r1
	;;
#0:	       stm.a	r1, r0, 0
	;;
.BB19_13:
#1:	       ldm.f	r1.16, -8
#0:	       ldi	-8 -> r0
#2:	       ldi	1 -> r8
	;;
#0:	       sub	r0, r31 -> r1
#1:	       add	r31, r7 -> r6
#2:	       ldga	___malloc_av_+8 -> r0
	;;
#1:	       add	r1.16, r1 -> r2
	;;
#0:	       ldm.f	r2, 8
	;;
#0:	       or	r31, 0 -> r3
	;;
#0:	       cmp eq	r3, r0 -> c1
	;;
#1:	if !c1 add	r1, r1.16 -> r0
#0:	if !c1 ldi	0 -> r8
	;;
#0:	if !c1 ldm.f	r0, 12
	;;
#0:	if !c1 stm.a	r31, r3, 3
	;;
#0:	if !c1 stm.a	r3, r31, 2
	;;
.BB19_14:
#0:	       add	r5, r4 -> r0
	;;
#1:	       ldmr.f	r0, r1.16, 0
	;;
#0:	       btest	r31, 0 -> c1
	;;
#0:	if  c1 br @	.BB19_17
	;;
.BB19_15:
#1:	       ldmr.f	r7, r1.16, 0
#0:	       ldga	___malloc_av_+8 -> r1
#2:	       cmp eq	r8, 0 -> c1
#3:	       add	r6, r4 -> r6
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       cmp eq	r0, r1 -> c2
	;;
#0:	       comb	and c1, c2 -> c1
	;;
#0:	if  c1 br @	.BB19_42
	;;
.BB19_16:                               ; %._crit_edge
#0:	       ldm.f	r9, 4
	;;
#0:	       stm.a	r31, r0, 3
	;;
#0:	       stm.a	r0, r31, 2
	;;
.BB19_17:                               ; %._crit_edge
#0:	       or	r6, 1 -> r0
#1:	       brz ne	r8, .BB19_41
#2:	       add	r2, r6 -> r3
	;;
#0:	       stm.a	r0, r2, 1
	;;
#0:	       stm.a	r6, r3, 0
	;;
.BB19_18:
#0:	       ldi	511 -> r0
	;;
#0:	       cmpu gt	r6, r0 -> c1
	;;
#0:	if !c1 br @	.BB19_43
	;;
.BB19_19:
#0:	       sr	r6, 9 -> r5
	;;
#0:	       brz eq @	r5, .BB19_22
	;;
.BB19_20:
#0:	       ldiu	511 -> r1
#1:	       ldiu	511 -> r0
	;;
#0:	       ldim	1 -> r1
	;;
#0:	       cmpu gt	r6, r1 -> c1
	;;
#0:	if  c1 br @	.BB19_23
	;;
.BB19_21:
#0:	       sr	r6, 6 -> r0
#1:	       br	.BB19_34
	;;
#0:	       s2add	r0, 14 -> r5
	;;
	       nop	0
	;;
.BB19_22:
#0:	       sr	r6, 3 -> r5
#1:	       br @	.BB19_34
	;;
.BB19_23:
#0:	       ldim	5 -> r0
	;;
#0:	       cmpu gt	r6, r0 -> c1
	;;
#0:	if  c1 br @	.BB19_25
	;;
.BB19_24:
#0:	       addi	91 -> r5
#1:	       br @	.BB19_34
	;;
.BB19_25:
#0:	       ldiu	511 -> r1
#1:	       ldiu	511 -> r0
	;;
#0:	       ldim	21 -> r1
	;;
#0:	       cmpu gt	r6, r1 -> c1
	;;
#0:	if  c1 br @	.BB19_31
	;;
.BB19_26:
#0:	       sr	r6, 12 -> r5
#1:	       br	.BB19_34
	;;
#0:	       addi	110 -> r5
	;;
	       nop	0
	;;
.BB19_27:
#0:	       stmb.a	0, r0, 0
#1:	       brz ne @	r1, .BB19_29
	;;
.BB19_28:
#0:	       ldga	__sbrk.heap_end -> r0
#1:	       ldga	_end -> r1
	;;
#0:	       stm.a	r1, r0, 0
	;;
.BB19_29:                               ; %_sbrk_r.exit4.i
#0:	       ldga	__sbrk.heap_end -> r0
#1:	       sub	r1, r2 -> r3
	;;
#0:	       stm.a	r1, r0, 0
#1:	       ldi	16 -> r0
	;;
#0:	       cmp lt	r3, r0 -> c1
	;;
#0:	if  c1 br @	.BB19_41
	;;
.BB19_30:
#0:	       ldmg.d	___malloc_sbrk_base
#1:	       ldga	___malloc_current_mallinfo.0 -> r0
#2:	       or	r3, 1 -> r3
	;;
#0:	       jop	ret
#1:	       sub	r1, r31 -> r1
	;;
#0:	       stm.a	r1, r0, 0
	;;
#0:	       stm.a	r3, r2, 1
	;;
	       nop	0
	;;
.BB19_31:
#0:	       ldim	85 -> r0
	;;
#0:	       cmpu gt	r6, r0 -> c1
	;;
#0:	if  c1 br @	.BB19_33
	;;
.BB19_32:
#0:	       sr	r6, 15 -> r5
#1:	       br	.BB19_34
	;;
#0:	       addi	119 -> r5
	;;
	       nop	0
	;;
.BB19_33:
#0:	       ldiu	511 -> r0
#1:	       ldi	126 -> r5
	;;
#0:	       ldim	341 -> r0
	;;
#0:	       cmpu gt	r6, r0 -> c1
	;;
#0:	if !c1 sr	r6, 18 -> r0
	;;
#0:	if !c1 s2add	r0, 31 -> r5
	;;
.BB19_34:
#0:	       sl	r5, 3 -> r0
#1:	       ldga	___malloc_av_ -> r3
	;;
#0:	       add	r3, r0 -> r7
	;;
#0:	       ldm.f	r7, 8
	;;
#0:	       or	r31, 0 -> r4
	;;
#0:	       cmp ne	r4, r7 -> c1
	;;
#0:	if !c1 br @	.BB19_39
	;;
.BB19_35:
#0:	       ldi	-4 -> r1
#1:	       br @	.BB19_37
	;;
.BB19_36:                               ;   in Loop: Header=BB19_37 Depth=1
#0:	       ldm.f	r4, 8
	;;
#0:	       or	r31, 0 -> r4
	;;
.BB19_37:                               ; %.preheader
                                        ; =>This Inner Loop Header: Depth=1
#0:	       cmp eq	r4, r7 -> c1
	;;
#0:	if !c1 ldm.f	r4, 4
	;;
#0:	if !c1 and	r31, r1 -> r0
	;;
#0:	if !c1 cmpu ge	r6, r0 -> c1
	;;
#0:	if !c1 br @	.BB19_36
	;;
.BB19_38:                               ; %.critedge
#0:	       ldm.f	r4, 12
#1:	       br	.BB19_40
	;;
#0:	       or	r31, 0 -> r7
	;;
	       nop	0
	;;
.BB19_39:
#0:	       sra	r5, 31 -> r0
#1:	       ldmg.d	___malloc_av_+4
#2:	       or	r7, 0 -> r4
	;;
#0:	       sr	r0, 30 -> r0
	;;
#0:	       add	r5, r0 -> r0
	;;
#0:	       sra	r0, 2 -> r1
#1:	       ldi	1 -> r0
	;;
#0:	       sl	r0, r1 -> r0
	;;
#0:	       or	r31, r0 -> r0
	;;
#0:	       stm.a	r0, r3, 1
	;;
.BB19_40:
#0:	       stm.a	r7, r2, 3
	;;
#0:	       stm.a	r4, r2, 2
	;;
#0:	       stm.a	r2, r7, 2
	;;
#0:	       stm.a	r2, r4, 3
	;;
.BB19_41:                               ; %_malloc_trim_r.exit
#0:	       jop	ret
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB19_42:                               ; %.thread
#0:	       ldga	___malloc_av_ -> r0
#1:	       add	r2, r6 -> r3
	;;
#0:	       stm.a	r2, r0, 5
	;;
#0:	       stm.a	r2, r0, 4
#1:	       or	r6, 1 -> r0
	;;
#0:	       stm.a	r1, r2, 3
	;;
#0:	       jop	ret
	;;
#0:	       stm.a	r1, r2, 2
	;;
#0:	       stm.a	r0, r2, 1
	;;
#0:	       stm.a	r6, r3, 0
	;;
.BB19_43:
#0:	       sr	r6, 5 -> r1
#1:	       ldi	1 -> r0
#2:	       ldmg.d	___malloc_av_+4
#3:	       ldi	-8 -> r3
	;;
#0:	       sl	r0, r1 -> r0
#1:	       ldga	___malloc_av_ -> r1
	;;
#0:	       or	r31, r0 -> r0
	;;
#0:	       stm.a	r0, r1, 1
#1:	       and	r6, r3 -> r0
	;;
#0:	       add	r1, r0 -> r0
	;;
#0:	       ldm.f	r0, 8
	;;
#0:	       stm.a	r0, r2, 3
	;;
#0:	       stm.a	r31, r2, 2
	;;
#0:	       stm.a	r2, r0, 2
	;;
#0:	       stm.a	r2, r31, 3
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
__free_r_end:
.tmp19:
	.size	__free_r, .tmp19-__free_r

	.type	__malloc_r,@function
__malloc_r:                             ; @_malloc_r
	.funsz	__malloc_r_end-__malloc_r
__malloc_r_start:
; BB#0:
#0:	       or	r0, 0 -> r2
#1:	       wb.s	r15, 8
#2:	       addi	-32 -> r15
#3:	       ldi	-8 -> r0
	;;
#0:	       add	r2, 11 -> r1
#1:	       stm.s	r10, r15, 3
#2:	       ldi	16 -> r10
#3:	       ldx	$rb, 0 -> r3
	;;
#0:	       cmpu lt	r1, 23 -> c1
#1:	       stm.s	r3, r15, 2
#2:	       ldx	$ro, 0 -> r3
	;;
#0:	if !c1 and	r1, r0 -> r10 ; aaaf
#1:	       stm.s	r3, r15, 1
	;;
#0:	       cmpu lt	r10, r2 -> c2
#1:	       cmp lt	r10, 0 -> c1
	;;
#0:	       comb	or c1, c2 -> c1
	;;
#0:	if !c1 br @	.BB20_2
	;;
.BB20_1:
#0:	       ldi	0 -> r5
#1:	       br	.BB20_98
#2:	       ldga	_impure_data -> r0
	;;
#0:	       stm.a	12, r0, 0
	;;
	       nop	0
	;;
.BB20_2:
#0:	       ldi	503 -> r0
	;;
#0:	       cmpu gt	r10, r0 -> c1
	;;
#0:	if  c1 br @	.BB20_5
	;;
.BB20_3:
#0:	       sr	r10, 2 -> r3
#1:	       ldga	___malloc_av_ -> r1
	;;
#0:	       s2add	r1, r3 -> r0
	;;
#0:	       ldm.f	r0, 12
	;;
#0:	       cmp ne	r31, r0 -> c1
#1:	       or	r31, 0 -> r2
	;;
#0:	if !c1 s2add	r1, r3 -> r0
	;;
#0:	if !c1 ldm.f	r0, 20
#1:	if !c1 add	r0, 8 -> r0
	;;
#0:	if !c1 or	r31, 0 -> r2
	;;
#0:	       cmp eq	r2, r0 -> c1
	;;
#0:	if  c1 br @	.BB20_8
	;;
.BB20_4:
#0:	       ldm.f	r2, 4
#1:	       ldi	-4 -> r3
#2:	       add	r2, 8 -> r5
	;;
#0:	       or	r31, 0 -> r1
#1:	       ldm.f	r2, 8
	;;
#0:	       add	r1, 4 -> r1
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldm.f	r2, 12
#2:	       and	r1, r3 -> r1
	;;
#0:	       stm.a	r31, r0, 3
	;;
#0:	       stm.a	r0, r31, 2
#1:	       add	r2, r1 -> r0
	;;
#0:	       br	.BB20_98
#1:	       ldmr.f	r1, r2, 0
	;;
#0:	       or	r31, 1 -> r1
	;;
#0:	       stm.a	r1, r0, 0
	;;
.BB20_5:
#0:	       sr	r10, 9 -> r7
	;;
#0:	       brz eq @	r7, .BB20_9
	;;
.BB20_6:
#0:	       ldiu	511 -> r1
#1:	       ldiu	511 -> r0
	;;
#0:	       ldim	1 -> r1
	;;
#0:	       cmpu gt	r10, r1 -> c1
	;;
#0:	if  c1 br @	.BB20_10
	;;
.BB20_7:
#0:	       sr	r10, 6 -> r0
#1:	       br	.BB20_17
	;;
#0:	       s2add	r0, 14 -> r7
	;;
	       nop	0
	;;
.BB20_8:
#0:	       sr	r10, 3 -> r0
#1:	       br	.BB20_24
	;;
#0:	       add	r0, 2 -> r3
	;;
	       nop	0
	;;
.BB20_9:
#0:	       sr	r10, 3 -> r7
#1:	       br @	.BB20_17
	;;
.BB20_10:
#0:	       ldim	5 -> r0
	;;
#0:	       cmpu gt	r10, r0 -> c1
	;;
#0:	if  c1 br @	.BB20_12
	;;
.BB20_11:
#0:	       addi	91 -> r7
#1:	       br @	.BB20_17
	;;
.BB20_12:
#0:	       ldiu	511 -> r1
#1:	       ldiu	511 -> r0
	;;
#0:	       ldim	21 -> r1
	;;
#0:	       cmpu gt	r10, r1 -> c1
	;;
#0:	if  c1 br @	.BB20_14
	;;
.BB20_13:
#0:	       sr	r10, 12 -> r7
#1:	       br	.BB20_17
	;;
#0:	       addi	110 -> r7
	;;
	       nop	0
	;;
.BB20_14:
#0:	       ldim	85 -> r0
	;;
#0:	       cmpu gt	r10, r0 -> c1
	;;
#0:	if  c1 br @	.BB20_16
	;;
.BB20_15:
#0:	       sr	r10, 15 -> r7
#1:	       br	.BB20_17
	;;
#0:	       addi	119 -> r7
	;;
	       nop	0
	;;
.BB20_16:
#0:	       ldiu	511 -> r0
#1:	       ldi	126 -> r7
	;;
#0:	       ldim	341 -> r0
	;;
#0:	       cmpu gt	r10, r0 -> c1
	;;
#0:	if !c1 sr	r10, 18 -> r0
	;;
#0:	if !c1 s2add	r0, 31 -> r7
	;;
.BB20_17:
#0:	       sl	r7, 3 -> r0
#1:	       ldga	___malloc_av_ -> r1
#2:	       ldi	-4 -> r2
	;;
#0:	       add	r1, r0 -> r6
#1:	       ldi	16 -> r1
	;;
#0:	       ldm.f	r6, 12
	;;
#0:	       or	r31, 0 -> r0
	;;
.BB20_18:                               ; =>This Inner Loop Header: Depth=1
#0:	       or	r0, 0 -> r5
	;;
#0:	       cmp eq	r5, r6 -> c1
	;;
#0:	if  c1 br @	.BB20_23
	;;
.BB20_19:                               ;   in Loop: Header=BB20_18 Depth=1
#0:	       ldm.f	r5, 4
	;;
#0:	       and	r31, r2 -> r4
	;;
#0:	       sub	r4, r10 -> r3
	;;
#0:	       cmp lt	r3, r1 -> c1
	;;
#0:	if !c1 br @	.BB20_22
	;;
.BB20_20:                               ;   in Loop: Header=BB20_18 Depth=1
#0:	       ldm.f	r5, 12
#1:	       brz lt	r3, .BB20_18
	;;
#0:	       or	r31, 0 -> r0
	;;
	       nop	0
	;;
.BB20_21:
#0:	       ldm.f	r5, 8
#1:	       add	r4, r5 -> r1
#2:	       add	r5, 8 -> r5
	;;
#0:	       stm.a	r0, r31, 3
	;;
#0:	       stm.a	r31, r0, 2
	;;
#0:	       br	.BB20_98
#1:	       ldm.f	r1, 4
	;;
#0:	       or	r31, 1 -> r3
	;;
#0:	       stm.a	r3, r1, 1
	;;
.BB20_22:
#0:	       sub	r7, 1 -> r7
	;;
.BB20_23:                               ; %.loopexit
#0:	       add	r7, 1 -> r3
	;;
.BB20_24:
#0:	       ldmg.d	___malloc_av_+16
#1:	       ldga	___malloc_av_+8 -> r0
	;;
#0:	       or	r31, 0 -> r2
	;;
#0:	       cmp eq	r2, r0 -> c1
	;;
#0:	if  c1 br @	.BB20_49
	;;
.BB20_25:
#0:	       ldm.f	r2, 4
#1:	       ldi	-4 -> r0
	;;
#0:	       or	r31, 0 -> r5
	;;
#0:	       and	r5, r0 -> r4
#1:	       ldi	16 -> r0
	;;
#0:	       sub	r4, r10 -> r6
	;;
#0:	       cmp lt	r6, r0 -> c1
	;;
#0:	if  c1 br @	.BB20_27
	;;
.BB20_26:
#0:	       or	r10, 1 -> r0
#1:	       add	r2, r10 -> r1
#2:	       ldga	___malloc_av_ -> r3
#3:	       add	r2, 8 -> r5
	;;
#0:	       stm.a	r0, r2, 1
	;;
#0:	       stm.a	r1, r3, 5
	;;
#0:	       stm.a	r1, r3, 4
#1:	       ldga	___malloc_av_+8 -> r3
	;;
#0:	       stm.a	r3, r1, 3
	;;
#0:	       stm.a	r3, r1, 2
#1:	       or	r10, 4 -> r3
	;;
#0:	       br	.BB20_98
#1:	       add	r2, r3 -> r0
#2:	       or	r6, 1 -> r3
	;;
#0:	       stm.a	r3, r0, 0
#1:	       add	r2, r4 -> r3
	;;
#0:	       stm.a	r6, r3, 0
	;;
.BB20_27:
#0:	       ldga	___malloc_av_ -> r1
#1:	       brz lt	r6, .BB20_29
#2:	       ldga	___malloc_av_+8 -> r0
	;;
#0:	       stm.a	r0, r1, 5
	;;
#0:	       stm.a	r0, r1, 4
	;;
.BB20_28:
#0:	       add	r4, r2 -> r1
#1:	       add	r2, 8 -> r5
	;;
#0:	       br	.BB20_98
#1:	       ldm.f	r1, 4
	;;
#0:	       or	r31, 1 -> r0
	;;
#0:	       stm.a	r0, r1, 1
	;;
.BB20_29:
#0:	       ldi	511 -> r0
	;;
#0:	       cmpu gt	r4, r0 -> c1
	;;
#0:	if  c1 br @	.BB20_31
	;;
.BB20_30:
#0:	       sr	r5, 5 -> r1
#1:	       ldi	1 -> r0
#2:	       ldmg.d	___malloc_av_+4
	;;
#0:	       sl	r0, r1 -> r0
#1:	       ldga	___malloc_av_ -> r1
	;;
#0:	       or	r31, r0 -> r0
	;;
#0:	       stm.a	r0, r1, 1
#1:	       ldi	-8 -> r0
	;;
#0:	       and	r5, r0 -> r0
	;;
#0:	       add	r1, r0 -> r0
	;;
#0:	       ldm.f	r0, 8
	;;
#0:	       stm.a	r0, r2, 3
	;;
#0:	       br	.BB20_49
#1:	       stm.a	r31, r2, 2
	;;
#0:	       stm.a	r2, r0, 2
	;;
#0:	       stm.a	r2, r31, 3
	;;
.BB20_31:
#0:	       sr	r5, 9 -> r6
	;;
#0:	       brz eq @	r6, .BB20_34
	;;
.BB20_32:
#0:	       ldiu	511 -> r1
#1:	       ldiu	511 -> r0
	;;
#0:	       ldim	1 -> r1
	;;
#0:	       cmpu gt	r5, r1 -> c1
	;;
#0:	if  c1 br @	.BB20_35
	;;
.BB20_33:
#0:	       sr	r5, 6 -> r0
#1:	       br	.BB20_42
	;;
#0:	       s2add	r0, 14 -> r6
	;;
	       nop	0
	;;
.BB20_34:
#0:	       sr	r5, 3 -> r6
#1:	       br @	.BB20_42
	;;
.BB20_35:
#0:	       ldim	5 -> r0
	;;
#0:	       cmpu gt	r5, r0 -> c1
	;;
#0:	if  c1 br @	.BB20_37
	;;
.BB20_36:
#0:	       addi	91 -> r6
#1:	       br @	.BB20_42
	;;
.BB20_37:
#0:	       ldiu	511 -> r1
#1:	       ldiu	511 -> r0
	;;
#0:	       ldim	21 -> r1
	;;
#0:	       cmpu gt	r5, r1 -> c1
	;;
#0:	if  c1 br @	.BB20_39
	;;
.BB20_38:
#0:	       sr	r5, 12 -> r6
#1:	       br	.BB20_42
	;;
#0:	       addi	110 -> r6
	;;
	       nop	0
	;;
.BB20_39:
#0:	       ldim	85 -> r0
	;;
#0:	       cmpu gt	r5, r0 -> c1
	;;
#0:	if  c1 br @	.BB20_41
	;;
.BB20_40:
#0:	       sr	r5, 15 -> r6
#1:	       br	.BB20_42
	;;
#0:	       addi	119 -> r6
	;;
	       nop	0
	;;
.BB20_41:
#0:	       ldiu	511 -> r0
#1:	       ldi	126 -> r6
	;;
#0:	       ldim	341 -> r0
	;;
#0:	       cmpu gt	r5, r0 -> c1
	;;
#0:	if !c1 sr	r5, 18 -> r0
	;;
#0:	if !c1 s2add	r0, 31 -> r6
	;;
.BB20_42:
#0:	       sl	r6, 3 -> r0
#1:	       ldga	___malloc_av_ -> r1
	;;
#0:	       add	r1, r0 -> r7
	;;
#0:	       ldm.f	r7, 8
	;;
#0:	       or	r31, 0 -> r5
	;;
#0:	       cmp ne	r5, r7 -> c1
	;;
#0:	if !c1 br @	.BB20_47
	;;
.BB20_43:
#0:	       ldi	-4 -> r1
#1:	       br @	.BB20_45
	;;
.BB20_44:                               ;   in Loop: Header=BB20_45 Depth=1
#0:	       ldm.f	r5, 8
	;;
#0:	       or	r31, 0 -> r5
	;;
.BB20_45:                               ; %.preheader
                                        ; =>This Inner Loop Header: Depth=1
#0:	       cmp eq	r5, r7 -> c1
	;;
#0:	if !c1 ldm.f	r5, 4
	;;
#0:	if !c1 and	r31, r1 -> r0
	;;
#0:	if !c1 cmpu ge	r4, r0 -> c1
	;;
#0:	if !c1 br @	.BB20_44
	;;
.BB20_46:                               ; %.critedge
#0:	       ldm.f	r5, 12
#1:	       br	.BB20_48
	;;
#0:	       or	r31, 0 -> r7
	;;
	       nop	0
	;;
.BB20_47:
#0:	       sra	r6, 31 -> r0
#1:	       ldmg.d	___malloc_av_+4
#2:	       or	r7, 0 -> r5
	;;
#0:	       sr	r0, 30 -> r0
	;;
#0:	       add	r6, r0 -> r0
	;;
#0:	       sra	r0, 2 -> r4
#1:	       ldi	1 -> r0
	;;
#0:	       sl	r0, r4 -> r0
	;;
#0:	       or	r31, r0 -> r0
	;;
#0:	       stm.a	r0, r1, 1
	;;
.BB20_48:
#0:	       stm.a	r7, r2, 3
	;;
#0:	       stm.a	r5, r2, 2
	;;
#0:	       stm.a	r2, r7, 2
	;;
#0:	       stm.a	r2, r5, 3
	;;
.BB20_49:                               ; %._crit_edge
#0:	       sra	r3, 31 -> r0
#1:	       ldmg.d	___malloc_av_+4
	;;
#0:	       sr	r0, 30 -> r0
	;;
#3:	       or	r31, 0 -> r3.16
#0:	       add	r3, r0 -> r0
	;;
#0:	       sra	r0, 2 -> r1
#1:	       ldi	1 -> r0
	;;
#3:	       sl	r0, r1 -> r3.17
	;;
#3:	       cmpu gt	r3.17, r3.16 -> c1
	;;
#0:	if  c1 br @	.BB20_68
	;;
.BB20_50:
#3:	       and	r3.17, r3.16 -> r0
	;;
#0:	       brz ne @	r0, .BB20_53
	;;
.BB20_51:
#3:	       sl	r3.17, 1 -> r3.17
#0:	       add	r3, 4 -> r1
#1:	       ldi	-4 -> r0
	;;
#0:	       and	r1, r0 -> r3
	;;
#3:	       and	r3.17, r3.16 -> r0
	;;
#0:	       brz ne @	r0, .BB20_53
	;;
.BB20_52:                               ; %.lr.ph59
                                        ; =>This Inner Loop Header: Depth=1
#3:	       sl	r3.17, 1 -> r3.17
#0:	       add	r3, 4 -> r3
	;;
#3:	       and	r3.17, r3.16 -> r0
	;;
#0:	       brz eq @	r0, .BB20_52
	;;
.BB20_53:
#3:	       or	r3.16, 0 -> r8
#0:	       br @	.BB20_55
	;;
.BB20_54:                               ;   in Loop: Header=BB20_55 Depth=1
#3:	       or	r3.16, 0 -> r8
#0:	       or	r7, 0 -> r3
	;;
.BB20_55:                               ; %.preheader54
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB20_67 Depth 2
                                        ;     Child Loop BB20_62 Depth 2
                                        ;     Child Loop BB20_56 Depth 2
                                        ;       Child Loop BB20_57 Depth 3
#0:	       sl	r3, 3 -> r0
#1:	       ldga	___malloc_av_ -> r1
#2:	       ldi	-4 -> r2
#3:	       or	r3, 0 -> r7
	;;
#0:	       add	r1, r0 -> r5
#1:	       ldi	16 -> r1
	;;
#0:	       or	r5, 0 -> r4
	;;
.BB20_56:                               ;   Parent Loop BB20_55 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB20_57 Depth 3
#0:	       or	r4, 0 -> r9
	;;
.BB20_57:                               ;   Parent Loop BB20_55 Depth=1
                                        ;     Parent Loop BB20_56 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
#0:	       ldm.f	r9, 12
	;;
#0:	       or	r31, 0 -> r9
	;;
#0:	       cmp eq	r9, r4 -> c1
	;;
#0:	if  c1 br @	.BB20_61
	;;
.BB20_58:                               ;   in Loop: Header=BB20_57 Depth=3
#0:	       ldm.f	r9, 4
	;;
#0:	       and	r31, r2 -> r6
	;;
#1:	       sub	r6, r10 -> r1.16
	;;
#1:	       cmp lt	r1.16, r1 -> c1
	;;
#0:	if !c1 br @	.BB20_71
	;;
.BB20_59:                               ;   in Loop: Header=BB20_57 Depth=3
#1:	       brz lt @	r1.16, .BB20_57
	;;
.BB20_60:
#0:	       add	r6, r9 -> r1
#1:	       add	r9, 8 -> r5
	;;
#0:	       ldm.f	r1, 4
	;;
#0:	       or	r31, 1 -> r0
	;;
#0:	       stm.a	r0, r1, 1
	;;
#0:	       ldm.f	r9, 8
	;;
#0:	       br	.BB20_98
#1:	       or	r31, 0 -> r3
#2:	       ldm.f	r9, 12
	;;
#0:	       stm.a	r31, r3, 3
	;;
#0:	       stm.a	r3, r31, 2
	;;
.BB20_61:                               ;   in Loop: Header=BB20_56 Depth=2
#0:	       add	r7, 1 -> r7
#1:	       add	r4, 8 -> r4
	;;
#0:	       and	r7, 3 -> r0
	;;
#0:	       brz ne @	r0, .BB20_56
	;;
.BB20_62:                               ; %.loopexit46
                                        ;   Parent Loop BB20_55 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       and	r3, 3 -> r0
	;;
#0:	       brz eq @	r0, .BB20_64
	;;
.BB20_63:                               ;   in Loop: Header=BB20_62 Depth=2
#0:	       ldm.f	r5, 0
#1:	       sub	r5, 8 -> r5
#2:	       sub	r3, 1 -> r3
	;;
#0:	       cmp eq	r5, r31 -> c1
	;;
#0:	if !c1 br @	.BB20_65
#1:	if  c1 br @	.BB20_62
	;;
.BB20_64:                               ;   in Loop: Header=BB20_55 Depth=1
#3:	       xor	r3.17, -1 -> r0
	;;
#3:	       and	r8, r0 -> r3.16
#0:	       ldga	___malloc_av_ -> r0
	;;
#3:	       or	r3.16, 0 -> r8
	;;
#3:	       stm.a	r3.16, r0, 1
	;;
.BB20_65:                               ; %.loopexit48
                                        ;   in Loop: Header=BB20_55 Depth=1
#3:	       sl	r3.17, 1 -> r3.17
	;;
#3:	       cmpu le	r3.17, r8 -> c2
	;;
#3:	       cmp ne	r3.17, 0 -> c1
	;;
#0:	       comb	and c2, c1 -> c1
	;;
#0:	if !c1 br @	.BB20_68
	;;
.BB20_66:                               ; %.preheader49
                                        ;   in Loop: Header=BB20_55 Depth=1
#3:	       and	r8, r3.17 -> r0
#0:	       or	r7, 0 -> r3
	;;
#0:	       brz ne @	r0, .BB20_55
	;;
.BB20_67:                               ; %.lr.ph
                                        ;   Parent Loop BB20_55 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#3:	       sl	r3.17, 1 -> r3.17
#0:	       add	r7, 4 -> r7
	;;
#3:	       and	r3.17, r3.16 -> r0
	;;
#0:	       brz eq @	r0, .BB20_67
	;;
#0:	       brz ne @	r0, .BB20_54
	;;
.BB20_68:                               ; %.loopexit55
#0:	       ldmg.d	___malloc_av_+8
#1:	       ldi	-4 -> r0
	;;
#0:	       or	r31, 0 -> r1
	;;
#0:	       ldm.f	r1, 4
	;;
#0:	       and	r31, r0 -> r5
#1:	       ldi	16 -> r0
	;;
#0:	       sub	r5, r10 -> r3
#1:	       cmpu lt	r5, r10 -> c2
	;;
#0:	       cmp lt	r3, r0 -> c1
	;;
#0:	       comb	or c2, c1 -> c1
	;;
#0:	if !c1 br @	.BB20_97
	;;
.BB20_69:
#0:	       ldmg.d	___malloc_sbrk_base
#1:	       add	r1, r5 -> r4
	;;
#0:	       or	r31, 0 -> r7
	;;
#0:	       cmp eq	r7, -1 -> c1
	;;
#0:	if  c1 br @	.BB20_72
	;;
.BB20_70:
#0:	       ldiu	15 -> r0
#1:	       ldiu	0 -> r3
	;;
#0:	       br	.BB20_73
#1:	       ldim	2 -> r0
#2:	       ldim	2046 -> r3
	;;
#0:	       add	r10, r0 -> r2
	;;
#0:	       and	r2, r3 -> r6
	;;
.BB20_71:
#0:	       or	r10, 1 -> r0
#1:	       add	r9, r10 -> r4
#2:	       ldga	___malloc_av_ -> r3
#3:	       add	r9, 8 -> r5
	;;
#0:	       stm.a	r0, r9, 1
#1:	       ldga	___malloc_av_+8 -> r0
#2:	       or	r10, 4 -> r1
	;;
#0:	       ldm.f	r9, 8
#1:	       add	r9, r1 -> r1
	;;
#0:	       or	r31, 0 -> r2
#1:	       ldm.f	r9, 12
	;;
#0:	       stm.a	r31, r2, 3
	;;
#0:	       stm.a	r2, r31, 2
#1:	       or	r1.16, 1 -> r2
	;;
#0:	       stm.a	r4, r3, 5
	;;
#0:	       stm.a	r4, r3, 4
#1:	       add	r9, r6 -> r3
	;;
#0:	       stm.a	r0, r4, 3
	;;
#0:	       br	.BB20_98
#1:	       stm.a	r0, r4, 2
	;;
#0:	       stm.a	r2, r1, 0
	;;
#1:	       stm.a	r1.16, r3, 0
	;;
.BB20_72:
#0:	       add	r10, 16 -> r6
	;;
.BB20_73:
#0:	       ldmg.d	__sbrk.heap_end
#1:	       ldga	_errno.b -> r0
	;;
#0:	       brz ne	r31, .BB20_75
#1:	       stmb.a	0, r0, 0
	;;
#0:	       or	r31, 0 -> r2
	;;
	       nop	0
	;;
.BB20_74:
#0:	       ldga	__sbrk.heap_end -> r0
#1:	       ldga	_end -> r2
	;;
#0:	       stm.a	r2, r0, 0
	;;
.BB20_75:                               ; %_sbrk_r.exit
#0:	       add	r2, r6 -> r0.16
#1:	       cmp eq	r2, -1 -> c1
#2:	       ldga	__sbrk.heap_end -> r0
	;;
#1:	if  c1 br @	.BB20_96
#0:	       stm.a	r0.16, r0, 0
	;;
.BB20_76:
#0:	       ldga	___malloc_av_ -> r0
#1:	       cmpu ge	r2, r4 -> c2
	;;
#0:	       cmp eq	r1, r0 -> c1
	;;
#0:	       comb	or c2, c1 -> c1
	;;
#0:	if !c1 br @	.BB20_96
	;;
.BB20_77:
#0:	       cmp ne	r2, r4 -> c1
#1:	       ldmg.d	___malloc_current_mallinfo.0
#2:	       ldga	___malloc_current_mallinfo.0 -> r0
	;;
#0:	if  c1 br	.BB20_79
#1:	       add	r31, r6 -> r3
	;;
#0:	       stm.a	r3, r0, 0
	;;
	       nop	0
	;;
.BB20_78:
#0:	       ldiu	2047 -> r0
	;;
#0:	       ldim	1 -> r0
	;;
#0:	       and	r4, r0 -> r0
	;;
#0:	       brz eq @	r0, .BB20_89
	;;
.BB20_79:
#0:	       cmp ne	r7, -1 -> c1
	;;
#0:	if !c1 br @	.BB20_81
	;;
.BB20_80:
#0:	       sub	r2, r4 -> r0
#1:	       br	.BB20_82
	;;
#0:	       add	r3, r0 -> r3
#1:	       ldga	___malloc_current_mallinfo.0 -> r0
	;;
#0:	       stm.a	r3, r0, 0
	;;
.BB20_81:
#0:	       ldga	___malloc_sbrk_base -> r0
	;;
#0:	       stm.a	r2, r0, 0
	;;
.BB20_82:
#0:	       add	r2, 8 -> r0
#1:	       ldi	0 -> r7
	;;
#0:	       and	r0, 7 -> r4
	;;
#0:	       brz eq @	r4, .BB20_84
	;;
.BB20_83:
#0:	       ldi	8 -> r0
	;;
#0:	       sub	r0, r4 -> r7
	;;
#0:	       add	r2, r7 -> r2
	;;
.BB20_84:
#0:	       ldiu	2047 -> r4
#1:	       ldga	_errno.b -> r0
#2:	       add	r2, r6 -> r6
	;;
#0:	       ldim	1 -> r4
#1:	       stmb.a	0, r0, 0
#2:	       ldga	4096 -> r0
	;;
#0:	       brz ne	r0.16, .BB20_86
#1:	       and	r6, r4 -> r4
	;;
#0:	       sub	r0, r4 -> r0
	;;
#0:	       add	r0, r7 -> r6
	;;
.BB20_85:
#0:	       ldga	_end -> r0.16
#1:	       ldga	__sbrk.heap_end -> r0
	;;
#0:	       stm.a	r0.16, r0, 0
	;;
.BB20_86:                               ; %_sbrk_r.exit5
#0:	       add	r0.16, r6 -> r4
#1:	       ldga	__sbrk.heap_end -> r0
	;;
#0:	       cmp eq	r0.16, -1 -> c1
#1:	       stm.a	r4, r0, 0
#2:	       ldi	0 -> r0
	;;
#0:	       ldga	___malloc_av_ -> r0.17
#1:	if  c1 or	r0, 0 -> r6
#2:	       ldga	___malloc_current_mallinfo.0 -> r0
	;;
#0:	if  c1 or	r2, 0 -> r0.16
#1:	       add	r6, r3 -> r3
	;;
#0:	       cmp eq	r1, r0.17 -> c1
#1:	       stm.a	r3, r0, 0
#2:	       sub	r6, r2 -> r0
	;;
#1:	if  c1 br	.BB20_92
#0:	       add	r0, r0.16 -> r0
	;;
#0:	       stm.a	r2, r0.17, 2
#1:	       or	r0, 1 -> r0
	;;
#0:	       stm.a	r0, r2, 1
	;;
.BB20_87:
#0:	       cmpu gt	r5, 15 -> c1
	;;
#0:	if  c1 br @	.BB20_90
	;;
.BB20_88:
#0:	       stm.a	1, r2, 1
#1:	       br @	.BB20_96
	;;
.BB20_89:
#0:	       add	r6, r5 -> r0
#1:	       br	.BB20_92
	;;
#0:	       or	r0, 1 -> r0
	;;
#0:	       stm.a	r0, r1, 1
	;;
.BB20_90:
#0:	       sub	r5, 12 -> r2
#1:	       ldi	-8 -> r0
#2:	       ldm.f	r1, 4
	;;
#0:	       and	r2, r0 -> r4
#1:	       or	r2, 4 -> r2
	;;
#0:	       and	r31, 1 -> r0
#1:	       cmpu lt	r4, 16 -> c1
	;;
#0:	       or	r0, r4 -> r0
	;;
#0:	if  c1 br	.BB20_92
#1:	       stm.a	r0, r1, 1
#2:	       add	r1, r2 -> r0
	;;
#0:	       stm.a	5, r0, 0
	;;
#0:	       stm.a	5, r0, 1
	;;
.BB20_91:
#0:	       add	r1, 8 -> r0
#1:	       callg	__free_r
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldmg.d	___malloc_current_mallinfo.0
	;;
#0:	       or	r31, 0 -> r3
	;;
.BB20_92:
#0:	       ldmg.d	___malloc_max_sbrked_mem
	;;
#0:	       cmpu le	r3, r31 -> c1
	;;
#0:	if  c1 br @	.BB20_94
	;;
.BB20_93:
#0:	       ldga	___malloc_max_sbrked_mem -> r0
	;;
#0:	       stm.a	r3, r0, 0
	;;
.BB20_94:
#0:	       ldmg.d	___malloc_max_total_mem
	;;
#0:	       cmpu le	r3, r31 -> c1
	;;
#0:	if  c1 br @	.BB20_96
	;;
.BB20_95:
#0:	       ldga	___malloc_max_total_mem -> r0
	;;
#0:	       stm.a	r3, r0, 0
	;;
.BB20_96:                               ; %malloc_extend_top.exit
#0:	       ldmg.d	___malloc_av_+8
#1:	       ldi	-4 -> r0
#2:	       ldi	16 -> r2
#3:	       ldi	0 -> r5
	;;
#0:	       or	r31, 0 -> r1
	;;
#0:	       ldm.f	r1, 4
	;;
#0:	       and	r31, r0 -> r0
	;;
#0:	       sub	r0, r10 -> r3
#1:	       cmpu lt	r0, r10 -> c2
	;;
#0:	       cmp lt	r3, r2 -> c1
	;;
#0:	       comb	or c2, c1 -> c1
	;;
#0:	if  c1 br @	.BB20_98
	;;
.BB20_97:
#0:	       or	r10, 1 -> r0
#1:	       add	r1, r10 -> r2
#2:	       add	r1, 8 -> r5
	;;
#0:	       stm.a	r0, r1, 1
#1:	       ldga	___malloc_av_ -> r0
	;;
#0:	       stm.a	r2, r0, 2
#1:	       or	r10, 4 -> r2
	;;
#0:	       add	r1, r2 -> r0
#1:	       or	r3, 1 -> r2
	;;
#0:	       stm.a	r2, r0, 0
	;;
.BB20_98:
#0:	       ldm.s	r15, 4
#1:	       or	r5, 0 -> r0
	;;
#0:	       stx	r31 -> $ro
#1:	       ldm.s	r15, 8
	;;
#0:	       stx	r31 -> $rb
#1:	       ldm.s	r15, 12
#2:	       addi	32 -> r15
	;;
#0:	       jop	ret
#1:	       or	r31, 0 -> r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
__malloc_r_end:
.tmp20:
	.size	__malloc_r, .tmp20-__malloc_r

	.type	__realloc_r,@function
__realloc_r:                            ; @_realloc_r
	.funsz	__realloc_r_end-__realloc_r
__realloc_r_start:
; BB#0:
#0:	       wb.s	r15, 14
#1:	       addi	-56 -> r15
#2:	       ldx	$rb, 0 -> r2
#3:	       ldx	$ro, 0 -> r3
	;;
#0:	       stm.s	r10, r15, 9
#1:	       or	r1, 0 -> r8
#2:	       or	r0, 0 -> r10
	;;
#0:	       stm.s	r11, r15, 8
	;;
#0:	       stm.s	r12, r15, 7
	;;
#0:	       stm.s	r13, r15, 6
	;;
#0:	       stm.s	r14, r15, 5
	;;
#3:	       stm.s	r3.23, r15, 4
	;;
#0:	       brz eq	r10, .BB21_3
#3:	       stm.s	r3.24, r15, 3
	;;
#0:	       stm.s	r2, r15, 2
	;;
#0:	       stm.s	r3, r15, 1
	;;
.BB21_1:
#0:	       add	r8, 11 -> r1
#1:	       ldi	16 -> r12
#2:	       ldi	-8 -> r0
#3:	       ldm.f	r10, -4
	;;
#0:	       cmpu lt	r1, 23 -> c1
	;;
#0:	if !c1 and	r1, r0 -> r12 ; aaaf
#1:	       or	r31, 0 -> r5
	;;
#0:	       cmpu lt	r12, r8 -> c2
#1:	       cmp lt	r12, 0 -> c1
	;;
#0:	       comb	or c1, c2 -> c1
	;;
#0:	if !c1 br @	.BB21_4
	;;
.BB21_2:
#0:	       ldi	0 -> r11
#1:	       br	.BB21_15
#2:	       ldga	_impure_data -> r0
	;;
#0:	       stm.a	12, r0, 0
	;;
	       nop	0
	;;
.BB21_3:
#0:	       or	r8, 0 -> r0
#1:	       callg	__malloc_r
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       br @	.BB21_15
#1:	       or	r0, 0 -> r11
	;;
.BB21_4:
#3:	       sub	r10, 8 -> r3.23
#0:	       ldi	-4 -> r0
	;;
#0:	       and	r5, r0 -> r14
	;;
#0:	       cmp ge	r14, r12 -> c1
	;;
#0:	if  c1 br @	.BB21_9
	;;
.BB21_5:
#0:	       sub	r14, 4 -> r13
#1:	       add	r14, r10 -> r0
	;;
#3:	       add	r10, r13 -> r3.24
#0:	       ldmr.f	r13, r10, 0
#1:	       sub	r0, 8 -> r2
	;;
#0:	       or	r31, 0 -> r1
#1:	       ldmg.d	___malloc_av_+8
	;;
#0:	       or	r31, 0 -> r0.16
#1:	       cmp eq	r2, r31 -> c1
	;;
#0:	if  c1 br @	.BB21_16
	;;
.BB21_6:
#0:	       ldi	-2 -> r0
#1:	       ldi	0 -> r4
#2:	       ldi	0 -> r9
	;;
#0:	       and	r1, r0 -> r0
	;;
#0:	       add	r0, r13 -> r0
	;;
#0:	       ldmr.f	r0, r10, 0
	;;
#0:	       btest	r31, 0 -> c1
	;;
#0:	if  c1 br @	.BB21_19
	;;
.BB21_7:
#0:	       ldi	-4 -> r0
#1:	       or	r2, 0 -> r9
	;;
#0:	       and	r1, r0 -> r4
	;;
#0:	       add	r4, r14 -> r3
	;;
#0:	       cmp lt	r3, r12 -> c1
	;;
#0:	if  c1 br @	.BB21_19
	;;
.BB21_8:
#0:	       ldmr.f	r14, r10, 0
#1:	       add	r10, r14 -> r0
	;;
#0:	       br	.BB21_10
#1:	       or	r31, 0 -> r1
#2:	       ldm.f	r0, 4
	;;
#0:	       stm.a	r31, r1, 3
	;;
#0:	       stm.a	r1, r31, 2
	;;
.BB21_9:
#0:	       or	r14, 0 -> r3
	;;
.BB21_10:
#3:	       or	r3.23, 0 -> r11
	;;
.BB21_11:                               ; %memmove.exit29
#0:	       sub	r3, r12 -> r2
	;;
#0:	       cmpu lt	r2, 16 -> c1
	;;
#0:	if  c1 br @	.BB21_13
	;;
.BB21_12:
#0:	       ldm.f	r11, 4
#1:	       or	r12, 4 -> r1
#2:	       or	r2, 1 -> r2
	;;
#0:	       add	r11, r1 -> r1
	;;
#0:	       and	r31, 1 -> r0
	;;
#0:	       or	r0, r12 -> r0
	;;
#0:	       stm.a	r0, r11, 1
#1:	       add	r3, r11 -> r0
	;;
#0:	       stm.a	r2, r1, 0
#1:	       add	r12, r11 -> r2
	;;
#0:	       callg	__free_r
	;;
#0:	       ldm.f	r0, 4
	;;
#0:	       or	r31, 1 -> r3
	;;
#0:	       stm.a	r3, r0, 1
#1:	       add	r2, 8 -> r0
	;;
#0:	       br @	.BB21_14
	;;
.BB21_13:
#0:	       ldm.f	r11, 4
#1:	       add	r3, r11 -> r1
	;;
#0:	       and	r31, 1 -> r0
	;;
#0:	       or	r0, r3 -> r0
	;;
#0:	       stm.a	r0, r11, 1
	;;
#0:	       ldm.f	r1, 4
	;;
#0:	       or	r31, 1 -> r3
	;;
#0:	       stm.a	r3, r1, 1
	;;
.BB21_14:
#0:	       add	r11, 8 -> r11
	;;
.BB21_15:
#0:	       ldm.s	r15, 4
#1:	       or	r11, 0 -> r0
	;;
#0:	       stx	r31 -> $ro
#1:	       ldm.s	r15, 8
	;;
#0:	       stx	r31 -> $rb
#1:	       ldm.s	r15, 12
	;;
#3:	       or	r31, 0 -> r3.24
#0:	       ldm.s	r15, 16
	;;
#3:	       or	r31, 0 -> r3.23
#0:	       ldm.s	r15, 20
	;;
#0:	       or	r31, 0 -> r14
#1:	       ldm.s	r15, 24
	;;
#0:	       or	r31, 0 -> r13
#1:	       ldm.s	r15, 28
	;;
#0:	       or	r31, 0 -> r12
#1:	       ldm.s	r15, 32
	;;
#0:	       or	r31, 0 -> r11
#1:	       ldm.s	r15, 36
#2:	       addi	56 -> r15
	;;
#0:	       jop	ret
#1:	       or	r31, 0 -> r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB21_16:
#0:	       ldi	-4 -> r0
	;;
#0:	       and	r1, r0 -> r4
#1:	       add	r12, 16 -> r0
	;;
#0:	       add	r4, r14 -> r1
	;;
#0:	       cmp lt	r1, r0 -> c1
	;;
#0:	if  c1 br @	.BB21_18
	;;
.BB21_17:
#0:	       add	r12, r10 -> r2
#1:	       ldga	___malloc_av_ -> r1
#2:	       sub	r14, r12 -> r3
#3:	       or	r10, 0 -> r11
	;;
#0:	       sub	r2, 8 -> r0
	;;
#0:	       stm.a	r0, r1, 2
#1:	       add	r3, r4 -> r0
#2:	       sub	r2, 4 -> r1
#3:	       sub	r10, 4 -> r3
	;;
#0:	       or	r0, 1 -> r0
	;;
#0:	       stm.a	r0, r1, 0
	;;
#0:	       ldm.f	r10, -4
	;;
#0:	       br	.BB21_15
#1:	       and	r31, 1 -> r1
	;;
#0:	       or	r1, r12 -> r2
	;;
#0:	       stm.a	r2, r3, 0
	;;
.BB21_18:
#0:	       or	r2, 0 -> r9
	;;
.BB21_19:
#0:	       btest	r5, 0 -> c1
	;;
#0:	if  c1 br @	.BB21_31
	;;
.BB21_20:
#0:	       ldm.f	r10, -8
#1:	       ldi	-4 -> r3
#2:	       ldi	-8 -> r0
	;;
#0:	       or	r31, 0 -> r2
	;;
#0:	       brz eq	r9, .BB21_29
#1:	       sub	r3, r2 -> r5
#2:	       sub	r0, r2 -> r6
	;;
#0:	       ldmr.f	r5, r10, 0
#1:	       add	r10, r6 -> r11
	;;
#0:	       and	r31, r3 -> r7
	;;
.BB21_21:
#0:	       cmp ne	r9, r0.16 -> c1
#1:	       add	r4, r14 -> r0
	;;
#0:	if !c1 br @	.BB21_28
#1:	       add	r0, r7 -> r3
	;;
.BB21_22:
#0:	       cmp lt	r3, r12 -> c1
	;;
#0:	if  c1 br @	.BB21_29
	;;
.BB21_23:
#0:	       ldm.f	r9, 8
#1:	       add	r6, 8 -> r1
#2:	       add	r6, 12 -> r4
	;;
#0:	       add	r10, r1 -> r5
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldm.f	r9, 12
	;;
#0:	       stm.a	r31, r0, 3
	;;
#0:	       stm.a	r0, r31, 2
	;;
#0:	       ldmr.f	r1, r10, 0
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldmr.f	r4, r10, 0
	;;
#0:	       stm.a	r31, r0, 3
	;;
#0:	       stm.a	r0, r31, 2
#1:	       ldi	36 -> r0
	;;
#0:	       cmpu gt	r13, r0 -> c1
	;;
#0:	if  c1 br @	.BB21_63
	;;
.BB21_24:
#0:	       cmpu lt	r13, 20 -> c1
	;;
#0:	if  c1 br @	.BB21_94
	;;
.BB21_25:
#0:	       ldm.f	r10, 0
#1:	       cmpu lt	r13, 28 -> c1
#2:	       add	r6, r10 -> r1
#3:	       add	r10, r4 -> r0
	;;
#0:	if  c1 br	.BB21_92
#1:	       stm.a	r31, r5, 0
#2:	       add	r1, 16 -> r5
	;;
#0:	       ldm.f	r10, 4
	;;
#0:	       stm.a	r31, r0, 0
	;;
.BB21_26:
#0:	       ldm.f	r10, 8
#1:	       ldi	36 -> r0
	;;
#0:	       cmpu lt	r13, r0 -> c1
	;;
#0:	if !c1 br	.BB21_93
#1:	       stm.a	r31, r5, 0
#2:	       add	r1, 24 -> r5
	;;
#0:	       ldm.f	r10, 12
	;;
#0:	       stm.a	r31, r1, 5
	;;
.BB21_27:
#0:	       add	r10, 16 -> r10
#1:	       br @	.BB21_94
	;;
.BB21_28:
#0:	       add	r12, 16 -> r0
	;;
#0:	       cmp lt	r3, r0 -> c1
	;;
#0:	if !c1 br @	.BB21_49
	;;
.BB21_29:
#0:	       brz eq @	r11, .BB21_31
	;;
.BB21_30:
#0:	       add	r7, r14 -> r3
	;;
#0:	       cmp lt	r3, r12 -> c1
	;;
#0:	if !c1 br @	.BB21_43
	;;
.BB21_31:
#0:	       or	r8, 0 -> r0
#1:	       callg	__malloc_r
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz eq @	r0, .BB21_15
#1:	       ldi	0 -> r11
	;;
.BB21_32:
#0:	       ldm.f	r10, -4
#1:	       or	r0, 0 -> r11
#2:	       ldi	-2 -> r0
	;;
#0:	       sub	r11, 8 -> r3
	;;
#0:	       sub	r31, 8 -> r1
	;;
#0:	       and	r1, r0 -> r0
	;;
#0:	       add	r10, r0 -> r1
	;;
#0:	       cmp ne	r3, r1 -> c1
	;;
#0:	if !c1 br @	.BB21_38
	;;
.BB21_33:
#0:	       ldi	36 -> r0
	;;
#0:	       cmpu gt	r13, r0 -> c1
	;;
#0:	if  c1 br @	.BB21_39
	;;
.BB21_34:
#0:	       cmpu lt	r13, 20 -> c1
	;;
#0:	if  c1 br @	.BB21_48
	;;
.BB21_35:
#0:	       ldm.f	r10, 0
#1:	       cmpu lt	r13, 28 -> c1
#2:	       add	r11, 8 -> r1
	;;
#0:	if  c1 br	.BB21_54
#1:	       stm.a	r31, r11, 0
	;;
#0:	       ldm.f	r10, 4
	;;
#0:	       stm.a	r31, r11, 1
	;;
.BB21_36:
#0:	       ldm.f	r10, 8
#1:	       ldi	36 -> r0
	;;
#0:	       cmpu lt	r13, r0 -> c1
	;;
#0:	if  c1 br	.BB21_71
#1:	       stm.a	r31, r1, 0
#2:	       add	r11, 16 -> r1
	;;
#0:	       ldm.f	r10, 12
	;;
#0:	       stm.a	r31, r11, 3
	;;
.BB21_37:
#0:	       ldm.f	r10, 16
#1:	       add	r10, 24 -> r0
	;;
#0:	       br	.BB21_72
#1:	       stm.a	r31, r1, 0
#2:	       add	r11, 24 -> r1
	;;
#0:	       ldm.f	r10, 20
	;;
#0:	       stm.a	r31, r11, 5
	;;
.BB21_38:
#0:	       ldm.f	r11, -4
#1:	       br	.BB21_10
#2:	       ldi	-4 -> r0
	;;
#0:	       and	r31, r0 -> r0
	;;
#0:	       add	r0, r14 -> r3
	;;
.BB21_39:
#0:	       cmpu le	r11, r10 -> c1
	;;
#0:	if  c1 br @	.BB21_56
	;;
.BB21_40:
#3:	       cmpu le	r3.24, r11 -> c1
	;;
#0:	if  c1 br @	.BB21_55
	;;
.BB21_41:
#0:	       cmp eq	r13, 0 -> c3
	;;
#0:	if  c3 br @	.BB21_91
	;;
.BB21_42:                               ; =>This Inner Loop Header: Depth=1
#0:	       add	r10, r14 -> r1
#1:	       add	r11, r14 -> r3
#2:	       sub	r14, 1 -> r14
	;;
#0:	       cmp eq	r14, 4 -> c1
#1:	       ldm.f	r1, -5
#2:	       sub	r1, 1 -> r0
	;;
#0:	if  c1 br	.BB21_91
#1:	if !c1 br	.BB21_42
#2:	       bbh	mzext8 r0 -> r1
#3:	       sub	r3, 5 -> r0
	;;
#0:	       stmb.a	r1, r0, 0
	;;
	       nop	0
	;;
.BB21_43:
#0:	       add	r6, 8 -> r1
#1:	       add	r6, 12 -> r4
	;;
#0:	       ldmr.f	r1, r10, 0
#1:	       add	r10, r1 -> r5
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldmr.f	r4, r10, 0
	;;
#0:	       stm.a	r31, r0, 3
	;;
#0:	       stm.a	r0, r31, 2
#1:	       ldi	36 -> r0
	;;
#0:	       cmpu gt	r13, r0 -> c1
	;;
#0:	if  c1 br @	.BB21_58
	;;
.BB21_44:
#0:	       cmpu lt	r13, 20 -> c1
	;;
#0:	if  c1 br @	.BB21_94
	;;
.BB21_45:
#0:	       ldm.f	r10, 0
#1:	       cmpu lt	r13, 28 -> c1
#2:	       add	r6, r10 -> r1
#3:	       add	r10, r4 -> r0
	;;
#0:	if  c1 br	.BB21_78
#1:	       stm.a	r31, r5, 0
#2:	       add	r1, 16 -> r5
	;;
#0:	       ldm.f	r10, 4
	;;
#0:	       stm.a	r31, r0, 0
	;;
.BB21_46:
#0:	       ldm.f	r10, 8
#1:	       ldi	36 -> r0
	;;
#0:	       cmpu lt	r13, r0 -> c1
	;;
#0:	if !c1 br	.BB21_93
#1:	       stm.a	r31, r5, 0
#2:	       add	r1, 24 -> r5
	;;
#0:	       ldm.f	r10, 12
	;;
#0:	       stm.a	r31, r1, 5
	;;
.BB21_47:
#0:	       add	r10, 16 -> r10
#1:	       br @	.BB21_94
	;;
.BB21_48:
#0:	       or	r10, 0 -> r0
#1:	       br @	.BB21_72
#2:	       or	r11, 0 -> r1
	;;
.BB21_49:
#0:	       add	r6, 8 -> r1
#1:	       add	r6, 12 -> r3
	;;
#0:	       ldmr.f	r1, r10, 0
#1:	       add	r10, r1 -> r11
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldmr.f	r3, r10, 0
	;;
#0:	       stm.a	r31, r0, 3
	;;
#0:	       stm.a	r0, r31, 2
#1:	       ldi	36 -> r0
	;;
#0:	       cmpu gt	r13, r0 -> c1
	;;
#0:	if  c1 br @	.BB21_73
	;;
.BB21_50:
#0:	       cmpu lt	r13, 20 -> c1
	;;
#0:	if  c1 br @	.BB21_79
	;;
.BB21_51:
#0:	       ldm.f	r10, 0
#1:	       cmpu lt	r13, 28 -> c1
#2:	       add	r6, r10 -> r2
#3:	       add	r10, r3 -> r0
	;;
#0:	       add	r2, 16 -> r1
	;;
#0:	if  c1 br	.BB21_95
#1:	       stm.a	r31, r11, 0
	;;
#0:	       ldm.f	r10, 4
	;;
#0:	       stm.a	r31, r0, 0
	;;
.BB21_52:
#0:	       ldm.f	r10, 8
#1:	       ldi	36 -> r0
	;;
#0:	       cmpu lt	r13, r0 -> c1
	;;
#0:	if  c1 br	.BB21_96
#1:	       stm.a	r31, r1, 0
#2:	       add	r2, 24 -> r1
	;;
#0:	       ldm.f	r10, 12
	;;
#0:	       stm.a	r31, r2, 5
	;;
.BB21_53:
#0:	       ldm.f	r10, 16
#1:	       add	r10, 24 -> r0
	;;
#0:	       br	.BB21_97
#1:	       stm.a	r31, r1, 0
#2:	       s2add	r2, 8 -> r1
	;;
#0:	       ldm.f	r10, 20
	;;
#0:	       stm.a	r31, r2, 7
	;;
.BB21_54:
#0:	       add	r10, 8 -> r0
#1:	       br @	.BB21_72
	;;
.BB21_55:
#0:	       cmpu lt	r13, 16 -> c1
	;;
#0:	if  c1 br @	.BB21_57
	;;
.BB21_56:                               ; %.thread90
#0:	       or	r11, r10 -> r0
	;;
#0:	       and	r0, 3 -> r0
	;;
#0:	       brz eq @	r0, .BB21_68
	;;
.BB21_57:
#0:	       or	r10, 0 -> r3
#1:	       br @	.BB21_89
#2:	       or	r11, 0 -> r2
	;;
.BB21_58:
#0:	       cmp lt	r1, 1 -> c1
	;;
#0:	if  c1 br @	.BB21_81
	;;
.BB21_59:
#0:	       cmp le	r13, r1 -> c1
	;;
#0:	if  c1 br @	.BB21_80
	;;
.BB21_60:
#0:	       cmp eq	r13, 0 -> c3
	;;
#0:	if  c3 br @	.BB21_11
	;;
.BB21_61:                               ; %.lr.ph24.i30
#0:	       sub	r10, r2 -> r2
	;;
.BB21_62:                               ; =>This Inner Loop Header: Depth=1
#0:	       add	r10, r14 -> r1
	;;
#0:	       ldm.f	r1, -5
#1:	       sub	r1, 1 -> r0
	;;
#0:	       bbh	mzext8 r0 -> r1
#1:	       add	r2, r14 -> r0
#2:	       sub	r14, 1 -> r14
	;;
#0:	       cmp eq	r14, 4 -> c1
#1:	       sub	r0, 5 -> r0
	;;
#0:	if  c1 br @	.BB21_11
#1:	if !c1 br @	.BB21_62
#2:	       stmb.a	r1, r0, 0
	;;
.BB21_63:
#0:	       cmp lt	r1, 1 -> c1
	;;
#0:	if  c1 br @	.BB21_99
	;;
.BB21_64:
#0:	       cmp le	r13, r1 -> c1
	;;
#0:	if  c1 br @	.BB21_98
	;;
.BB21_65:
#0:	       cmp eq	r13, 0 -> c3
	;;
#0:	if  c3 br @	.BB21_11
	;;
.BB21_66:                               ; %.lr.ph24.i1
#0:	       sub	r10, r2 -> r2
	;;
.BB21_67:                               ; =>This Inner Loop Header: Depth=1
#0:	       add	r10, r14 -> r1
	;;
#0:	       ldm.f	r1, -5
#1:	       sub	r1, 1 -> r0
	;;
#0:	       bbh	mzext8 r0 -> r1
#1:	       add	r2, r14 -> r0
#2:	       sub	r14, 1 -> r14
	;;
#0:	       cmp eq	r14, 4 -> c1
#1:	       sub	r0, 5 -> r0
	;;
#0:	if  c1 br @	.BB21_11
#1:	if !c1 br @	.BB21_67
#2:	       stmb.a	r1, r0, 0
	;;
.BB21_68:
#0:	       cmpu gt	r13, 15 -> c1
	;;
#0:	if !c1 br @	.BB21_86
	;;
.BB21_69:
#0:	       or	r10, 0 -> r1
#1:	       or	r11, 0 -> r0
	;;
.BB21_70:                               ; %.lr.ph10.i70
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r1, 0
#1:	       sub	r13, 16 -> r13
#2:	       add	r0, 16 -> r2
#3:	       add	r1, 16 -> r3
	;;
#0:	       cmpu gt	r13, 15 -> c1
	;;
#0:	       stm.a	r31, r0, 0
	;;
#0:	       ldm.f	r1, 4
	;;
#0:	       stm.a	r31, r0, 1
	;;
#0:	       ldm.f	r1, 8
	;;
#0:	if !c1 br	.BB21_88
#1:	if  c1 br	.BB21_70
#2:	       stm.a	r31, r0, 2
	;;
#0:	       ldm.f	r1, 12
#1:	       or	r3, 0 -> r1
	;;
#0:	       stm.a	r31, r0, 3
#1:	       or	r2, 0 -> r0
	;;
.BB21_71:
#0:	       add	r10, 16 -> r0
	;;
.BB21_72:
#0:	       ldm.f	r0, 0
	;;
#0:	       stm.a	r31, r1, 0
	;;
#0:	       ldm.f	r0, 4
	;;
#0:	       br	.BB21_91
#1:	       stm.a	r31, r1, 1
	;;
#0:	       ldm.f	r0, 8
	;;
#0:	       stm.a	r31, r1, 2
	;;
.BB21_73:
#0:	       cmp lt	r1, 1 -> c1
	;;
#0:	if  c1 br @	.BB21_105
	;;
.BB21_74:
#0:	       cmp le	r13, r1 -> c1
	;;
#0:	if  c1 br @	.BB21_104
	;;
.BB21_75:
#0:	       cmp eq	r13, 0 -> c3
	;;
#0:	if  c3 br @	.BB21_124
	;;
.BB21_76:                               ; %.lr.ph24.i
#0:	       sub	r10, r2 -> r3
#1:	       or	r14, 0 -> r2
	;;
.BB21_77:                               ; =>This Inner Loop Header: Depth=1
#0:	       add	r10, r2 -> r1
	;;
#0:	       ldm.f	r1, -5
#1:	       sub	r1, 1 -> r0
	;;
#0:	       bbh	mzext8 r0 -> r1
#1:	       add	r3, r2 -> r0
#2:	       sub	r2, 1 -> r2
	;;
#0:	       cmp eq	r2, 4 -> c1
#1:	       sub	r0, 5 -> r0
	;;
#0:	if  c1 br @	.BB21_124
#1:	if !c1 br @	.BB21_77
#2:	       stmb.a	r1, r0, 0
	;;
.BB21_78:
#0:	       add	r10, 8 -> r10
#1:	       br @	.BB21_94
	;;
.BB21_79:
#0:	       or	r10, 0 -> r0
#1:	       br @	.BB21_97
#2:	       or	r11, 0 -> r1
	;;
.BB21_80:
#0:	       cmpu lt	r13, 16 -> c1
	;;
#0:	if  c1 br @	.BB21_109
	;;
.BB21_81:                               ; %.thread89
#0:	       or	r5, r10 -> r0
	;;
#0:	       and	r0, 3 -> r0
	;;
#0:	       cmp ne	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB21_109
	;;
.BB21_82:
#0:	       cmpu lt	r13, 16 -> c1
	;;
#0:	if  c1 br @	.BB21_108
	;;
.BB21_83:                               ; %.lr.ph10.i41.preheader
#0:	       ldi	0 -> r0
#1:	       add	r10, 12 -> r4
	;;
#0:	       sub	r0, r2 -> r6
	;;
.BB21_84:                               ; %.lr.ph10.i41
                                        ; =>This Inner Loop Header: Depth=1
#0:	       add	r4, r6 -> r5
#1:	       ldm.f	r4, -12
#2:	       sub	r13, 16 -> r13
#3:	       add	r4, 16 -> r1
	;;
#0:	       sub	r5, 12 -> r0
#1:	       cmpu gt	r13, 15 -> c1
	;;
#0:	       stm.a	r31, r0, 0
#1:	       sub	r5, 8 -> r0
	;;
#0:	       ldm.f	r4, -8
	;;
#0:	       stm.a	r31, r0, 0
#1:	       sub	r5, 4 -> r0
	;;
#0:	       ldm.f	r4, -4
	;;
#0:	if  c1 br	.BB21_84
#1:	       stm.a	r31, r0, 0
	;;
#0:	       ldm.f	r4, 0
#1:	       or	r1, 0 -> r4
	;;
#0:	       stm.a	r31, r5, 0
	;;
.BB21_85:                               ; %.preheader.i37.loopexit
#0:	       sub	r1, r2 -> r0
#1:	       br	.BB21_108
#2:	       sub	r1, 12 -> r10
	;;
#0:	       sub	r0, 12 -> r5
	;;
	       nop	0
	;;
.BB21_86:
#0:	       or	r10, 0 -> r3
#1:	       br @	.BB21_88
#2:	       or	r11, 0 -> r2
	;;
.BB21_87:                               ; %.lr.ph.i74
                                        ;   in Loop: Header=BB21_88 Depth=1
#0:	       ldm.f	r3, 0
#1:	       add	r3, 4 -> r3
#2:	       sub	r13, 4 -> r13
	;;
#0:	       stm.a	r31, r2, 0
#1:	       add	r2, 4 -> r2
	;;
.BB21_88:                               ; %.preheader.i66
                                        ; =>This Inner Loop Header: Depth=1
#0:	       cmpu gt	r13, 3 -> c1
	;;
#0:	if  c1 br @	.BB21_87
	;;
.BB21_89:                               ; %.preheader14.i82
#0:	       brz eq @	r13, .BB21_91
	;;
.BB21_90:                               ; %.lr.ph18.i86
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r3, 0
#1:	       sub	r13, 1 -> r13
	;;
#0:	       brz ne	r13, .BB21_90
#1:	       bbh	mzext8 r3 -> r0
#2:	       add	r3, 1 -> r3
	;;
#0:	       stmb.a	r0, r2, 0
#1:	       add	r2, 1 -> r2
	;;
	       nop	0
	;;
.BB21_91:                               ; %memmove.exit87
#0:	       or	r10, 0 -> r0
#1:	       callg	__free_r
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       br @	.BB21_15
	;;
.BB21_92:
#0:	       add	r10, 8 -> r10
#1:	       br @	.BB21_94
	;;
.BB21_93:
#0:	       ldm.f	r10, 16
	;;
#0:	       stm.a	r31, r5, 0
#1:	       s2add	r1, 8 -> r5
	;;
#0:	       ldm.f	r10, 20
#1:	       add	r10, 24 -> r10
	;;
#0:	       stm.a	r31, r1, 7
	;;
.BB21_94:
#0:	       ldm.f	r10, 0
	;;
#0:	       stm.a	r31, r5, 0
	;;
#0:	       ldm.f	r10, 4
	;;
#0:	       br	.BB21_11
#1:	       stm.a	r31, r5, 1
	;;
#0:	       ldm.f	r10, 8
	;;
#0:	       stm.a	r31, r5, 2
	;;
.BB21_95:
#0:	       add	r10, 8 -> r0
#1:	       br @	.BB21_97
	;;
.BB21_96:
#0:	       add	r10, 16 -> r0
	;;
.BB21_97:
#0:	       ldm.f	r0, 0
	;;
#0:	       stm.a	r31, r1, 0
	;;
#0:	       ldm.f	r0, 4
	;;
#0:	       br	.BB21_124
#1:	       stm.a	r31, r1, 1
	;;
#0:	       ldm.f	r0, 8
	;;
#0:	       stm.a	r31, r1, 2
	;;
.BB21_98:
#0:	       cmpu lt	r13, 16 -> c1
	;;
#0:	if  c1 br @	.BB21_113
	;;
.BB21_99:                               ; %.thread88
#0:	       or	r5, r10 -> r0
	;;
#0:	       and	r0, 3 -> r0
	;;
#0:	       brz ne @	r0, .BB21_113
	;;
.BB21_100:
#0:	       cmpu lt	r13, 16 -> c1
	;;
#0:	if  c1 br @	.BB21_112
	;;
.BB21_101:                              ; %.lr.ph10.i12.preheader
#0:	       ldi	0 -> r0
#1:	       add	r10, 12 -> r4
	;;
#0:	       sub	r0, r2 -> r6
	;;
.BB21_102:                              ; %.lr.ph10.i12
                                        ; =>This Inner Loop Header: Depth=1
#0:	       add	r4, r6 -> r5
#1:	       ldm.f	r4, -12
#2:	       sub	r13, 16 -> r13
#3:	       add	r4, 16 -> r1
	;;
#0:	       sub	r5, 12 -> r0
#1:	       cmpu gt	r13, 15 -> c1
	;;
#0:	       stm.a	r31, r0, 0
#1:	       sub	r5, 8 -> r0
	;;
#0:	       ldm.f	r4, -8
	;;
#0:	       stm.a	r31, r0, 0
#1:	       sub	r5, 4 -> r0
	;;
#0:	       ldm.f	r4, -4
	;;
#0:	if  c1 br	.BB21_102
#1:	       stm.a	r31, r0, 0
	;;
#0:	       ldm.f	r4, 0
#1:	       or	r1, 0 -> r4
	;;
#0:	       stm.a	r31, r5, 0
	;;
.BB21_103:                              ; %.preheader.i8.loopexit
#0:	       sub	r1, r2 -> r0
#1:	       br	.BB21_112
#2:	       sub	r1, 12 -> r10
	;;
#0:	       sub	r0, 12 -> r5
	;;
	       nop	0
	;;
.BB21_104:
#0:	       cmpu lt	r13, 16 -> c1
	;;
#0:	if  c1 br @	.BB21_106
	;;
.BB21_105:                              ; %.thread
#0:	       or	r11, r10 -> r0
	;;
#0:	       and	r0, 3 -> r0
	;;
#0:	       brz eq @	r0, .BB21_115
	;;
.BB21_106:
#0:	       or	r10, 0 -> r1
#1:	       br @	.BB21_122
#2:	       or	r11, 0 -> r0
	;;
.BB21_107:                              ; %.lr.ph.i45
                                        ;   in Loop: Header=BB21_108 Depth=1
#0:	       ldm.f	r10, 0
#1:	       add	r10, 4 -> r10
#2:	       sub	r13, 4 -> r13
	;;
#0:	       stm.a	r31, r5, 0
#1:	       add	r5, 4 -> r5
	;;
.BB21_108:                              ; %.lr.ph.i45
                                        ; =>This Inner Loop Header: Depth=1
#0:	       cmpu gt	r13, 3 -> c1
	;;
#0:	if  c1 br @	.BB21_107
	;;
.BB21_109:                              ; %.preheader14.i53
#0:	       cmp eq	r13, 0 -> c3
	;;
#0:	if  c3 br @	.BB21_11
	;;
.BB21_110:                              ; %.lr.ph18.i57
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r10, 0
#1:	       sub	r13, 1 -> r13
	;;
#0:	       brz ne	r13, .BB21_110
#1:	       bbh	mzext8 r10 -> r0
#2:	       add	r10, 1 -> r10
	;;
#0:	       stmb.a	r0, r5, 0
#1:	       add	r5, 1 -> r5
	;;
	       nop	0
	;;
#0:	       br @	.BB21_11
	;;
.BB21_111:                              ; %.lr.ph.i16
                                        ;   in Loop: Header=BB21_112 Depth=1
#0:	       ldm.f	r10, 0
#1:	       add	r10, 4 -> r10
#2:	       sub	r13, 4 -> r13
	;;
#0:	       stm.a	r31, r5, 0
#1:	       add	r5, 4 -> r5
	;;
.BB21_112:                              ; %.lr.ph.i16
                                        ; =>This Inner Loop Header: Depth=1
#0:	       cmpu gt	r13, 3 -> c1
	;;
#0:	if  c1 br @	.BB21_111
	;;
.BB21_113:                              ; %.preheader14.i24
#0:	       cmp eq	r13, 0 -> c3
	;;
#0:	if  c3 br @	.BB21_11
	;;
.BB21_114:                              ; %.lr.ph18.i28
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r10, 0
#1:	       sub	r13, 1 -> r13
	;;
#0:	       brz ne	r13, .BB21_114
#1:	       bbh	mzext8 r10 -> r0
#2:	       add	r10, 1 -> r10
	;;
#0:	       stmb.a	r0, r5, 0
#1:	       add	r5, 1 -> r5
	;;
	       nop	0
	;;
#0:	       br @	.BB21_11
	;;
.BB21_115:
#0:	       cmpu lt	r13, 16 -> c1
	;;
#0:	if  c1 br @	.BB21_119
	;;
.BB21_116:                              ; %.lr.ph10.i.preheader
#0:	       ldi	0 -> r0
#1:	       add	r10, 12 -> r1
	;;
#0:	       sub	r0, r2 -> r3
	;;
.BB21_117:                              ; %.lr.ph10.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       add	r1, r3 -> r9
#1:	       ldm.f	r1, -12
#2:	       sub	r13, 16 -> r13
#3:	       add	r1, 16 -> r8
	;;
#0:	       sub	r9, 12 -> r0
#1:	       cmpu gt	r13, 15 -> c1
	;;
#0:	       stm.a	r31, r0, 0
#1:	       sub	r9, 8 -> r0
	;;
#0:	       ldm.f	r1, -8
	;;
#0:	       stm.a	r31, r0, 0
#1:	       sub	r9, 4 -> r0
	;;
#0:	       ldm.f	r1, -4
	;;
#0:	if  c1 br	.BB21_117
#1:	       stm.a	r31, r0, 0
	;;
#0:	       ldm.f	r1, 0
#1:	       or	r8, 0 -> r1
	;;
#0:	       stm.a	r31, r9, 0
	;;
.BB21_118:                              ; %.preheader.i.loopexit
#0:	       sub	r8, r2 -> r0
#1:	       br	.BB21_121
#2:	       sub	r8, 12 -> r1
	;;
#0:	       sub	r0, 12 -> r0
	;;
	       nop	0
	;;
.BB21_119:
#0:	       or	r10, 0 -> r1
#1:	       br @	.BB21_121
#2:	       or	r11, 0 -> r0
	;;
.BB21_120:                              ; %.lr.ph.i
                                        ;   in Loop: Header=BB21_121 Depth=1
#0:	       ldm.f	r1, 0
#1:	       add	r1, 4 -> r1
#2:	       sub	r13, 4 -> r13
	;;
#0:	       stm.a	r31, r0, 0
#1:	       add	r0, 4 -> r0
	;;
.BB21_121:                              ; %.preheader.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       cmpu gt	r13, 3 -> c1
	;;
#0:	if  c1 br @	.BB21_120
	;;
.BB21_122:                              ; %.preheader14.i
#0:	       brz eq @	r13, .BB21_124
	;;
.BB21_123:                              ; %.lr.ph18.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r1, 0
#1:	       sub	r13, 1 -> r13
	;;
#0:	       brz ne	r13, .BB21_123
#1:	       bbh	mzext8 r1 -> r2
#2:	       add	r1, 1 -> r1
	;;
#0:	       stmb.a	r2, r0, 0
#1:	       add	r0, 1 -> r0
	;;
	       nop	0
	;;
.BB21_124:                              ; %memmove.exit
#0:	       add	r6, r12 -> r0
#1:	       sub	r14, r12 -> r2
#2:	       ldga	___malloc_av_ -> r3
	;;
#0:	       add	r10, r0 -> r1
#1:	       add	r2, r4 -> r0
	;;
#0:	       add	r0, r7 -> r0
#1:	       stm.a	r1, r3, 2
	;;
#0:	       or	r0, 1 -> r0
	;;
#0:	       stm.a	r0, r1, 1
#1:	       add	r10, r5 -> r1
	;;
#0:	       ldmr.f	r5, r10, 0
	;;
#0:	       br	.BB21_15
#1:	       and	r31, 1 -> r3
	;;
#0:	       or	r3, r12 -> r0
	;;
#0:	       stm.a	r0, r1, 0
	;;
	.align	4
__realloc_r_end:
.tmp21:
	.size	__realloc_r, .tmp21-__realloc_r

	.type	___multadd,@function
___multadd:                             ; @__multadd
	.funsz	___multadd_end-___multadd
___multadd_start:
; BB#0:
#0:	       wb.s	r15, 12
#1:	       addi	-48 -> r15
#2:	       ldx	$rb, 0 -> r2
#3:	       ldx	$ro, 0 -> r3
	;;
#0:	       stm.s	r10, r15, 7
#1:	       or	r1, 0 -> r6
#2:	       ldi	0 -> r4
#3:	       ldi	0 -> r10
	;;
#0:	       stm.s	r11, r15, 6
	;;
#0:	       stm.s	r12, r15, 5
#1:	       or	r0, 0 -> r12
	;;
#0:	       stm.s	r13, r15, 4
	;;
#0:	       stm.s	r14, r15, 3
	;;
#0:	       stm.s	r2, r15, 2
	;;
#0:	       stm.s	r3, r15, 1
	;;
#0:	       ldm.f	r12, 16
	;;
#0:	       or	r31, 0 -> r11
	;;
.BB22_1:                                ; =>This Inner Loop Header: Depth=1
#0:	       s2add	r12, r4 -> r5
#1:	       add	r4, 1 -> r4
	;;
#0:	       ldm.f	r5, 20
#1:	       cmp lt	r4, r11 -> c1
	;;
#0:	       sr	r31, 16 -> r0
	;;
#0:	       mul	r0, r6 -> $mul0.0
#1:	       bbh	zext16 r31 -> r0
	;;
#1:	       mul	r0, r6 -> $mul1.0
	;;
#1:	       ldx	$mul1.0, r10 -> r2
	;;
#0:	       sr	r2, 16 -> r0
	;;
#0:	       ldx	$mul0.0, r0 -> r3
#1:	       bbh	zext16 r2 -> r0
	;;
#0:	if  c1 br	.BB22_1
#1:	       sl	r3, 16 -> r1
#2:	       sr	r3, 16 -> r10
	;;
#0:	       or	r1, r0 -> r0
	;;
#0:	       stm.a	r0, r5, 5
	;;
.BB22_2:
#0:	       brz eq @	r10, .BB22_11
	;;
.BB22_3:
#0:	       ldm.f	r12, 8
	;;
#0:	       cmp lt	r11, r31 -> c1
	;;
#0:	if  c1 br @	.BB22_12
	;;
.BB22_4:
#0:	       ldm.f	r12, 4
	;;
#0:	       or	r31, 0 -> r13
#1:	       ldmg.d	_impure_data+76
	;;
#0:	       brz ne @	r31, .BB22_29
#1:	       or	r31, 0 -> r3
	;;
.BB22_5:
#0:	       ldi	132 -> r0
#1:	       callg	__malloc_r
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r3
	;;
#0:	       brz eq @	r3, .BB22_13
	;;
.BB22_6:
#0:	       ldm.f	r3, -4
#1:	       ldi	-4 -> r0
	;;
#0:	       sub	r31, 4 -> r1
	;;
#0:	       and	r1, r0 -> r2
#1:	       ldi	36 -> r1
	;;
#0:	       cmpu gt	r2, r1 -> c1
	;;
#0:	if  c1 br @	.BB22_14
	;;
.BB22_7:
#0:	       cmpu lt	r2, 20 -> c1
#1:	       or	r3, 0 -> r0
	;;
#0:	if  c1 br @	.BB22_23
	;;
.BB22_8:
#0:	       cmpu lt	r2, 28 -> c1
#1:	       stm.a	0, r3, 0
	;;
#0:	if  c1 br @	.BB22_21
#1:	       stm.a	0, r3, 1
	;;
.BB22_9:
#0:	       ldi	36 -> r0
#1:	       stm.a	0, r3, 2
	;;
#0:	       cmpu lt	r2, r0 -> c1
#1:	       stm.a	0, r3, 3
	;;
#0:	if  c1 br @	.BB22_22
	;;
.BB22_10:
#0:	       add	r3, 24 -> r0
#1:	       br	.BB22_23
#2:	       stm.a	0, r3, 4
	;;
#0:	       stm.a	0, r3, 5
	;;
	       nop	0
	;;
.BB22_11:
#0:	       or	r12, 0 -> r2
#1:	       br @	.BB22_67
	;;
.BB22_12:
#0:	       or	r12, 0 -> r2
#1:	       br @	.BB22_66
	;;
.BB22_13:                               ; %_calloc_r.exit.thread
#0:	       ldi	0 -> r2
#1:	       br	.BB22_53
#2:	       ldga	_impure_data -> r0
	;;
#0:	       stm.a	0, r0, 19
	;;
	       nop	0
	;;
.BB22_14:
#0:	       or	r3, 0 -> r0
#1:	       br @	.BB22_16
	;;
.BB22_15:                               ;   in Loop: Header=BB22_16 Depth=1
#0:	       stmb.a	0, r0, 0
#1:	       add	r0, 1 -> r0
#2:	       sub	r2, 1 -> r2
	;;
.BB22_16:                               ; %.preheader
                                        ; =>This Inner Loop Header: Depth=1
#0:	       and	r0, 3 -> r1
	;;
#0:	       brz eq @	r1, .BB22_18
	;;
.BB22_17:                               ;   in Loop: Header=BB22_16 Depth=1
#0:	       brz ne @	r2, .BB22_15
	;;
#0:	       brz eq @	r2, .BB22_28
	;;
.BB22_18:
#0:	       cmpu lt	r2, 4 -> c1
	;;
#0:	if  c1 br @	.BB22_26
	;;
.BB22_19:
#0:	       cmpu gt	r2, 15 -> c1
	;;
#0:	if !c1 br @	.BB22_24
	;;
.BB22_20:                               ; %.lr.ph8.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sub	r2, 16 -> r2
#1:	       stm.a	0, r0, 3
	;;
#0:	       cmpu gt	r2, 15 -> c1
#1:	       stm.a	0, r0, 2
	;;
#0:	if !c1 br	.BB22_25
#1:	if  c1 br	.BB22_20
#2:	       stm.a	0, r0, 1
	;;
#0:	       stm.a	0, r0, 0
#1:	       add	r0, 16 -> r0
	;;
	       nop	0
	;;
.BB22_21:
#0:	       add	r3, 8 -> r0
#1:	       br @	.BB22_23
	;;
.BB22_22:
#0:	       add	r3, 16 -> r0
	;;
.BB22_23:
#0:	       stm.a	0, r0, 0
#1:	       br	.BB22_28
	;;
#0:	       stm.a	0, r0, 1
	;;
#0:	       stm.a	0, r0, 2
	;;
.BB22_24:                               ; %.lr.ph.i
#0:	       stm.a	0, r0, 0
#1:	       add	r0, 4 -> r0
#2:	       sub	r2, 4 -> r2
	;;
.BB22_25:                               ; %.lr.ph.i
#0:	       cmpu gt	r2, 3 -> c1
	;;
#0:	if  c1 br @	.BB22_24
	;;
.BB22_26:                               ; %.preheader11.i
#0:	       brz eq @	r2, .BB22_28
	;;
.BB22_27:                               ; %.lr.ph14.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       stmb.a	0, r0, 0
#1:	       add	r0, 1 -> r0
#2:	       sub	r2, 1 -> r2
	;;
#0:	       brz ne @	r2, .BB22_27
	;;
.BB22_28:                               ; %_calloc_r.exit
#0:	       ldga	_impure_data -> r0
	;;
#0:	       stm.a	r3, r0, 19
	;;
.BB22_29:
#0:	       add	r13, 1 -> r13
	;;
#0:	       ldmr.f	r13, r3, 2
	;;
#0:	       or	r31, 0 -> r4
	;;
#0:	       brz eq @	r4, .BB22_31
	;;
.BB22_30:
#0:	       ldm.f	r4, 0
#1:	       br	.BB22_52
#2:	       s2add	r3, r13 -> r0
	;;
#0:	       stm.a	r31, r0, 0
	;;
	       nop	0
	;;
.BB22_31:
#0:	       ldi	1 -> r0
#1:	       callg	__malloc_r
#2:	       ldi	20 -> r3
	;;
#0:	       sl	r0, r13 -> r14
	;;
#0:	       s2add	r3, r14 -> r0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r4
#1:	       ldi	0 -> r2
	;;
#0:	       brz eq @	r4, .BB22_53
	;;
.BB22_32:
#0:	       ldm.f	r4, -4
#1:	       ldi	-4 -> r0
#2:	       ldi	36 -> r3
	;;
#0:	       sub	r31, 4 -> r1
	;;
#0:	       and	r1, r0 -> r2
	;;
#0:	       cmpu gt	r2, r3 -> c1
	;;
#0:	if  c1 br @	.BB22_37
	;;
.BB22_33:
#0:	       cmpu lt	r2, 20 -> c1
#1:	       or	r4, 0 -> r0
	;;
#0:	if  c1 br @	.BB22_46
	;;
.BB22_34:
#0:	       cmpu lt	r2, 28 -> c1
#1:	       stm.a	0, r4, 0
	;;
#0:	if  c1 br @	.BB22_44
#1:	       stm.a	0, r4, 1
	;;
.BB22_35:
#0:	       ldi	36 -> r0
#1:	       stm.a	0, r4, 2
	;;
#0:	       cmpu lt	r2, r0 -> c1
#1:	       stm.a	0, r4, 3
	;;
#0:	if  c1 br @	.BB22_45
	;;
.BB22_36:
#0:	       add	r4, 24 -> r0
#1:	       br	.BB22_46
#2:	       stm.a	0, r4, 4
	;;
#0:	       stm.a	0, r4, 5
	;;
	       nop	0
	;;
.BB22_37:
#0:	       or	r4, 0 -> r0
#1:	       br @	.BB22_39
	;;
.BB22_38:                               ;   in Loop: Header=BB22_39 Depth=1
#0:	       stmb.a	0, r0, 0
#1:	       add	r0, 1 -> r0
#2:	       sub	r2, 1 -> r2
	;;
.BB22_39:                               ; %.preheader28
                                        ; =>This Inner Loop Header: Depth=1
#0:	       and	r0, 3 -> r1
	;;
#0:	       brz eq @	r1, .BB22_41
	;;
.BB22_40:                               ;   in Loop: Header=BB22_39 Depth=1
#0:	       brz ne @	r2, .BB22_38
	;;
#0:	       brz eq @	r2, .BB22_51
	;;
.BB22_41:
#0:	       cmpu lt	r2, 4 -> c1
	;;
#0:	if  c1 br @	.BB22_49
	;;
.BB22_42:
#0:	       cmpu gt	r2, 15 -> c1
	;;
#0:	if !c1 br @	.BB22_47
	;;
.BB22_43:                               ; %.lr.ph8.i10
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sub	r2, 16 -> r2
#1:	       stm.a	0, r0, 3
	;;
#0:	       cmpu gt	r2, 15 -> c1
#1:	       stm.a	0, r0, 2
	;;
#0:	if !c1 br	.BB22_48
#1:	if  c1 br	.BB22_43
#2:	       stm.a	0, r0, 1
	;;
#0:	       stm.a	0, r0, 0
#1:	       add	r0, 16 -> r0
	;;
	       nop	0
	;;
.BB22_44:
#0:	       add	r4, 8 -> r0
#1:	       br @	.BB22_46
	;;
.BB22_45:
#0:	       add	r4, 16 -> r0
	;;
.BB22_46:
#0:	       stm.a	0, r0, 0
#1:	       br	.BB22_51
	;;
#0:	       stm.a	0, r0, 1
	;;
#0:	       stm.a	0, r0, 2
	;;
.BB22_47:                               ; %.lr.ph.i13
#0:	       stm.a	0, r0, 0
#1:	       add	r0, 4 -> r0
#2:	       sub	r2, 4 -> r2
	;;
.BB22_48:                               ; %.lr.ph.i13
#0:	       cmpu gt	r2, 3 -> c1
	;;
#0:	if  c1 br @	.BB22_47
	;;
.BB22_49:                               ; %.preheader11.i19
#0:	       brz eq @	r2, .BB22_51
	;;
.BB22_50:                               ; %.lr.ph14.i22
                                        ; =>This Inner Loop Header: Depth=1
#0:	       stmb.a	0, r0, 0
#1:	       add	r0, 1 -> r0
#2:	       sub	r2, 1 -> r2
	;;
#0:	       brz ne @	r2, .BB22_50
	;;
.BB22_51:                               ; %_calloc_r.exit4
#0:	       stm.a	r13, r4, 1
	;;
#0:	       stm.a	r14, r4, 2
	;;
.BB22_52:
#0:	       stm.a	0, r4, 4
#1:	       or	r4, 0 -> r2
	;;
#0:	       stm.a	0, r4, 3
	;;
.BB22_53:                               ; %_Balloc.exit
#0:	       ldm.f	r12, 16
#1:	       ldi	8 -> r0
#2:	       add	r12, 12 -> r5
#3:	       add	r2, 12 -> r4
	;;
#0:	       s2add	r0, r31 -> r3
	;;
#0:	       cmpu lt	r3, 16 -> c1
	;;
#0:	if  c1 br @	.BB22_62
	;;
.BB22_54:
#0:	       or	r4, r5 -> r0
	;;
#0:	       and	r0, 3 -> r0
	;;
#0:	       brz ne @	r0, .BB22_62
	;;
.BB22_55:
#0:	       cmpu gt	r3, 15 -> c1
	;;
#0:	if  c1 br @	.BB22_57
	;;
.BB22_56:
#0:	       or	r5, 0 -> r1
#1:	       br @	.BB22_58
#2:	       or	r4, 0 -> r0
	;;
.BB22_57:                               ; %.lr.ph10.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r5, 0
#1:	       sub	r3, 16 -> r3
#2:	       add	r4, 16 -> r0
#3:	       add	r5, 16 -> r1
	;;
#0:	       cmpu gt	r3, 15 -> c1
	;;
#0:	       stm.a	r31, r4, 0
	;;
#0:	       ldm.f	r5, 4
	;;
#0:	       stm.a	r31, r4, 1
	;;
#0:	       ldm.f	r5, 8
	;;
#0:	if  c1 br	.BB22_57
#1:	       stm.a	r31, r4, 2
	;;
#0:	       ldm.f	r5, 12
#1:	       or	r1, 0 -> r5
	;;
#0:	       stm.a	r31, r4, 3
#1:	       or	r0, 0 -> r4
	;;
.BB22_58:                               ; %.preheader.i24
#0:	       cmpu gt	r3, 3 -> c1
	;;
#0:	if !c1 br @	.BB22_61
	;;
.BB22_59:
#0:	       or	r1, 0 -> r5
#1:	       or	r0, 0 -> r4
	;;
.BB22_60:                               ; %.lr.ph.i25
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sub	r3, 4 -> r3
#1:	       ldm.f	r5, 0
#2:	       add	r5, 4 -> r5
	;;
#0:	       cmpu gt	r3, 3 -> c1
	;;
#0:	if !c1 br @	.BB22_62
#1:	if  c1 br @	.BB22_60
#2:	       stm.a	r31, r4, 0
#3:	       add	r4, 4 -> r4
	;;
.BB22_61:
#0:	       or	r1, 0 -> r5
#1:	       or	r0, 0 -> r4
	;;
.BB22_62:                               ; %.preheader14.i
#0:	       brz eq @	r3, .BB22_64
	;;
.BB22_63:                               ; %.lr.ph18.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r5, 0
#1:	       sub	r3, 1 -> r3
	;;
#0:	       brz ne	r3, .BB22_63
#1:	       bbh	mzext8 r5 -> r0
#2:	       add	r5, 1 -> r5
	;;
#0:	       stmb.a	r0, r4, 0
#1:	       add	r4, 1 -> r4
	;;
	       nop	0
	;;
.BB22_64:                               ; %memcpy.exit
#0:	       brz eq @	r12, .BB22_66
	;;
.BB22_65:
#0:	       ldm.f	r12, 4
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldmg.d	_impure_data+76
	;;
#0:	       ldmr.f	r0, r31, 2
	;;
#0:	       stm.a	r31, r12, 0
	;;
#0:	       ldmg.d	_impure_data+76
	;;
#0:	       s2add	r31, r0 -> r0
	;;
#0:	       stm.a	r12, r0, 0
	;;
.BB22_66:                               ; %_Bfree.exit
#0:	       s2add	r2, r11 -> r0
#1:	       add	r11, 1 -> r3
	;;
#0:	       stm.a	r10, r0, 5
	;;
#0:	       stm.a	r3, r2, 4
	;;
.BB22_67:
#0:	       ldm.s	r15, 4
#1:	       or	r2, 0 -> r0
	;;
#0:	       stx	r31 -> $ro
#1:	       ldm.s	r15, 8
	;;
#0:	       stx	r31 -> $rb
#1:	       ldm.s	r15, 12
	;;
#0:	       or	r31, 0 -> r14
#1:	       ldm.s	r15, 16
	;;
#0:	       or	r31, 0 -> r13
#1:	       ldm.s	r15, 20
	;;
#0:	       or	r31, 0 -> r12
#1:	       ldm.s	r15, 24
	;;
#0:	       or	r31, 0 -> r11
#1:	       ldm.s	r15, 28
#2:	       addi	48 -> r15
	;;
#0:	       jop	ret
#1:	       or	r31, 0 -> r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
___multadd_end:
.tmp22:
	.size	___multadd, .tmp22-___multadd

	.type	___multiply,@function
___multiply:                            ; @__multiply
	.funsz	___multiply_end-___multiply
___multiply_start:
; BB#0:
#0:	       wb.s	r15, 14
#1:	       addi	-56 -> r15
#2:	       ldx	$rb, 0 -> r3
#3:	       ldx	$ro, 0 -> r2
	;;
#0:	       stm.s	r10, r15, 9
	;;
#0:	       stm.s	r11, r15, 8
	;;
#0:	       stm.s	r12, r15, 7
	;;
#0:	       stm.s	r13, r15, 6
#1:	       or	r1, 0 -> r13
	;;
#0:	       stm.s	r14, r15, 5
#1:	       or	r0, 0 -> r14
	;;
#0:	       stm.s	r0.23, r15, 4
	;;
#2:	       stm.s	r2.23, r15, 3
	;;
#2:	       stm.s	r2.24, r15, 2
	;;
#0:	       stm.s	r3, r15, 1
	;;
#0:	       stm.s	r2, r15, 0
	;;
#0:	       ldm.f	r13, 16
	;;
#0:	       or	r31, 0 -> r3
#1:	       ldm.f	r0, 16
	;;
#0:	       cmp lt	r31, r3 -> c1
	;;
#0:	if  c1 or	r13, 0 -> r14
#1:	if  c1 or	r0, 0 -> r13
	;;
#0:	       ldm.f	r14, 16
	;;
#0:	       or	r31, 0 -> r11
#1:	       ldm.f	r13, 16
	;;
#0:	       or	r31, 0 -> r10
#1:	       ldm.f	r14, 8
	;;
#0:	       add	r10, r11 -> r12
	;;
#0:	       or	r31, 0 -> r0.23
#1:	       ldm.f	r14, 4
	;;
#2:	       or	r31, 0 -> r2.23
#0:	       ldmg.d	_impure_data+76
	;;
#0:	       brz ne @	r31, .BB23_23
#1:	       or	r31, 0 -> r2
	;;
.BB23_1:
#0:	       ldi	132 -> r0
#1:	       callg	__malloc_r
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r2
	;;
#0:	       brz eq @	r2, .BB23_7
	;;
.BB23_2:
#0:	       ldm.f	r2, -4
#1:	       ldi	-4 -> r0
	;;
#0:	       sub	r31, 4 -> r1
	;;
#0:	       and	r1, r0 -> r3
#1:	       ldi	36 -> r1
	;;
#0:	       cmpu gt	r3, r1 -> c1
	;;
#0:	if  c1 br @	.BB23_8
	;;
.BB23_3:
#0:	       cmpu lt	r3, 20 -> c1
#1:	       or	r2, 0 -> r0
	;;
#0:	if  c1 br @	.BB23_17
	;;
.BB23_4:
#0:	       cmpu lt	r3, 28 -> c1
#1:	       stm.a	0, r2, 0
	;;
#0:	if  c1 br @	.BB23_15
#1:	       stm.a	0, r2, 1
	;;
.BB23_5:
#0:	       ldi	36 -> r0
#1:	       stm.a	0, r2, 2
	;;
#0:	       cmpu lt	r3, r0 -> c1
#1:	       stm.a	0, r2, 3
	;;
#0:	if  c1 br @	.BB23_16
	;;
.BB23_6:
#0:	       add	r2, 24 -> r0
#1:	       br	.BB23_17
#2:	       stm.a	0, r2, 4
	;;
#0:	       stm.a	0, r2, 5
	;;
	       nop	0
	;;
.BB23_7:                                ; %_calloc_r.exit.thread
#0:	       ldi	0 -> r1
#1:	       br	.BB23_47
#2:	       ldga	_impure_data -> r0
	;;
#0:	       stm.a	0, r0, 19
	;;
	       nop	0
	;;
.BB23_8:
#0:	       or	r2, 0 -> r0
#1:	       br @	.BB23_10
	;;
.BB23_9:                                ;   in Loop: Header=BB23_10 Depth=1
#0:	       stmb.a	0, r0, 0
#1:	       add	r0, 1 -> r0
#2:	       sub	r3, 1 -> r3
	;;
.BB23_10:                               ; %.preheader24
                                        ; =>This Inner Loop Header: Depth=1
#0:	       and	r0, 3 -> r1
	;;
#0:	       brz eq @	r1, .BB23_12
	;;
.BB23_11:                               ;   in Loop: Header=BB23_10 Depth=1
#0:	       brz ne @	r3, .BB23_9
	;;
#0:	       brz eq @	r3, .BB23_22
	;;
.BB23_12:
#0:	       cmpu lt	r3, 4 -> c1
	;;
#0:	if  c1 br @	.BB23_20
	;;
.BB23_13:
#0:	       cmpu gt	r3, 15 -> c1
	;;
#0:	if !c1 br @	.BB23_18
	;;
.BB23_14:                               ; %.lr.ph8.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sub	r3, 16 -> r3
#1:	       stm.a	0, r0, 3
	;;
#0:	       cmpu gt	r3, 15 -> c1
#1:	       stm.a	0, r0, 2
	;;
#0:	if !c1 br	.BB23_19
#1:	if  c1 br	.BB23_14
#2:	       stm.a	0, r0, 1
	;;
#0:	       stm.a	0, r0, 0
#1:	       add	r0, 16 -> r0
	;;
	       nop	0
	;;
.BB23_15:
#0:	       add	r2, 8 -> r0
#1:	       br @	.BB23_17
	;;
.BB23_16:
#0:	       add	r2, 16 -> r0
	;;
.BB23_17:
#0:	       stm.a	0, r0, 0
#1:	       br	.BB23_22
	;;
#0:	       stm.a	0, r0, 1
	;;
#0:	       stm.a	0, r0, 2
	;;
.BB23_18:                               ; %.lr.ph.i
#0:	       stm.a	0, r0, 0
#1:	       add	r0, 4 -> r0
#2:	       sub	r3, 4 -> r3
	;;
.BB23_19:                               ; %.lr.ph.i
#0:	       cmpu gt	r3, 3 -> c1
	;;
#0:	if  c1 br @	.BB23_18
	;;
.BB23_20:                               ; %.preheader11.i
#0:	       brz eq @	r3, .BB23_22
	;;
.BB23_21:                               ; %.lr.ph14.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       stmb.a	0, r0, 0
#1:	       add	r0, 1 -> r0
#2:	       sub	r3, 1 -> r3
	;;
#0:	       brz ne @	r3, .BB23_21
	;;
.BB23_22:                               ; %_calloc_r.exit
#0:	       ldga	_impure_data -> r0
	;;
#0:	       stm.a	r2, r0, 19
	;;
.BB23_23:
#0:	       cmp gt	r12, r0.23 -> c1
	;;
#2:	if  c1 add	r2.23, 1 -> r2.23
	;;
#2:	       ldmr.f	r2.23, r2, 2
	;;
#0:	       or	r31, 0 -> r3
	;;
#0:	       brz eq @	r3, .BB23_25
	;;
.BB23_24:
#2:	       s2add	r2, r2.23 -> r0
#0:	       br	.BB23_46
#1:	       ldm.f	r3, 0
	;;
#0:	       stm.a	r31, r0, 0
	;;
	       nop	0
	;;
.BB23_25:
#0:	       ldi	1 -> r0
#1:	       callg	__malloc_r
	;;
#2:	       sl	r0, r2.23 -> r2.24
#0:	       ldi	20 -> r0
	;;
#2:	       s2add	r0, r2.24 -> r0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r3
#1:	       ldi	0 -> r1
	;;
#0:	       brz eq @	r3, .BB23_47
	;;
.BB23_26:
#0:	       ldm.f	r3, -4
#1:	       ldi	-4 -> r0
	;;
#0:	       sub	r31, 4 -> r1
	;;
#0:	       and	r1, r0 -> r2
#1:	       ldi	36 -> r1
	;;
#0:	       cmpu gt	r2, r1 -> c1
	;;
#0:	if  c1 br @	.BB23_31
	;;
.BB23_27:
#0:	       cmpu lt	r2, 20 -> c1
#1:	       or	r3, 0 -> r0
	;;
#0:	if  c1 br @	.BB23_40
	;;
.BB23_28:
#0:	       cmpu lt	r2, 28 -> c1
#1:	       stm.a	0, r3, 0
	;;
#0:	if  c1 br @	.BB23_38
#1:	       stm.a	0, r3, 1
	;;
.BB23_29:
#0:	       ldi	36 -> r0
#1:	       stm.a	0, r3, 2
	;;
#0:	       cmpu lt	r2, r0 -> c1
#1:	       stm.a	0, r3, 3
	;;
#0:	if  c1 br @	.BB23_39
	;;
.BB23_30:
#0:	       add	r3, 24 -> r0
#1:	       br	.BB23_40
#2:	       stm.a	0, r3, 4
	;;
#0:	       stm.a	0, r3, 5
	;;
	       nop	0
	;;
.BB23_31:
#0:	       or	r3, 0 -> r0
#1:	       br @	.BB23_33
	;;
.BB23_32:                               ;   in Loop: Header=BB23_33 Depth=1
#0:	       stmb.a	0, r0, 0
#1:	       add	r0, 1 -> r0
#2:	       sub	r2, 1 -> r2
	;;
.BB23_33:                               ; %.preheader26
                                        ; =>This Inner Loop Header: Depth=1
#0:	       and	r0, 3 -> r1
	;;
#0:	       brz eq @	r1, .BB23_35
	;;
.BB23_34:                               ;   in Loop: Header=BB23_33 Depth=1
#0:	       brz ne @	r2, .BB23_32
	;;
#0:	       brz eq @	r2, .BB23_45
	;;
.BB23_35:
#0:	       cmpu lt	r2, 4 -> c1
	;;
#0:	if  c1 br @	.BB23_43
	;;
.BB23_36:
#0:	       cmpu gt	r2, 15 -> c1
	;;
#0:	if !c1 br @	.BB23_41
	;;
.BB23_37:                               ; %.lr.ph8.i10
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sub	r2, 16 -> r2
#1:	       stm.a	0, r0, 3
	;;
#0:	       cmpu gt	r2, 15 -> c1
#1:	       stm.a	0, r0, 2
	;;
#0:	if !c1 br	.BB23_42
#1:	if  c1 br	.BB23_37
#2:	       stm.a	0, r0, 1
	;;
#0:	       stm.a	0, r0, 0
#1:	       add	r0, 16 -> r0
	;;
	       nop	0
	;;
.BB23_38:
#0:	       add	r3, 8 -> r0
#1:	       br @	.BB23_40
	;;
.BB23_39:
#0:	       add	r3, 16 -> r0
	;;
.BB23_40:
#0:	       stm.a	0, r0, 0
#1:	       br	.BB23_45
	;;
#0:	       stm.a	0, r0, 1
	;;
#0:	       stm.a	0, r0, 2
	;;
.BB23_41:                               ; %.lr.ph.i13
#0:	       stm.a	0, r0, 0
#1:	       add	r0, 4 -> r0
#2:	       sub	r2, 4 -> r2
	;;
.BB23_42:                               ; %.lr.ph.i13
#0:	       cmpu gt	r2, 3 -> c1
	;;
#0:	if  c1 br @	.BB23_41
	;;
.BB23_43:                               ; %.preheader11.i19
#0:	       brz eq @	r2, .BB23_45
	;;
.BB23_44:                               ; %.lr.ph14.i22
                                        ; =>This Inner Loop Header: Depth=1
#0:	       stmb.a	0, r0, 0
#1:	       add	r0, 1 -> r0
#2:	       sub	r2, 1 -> r2
	;;
#0:	       brz ne @	r2, .BB23_44
	;;
.BB23_45:                               ; %_calloc_r.exit4
#2:	       stm.a	r2.23, r3, 1
	;;
#2:	       stm.a	r2.24, r3, 2
	;;
.BB23_46:
#0:	       stm.a	0, r3, 4
#1:	       or	r3, 0 -> r1
	;;
#0:	       stm.a	0, r3, 3
	;;
.BB23_47:                               ; %_Balloc.exit
#0:	       cmp lt	r12, 1 -> c1
#1:	       add	r1, 20 -> r5
	;;
#0:	if  c1 br @	.BB23_50
	;;
.BB23_48:
#0:	       s2add	r5, r12 -> r2
#1:	       or	r5, 0 -> r0
	;;
.BB23_49:                               ; %.lr.ph9
                                        ; =>This Inner Loop Header: Depth=1
#0:	       stm.a	0, r0, 0
#1:	       add	r0, 4 -> r0
	;;
#0:	       cmpu lt	r0, r2 -> c1
	;;
#0:	if  c1 br @	.BB23_49
	;;
.BB23_50:                               ; %._crit_edge
#0:	       cmp lt	r10, 1 -> c1
	;;
#0:	if  c1 br @	.BB23_60
	;;
.BB23_51:                               ; %.lr.ph
#0:	       add	r14, 20 -> r2
#1:	       s2add	r13, r10 -> r0
#2:	       add	r14, 20 -> r3
#3:	       add	r13, 20 -> r8
	;;
#0:	       s2add	r2, r11 -> r6
#1:	       add	r0, 20 -> r7
	;;
.BB23_52:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB23_57 Depth 2
                                        ;     Child Loop BB23_53 Depth 2
#0:	       ldi	0 -> r0.18
#1:	       ldm.f	r8, 0
#2:	       ldi	0 -> r9
	;;
#0:	       bbh	zext16 r31 -> r4
#1:	       or	r31, 0 -> r0
	;;
#0:	       brz eq @	r4, .BB23_55
	;;
.BB23_53:                               ; %.preheader2
                                        ;   Parent Loop BB23_52 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldmr.f	r0.18, r3, 0
	;;
#1:	       or	r31, 0 -> r10
#0:	       ldmr.f	r0.18, r5, 0
	;;
#0:	       sr	r10, 16 -> r0
	;;
#0:	       mul	r0, r4 -> $mul0.0
#1:	       sr	r31, 16 -> r0
	;;
#0:	       ldx	$mul0.0, r0 -> r0.16
#1:	       bbh	zext16 r10 -> r0
	;;
#1:	       mul	r0, r4 -> $mul1.0
#0:	       bbh	zext16 r31 -> r0
	;;
#1:	       ldx	$mul1.0, r9 -> r9
	;;
#0:	       add	r9, r0 -> r0
	;;
#0:	       sr	r0, 16 -> r0
	;;
#0:	       add	r0.16, r0 -> r0.17
#1:	       add	r31, r9 -> r0
	;;
#0:	       add	r0.18, 4 -> r0.16
#2:	       bbh	zext16 r0 -> r2.16
	;;
#0:	       add	r3, r0.16 -> r0
	;;
#0:	       add	r5, r0.18 -> r9
#1:	       cmpu lt	r0, r6 -> c1
	;;
#1:	if  c1 br	.BB23_53
#0:	       sl	r0.17, 16 -> r0
	;;
#2:	       or	r0, r2.16 -> r0
#0:	       or	r0.16, 0 -> r0.18
	;;
#1:	       stm.a	r0, r9, 0
#0:	       sr	r0.17, 16 -> r9
	;;
.BB23_54:                               ;   in Loop: Header=BB23_52 Depth=1
#0:	       add	r5, r0.16 -> r0
	;;
#0:	       stm.a	r9, r0, 0
	;;
#0:	       ldm.f	r8, 0
	;;
#0:	       or	r31, 0 -> r0
	;;
.BB23_55:                               ;   in Loop: Header=BB23_52 Depth=1
#0:	       sr	r0, 16 -> r4
	;;
#0:	       brz eq @	r4, .BB23_59
	;;
.BB23_56:                               ;   in Loop: Header=BB23_52 Depth=1
#2:	       or	r2, 0 -> r2.18
#0:	       ldm.f	r5, 0
#1:	       ldi	0 -> r10
#3:	       or	r5, 0 -> r9
	;;
#3:	       or	r31, 0 -> r3.16
#0:	       or	r31, 0 -> r0
	;;
.BB23_57:                               ;   Parent Loop BB23_52 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#2:	       ldm.f	r2.18, 0
#3:	       add	r9, 4 -> r3.17
#0:	       sr	r0, 16 -> r0
	;;
#2:	       add	r10, r0 -> r2.16
	;;
#0:	       bbh	zext16 r31 -> r0
	;;
#2:	       mul	r0, r4 -> $mul2.0
#3:	       bbh	zext16 r3.16 -> r0
	;;
#2:	       ldx	$mul2.0, r2.16 -> r2.17
	;;
#2:	       sl	r2.17, 16 -> r2.16
	;;
#2:	       or	r2.16, r0 -> r0
	;;
#2:	       add	r2.18, 4 -> r2.16
#0:	       stm.a	r0, r9, 0
	;;
#2:	       ldm.f	r2.18, 2
	;;
#2:	       add	r2.18, 2 -> r0
	;;
#2:	       cmpu lt	r2.16, r6 -> c1
#0:	       bbh	mzext16 r0 -> r0
#1:	       ldm.f	r9, 4
	;;
#3:	       mul	r0, r4 -> $mul3.0
#2:	       sr	r2.17, 16 -> r10
	;;
#2:	       or	r2.16, 0 -> r2.18
#3:	       or	r3.17, 0 -> r9
#0:	       bbh	zext16 r31 -> r0
	;;
#0:	if  c1 br	.BB23_57
#3:	       ldx	$mul3.0, r0 -> r0
	;;
#3:	       add	r0, r10 -> r3.16
#0:	       or	r31, 0 -> r0
	;;
#3:	       sr	r3.16, 16 -> r10
	;;
.BB23_58:                               ;   in Loop: Header=BB23_52 Depth=1
#3:	       stm.a	r3.16, r3.17, 0
	;;
.BB23_59:                               ;   in Loop: Header=BB23_52 Depth=1
#0:	       add	r8, 4 -> r8
#1:	       add	r5, 4 -> r5
	;;
#0:	       cmpu lt	r8, r7 -> c1
	;;
#0:	if  c1 br @	.BB23_52
	;;
.BB23_60:                               ; %.preheader
                                        ; =>This Inner Loop Header: Depth=1
#0:	       or	r12, 0 -> r0
	;;
#0:	       cmp lt	r0, 1 -> c1
	;;
#0:	if  c1 br @	.BB23_62
	;;
.BB23_61:                               ;   in Loop: Header=BB23_60 Depth=1
#0:	       sub	r0, 1 -> r12
#1:	       s2add	r1, r0 -> r2
	;;
#0:	       ldm.f	r2, 16
	;;
#0:	       brz eq @	r31, .BB23_60
	;;
.BB23_62:                               ; %.critedge
#0:	       stm.a	r0, r1, 4
#1:	       or	r1, 0 -> r0
	;;
#0:	       ldm.s	r15, 0
	;;
#0:	       stx	r31 -> $ro
#1:	       ldm.s	r15, 4
	;;
#0:	       stx	r31 -> $rb
#1:	       ldm.s	r15, 8
	;;
#2:	       or	r31, 0 -> r2.24
#0:	       ldm.s	r15, 12
	;;
#2:	       or	r31, 0 -> r2.23
#0:	       ldm.s	r15, 16
	;;
#0:	       or	r31, 0 -> r0.23
#1:	       ldm.s	r15, 20
	;;
#0:	       or	r31, 0 -> r14
#1:	       ldm.s	r15, 24
	;;
#0:	       or	r31, 0 -> r13
#1:	       ldm.s	r15, 28
	;;
#0:	       or	r31, 0 -> r12
#1:	       ldm.s	r15, 32
	;;
#0:	       or	r31, 0 -> r11
#1:	       ldm.s	r15, 36
#2:	       addi	56 -> r15
	;;
#0:	       jop	ret
#1:	       or	r31, 0 -> r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
___multiply_end:
.tmp23:
	.size	___multiply, .tmp23-___multiply

	.type	___pow5mult,@function
___pow5mult:                            ; @__pow5mult
	.funsz	___pow5mult_end-___pow5mult
___pow5mult_start:
; BB#0:
#0:	       wb.s	r15, 10
#1:	       addi	-40 -> r15
#2:	       ldx	$rb, 0 -> r2
#3:	       ldx	$ro, 0 -> r3
	;;
#0:	       stm.s	r10, r15, 5
#1:	       or	r0, 0 -> r10
	;;
#0:	       stm.s	r11, r15, 4
#1:	       or	r1, 0 -> r11
	;;
#0:	       stm.s	r12, r15, 3
#1:	       and	r11, 3 -> r0
	;;
#0:	       brz eq	r0, .BB24_2
#1:	       stm.s	r2, r15, 2
	;;
#0:	       stm.s	r3, r15, 1
	;;
	       nop	0
	;;
.BB24_1:
#0:	       ldga	___pow5mult.p05 -> r1
#1:	       callg	___multadd
	;;
#0:	       s2add	r1, r0 -> r0
	;;
#0:	       ldm.f	r0, -4
#1:	       or	r10, 0 -> r0
	;;
#0:	       or	r31, 0 -> r1
	;;
#0:	       or	r0, 0 -> r10
	;;
.BB24_2:
#0:	       sra	r11, 2 -> r12
	;;
#0:	       cmp eq	r12, 0 -> c3
	;;
#0:	if  c3 br @	.BB24_60
	;;
.BB24_3:
#0:	       ldmg.d	_impure_data+72
	;;
#0:	       cmp ne	r31, 0 -> c3
#1:	       or	r31, 0 -> r0
	;;
#0:	if  c3 br @	.BB24_53
	;;
.BB24_4:
#0:	       ldmg.d	_impure_data+76
	;;
#0:	       brz ne @	r31, .BB24_27
#1:	       or	r31, 0 -> r3
	;;
.BB24_5:
#0:	       ldi	132 -> r0
#1:	       callg	__malloc_r
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r3
	;;
#0:	       brz eq @	r3, .BB24_11
	;;
.BB24_6:
#0:	       ldm.f	r3, -4
#1:	       ldi	-4 -> r0
	;;
#0:	       sub	r31, 4 -> r1
	;;
#0:	       and	r1, r0 -> r2
#1:	       ldi	36 -> r1
	;;
#0:	       cmpu gt	r2, r1 -> c1
	;;
#0:	if  c1 br @	.BB24_12
	;;
.BB24_7:
#0:	       cmpu lt	r2, 20 -> c1
#1:	       or	r3, 0 -> r0
	;;
#0:	if  c1 br @	.BB24_21
	;;
.BB24_8:
#0:	       cmpu lt	r2, 28 -> c1
#1:	       stm.a	0, r3, 0
	;;
#0:	if  c1 br @	.BB24_19
#1:	       stm.a	0, r3, 1
	;;
.BB24_9:
#0:	       ldi	36 -> r0
#1:	       stm.a	0, r3, 2
	;;
#0:	       cmpu lt	r2, r0 -> c1
#1:	       stm.a	0, r3, 3
	;;
#0:	if  c1 br @	.BB24_20
	;;
.BB24_10:
#0:	       add	r3, 24 -> r0
#1:	       br	.BB24_21
#2:	       stm.a	0, r3, 4
	;;
#0:	       stm.a	0, r3, 5
	;;
	       nop	0
	;;
.BB24_11:                               ; %_calloc_r.exit.thread
#0:	       ldga	_impure_data -> r0
#1:	       br	.BB24_51
	;;
#0:	       stm.a	0, r0, 19
#1:	       ldi	0 -> r0
	;;
	       nop	0
	;;
.BB24_12:
#0:	       or	r3, 0 -> r0
#1:	       br @	.BB24_14
	;;
.BB24_13:                               ;   in Loop: Header=BB24_14 Depth=1
#0:	       stmb.a	0, r0, 0
#1:	       add	r0, 1 -> r0
#2:	       sub	r2, 1 -> r2
	;;
.BB24_14:                               ; %.preheader
                                        ; =>This Inner Loop Header: Depth=1
#0:	       and	r0, 3 -> r1
	;;
#0:	       brz eq @	r1, .BB24_16
	;;
.BB24_15:                               ;   in Loop: Header=BB24_14 Depth=1
#0:	       brz ne @	r2, .BB24_13
	;;
#0:	       brz eq @	r2, .BB24_26
	;;
.BB24_16:
#0:	       cmpu lt	r2, 4 -> c1
	;;
#0:	if  c1 br @	.BB24_24
	;;
.BB24_17:
#0:	       cmpu gt	r2, 15 -> c1
	;;
#0:	if !c1 br @	.BB24_22
	;;
.BB24_18:                               ; %.lr.ph8.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sub	r2, 16 -> r2
#1:	       stm.a	0, r0, 3
	;;
#0:	       cmpu gt	r2, 15 -> c1
#1:	       stm.a	0, r0, 2
	;;
#0:	if !c1 br	.BB24_23
#1:	if  c1 br	.BB24_18
#2:	       stm.a	0, r0, 1
	;;
#0:	       stm.a	0, r0, 0
#1:	       add	r0, 16 -> r0
	;;
	       nop	0
	;;
.BB24_19:
#0:	       add	r3, 8 -> r0
#1:	       br @	.BB24_21
	;;
.BB24_20:
#0:	       add	r3, 16 -> r0
	;;
.BB24_21:
#0:	       stm.a	0, r0, 0
#1:	       br	.BB24_26
	;;
#0:	       stm.a	0, r0, 1
	;;
#0:	       stm.a	0, r0, 2
	;;
.BB24_22:                               ; %.lr.ph.i
#0:	       stm.a	0, r0, 0
#1:	       add	r0, 4 -> r0
#2:	       sub	r2, 4 -> r2
	;;
.BB24_23:                               ; %.lr.ph.i
#0:	       cmpu gt	r2, 3 -> c1
	;;
#0:	if  c1 br @	.BB24_22
	;;
.BB24_24:                               ; %.preheader11.i
#0:	       brz eq @	r2, .BB24_26
	;;
.BB24_25:                               ; %.lr.ph14.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       stmb.a	0, r0, 0
#1:	       add	r0, 1 -> r0
#2:	       sub	r2, 1 -> r2
	;;
#0:	       brz ne @	r2, .BB24_25
	;;
.BB24_26:                               ; %_calloc_r.exit
#0:	       ldga	_impure_data -> r0
	;;
#0:	       stm.a	r3, r0, 19
	;;
.BB24_27:
#0:	       ldm.f	r3, 4
	;;
#0:	       or	r31, 0 -> r4
	;;
#0:	       brz eq @	r4, .BB24_29
	;;
.BB24_28:
#0:	       ldm.f	r4, 0
#1:	       br	.BB24_50
	;;
#0:	       stm.a	r31, r3, 1
	;;
	       nop	0
	;;
.BB24_29:
#0:	       ldi	28 -> r0
#1:	       callg	__malloc_r
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r4
#1:	       ldi	0 -> r0
	;;
#0:	       brz eq @	r4, .BB24_51
	;;
.BB24_30:
#0:	       ldm.f	r4, -4
#1:	       ldi	-4 -> r0
#2:	       ldi	36 -> r3
	;;
#0:	       sub	r31, 4 -> r1
	;;
#0:	       and	r1, r0 -> r2
	;;
#0:	       cmpu gt	r2, r3 -> c1
	;;
#0:	if  c1 br @	.BB24_35
	;;
.BB24_31:
#0:	       cmpu lt	r2, 20 -> c1
#1:	       or	r4, 0 -> r0
	;;
#0:	if  c1 br @	.BB24_44
	;;
.BB24_32:
#0:	       cmpu lt	r2, 28 -> c1
#1:	       stm.a	0, r4, 0
	;;
#0:	if  c1 br @	.BB24_42
#1:	       stm.a	0, r4, 1
	;;
.BB24_33:
#0:	       ldi	36 -> r0
#1:	       stm.a	0, r4, 2
	;;
#0:	       cmpu lt	r2, r0 -> c1
#1:	       stm.a	0, r4, 3
	;;
#0:	if  c1 br @	.BB24_43
	;;
.BB24_34:
#0:	       add	r4, 24 -> r0
#1:	       br	.BB24_44
#2:	       stm.a	0, r4, 4
	;;
#0:	       stm.a	0, r4, 5
	;;
	       nop	0
	;;
.BB24_35:
#0:	       or	r4, 0 -> r0
#1:	       br @	.BB24_37
	;;
.BB24_36:                               ;   in Loop: Header=BB24_37 Depth=1
#0:	       stmb.a	0, r0, 0
#1:	       add	r0, 1 -> r0
#2:	       sub	r2, 1 -> r2
	;;
.BB24_37:                               ; %.preheader24
                                        ; =>This Inner Loop Header: Depth=1
#0:	       and	r0, 3 -> r1
	;;
#0:	       brz eq @	r1, .BB24_39
	;;
.BB24_38:                               ;   in Loop: Header=BB24_37 Depth=1
#0:	       brz ne @	r2, .BB24_36
	;;
#0:	       brz eq @	r2, .BB24_49
	;;
.BB24_39:
#0:	       cmpu lt	r2, 4 -> c1
	;;
#0:	if  c1 br @	.BB24_47
	;;
.BB24_40:
#0:	       cmpu gt	r2, 15 -> c1
	;;
#0:	if !c1 br @	.BB24_45
	;;
.BB24_41:                               ; %.lr.ph8.i9
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sub	r2, 16 -> r2
#1:	       stm.a	0, r0, 3
	;;
#0:	       cmpu gt	r2, 15 -> c1
#1:	       stm.a	0, r0, 2
	;;
#0:	if !c1 br	.BB24_46
#1:	if  c1 br	.BB24_41
#2:	       stm.a	0, r0, 1
	;;
#0:	       stm.a	0, r0, 0
#1:	       add	r0, 16 -> r0
	;;
	       nop	0
	;;
.BB24_42:
#0:	       add	r4, 8 -> r0
#1:	       br @	.BB24_44
	;;
.BB24_43:
#0:	       add	r4, 16 -> r0
	;;
.BB24_44:
#0:	       stm.a	0, r0, 0
#1:	       br	.BB24_49
	;;
#0:	       stm.a	0, r0, 1
	;;
#0:	       stm.a	0, r0, 2
	;;
.BB24_45:                               ; %.lr.ph.i12
#0:	       stm.a	0, r0, 0
#1:	       add	r0, 4 -> r0
#2:	       sub	r2, 4 -> r2
	;;
.BB24_46:                               ; %.lr.ph.i12
#0:	       cmpu gt	r2, 3 -> c1
	;;
#0:	if  c1 br @	.BB24_45
	;;
.BB24_47:                               ; %.preheader11.i18
#0:	       brz eq @	r2, .BB24_49
	;;
.BB24_48:                               ; %.lr.ph14.i21
                                        ; =>This Inner Loop Header: Depth=1
#0:	       stmb.a	0, r0, 0
#1:	       add	r0, 1 -> r0
#2:	       sub	r2, 1 -> r2
	;;
#0:	       brz ne @	r2, .BB24_48
	;;
.BB24_49:                               ; %_calloc_r.exit3
#0:	       stm.a	1, r4, 1
	;;
#0:	       stm.a	2, r4, 2
	;;
.BB24_50:
#0:	       stm.a	0, r4, 4
#1:	       or	r4, 0 -> r0
	;;
#0:	       stm.a	0, r4, 3
	;;
.BB24_51:                               ; %__i2b.exit
#0:	       ldi	625 -> r1
	;;
#0:	       stm.a	r1, r0, 5
#1:	       ldga	_impure_data -> r1
	;;
#0:	       stm.a	1, r0, 4
	;;
#0:	       stm.a	r0, r1, 18
	;;
.BB24_52:                               ; %__i2b.exit
#0:	       stm.a	0, r0, 0
	;;
.BB24_53:                               ; %.backedge
                                        ; =>This Inner Loop Header: Depth=1
#0:	       btest	r12, 0 -> c1
#1:	       or	r0, 0 -> r11
	;;
#0:	if !c1 br @	.BB24_57
	;;
.BB24_54:                               ;   in Loop: Header=BB24_53 Depth=1
#0:	       or	r10, 0 -> r0
#1:	       callg	___multiply
#2:	       or	r11, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz eq @	r10, .BB24_56
#1:	       or	r0, 0 -> r1
	;;
.BB24_55:                               ;   in Loop: Header=BB24_53 Depth=1
#0:	       ldm.f	r10, 4
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldmg.d	_impure_data+76
	;;
#0:	       ldmr.f	r0, r31, 2
	;;
#0:	       stm.a	r31, r10, 0
	;;
#0:	       ldmg.d	_impure_data+76
	;;
#0:	       s2add	r31, r0 -> r0
	;;
#0:	       stm.a	r10, r0, 0
	;;
.BB24_56:                               ;   in Loop: Header=BB24_53 Depth=1
#0:	       or	r1, 0 -> r10
	;;
.BB24_57:                               ; %_Bfree.exit
                                        ;   in Loop: Header=BB24_53 Depth=1
#0:	       sra	r12, 1 -> r12
	;;
#0:	       brz eq @	r12, .BB24_60
	;;
.BB24_58:                               ;   in Loop: Header=BB24_53 Depth=1
#0:	       ldm.f	r11, 0
	;;
#0:	       brz ne @	r31, .BB24_53
#1:	       or	r31, 0 -> r0
	;;
.BB24_59:
#0:	       or	r11, 0 -> r0
#1:	       callg	___multiply
#2:	       or	r11, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       br @	.BB24_52
#1:	       stm.a	r0, r11, 0
	;;
.BB24_60:                               ; %.loopexit
#0:	       ldm.s	r15, 4
#1:	       or	r10, 0 -> r0
	;;
#0:	       stx	r31 -> $ro
#1:	       ldm.s	r15, 8
	;;
#0:	       stx	r31 -> $rb
#1:	       ldm.s	r15, 12
	;;
#0:	       or	r31, 0 -> r12
#1:	       ldm.s	r15, 16
	;;
#0:	       or	r31, 0 -> r11
#1:	       ldm.s	r15, 20
#2:	       addi	40 -> r15
	;;
#0:	       jop	ret
#1:	       or	r31, 0 -> r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
___pow5mult_end:
.tmp24:
	.size	___pow5mult, .tmp24-___pow5mult

	.type	___lshift,@function
___lshift:                              ; @__lshift
	.funsz	___lshift_end-___lshift
___lshift_start:
; BB#0:
#0:	       wb.s	r15, 14
#1:	       addi	-56 -> r15
#2:	       ldx	$rb, 0 -> r2
#3:	       ldx	$ro, 0 -> r3
	;;
#0:	       stm.s	r10, r15, 9
#1:	       or	r1, 0 -> r10
	;;
#0:	       stm.s	r11, r15, 8
	;;
#0:	       stm.s	r12, r15, 7
	;;
#0:	       stm.s	r13, r15, 6
#1:	       or	r0, 0 -> r13
	;;
#0:	       stm.s	r14, r15, 5
#1:	       sra	r10, 5 -> r14
	;;
#1:	       stm.s	r1.23, r15, 4
	;;
#1:	       stm.s	r1.24, r15, 3
	;;
#0:	       stm.s	r2, r15, 2
	;;
#0:	       stm.s	r3, r15, 1
	;;
#0:	       ldm.f	r13, 16
	;;
#0:	       add	r31, r14 -> r11
#1:	       ldm.f	r13, 8
	;;
#0:	       add	r11, 1 -> r12
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldm.f	r13, 4
	;;
#0:	       cmp le	r12, r0 -> c1
	;;
#0:	if  c1 br @	.BB25_2
#1:	       or	r31, 0 -> r1.23
	;;
.BB25_1:                                ; %.lr.ph7
                                        ; =>This Inner Loop Header: Depth=1
#1:	       add	r1.23, 1 -> r1.23
#0:	       sl	r0, 1 -> r0
	;;
#0:	       cmp gt	r12, r0 -> c1
	;;
#0:	if  c1 br @	.BB25_1
	;;
.BB25_2:                                ; %._crit_edge8
#0:	       ldmg.d	_impure_data+76
	;;
#0:	       brz ne @	r31, .BB25_25
#1:	       or	r31, 0 -> r3
	;;
.BB25_3:
#0:	       ldi	132 -> r0
#1:	       callg	__malloc_r
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r3
	;;
#0:	       brz eq @	r3, .BB25_9
	;;
.BB25_4:
#0:	       ldm.f	r3, -4
#1:	       ldi	-4 -> r0
	;;
#0:	       sub	r31, 4 -> r1
	;;
#0:	       and	r1, r0 -> r2
#1:	       ldi	36 -> r1
	;;
#0:	       cmpu gt	r2, r1 -> c1
	;;
#0:	if  c1 br @	.BB25_10
	;;
.BB25_5:
#0:	       cmpu lt	r2, 20 -> c1
#1:	       or	r3, 0 -> r0
	;;
#0:	if  c1 br @	.BB25_19
	;;
.BB25_6:
#0:	       cmpu lt	r2, 28 -> c1
#1:	       stm.a	0, r3, 0
	;;
#0:	if  c1 br @	.BB25_17
#1:	       stm.a	0, r3, 1
	;;
.BB25_7:
#0:	       ldi	36 -> r0
#1:	       stm.a	0, r3, 2
	;;
#0:	       cmpu lt	r2, r0 -> c1
#1:	       stm.a	0, r3, 3
	;;
#0:	if  c1 br @	.BB25_18
	;;
.BB25_8:
#0:	       add	r3, 24 -> r0
#1:	       br	.BB25_19
#2:	       stm.a	0, r3, 4
	;;
#0:	       stm.a	0, r3, 5
	;;
	       nop	0
	;;
.BB25_9:                                ; %_calloc_r.exit.thread
#0:	       ldi	0 -> r2
#1:	       br	.BB25_49
#2:	       ldga	_impure_data -> r0
	;;
#0:	       stm.a	0, r0, 19
	;;
	       nop	0
	;;
.BB25_10:
#0:	       or	r3, 0 -> r0
#1:	       br @	.BB25_12
	;;
.BB25_11:                               ;   in Loop: Header=BB25_12 Depth=1
#0:	       stmb.a	0, r0, 0
#1:	       add	r0, 1 -> r0
#2:	       sub	r2, 1 -> r2
	;;
.BB25_12:                               ; %.preheader24
                                        ; =>This Inner Loop Header: Depth=1
#0:	       and	r0, 3 -> r1
	;;
#0:	       brz eq @	r1, .BB25_14
	;;
.BB25_13:                               ;   in Loop: Header=BB25_12 Depth=1
#0:	       brz ne @	r2, .BB25_11
	;;
#0:	       brz eq @	r2, .BB25_24
	;;
.BB25_14:
#0:	       cmpu lt	r2, 4 -> c1
	;;
#0:	if  c1 br @	.BB25_22
	;;
.BB25_15:
#0:	       cmpu gt	r2, 15 -> c1
	;;
#0:	if !c1 br @	.BB25_20
	;;
.BB25_16:                               ; %.lr.ph8.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sub	r2, 16 -> r2
#1:	       stm.a	0, r0, 3
	;;
#0:	       cmpu gt	r2, 15 -> c1
#1:	       stm.a	0, r0, 2
	;;
#0:	if !c1 br	.BB25_21
#1:	if  c1 br	.BB25_16
#2:	       stm.a	0, r0, 1
	;;
#0:	       stm.a	0, r0, 0
#1:	       add	r0, 16 -> r0
	;;
	       nop	0
	;;
.BB25_17:
#0:	       add	r3, 8 -> r0
#1:	       br @	.BB25_19
	;;
.BB25_18:
#0:	       add	r3, 16 -> r0
	;;
.BB25_19:
#0:	       stm.a	0, r0, 0
#1:	       br	.BB25_24
	;;
#0:	       stm.a	0, r0, 1
	;;
#0:	       stm.a	0, r0, 2
	;;
.BB25_20:                               ; %.lr.ph.i
#0:	       stm.a	0, r0, 0
#1:	       add	r0, 4 -> r0
#2:	       sub	r2, 4 -> r2
	;;
.BB25_21:                               ; %.lr.ph.i
#0:	       cmpu gt	r2, 3 -> c1
	;;
#0:	if  c1 br @	.BB25_20
	;;
.BB25_22:                               ; %.preheader11.i
#0:	       brz eq @	r2, .BB25_24
	;;
.BB25_23:                               ; %.lr.ph14.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       stmb.a	0, r0, 0
#1:	       add	r0, 1 -> r0
#2:	       sub	r2, 1 -> r2
	;;
#0:	       brz ne @	r2, .BB25_23
	;;
.BB25_24:                               ; %_calloc_r.exit
#0:	       ldga	_impure_data -> r0
	;;
#0:	       stm.a	r3, r0, 19
	;;
.BB25_25:
#1:	       ldmr.f	r1.23, r3, 2
	;;
#0:	       or	r31, 0 -> r4
	;;
#0:	       brz eq @	r4, .BB25_27
	;;
.BB25_26:
#1:	       s2add	r3, r1.23 -> r0
#0:	       br	.BB25_48
#2:	       ldm.f	r4, 0
	;;
#0:	       stm.a	r31, r0, 0
	;;
	       nop	0
	;;
.BB25_27:
#0:	       ldi	1 -> r0
#1:	       callg	__malloc_r
	;;
#1:	       sl	r0, r1.23 -> r1.24
#0:	       ldi	20 -> r0
	;;
#1:	       s2add	r0, r1.24 -> r0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r4
#1:	       ldi	0 -> r2
	;;
#0:	       brz eq @	r4, .BB25_49
	;;
.BB25_28:
#0:	       ldm.f	r4, -4
#1:	       ldi	-4 -> r0
#2:	       ldi	36 -> r3
	;;
#0:	       sub	r31, 4 -> r1
	;;
#0:	       and	r1, r0 -> r2
	;;
#0:	       cmpu gt	r2, r3 -> c1
	;;
#0:	if  c1 br @	.BB25_33
	;;
.BB25_29:
#0:	       cmpu lt	r2, 20 -> c1
#1:	       or	r4, 0 -> r0
	;;
#0:	if  c1 br @	.BB25_42
	;;
.BB25_30:
#0:	       cmpu lt	r2, 28 -> c1
#1:	       stm.a	0, r4, 0
	;;
#0:	if  c1 br @	.BB25_40
#1:	       stm.a	0, r4, 1
	;;
.BB25_31:
#0:	       ldi	36 -> r0
#1:	       stm.a	0, r4, 2
	;;
#0:	       cmpu lt	r2, r0 -> c1
#1:	       stm.a	0, r4, 3
	;;
#0:	if  c1 br @	.BB25_41
	;;
.BB25_32:
#0:	       add	r4, 24 -> r0
#1:	       br	.BB25_42
#2:	       stm.a	0, r4, 4
	;;
#0:	       stm.a	0, r4, 5
	;;
	       nop	0
	;;
.BB25_33:
#0:	       or	r4, 0 -> r0
#1:	       br @	.BB25_35
	;;
.BB25_34:                               ;   in Loop: Header=BB25_35 Depth=1
#0:	       stmb.a	0, r0, 0
#1:	       add	r0, 1 -> r0
#2:	       sub	r2, 1 -> r2
	;;
.BB25_35:                               ; %.preheader26
                                        ; =>This Inner Loop Header: Depth=1
#0:	       and	r0, 3 -> r1
	;;
#0:	       brz eq @	r1, .BB25_37
	;;
.BB25_36:                               ;   in Loop: Header=BB25_35 Depth=1
#0:	       brz ne @	r2, .BB25_34
	;;
#0:	       brz eq @	r2, .BB25_47
	;;
.BB25_37:
#0:	       cmpu lt	r2, 4 -> c1
	;;
#0:	if  c1 br @	.BB25_45
	;;
.BB25_38:
#0:	       cmpu gt	r2, 15 -> c1
	;;
#0:	if !c1 br @	.BB25_43
	;;
.BB25_39:                               ; %.lr.ph8.i10
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sub	r2, 16 -> r2
#1:	       stm.a	0, r0, 3
	;;
#0:	       cmpu gt	r2, 15 -> c1
#1:	       stm.a	0, r0, 2
	;;
#0:	if !c1 br	.BB25_44
#1:	if  c1 br	.BB25_39
#2:	       stm.a	0, r0, 1
	;;
#0:	       stm.a	0, r0, 0
#1:	       add	r0, 16 -> r0
	;;
	       nop	0
	;;
.BB25_40:
#0:	       add	r4, 8 -> r0
#1:	       br @	.BB25_42
	;;
.BB25_41:
#0:	       add	r4, 16 -> r0
	;;
.BB25_42:
#0:	       stm.a	0, r0, 0
#1:	       br	.BB25_47
	;;
#0:	       stm.a	0, r0, 1
	;;
#0:	       stm.a	0, r0, 2
	;;
.BB25_43:                               ; %.lr.ph.i13
#0:	       stm.a	0, r0, 0
#1:	       add	r0, 4 -> r0
#2:	       sub	r2, 4 -> r2
	;;
.BB25_44:                               ; %.lr.ph.i13
#0:	       cmpu gt	r2, 3 -> c1
	;;
#0:	if  c1 br @	.BB25_43
	;;
.BB25_45:                               ; %.preheader11.i19
#0:	       brz eq @	r2, .BB25_47
	;;
.BB25_46:                               ; %.lr.ph14.i22
                                        ; =>This Inner Loop Header: Depth=1
#0:	       stmb.a	0, r0, 0
#1:	       add	r0, 1 -> r0
#2:	       sub	r2, 1 -> r2
	;;
#0:	       brz ne @	r2, .BB25_46
	;;
.BB25_47:                               ; %_calloc_r.exit4
#1:	       stm.a	r1.23, r4, 1
	;;
#1:	       stm.a	r1.24, r4, 2
	;;
.BB25_48:
#0:	       stm.a	0, r4, 4
#1:	       or	r4, 0 -> r2
	;;
#0:	       stm.a	0, r4, 3
	;;
.BB25_49:                               ; %_Balloc.exit
#0:	       cmp lt	r14, 1 -> c1
#1:	       add	r2, 20 -> r7
	;;
#0:	if  c1 br @	.BB25_53
	;;
.BB25_50:                               ; %.lr.ph
#0:	       sra	r10, 3 -> r0
#1:	       ldi	-4 -> r3
	;;
#0:	       add	r0, 20 -> r1
	;;
#0:	       and	r1, r3 -> r0
	;;
.BB25_51:                               ; =>This Inner Loop Header: Depth=1
#0:	       stm.a	0, r7, 0
#1:	       sub	r14, 1 -> r14
#2:	       add	r7, 4 -> r7
	;;
#0:	       brz ne @	r14, .BB25_51
	;;
.BB25_52:                               ; %._crit_edge
#0:	       add	r2, r0 -> r7
	;;
.BB25_53:
#0:	       ldm.f	r13, 16
#1:	       add	r13, 20 -> r5
#2:	       and	r10, 31 -> r4
	;;
#0:	       brz eq @	r4, .BB25_57
#1:	       s2add	r5, r31 -> r6
	;;
.BB25_54:
#0:	       ldi	32 -> r0
#1:	       ldi	0 -> r1
	;;
#0:	       sub	r0, r4 -> r3
	;;
.BB25_55:                               ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r5, 0
	;;
#0:	       sl	r31, r4 -> r0
	;;
#0:	       or	r0, r1 -> r0
	;;
#0:	       stm.a	r0, r7, 0
#1:	       add	r5, 4 -> r0
#2:	       add	r7, 4 -> r7
	;;
#0:	       cmpu lt	r0, r6 -> c1
#1:	       ldm.f	r5, 0
#2:	       or	r0, 0 -> r5
	;;
#0:	if  c1 br @	.BB25_55
#1:	       sr	r31, r3 -> r1
	;;
.BB25_56:
#0:	       cmp eq	r1, 0 -> c1
#1:	       br	.BB25_58
#2:	       stm.a	r1, r7, 0
	;;
#0:	if !c1 add	r11, 2 -> r12 ; aiaf
	;;
	       nop	0
	;;
.BB25_57:                               ; %.preheader
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r5, 0
#1:	       add	r5, 4 -> r5
	;;
#0:	       cmpu lt	r5, r6 -> c1
	;;
#0:	if  c1 br @	.BB25_57
#1:	       stm.a	r31, r7, 0
#2:	       add	r7, 4 -> r7
	;;
.BB25_58:                               ; %.loopexit
#0:	       sub	r12, 1 -> r0
#1:	       brz eq	r13, .BB25_60
	;;
#0:	       stm.a	r0, r2, 4
	;;
	       nop	0
	;;
.BB25_59:
#0:	       ldm.f	r13, 4
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldmg.d	_impure_data+76
	;;
#0:	       ldmr.f	r0, r31, 2
	;;
#0:	       stm.a	r31, r13, 0
	;;
#0:	       ldmg.d	_impure_data+76
	;;
#0:	       s2add	r31, r0 -> r0
	;;
#0:	       stm.a	r13, r0, 0
	;;
.BB25_60:                               ; %_Bfree.exit
#0:	       ldm.s	r15, 4
#1:	       or	r2, 0 -> r0
	;;
#0:	       stx	r31 -> $ro
#1:	       ldm.s	r15, 8
	;;
#0:	       stx	r31 -> $rb
#1:	       ldm.s	r15, 12
	;;
#1:	       or	r31, 0 -> r1.24
#0:	       ldm.s	r15, 16
	;;
#1:	       or	r31, 0 -> r1.23
#0:	       ldm.s	r15, 20
	;;
#0:	       or	r31, 0 -> r14
#1:	       ldm.s	r15, 24
	;;
#0:	       or	r31, 0 -> r13
#1:	       ldm.s	r15, 28
	;;
#0:	       or	r31, 0 -> r12
#1:	       ldm.s	r15, 32
	;;
#0:	       or	r31, 0 -> r11
#1:	       ldm.s	r15, 36
#2:	       addi	56 -> r15
	;;
#0:	       jop	ret
#1:	       or	r31, 0 -> r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
___lshift_end:
.tmp25:
	.size	___lshift, .tmp25-___lshift

	.type	___sread,@function
___sread:                               ; @__sread
	.funsz	___sread_end-___sread
___sread_start:
; BB#0:
#0:	       or	r1, 0 -> r8
#1:	       or	r0, 0 -> r6
#2:	       or	r3, 0 -> r7
#3:	       or	r2, 0 -> r5
	;;
#0:	       ldm.f	r8, 14
#1:	       add	r8, 2 -> r0
	;;
#0:	       bbh	mzext16 r0 -> r1
#1:	       ldga	_errno.b -> r0
	;;
#0:	       brz eq @	r1, .BB26_2
#1:	       stmb.a	0, r0, 0
	;;
.BB26_1:
#0:	       ldi	-1 -> r7
#1:	       br @	.BB26_7
#2:	       comb	or c1, !c1 -> c1
#3:	       stmb.a	1, r0, 0
	;;
.BB26_2:                                ; %.preheader1.i.i
#0:	       cmp lt	r7, 1 -> c1
	;;
#0:	if  c1 br @	.BB26_10
	;;
.BB26_3:
#0:	       ldi	0 -> r0
#1:	       ldi	-120 -> r4
#2:	       ldi	-116 -> r3
	;;
.BB26_4:                                ; =>This Inner Loop Header: Depth=1
#0:	       ldm.b	r4, 0
	;;
#0:	       bbh	mzext8 0 -> r1
	;;
#0:	       btest	r1, 1 -> !c1
	;;
#0:	if  c1 br @	.BB26_4
	;;
.BB26_5:                                ;   in Loop: Header=BB26_4 Depth=1
#0:	       add	r5, r0 -> r2
#1:	       add	r0, 1 -> r0
#2:	       ldm.b	r3, 0
	;;
#0:	       cmp eq	r0, r7 -> c1
	;;
#0:	if !c1 br	.BB26_4
#1:	       bbh	mzext8 r3 -> r1
	;;
#0:	       stmb.a	r1, r2, 0
	;;
	       nop	0
	;;
.BB26_6:                                ; %_read.exit.i.loopexit
#0:	       ldmg.d	_errno.b
#1:	       ldga	_errno.b -> r0
	;;
#0:	       bbh	mzext8 r0 -> r0
	;;
#0:	       btest	r0, 0 -> c1
	;;
.BB26_7:                                ; %_read.exit.i
#0:	       cmp eq	r7, -1 -> c2
	;;
#0:	       comb	and c2, c1 -> c1
	;;
#0:	if !c1 br @	.BB26_10
	;;
.BB26_8:                                ; %_read_r.exit.thread
#0:	       ldi	88 -> r0
#1:	       ldi	-1 -> r7
	;;
#0:	       stm.a	r0, r6, 0
	;;
.BB26_9:
#0:	       ldm.f	r8, 12
#1:	       ldiu	2047 -> r0
	;;
#0:	       ldim	29 -> r0
	;;
#0:	       jop	ret
#1:	       bbh	mzext16 r8 -> r1
	;;
#0:	       and	r1, r0 -> r0
	;;
#0:	       stmh.a	r0, r8, 6
#1:	       or	r7, 0 -> r0
	;;
	       nop	0
	;;
.BB26_10:                               ; %_read_r.exit
#0:	       brz lt @	r7, .BB26_9
	;;
.BB26_11:
#0:	       jop	ret
	;;
#0:	       ldm.f	r8, 80
	;;
#0:	       add	r31, r7 -> r0
	;;
#0:	       stm.a	r0, r8, 20
#1:	       or	r7, 0 -> r0
	;;
	.align	4
___sread_end:
.tmp26:
	.size	___sread, .tmp26-___sread

	.type	___swrite,@function
___swrite:                              ; @__swrite
	.funsz	___swrite_end-___swrite
___swrite_start:
; BB#0:
#0:	       ldm.f	r1, 12
#1:	       or	r2, 0 -> r5
#2:	       or	r3, 0 -> r4
#3:	       or	r0, 0 -> r6
	;;
#0:	       bbh	mzext16 r1 -> r2
	;;
#0:	       btest	r2, 8 -> !c1
	;;
#0:	if  c1 br @	.BB27_2
	;;
.BB27_1:                                ; %_lseek_r.exit
#0:	       ldga	_errno.b -> r0
#1:	       ldi	88 -> r3
	;;
#0:	       stmb.a	1, r0, 0
	;;
#0:	       stm.a	r3, r6, 0
	;;
.BB27_2:                                ; %._crit_edge
#0:	       ldiu	2047 -> r0
	;;
#0:	       ldim	29 -> r0
	;;
#0:	       and	r2, r0 -> r0
	;;
#0:	       stmh.a	r0, r1, 6
#1:	       add	r1, 2 -> r0
	;;
#0:	       ldm.f	r1, 14
	;;
#0:	       bbh	msext16 r0 -> r1
#1:	       ldga	_errno.b -> r0
	;;
#0:	       sub	r1, 1 -> r1
#1:	       stmb.a	0, r0, 0
	;;
#0:	       cmpu gt	r1, 1 -> c1
	;;
#0:	if  c1 br @	.BB27_8
	;;
.BB27_3:                                ; %.preheader2.i.i
#0:	       cmp lt	r4, 1 -> c1
	;;
#0:	if  c1 br @	.BB27_10
	;;
.BB27_4:
#0:	       ldi	0 -> r0
#1:	       ldi	-120 -> r3
#2:	       ldi	-116 -> r2
	;;
.BB27_5:                                ; =>This Inner Loop Header: Depth=1
#0:	       ldm.b	r3, 0
	;;
#0:	       bbh	mzext8 0 -> r1
	;;
#0:	       btest	r1, 0 -> c1
	;;
#0:	if !c1 br @	.BB27_5
	;;
.BB27_6:                                ;   in Loop: Header=BB27_5 Depth=1
#0:	       add	r5, r0 -> r1
#1:	       ldmr.f	r0, r5, 0
#2:	       add	r0, 1 -> r0
	;;
#0:	       cmp eq	r0, r4 -> c1
	;;
#0:	if !c1 br	.BB27_5
#1:	       bbh	mzext8 r1 -> r1
	;;
#0:	       stmb.a	r1, r2, 0
	;;
	       nop	0
	;;
.BB27_7:                                ; %_write.exit.i.loopexit
#0:	       ldmg.d	_errno.b
#1:	       br	.BB27_9
#2:	       ldga	_errno.b -> r0
	;;
#0:	       bbh	mzext8 r0 -> r0
	;;
#0:	       btest	r0, 0 -> c1
	;;
.BB27_8:
#0:	       ldi	-1 -> r4
#1:	       comb	or c1, !c1 -> c1
#2:	       stmb.a	1, r0, 0
	;;
.BB27_9:                                ; %_write.exit.i
#0:	       cmp eq	r4, -1 -> c2
	;;
#0:	       comb	and c2, c1 -> c1
	;;
#0:	if  c1 ldi	88 -> r0
#1:	if  c1 ldi	-1 -> r4
	;;
#0:	if  c1 stm.a	r0, r6, 0
	;;
.BB27_10:                               ; %_write_r.exit
#0:	       or	r4, 0 -> r0
#1:	       jop	ret
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
___swrite_end:
.tmp27:
	.size	___swrite, .tmp27-___swrite

	.type	___sseek,@function
___sseek:                               ; @__sseek
	.funsz	___sseek_end-___sseek
___sseek_start:
; BB#0:
#0:	       ldga	_errno.b -> r2
#1:	       ldi	88 -> r3
	;;
#0:	       stmb.a	1, r2, 0
	;;
#0:	       stm.a	r3, r0, 0
#1:	       ldiu	2047 -> r0
	;;
#0:	       ldm.f	r1, 12
#1:	       ldim	29 -> r0
	;;
#0:	       jop	ret
#1:	       bbh	mzext16 r1 -> r2
	;;
#0:	       and	r2, r0 -> r0
	;;
#0:	       stmh.a	r0, r1, 6
#1:	       ldi	-1 -> r0
	;;
	       nop	0
	;;
	.align	4
___sseek_end:
.tmp28:
	.size	___sseek, .tmp28-___sseek

	.type	___sclose,@function
___sclose:                              ; @__sclose
	.funsz	___sclose_end-___sclose
___sclose_start:
; BB#0:
#0:	       or	r1, 0 -> r2
	;;
#0:	       ldm.f	r2, 14
#1:	       add	r2, 2 -> r1
	;;
#0:	       bbh	mzext16 r1 -> r1
	;;
#0:	       cmpu gt	r1, 2 -> c1
	;;
#0:	if  c1 br @	.BB29_2
	;;
.BB29_1:                                ; %_close.exit.i.thread
#0:	       ldga	_errno.b -> r0
#1:	       jop	ret
	;;
#0:	       stmb.a	0, r0, 0
#1:	       ldi	0 -> r0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB29_2:
#0:	       ldga	_errno.b -> r1
#1:	       jop	ret
#2:	       ldi	88 -> r3
	;;
#0:	       stmb.a	1, r1, 0
	;;
#0:	       stm.a	r3, r0, 0
#1:	       ldi	-1 -> r0
	;;
	       nop	0
	;;
	.align	4
___sclose_end:
.tmp29:
	.size	___sclose, .tmp29-___sclose

	.type	___swbuf_r,@function
___swbuf_r:                             ; @__swbuf_r
	.funsz	___swbuf_r_end-___swbuf_r
___swbuf_r_start:
; BB#0:
#0:	       wb.s	r15, 10
#1:	       addi	-40 -> r15
#2:	       ldx	$rb, 0 -> r2
#3:	       ldx	$ro, 0 -> r3
	;;
#0:	       stm.s	r10, r15, 5
#1:	       or	r0, 0 -> r10
	;;
#0:	       stm.s	r11, r15, 4
#1:	       or	r1, 0 -> r11
	;;
#0:	       stm.s	r12, r15, 3
	;;
#0:	       stm.s	r2, r15, 2
	;;
#0:	       stm.s	r3, r15, 1
	;;
#0:	       ldmg.d	_impure_data+56
	;;
#0:	       brz ne @	r31, .BB30_2
	;;
.BB30_1:
#0:	       callg	___sinit
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB30_2:
#0:	       ldm.f	r11, 24
	;;
#0:	       stm.a	r31, r11, 2
	;;
#0:	       ldm.f	r11, 12
	;;
#0:	       bbh	mzext16 r11 -> r0
	;;
#0:	       btest	r0, 3 -> !c1
	;;
#0:	if  c1 br @	.BB30_4
	;;
.BB30_3:
#0:	       ldm.f	r11, 16
	;;
#0:	       brz ne @	r31, .BB30_6
	;;
.BB30_4:
#0:	       or	r11, 0 -> r0
#1:	       callg	___swsetup_r
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldm.f	r11, 12
#1:	       or	r0, 0 -> r1
	;;
#0:	       brz eq @	r1, .BB30_6
#1:	       bbh	mzext16 r11 -> r0
	;;
.BB30_5:
#0:	       ldi	64 -> r1
#1:	       ldga	_impure_data -> r3
	;;
#0:	       br	.BB30_16
#1:	       or	r0, r1 -> r0
	;;
#0:	       stmh.a	r0, r11, 6
#1:	       ldi	-1 -> r0
	;;
#0:	       stm.a	9, r3, 0
	;;
.BB30_6:                                ; %._crit_edge3
#0:	       btest	r0, 13 -> c1
	;;
#0:	if  c1 br @	.BB30_8
	;;
.BB30_7:
#0:	       ldga	8192 -> r1
	;;
#0:	       or	r0, r1 -> r0
	;;
#0:	       stmh.a	r0, r11, 6
#1:	       ldiu	2047 -> r0
	;;
#0:	       ldm.f	r11, 100
#1:	       ldim	2043 -> r0
	;;
#0:	       and	r31, r0 -> r0
	;;
#0:	       stm.a	r0, r11, 25
	;;
.BB30_8:                                ; %._crit_edge2
#0:	       ldm.f	r11, 16
#1:	       bbh	zext8 r10 -> r12
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldm.f	r11, 0
	;;
#0:	       or	r31, 0 -> r2
#1:	       ldm.f	r11, 20
	;;
#0:	       sub	r2, r0 -> r0
	;;
#0:	       cmp ge	r0, r31 -> c1
	;;
#0:	if  c1 br @	.BB30_10
	;;
.BB30_9:                                ; %._crit_edge1
#0:	       add	r0, 1 -> r1
#1:	       br @	.BB30_12
	;;
.BB30_10:
#0:	       or	r11, 0 -> r0
#1:	       callg	__fflush_r
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r1
#1:	       ldi	-1 -> r0
	;;
#0:	       brz ne @	r1, .BB30_16
	;;
.BB30_11:                               ; %._crit_edge
#0:	       ldm.f	r11, 0
#1:	       ldi	1 -> r1
	;;
#0:	       or	r31, 0 -> r2
	;;
.BB30_12:
#0:	       ldm.f	r11, 8
#1:	       add	r2, 1 -> r3
	;;
#0:	       sub	r31, 1 -> r0
	;;
#0:	       stm.a	r0, r11, 2
	;;
#0:	       stm.a	r3, r11, 0
	;;
#0:	       stmb.a	r10, r2, 0
	;;
#0:	       ldm.f	r11, 20
	;;
#0:	       cmp eq	r1, r31 -> c1
	;;
#0:	if  c1 br @	.BB30_14
	;;
.BB30_13:
#0:	       ldm.f	r11, 12
#1:	       cmp eq	r12, 10 -> c2
	;;
#0:	       bbh	mzext16 r11 -> r0
	;;
#0:	       btest	r0, 0 -> c1
	;;
#0:	       comb	and c1, c2 -> c1
	;;
#0:	if !c1 br @	.BB30_15
	;;
.BB30_14:
#0:	       or	r11, 0 -> r0
#1:	       callg	__fflush_r
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r1
#1:	       ldi	-1 -> r0
	;;
#0:	       brz ne @	r1, .BB30_16
	;;
.BB30_15:
#0:	       or	r12, 0 -> r0
	;;
.BB30_16:
#0:	       ldm.s	r15, 4
	;;
#0:	       stx	r31 -> $ro
#1:	       ldm.s	r15, 8
	;;
#0:	       stx	r31 -> $rb
#1:	       ldm.s	r15, 12
	;;
#0:	       or	r31, 0 -> r12
#1:	       ldm.s	r15, 16
	;;
#0:	       or	r31, 0 -> r11
#1:	       ldm.s	r15, 20
#2:	       addi	40 -> r15
	;;
#0:	       jop	ret
#1:	       or	r31, 0 -> r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
___swbuf_r_end:
.tmp30:
	.size	___swbuf_r, .tmp30-___swbuf_r

	.globl	___ashldi3
	.type	___ashldi3,@function
___ashldi3:                             ; @__ashldi3
	.funsz	___ashldi3_end-___ashldi3
___ashldi3_start:
; BB#0:
#0:	       or	r2, 0 -> r3
	;;
#0:	       btest	r3, 5 -> !c1
	;;
#0:	if !c1 br @	.BB31_4
	;;
.BB31_1:
#0:	       brz eq @	r3, .BB31_3
	;;
.BB31_2:
#0:	       sl	r1, r3 -> r2
#1:	       ldi	32 -> r1
	;;
#0:	       sub	r1, r3 -> r1
	;;
#0:	       sr	r0, r1 -> r1
#1:	       sl	r0, r3 -> r0
	;;
#0:	       or	r2, r1 -> r1
	;;
.BB31_3:
#0:	       jop	ret
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB31_4:
#0:	       addi	-32 -> r3
#1:	       jop	ret
	;;
#0:	       sl	r0, r3 -> r1
#1:	       ldi	0 -> r0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
___ashldi3_end:
.tmp31:
	.size	___ashldi3, .tmp31-___ashldi3

	.globl	___ashrdi3
	.type	___ashrdi3,@function
___ashrdi3:                             ; @__ashrdi3
	.funsz	___ashrdi3_end-___ashrdi3
___ashrdi3_start:
; BB#0:
#0:	       or	r2, 0 -> r3
	;;
#0:	       btest	r3, 5 -> !c1
	;;
#0:	if !c1 br @	.BB32_4
	;;
.BB32_1:
#0:	       brz eq @	r3, .BB32_3
	;;
.BB32_2:
#0:	       sr	r0, r3 -> r2
#1:	       ldi	32 -> r0
	;;
#0:	       sub	r0, r3 -> r0
	;;
#0:	       sl	r1, r0 -> r0
#1:	       sra	r1, r3 -> r1
	;;
#0:	       or	r0, r2 -> r0
	;;
.BB32_3:
#0:	       jop	ret
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB32_4:
#0:	       addi	-32 -> r3
#1:	       jop	ret
	;;
#0:	       sra	r1, r3 -> r0
#1:	       sra	r1, 31 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
___ashrdi3_end:
.tmp32:
	.size	___ashrdi3, .tmp32-___ashrdi3

	.globl	___divdf3
	.type	___divdf3,@function
___divdf3:                              ; @__divdf3
	.funsz	___divdf3_end-___divdf3
___divdf3_start:
; BB#0:
#0:	       wb.s	r15, 46
#1:	       addi	-184 -> r15
#2:	       ldiu	128 -> r4
#3:	       stx	r2 -> $f0
	;;
#0:	       add	r15, r4 -> r4
#1:	       stx	r3 -> $f2
#2:	       s2add	r15, 16 -> r8
#3:	       ldiu	2047 -> r6
	;;
#0:	       stm.s	r10, r4, 9
#1:	       stx	r1 -> $f4
#2:	       ldiu	2045 -> r5
	;;
#0:	       stm.s	r11, r4, 8
#1:	       ldx	$ro, 0 -> r11
	;;
#0:	       stm.s	r12, r4, 7
#1:	       s2add	r15, 16 -> r12
	;;
#0:	       stm.s	r13, r4, 6
#1:	       add	r12, 16 -> r3
	;;
#0:	       stm.s	r14, r4, 5
	;;
#0:	       stm.s	r0.23, r4, 4
	;;
#1:	       stm.s	r1.23, r4, 3
	;;
#2:	       stm.s	r2.23, r4, 2
	;;
#3:	       stm.s	r3.23, r4, 1
	;;
#0:	       stm.s	r0.24, r4, 0
#1:	       ldx	$rb, 0 -> r4
	;;
#1:	       stm.s	r1.24, r15, 31
	;;
#3:	       stm.s	r3.24, r15, 30
	;;
#1:	       stm.s	r1.25, r15, 29
	;;
#1:	       stm.s	r1.26, r15, 28
	;;
#1:	       stm.s	r1.27, r15, 27
	;;
#0:	       stm.s	r4, r15, 26
	;;
#0:	       stm.s	r11, r15, 25
#1:	       fop	fmov	f2 -> f1
	;;
#0:	       stx	r0 -> $f2
#1:	       stm.a	r2, r15, 20
#2:	       or	r3, 4 -> r2
#3:	       add	r8, 24 -> r3
	;;
#0:	       fop	fmov	f4 -> f3
	;;
#0:	       ldx	$f1 -> r0
	;;
#0:	       stm.a	r0, r2, 0
#1:	       ldx	$f2 -> r1
	;;
#0:	       stm.a	r1, r15, 22
#1:	       ldx	$f3 -> r0
#2:	       or	r3, 4 -> r1
	;;
#0:	       stm.a	r0, r1, 0
#1:	       ldiu	2047 -> r0
	;;
#0:	       ldm.f	r2, 0
#1:	       ldiu	0 -> r2
#2:	       ldim	511 -> r0
	;;
#0:	       ldih	1024 -> r2
	;;
#0:	       or	r31, 0 -> r7
#1:	       ldm.f	r1, 0
	;;
#0:	       sr	r7, 20 -> r4
#1:	       and	r7, r0 -> r12
	;;
#1:	       and	r4, r6 -> r1.26
#0:	       or	r31, 0 -> r3
#2:	       ldm.f	r15, 80
	;;
#0:	       sr	r3, 20 -> r1
#1:	       and	r3, r0 -> r11
#2:	       xor	r7, r3 -> r0
	;;
#1:	       and	r1, r6 -> r1.27
#0:	       or	r31, 0 -> r0.23
#2:	       ldm.f	r15, 88
#3:	       and	r0, r2 -> r0
	;;
#1:	       sub	r1.27, 1 -> r1
	;;
#1:	       or	r31, 0 -> r1.23
#0:	       cmpu gt	r1, r5 -> c1
#2:	       stm.s	r0, r15, 1
	;;
#0:	if  c1 br @	.BB33_2
	;;
.BB33_1:
#1:	       sub	r1.26, 1 -> r1
#0:	       ldiu	2046 -> r0
	;;
#0:	       cmpu lt	r1, r0 -> c1
	;;
#0:	if  c1 br @	.BB33_6
	;;
.BB33_2:
#1:	       cmp eq	r1.23, 0 -> c1
#0:	       ldim	1023 -> r6
#2:	       ldga	1048576 -> r0
	;;
#0:	       ldih	1023 -> r6
#1:	       ldih	1023 -> r0
	;;
#0:	       and	r3, r6 -> r1
	;;
#0:	       cmp eq	r1, r0 -> c2
	;;
#0:	if !c2 cmpu lt	r1, r0 -> c1 ; aacf
	;;
#0:	if  c1 br @	.BB33_4
	;;
.BB33_3:
#0:	       ldga	524288 -> r0
#1:	       add	r15, 8 -> r1
	;;
#0:	       or	r3, r0 -> r0
#1:	       or	r1, 4 -> r1
	;;
#0:	       br	.BB33_28
#1:	       stm.a	r0, r1, 0
	;;
#1:	       stm.a	r1.23, r15, 2
	;;
#0:	       ldm.f	r15, 8
	;;
.BB33_4:
#0:	       cmp eq	r0.23, 0 -> c1
#1:	       and	r7, r6 -> r10
	;;
#0:	       cmp eq	r10, r0 -> c2
	;;
#0:	if !c2 cmpu lt	r10, r0 -> c1 ; aacf
	;;
#0:	if  c1 br @	.BB33_9
	;;
.BB33_5:
#0:	       ldga	524288 -> r0
#1:	       add	r15, 16 -> r1
	;;
#0:	       or	r7, r0 -> r0
#1:	       or	r1, 4 -> r1
	;;
#0:	       br	.BB33_28
#1:	       stm.a	r0, r1, 0
	;;
#0:	       stm.a	r0.23, r15, 4
	;;
#0:	       ldm.f	r15, 16
	;;
.BB33_6:
#0:	       ldi	0 -> r0
	;;
#3:	       or	r0, 0 -> r3.23
	;;
.BB33_7:
#3:	       ldi	0 -> r3.24
#0:	       ldiu	0 -> r0
#1:	       ldiu	819 -> r3
#2:	       ldiu	0 -> r13
	;;
#0:	       ldim	512 -> r0
#1:	       ldim	158 -> r3
	;;
#0:	       or	r12, r0 -> r0.24
#1:	       ldih	936 -> r3
	;;
#0:	       sl	r0.24, 11 -> r1
	;;
#1:	       callg	___muldi3
#0:	       sr	r0.23, 21 -> r0
	;;
#0:	       or	r0, r1 -> r12
#1:	       ldi	0 -> r1
	;;
#0:	       sub	r3, r12 -> r10
#1:	       or	r12, 0 -> r2
#2:	       ldi	0 -> r3
	;;
#0:	       or	r10, 0 -> r0
	;;
#0:	       callg	___muldi3
	;;
#0:	       or	r1, 0 -> r0
#1:	       ldi	0 -> r1
#2:	       or	r10, 0 -> r2
#3:	       ldi	0 -> r3
	;;
#3:	       sub	r3.24, r0 -> r0
	;;
	       nop	0
	;;
#0:	       callg	___muldi3
#1:	       or	r1, 0 -> r1
#2:	       or	r0, 0 -> r2
	;;
#0:	       sr	r2, 31 -> r3
#1:	       sl	r1, 1 -> r1
#2:	       or	r12, 0 -> r2
	;;
#0:	       or	r3, r1 -> r10
#1:	       ldi	0 -> r1
#2:	       ldi	0 -> r3
	;;
#0:	       or	r10, 0 -> r0
	;;
#0:	       callg	___muldi3
	;;
#0:	       or	r1, 0 -> r0
#1:	       ldi	0 -> r1
#2:	       or	r10, 0 -> r2
#3:	       ldi	0 -> r3
	;;
#3:	       sub	r3.24, r0 -> r0
	;;
	       nop	0
	;;
#0:	       callg	___muldi3
#1:	       or	r1, 0 -> r1
#2:	       or	r0, 0 -> r2
	;;
#0:	       sr	r2, 31 -> r3
#1:	       sl	r1, 1 -> r1
#2:	       or	r12, 0 -> r2
	;;
#0:	       or	r3, r1 -> r10
#1:	       ldi	0 -> r1
#2:	       ldi	0 -> r3
	;;
#0:	       or	r10, 0 -> r0
	;;
#0:	       callg	___muldi3
	;;
#0:	       or	r1, 0 -> r0
#1:	       ldi	0 -> r1
#2:	       or	r10, 0 -> r2
#3:	       ldi	0 -> r3
	;;
#3:	       sub	r3.24, r0 -> r0
	;;
	       nop	0
	;;
#0:	       sl	r0.23, 11 -> r3
#1:	       or	r0, 0 -> r2
#2:	       or	r1, 0 -> r1
	;;
#0:	       callg	___muldi3
#1:	       sl	r1, 1 -> r1
#2:	       sr	r2, 31 -> r2
	;;
#0:	       or	r2, r1 -> r0
#1:	       or	r3, 0 -> r2
#2:	       ldi	0 -> r1
#3:	       ldi	0 -> r3
	;;
#1:	       sub	r0, 1 -> r1.24
	;;
#1:	       or	r1.24, 0 -> r0
	;;
#0:	       callg	___muldi3
	;;
#1:	       or	r1.24, 0 -> r0
#0:	       or	r1, 0 -> r10
#2:	       ldi	0 -> r1
#3:	       or	r12, 0 -> r2
	;;
#0:	       ldi	0 -> r3
	;;
	       nop	0
	;;
#0:	       callg	___muldi3
#1:	       carr	r0, r10 -> r3
#2:	       add	r0, r10 -> r14
	;;
#3:	       borr	r3.24, r14 -> r2
#0:	       add	r1, r3 -> r0
#1:	       ldi	0 -> r1
#2:	       ldi	0 -> r3
	;;
#3:	       sub	r3.24, r0 -> r0
	;;
#0:	       sub	r0, r2 -> r0
#1:	       or	r1.24, 0 -> r2
	;;
#0:	       callg	___muldi3
	;;
#1:	       or	r1.24, 0 -> r2
#0:	       or	r0, 0 -> r12
#2:	       or	r1, 0 -> r10
#3:	       ldi	0 -> r1
	;;
#3:	       sub	r3.24, r14 -> r0
#0:	       ldi	0 -> r3
	;;
	       nop	0
	;;
#1:	       sl	r1.23, 2 -> r1.24
#0:	       or	r1, 0 -> r2
#2:	       ldi	-2 -> r3
#3:	       ldi	0 -> r1
	;;
#0:	       carr	r12, r2 -> r0
#2:	       add	r12, r2 -> r12
#1:	       or	r1.24, 0 -> r2
	;;
#0:	       callg	___muldi3
#1:	       add	r10, r0 -> r0
#2:	       carr	r12, r3 -> r3
	;;
#0:	       add	r0, r3 -> r0
#1:	       ldi	0 -> r3
	;;
#0:	       sub	r0, 1 -> r10
	;;
#0:	       or	r10, 0 -> r0
	;;
#1:	       or	r1, 0 -> r1.25
#2:	       or	r0, 0 -> r2.23
#0:	       sl	r11, 2 -> r3
#3:	       ldih	2 -> r13
	;;
#0:	       callg	___muldi3
#1:	       sr	r1.23, 30 -> r1
	;;
#0:	       or	r1, r3 -> r0
#1:	       ldi	0 -> r1
#2:	       ldi	0 -> r3
	;;
#0:	       or	r0, r13 -> r13
#1:	       or	r10, 0 -> r0
	;;
#0:	       or	r13, 0 -> r2
	;;
#0:	       callg	___muldi3
	;;
#0:	       sub	r12, 2 -> r14
#1:	       or	r0, 0 -> r11
#2:	       or	r1, 0 -> r10
#3:	       ldi	0 -> r1
	;;
#0:	       or	r14, 0 -> r0
#1:	       or	r13, 0 -> r2
#2:	       ldi	0 -> r3
	;;
	       nop	0
	;;
#0:	       ldiu	2047 -> r12
#1:	       or	r0, 0 -> r13
#2:	       or	r1, 0 -> r0
#3:	       ldi	-4 -> r3
	;;
#1:	       sub	r1.27, r1.26 -> r1
#2:	       and	r2.23, r3 -> r2.23
#0:	       ldim	1023 -> r12
#3:	       add	r0, r11 -> r2
	;;
#0:	       callg	___muldi3
	;;
#3:	       add	r3.23, r1 -> r3.23
#1:	       carr	r2, r1.25 -> r1
#0:	       carr	r0, r11 -> r0
#2:	       ldi	0 -> r3
	;;
#0:	       add	r10, r0 -> r0
#1:	       add	r2, r1.25 -> r10
	;;
#1:	       or	r1.24, 0 -> r2
#0:	       add	r0, r1 -> r11
#2:	       or	r14, 0 -> r0
#3:	       ldi	0 -> r1
	;;
#0:	       or	r1, 0 -> r0
	;;
#2:	       carr	r0, r2.23 -> r1
	;;
#2:	       add	r0, r2.23 -> r0
	;;
#0:	       carr	r0, r13 -> r0
	;;
#0:	       add	r1, r0 -> r1
	;;
#0:	       carr	r10, r1 -> r0
#1:	       add	r10, r1 -> r10
	;;
#0:	       add	r11, r0 -> r11
	;;
#0:	       cmpu gt	r11, r12 -> c1
	;;
#0:	if  c1 br @	.BB33_12
	;;
.BB33_8:
#0:	       or	r0.23, 0 -> r2
#1:	       callg	___muldi3
#2:	       or	r10, 0 -> r0
#3:	       or	r11, 0 -> r1
	;;
#0:	       or	r0.24, 0 -> r3
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       br	.BB33_13
#3:	       sub	r3.23, 1 -> r3.23
#2:	       or	r0, 0 -> r3
#1:	       sl	r1.23, 21 -> r0
	;;
#3:	       borr	r3.24, r3 -> r2
#0:	       sub	r0, r1 -> r0
	;;
#3:	       sub	r3.24, r3 -> r1
#0:	       sub	r0, r2 -> r2
	;;
.BB33_9:
#0:	       ldga	1048576 -> r0
	;;
#0:	       ldih	1023 -> r0
	;;
#0:	       xor	r1, r0 -> r2
	;;
#1:	       or	r1.23, r2 -> r2
	;;
#0:	       brz ne @	r2, .BB33_17
	;;
.BB33_10:
#0:	       xor	r10, r0 -> r0
#1:	       fop	dnan -> d0
	;;
#0:	       or	r0.23, r0 -> r0
	;;
#0:	       cmp eq	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB33_30
	;;
.BB33_11:
#0:	       ldm.s	r15, 4
#1:	       ldga	1048576 -> r1
#2:	       add	r15, 24 -> r3
	;;
#0:	       ldih	1023 -> r1
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       or	r0, r1 -> r2
#1:	       or	r3, 4 -> r1
#2:	       ldi	0 -> r0
	;;
#0:	       br	.BB33_28
#1:	       stm.a	r2, r1, 0
	;;
#0:	       stm.a	r0, r15, 6
	;;
#0:	       ldm.f	r15, 24
	;;
.BB33_12:
#0:	       callg	___muldi3
	;;
#0:	       or	r0.23, 0 -> r2
#1:	       sl	r11, 31 -> r0
#2:	       sr	r10, 1 -> r1
#3:	       sr	r11, 1 -> r11
	;;
#0:	       or	r0.24, 0 -> r3
#1:	       or	r1, r0 -> r10
#2:	       or	r11, 0 -> r1
	;;
#0:	       or	r10, 0 -> r0
	;;
#0:	       or	r0, 0 -> r3
#1:	       sl	r1.23, 20 -> r0
	;;
#3:	       borr	r3.24, r3 -> r2
#0:	       sub	r0, r1 -> r0
	;;
#3:	       sub	r3.24, r3 -> r1
#0:	       sub	r0, r2 -> r2
	;;
.BB33_13:
#3:	       addi	1023 -> r3.23
#0:	       ldiu	2047 -> r0
	;;
#3:	       cmp lt	r3.23, r0 -> c1
	;;
#0:	if  c1 br @	.BB33_15
	;;
.BB33_14:
#0:	       ldm.s	r15, 4
#1:	       ldga	1048576 -> r1
#2:	       s2add	r15, 8 -> r3
	;;
#0:	       ldih	1023 -> r1
#1:	       add	r3, 16 -> r3
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       or	r0, r1 -> r2
#1:	       or	r3, 4 -> r1
#2:	       ldi	0 -> r0
	;;
#0:	       br	.BB33_28
#1:	       stm.a	r2, r1, 0
	;;
#0:	       stm.a	r0, r15, 12
	;;
#0:	       ldm.f	r15, 48
	;;
.BB33_15:
#3:	       brz le @	r3.23, .BB33_19
	;;
.BB33_16:
#0:	       add	r1, r1 -> r0
#1:	       carr	r1, r1 -> r1
#2:	       add	r2, r2 -> r2
#3:	       ldm.s	r15, 4
	;;
#0:	       cmpu gt	r0, r0.23 -> c1
#1:	       add	r2, r1 -> r0
#2:	       s2add	r15, 16 -> r4
	;;
#0:	       cmp eq	r0, r0.24 -> c2
	;;
#0:	if !c2 cmpu gt	r0, r0.24 -> c1 ; aacf
#1:	       ldiu	2047 -> r0
	;;
#0:	       ldim	511 -> r0
#1:	       ldx	$c1 -> r3
	;;
#0:	       and	r11, r0 -> r2
#1:	       carr	r10, r3 -> r3
#2:	if  c1 add	r10, 1 -> r10
	;;
#3:	       sl	r3.23, 20 -> r0
	;;
#0:	       or	r0, r2 -> r1
#1:	       add	r4, 0 -> r2
	;;
#0:	       add	r1, r3 -> r1
#1:	       or	r31, 0 -> r3
#2:	       or	r2, 4 -> r2
	;;
#0:	       or	r1, r3 -> r0
#1:	       ldi	0 -> r3
	;;
#0:	       stm.a	r0, r2, 0
#1:	       or	r10, r3 -> r0
	;;
#0:	       br	.BB33_29
#1:	       stm.a	r0, r15, 16
	;;
#0:	       ldm.f	r15, 64
	;;
#0:	       stx	r31 -> $f0
#1:	       ldm.f	r2, 0
	;;
.BB33_17:
#0:	       xor	r10, r0 -> r0
	;;
#0:	       or	r0.23, r0 -> r0
	;;
#0:	       brz ne @	r0, .BB33_20
	;;
.BB33_18:
#0:	       s2add	r15, 8 -> r2
#1:	       ldm.s	r15, 4
#2:	       ldi	0 -> r3
	;;
#0:	       add	r2, 0 -> r0
	;;
#0:	       or	r0, 4 -> r1
#1:	       or	r31, 0 -> r2
	;;
#0:	       br	.BB33_28
#1:	       stm.a	r2, r1, 0
	;;
#0:	       stm.a	r3, r15, 8
	;;
#0:	       ldm.f	r15, 32
	;;
.BB33_19:
#0:	       s2add	r15, 8 -> r2
#1:	       ldm.s	r15, 4
#2:	       ldi	0 -> r3
	;;
#0:	       add	r2, 24 -> r0
	;;
#0:	       or	r0, 4 -> r1
#1:	       or	r31, 0 -> r2
	;;
#0:	       br	.BB33_28
#1:	       stm.a	r2, r1, 0
	;;
#0:	       stm.a	r3, r15, 14
	;;
#0:	       ldm.f	r15, 56
	;;
.BB33_20:
#1:	       or	r1.23, r1 -> r0
	;;
#0:	       brz eq @	r0, .BB33_25
	;;
.BB33_21:
#0:	       or	r0.23, r10 -> r0
	;;
#0:	       brz eq @	r0, .BB33_27
	;;
.BB33_22:
#3:	       ldi	0 -> r3.23
#0:	       ldiu	2047 -> r14
	;;
#0:	       ldim	511 -> r14
	;;
#0:	       cmpu gt	r1, r14 -> c1
	;;
#0:	if  c1 br @	.BB33_33
	;;
.BB33_23:
#0:	       brz eq @	r11, .BB33_31
	;;
.BB33_24:
#0:	       bbh	clz r11 -> r13
#1:	       br @	.BB33_32
	;;
.BB33_25:
#0:	       or	r0.23, r10 -> r0
#1:	       fop	dnan -> d0
	;;
#0:	       brz eq @	r0, .BB33_30
	;;
.BB33_26:
#0:	       s2add	r15, 8 -> r2
#1:	       ldm.s	r15, 4
#2:	       ldi	0 -> r3
	;;
#0:	       add	r2, 8 -> r0
	;;
#0:	       or	r0, 4 -> r1
#1:	       or	r31, 0 -> r2
	;;
#0:	       br	.BB33_28
#1:	       stm.a	r2, r1, 0
	;;
#0:	       stm.a	r3, r15, 10
	;;
#0:	       ldm.f	r15, 40
	;;
.BB33_27:
#0:	       ldm.s	r15, 4
#1:	       ldga	1048576 -> r1
#2:	       s2add	r15, 16 -> r3
	;;
#0:	       ldih	1023 -> r1
#1:	       add	r3, 8 -> r3
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       or	r0, r1 -> r2
#1:	       or	r3, 4 -> r1
#2:	       ldi	0 -> r0
	;;
#0:	       stm.a	r2, r1, 0
	;;
#0:	       stm.a	r0, r15, 18
	;;
#0:	       ldm.f	r15, 72
	;;
.BB33_28:
#0:	       stx	r31 -> $f0
#1:	       ldm.f	r1, 0
	;;
.BB33_29:
#0:	       stx	r31 -> $f2
	;;
#0:	       fop	fmov	f2 -> f1
	;;
.BB33_30:
#0:	       ldm.s	r15, 100
	;;
#0:	       stx	r31 -> $ro
#1:	       ldm.s	r15, 104
	;;
#0:	       stx	r31 -> $rb
#1:	       ldm.s	r15, 108
	;;
#1:	       or	r31, 0 -> r1.27
#0:	       ldm.s	r15, 112
	;;
#1:	       or	r31, 0 -> r1.26
#0:	       ldm.s	r15, 116
	;;
#1:	       or	r31, 0 -> r1.25
#0:	       ldm.s	r15, 120
	;;
#3:	       or	r31, 0 -> r3.24
#0:	       ldm.s	r15, 124
	;;
#1:	       or	r31, 0 -> r1.24
#0:	       ldm.s	r15, 128
	;;
#0:	       or	r31, 0 -> r0.24
#1:	       ldm.s	r15, 132
	;;
#3:	       or	r31, 0 -> r3.23
#0:	       ldm.s	r15, 136
	;;
#2:	       or	r31, 0 -> r2.23
#0:	       ldm.s	r15, 140
	;;
#1:	       or	r31, 0 -> r1.23
#0:	       ldm.s	r15, 144
	;;
#0:	       or	r31, 0 -> r0.23
#1:	       ldm.s	r15, 148
	;;
#0:	       or	r31, 0 -> r14
#1:	       ldm.s	r15, 152
	;;
#0:	       or	r31, 0 -> r13
#1:	       ldm.s	r15, 156
	;;
#0:	       or	r31, 0 -> r12
#1:	       ldm.s	r15, 160
	;;
#0:	       or	r31, 0 -> r11
#1:	       ldm.s	r15, 164
#2:	       addi	184 -> r15
	;;
#0:	       jop	ret
#1:	       or	r31, 0 -> r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB33_31:
#1:	       bbh	clz r1.23 -> r0
	;;
#0:	       s2add	r0, 8 -> r13
	;;
.BB33_32:                               ; %normalize.exit3
#1:	       or	r1.23, 0 -> r0
#0:	       callg	___ashldi3
#2:	       sub	r13, 11 -> r2
#3:	       or	r11, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#1:	       or	r0, 0 -> r1.23
#0:	       ldi	12 -> r0
#2:	       or	r1, 0 -> r11
	;;
#3:	       sub	r0, r13 -> r3.23
	;;
.BB33_33:
#0:	       cmpu gt	r10, r14 -> c1
	;;
#0:	if  c1 br @	.BB33_7
	;;
.BB33_34:
#0:	       brz eq @	r12, .BB33_36
	;;
.BB33_35:
#0:	       bbh	clz r12 -> r10
#1:	       br @	.BB33_37
	;;
.BB33_36:
#0:	       bbh	clz r0.23 -> r0
	;;
#0:	       s2add	r0, 8 -> r10
	;;
.BB33_37:                               ; %normalize.exit
#0:	       or	r0.23, 0 -> r0
#1:	       callg	___ashldi3
#2:	       sub	r10, 11 -> r2
#3:	       or	r12, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#1:	       br	.BB33_7
#0:	       or	r0, 0 -> r0.23
#3:	       add	r3.23, r10 -> r0
#2:	       or	r1, 0 -> r12
	;;
#3:	       sub	r0, 12 -> r3.23
	;;
	       nop	0
	;;
	.align	4
___divdf3_end:
.tmp33:
	.size	___divdf3, .tmp33-___divdf3

	.globl	___divdi3
	.type	___divdi3,@function
___divdi3:                              ; @__divdi3
	.funsz	___divdi3_end-___divdi3
___divdi3_start:
; BB#0:
#0:	       wb.s	r15, 12
#1:	       addi	-48 -> r15
#2:	       ldx	$rb, 0 -> r8
	;;
#0:	       stm.s	r10, r15, 5
#1:	       or	r3, 0 -> r10
	;;
#0:	       stm.s	r11, r15, 4
#1:	       or	r1, 0 -> r11
#2:	       sra	r10, 31 -> r5
	;;
#0:	       sra	r11, 31 -> r7
#1:	       xor	r5, r2 -> r2
#2:	       stm.s	r8, r15, 3
#3:	       ldx	$ro, 0 -> r8
	;;
#0:	       xor	r7, r0 -> r6
#1:	       xor	r7, r11 -> r3
#2:	       stm.s	r8, r15, 2
	;;
#0:	       callg	___udivmoddi4
	;;
#0:	       sub	r3, r7 -> r0
#1:	       borr	r6, r7 -> r1
#2:	       xor	r5, r10 -> r3
#3:	       stm.a	0, r15, 0
	;;
#0:	       sub	r0, r1 -> r4
#1:	       borr	r2, r5 -> r1
#2:	       sub	r3, r5 -> r0
#3:	       sub	r2, r5 -> r2
	;;
#0:	       sub	r0, r1 -> r3
#1:	       sub	r6, r7 -> r0
#2:	       or	r4, 0 -> r1
	;;
#0:	       ldm.s	r15, 8
#1:	       xor	r10, r11 -> r2
	;;
#0:	       sra	r2, 31 -> r3
	;;
#0:	       stx	r31 -> $ro
#1:	       ldm.s	r15, 12
#2:	       xor	r0, r3 -> r2
#3:	       xor	r1, r3 -> r1
	;;
#0:	       borr	r2, r3 -> r0
#1:	       sub	r1, r3 -> r1
	;;
#0:	       stx	r31 -> $rb
#1:	       ldm.s	r15, 16
#2:	       sub	r1, r0 -> r1
#3:	       sub	r2, r3 -> r0
	;;
#0:	       or	r31, 0 -> r11
#1:	       ldm.s	r15, 20
#2:	       addi	48 -> r15
	;;
#0:	       jop	ret
#1:	       or	r31, 0 -> r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
___divdi3_end:
.tmp34:
	.size	___divdi3, .tmp34-___divdi3

	.globl	___divsf3
	.type	___divsf3,@function
___divsf3:                              ; @__divsf3
	.funsz	___divsf3_end-___divsf3
___divsf3_start:
; BB#0:
#0:	       wb.s	r15, 18
#1:	       addi	-72 -> r15
#2:	       stx	r0 -> $f0
#3:	       ldiu	0 -> r0
	;;
#0:	       stm.s	r10, r15, 13
#1:	       ldx	$f0 -> r5
#2:	       ldih	1024 -> r0
#3:	       ldiu	2047 -> r4
	;;
#0:	       stm.s	r11, r15, 12
#1:	       stx	r1 -> $f0
#2:	       ldim	1023 -> r4
#3:	       ldx	$rb, 0 -> r8
	;;
#0:	       stm.s	r12, r15, 11
#1:	       ldx	$f0 -> r6
#2:	       or	r4, 0 -> r3
	;;
#0:	       stm.s	r13, r15, 10
#1:	       xor	r6, r5 -> r1
#2:	       ldih	3 -> r3
#3:	       sr	r6, 23 -> r2
	;;
#0:	       stm.s	r14, r15, 9
#1:	       and	r1, r0 -> r11
#2:	       sr	r5, 23 -> r0
#3:	       ldx	$ro, 0 -> r14
	;;
#0:	       stm.s	r0.23, r15, 8
#1:	       bbh	zext8 r0 -> r13
#2:	       ldi	253 -> r0
#3:	       and	r6, r3 -> r7
	;;
#1:	       stm.s	r1.23, r15, 7
#0:	       sub	r13, 1 -> r1
#2:	       and	r5, r3 -> r12
	;;
#2:	       stm.s	r2.23, r15, 6
#0:	       cmpu gt	r1, r0 -> c1
	;;
#3:	       stm.s	r3.23, r15, 5
	;;
#0:	       stm.s	r0.24, r15, 4
	;;
#0:	       stm.s	r0.25, r15, 3
	;;
#1:	if  c1 br	.BB35_2
#0:	       stm.s	r0.26, r15, 2
	;;
#0:	       stm.s	r8, r15, 1
	;;
#0:	       stm.s	r14, r15, 0
#1:	       bbh	zext8 r2 -> r14
	;;
.BB35_1:
#0:	       ldi	0 -> r0.23
#1:	       sub	r14, 1 -> r1
#2:	       ldi	254 -> r0
	;;
#0:	       cmpu lt	r1, r0 -> c1
	;;
#0:	if  c1 br @	.BB35_14
	;;
.BB35_2:
#0:	       ldiu	1 -> r0
#1:	       ldih	1023 -> r4
	;;
#0:	       and	r5, r4 -> r1
#1:	       ldih	1020 -> r0
	;;
#0:	       cmpu lt	r1, r0 -> c1
	;;
#0:	if  c1 br @	.BB35_4
	;;
.BB35_3:
#0:	       ldiu	0 -> r0
#1:	       br	.BB35_20
	;;
#0:	       ldih	2 -> r0
	;;
#0:	       or	r5, r0 -> r0
	;;
.BB35_4:
#0:	       and	r6, r4 -> r3
	;;
#0:	       cmpu lt	r3, r0 -> c1
	;;
#0:	if  c1 br @	.BB35_6
	;;
.BB35_5:
#0:	       ldiu	0 -> r0
#1:	       br	.BB35_20
	;;
#0:	       ldih	2 -> r0
	;;
#0:	       or	r6, r0 -> r0
	;;
.BB35_6:
#0:	       ldiu	0 -> r0
	;;
#0:	       ldih	1020 -> r0
	;;
#0:	       cmp ne	r1, r0 -> c1
	;;
#0:	if  c1 br @	.BB35_9
	;;
.BB35_7:
#0:	       cmp eq	r3, r0 -> c1
#1:	       fop	fnan -> f0
	;;
#0:	if  c1 br @	.BB35_21
	;;
.BB35_8:
#0:	       ldiu	0 -> r0
#1:	       br	.BB35_20
	;;
#0:	       ldih	1020 -> r0
	;;
#0:	       or	r11, r0 -> r0
	;;
.BB35_9:
#0:	       cmp ne	r3, r0 -> c1
	;;
#0:	if  c1 br @	.BB35_11
	;;
.BB35_10:
#0:	       stx	r11 -> $f0
#1:	       br @	.BB35_21
	;;
.BB35_11:
#0:	       cmp eq	r1, 0 -> c3
	;;
#0:	if  c3 br @	.BB35_23
	;;
.BB35_12:
#0:	       brz eq @	r3, .BB35_8
	;;
.BB35_13:
#0:	       ldi	0 -> r0.23
#1:	       ldiu	2047 -> r2
	;;
#0:	       ldim	1023 -> r2
	;;
#0:	       ldih	3 -> r2
	;;
#0:	       cmpu gt	r1, r2 -> c1
	;;
#0:	if !c1 bbh	clz r12 -> r1
#1:	if !c1 ldi	9 -> r0
	;;
#0:	if !c1 sub	r0, r1 -> r0.23
#1:	if !c1 sub	r1, 8 -> r1
	;;
#0:	if !c1 sl	r12, r1 -> r12
#1:	       cmpu gt	r3, r2 -> c1
	;;
#0:	if !c1 bbh	clz r7 -> r1
	;;
#0:	if !c1 add	r0.23, r1 -> r0
#1:	if !c1 sub	r1, 8 -> r3
	;;
#0:	if !c1 sub	r0, 9 -> r0.23
#1:	if !c1 sl	r7, r3 -> r7
	;;
.BB35_14:
#3:	       ldiu	0 -> r3.23
#0:	       ldi	0 -> r0.24
#1:	       ldiu	0 -> r0
#2:	       ldi	0 -> r1
	;;
#0:	       ldih	4 -> r0
#1:	       ldi	0 -> r3
	;;
#0:	       or	r7, r0 -> r10
#1:	       ldiu	819 -> r0
	;;
#1:	       callg	___muldi3
#0:	       sl	r10, 8 -> r0.25
#2:	       ldim	158 -> r0
	;;
#0:	       or	r0.25, 0 -> r2
#1:	       ldih	936 -> r0
	;;
#0:	       sub	r0, r0.25 -> r0.26
	;;
#0:	       or	r0.26, 0 -> r0
	;;
#0:	       callg	___muldi3
	;;
#0:	       or	r0.26, 0 -> r2
#1:	       or	r1, 0 -> r0
#2:	       ldi	0 -> r1
#3:	       ldi	0 -> r3
	;;
#0:	       sub	r0.24, r0 -> r0
	;;
	       nop	0
	;;
#0:	       callg	___muldi3
#1:	       or	r0, 0 -> r2
#2:	       or	r1, 0 -> r3
	;;
#1:	       sl	r3, 1 -> r1
#2:	       sr	r2, 31 -> r0
#0:	       or	r0.25, 0 -> r2
#3:	       ldi	0 -> r3
	;;
#1:	       or	r0, r1 -> r1.23
#0:	       ldi	0 -> r1
	;;
#1:	       or	r1.23, 0 -> r0
	;;
#0:	       callg	___muldi3
	;;
#1:	       or	r1.23, 0 -> r2
#0:	       or	r1, 0 -> r0
#2:	       ldi	0 -> r1
#3:	       ldi	0 -> r3
	;;
#0:	       sub	r0.24, r0 -> r0
	;;
	       nop	0
	;;
#0:	       callg	___muldi3
#1:	       or	r0, 0 -> r2
#2:	       or	r1, 0 -> r3
	;;
#1:	       sl	r3, 1 -> r1
#2:	       sr	r2, 31 -> r0
#0:	       or	r0.25, 0 -> r2
#3:	       ldi	0 -> r3
	;;
#2:	       or	r0, r1 -> r2.23
#0:	       ldi	0 -> r1
	;;
#2:	       or	r2.23, 0 -> r0
	;;
#0:	       callg	___muldi3
	;;
#2:	       or	r2.23, 0 -> r2
#0:	       or	r1, 0 -> r0
#1:	       ldi	0 -> r1
#3:	       ldi	0 -> r3
	;;
#0:	       sub	r0.24, r0 -> r0
	;;
	       nop	0
	;;
#3:	       ldih	8 -> r3.23
#0:	       or	r0, 0 -> r2
#1:	       sl	r12, 1 -> r0
#2:	       sl	r1, 1 -> r1
	;;
#0:	       callg	___muldi3
#3:	       or	r0, r3.23 -> r3
#1:	       sr	r2, 31 -> r2
	;;
#0:	       or	r2, r1 -> r0
#1:	       or	r3, 0 -> r2
#2:	       ldi	0 -> r1
#3:	       ldi	0 -> r3
	;;
#0:	       sub	r0, 2 -> r0
	;;
	       nop	0
	;;
#0:	       or	r1, 0 -> r2
#1:	       ldiu	2047 -> r1
#2:	       sub	r13, r14 -> r0
	;;
#0:	       add	r0.23, r0 -> r3
#1:	       ldim	1023 -> r1
	;;
#0:	       ldih	7 -> r1
	;;
#0:	       cmpu gt	r2, r1 -> c1
	;;
#0:	if  c1 br @	.BB35_16
	;;
.BB35_15:
#1:	       mul	r2, r10 -> $mul1.0
#0:	       br	.BB35_17
#2:	       sl	r12, 24 -> r0
#3:	       sub	r3, 1 -> r3
	;;
#1:	       ldx	$mul1.0, 0 -> r1
	;;
#0:	       sub	r0, r1 -> r1
	;;
.BB35_16:
#0:	       sr	r2, 1 -> r2
#1:	       sl	r12, 23 -> r0
	;;
#0:	       mul	r2, r10 -> $mul0.0
	;;
#0:	       ldx	$mul0.0, 0 -> r1
	;;
#0:	       sub	r0, r1 -> r1
	;;
.BB35_17:
#0:	       addi	127 -> r3
#1:	       ldi	255 -> r0
	;;
#0:	       cmp lt	r3, r0 -> c1
	;;
#0:	if !c1 br @	.BB35_8
	;;
.BB35_18:
#0:	       brz le @	r3, .BB35_22
	;;
.BB35_19:
#0:	       ldiu	2047 -> r0
#1:	       sl	r1, 1 -> r1
	;;
#0:	       ldim	1023 -> r0
#1:	       cmpu gt	r1, r10 -> c1
#2:	       sl	r3, 23 -> r1
	;;
#0:	       ldih	3 -> r0
	;;
#0:	       and	r2, r0 -> r0
	;;
#0:	       or	r0, r1 -> r0
	;;
#0:	if  c1 add	r0, 1 -> r0
	;;
#0:	       or	r0, r11 -> r0
	;;
.BB35_20:
#0:	       stx	r0 -> $f0
	;;
.BB35_21:
#0:	       ldm.s	r15, 0
	;;
#0:	       stx	r31 -> $ro
#1:	       ldm.s	r15, 4
	;;
#0:	       stx	r31 -> $rb
#1:	       ldm.s	r15, 8
	;;
#0:	       or	r31, 0 -> r0.26
#1:	       ldm.s	r15, 12
	;;
#0:	       or	r31, 0 -> r0.25
#1:	       ldm.s	r15, 16
	;;
#0:	       or	r31, 0 -> r0.24
#1:	       ldm.s	r15, 20
	;;
#3:	       or	r31, 0 -> r3.23
#0:	       ldm.s	r15, 24
	;;
#2:	       or	r31, 0 -> r2.23
#0:	       ldm.s	r15, 28
	;;
#1:	       or	r31, 0 -> r1.23
#0:	       ldm.s	r15, 32
	;;
#0:	       or	r31, 0 -> r0.23
#1:	       ldm.s	r15, 36
	;;
#0:	       or	r31, 0 -> r14
#1:	       ldm.s	r15, 40
	;;
#0:	       or	r31, 0 -> r13
#1:	       ldm.s	r15, 44
	;;
#0:	       or	r31, 0 -> r12
#1:	       ldm.s	r15, 48
	;;
#0:	       or	r31, 0 -> r11
#1:	       ldm.s	r15, 52
#2:	       addi	72 -> r15
	;;
#0:	       jop	ret
#1:	       or	r31, 0 -> r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB35_22:
#0:	       stx	r11 -> $f0
#1:	       br @	.BB35_21
	;;
.BB35_23:
#0:	       fop	fnan -> f0
#1:	       brz eq @	r3, .BB35_21
	;;
.BB35_24:
#0:	       stx	r11 -> $f0
#1:	       br @	.BB35_21
	;;
	.align	4
___divsf3_end:
.tmp35:
	.size	___divsf3, .tmp35-___divsf3

	.globl	___lshrdi3
	.type	___lshrdi3,@function
___lshrdi3:                             ; @__lshrdi3
	.funsz	___lshrdi3_end-___lshrdi3
___lshrdi3_start:
; BB#0:
#0:	       or	r2, 0 -> r3
	;;
#0:	       btest	r3, 5 -> !c1
	;;
#0:	if !c1 br @	.BB36_4
	;;
.BB36_1:
#0:	       brz eq @	r3, .BB36_3
	;;
.BB36_2:
#0:	       sr	r0, r3 -> r2
#1:	       ldi	32 -> r0
	;;
#0:	       sub	r0, r3 -> r0
	;;
#0:	       sl	r1, r0 -> r0
#1:	       sr	r1, r3 -> r1
	;;
#0:	       or	r0, r2 -> r0
	;;
.BB36_3:
#0:	       jop	ret
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB36_4:
#0:	       addi	-32 -> r3
#1:	       jop	ret
	;;
#0:	       sr	r1, r3 -> r0
#1:	       ldi	0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
___lshrdi3_end:
.tmp36:
	.size	___lshrdi3, .tmp36-___lshrdi3

	.globl	___moddi3
	.type	___moddi3,@function
___moddi3:                              ; @__moddi3
	.funsz	___moddi3_end-___moddi3
___moddi3_start:
; BB#0:
#0:	       or	r3, 0 -> r5
#1:	       wb.s	r15, 16
#2:	       addi	-64 -> r15
#3:	       or	r2, 0 -> r3
	;;
#0:	       or	r1, 0 -> r2
#1:	       stm.s	r10, r15, 9
#2:	       or	r0, 0 -> r1
#3:	       sra	r5, 31 -> r6
	;;
#0:	       sra	r2, 31 -> r10
#1:	       stm.s	r11, r15, 8
#2:	       ldx	$rb, 0 -> r8
#3:	       add	r15, 16 -> r11
	;;
#0:	       xor	r10, r1 -> r7
#1:	       xor	r10, r2 -> r2
#2:	       stm.s	r8, r15, 7
#3:	       ldx	$ro, 0 -> r8
	;;
#0:	       sub	r2, r10 -> r0
#1:	       borr	r7, r10 -> r1
#2:	       xor	r6, r3 -> r2
#3:	       xor	r6, r5 -> r3
	;;
#0:	       callg	___udivmoddi4
	;;
#0:	       sub	r0, r1 -> r4
#1:	       borr	r2, r6 -> r0
#2:	       sub	r3, r6 -> r1
#3:	       stm.s	r8, r15, 6
	;;
#0:	       sub	r1, r0 -> r3
#1:	       sub	r7, r10 -> r0
#2:	       sub	r2, r6 -> r2
#3:	       or	r4, 0 -> r1
	;;
#0:	       stm.a	r11, r15, 0
	;;
#0:	       ldm.f	r15, 16
#1:	       or	r11, 4 -> r0
	;;
#0:	       xor	r31, r10 -> r2
#1:	       ldm.f	r0, 0
	;;
#0:	       borr	r2, r10 -> r1
	;;
#0:	       xor	r31, r10 -> r0
#1:	       ldm.s	r15, 24
	;;
#0:	       sub	r0, r10 -> r0
	;;
#0:	       stx	r31 -> $ro
#1:	       ldm.s	r15, 28
#2:	       sub	r0, r1 -> r1
#3:	       sub	r2, r10 -> r0
	;;
#0:	       stx	r31 -> $rb
#1:	       ldm.s	r15, 32
	;;
#0:	       or	r31, 0 -> r11
#1:	       ldm.s	r15, 36
#2:	       addi	64 -> r15
	;;
#0:	       jop	ret
#1:	       or	r31, 0 -> r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
___moddi3_end:
.tmp37:
	.size	___moddi3, .tmp37-___moddi3

	.globl	___modsi3
	.type	___modsi3,@function
___modsi3:                              ; @__modsi3
	.funsz	___modsi3_end-___modsi3
___modsi3_start:
; BB#0:
#3:	       or	r0, 0 -> r3.16
#0:	       or	r1, 0 -> r3
#1:	       ldi	0 -> r1
	;;
#3:	       cmp eq	r3.16, 0 -> c2
#0:	       cmp eq	r3, 0 -> c1
	;;
#0:	       comb	or c1, c2 -> c1
	;;
#0:	if  c1 br @	.BB38_8
	;;
.BB38_1:
#3:	       sra	r3.16, 31 -> r2
#0:	       sra	r3, 31 -> r1
	;;
#0:	       xor	r1, r3 -> r0
	;;
#0:	       sub	r0, r1 -> r9
#1:	       ldi	0 -> r1
	;;
#3:	       xor	r2, r3.16 -> r0
#0:	       bbh	clz r9 -> r6
	;;
#0:	       sub	r0, r2 -> r4
	;;
#0:	       bbh	clz r4 -> r5
	;;
#0:	       sub	r6, r5 -> r2
	;;
#0:	       cmpu gt	r2, 31 -> c1
	;;
#0:	if  c1 br @	.BB38_8
	;;
.BB38_2:
#0:	       cmpu eq	r2, 31 -> c1
	;;
#0:	if  c1 br @	.BB38_7
	;;
.BB38_3:
#0:	       ldi	31 -> r0
#1:	       ldi	0 -> r8
	;;
#0:	       sub	r0, r2 -> r0
	;;
#0:	       sl	r4, r0 -> r7
#1:	       add	r2, 1 -> r0
	;;
#0:	       brz eq @	r0, .BB38_6
	;;
.BB38_4:                                ; %.lr.ph.i.i
#0:	       sub	r5, 1 -> r2
#1:	       sr	r4, r0 -> r1
#2:	       ldi	0 -> r8
	;;
#0:	       sub	r2, r6 -> r5
#1:	       sub	r9, 1 -> r6
	;;
.BB38_5:                                ; =>This Inner Loop Header: Depth=1
#0:	       sl	r1, 1 -> r1
#1:	       sr	r7, 31 -> r0
#2:	       add	r5, 1 -> r5
	;;
#0:	       or	r0, r1 -> r4
	;;
#0:	       sub	r6, r4 -> r0
	;;
#0:	       brz ne	r5, .BB38_5
#1:	       sra	r0, 31 -> r2
#2:	       sl	r7, 1 -> r0
	;;
#0:	       and	r2, r9 -> r1
#1:	       or	r0, r8 -> r7
#2:	       and	r2, 1 -> r8
	;;
#0:	       sub	r4, r1 -> r1
	;;
.BB38_6:                                ; %._crit_edge.i.i
#0:	       sl	r7, 1 -> r0
#1:	       br	.BB38_8
	;;
#0:	       or	r0, r8 -> r1
	;;
	       nop	0
	;;
.BB38_7:
#0:	       or	r4, 0 -> r1
	;;
.BB38_8:                                ; %__divsi3.exit
#3:	       xor	r3, r3.16 -> r0
	;;
#0:	       sra	r0, 31 -> r0
	;;
#0:	       xor	r1, r0 -> r1
	;;
#0:	       jop	ret
#1:	       sub	r1, r0 -> r0
	;;
#0:	       mul	r0, r3 -> $mul0.0
	;;
#0:	       ldx	$mul0.0, 0 -> r0
	;;
#3:	       sub	r3.16, r0 -> r0
	;;
	.align	4
___modsi3_end:
.tmp38:
	.size	___modsi3, .tmp38-___modsi3

	.globl	___muldi3
	.type	___muldi3,@function
___muldi3:                              ; @__muldi3
	.funsz	___muldi3_end-___muldi3
___muldi3_start:
; BB#0:
#1:	       mul	r1, r2 -> $mul1.0
#0:	       or	r0, 0 -> r6
#2:	       sr	r2, 16 -> r5
#3:	       bbh	zext16 r2 -> r1
	;;
#2:	       mul	r3, r6 -> $mul2.0
#1:	       ldx	$mul1.0, 0 -> r0
#0:	       sr	r6, 16 -> r4
#3:	       bbh	zext16 r6 -> r3
	;;
#0:	       mul	r5, r4 -> $mul0.0
#3:	       mul	r1, r4 -> $mul3.0
#1:	       mul	r5, r3 -> $mul1.0
	;;
#0:	       ldx	$mul0.0, r0 -> r0
	;;
#0:	       mul	r1, r3 -> $mul0.0
#2:	       ldx	$mul2.0, r0 -> r0
	;;
#0:	       ldx	$mul0.0, 0 -> r4
	;;
#0:	       sr	r4, 16 -> r1
	;;
#3:	       ldx	$mul3.0, r1 -> r2
	;;
#0:	       sr	r2, 16 -> r1
	;;
#0:	       add	r0, r1 -> r0
#1:	       bbh	zext16 r2 -> r1
	;;
#1:	       ldx	$mul1.0, r1 -> r1
	;;
#0:	       jop	ret
#1:	       sr	r1, 16 -> r1
	;;
#0:	       add	r0, r1 -> r1
#1:	       ldx	$mul1.0, r2 -> r0
#2:	       bbh	zext16 r4 -> r2
	;;
#0:	       sl	r0, 16 -> r0
	;;
#0:	       or	r0, r2 -> r0
	;;
	.align	4
___muldi3_end:
.tmp39:
	.size	___muldi3, .tmp39-___muldi3

	.globl	___udivdi3
	.type	___udivdi3,@function
___udivdi3:                             ; @__udivdi3
	.funsz	___udivdi3_end-___udivdi3
___udivdi3_start:
; BB#0:
#0:	       wb.s	r15, 10
#1:	       addi	-40 -> r15
#2:	       ldx	$rb, 0 -> r4
#3:	       ldx	$ro, 0 -> r9
	;;
#0:	       callg	___udivmoddi4
	;;
#0:	       stm.s	r4, r15, 3
	;;
#0:	       stm.s	r9, r15, 2
	;;
#0:	       stm.a	0, r15, 0
	;;
#0:	       ldm.s	r15, 8
	;;
#0:	       stx	r31 -> $ro
#1:	       ldm.s	r15, 12
#2:	       addi	40 -> r15
	;;
#0:	       stx	r31 -> $rb
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
.tmp40:
	.size	___udivdi3, .tmp40-___udivdi3

	.globl	___udivsi3
	.type	___udivsi3,@function
___udivsi3:                             ; @__udivsi3
	.funsz	___udivsi3_end-___udivsi3
___udivsi3_start:
; BB#0:
#0:	       or	r1, 0 -> r8
#1:	       cmp eq	r0, 0 -> c2
#2:	       ldi	0 -> r1
	;;
#0:	       cmp eq	r8, 0 -> c1
	;;
#0:	       comb	or c1, c2 -> c1
	;;
#0:	if  c1 br @	.BB41_7
	;;
.BB41_1:
#0:	       bbh	clz r0 -> r3
#1:	       bbh	clz r8 -> r4
#2:	       ldi	0 -> r1
	;;
#0:	       sub	r4, r3 -> r2
	;;
#0:	       cmpu gt	r2, 31 -> c1
	;;
#0:	if  c1 br @	.BB41_7
	;;
.BB41_2:
#0:	       cmpu eq	r2, 31 -> c1
	;;
#0:	if  c1 br @	.BB41_8
	;;
.BB41_3:
#0:	       ldi	31 -> r1
#1:	       ldi	0 -> r6
	;;
#0:	       sub	r1, r2 -> r1
	;;
#0:	       sl	r0, r1 -> r7
#1:	       add	r2, 1 -> r1
	;;
#0:	       brz eq @	r1, .BB41_6
	;;
.BB41_4:                                ; %.lr.ph
#0:	       sub	r3, 1 -> r3
#1:	       sr	r0, r1 -> r1
#2:	       sub	r8, 1 -> r5
#3:	       ldi	0 -> r6
	;;
#0:	       sub	r3, r4 -> r4
	;;
.BB41_5:                                ; =>This Inner Loop Header: Depth=1
#0:	       sl	r1, 1 -> r1
#1:	       sr	r7, 31 -> r0
#2:	       add	r4, 1 -> r4
	;;
#0:	       or	r0, r1 -> r2
	;;
#0:	       sub	r5, r2 -> r0
	;;
#0:	       brz ne	r4, .BB41_5
#1:	       sra	r0, 31 -> r3
#2:	       sl	r7, 1 -> r0
	;;
#0:	       and	r3, r8 -> r1
#1:	       or	r0, r6 -> r7
#2:	       and	r3, 1 -> r6
	;;
#0:	       sub	r2, r1 -> r1
	;;
.BB41_6:                                ; %._crit_edge
#0:	       sl	r7, 1 -> r0
	;;
#0:	       or	r0, r6 -> r1
	;;
.BB41_7:
#0:	       or	r1, 0 -> r0
	;;
.BB41_8:
#0:	       jop	ret
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
___udivsi3_end:
.tmp41:
	.size	___udivsi3, .tmp41-___udivsi3

	.globl	___umoddi3
	.type	___umoddi3,@function
___umoddi3:                             ; @__umoddi3
	.funsz	___umoddi3_end-___umoddi3
___umoddi3_start:
; BB#0:
#0:	       wb.s	r15, 16
#1:	       addi	-64 -> r15
#2:	       ldx	$rb, 0 -> r4
	;;
#0:	       stm.s	r10, r15, 9
#1:	       ldx	$ro, 0 -> r10
	;;
#0:	       callg	___udivmoddi4
	;;
#0:	       stm.s	r4, r15, 8
	;;
#0:	       stm.s	r10, r15, 7
#1:	       add	r15, 16 -> r10
	;;
#0:	       stm.a	r10, r15, 0
	;;
#0:	       or	r10, 4 -> r0
	;;
#0:	       ldm.f	r0, 0
	;;
#0:	       or	r31, 0 -> r1
#1:	       ldm.f	r15, 16
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldm.s	r15, 28
	;;
#0:	       stx	r31 -> $ro
#1:	       ldm.s	r15, 32
	;;
#0:	       stx	r31 -> $rb
#1:	       ldm.s	r15, 36
#2:	       addi	64 -> r15
	;;
#0:	       jop	ret
#1:	       or	r31, 0 -> r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
___umoddi3_end:
.tmp42:
	.size	___umoddi3, .tmp42-___umoddi3

	.globl	___umodsi3
	.type	___umodsi3,@function
___umodsi3:                             ; @__umodsi3
	.funsz	___umodsi3_end-___umodsi3
___umodsi3_start:
; BB#0:
#0:	       or	r1, 0 -> r8
#1:	       or	r0, 0 -> r9
#2:	       ldi	0 -> r1
	;;
#0:	       cmp eq	r9, 0 -> c2
#1:	       cmp eq	r8, 0 -> c1
	;;
#0:	       comb	or c1, c2 -> c1
	;;
#0:	if  c1 br @	.BB43_7
	;;
.BB43_1:
#0:	       bbh	clz r9 -> r2
#1:	       bbh	clz r8 -> r3
#2:	       ldi	0 -> r1
	;;
#0:	       sub	r3, r2 -> r0
	;;
#0:	       cmpu gt	r0, 31 -> c1
	;;
#0:	if  c1 br @	.BB43_7
	;;
.BB43_2:
#0:	       cmpu eq	r0, 31 -> c1
#1:	       or	r9, 0 -> r1
	;;
#0:	if  c1 br @	.BB43_7
	;;
.BB43_3:
#0:	       ldi	31 -> r1
#1:	       ldi	0 -> r6
	;;
#0:	       sub	r1, r0 -> r1
#1:	       add	r0, 1 -> r0
	;;
#0:	       brz eq @	r0, .BB43_6
#1:	       sl	r9, r1 -> r7
	;;
.BB43_4:                                ; %.lr.ph.i
#0:	       sub	r2, 1 -> r2
#1:	       sr	r9, r0 -> r1
#2:	       sub	r8, 1 -> r5
#3:	       ldi	0 -> r6
	;;
#0:	       sub	r2, r3 -> r4
	;;
.BB43_5:                                ; =>This Inner Loop Header: Depth=1
#0:	       sl	r1, 1 -> r1
#1:	       sr	r7, 31 -> r0
#2:	       add	r4, 1 -> r4
	;;
#0:	       or	r0, r1 -> r2
	;;
#0:	       sub	r5, r2 -> r0
	;;
#0:	       brz ne	r4, .BB43_5
#1:	       sra	r0, 31 -> r3
#2:	       sl	r7, 1 -> r0
	;;
#0:	       and	r3, r8 -> r1
#1:	       or	r0, r6 -> r7
#2:	       and	r3, 1 -> r6
	;;
#0:	       sub	r2, r1 -> r1
	;;
.BB43_6:                                ; %._crit_edge.i
#0:	       sl	r7, 1 -> r0
	;;
#0:	       or	r0, r6 -> r1
	;;
.BB43_7:                                ; %__udivsi3.exit
#0:	       mul	r1, r8 -> $mul0.0
#1:	       jop	ret
	;;
#0:	       ldx	$mul0.0, 0 -> r0
	;;
#0:	       sub	r9, r0 -> r0
	;;
	       nop	0
	;;
	.align	4
___umodsi3_end:
.tmp43:
	.size	___umodsi3, .tmp43-___umodsi3

	.globl	___divsi3
	.type	___divsi3,@function
___divsi3:                              ; @__divsi3
	.funsz	___divsi3_end-___divsi3
___divsi3_start:
; BB#0:
#1:	       or	r0, 0 -> r1.16
#0:	       or	r1, 0 -> r9
#2:	       ldi	0 -> r1
	;;
#1:	       cmp eq	r1.16, 0 -> c2
#0:	       cmp eq	r9, 0 -> c1
	;;
#0:	       comb	or c1, c2 -> c1
	;;
#0:	if  c1 br @	.BB44_8
	;;
.BB44_1:
#1:	       sra	r1.16, 31 -> r0
#0:	       sra	r9, 31 -> r2
	;;
#0:	       xor	r2, r9 -> r1
	;;
#0:	       sub	r1, r2 -> r8
#1:	       xor	r0, r1.16 -> r1
	;;
#0:	       sub	r1, r0 -> r2
#1:	       bbh	clz r8 -> r4
#2:	       ldi	0 -> r1
	;;
#0:	       bbh	clz r2 -> r3
	;;
#0:	       sub	r4, r3 -> r0
	;;
#0:	       cmpu gt	r0, 31 -> c1
	;;
#0:	if  c1 br @	.BB44_8
	;;
.BB44_2:
#0:	       cmpu eq	r0, 31 -> c1
	;;
#0:	if  c1 br @	.BB44_7
	;;
.BB44_3:
#0:	       ldi	31 -> r1
#1:	       ldi	0 -> r6
	;;
#0:	       sub	r1, r0 -> r1
#1:	       add	r0, 1 -> r0
	;;
#0:	       brz eq @	r0, .BB44_6
#1:	       sl	r2, r1 -> r7
	;;
.BB44_4:                                ; %.lr.ph.i
#0:	       sub	r3, 1 -> r3
#1:	       sr	r2, r0 -> r1
#2:	       sub	r8, 1 -> r5
#3:	       ldi	0 -> r6
	;;
#0:	       sub	r3, r4 -> r4
	;;
.BB44_5:                                ; =>This Inner Loop Header: Depth=1
#0:	       sl	r1, 1 -> r1
#1:	       sr	r7, 31 -> r0
#2:	       add	r4, 1 -> r4
	;;
#0:	       or	r0, r1 -> r2
	;;
#0:	       sub	r5, r2 -> r0
	;;
#0:	       brz ne	r4, .BB44_5
#1:	       sra	r0, 31 -> r3
#2:	       sl	r7, 1 -> r0
	;;
#0:	       and	r3, r8 -> r1
#1:	       or	r0, r6 -> r7
#2:	       and	r3, 1 -> r6
	;;
#0:	       sub	r2, r1 -> r1
	;;
.BB44_6:                                ; %._crit_edge.i
#0:	       sl	r7, 1 -> r0
#1:	       br	.BB44_8
	;;
#0:	       or	r0, r6 -> r1
	;;
	       nop	0
	;;
.BB44_7:
#0:	       or	r2, 0 -> r1
	;;
.BB44_8:                                ; %__udivsi3.exit
#1:	       xor	r9, r1.16 -> r0
#0:	       jop	ret
	;;
#0:	       sra	r0, 31 -> r2
	;;
#0:	       xor	r1, r2 -> r0
	;;
#0:	       sub	r0, r2 -> r0
	;;
	.align	4
___divsi3_end:
.tmp44:
	.size	___divsi3, .tmp44-___divsi3

	.type	___udivmoddi4,@function
___udivmoddi4:                          ; @__udivmoddi4
	.funsz	___udivmoddi4_end-___udivmoddi4
___udivmoddi4_start:
; BB#0:
#0:	       wb.s	r15, 12
#1:	       addi	-48 -> r15
#2:	       ldx	$rb, 0 -> r4
	;;
#0:	       stm.s	r10, r15, 7
	;;
#0:	       stm.s	r11, r15, 6
#1:	       or	r3, 0 -> r11
	;;
#0:	       stm.s	r12, r15, 5
#1:	       or	r2, 0 -> r12
	;;
#0:	       stm.s	r13, r15, 4
#1:	       or	r1, 0 -> r13
	;;
#0:	       stm.s	r14, r15, 3
#1:	       ldx	$ro, 0 -> r14
	;;
#0:	       brz eq	r13, .BB45_5
#1:	       ldm.f	r15, 48
	;;
#0:	       stm.s	r4, r15, 2
	;;
#0:	       stm.s	r14, r15, 1
#1:	       or	r0, 0 -> r14
#2:	       or	r31, 0 -> r10
	;;
.BB45_1:
#0:	       brz eq @	r12, .BB45_9
	;;
.BB45_2:
#0:	       brz eq @	r11, .BB45_18
	;;
.BB45_3:
#0:	       bbh	clz r13 -> r1
#1:	       bbh	clz r11 -> r0
#2:	       ldi	32 -> r3
	;;
#0:	       sub	r0, r1 -> r2
	;;
#0:	       cmpu lt	r2, r3 -> c1
	;;
#0:	if !c1 br @	.BB45_13
	;;
.BB45_4:
#0:	       ldi	31 -> r0
#1:	       add	r2, 1 -> r3
	;;
#0:	       sub	r0, r2 -> r8
#1:	       sub	r2, 31 -> r2
#2:	       sr	r14, r3 -> r1
#3:	       sr	r13, r3 -> r6
	;;
#0:	       br	.BB45_35
#1:	       sra	r2, 31 -> r2
#2:	       sl	r13, r8 -> r4
#3:	       sl	r14, r8 -> r8
	;;
#0:	       and	r1, r2 -> r0
#1:	       and	r6, r2 -> r7
	;;
#0:	       or	r0, r4 -> r5
	;;
.BB45_5:
#0:	       brz ne @	r11, .BB45_15
	;;
.BB45_6:
#0:	       brz eq @	r10, .BB45_8
	;;
.BB45_7:
#0:	       or	r14, 0 -> r0
#1:	       callg	___umodsi3
#2:	       or	r12, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       stm.a	r0, r10, 0
	;;
#0:	       stm.a	0, r10, 1
	;;
.BB45_8:                                ; %._crit_edge88
#0:	       or	r14, 0 -> r0
#1:	       callg	___udivsi3
#2:	       or	r12, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       br @	.BB45_26
	;;
.BB45_9:
#0:	       brz eq @	r11, .BB45_20
	;;
.BB45_10:
#0:	       brz eq @	r14, .BB45_23
	;;
.BB45_11:
#0:	       sub	r11, 1 -> r1
	;;
#0:	       and	r1, r11 -> r0
	;;
#0:	       brz eq @	r0, .BB45_31
	;;
.BB45_12:
#0:	       bbh	clz r13 -> r1
#1:	       bbh	clz r11 -> r0
	;;
#0:	       sub	r0, r1 -> r1
	;;
#0:	       cmpu lt	r1, 31 -> c1
	;;
#0:	if  c1 br @	.BB45_34
	;;
.BB45_13:
#0:	       cmp eq	r10, 0 -> c3
#1:	       ldi	0 -> r3
#2:	       ldi	0 -> r11
	;;
#0:	if  c3 br @	.BB45_43
	;;
.BB45_14:
#0:	       stm.a	r14, r10, 0
#1:	       br	.BB45_17
	;;
#0:	       stm.a	r13, r10, 1
	;;
	       nop	0
	;;
.BB45_15:
#0:	       cmp eq	r10, 0 -> c3
#1:	       ldi	0 -> r3
#2:	       ldi	0 -> r11
	;;
#0:	if  c3 br @	.BB45_43
	;;
.BB45_16:
#0:	       stm.a	r14, r10, 0
	;;
#0:	       stm.a	0, r10, 1
	;;
.BB45_17:
#0:	       ldi	0 -> r3
#1:	       br @	.BB45_43
#2:	       ldi	0 -> r11
	;;
.BB45_18:
#0:	       sub	r12, 1 -> r1
	;;
#0:	       and	r1, r12 -> r0
	;;
#0:	       brz eq @	r0, .BB45_27
	;;
.BB45_19:
#0:	       bbh	clz r12 -> r0
#1:	       bbh	clz r13 -> r1
#2:	       ldi	31 -> r2
	;;
#0:	       addi	33 -> r0
	;;
#0:	       sub	r0, r1 -> r3
#1:	       ldi	64 -> r0
	;;
#0:	       or	r3, 0 -> r0.16
#1:	       sub	r0, r3 -> r9
#2:	       sub	r2, r3 -> r2
	;;
#0:	       addi	-32 -> r0.16
#1:	       sl	r13, r9 -> r0
#2:	       sra	r2, 31 -> r4
	;;
#0:	       sr	r14, r0.16 -> r1
	;;
#0:	       sr	r13, r0.16 -> r6
#1:	       or	r0, r1 -> r7
#2:	       or	r3, 0 -> r0
#3:	       ldi	32 -> r1
	;;
#0:	       sub	r1, r3 -> r5
#1:	       addi	-33 -> r0
#2:	       and	r4, r6 -> r4
	;;
#0:	       sl	r14, r5 -> r2
#1:	       sra	r0, 31 -> r0
#2:	       sra	r5, 31 -> r1
	;;
#0:	       and	r2, r0 -> r8
#1:	       sr	r14, r3 -> r2
#2:	       sl	r13, r5 -> r0
#3:	       and	r7, r1 -> r7
	;;
#1:	       or	r0, r2 -> r0
#0:	       sra	r0.16, 31 -> r2
#2:	       or	r7, r8 -> r8
	;;
#0:	       and	r0, r2 -> r0
	;;
#0:	       br	.BB45_36
#1:	       or	r4, r0 -> r5
#2:	       sr	r13, r3 -> r0
	;;
#0:	       and	r2, r0 -> r7
#1:	       sl	r14, r9 -> r0
	;;
#2:	       and	r0, r1 -> r2.16
	;;
.BB45_20:
#0:	       brz eq @	r10, .BB45_22
	;;
.BB45_21:
#0:	       stm.a	0, r10, 1
	;;
#0:	       stm.a	0, r10, 0
	;;
.BB45_22:
#0:	       ldi	0 -> r11
#1:	       callg	___udivsi3
#2:	       or	r13, 0 -> r0
#3:	       ldi	0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       br @	.BB45_43
#1:	       or	r0, 0 -> r3
	;;
.BB45_23:
#0:	       brz eq @	r10, .BB45_25
	;;
.BB45_24:
#0:	       or	r13, 0 -> r0
#1:	       callg	___umodsi3
#2:	       or	r11, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       stm.a	r0, r10, 1
	;;
#0:	       stm.a	0, r10, 0
	;;
.BB45_25:
#0:	       or	r13, 0 -> r0
#1:	       callg	___udivsi3
#2:	       or	r11, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB45_26:                               ; %._crit_edge88
#0:	       or	r0, 0 -> r3
#1:	       br @	.BB45_43
#2:	       ldi	0 -> r11
	;;
.BB45_27:
#0:	       brz eq @	r10, .BB45_29
	;;
.BB45_28:
#0:	       and	r1, r14 -> r0
	;;
#0:	       stm.a	r0, r10, 0
	;;
#0:	       stm.a	0, r10, 1
	;;
.BB45_29:
#0:	       cmp eq	r12, 1 -> c1
	;;
#0:	if  c1 br @	.BB45_44
	;;
.BB45_30:
#0:	       bbh	ctz r12 -> r2
#1:	       ldi	32 -> r0
	;;
#0:	       br	.BB45_43
#1:	       sub	r0, r2 -> r0
#2:	       sr	r14, r2 -> r1
#3:	       sr	r13, r2 -> r11
	;;
#0:	       sl	r13, r0 -> r0
	;;
#0:	       or	r0, r1 -> r3
	;;
.BB45_31:
#0:	       brz eq @	r10, .BB45_33
	;;
.BB45_32:
#0:	       stm.a	r14, r10, 0
#1:	       and	r1, r13 -> r0
	;;
#0:	       stm.a	r0, r10, 1
	;;
.BB45_33:
#0:	       bbh	ctz r11 -> r0
#1:	       br	.BB45_43
#2:	       ldi	0 -> r11
	;;
#0:	       sr	r13, r0 -> r3
	;;
	       nop	0
	;;
.BB45_34:
#0:	       ldi	31 -> r0
#1:	       add	r1, 1 -> r3
	;;
#0:	       sub	r0, r1 -> r1
#1:	       sr	r14, r3 -> r2
#2:	       sr	r13, r3 -> r7
	;;
#0:	       sl	r13, r1 -> r0
#1:	       sl	r14, r1 -> r8
	;;
#0:	       or	r0, r2 -> r5
	;;
.BB45_35:
#2:	       ldi	0 -> r2.16
	;;
.BB45_36:                               ; %.preheader
#0:	       ldi	0 -> r1
#1:	       brz eq @	r3, .BB45_40
	;;
.BB45_37:                               ; %.lr.ph
#2:	       sr	r2.16, 31 -> r1
#1:	       sub	r12, 1 -> r1.17
#0:	       ldi	-1 -> r0
#3:	       sr	r5, 31 -> r4
	;;
#0:	       carr	r12, r0 -> r0
#1:	       sl	r7, 1 -> r2
	;;
#3:	       or	r4, r2 -> r3.16
#0:	       add	r11, r0 -> r6
#1:	       sl	r8, 1 -> r0
#2:	       sr	r8, 31 -> r2
	;;
#1:	       sub	r6, 1 -> r1.16
#0:	       or	r1, r0 -> r9
#2:	       ldi	0 -> r1
#3:	       ldi	-2 -> r4
	;;
.BB45_38:                               ; =>This Inner Loop Header: Depth=1
#2:	       sl	r2.16, 1 -> r8
#0:	       sl	r5, 1 -> r0
#1:	       sub	r3, 1 -> r3
	;;
#1:	       or	r2, r0 -> r1.18
#3:	       and	r3.16, r4 -> r2
#2:	       or	r8, r1 -> r2.17
#0:	       sr	r5, 31 -> r0
	;;
#1:	       borr	r1.17, r1.18 -> r6
#0:	       or	r2, r0 -> r7
#2:	       and	r9, r4 -> r8
	;;
#1:	       sub	r1.16, r7 -> r0
	;;
#0:	       sub	r0, r6 -> r0
	;;
#0:	       sra	r0, 31 -> r6
	;;
#0:	       and	r6, r11 -> r0
#1:	       and	r6, r12 -> r5
	;;
#1:	       borr	r1.18, r5 -> r2
#0:	       sub	r7, r0 -> r0
	;;
#1:	       sub	r1.18, r5 -> r5
#0:	       sub	r0, r2 -> r7
#2:	       sr	r2.16, 31 -> r2
	;;
#2:	       sr	r2.17, 31 -> r0
#0:	       or	r8, r2 -> r8
#1:	       sl	r7, 1 -> r13
#3:	       sr	r5, 31 -> r1
	;;
#3:	       or	r1, r13 -> r3.16
#2:	       or	r2.17, 0 -> r2.16
#0:	       sl	r8, 1 -> r2
#1:	       and	r6, 1 -> r1
	;;
#0:	       brz ne	r3, .BB45_38
#1:	       or	r0, r2 -> r0
#2:	       sr	r9, 31 -> r2
	;;
#0:	       or	r0, 0 -> r9
	;;
	       nop	0
	;;
.BB45_39:                               ; %._crit_edge
#0:	       ldi	0 -> r2
#1:	       br @	.BB45_41
	;;
.BB45_40:
#2:	       or	r2.16, 0 -> r2.17
#0:	       or	r1, 0 -> r2
	;;
.BB45_41:
#2:	       add	r2.17, r2.17 -> r0
	;;
#0:	       brz eq	r10, .BB45_43
#1:	       or	r0, r1 -> r3
#2:	       carr	r2.17, r2.17 -> r1
#3:	       add	r8, r8 -> r0
	;;
#0:	       add	r0, r1 -> r0
	;;
#0:	       or	r0, r2 -> r11
	;;
.BB45_42:
#0:	       stm.a	r5, r10, 0
	;;
#0:	       stm.a	r7, r10, 1
	;;
.BB45_43:
#0:	       ldm.s	r15, 4
#1:	       or	r11, 0 -> r1
#2:	       or	r3, 0 -> r0
	;;
#0:	       stx	r31 -> $ro
#1:	       ldm.s	r15, 8
	;;
#0:	       stx	r31 -> $rb
#1:	       ldm.s	r15, 12
	;;
#0:	       or	r31, 0 -> r14
#1:	       ldm.s	r15, 16
	;;
#0:	       or	r31, 0 -> r13
#1:	       ldm.s	r15, 20
	;;
#0:	       or	r31, 0 -> r12
#1:	       ldm.s	r15, 24
	;;
#0:	       or	r31, 0 -> r11
#1:	       ldm.s	r15, 28
#2:	       addi	48 -> r15
	;;
#0:	       jop	ret
#1:	       or	r31, 0 -> r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB45_44:
#0:	       or	r14, 0 -> r3
#1:	       br @	.BB45_43
#2:	       or	r13, 0 -> r11
	;;
	.align	4
___udivmoddi4_end:
.tmp45:
	.size	___udivmoddi4, .tmp45-___udivmoddi4

	.type	_md5_finish.pad,@object ; @md5_finish.pad
	.section	.rodata,"a",@progbits
_md5_finish.pad:
	.ascii	 "\200\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000"
	.size	_md5_finish.pad, 64

	.type	_do_test.test,@object   ; @do_test.test
	.section	.data.rel.ro.local,"aw",@progbits
	.align	4
_do_test.test:
	.long	._.str290
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
	.size	_do_test.test, 56

	.type	._.str1,@object         ; @.str1
	.section	.rodata.str1.1,"aMS",@progbits,1
._.str1:
	.ascii	 "d41d8cd98f00b204e9800998ecf8427e\000"
	.size	._.str1, 33

	.type	._.str2,@object         ; @.str2
._.str2:
	.ascii	 "a\000"
	.size	._.str2, 2

	.type	._.str3,@object         ; @.str3
._.str3:
	.ascii	 "0cc175b9c0f1b6a831c399e269772661\000"
	.size	._.str3, 33

	.type	._.str4,@object         ; @.str4
._.str4:
	.ascii	 "abc\000"
	.size	._.str4, 4

	.type	._.str5,@object         ; @.str5
._.str5:
	.ascii	 "900150983cd24fb0d6963f7d28e17f72\000"
	.size	._.str5, 33

	.type	._.str6,@object         ; @.str6
._.str6:
	.ascii	 "message digest\000"
	.size	._.str6, 15

	.type	._.str7,@object         ; @.str7
._.str7:
	.ascii	 "f96b697d7cb7938d525a2f31aaf161d0\000"
	.size	._.str7, 33

	.type	._.str8,@object         ; @.str8
._.str8:
	.ascii	 "abcdefghijklmnopqrstuvwxyz\000"
	.size	._.str8, 27

	.type	._.str9,@object         ; @.str9
._.str9:
	.ascii	 "c3fcd3d76192e4007dfb496cca67e13b\000"
	.size	._.str9, 33

	.type	._.str10,@object        ; @.str10
._.str10:
	.ascii	 "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789\000"
	.size	._.str10, 63

	.type	._.str11,@object        ; @.str11
._.str11:
	.ascii	 "d174ab98d277d9f5a5611c2c9f419d9f\000"
	.size	._.str11, 33

	.type	._.str12,@object        ; @.str12
._.str12:
	.ascii	 "12345678901234567890123456789012345678901234567890123456789012345678901234567890\000"
	.size	._.str12, 81

	.type	._.str13,@object        ; @.str13
._.str13:
	.ascii	 "57edf4a22be3c955ac49da2e2107b67a\000"
	.size	._.str13, 33

	.type	._.str14,@object        ; @.str14
._.str14:
	.ascii	 "%02x\000"
	.size	._.str14, 5

	.type	._.str15,@object        ; @.str15
._.str15:
	.ascii	 "MD5 (\"%s\") = \000"
	.size	._.str15, 14

	.type	._.str16,@object        ; @.str16
._.str16:
	.ascii	 "**** ERROR, should be: %s\n\000"
	.size	._.str16, 27

	.type	._.str17,@object        ; @.str17
._.str17:
	.ascii	 "md5 self-test completed successfully.\000"
	.size	._.str17, 38

	.type	._.str18,@object        ; @.str18
._.str18:
	.ascii	 "\n\000"
	.size	._.str18, 2

	.type	._.str29,@object        ; @.str29
._.str29:
	.ascii	 "C\000"
	.size	._.str29, 2

	.type	_impure_data,@object    ; @impure_data
	.section	.data.rel.local,"aw",@progbits
	.align	4
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
	.long	._.str29
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
	.size	_impure_data, 1060

	.type	__svfprintf_r.blanks,@object ; @_svfprintf_r.blanks
	.section	.rodata,"a",@progbits
__svfprintf_r.blanks:
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.size	__svfprintf_r.blanks, 16

	.type	__svfprintf_r.zeroes,@object ; @_svfprintf_r.zeroes
__svfprintf_r.zeroes:
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.size	__svfprintf_r.zeroes, 16

	.type	__vfprintf_r.blanks,@object ; @_vfprintf_r.blanks
__vfprintf_r.blanks:
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.byte	32
	.size	__vfprintf_r.blanks, 16

	.type	__vfprintf_r.zeroes,@object ; @_vfprintf_r.zeroes
__vfprintf_r.zeroes:
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.byte	48
	.size	__vfprintf_r.zeroes, 16

	.type	._.str43,@object        ; @.str43
	.section	.rodata.str1.1,"aMS",@progbits,1
._.str43:
	.ascii	 "INF\000"
	.size	._.str43, 4

	.type	._.str144,@object       ; @.str144
._.str144:
	.ascii	 "inf\000"
	.size	._.str144, 4

	.type	._.str245,@object       ; @.str245
._.str245:
	.ascii	 "NAN\000"
	.size	._.str245, 4

	.type	._.str346,@object       ; @.str346
._.str346:
	.ascii	 "nan\000"
	.size	._.str346, 4

	.type	._.str447,@object       ; @.str447
._.str447:
	.ascii	 "0123456789abcdef\000"
	.size	._.str447, 17

	.type	._.str548,@object       ; @.str548
._.str548:
	.ascii	 "(null)\000"
	.size	._.str548, 7

	.type	._.str649,@object       ; @.str649
._.str649:
	.ascii	 "0123456789ABCDEF\000"
	.size	._.str649, 17

	.type	._.str750,@object       ; @.str750
._.str750:
	.ascii	 "bug in vfprintf: bad base\000"
	.size	._.str750, 26

	.type	._.str75,@object        ; @.str75
._.str75:
	.ascii	 "Infinity\000"
	.size	._.str75, 9

	.type	._.str176,@object       ; @.str176
._.str176:
	.ascii	 "NaN\000"
	.size	._.str176, 4

	.type	._.str277,@object       ; @.str277
._.str277:
	.ascii	 "0\000"
	.size	._.str277, 2

	.type	._.str290,@object       ; @.str290
._.str290:
	.byte	0
	.size	._.str290, 1

	.type	._.str391,@object       ; @.str391
._.str391:
	.ascii	 ".\000"
	.size	._.str391, 2

	.type	___malloc_av_,@object   ; @__malloc_av_
	.section	.data.rel.local,"aw",@progbits
	.align	4
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
	.size	___malloc_av_, 1032

	.type	___malloc_sbrk_base,@object ; @__malloc_sbrk_base
	.data
	.align	4
___malloc_sbrk_base:
	.long	4294967295
	.size	___malloc_sbrk_base, 4

	.type	___malloc_max_sbrked_mem,@object ; @__malloc_max_sbrked_mem
	.local	___malloc_max_sbrked_mem
	.comm	___malloc_max_sbrked_mem,4,4
	.type	___malloc_max_total_mem,@object ; @__malloc_max_total_mem
	.local	___malloc_max_total_mem
	.comm	___malloc_max_total_mem,4,4
	.type	___malloc_current_mallinfo.0,@object ; @__malloc_current_mallinfo.0
	.local	___malloc_current_mallinfo.0
	.comm	___malloc_current_mallinfo.0,4,4
	.type	___pow5mult.p05,@object ; @__pow5mult.p05
	.section	.rodata,"a",@progbits
	.align	4
___pow5mult.p05:
	.long	5                       ; 0x5
	.long	25                      ; 0x19
	.long	125                     ; 0x7d
	.size	___pow5mult.p05, 12

	.type	___mprec_tens,@object   ; @__mprec_tens
	.align	4
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
	.size	___mprec_tens, 200

	.type	___mprec_bigtens,@object ; @__mprec_bigtens
	.align	4
___mprec_bigtens:
	.quad	4846369599423283200     ; double 1.000000e+16
	.quad	5085611494797045271     ; double 1.000000e+32
	.quad	5564284217833028085     ; double 1.000000e+64
	.quad	6521906365687930162     ; double 1.000000e+128
	.quad	8436737289693151036     ; double 1.000000e+256
	.size	___mprec_bigtens, 40

	.type	_errno.b,@object        ; @errno.b
	.local	_errno.b
	.comm	_errno.b,1,4
	.type	__sbrk.heap_end,@object ; @_sbrk.heap_end
	.local	__sbrk.heap_end
	.comm	__sbrk.heap_end,4,4
