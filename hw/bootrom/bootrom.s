	.file	"bootrom.opt.bc"
	.text
	.globl	_main
	.align	4
_main:                                  ; @main
	.size	_main_end-_main
_main_start:
; BB#0:                                 ; %entry
#0:	       ldiu	48 -> r3
#1:	       wb.s	r15, 12
#2:	       ldga	_printstr -> r0
#3:	       ldga	._.str -> r1
	;;
#0:	       sub	r15, r3 -> r15
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
#0:	       stm.s	r13, r15, 4
#1:	       ldx	$rb, 0 -> r13
	;;
#0:	       stm.s	r13, r15, 3
#1:	       ldx	$ro, 0 -> r13
	;;
#0:	       stm.s	r13, r15, 2
	;;
#0:	       jop	call	r2
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldga	_readint -> r0
#1:	       ldi	0 -> r11
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
#0:	       or	r0, 0 -> r12
	;;
#0:	       jop	call	r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       br @	.BB0_6
#1:	       or	r0, 0 -> r10
#2:	       or	r11, 0 -> r13
	;;
.BB0_1:                                 ;   in Loop: Header=BB0_6 Depth=1
#0:	       add	r13, 1 -> r0
	;;
.BB0_2:                                 ; %bb
                                        ;   Parent Loop BB0_6 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldi	-120 -> r1
	;;
#0:	       ldm.b	r1, 0
	;;
#0:	       ldx	$membu, r1 -> r1
	;;
#0:	       btest	r1, 1 -> c1
	;;
#0:	if !c1 br @	.BB0_2
	;;
.BB0_3:                                 ; %bb2
                                        ;   in Loop: Header=BB0_6 Depth=1
#0:	       ldi	-116 -> r1
#1:	       and	r13, 3 -> r2
	;;
#0:	       ldm.b	r1, 0
#1:	       cmpne	r2, 3 -> c1
	;;
#0:	if  c1 br	.BB0_5
#1:	       ldx	$membu, r1 -> r1
	;;
#0:	       sl	r1, 24 -> r3
#1:	       stmb.a	r1, r13, 0
	;;
#0:	       or	r3, r11 -> r11
	;;
.BB0_4:                                 ; %bb3
                                        ;   in Loop: Header=BB0_6 Depth=1
#0:	       ldm.f	r13, -3
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       cmpne	r11, r1 -> c1
	;;
#0:	if  c1 br @	.BB0_9
	;;
.BB0_5:                                 ; %bb4
                                        ;   in Loop: Header=BB0_6 Depth=1
#0:	       sr	r11, 8 -> r11
#1:	       or	r0, 0 -> r13
	;;
.BB0_6:                                 ; %bb5
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_2 Depth 2
#0:	       cmpult	r13, r12 -> c1
	;;
#0:	if  c1 br @	.BB0_1
	;;
.BB0_7:                                 ; %bb6
#0:	       ldiu	0 -> r11
#1:	       ldga	_printstr -> r0
#2:	       ldga	._.str1 -> r1
	;;
#0:	       ldim	1024 -> r11
	;;
#0:	       add	r0, r11 -> r13
#1:	       add	r1, r11 -> r0
	;;
#0:	       jop	call	r13
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
#0:	       or	r0, 0 -> r13
	;;
.BB0_8:                                 ; %exit
#0:	       ldiu	0 -> r11
#1:	       ldga	_printstr -> r0
#2:	       ldga	._.str2 -> r1
	;;
#0:	       ldim	1024 -> r11
	;;
#0:	       add	r0, r11 -> r2
#1:	       add	r1, r11 -> r0
	;;
#0:	       jop	call	r2
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldga	_printint -> r0
	;;
#0:	       add	r0, r11 -> r11
#1:	       or	r13, 0 -> r0
	;;
#0:	       jop	call	r11
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       br @	.BB0_10
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
#0:	       jop	call	r2
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
#1:	       add	r13, 1 -> r0
	;;
