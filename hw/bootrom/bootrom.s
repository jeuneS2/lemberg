	.file	"bootrom.linked.bc"
	.text
	.globl	_main
	.align	4
_main:                                  ; @main
	.size	_main_end-_main
_main_start:
; BB#0:                                 ; %entry
#0:	       wb.s	r15, 6
#2:	       ldiu	24 -> r2
#1:	       ldx	$rb, 0 -> r1.31
#3:	       ldiu	lo11{ ._.str } -> r0
	;;
#0:	       sub	r15, r2 -> r15
#2:	       ldx	$ro, 0 -> r2.31
#1:	       ldim	mi10{ ._.str } -> r0
#3:	       ldiu	0 -> r1
	;;
#0:	       ldih	hi11{ ._.str } -> r0
#1:	       ldim	1024 -> r1
	;;
#0:	       stm.s	r14, r15, 0
#1:	       or	r15, 0 -> r14
#2:	       add	r0, r1 -> r1
	;;
#1:	       stm.s	r1.31, r15, 1
	;;
#2:	       stm.s	r2.31, r15, 2
	;;
#0:	       stm.s	r10, r14, 5
	;;
#0:	       stm.s	r11, r14, 4
	;;
#0:	       ldm.f	r1, 0
	;;
#0:	       ldx	$membu, r1 -> r1
	;;
#0:	       cmpeq	r1, 0 -> c1
	;;
#0:	if  c1 br	.BB0_4
	;;
	       nop	2
	;;
; BB#1:                                 ; %entry.bb.preheader_crit_edge
#0:	       ldiu	1 -> r1
#1:	       ldi	-4 -> r2
	;;
#0:	       ldim	1024 -> r1
	;;
#0:	       add	r0, r1 -> r0
#1:	       ldi	-8 -> r1
	;;
.BB0_2:                                 ; %bb
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.b	r1, 0
	;;
#0:	       ldx	$membu, r1 -> r3
	;;
#0:	       btest	r3, 0 -> c1
	;;
#0:	if !c1 br	.BB0_2
	;;
	       nop	2
	;;
; BB#3:                                 ; %bb1
                                        ;   in Loop: Header=BB0_2 Depth=1
#0:	       ldm.f	r0, -1
#1:	       sub	r0, 1 -> r3
	;;
#0:	       ldx	$membu, r3 -> r3
	;;
#0:	       stmb.a	r3, r2, 0
	;;
#0:	       ldm.f	r0, 0
	;;
#0:	       ldx	$membu, r0 -> r3
#1:	       add	r0, 1 -> r0
	;;
#0:	       cmpeq	r3, 0 -> c1
	;;
#0:	if !c1 br	.BB0_2
	;;
	       nop	2
	;;
.BB0_4:                                 ; %entry.bb4.preheader_crit_edge
#0:	       ldi	4 -> r0
#1:	       ldi	0 -> r1
#2:	       ldi	-8 -> r2
#3:	       ldi	-4 -> r3
	;;
.BB0_5:                                 ; %bb4
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.b	r2, 0
	;;
#0:	       ldx	$membu, r2 -> r4
	;;
#0:	       btest	r4, 1 -> c1
	;;
#0:	if !c1 br	.BB0_5
	;;
	       nop	2
	;;
; BB#6:                                 ; %bb5
                                        ;   in Loop: Header=BB0_5 Depth=1
#0:	       sub	r0, 1 -> r0
#1:	       ldm.b	r3, 0
#2:	       sl	r1, 8 -> r1
	;;
#0:	       cmpne	r0, 0 -> c1
	;;
#0:	if  c1 br	.BB0_5
#1:	       ldx	$membu, r3 -> r4
	;;
#0:	       or	r4, r1 -> r1
	;;
	       nop	1
	;;
; BB#7:                                 ; %bb5.bb8.preheader_crit_edge
#0:	       ldi	4 -> r0
#1:	       ldi	0 -> r2
#2:	       ldi	-8 -> r3
#3:	       ldi	-4 -> r4
	;;
.BB0_8:                                 ; %bb8
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.b	r3, 0
	;;
#0:	       ldx	$membu, r3 -> r5
	;;
#0:	       btest	r5, 1 -> c1
	;;
#0:	if !c1 br	.BB0_8
	;;
	       nop	2
	;;
; BB#9:                                 ; %bb9
                                        ;   in Loop: Header=BB0_8 Depth=1
#0:	       sub	r0, 1 -> r0
#1:	       ldm.b	r4, 0
#2:	       sl	r2, 8 -> r2
	;;
#0:	       cmpeq	r0, 0 -> c1
	;;
#0:	if !c1 br	.BB0_8
#1:	       ldx	$membu, r4 -> r5
	;;
#0:	       or	r5, r2 -> r2
	;;
	       nop	1
	;;
; BB#10:                                ; %bb11
#0:	       cmplt	r1, 1 -> c1
	;;
