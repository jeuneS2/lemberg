	.file	"bootrom.opt.bc"
	.text
	.globl	_main
	.align	4
_main:                                  ; @main
	.size	_main_end-_main
_main_start:
; BB#0:                                 ; %entry
#0:	       ldiu	48 -> r3
#2:	       wb.s	r15, 12
#1:	       ldx	$rb, 0 -> r1.31
#3:	       ldga	_printstr -> r0
	;;
#0:	       sub	r15, r3 -> r15
#2:	       ldx	$ro, 0 -> r2.31
#1:	       ldga	._.str -> r1
	;;
#1:	       stm.s	r1.31, r15, 0
	;;
#2:	       stm.s	r2.31, r15, 1
	;;
#0:	       stm.s	r10, r15, 7
#1:	       ldiu	0 -> r10
	;;
#0:	       stm.s	r11, r15, 6
#1:	       ldim	1024 -> r10
	;;
#0:	       stm.s	r12, r15, 5
#1:	       add	r0, r10 -> r2
#2:	       add	r1, r10 -> r0
	;;
#0:	       stm.s	r0.23, r15, 4
	;;
#3:	       stm.s	r3.23, r15, 3
	;;
#0:	       call	r2
	;;
	       nop	3
	;;
#0:	       ldga	_readint -> r0
	;;
#0:	       add	r0, r10 -> r0.23
#3:	       ldi	0 -> r3.23
	;;
#0:	       call	r0.23
	;;
	       nop	3
	;;
#0:	       or	r0, 0 -> r10
	;;
#0:	       call	r0.23
	;;
	       nop	3
	;;
#1:	       br	.BB0_5
#0:	       or	r0, 0 -> r0.23
#3:	       or	r3.23, 0 -> r11
	;;
	       nop	2
	;;
.BB0_1:                                 ; %bb
                                        ;   Parent Loop BB0_5 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldi	-120 -> r1
	;;
#0:	       ldm.b	r1, 0
	;;
#0:	       ldx	$membu, r1 -> r1
	;;
#0:	       btest	r1, 1 -> c1
	;;
#0:	if !c1 br	.BB0_1
	;;
	       nop	2
	;;
.BB0_2:                                 ; %bb2
                                        ;   in Loop: Header=BB0_5 Depth=1
#0:	       ldi	-116 -> r1
#1:	       and	r11, 3 -> r2
	;;
#0:	       ldm.b	r1, 0
#1:	       cmpne	r2, 3 -> c1
	;;
#0:	if  c1 br	.BB0_4
#1:	       ldx	$membu, r1 -> r1
	;;
#0:	       sl	r1, 24 -> r3
#1:	       stmb.a	r1, r11, 0
	;;
#3:	       or	r3, r3.23 -> r12
	;;
	       nop	0
	;;
.BB0_3:                                 ; %bb3
                                        ;   in Loop: Header=BB0_5 Depth=1
#0:	       ldm.f	r11, -3
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       cmpne	r12, r1 -> c1
	;;
#0:	if  c1 br	.BB0_9
	;;
	       nop	2
	;;
.BB0_4:                                 ; %bb4
                                        ;   in Loop: Header=BB0_5 Depth=1
#3:	       sr	r12, 8 -> r3.23
#0:	       or	r0, 0 -> r11
	;;
.BB0_5:                                 ; %bb5
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_1 Depth 2
#0:	       cmpult	r11, r10 -> c1
	;;
#0:	if !c1 br	.BB0_7
	;;
	       nop	2
	;;
.BB0_6:                                 ;   in Loop: Header=BB0_5 Depth=1
#0:	       add	r11, 1 -> r0
#1:	       br	.BB0_1
	;;
	       nop	2
	;;
.BB0_7:                                 ; %bb6
#0:	       ldiu	0 -> r11
#1:	       ldga	_printstr -> r0
#2:	       ldga	._.str1 -> r1
	;;
#0:	       ldim	1024 -> r11
	;;
#0:	       add	r0, r11 -> r12
#1:	       add	r1, r11 -> r0
	;;
#0:	       call	r12
	;;
	       nop	3
	;;
#0:	       call	r0.23
	;;
	       nop	3
	;;
#0:	       or	r0, 0 -> r11
	;;
.BB0_8:                                 ; %exit
#0:	       ldiu	0 -> r12
#1:	       ldga	_printstr -> r0
#2:	       ldga	._.str2 -> r1
	;;
#0:	       ldim	1024 -> r12
	;;