#0:	       jop	call	r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldm.f	r13, -3
#1:	       ldi	0 -> r13
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       jop	call	r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       or	r11, 0 -> r0
	;;
#0:	       jop	call	r10
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
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
#0:	if !c1 br @	.BB0_10
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
#0:	       brz eq @	r1, .BB1_5
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
#0:	if !c1 br @	.BB1_2
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
#0:	       brz eq @	r1, .BB1_5
	;;
.BB1_4:                                 ; %bb.preheader
                                        ;   in Loop: Header=BB1_2 Depth=1
#0:	       br @	.BB1_2
	;;
.BB1_5:                                 ; %return
#0:	       add	r15, 24 -> r15
#1:	       jop	ret
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
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
#0:	if !c1 br @	.BB2_1
	;;
.BB2_2:                                 ; %bb2
                                        ;   in Loop: Header=BB2_1 Depth=1
#0:	       ldi	-116 -> r2
#1:	       sl	r0, 8 -> r0
#2:	       sub	r1, 1 -> r1
	;;
#0:	       brz eq	r1, .BB2_4
#1:	       ldm.b	r2, 0
	;;
#0:	       ldx	$membu, r2 -> r2
	;;
#0:	       or	r2, r0 -> r0
	;;
.BB2_3:                                 ; %bb.preheader
                                        ;   in Loop: Header=BB2_1 Depth=1
#0:	       br @	.BB2_1
	;;
.BB2_4:                                 ; %bb4
#0:	       add	r15, 24 -> r15
#1:	       jop	ret
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
_readint_end:

	.align	4
_printint:                              ; @printint
	.size	_printint_end-_printint
_printint_start:
; BB#0:                                 ; %bb.nph
#0:	       ldi	28 -> r1
#1:	       ldi	87 -> r5
#2:	       wb.s	r15, 6
#3:	       sub	r15, 24 -> r15
	;;
.BB3_1:                                 ; %bb
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB3_2 Depth 2
#0:	       or	r1, 0 -> r2
	;;
#0:	       sr	r0, r2 -> r1
	;;
#0:	       and	r1, 15 -> r3
#1:	       ldi	48 -> r1
	;;
#0:	       or	r3, r1 -> r4
	;;
.BB3_2:                                 ; %bb3
                                        ;   Parent Loop BB3_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldi	-120 -> r1
	;;
#0:	       ldm.b	r1, 0
	;;
#0:	       ldx	$membu, r1 -> r1
	;;
#0:	       btest	r1, 0 -> c1
	;;
#0:	if !c1 br @	.BB3_2
	;;
.BB3_3:                                 ; %bb4
                                        ;   in Loop: Header=BB3_1 Depth=1
#0:	       cmpult	r3, 10 -> c1
#1:	       brz ne	r2, .BB3_1
#2:	       sub	r2, 4 -> r1
	;;
#0:	if !c1 add	r3, r5 -> r4
#1:	       ldi	-116 -> r3
	;;
#0:	       stmb.a	r4, r3, 0
	;;
.BB3_4:                                 ; %return
#0:	       add	r15, 24 -> r15
#1:	       jop	ret
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
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
#1:	       stm.a	0, r15, 1
#2:	       ldim	15 -> r1
	;;
#0:	       ldm.b	r0, 0
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       cmpult	r1, r2 -> c1
	;;
#0:	if  c1 br @	.BB4_3
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
#0:	       stm.a	r1, r15, 1
	;;
#0:	       ldm.b	r0, 0
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       cmpult	r1, r2 -> c1
	;;
#0:	if  c1 br @	.BB4_2
	;;
.BB4_3:                                 ; %bb2
#0:	       ldi	-4 -> r0
	;;
#0:	       stm.a	0, r0, 0
	;;
.BB4_4:                                 ; %bb3
                                        ; =>This Inner Loop Header: Depth=1
#0:	       br @	.BB4_4
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

