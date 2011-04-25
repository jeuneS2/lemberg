	.file	"bootrom.linked.bc"
	.text
	.globl	_main
	.align	4
_main:                                  ; @main
	.size	_main_end-_main
_main_start:
; BB#0:                                 ; %entry
#0:	       wb.s	r15, 9
#2:	       ldiu	36 -> r0
#1:	       ldx	$rb, 0 -> r1.31
	;;
#0:	       sub	r15, r0 -> r15
#2:	       ldx	$ro, 0 -> r2.31
	;;
#0:	       stm.s	r14, r15, 0
#1:	       or	r15, 0 -> r14
	;;
#1:	       stm.s	r1.31, r15, 1
	;;
#2:	       stm.s	r2.31, r15, 2
	;;
#0:	       stm.s	r10, r14, 8
#1:	       ldi	-120 -> r10
	;;
#0:	       stm.s	r11, r14, 7
#1:	       ldi	-116 -> r11
	;;
#0:	       stm.s	r12, r14, 6
#1:	       ldi	32 -> r12
	;;
#0:	       stm.s	r13, r14, 5
	;;
#2:	       stm.s	r2.23, r14, 4
	;;
.BB0_1:                                 ; %loop
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_27 Depth 2
                                        ;     Child Loop BB0_25 Depth 2
                                        ;     Child Loop BB0_22 Depth 2
                                        ;     Child Loop BB0_18 Depth 2
                                        ;     Child Loop BB0_15 Depth 2
                                        ;       Child Loop BB0_13 Depth 3
                                        ;     Child Loop BB0_9 Depth 2
                                        ;     Child Loop BB0_6 Depth 2
                                        ;     Child Loop BB0_3 Depth 2
#0:	       ldiu	lo11{ ._.str } -> r0
#1:	       ldiu	0 -> r1
	;;
#0:	       ldim	mi10{ ._.str } -> r0
#1:	       ldim	1024 -> r1
	;;
#0:	       ldih	hi11{ ._.str } -> r0
	;;
#0:	       add	r0, r1 -> r2
	;;
#0:	       ldm.f	r2, 0
	;;
#0:	       ldx	$membu, r2 -> r2
	;;
#0:	       cmpeq	r2, 0 -> c1
	;;
#0:	if  c1 br	.BB0_5
	;;
	       nop	2
	;;
; BB#2:                                 ; %loop.bb.preheader_crit_edge
                                        ;   in Loop: Header=BB0_1 Depth=1
#0:	       ldiu	1 -> r2
	;;
#0:	       ldim	1024 -> r2
	;;
#0:	       add	r0, r2 -> r0
	;;
.BB0_3:                                 ; %bb
                                        ;   Parent Loop BB0_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.b	r10, 0
	;;
#0:	       ldx	$membu, r10 -> r2
	;;
#0:	       btest	r2, 0 -> c1
	;;
#0:	if !c1 br	.BB0_3
	;;
	       nop	2
	;;
; BB#4:                                 ; %bb1
                                        ;   in Loop: Header=BB0_3 Depth=2
#0:	       ldm.f	r0, -1
#1:	       sub	r0, 1 -> r2
	;;
#0:	       ldx	$membu, r2 -> r2
	;;
#0:	       stmb.a	r2, r11, 0
	;;
#0:	       ldm.f	r0, 0
	;;
#0:	       ldx	$membu, r0 -> r2
#1:	       add	r0, 1 -> r0
	;;
#0:	       cmpeq	r2, 0 -> c1
	;;
#0:	if !c1 br	.BB0_3
	;;
	       nop	2
	;;
.BB0_5:                                 ; %loop.bb4.preheader_crit_edge
                                        ;   in Loop: Header=BB0_1 Depth=1
#0:	       ldi	4 -> r0
#1:	       ldi	0 -> r2
	;;
.BB0_6:                                 ; %bb4
                                        ;   Parent Loop BB0_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.b	r10, 0
	;;
#0:	       ldx	$membu, r10 -> r3
	;;
#0:	       btest	r3, 1 -> c1
	;;
#0:	if !c1 br	.BB0_6
	;;
	       nop	2
	;;
; BB#7:                                 ; %bb5
                                        ;   in Loop: Header=BB0_6 Depth=2
#0:	       sub	r0, 1 -> r0
#1:	       ldm.b	r11, 0
#2:	       sl	r2, 8 -> r2
	;;
#0:	       cmpne	r0, 0 -> c1
	;;