#0:	if  c1 br	.BB0_15
	;;
	       nop	2
	;;
; BB#11:                                ; %bb11.bb12.preheader_crit_edge
#0:	       ldi	0 -> r0
#1:	       br	.BB0_14
#2:	       ldi	-8 -> r3
#3:	       ldi	-4 -> r4
	;;
	       nop	2
	;;
.BB0_12:                                ; %bb12
                                        ;   Parent Loop BB0_14 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.b	r3, 0
	;;
#0:	       ldx	$membu, r3 -> r0
	;;
#0:	       btest	r0, 1 -> c1
	;;
#0:	if !c1 br	.BB0_12
	;;
	       nop	2
	;;
; BB#13:                                ; %bb13
                                        ;   in Loop: Header=BB0_14 Depth=1
#0:	       add	r5, 1 -> r0
#1:	       ldm.b	r4, 0
	;;
#0:	       cmpeq	r1, r0 -> c1
	;;
#0:	if  c1 br	.BB0_15
#1:	       ldx	$membu, r4 -> r6
	;;
#0:	       stmb.a	r6, r5, 0
	;;
	       nop	1
	;;
.BB0_14:                                ; %bb12.preheader
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_12 Depth 2
#0:	       or	r0, 0 -> r5
#1:	       br	.BB0_12
	;;
	       nop	2
	;;
.BB0_15:                                ; %bb15
#0:	       ldiu	lo11{ ._.str1 } -> r10
#1:	       ldiu	0 -> r0
	;;
#0:	       ldim	mi10{ ._.str1 } -> r10
#1:	       ldim	1024 -> r0
	;;
#0:	       ldih	hi11{ ._.str1 } -> r10
	;;
#0:	       add	r10, r0 -> r11
	;;
#0:	       call	r2
	;;
	       nop	3
	;;
#0:	       ldm.f	r11, 0
	;;
#0:	       ldx	$membu, r11 -> r1
	;;
#0:	       cmpeq	r1, 0 -> c1
	;;
#0:	if  c1 br	.BB0_19
	;;
	       nop	2
	;;
; BB#16:                                ; %bb15.bb16.preheader_crit_edge
#0:	       ldiu	1 -> r1
#1:	       ldi	-4 -> r3
#2:	       ldi	-8 -> r2
	;;
#0:	       ldim	1024 -> r1
	;;
#0:	       add	r10, r1 -> r1
	;;
.BB0_17:                                ; %bb16
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.b	r2, 0
	;;
#0:	       ldx	$membu, r2 -> r4
	;;
#0:	       btest	r4, 0 -> c1
	;;
#0:	if !c1 br	.BB0_17
	;;
	       nop	2
	;;
; BB#18:                                ; %bb17
                                        ;   in Loop: Header=BB0_17 Depth=1
#0:	       ldm.f	r1, -1
#1:	       sub	r1, 1 -> r4
	;;
#0:	       ldx	$membu, r4 -> r4
	;;
#0:	       stmb.a	r4, r3, 0
	;;
#0:	       ldm.f	r1, 0
	;;
#0:	       ldx	$membu, r1 -> r4
#1:	       add	r1, 1 -> r1
	;;
#0:	       cmpeq	r4, 0 -> c1
	;;
#0:	if !c1 br	.BB0_17
	;;
	       nop	2
	;;
.BB0_19:                                ; %bb15.bb20.preheader_crit_edge
#0:	       ldi	0 -> r1
#1:	       ldi	-8 -> r2
#2:	       ldi	48 -> r3
#3:	       ldi	97 -> r4
	;;
#0:	       ldi	-4 -> r5
#1:	       ldi	32 -> r6
	;;
.BB0_20:                                ; %bb20
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.b	r2, 0
	;;
#0:	       ldx	$membu, r2 -> r7
	;;
#0:	       btest	r7, 0 -> c1
	;;
#0:	if !c1 br	.BB0_20
	;;
	       nop	2
	;;
; BB#21:                                ; %bb21
                                        ;   in Loop: Header=BB0_20 Depth=1
#0:	       sra	r0, r1 -> r7
#1:	       add	r1, 4 -> r1
	;;
#0:	       and	r7, 15 -> r7
	;;
#0:	       cmpult	r7, 10 -> c1
#1:	       or	r7, r3 -> r8
#2:	       add	r7, r4 -> r7
	;;
#0:	if  c1 or	r8, 0 -> r7
#1:	       cmpeq	r1, r6 -> c1
	;;
#0:	if !c1 br	.BB0_20
#1:	       stmb.a	r7, r5, 0
	;;
	       nop	2
	;;
.BB0_22:                                ; %bb26
                                        ; =>This Inner Loop Header: Depth=1
#0:	       br	.BB0_22
	;;
	       nop	2
	;;
	.align	4
_main_end:

	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	4                       ; @.str
._.str:
	.ascii	 "load program\n\000"

	.align	4                       ; @.str1
._.str1:
	.ascii	 "bye \000"

