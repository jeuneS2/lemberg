	.file	"bootrom.opt.bc"
	.text
	.globl	_main
	.type	_main,@function
_main:                                  ; @main
	.funsz	_main_end-_main
_main_start:
; BB#0:
#0:	       wb.s	r15, 12
	;;
#0:	       addi	-48 -> r15
	;;
#0:	       stm.s	r10, r15, 7
	;;
#0:	       stm.s	r11, r15, 6
	;;
#0:	       stm.s	r12, r15, 5
	;;
#0:	       stm.s	r13, r15, 4
	;;
#0:	       ldiu	0 -> r10
	;;
#0:	       stm.s	r14, r15, 3
	;;
#0:	       ldx	$rb, 0 -> r12
	;;
#0:	       ldim	1024 -> r10
	;;
#0:	       ldga	._.str -> r0
	;;
#0:	       ldga	_printstr -> r1
	;;
#0:	       stm.s	r12, r15, 2
	;;
#0:	       ldx	$ro, 0 -> r12
	;;
#0:	       add	r0, r10 -> r0
	;;
#0:	       add	r1, r10 -> r1
	;;
#0:	       stm.s	r12, r15, 1
	;;
#0:	       jop	call	r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldga	_readint -> r0
	;;
#0:	       add	r0, r10 -> r10
	;;
#0:	       jop	call	r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r11
	;;
#0:	       jop	call	r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r10
	;;
#0:	       ldi	0 -> r1
	;;
#0:	       ldi	0 -> r14
	;;
#0:	       ldi	0 -> r0
	;;
#0:	       br @	.BB0_2
	;;
.BB0_1:                                 ;   in Loop: Header=BB0_2 Depth=1
#0:	       sr	r12, 8 -> r1
	;;
#0:	       add	r0, 1 -> r0
	;;
#0:	       or	r13, 0 -> r14
	;;
.BB0_2:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_3 Depth 2
#0:	       cmpu ge	r0, r11 -> c1
	;;
#0:	if  c1 br @	.BB0_7
	;;
.BB0_3:                                 ; %.preheader1
                                        ;   Parent Loop BB0_2 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldi	-120 -> r2
	;;
#0:	       ldm.b	r2, 0
	;;
#0:	       bbh	mzext8 0 -> r2
	;;
#0:	       btest	r2, 1 -> !c1
	;;
#0:	if  c1 br @	.BB0_3
	;;
.BB0_4:                                 ;   in Loop: Header=BB0_2 Depth=1
#0:	       ldi	-116 -> r2
	;;
#0:	       ldm.b	r2, 0
	;;
#0:	       add	r14, 1 -> r13
	;;
#0:	       bbh	mzext8 r2 -> r2
	;;
#0:	       sl	r2, 24 -> r3
	;;
#0:	       or	r3, r1 -> r12
	;;
#0:	       and	r0, 3 -> r3
	;;
#0:	       cmp ne	r3, 3 -> c1
	;;
#0:	       stmb.a	r2, r14, 0
	;;
#0:	if  c1 br @	.BB0_1
	;;
.BB0_5:                                 ;   in Loop: Header=BB0_2 Depth=1
#0:	       ldm.f	r14, -3
	;;
#0:	       cmp ne	r12, r31 -> c1
	;;
#0:	if !c1 br @	.BB0_1
	;;
.BB0_6:
#0:	       ldiu	0 -> r10
	;;
#0:	       ldim	1024 -> r10
	;;
#0:	       ldga	._.str3 -> r0
	;;
#0:	       ldga	_printstr -> r1
	;;
#0:	       add	r0, r10 -> r0
	;;
#0:	       add	r1, r10 -> r1
	;;
#0:	       jop	call	r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldga	_printint -> r0
	;;
#0:	       add	r0, r10 -> r10
	;;
#0:	       or	r13, 0 -> r0
	;;
#0:	       jop	call	r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldm.f	r14, -3
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       jop	call	r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       or	r12, 0 -> r0
	;;
#0:	       jop	call	r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldi	0 -> r10
	;;
#0:	       br @	.BB0_9
	;;
.BB0_7:
#0:	       ldiu	0 -> r1
	;;
#0:	       ldim	1024 -> r1
	;;
#0:	       ldga	._.str1 -> r0
	;;
#0:	       ldga	_printstr -> r2
	;;
#0:	       add	r0, r1 -> r0
	;;
#0:	       add	r2, r1 -> r1
	;;
#0:	       jop	call	r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       jop	call	r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r10
	;;
.BB0_8:
#0:	       ldiu	0 -> r11
	;;
#0:	       ldim	1024 -> r11
	;;
#0:	       ldga	._.str2 -> r0
	;;
#0:	       ldga	_printstr -> r1
	;;
#0:	       add	r0, r11 -> r0
	;;
#0:	       add	r1, r11 -> r1
	;;
#0:	       jop	call	r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldga	_printint -> r0
	;;
#0:	       add	r0, r11 -> r1
	;;
#0:	       or	r10, 0 -> r0
	;;
#0:	       jop	call	r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB0_9:                                 ; =>This Inner Loop Header: Depth=1
#0:	       ldi	-120 -> r0
	;;
#0:	       ldm.b	r0, 0
	;;
#0:	       bbh	mzext8 0 -> r0
	;;
#0:	       btest	r0, 0 -> c1
	;;
#0:	if !c1 br @	.BB0_9
	;;
.BB0_10:
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
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       br @	.BB0_8
	;;
	.align	4
_main_end:
.tmp0:
	.size	_main, .tmp0-_main

	.type	_printstr,@function
_printstr:                              ; @printstr
	.funsz	_printstr_end-_printstr
_printstr_start:
; BB#0:
#0:	       ldm.f	r0, 0
	;;
