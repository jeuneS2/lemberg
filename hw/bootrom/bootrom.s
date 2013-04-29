	.file	"bootrom.c"
	.text
	.globl	_main
	.type	_main,@function
_main:
	.funsz	._main_end-_main
._main_start:
#0:	       wb.s	r15, 14
	;;
#0:	       addi	-56 -> r15
	;;
#0:	       stm.s	r14, r15, 0
	;;
#0:	       or	r15, 0 -> r14
	;;
#0:	       stm.s	r10, r14, 9
	;;
#0:	       stm.s	r11, r14, 8
	;;
#0:	       stm.s	r12, r14, 7
	;;
#0:	       stm.s	r13, r14, 6
	;;
#0:	       stm.s	r0.23, r14, 5
	;;
#0:	       ldx	$rb, 0 -> r12
	;;
#0:	       stm.s	r12, r14, 4
	;;
#0:	       ldx	$ro, 0 -> r12
	;;
#0:	       stm.s	r12, r14, 3
	;;
#0:	       ldiu	0 -> r10
	;;
#0:	       ldmg.d	_load_msg
	;;
#0:	       ldim	1024 -> r10
	;;
#0:	       ldga	_printstr -> r1
	;;
#0:	       add	r31, r10 -> r0
	;;
#0:	       add	r1, r10 -> r1
	;;
#0:	       jop	call	r1
	;;
	       nop
	;;
	       nop
	;;
	       nop
	;;
#0:	       ldga	_readint -> r0
	;;
#0:	       add	r0, r10 -> r10
	;;
#0:	       jop	call	r10
	;;
	       nop
	;;
	       nop
	;;
	       nop
	;;
#0:	       jop	call	r10
	;;
#0:	       or	r0, 0 -> r11
	;;
	       nop
	;;
	       nop
	;;
#0:	       or	r0, 0 -> r0.23
	;;
#0:	       ldi	0 -> r3
	;;
#0:	       ldi	-120 -> r0
	;;
#0:	       ldi	-116 -> r1
	;;
#0:	       br	.BB0_2
	;;
#0:	       ldi	0 -> r13
	;;
#0:	       ldi	0 -> r2
	;;
.BB0_1:
#0:	       sr	r12, 8 -> r3
	;;
#0:	       add	r2, 1 -> r2
	;;
#0:	       or	r10, 0 -> r13
	;;
.BB0_2:
#0:	       cmpu ge	r2, r11 -> c1
	;;
#0:	if  c1 br @	.BB0_7
	;;
.BB0_3:
#0:	       ldm.b	r0, 0
	;;
#0:	       bbh	mzext8 0 -> r4
	;;
#0:	       btest	r4, 1 -> !c1
	;;
#0:	if  c1 br @	.BB0_3
	;;
.BB0_4:
#0:	       ldm.b	r1, 0
	;;
#0:	       add	r13, 1 -> r10
	;;
#0:	       bbh	mzext8 r1 -> r4
	;;
#0:	       sl	r4, 24 -> r5
	;;
#0:	       or	r5, r3 -> r12
	;;
#0:	       and	r2, 3 -> r3
	;;
#0:	       cmp ne	r3, 3 -> c1
	;;
#0:	if  c1 br	.BB0_1
	;;
#0:	       stmb.a	r4, r13, 0
	;;
	       nop
	;;
.BB0_5:
#0:	       ldm.b	r13, -3
	;;
#0:	       cmp ne	r12, r31 -> c1
	;;
#0:	if !c1 br @	.BB0_1
	;;
.BB0_6:
#0:	       ldiu	0 -> r11
	;;
#0:	       ldmg.d	_fail_msg
	;;
#0:	       ldim	1024 -> r11
	;;
#0:	       ldga	_printstr -> r1
	;;
#0:	       add	r31, r11 -> r0
	;;
#0:	       add	r1, r11 -> r1
	;;
#0:	       jop	call	r1
	;;
	       nop
	;;
	       nop
	;;
	       nop
	;;
#0:	       ldga	_printint -> r0
	;;
#0:	       add	r0, r11 -> r11
	;;
#0:	       jop	call	r11
	;;
#0:	       or	r10, 0 -> r0
	;;
	       nop
	;;
	       nop
	;;
#0:	       jop	call	r11
	;;
#0:	       ldm.b	r13, -3
	;;
#0:	       or	r31, 0 -> r0
	;;
	       nop
	;;
#0:	       jop	call	r11
	;;
#0:	       or	r12, 0 -> r0
	;;
	       nop
	;;
	       nop
	;;
#0:	       br	.BB0_9
	;;