#0:	       add	r0, r12 -> r2
#1:	       add	r1, r12 -> r0
	;;
#0:	       call	r2
	;;
	       nop	3
	;;
#0:	       ldga	_printint -> r0
	;;
#0:	       add	r0, r12 -> r12
#1:	       or	r11, 0 -> r0
	;;
#0:	       call	r12
	;;
	       nop	3
	;;
#0:	       br	.BB0_10
	;;
	       nop	2
	;;
.BB0_9:                                 ; %fail
#0:	       ldiu	0 -> r10
#1:	       ldga	_printstr -> r0
#2:	       ldga	._.str3 -> r1
	;;
#0:	       ldim	1024 -> r10
	;;
#0:	       add	r0, r10 -> r2
#1:	       add	r1, r10 -> r0
	;;
#0:	       call	r2
	;;
	       nop	3
	;;
#0:	       ldga	_printint -> r0
	;;
#3:	       add	r0, r10 -> r3.23
#0:	       add	r11, 1 -> r0
	;;
#3:	       call	r3.23
	;;
	       nop	3
	;;
#0:	       ldm.f	r11, -3
#1:	       ldi	0 -> r11
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#3:	       call	r3.23
	;;
	       nop	3
	;;
#0:	       or	r12, 0 -> r0
	;;
#3:	       call	r3.23
	;;
	       nop	3
	;;
.BB0_10:                                ; %restart
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldi	-120 -> r0
	;;
#0:	       ldm.b	r0, 0
	;;
#0:	       ldx	$membu, r0 -> r0
	;;
#0:	       btest	r0, 0 -> c1
	;;
#0:	if !c1 br	.BB0_10
	;;
	       nop	2
	;;
.BB0_11:                                ; %bb7
#0:	       ldiu	0 -> r0
#1:	       ldi	-116 -> r1
	;;
#0:	       stmb.a	10, r1, 0
#1:	       ldga	_reset -> r1
#2:	       ldim	1024 -> r0
	;;
#0:	       add	r1, r0 -> r0
	;;
#0:	       call	r0
	;;
	       nop	3
	;;
#0:	       br	.BB0_8
	;;
	       nop	2
	;;
	.align	4
_main_end:

	.align	4
_printstr:                              ; @printstr
	.size	_printstr_end-_printstr
_printstr_start:
; BB#0:                                 ; %entry
#0:	       wb.s	r15, 6
#1:	       sub	r15, 24 -> r15
	;;
#0:	       ldm.f	r0, 0
	;;
#0:	       ldx	$membu, r0 -> r1
	;;
#0:	       cmpeq	r1, 0 -> c1
	;;
#0:	if  c1 ret
#1:	if  c1 add	r15, 24 -> r15
	;;
	       nop	3
	;;
.BB1_1:                                 ; %bb.preheader.preheader
#0:	       add	r0, 1 -> r0
	;;
.BB1_2:                                 ; %bb
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldi	-120 -> r2
	;;
#0:	       ldm.b	r2, 0
	;;
#0:	       ldx	$membu, r2 -> r2
	;;
#0:	       btest	r2, 0 -> c1
	;;
#0:	if !c1 br	.BB1_2
	;;
	       nop	2
	;;
.BB1_3:                                 ; %bb1
                                        ;   in Loop: Header=BB1_2 Depth=1
#0:	       ldi	-116 -> r2
	;;
#0:	       stmb.a	r1, r2, 0
	;;
#0:	       ldm.f	r0, 0
	;;
#0:	       ldx	$membu, r0 -> r1
#1:	       add	r0, 1 -> r0
	;;
#0:	       cmpeq	r1, 0 -> c1
	;;
#0:	if !c1 br	.BB1_2
	;;
	       nop	2
	;;
.BB1_4:                                 ; %return
#0:	       add	r15, 24 -> r15
#1:	       ret
	;;
	       nop	3
	;;
	.align	4
_printstr_end:

	.align	4
_readint:                               ; @readint
	.size	_readint_end-_readint
_readint_start:
; BB#0:                                 ; %bb.nph
#0:	       ldi	4 -> r1
#1:	       ldi	0 -> r0
#2:	       wb.s	r15, 6
#3:	       sub	r15, 24 -> r15
	;;
.BB2_1:                                 ; %bb
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldi	-120 -> r2
	;;
#0:	       ldm.b	r2, 0
	;;
#0:	       ldx	$membu, r2 -> r2
	;;
#0:	       btest	r2, 1 -> c1
	;;