#0:	if  c1 br	.BB0_6
#1:	       ldx	$membu, r11 -> r3
	;;
#0:	       or	r3, r2 -> r2
	;;
	       nop	1
	;;
; BB#8:                                 ; %bb5.bb8.preheader_crit_edge
                                        ;   in Loop: Header=BB0_1 Depth=1
#0:	       ldi	4 -> r0
#1:	       ldi	0 -> r3
	;;
.BB0_9:                                 ; %bb8
                                        ;   Parent Loop BB0_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.b	r10, 0
	;;
#0:	       ldx	$membu, r10 -> r4
	;;
#0:	       btest	r4, 1 -> c1
	;;
#0:	if !c1 br	.BB0_9
	;;
	       nop	2
	;;
; BB#10:                                ; %bb10
                                        ;   in Loop: Header=BB0_9 Depth=2
#0:	       sub	r0, 1 -> r0
#1:	       ldm.b	r11, 0
#2:	       sl	r3, 8 -> r3
	;;
#0:	       cmpeq	r0, 0 -> c1
	;;
#0:	if !c1 br	.BB0_9
#1:	       ldx	$membu, r11 -> r4
	;;
#0:	       or	r4, r3 -> r3
	;;
	       nop	1
	;;
; BB#11:                                ; %bb12
                                        ;   in Loop: Header=BB0_1 Depth=1
#0:	       cmplt	r2, 1 -> c1
	;;
#0:	if  c1 br	.BB0_16
	;;
	       nop	2
	;;
; BB#12:                                ; %bb12.bb13.preheader_crit_edge
                                        ;   in Loop: Header=BB0_1 Depth=1
#0:	       ldi	0 -> r0
#1:	       br	.BB0_15
	;;
	       nop	2
	;;
.BB0_13:                                ; %bb13
                                        ;   Parent Loop BB0_1 Depth=1
                                        ;     Parent Loop BB0_15 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
#0:	       ldm.b	r10, 0
	;;
#0:	       ldx	$membu, r10 -> r0
	;;
#0:	       btest	r0, 1 -> c1
	;;
#0:	if !c1 br	.BB0_13
	;;
	       nop	2
	;;
; BB#14:                                ; %bb15
                                        ;   in Loop: Header=BB0_15 Depth=2
#0:	       add	r4, 1 -> r0
#1:	       ldm.b	r11, 0
	;;
#0:	       cmpeq	r2, r0 -> c1
	;;
#0:	if  c1 br	.BB0_16
#1:	       ldx	$membu, r11 -> r5
	;;
#0:	       stmb.a	r5, r4, 0
	;;
	       nop	1
	;;
.BB0_15:                                ; %bb13.preheader
                                        ;   Parent Loop BB0_1 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_13 Depth 3
#0:	       or	r0, 0 -> r4
#1:	       br	.BB0_13
	;;
	       nop	2
	;;
.BB0_16:                                ; %bb17
                                        ;   in Loop: Header=BB0_1 Depth=1
#0:	       ldiu	lo11{ ._.str1 } -> r0
	;;
#0:	       ldim	mi10{ ._.str1 } -> r0
	;;
#0:	       ldih	hi11{ ._.str1 } -> r0
	;;
#0:	       add	r0, r1 -> r2
	;;
#0:	       ldm.f	r2, 0
	;;
#0:	       ldx	$membu, r2 -> r2
	;;
#0:	       cmpeq	r2, 0 -> c1
	;;
#0:	if  c1 br	.BB0_20
	;;
	       nop	2
	;;
; BB#17:                                ; %bb17.bb18.preheader_crit_edge
                                        ;   in Loop: Header=BB0_1 Depth=1
#0:	       ldiu	1 -> r2
	;;
#0:	       ldim	1024 -> r2
	;;
#0:	       add	r0, r2 -> r0
	;;
.BB0_18:                                ; %bb18
                                        ;   Parent Loop BB0_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.b	r10, 0
	;;
#0:	       ldx	$membu, r10 -> r2
	;;
#0:	       btest	r2, 0 -> c1
	;;
#0:	if !c1 br	.BB0_18
	;;
	       nop	2
	;;
; BB#19:                                ; %bb19
                                        ;   in Loop: Header=BB0_18 Depth=2
#0:	       ldm.f	r0, -1
#1:	       sub	r0, 1 -> r2
	;;
#0:	       ldx	$membu, r2 -> r2
	;;
#0:	       stmb.a	r2, r11, 0
	;;