#0:	       ldi	0 -> r10
	;;
	       nop
	;;
.BB0_7:
#0:	       ldiu	0 -> r1
	;;
#0:	       ldmg.d	_boot_msg
	;;
#0:	       ldim	1024 -> r1
	;;
#0:	       ldga	_printstr -> r2
	;;
#0:	       add	r31, r1 -> r0
	;;
#0:	       add	r2, r1 -> r1
	;;
#0:	       jop	call	r1
	;;
	       nop
	;;
	       nop
	;;
	       nop
	;;
#0:	       jop	call	r0.23
	;;
	       nop
	;;
	       nop
	;;
	       nop
	;;
#0:	       or	r0, 0 -> r10
	;;
.BB0_8:
#0:	       ldiu	0 -> r11
	;;
#0:	       ldmg.d	_exit_msg
	;;
#0:	       ldim	1024 -> r11
	;;
#0:	       ldga	_printstr -> r1
	;;
#0:	       add	r31, r11 -> r0
	;;
#0:	       add	r1, r11 -> r1
	;;
#0:	       jop	call	r1
	;;
	       nop
	;;
	       nop
	;;
	       nop
	;;
#0:	       ldga	_printint -> r0
	;;
#0:	       add	r0, r11 -> r1
	;;
#0:	       jop	call	r1
	;;
#0:	       or	r10, 0 -> r0
	;;
	       nop
	;;
	       nop
	;;
.BB0_9:
#0:	       ldi	-120 -> r0
	;;
.BB0_10:
#0:	       ldm.b	r0, 0
	;;
#0:	       bbh	mzext8 0 -> r1
	;;
#0:	       btest	r1, 0 -> c1
	;;
#0:	if !c1 br @	.BB0_10
	;;
.BB0_11:
#0:	       ldiu	0 -> r3
	;;
#0:	       ldi	-116 -> r0
	;;
#0:	       ldim	1024 -> r3
	;;
#0:	       ldga	_reset -> r1
	;;
#0:	       stmb.a	10, r0, 0
	;;
#0:	       add	r1, r3 -> r0
	;;
#0:	       jop	call	r0
	;;
	       nop
	;;
	       nop
	;;
	       nop
	;;
#0:	       br @	.BB0_8
	;;
	.align	4
._main_end:
.tmp0:
	.size	_main, .tmp0-_main

	.type	_printstr,@function
_printstr:
	.funsz	._printstr_end-_printstr
._printstr_start:
#0:	       ldm.f	r0, 0
	;;
#0:	       bbh	mzext8 r0 -> r1
	;;
#0:	       brz eq @	r1, .BB1_4
	;;
.BB1_1:
#0:	       ldi	-120 -> r1
	;;
#0:	       ldi	-116 -> r2
	;;
.BB1_2:
#0:	       ldm.b	r1, 0
	;;
#0:	       bbh	mzext8 0 -> r3
	;;
#0:	       btest	r3, 0 -> c1
	;;
#0:	if !c1 br @	.BB1_2
	;;
.BB1_3:
#0:	       ldm.f	r0, 0
	;;
#0:	       bbh	mzext8 r0 -> r3
	;;
#0:	       stmb.a	r3, r2, 0
	;;
#0:	       ldm.f	r0, 1
	;;
#0:	       add	r0, 1 -> r3
	;;
#0:	       bbh	mzext8 r3 -> r4
	;;
#0:	       brz ne	r4, .BB1_2
	;;
#0:	       or	r3, 0 -> r0
	;;
	       nop
	;;
.BB1_4:
#0:	       jop	ret
	;;
	       nop
	;;
	       nop
	;;
	       nop
	;;
	.align	4
._printstr_end:
.tmp1:
	.size	_printstr, .tmp1-_printstr

	.type	_readint,@function
_readint:
	.funsz	._readint_end-_readint
._readint_start:
#0:	       ldi	0 -> r1
	;;
#0:	       ldi	-120 -> r2
	;;
#0:	       ldi	-116 -> r3
	;;
#0:	       ldi	0 -> r0
	;;
.BB2_1:
#0:	       ldm.b	r2, 0
	;;
#0:	       bbh	mzext8 0 -> r4
	;;
#0:	       btest	r4, 1 -> !c1
	;;
#0:	if  c1 br @	.BB2_1
	;;
.BB2_2:
#0:	       ldm.b	r3, 0
	;;
#0:	       add	r1, 1 -> r1
	;;
#0:	       cmp ne	r1, 4 -> c1
	;;
#0:	       bbh	mzext8 r3 -> r4
	;;
#0:	       sl	r0, 8 -> r0
	;;