#0:	if !c1 br	.BB2_1
	;;
	       nop	2
	;;
.BB2_2:                                 ; %bb2
                                        ;   in Loop: Header=BB2_1 Depth=1
#0:	       ldi	-116 -> r2
#1:	       sub	r1, 1 -> r1
#2:	       sl	r0, 8 -> r0
	;;
#0:	       ldm.b	r2, 0
#1:	       cmpeq	r1, 0 -> c1
	;;
#0:	if  c1 add	r15, 24 -> r15
	;;
#0:	if  c1 ret
#1:	       ldx	$membu, r2 -> r2
	;;
#0:	       or	r2, r0 -> r0
	;;
	       nop	2
	;;
#0:	       br	.BB2_1
	;;
	       nop	2
	;;
.BB2_3:                                 ; %bb4
	.align	4
_readint_end:

	.align	4
_printint:                              ; @printint
	.size	_printint_end-_printint
_printint_start:
; BB#0:                                 ; %bb.nph
#0:	       ldi	28 -> r1
#1:	       wb.s	r15, 6
#2:	       sub	r15, 24 -> r15
	;;
.BB3_1:                                 ; %bb
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB3_2 Depth 2
#0:	       sr	r0, r1 -> r2
#1:	       ldi	48 -> r3
	;;
#0:	       and	r2, 15 -> r2
	;;
#0:	       or	r2, r3 -> r3
	;;
.BB3_2:                                 ; %bb3
                                        ;   Parent Loop BB3_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#1:	       ldi	-120 -> r1.16
	;;
#1:	       ldm.b	r1.16, 0
	;;
#1:	       ldx	$membu, r1.16 -> r4
	;;
#0:	       btest	r4, 0 -> c1
	;;
#0:	if !c1 br	.BB3_2
	;;
	       nop	2
	;;
.BB3_3:                                 ; %bb4
                                        ;   in Loop: Header=BB3_1 Depth=1
#1:	       ldi	87 -> r1.16
#2:	       cmpult	r2, 10 -> c1
#0:	       sub	r1, 4 -> r0.16
	;;
#1:	       add	r2, r1.16 -> r2
	;;
#1:	if  c1 or	r3, 0 -> r2
#2:	       cmpne	r1, 0 -> c1
#3:	       ldi	-116 -> r3
#0:	       or	r0.16, 0 -> r1
	;;
#0:	       stmb.a	r2, r3, 0
#1:	if !c1 add	r15, 24 -> r15
	;;
#0:	if !c1 ret
	;;
	       nop	3
	;;
#0:	       br	.BB3_1
	;;
	       nop	2
	;;
.BB3_4:                                 ; %return
	.align	4
_printint_end:

	.align	4
_reset:                                 ; @reset
	.size	_reset_end-_reset
_reset_start:
; BB#0:                                 ; %entry
#0:	       wb.s	r15, 6
#1:	       sub	r15, 24 -> r15
#2:	       ldiu	2047 -> r1
	;;
#0:	       add	r15, 4 -> r0
#1:	       ldim	15 -> r1
	;;
#0:	       stm.a	0, r0, 0
	;;
#0:	       ldm.b	r0, 0
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       cmpult	r1, r2 -> c1
	;;
#0:	if  c1 br	.BB4_3
	;;
	       nop	2
	;;
.BB4_1:
#0:	       ldga	32768 -> r2
	;;
.BB4_2:                                 ; %bb
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.b	r0, 0
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       add	r1, 1 -> r1
	;;
#0:	       stm.a	r1, r0, 0
	;;
#0:	       ldm.b	r0, 0
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       cmpult	r1, r2 -> c1
	;;
#0:	if  c1 br	.BB4_2
	;;
	       nop	2
	;;
.BB4_3:                                 ; %bb2
#0:	       ldi	-4 -> r0
	;;
#0:	       stm.a	0, r0, 0
	;;
.BB4_4:                                 ; %bb3
                                        ; =>This Inner Loop Header: Depth=1
#0:	       br	.BB4_4
	;;
	       nop	2
	;;
	.align	4
_reset_end:

	.section	.rodata,"a",@progbits
	.align	4                       ; @.str
._.str:
	.ascii	 "\nLOAD\n\000"

	.align	4                       ; @.str1
._.str1:
	.ascii	 "BOOT\n\000"

	.align	4                       ; @.str2
._.str2:
	.ascii	 "\nEXIT \000"

	.align	4                       ; @.str3
._.str3:
	.ascii	 "FAIL @\000"