#0:	       bbh	mzext8 r0 -> r1
	;;
#0:	       brz eq @	r1, .BB1_3
	;;
.BB1_1:                                 ; =>This Inner Loop Header: Depth=1
#0:	       ldi	-120 -> r1
	;;
#0:	       ldm.b	r1, 0
	;;
#0:	       bbh	mzext8 0 -> r1
	;;
#0:	       btest	r1, 0 -> c1
	;;
#0:	if !c1 br @	.BB1_1
	;;
.BB1_2:                                 ;   in Loop: Header=BB1_1 Depth=1
#0:	       ldm.f	r0, 0
	;;
#0:	       ldi	-116 -> r2
	;;
#0:	       bbh	mzext8 r0 -> r1
	;;
#0:	       stmb.a	r1, r2, 0
	;;
#0:	       ldm.f	r0, 1
	;;
#0:	       add	r0, 1 -> r1
	;;
#0:	       bbh	mzext8 r1 -> r2
	;;
#0:	       or	r1, 0 -> r0
	;;
#0:	       brz ne @	r2, .BB1_1
	;;
.BB1_3:                                 ; %._crit_edge
#0:	       jop	ret
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
_printstr_end:
.tmp1:
	.size	_printstr, .tmp1-_printstr

	.type	_readint,@function
_readint:                               ; @readint
	.funsz	_readint_end-_readint
_readint_start:
; BB#0:
#0:	       ldi	0 -> r1
	;;
#0:	       ldi	0 -> r0
	;;
.BB2_1:                                 ; =>This Inner Loop Header: Depth=1
#0:	       ldi	-120 -> r2
	;;
#0:	       ldm.b	r2, 0
	;;
#0:	       bbh	mzext8 0 -> r2
	;;
#0:	       btest	r2, 1 -> !c1
	;;
#0:	if  c1 br @	.BB2_1
	;;
.BB2_2:                                 ;   in Loop: Header=BB2_1 Depth=1
#0:	       ldi	-116 -> r2
	;;
#0:	       ldm.b	r2, 0
	;;
#0:	       add	r1, 1 -> r1
	;;
#0:	       cmp ne	r1, 4 -> c1
	;;
#0:	       bbh	mzext8 r2 -> r2
	;;
#0:	       sl	r0, 8 -> r0
	;;
#0:	       bbh	zext8 r2 -> r2
	;;
#0:	       or	r2, r0 -> r0
	;;
#0:	if  c1 br @	.BB2_1
	;;
.BB2_3:
#0:	       jop	ret
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
_readint_end:
.tmp2:
	.size	_readint, .tmp2-_readint

	.type	_printint,@function
_printint:                              ; @printint
	.funsz	_printint_end-_printint
_printint_start:
; BB#0:
#0:	       ldi	8 -> r1
	;;
.BB3_1:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB3_2 Depth 2
#0:	       ldi	-4 -> r2
	;;
#0:	       s2add	r2, r1 -> r2
	;;
#0:	       sr	r0, r2 -> r2
	;;
#0:	       and	r2, 15 -> r3
	;;
#0:	       or	r3, 0 -> r2
	;;
#0:	       addi	87 -> r2
	;;
.BB3_2:                                 ; %.preheader
                                        ;   Parent Loop BB3_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldi	-120 -> r4
	;;
#0:	       ldm.b	r4, 0
	;;
#0:	       bbh	mzext8 0 -> r4
	;;
#0:	       btest	r4, 0 -> c1
	;;
#0:	if !c1 br @	.BB3_2
	;;
.BB3_3:                                 ;   in Loop: Header=BB3_1 Depth=1
#0:	       cmpu lt	r3, 10 -> c1
	;;
#0:	       ldi	48 -> r4
	;;
#0:	       sub	r1, 1 -> r1
	;;
#0:	if  c1 or	r3, r4 -> r2 ; aaat
	;;
#0:	       ldi	-116 -> r3
	;;
#0:	       stmb.a	r2, r3, 0
	;;
#0:	       brz ne @	r1, .BB3_1
	;;
.BB3_4:
#0:	       jop	ret
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
_printint_end:
.tmp3:
	.size	_printint, .tmp3-_printint

	.type	_reset,@function
_reset:                                 ; @reset
	.funsz	_reset_end-_reset
_reset_start:
; BB#0:
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
#0:	if  c1 br @	.BB4_2
	;;
.BB4_1:                                 ; %.lr.ph
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.b	r0, 0
	;;
#0:	       add	r31, 1 -> r1
	;;
#0:	       stm.a	r1, r15, 1
	;;
#0:	       ldm.b	r0, 0
	;;
#0:	       ldga	32768 -> r1
	;;
#0:	       cmpu lt	r31, r1 -> c1
	;;
#0:	if  c1 br @	.BB4_1
	;;
.BB4_2:                                 ; %._crit_edge
#0:	       ldi	-4 -> r0
	;;
#0:	       stm.a	0, r0, 0
	;;
.BB4_3:                                 ; =>This Inner Loop Header: Depth=1
#0:	       br @	.BB4_3
	;;
	.align	4
_reset_end:
.tmp4:
	.size	_reset, .tmp4-_reset

	.type	._.str,@object          ; @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
._.str:
	.ascii	 "\nLOAD\n\000"
	.size	._.str, 7

	.type	._.str1,@object         ; @.str1
._.str1:
	.ascii	 "BOOT\n\000"
	.size	._.str1, 6

	.type	._.str2,@object         ; @.str2
._.str2:
	.ascii	 "\nEXIT \000"
	.size	._.str2, 7

	.type	._.str3,@object         ; @.str3
._.str3:
	.ascii	 "FAIL @\000"
	.size	._.str3, 7