#0:	if  c1 br	.BB2_1
	;;
#0:	       bbh	zext8 r4 -> r4
	;;
#0:	       or	r4, r0 -> r0
	;;
.BB2_3:
#0:	       jop	ret
	;;
	       nop
	;;
	       nop
	;;
	       nop
	;;
	.align	4
._readint_end:
.tmp2:
	.size	_readint, .tmp2-_readint

	.type	_printint,@function
_printint:
	.funsz	._printint_end-_printint
._printint_start:
#0:	       ldi	8 -> r1
	;;
#0:	       ldi	-4 -> r2
	;;
#0:	       ldi	48 -> r3
	;;
#0:	       ldi	87 -> r4
	;;
#0:	       ldi	-120 -> r5
	;;
#0:	       ldi	-116 -> r6
	;;
.BB3_1:
#0:	       s2add	r2, r1 -> r7
	;;
#0:	       sr	r0, r7 -> r7
	;;
#0:	       and	r7, 15 -> r8
	;;
#0:	       or	r8, r3 -> r7
	;;
#0:	       cmpu lt	r8, 10 -> c1
	;;
#0:	if !c1 add	r8, r4 -> r7 ; aaaf
	;;
.BB3_2:
#0:	       ldm.b	r5, 0
	;;
#0:	       bbh	mzext8 0 -> r8
	;;
#0:	       btest	r8, 0 -> c1
	;;
#0:	if !c1 br @	.BB3_2
	;;
.BB3_3:
#0:	       sub	r1, 1 -> r1
	;;
#0:	       brz ne	r1, .BB3_1
	;;
#0:	       stmb.a	r7, r6, 0
	;;
	       nop
	;;
.BB3_4:
#0:	       jop	ret
	;;
	       nop
	;;
	       nop
	;;
	       nop
	;;
	.align	4
._printint_end:
.tmp3:
	.size	_printint, .tmp3-_printint

	.type	_reset,@function
_reset:
	.funsz	._reset_end-_reset
._reset_start:
#0:	       wb.s	r15, 6
	;;
#0:	       addi	-24 -> r15
	;;
#0:	       add	r15, 4 -> r0
	;;
#0:	       stm.a	0, r15, 1
	;;
#0:	       ldiu	2047 -> r1
	;;
#0:	       ldm.b	r0, 0
	;;
#0:	       ldim	15 -> r1
	;;
#0:	       cmpu gt	r31, r1 -> c1
	;;
#0:	if  c1 br @	.BB4_3
	;;
.BB4_1:
#0:	       ldga	32768 -> r1
	;;
.BB4_2:
#0:	       ldm.b	r0, 0
	;;
#0:	       add	r31, 1 -> r2
	;;
#0:	       stm.a	r2, r15, 1
	;;
#0:	       ldm.b	r0, 0
	;;
#0:	       cmpu lt	r31, r1 -> c1
	;;
#0:	if  c1 br @	.BB4_2
	;;
.BB4_3:
#0:	       ldi	-4 -> r0
	;;
#0:	       stm.a	0, r0, 0
	;;
.BB4_4:
#0:	       br @	.BB4_4
	;;
	.align	4
._reset_end:
.tmp4:
	.size	_reset, .tmp4-_reset

	.type	._.str,@object
	.section	.rodata.str1.1,"aMS",@progbits,1
._.str:
	.ascii	 "\nLOAD\n\000"
	.size	._.str, 7

	.type	_load_msg,@object
	.data
	.globl	_load_msg
	.align	4
_load_msg:
	.long	._.str
	.size	_load_msg, 4

	.type	._.str1,@object
	.section	.rodata.str1.1,"aMS",@progbits,1
._.str1:
	.ascii	 "BOOT\n\000"
	.size	._.str1, 6

	.type	_boot_msg,@object
	.data
	.globl	_boot_msg
	.align	4
_boot_msg:
	.long	._.str1
	.size	_boot_msg, 4

	.type	._.str2,@object
	.section	.rodata.str1.1,"aMS",@progbits,1
._.str2:
	.ascii	 "\nEXIT \000"
	.size	._.str2, 7

	.type	_exit_msg,@object
	.data
	.globl	_exit_msg
	.align	4
_exit_msg:
	.long	._.str2
	.size	_exit_msg, 4

	.type	._.str3,@object
	.section	.rodata.str1.1,"aMS",@progbits,1
._.str3:
	.ascii	 "FAIL @\000"
	.size	._.str3, 7

	.type	_fail_msg,@object
	.data
	.globl	_fail_msg
	.align	4
_fail_msg:
	.long	._.str3
	.size	_fail_msg, 4