#0:	       ldm.f	r0, 0
	;;
#0:	       ldx	$membu, r0 -> r2
#1:	       add	r0, 1 -> r0
	;;
#0:	       cmpeq	r2, 0 -> c1
	;;
#0:	if !c1 br	.BB0_18
	;;
	       nop	2
	;;
.BB0_20:                                ; %bb21
                                        ;   in Loop: Header=BB0_1 Depth=1
#0:	       ldiu	lo11{ ._.str2 } -> r13
	;;
#0:	       ldim	mi10{ ._.str2 } -> r13
	;;
#0:	       ldih	hi11{ ._.str2 } -> r13
	;;
#2:	       add	r13, r1 -> r2.23
	;;
#0:	       call	r3
	;;
	       nop	3
	;;
#2:	       ldm.f	r2.23, 0
	;;
#2:	       ldx	$membu, r2.23 -> r1
	;;
#0:	       cmpeq	r1, 0 -> c1
	;;
#0:	if  c1 br	.BB0_24
	;;
	       nop	2
	;;
; BB#21:                                ; %bb21.bb22.preheader_crit_edge
                                        ;   in Loop: Header=BB0_1 Depth=1
#0:	       ldiu	1 -> r1
	;;
#0:	       ldim	1024 -> r1
	;;
#0:	       add	r13, r1 -> r1
	;;
.BB0_22:                                ; %bb22
                                        ;   Parent Loop BB0_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.b	r10, 0
	;;
#0:	       ldx	$membu, r10 -> r2
	;;
#0:	       btest	r2, 0 -> c1
	;;
#0:	if !c1 br	.BB0_22
	;;
	       nop	2
	;;
; BB#23:                                ; %bb23
                                        ;   in Loop: Header=BB0_22 Depth=2
#0:	       ldm.f	r1, -1
#1:	       sub	r1, 1 -> r2
	;;
#0:	       ldx	$membu, r2 -> r2
	;;
#0:	       stmb.a	r2, r11, 0
	;;
#0:	       ldm.f	r1, 0
	;;
#0:	       ldx	$membu, r1 -> r2
#1:	       add	r1, 1 -> r1
	;;
#0:	       cmpeq	r2, 0 -> c1
	;;
#0:	if !c1 br	.BB0_22
	;;
	       nop	2
	;;
.BB0_24:                                ; %bb21.bb26.preheader_crit_edge
                                        ;   in Loop: Header=BB0_1 Depth=1
#0:	       ldi	0 -> r1
	;;
.BB0_25:                                ; %bb26
                                        ;   Parent Loop BB0_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.b	r10, 0
	;;
#0:	       ldx	$membu, r10 -> r2
	;;
#0:	       btest	r2, 0 -> c1
	;;
#0:	if !c1 br	.BB0_25
	;;
	       nop	2
	;;
; BB#26:                                ; %bb27
                                        ;   in Loop: Header=BB0_25 Depth=2
#0:	       sra	r0, r1 -> r2
#1:	       ldi	48 -> r3
#2:	       ldi	97 -> r4
#3:	       add	r1, 4 -> r1
	;;
#0:	       and	r2, 15 -> r2
	;;
#0:	       cmpult	r2, 10 -> c1
#1:	       or	r2, r3 -> r3
#2:	       add	r2, r4 -> r2
	;;
#0:	if  c1 or	r3, 0 -> r2
#1:	       cmpeq	r1, r12 -> c1
	;;
#0:	if !c1 br	.BB0_25
#1:	       stmb.a	r2, r11, 0
	;;
	       nop	2
	;;
.BB0_27:                                ; %bb32
                                        ;   Parent Loop BB0_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.b	r10, 0
	;;
#0:	       ldx	$membu, r10 -> r0
	;;
#0:	       btest	r0, 0 -> c1
	;;
#0:	if !c1 br	.BB0_27
	;;
	       nop	2
	;;
; BB#28:                                ; %bb33
                                        ;   in Loop: Header=BB0_1 Depth=1
#0:	       stmb.a	10, r11, 0
#1:	       br	.BB0_1
	;;
	       nop	2
	;;
	.align	4
_main_end:

	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	4                       ; @.str
._.str:
	.ascii	 "\nLOAD\n\000"

	.align	4                       ; @.str1
._.str1:
	.ascii	 "BOOT\n\000"

	.align	4                       ; @.str2
._.str2:
	.ascii	 "\nEXIT \000"

