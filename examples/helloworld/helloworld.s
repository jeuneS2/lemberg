	.file	"helloworld.linked.bc"
                                        ; Start of file scope inline assembly
.stabs "_lseek is not implemented and will always fail",30,0,0,0
.stabs "_lseek",1,0,0,0

.stabs "_fstat is not implemented and will always fail",30,0,0,0
.stabs "_fstat",1,0,0,0

                                        ; End of file scope inline assembly
	.text
	.globl	_main
	.align	4
_main:                                  ; @main
	.size	_main_end-_main
_main_start:
; BB#0:                                 ; %entry
#0:	       wb.s	r15, 29
#2:	       ldiu	116 -> r2
#1:	       ldx	$rb, 0 -> r1.31
#3:	       ldi	0 -> r0
	;;
#0:	       sub	r15, r2 -> r15
#2:	       ldx	$ro, 0 -> r2.31
#1:	       ldga	._.str -> r1
	;;
#0:	       stm.s	r14, r15, 0
#1:	       or	r15, 0 -> r14
	;;
#1:	       stm.s	r1.31, r15, 1
	;;
#2:	       stm.s	r2.31, r15, 2
	;;
#0:	       stm.s	r10, r14, 28
	;;
#0:	       stm.s	r11, r14, 27
	;;
#0:	       br	.BB0_3
#1:	       stm.s	r12, r14, 26
	;;
#0:	       stm.s	r13, r14, 25
	;;
#0:	       stm.s	r0.23, r14, 24
	;;
#2:	       stm.s	r2.23, r14, 23
	;;
.BB0_1:                                 ; %bb.i1.i
                                        ;   in Loop: Header=BB0_3 Depth=1
#0:	       cmpne	r0, 13 -> c1
	;;
#0:	if !c1 br	.BB0_10
	;;
	       nop	2
	;;
; BB#2:                                 ; %bb2.i.i
                                        ;   in Loop: Header=BB0_3 Depth=1
#0:	       add	r0, 1 -> r0
	;;
.BB0_3:                                 ; %bb3.i.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       add	r1, r0 -> r2
	;;
#0:	       and	r2, 3 -> r2
	;;
#0:	       cmpne	r2, 0 -> c1
	;;
#0:	if  c1 br	.BB0_1
	;;
	       nop	2
	;;
; BB#4:                                 ; %bb4.i.i
#0:	       ldga	._.str -> r1
#1:	       ldga	32896 -> r3
	;;
#0:	       add	r1, r0 -> r0
#1:	       ldiu	1791 -> r1
#2:	       ldih	1028 -> r3
	;;
#0:	       ldm.f	r0, 0
#1:	       ldim	991 -> r1
	;;
#0:	       ldih	2039 -> r1
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       and	r2, r3 -> r4
#1:	       add	r2, r1 -> r2
	;;
#0:	       xor	r4, r3 -> r4
	;;
#0:	       and	r4, r2 -> r2
	;;
#0:	       cmpeq	r2, 0 -> c1
	;;
#0:	if !c1 br	.BB0_6
	;;
	       nop	2
	;;
.BB0_5:                                 ; %bb5.i.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r0, 4
#1:	       add	r0, 4 -> r0
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       and	r2, r3 -> r4
#1:	       add	r2, r1 -> r2
	;;
#0:	       xor	r4, r3 -> r4
	;;
#0:	       and	r4, r2 -> r2
	;;
#0:	       cmpeq	r2, 0 -> c1
	;;
#0:	if  c1 br	.BB0_5
	;;
	       nop	2
	;;
.BB0_6:                                 ; %bb8.i.i
#0:	       ldm.f	r0, 0
	;;
#0:	       ldx	$membu, r0 -> r1
	;;
#0:	       cmpeq	r1, 0 -> c1
	;;
#0:	if  c1 br	.BB0_9
	;;
	       nop	2
	;;
.BB0_7:                                 ; %bb9.i.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r0, 1
#1:	       add	r0, 1 -> r1
	;;
#0:	       ldx	$membu, r1 -> r0
	;;
#0:	       cmpne	r0, 0 -> c1
#1:	       or	r1, 0 -> r0
	;;
#0:	if  c1 br	.BB0_7
	;;
	       nop	2
	;;
; BB#8:                                 ; %bb9.i.i.bb11.i.i_crit_edge
#0:	       or	r1, 0 -> r0
	;;
.BB0_9:                                 ; %bb11.i.i
#0:	       ldga	._.str -> r1
	;;
#0:	       sub	r0, r1 -> r0
	;;
.BB0_10:                                ; %strlen.exit.i
#0:	       ldmg.d	_impure_data+8
#1:	       s2add	r14, 16 -> r4
#2:	       ldga	._.str1 -> r3
	;;
#0:	       add	r4, 12 -> r2
#1:	       ldga	._.str -> r1.16
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       stm.s	r1, r14, 18
	;;
#0:	       stm.a	1, r2, 3
	;;
#0:	       stm.a	r3, r2, 2
#1:	       add	r0, 1 -> r3
	;;
#1:	       stm.a	r1.16, r2, 0
	;;
#0:	       stm.a	r0, r2, 1
#1:	       add	r1, 12 -> r2
	;;
#0:	       stm.s	r3, r14, 12
	;;
#0:	       ldm.f	r1, 12
	;;
#0:	       ldx	$memhu, r2 -> r1
	;;
#0:	       btest	r1, 13 -> c1
	;;
#0:	if  c1 br	.BB0_12
	;;
	       nop	2
	;;
; BB#11:                                ; %bb.i.i
#0:	       ldm.s	r14, 72
#1:	       ldga	8192 -> r2
	;;
#0:	       or	r1, r2 -> r1
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       stmh.a	r1, r2, 6
#1:	       ldiu	2047 -> r2
	;;
#0:	       ldim	2043 -> r2
	;;
#0:	       ldmg.d	_impure_data+8
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       ldm.f	r1, 100
	;;
#0:	       ldx	$mem, 0 -> r3
	;;
#0:	       and	r3, r2 -> r2
	;;
#0:	       stm.a	r2, r1, 25
	;;
#0:	       ldmg.d	_impure_data+8
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       stm.s	r1, r14, 18
	;;
.BB0_12:                                ; %_puts_r.exit.i
#0:	       ldm.s	r14, 48
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       cmpeq	r1, 0 -> c1
	;;
#0:	if  c1 br	.BB0_182
	;;
	       nop	2
	;;
; BB#13:                                ; %bb1.i2.i
#0:	       ldm.s	r14, 72
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       add	r1, 12 -> r2
	;;
#0:	       stm.s	r2, r14, 6
	;;
#0:	       ldm.f	r1, 12
	;;
#0:	       ldx	$memhu, r2 -> r2
	;;
#0:	       btest	r2, 3 -> c1
	;;
#0:	if !c1 br	.BB0_15
	;;
	       nop	2
	;;
; BB#14:                                ; %bb2.i3.i
#0:	       ldm.f	r1, 16
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       cmpeq	r1, 0 -> c1
	;;
#0:	if !c1 br	.BB0_44
	;;
	       nop	2
	;;
.BB0_15:                                ; %bb3.i4.i
#0:	       ldmg.d	_impure_data+56
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       cmpeq	r1, 0 -> c1
	;;
#0:	if !c1 br	.BB0_17
	;;
	       nop	2
	;;
; BB#16:                                ; %bb1.i.i.i
#0:	       ldga	_impure_data -> r0
#1:	       callg	___sinit
	;;
	       nop	3
	;;
#0:	       ldm.s	r14, 72
#1:	       ldga	___mem_emergency -> r2
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       ldm.f	r1, 12
	;;
#1:	       ldx	$mem, 0 -> r1.31
	;;
#1:	       stm.a	r1.31, r2, 0
	;;
#0:	       ldm.s	r14, 24
	;;
#0:	       ldx	$mem, 0 -> r2
#1:	       ldmg.d	___mem_emergency
	;;
#0:	       ldx	$memhu, r2 -> r2
	;;
.BB0_17:                                ; %bb2.i.i.i
#0:	       btest	r2, 3 -> c1
	;;
#0:	if  c1 br	.BB0_26
	;;
	       nop	2
	;;
; BB#18:                                ; %bb3.i.i.i
#0:	       mask	r2, 4 -> r1
	;;
#0:	       btest	r1, 4 -> c1
	;;
#0:	if !c1 br	.BB0_43
	;;
	       nop	2
	;;
; BB#19:                                ; %bb5.i.i.i
#0:	       btest	r1, 2 -> c1
	;;
#0:	if !c1 br	.BB0_25
	;;
	       nop	2
	;;
; BB#20:                                ; %bb6.i.i.i
#0:	       ldm.s	r14, 72
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       ldm.f	r1, 48
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       cmpne	r1, 0 -> c1
	;;
#0:	if !c1 br	.BB0_24
	;;
	       nop	2
	;;
; BB#21:                                ; %bb7.i.i.i
#0:	       ldm.s	r14, 72
	;;
#0:	       ldx	$mem, 0 -> r3
	;;
#0:	       s2add	r3, 16 -> r3
	;;
#0:	       cmpne	r1, r3 -> c1
	;;
#0:	if !c1 br	.BB0_23
	;;
	       nop	2
	;;
; BB#22:                                ; %bb8.i.i.i
#0:	       ldga	_impure_data -> r0
#1:	       callg	__free_r
	;;
	       nop	3
	;;
#0:	       ldm.s	r14, 72
#1:	       ldga	___mem_emergency -> r2
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       ldm.f	r1, 12
	;;
#0:	       ldx	$mem, 0 -> r0.31
	;;
#0:	       stm.a	r0.31, r2, 0
	;;
#0:	       ldm.s	r14, 24
	;;
#0:	       ldx	$mem, 0 -> r2
#1:	       ldmg.d	___mem_emergency
	;;
#0:	       ldx	$memhu, r2 -> r2
	;;
.BB0_23:                                ; %bb9.i.i.i
#0:	       ldm.s	r14, 72
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       stm.a	0, r1, 12
	;;
.BB0_24:                                ; %bb10.i.i.i
#0:	       ldm.s	r14, 72
#1:	       ldiu	2011 -> r1
	;;
#0:	       ldim	31 -> r1
	;;
#0:	       ldx	$mem, 0 -> r3
#1:	       and	r2, r1 -> r2
	;;
#0:	       ldm.f	r3, 16
	;;
#0:	       ldx	$mem, 0 -> r4
	;;
#0:	       stm.a	r4, r3, 0
	;;
#0:	       stmh.a	r2, r3, 6
	;;
#0:	       stm.a	0, r3, 1
	;;
.BB0_25:                                ; %bb11.i.i.i
#0:	       ldm.s	r14, 72
#1:	       or	r2, 8 -> r2
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       stmh.a	r2, r1, 6
	;;
.BB0_26:                                ; %bb12.i.i.i
#0:	       ldm.s	r14, 72
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       ldm.f	r1, 16
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       cmpeq	r1, 0 -> c1
	;;
#0:	if !c1 br	.BB0_36
	;;
	       nop	2
	;;
; BB#27:                                ; %bb13.i.i.i
#0:	       btest	r2, 9 -> c1
	;;
#0:	if  c1 ldi	128 -> r1
	;;
#0:	if  c1 and	r2, r1 -> r1
	;;
#0:	if  c1 cmpeq	r1, 0 -> c1
	;;
#0:	if  c1 br	.BB0_36
	;;
	       nop	2
	;;
; BB#28:                                ; %bb15.i.i.i
#0:	       mask	r2, 4 -> r1
	;;
#0:	       btest	r1, 1 -> c1
	;;
#0:	if !c1 br	.BB0_30
	;;
	       nop	2
	;;
; BB#29:                                ; %bb.i.i.i.i
#0:	       ldm.s	r14, 72
#1:	       ldi	67 -> r1
	;;
#0:	       br	.BB0_36
#1:	       ldx	$mem, 0 -> r3
	;;
#0:	       stm.a	1, r3, 5
#1:	       add	r3, r1 -> r1
	;;
#0:	       stm.a	r1, r3, 0
	;;
#0:	       stm.a	r1, r3, 4
	;;
.BB0_30:                                ; %bb1.i.i.i.i
#0:	       ldm.s	r14, 72
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       ldm.f	r1, 14
#1:	       add	r1, 14 -> r3
	;;
#0:	       ldx	$memhs, r3 -> r1
#1:	       ldi	-1 -> r3
	;;
#0:	       cmplt	r3, r1 -> c1
	;;
#0:	if !c1 br	.BB0_32
	;;
	       nop	2
	;;
; BB#31:                                ; %_fstat_r.exit.i.i.i.i
#0:	       ldga	_errno.b -> r2
#1:	       ldi	88 -> r1
#2:	       ldga	_impure_data -> r3
	;;
#0:	       stmb.a	1, r2, 0
#1:	       ldga	___mem_emergency -> r2
	;;
#0:	       stm.a	r1, r3, 0
	;;
#0:	       ldm.s	r14, 72
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       ldm.f	r1, 12
	;;
#3:	       ldx	$mem, 0 -> r3.31
	;;
#3:	       stm.a	r3.31, r2, 0
	;;
#0:	       ldm.s	r14, 24
	;;
#0:	       ldx	$mem, 0 -> r2
#1:	       ldmg.d	___mem_emergency
	;;
#0:	       ldx	$memhu, r2 -> r2
	;;
.BB0_32:                                ; %bb11.i.i.i.i
#0:	       btest	r2, 7 -> c1
#1:	       ldga	2048 -> r1
#2:	       ldm.s	r14, 72
#3:	       ldi	64 -> r10
	;;
#0:	       or	r2, r1 -> r1
#1:	       ldiu	1024 -> r2
	;;
#0:	       callg	__malloc_r
#1:	       ldx	$mem, 0 -> r3
#2:	if !c1 or	r2, 0 -> r10
	;;
#0:	       stmh.a	r1, r3, 6
#1:	       or	r10, 0 -> r0
	;;
	       nop	2
	;;
#0:	       cmpne	r0, 0 -> c1
	;;
#0:	if  c1 br	.BB0_35
	;;
	       nop	2
	;;
; BB#33:                                ; %bb12.i.i.i.i
#0:	       ldm.s	r14, 72
#1:	       ldga	___mem_emergency -> r2
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       ldm.f	r1, 12
	;;
#1:	       ldx	$mem, 0 -> r1.31
	;;
#1:	       stm.a	r1.31, r2, 0
	;;
#0:	       ldm.s	r14, 24
	;;
#0:	       ldx	$mem, 0 -> r2
#1:	       ldmg.d	___mem_emergency
	;;
#0:	       ldx	$memhu, r2 -> r2
	;;
#0:	       btest	r2, 9 -> c1
	;;
#0:	if  c1 br	.BB0_36
	;;
	       nop	2
	;;
; BB#34:                                ; %bb13.i.i.i.i
#0:	       stm.a	1, r1, 5
#1:	       ldi	67 -> r10
#2:	       or	r2, 2 -> r2
	;;
#0:	       br	.BB0_36
#1:	       add	r1, r10 -> r10
	;;
#0:	       stm.a	r10, r1, 4
	;;
#0:	       stmh.a	r2, r1, 6
	;;
#0:	       stm.a	r10, r1, 0
	;;
.BB0_35:                                ; %bb14.i.i.i.i
#0:	       ldga	__cleanup_r -> r2
#1:	       ldga	_impure_data -> r1
#2:	       ldi	128 -> r3
	;;
#0:	       stm.a	r2, r1, 15
#1:	       ldga	___mem_emergency -> r2
	;;
#0:	       ldm.s	r14, 72
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       ldm.f	r1, 12
	;;
#2:	       ldx	$mem, 0 -> r2.31
	;;
#2:	       stm.a	r2.31, r2, 0
	;;
#0:	       ldm.s	r14, 24
	;;
#0:	       ldx	$mem, 0 -> r2
#1:	       ldmg.d	___mem_emergency
	;;
#0:	       ldx	$memhu, r2 -> r2
#1:	       stm.a	r10, r1, 5
	;;
#0:	       or	r2, r3 -> r2
	;;
#0:	       stm.a	r0, r1, 4
	;;
#0:	       stmh.a	r2, r1, 6
	;;
#0:	       stm.a	r0, r1, 0
	;;
.BB0_36:                                ; %bb16.i.i.i
#0:	       btest	r2, 0 -> c1
#1:	       mask	r2, 4 -> r1
	;;
#0:	if !c1 br	.BB0_38
	;;
	       nop	2
	;;
; BB#37:                                ; %bb17.i.i.i
#0:	       ldm.s	r14, 72
#1:	       ldi	0 -> r5
	;;
#0:	       ldx	$mem, 0 -> r3
	;;
#0:	       ldm.f	r3, 20
	;;
#0:	       br	.BB0_42
#1:	       ldx	$mem, 0 -> r4
	;;
#0:	       sub	r5, r4 -> r4
	;;
#0:	       stm.a	r4, r3, 6
	;;
#0:	       stm.a	0, r3, 2
	;;
.BB0_38:                                ; %bb18.i.i.i
#0:	       btest	r1, 1 -> c1
	;;
#0:	if !c1 br	.BB0_40
	;;
	       nop	2
	;;
; BB#39:                                ; %bb18.i.i.i.bb21.i.i.i_crit_edge
#0:	       ldi	0 -> r3
#1:	       br	.BB0_41
	;;
	       nop	2
	;;
.BB0_40:                                ; %bb19.i.i.i
#0:	       ldm.s	r14, 72
	;;
#0:	       ldx	$mem, 0 -> r3
	;;
#0:	       ldm.f	r3, 20
	;;
#0:	       ldx	$mem, 0 -> r3
	;;
.BB0_41:                                ; %bb21.i.i.i
#0:	       ldm.s	r14, 72
	;;
#0:	       ldx	$mem, 0 -> r4
	;;
#0:	       stm.a	r3, r4, 2
	;;
.BB0_42:                                ; %bb22.i.i.i
#0:	       ldm.s	r14, 72
	;;
#0:	       ldx	$mem, 0 -> r3
	;;
#0:	       ldm.f	r3, 16
	;;
#0:	       ldx	$mem, 0 -> r3
	;;
#0:	       cmpeq	r3, 0 -> c1
	;;
#0:	if  c1 btest	r1, 7 -> c1
	;;
#0:	if !c1 br	.BB0_44
	;;
	       nop	2
	;;
.BB0_43:                                ; %bb4.i5.i
#0:	       ldm.s	r14, 72
#1:	       ldi	64 -> r1
	;;
#0:	       br	.BB0_182
#1:	       or	r2, r1 -> r2
#2:	       ldga	_impure_data -> r1
	;;
#0:	       ldx	$mem, 0 -> r3
	;;
#0:	       stmh.a	r2, r3, 6
	;;
#0:	       stm.a	9, r1, 0
	;;
.BB0_44:                                ; %bb5.i6.i
#0:	       btest	r2, 1 -> c1
	;;
#0:	if !c1 br	.BB0_50
	;;
	       nop	2
	;;
; BB#45:                                ; %bb7.preheader.i.i
#0:	       s2add	r14, 16 -> r0
#1:	       br	.BB0_47
#2:	       ldi	0 -> r10
#3:	       ldiu	1024 -> r11
	;;
#0:	       add	r0, 16 -> r2
#1:	       or	r10, 0 -> r12
	;;
#0:	       stm.s	r2, r14, 17
	;;
	       nop	0
	;;
.BB0_46:                                ; %bb6.i.i
                                        ;   in Loop: Header=BB0_47 Depth=1
#0:	       ldm.s	r14, 68
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       ldm.f	r2, -4
	;;
#0:	       ldx	$mem, 0 -> r10
#1:	       ldm.f	r2, 0
#2:	       add	r2, 8 -> r2
	;;
#0:	       ldx	$mem, 0 -> r12
#1:	       stm.s	r2, r14, 17
	;;
.BB0_47:                                ; %bb7.i.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       cmpeq	r12, 0 -> c1
	;;
#0:	if  c1 br	.BB0_46
	;;
	       nop	2
	;;
; BB#48:                                ; %bb8.i8.i
                                        ;   in Loop: Header=BB0_47 Depth=1
#0:	       ldm.s	r14, 72
#1:	       cmpult	r11, r12 -> c1
#2:	       or	r12, 0 -> r3
#3:	       ldga	_impure_data -> r0
	;;
#0:	if  c1 or	r11, 0 -> r3
#1:	       or	r10, 0 -> r2
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       ldm.f	r1, 36
	;;
#0:	       ldx	$mem, 0 -> r4
#1:	       ldm.f	r1, 28
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       call	r4
	;;
	       nop	3
	;;
#0:	       cmplt	r0, 1 -> c1
	;;
#0:	if  c1 br	.BB0_61
	;;
	       nop	2
	;;
; BB#49:                                ; %bb10.i.i
                                        ;   in Loop: Header=BB0_47 Depth=1
#0:	       ldm.s	r14, 48
#1:	       add	r10, r0 -> r10
#2:	       sub	r12, r0 -> r12
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       cmpeq	r2, r0 -> c1
#1:	       sub	r2, r0 -> r1
	;;
#0:	if !c1 br	.BB0_47
#1:	       or	r1, 0 -> r2
	;;
#0:	       stm.s	r2, r14, 12
	;;
	       nop	1
	;;
#0:	       br	.BB0_182
	;;
	       nop	2
	;;
.BB0_50:                                ; %bb11.i9.i
#0:	       mask	r2, 4 -> r1
	;;
#0:	       cmpne	r1, 0 -> c1
	;;
#0:	if  c1 br	.BB0_52
	;;
	       nop	2
	;;
; BB#51:                                ; %bb13.preheader.i.i
#0:	       ldi	0 -> r1
#1:	       br	.BB0_54
#2:	       s2add	r14, 16 -> r0
	;;
#0:	       stm.s	r1, r14, 13
#1:	       add	r0, 16 -> r2
	;;
#0:	       stm.s	r2, r14, 5
	;;
#0:	       stm.s	r1, r14, 16
	;;
.BB0_52:                                ; %bb38.preheader.i.i
#0:	       s2add	r14, 16 -> r2
#1:	       br	.BB0_154
#2:	       ldi	0 -> r0
	;;
#0:	       add	r2, 16 -> r1
#1:	       or	r0, 0 -> r10
#2:	       or	r0, 0 -> r11
	;;
#0:	       stm.s	r1, r14, 14
	;;
#0:	       stm.s	r0, r14, 15
	;;
.BB0_53:                                ; %bb12.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.s	r14, 20
	;;
#0:	       ldx	$mem, 0 -> r10
	;;
#0:	       ldm.f	r10, -4
	;;
#0:	       ldx	$mem, 0 -> r11
	;;
#0:	       stm.s	r11, r14, 13
	;;
#0:	       ldm.f	r10, 0
#1:	       add	r10, 8 -> r10
	;;
#0:	       ldx	$mem, 0 -> r11
	;;
#0:	       stm.s	r11, r14, 16
	;;
#0:	       stm.s	r10, r14, 5
	;;
.BB0_54:                                ; %bb13.i.i
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_74 Depth 2
                                        ;     Child Loop BB0_67 Depth 2
                                        ;     Child Loop BB0_71 Depth 2
#0:	       ldm.s	r14, 64
	;;
#0:	       ldx	$mem, 0 -> r10
	;;
#0:	       cmpeq	r10, 0 -> c1
	;;
#0:	if  c1 br	.BB0_53
	;;
	       nop	2
	;;
; BB#55:                                ; %bb14.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.s	r14, 72
#1:	       ldga	___mem_emergency -> r11
	;;
#0:	       ldx	$mem, 0 -> r10
	;;
#0:	       ldm.f	r10, 12
	;;
#2:	       ldx	$mem, 0 -> r2.31
	;;
#2:	       stm.a	r2.31, r11, 0
	;;
#0:	       ldm.s	r14, 24
	;;
#0:	       ldx	$mem, 0 -> r11
#1:	       ldmg.d	___mem_emergency
	;;
#0:	       ldx	$memhu, r11 -> r11
#1:	       ldm.f	r10, 8
	;;
#0:	       btest	r11, 9 -> c1
	;;
#0:	if !c1 br	.BB0_146
#1:	       ldx	$mem, 0 -> r10
	;;
	       nop	2
	;;
; BB#56:                                ; %bb15.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.s	r14, 64
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       cmpule	r10, r0 -> c1
	;;
#0:	if !c1 br	.BB0_77
	;;
	       nop	2
	;;
; BB#57:                                ; %bb16.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldiu	1152 -> r0
	;;
#0:	       and	r11, r0 -> r0
	;;
#0:	       cmpeq	r0, 0 -> c1
	;;
#0:	if  c1 br	.BB0_77
	;;
	       nop	2
	;;
; BB#58:                                ; %bb17.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.s	r14, 72
	;;
#0:	       ldx	$mem, 0 -> r10
	;;
#0:	       ldm.f	r10, 20
	;;
#0:	       ldx	$mem, 0 -> r0
#1:	       ldm.f	r10, 0
	;;
#0:	       mul	r0, 3 -> $mul0
	;;
#1:	       ldx	$mem, 0 -> r12
#2:	       ldm.f	r10, 16
#0:	       ldx	$mul0, 0 -> r1
	;;
#0:	       sr	r1, 31 -> r2
	;;
#0:	       ldx	$mem, 0 -> r10
#1:	       add	r1, r2 -> r1
	;;
#0:	       sub	r12, r10 -> r0
#1:	       sra	r1, 1 -> r1
	;;
#0:	       stm.s	r0, r14, 9
	;;
#0:	       ldm.s	r14, 64
	;;
#0:	       ldx	$mem, 0 -> r3
	;;
#0:	       add	r3, r0 -> r0
	;;
#0:	       add	r0, 1 -> r0
	;;
#0:	       cmpult	r1, r0 -> c1
	;;
#0:	if  c1 or	r0, 0 -> r1
#1:	       btest	r11, 10 -> c1
	;;
#0:	if !c1 br	.BB0_78
#1:	       stm.s	r1, r14, 11
	;;
	       nop	2
	;;
; BB#59:                                ; %bb20.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.s	r14, 44
	;;
#0:	       callg	__malloc_r
#1:	       ldx	$mem, 0 -> r0
	;;
	       nop	3
	;;
#0:	       cmpne	r0, 0 -> c1
	;;
#0:	if  c1 br	.BB0_62
	;;
	       nop	2
	;;
.BB0_60:                                ; %bb21.i.i
#0:	       ldga	_impure_data -> r0
	;;
#0:	       stm.a	12, r0, 0
	;;
.BB0_61:                                ; %err.i.i
#0:	       ldm.s	r14, 72
#1:	       ldga	___mem_emergency -> r0
#2:	       ldi	64 -> r2
#3:	       or	r14, 0 -> r15
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       ldm.f	r1, 12
	;;
#3:	       ldx	$mem, 0 -> r3.31
	;;
#3:	       stm.a	r3.31, r0, 0
	;;
#0:	       ldm.s	r14, 24
	;;
#0:	       ldx	$mem, 0 -> r0
#1:	       ldmg.d	___mem_emergency
	;;
#0:	       ldx	$memhu, r0 -> r0
	;;
#0:	       or	r0, r2 -> r0
	;;
#0:	       stmh.a	r0, r1, 6
#1:	       ldi	0 -> r0
	;;
#0:	       ldm.s	r14, 92
	;;
#2:	       ldx	$mem, 0 -> r2.23
#0:	       ldm.s	r14, 96
	;;
#0:	       ldx	$mem, 0 -> r0.23
#1:	       ldm.s	r14, 100
	;;
#0:	       ldx	$mem, 0 -> r13
#1:	       ldm.s	r14, 104
	;;
#0:	       ldx	$mem, 0 -> r12
#1:	       ldm.s	r14, 108
	;;
#0:	       ldx	$mem, 0 -> r11
#1:	       ldm.s	r14, 112
	;;
#0:	       ldx	$mem, 0 -> r10
#1:	       ldm.s	r15, 8
	;;
#0:	       br	.BB0_183
#1:	       ldx	$mem, 0 -> r1.31
#2:	       ldm.s	r15, 4
	;;
#1:	       stx	r1.31 -> $ro
	;;
#2:	       ldx	$mem, 0 -> r2.31
	;;
#2:	       stx	r2.31 -> $rb
	;;
.BB0_62:                                ; %bb22.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.s	r14, 72
#1:	       ldi	15 -> r1
	;;
#0:	       ldx	$mem, 0 -> r11
	;;
#0:	       ldm.f	r11, 16
	;;
#0:	       ldx	$mem, 0 -> r11
#1:	       ldm.s	r14, 36
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       cmpult	r1, r2 -> c1
	;;
#0:	if  c1 br	.BB0_64
	;;
	       nop	2
	;;
; BB#63:                                ; %bb22.i.i.bb8.preheader.i.i.i_crit_edge
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.s	r14, 36
#1:	       br	.BB0_73
#2:	       or	r0, 0 -> r10
	;;
#0:	       ldx	$mem, 0 -> r12
	;;
	       nop	1
	;;
.BB0_64:                                ; %bb.i.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       or	r11, r0 -> r1
	;;
#0:	       and	r1, 3 -> r1
	;;
#0:	       cmpeq	r1, 0 -> c1
	;;
#0:	if  c1 br	.BB0_66
	;;
	       nop	2
	;;
; BB#65:                                ; %bb.i.i.i.bb7.i3.i.i_crit_edge
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.s	r14, 36
#1:	       br	.BB0_74
#2:	       or	r0, 0 -> r10
	;;
#0:	       ldx	$mem, 0 -> r12
	;;
	       nop	1
	;;
.BB0_66:                                ; %bb.nph22.i.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldi	0 -> r1
#1:	       sub	r12, r10 -> r10
	;;
.BB0_67:                                ; %bb2.i1.i.i
                                        ;   Parent Loop BB0_54 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       or	r1, 0 -> r2
	;;
#0:	       sub	r11, r2 -> r12
#1:	       sub	r0, r2 -> r3
	;;
#0:	       ldm.f	r12, 0
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       stm.a	r1, r3, 0
#1:	       sub	r2, 16 -> r1
	;;
#0:	       ldm.f	r12, 4
	;;
#0:	       ldx	$mem, 0 -> r4
	;;
#0:	       stm.a	r4, r3, 1
	;;
#0:	       ldm.f	r12, 8
	;;
#0:	       ldx	$mem, 0 -> r4
	;;
#0:	       stm.a	r4, r3, 2
	;;
#0:	       ldm.f	r12, 12
#1:	       add	r10, r1 -> r12
	;;
#0:	       ldx	$mem, 0 -> r4
	;;
#0:	       stm.a	r4, r3, 3
#1:	       ldi	15 -> r3
	;;
#0:	       cmpult	r3, r12 -> c1
	;;
#0:	if  c1 br	.BB0_67
	;;
	       nop	2
	;;
; BB#68:                                ; %bb5.preheader.i.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldi	3 -> r3
	;;
#0:	       cmpult	r3, r12 -> c1
	;;
#0:	if  c1 br	.BB0_70
	;;
	       nop	2
	;;
; BB#69:                                ; %bb5.preheader.i.i.i.bb6.i2.i.i_crit_edge
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       sub	r0, r1 -> r10
#1:	       br	.BB0_73
#2:	       sub	r11, r1 -> r11
	;;
	       nop	2
	;;
.BB0_70:                                ; %bb.nph16.i.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldi	0 -> r3
#1:	       add	r10, r1 -> r12
	;;
#0:	       or	r3, 0 -> r10
	;;
.BB0_71:                                ; %bb4.i.i.i
                                        ;   Parent Loop BB0_54 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       add	r11, r3 -> r4
#1:	       add	r0, r3 -> r5
#2:	       sub	r12, r3 -> r6
#3:	       sub	r10, 4 -> r10
	;;
#0:	       sub	r4, r2 -> r4
#1:	       sub	r5, r2 -> r5
#2:	       sub	r6, 4 -> r6
#3:	       add	r3, 4 -> r3
	;;
#0:	       ldm.f	r4, 16
	;;
#0:	       ldx	$mem, 0 -> r4
	;;
#0:	       stm.a	r4, r5, 4
#1:	       ldi	3 -> r4
	;;
#0:	       cmpult	r4, r6 -> c1
	;;
#0:	if  c1 br	.BB0_71
	;;
	       nop	2
	;;
; BB#72:                                ; %bb5.bb6_crit_edge.i.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       add	r11, r3 -> r10
#1:	       add	r0, r3 -> r2
#2:	       sub	r12, r3 -> r12
	;;
#0:	       sub	r10, r1 -> r11
#1:	       sub	r2, r1 -> r10
	;;
.BB0_73:                                ; %bb8.preheader.i.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       cmpeq	r12, 0 -> c1
	;;
#0:	if  c1 br	.BB0_75
	;;
	       nop	2
	;;
.BB0_74:                                ; %bb7.i3.i.i
                                        ;   Parent Loop BB0_54 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       sub	r12, 1 -> r12
#1:	       ldm.f	r11, 0
#2:	       add	r10, 1 -> r2
	;;
#0:	       cmpne	r12, 0 -> c1
	;;
#0:	if  c1 br	.BB0_74
#1:	       ldx	$membu, r11 -> r1
#2:	       add	r11, 1 -> r11
	;;
#0:	       stmb.a	r1, r10, 0
#1:	       or	r2, 0 -> r10
	;;
	       nop	1
	;;
.BB0_75:                                ; %memcpy.exit.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.s	r14, 72
#1:	       ldga	___mem_emergency -> r11
#2:	       ldiu	895 -> r1
	;;
#0:	       ldim	31 -> r1
	;;
#0:	       ldx	$mem, 0 -> r10
	;;
#0:	       ldm.f	r10, 12
	;;
#0:	       ldx	$mem, 0 -> r0.31
	;;
#0:	       stm.a	r0.31, r11, 0
	;;
#0:	       ldm.s	r14, 24
	;;
#0:	       ldx	$mem, 0 -> r11
#1:	       ldmg.d	___mem_emergency
	;;
#0:	       ldx	$memhu, r11 -> r11
	;;
#0:	       and	r11, r1 -> r11
#1:	       ldi	128 -> r1
	;;
#0:	       or	r11, r1 -> r11
	;;
#0:	       stmh.a	r11, r10, 6
	;;
.BB0_76:                                ; %bb25.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.s	r14, 44
	;;
#0:	       ldx	$mem, 0 -> r11
#1:	       ldm.s	r14, 36
	;;
#0:	       ldx	$mem, 0 -> r10
#1:	       ldm.s	r14, 72
	;;
#0:	       sub	r11, r10 -> r1
#1:	       add	r0, r10 -> r10
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       stm.a	r1, r2, 2
	;;
#0:	       stm.a	r11, r2, 5
	;;
#0:	       stm.a	r0, r2, 4
	;;
#0:	       stm.a	r10, r2, 0
	;;
#0:	       ldm.s	r14, 64
	;;
#0:	       ldx	$mem, 0 -> r10
	;;
.BB0_77:                                ; %bb26.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.s	r14, 72
	;;
#0:	       ldx	$mem, 0 -> r11
	;;
#0:	       ldm.f	r11, 0
	;;
#0:	       ldx	$mem, 0 -> r0
#1:	       ldm.s	r14, 64
	;;
#0:	       ldx	$mem, 0 -> r12
#1:	       ldm.s	r14, 52
	;;
#0:	       cmpult	r12, r10 -> c1
	;;
#0:	       callg	_memmove
#1:	if  c1 or	r12, 0 -> r10
#2:	       ldx	$mem, 0 -> r1
	;;
#0:	       or	r10, 0 -> r2
	;;
	       nop	2
	;;
#0:	       ldm.f	r11, 8
	;;
#0:	       ldx	$mem, 0 -> r0
#1:	       ldm.f	r11, 0
	;;
#0:	       br	.BB0_151
#1:	       sub	r0, r10 -> r0
	;;
#0:	       ldx	$mem, 0 -> r1
#1:	       stm.a	r0, r11, 2
	;;
#0:	       add	r1, r10 -> r10
	;;
#0:	       stm.a	r10, r11, 0
#1:	       or	r12, 0 -> r10
	;;
.BB0_78:                                ; %bb23.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       cmpne	r10, 0 -> c1
	;;
#0:	if  c1 br	.BB0_80
	;;
	       nop	2
	;;
; BB#79:                                ; %bb.i5.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       or	r1, 0 -> r0
#1:	       callg	__malloc_r
	;;
	       nop	3
	;;
#0:	       br	.BB0_143
	;;
	       nop	2
	;;
.BB0_80:                                ; %bb1.i6.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.f	r10, -4
#1:	       ldi	22 -> r1
	;;
#0:	       ldx	$mem, 0 -> r11
#1:	       ldm.s	r14, 44
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       add	r0, 11 -> r0
	;;
#0:	       cmpult	r1, r0 -> c1
#1:	       ldi	-8 -> r1
	;;
#0:	       and	r0, r1 -> r0
#1:	       ldi	16 -> r1
	;;
#0:	if  c1 or	r0, 0 -> r1
	;;
#0:	       cmplt	r1, 0 -> c1
#1:	       stm.s	r1, r14, 17
	;;
#0:	if  c1 br	.BB0_82
	;;
	       nop	2
	;;
; BB#81:                                ; %bb1.i6.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.s	r14, 44
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       cmpule	r0, r1 -> c1
	;;
#0:	if  c1 br	.BB0_83
	;;
	       nop	2
	;;
.BB0_82:                                ; %bb6.i7.i.i
#0:	       ldga	_impure_data -> r0
#1:	       br	.BB0_144
	;;
#0:	       stm.a	12, r0, 0
	;;
	       nop	1
	;;
.BB0_83:                                ; %bb7.i8.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       sub	r10, 8 -> r0
	;;
#0:	       stm.s	r0, r14, 8
#1:	       ldi	-4 -> r0
	;;
#0:	       and	r11, r0 -> r12
#1:	       or	r1, 0 -> r0
	;;
#0:	       cmplt	r12, r0 -> c1
	;;
#0:	if  c1 br	.BB0_86
	;;
	       nop	2
	;;
; BB#84:                                ; %bb7.i8.i.i.split.i.i.i_crit_edge
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       stm.s	r12, r14, 15
	;;
.BB0_85:                                ; %bb7.i8.i.i.split.i.i.i_crit_edge
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.s	r14, 32
#1:	       br	.BB0_139
	;;
#0:	       ldx	$mem, 0 -> r10
	;;
#0:	       stm.s	r10, r14, 14
	;;
	       nop	0
	;;
.BB0_86:                                ; %bb8.i10.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldmg.d	___malloc_av_+8
#1:	       add	r12, r10 -> r1
#2:	       sub	r12, 4 -> r13
	;;
#0:	       sub	r1, 8 -> r1
#1:	       add	r10, r13 -> r0
	;;
#0:	       ldx	$mem, 0 -> r2
#1:	       ldm.f	r0, 0
	;;
#0:	       cmpeq	r2, r1 -> c1
	;;
#0:	if  c1 br	.BB0_96
#1:	       ldx	$mem, 0 -> r0
	;;
	       nop	2
	;;
; BB#87:                                ; %bb9.i11.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldi	-2 -> r3
	;;
#0:	       and	r0, r3 -> r3
	;;
#0:	       add	r13, r3 -> r3
	;;
#0:	       add	r10, r3 -> r3
	;;
#0:	       ldm.f	r3, 0
	;;
#0:	       ldx	$membu, r3 -> r3
	;;
#0:	       btest	r3, 0 -> c1
	;;
#0:	if !c1 br	.BB0_98
	;;
	       nop	2
	;;
; BB#88:                                ; %bb9.i11.i.i.bb16.i17.i.i_crit_edge
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldi	0 -> r0
	;;
#0:	       stm.s	r0, r14, 10
#1:	       or	r0, 0 -> r1
	;;
.BB0_89:                                ; %bb16.i17.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       cmpne	r11, 0 -> c1
	;;
#0:	if  c1 br	.BB0_124
	;;
	       nop	2
	;;
; BB#90:                                ; %bb17.i18.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.f	r10, -8
#1:	       ldi	-4 -> r0
#2:	       ldi	-8 -> r4
#3:	       cmpeq	r1, 0 -> c1
	;;
#0:	       ldx	$mem, 0 -> r11
	;;
#0:	       sub	r0, r11 -> r3
#1:	       sub	r4, r11 -> r11
	;;
#0:	       add	r10, r3 -> r0.23
#1:	       add	r10, r11 -> r4
	;;
#1:	if  c1 br	.BB0_123
#0:	       ldm.f	r0.23, 0
	;;
#0:	       ldx	$mem, 0 -> r3
#1:	       stm.s	r4, r14, 14
	;;
#0:	       and	r3, r0 -> r0
	;;
#0:	       stm.s	r0, r14, 7
	;;
; BB#91:                                ; %bb18.i19.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.s	r14, 40
#1:	       cmpne	r2, r1 -> c1
	;;
#0:	       ldx	$mem, 0 -> r0
#1:	       ldm.s	r14, 28
	;;
#0:	if  c1 br	.BB0_108
#1:	       add	r0, r12 -> r0
	;;
#0:	       ldx	$mem, 0 -> r3
	;;
#0:	       add	r0, r3 -> r0
	;;
#0:	       stm.s	r0, r14, 15
	;;
; BB#92:                                ; %bb19.i20.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.s	r14, 68
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       add	r1, 16 -> r1
	;;
#0:	       cmplt	r0, r1 -> c1
	;;
#0:	if  c1 br	.BB0_123
	;;
	       nop	2
	;;
; BB#93:                                ; %bb20.i.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       add	r11, r10 -> r0
#1:	       add	r11, 12 -> r1
	;;
#0:	       ldm.f	r0, 8
#1:	       add	r10, r1 -> r1
	;;
#2:	       add	r0, 8 -> r2.23
	;;
#0:	       ldx	$mem, 0 -> r2
#1:	       ldm.f	r1, 0
	;;
#0:	       ldx	$mem, 0 -> r3
	;;
#0:	       stm.a	r3, r2, 3
	;;
#0:	       stm.a	r2, r3, 2
#1:	       ldi	36 -> r2
	;;
#0:	       cmpult	r2, r13 -> c1
	;;
#0:	if  c1 br	.BB0_106
	;;
	       nop	2
	;;
; BB#94:                                ; %bb21.i21.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldi	19 -> r2
	;;
#0:	       cmpult	r2, r13 -> c1
	;;
#0:	if  c1 br	.BB0_100
	;;
	       nop	2
	;;
; BB#95:                                ; %bb21.i21.i.i.bb25.i24.i.i_crit_edge
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       or	r10, 0 -> r1
#1:	       br	.BB0_105
#2:	       or	r2.23, 0 -> r2
	;;
	       nop	2
	;;
.BB0_96:                                ; %bb11.i13.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldi	-4 -> r3
	;;
#0:	       and	r0, r3 -> r0
	;;
#0:	       stm.s	r0, r14, 10
#1:	       add	r0, r12 -> r0
	;;
#0:	       ldm.s	r14, 68
	;;
#0:	       ldx	$mem, 0 -> r3
	;;
#0:	       add	r3, 16 -> r3
	;;
#0:	       cmple	r3, r0 -> c1
	;;
#0:	if !c1 br	.BB0_89
	;;
	       nop	2
	;;
; BB#97:                                ; %bb12.i14.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.s	r14, 68
#1:	       ldga	___malloc_av_ -> r3
	;;
#0:	       ldx	$mem, 0 -> r11
#1:	       ldm.s	r14, 40
	;;
#0:	       add	r11, r10 -> r0
#1:	       sub	r12, r11 -> r1
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       add	r1, r2 -> r1
#1:	       sub	r0, 8 -> r2
#2:	       sub	r0, 4 -> r0
	;;
#0:	       stm.a	r2, r3, 2
#1:	       or	r1, 1 -> r1
	;;
#0:	       stm.a	r1, r0, 0
#1:	       sub	r10, 4 -> r1
	;;
#0:	       ldm.f	r10, -4
	;;
#0:	       br	.BB0_76
#1:	       ldx	$mem, 0 -> r0
	;;
#0:	       and	r0, 1 -> r0
	;;
#0:	       or	r0, r11 -> r11
#1:	       or	r10, 0 -> r0
	;;
#0:	       stm.a	r11, r1, 0
	;;
.BB0_98:                                ; %bb13.i15.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldi	-4 -> r3
	;;
#0:	       and	r0, r3 -> r0
	;;
#0:	       stm.s	r0, r14, 10
#1:	       add	r0, r12 -> r0
	;;
#0:	       stm.s	r0, r14, 15
	;;
#0:	       ldm.s	r14, 68
	;;
#0:	       ldx	$mem, 0 -> r3
	;;
#0:	       cmple	r3, r0 -> c1
	;;
#0:	if !c1 br	.BB0_89
	;;
	       nop	2
	;;
; BB#99:                                ; %bb14.i16.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       add	r10, r12 -> r10
	;;
#0:	       ldm.f	r10, 0
	;;
#0:	       br	.BB0_85
#1:	       ldx	$mem, 0 -> r11
#2:	       ldm.f	r10, 4
	;;
#0:	       ldx	$mem, 0 -> r10
	;;
#0:	       stm.a	r10, r11, 3
	;;
#0:	       stm.a	r11, r10, 2
	;;
.BB0_100:                               ; %bb22.i22.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.f	r10, 0
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#2:	       stm.a	r2, r2.23, 0
#0:	       add	r0, 16 -> r2
	;;
#0:	       ldm.f	r10, 4
	;;
#0:	       ldx	$mem, 0 -> r3
	;;
#0:	       stm.a	r3, r1, 0
#1:	       ldi	27 -> r1
	;;
#0:	       cmpult	r1, r13 -> c1
	;;
#0:	if  c1 br	.BB0_102
	;;
	       nop	2
	;;
; BB#101:                               ; %bb22.i22.i.i.bb25.i24.i.i_crit_edge
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       add	r10, 8 -> r1
#1:	       br	.BB0_105
	;;
	       nop	2
	;;
.BB0_102:                               ; %bb23.i23.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.f	r10, 8
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       stm.a	r1, r2, 0
#1:	       add	r0, 24 -> r2
	;;
#0:	       ldm.f	r10, 12
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       stm.a	r1, r0, 5
#1:	       ldi	35 -> r1
	;;
#0:	       cmpult	r1, r13 -> c1
	;;
#0:	if  c1 br	.BB0_104
	;;
	       nop	2
	;;
; BB#103:                               ; %bb23.i23.i.i.bb25.i24.i.i_crit_edge
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       add	r10, 16 -> r1
#1:	       br	.BB0_105
	;;
	       nop	2
	;;
.BB0_104:                               ; %bb24.i.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.f	r10, 16
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       stm.a	r1, r2, 0
#1:	       s2add	r0, 8 -> r2
#2:	       add	r10, 24 -> r1
	;;
#0:	       ldm.f	r10, 20
	;;
#0:	       ldx	$mem, 0 -> r13
	;;
#0:	       stm.a	r13, r0, 7
	;;
.BB0_105:                               ; %bb25.i24.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.f	r1, 0
	;;
#0:	       ldx	$mem, 0 -> r13
	;;
#0:	       stm.a	r13, r2, 0
	;;
#0:	       ldm.f	r1, 4
	;;
#0:	       ldx	$mem, 0 -> r13
	;;
#0:	       br	.BB0_107
#1:	       stm.a	r13, r2, 1
	;;
#0:	       ldm.f	r1, 8
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       stm.a	r1, r2, 2
	;;
.BB0_106:                               ; %bb26.i.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#2:	       or	r2.23, 0 -> r0
#0:	       callg	_memmove
#1:	       or	r10, 0 -> r1
#3:	       or	r13, 0 -> r2
	;;
	       nop	3
	;;
.BB0_107:                               ; %bb27.i25.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.s	r14, 68
#1:	       ldga	___malloc_av_ -> r0
	;;
#0:	       ldx	$mem, 0 -> r1
#1:	       ldm.s	r14, 40
	;;
#0:	       add	r11, r1 -> r11
#1:	       sub	r12, r1 -> r12
	;;
#0:	       ldx	$mem, 0 -> r13
#1:	       ldm.s	r14, 28
#2:	       add	r10, r11 -> r10
	;;
#0:	       add	r12, r13 -> r12
	;;
#0:	       ldx	$mem, 0 -> r13
#1:	       stm.a	r10, r0, 2
	;;
#0:	       add	r12, r13 -> r12
#2:	       or	r2.23, 0 -> r0
	;;
#0:	       or	r12, 1 -> r11
	;;
#0:	       stm.a	r11, r10, 1
	;;
#0:	       ldm.f	r0.23, 0
	;;
#0:	       br	.BB0_76
#1:	       ldx	$mem, 0 -> r10
	;;
#0:	       and	r10, 1 -> r10
	;;
#0:	       or	r10, r1 -> r10
	;;
#0:	       stm.a	r10, r0.23, 0
	;;
.BB0_108:                               ; %bb28.i.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.s	r14, 68
	;;
#0:	       ldx	$mem, 0 -> r2
#1:	       ldm.s	r14, 60
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       cmplt	r0, r2 -> c1
	;;
#0:	if  c1 br	.BB0_123
	;;
	       nop	2
	;;
; BB#109:                               ; %bb29.i.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.f	r1, 8
	;;
#0:	       ldx	$mem, 0 -> r12
#1:	       ldm.f	r1, 12
#2:	       add	r11, 12 -> r1
#3:	       add	r11, r10 -> r11
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       stm.a	r0, r12, 3
	;;
#0:	       stm.a	r12, r0, 2
#1:	       add	r10, r1 -> r12
#2:	       add	r11, 8 -> r0
	;;
#0:	       ldm.f	r11, 8
	;;
#0:	       ldx	$mem, 0 -> r1
#1:	       ldm.f	r12, 0
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       stm.a	r2, r1, 3
	;;
#0:	       stm.a	r1, r2, 2
#1:	       ldi	36 -> r1
	;;
#0:	       cmpult	r1, r13 -> c1
	;;
#0:	if  c1 br	.BB0_138
	;;
	       nop	2
	;;
; BB#110:                               ; %bb31.i.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldi	19 -> r1
	;;
#0:	       cmpult	r1, r13 -> c1
	;;
#0:	if !c1 br	.BB0_116
	;;
	       nop	2
	;;
; BB#111:                               ; %bb34.i.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.f	r10, 0
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       stm.a	r1, r0, 0
#1:	       add	r11, 16 -> r0
	;;
#0:	       ldm.f	r10, 4
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       stm.a	r1, r12, 0
#1:	       ldi	27 -> r12
	;;
#0:	       cmpult	r12, r13 -> c1
	;;
#0:	if  c1 br	.BB0_113
	;;
	       nop	2
	;;
; BB#112:                               ; %bb34.i.i.i.bb37.i.i.i_crit_edge
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       add	r10, 8 -> r10
#1:	       br	.BB0_116
	;;
	       nop	2
	;;
.BB0_113:                               ; %bb35.i.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.f	r10, 8
	;;
#0:	       ldx	$mem, 0 -> r12
	;;
#0:	       stm.a	r12, r0, 0
#1:	       add	r11, 24 -> r0
	;;
#0:	       ldm.f	r10, 12
	;;
#0:	       ldx	$mem, 0 -> r12
	;;
#0:	       stm.a	r12, r11, 5
#1:	       ldi	35 -> r12
	;;
#0:	       cmpult	r12, r13 -> c1
	;;
#0:	if  c1 br	.BB0_115
	;;
	       nop	2
	;;
; BB#114:                               ; %bb35.i.i.i.bb37.i.i.i_crit_edge
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       add	r10, 16 -> r10
#1:	       br	.BB0_116
	;;
	       nop	2
	;;
.BB0_115:                               ; %bb36.i.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.f	r10, 16
	;;
#0:	       ldx	$mem, 0 -> r12
	;;
#0:	       stm.a	r12, r0, 0
#1:	       s2add	r11, 8 -> r0
	;;
#0:	       ldm.f	r10, 20
#1:	       add	r10, 24 -> r10
	;;
#0:	       ldx	$mem, 0 -> r12
	;;
#0:	       stm.a	r12, r11, 7
	;;
.BB0_116:                               ; %bb37.i.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.f	r10, 0
	;;
#0:	       ldx	$mem, 0 -> r11
	;;
#0:	       stm.a	r11, r0, 0
	;;
#0:	       ldm.f	r10, 4
	;;
#0:	       ldx	$mem, 0 -> r11
	;;
#0:	       br	.BB0_139
#1:	       stm.a	r11, r0, 1
	;;
#0:	       ldm.f	r10, 8
	;;
#0:	       ldx	$mem, 0 -> r10
	;;
#0:	       stm.a	r10, r0, 2
	;;
.BB0_117:                               ; %bb41.i.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       add	r11, 12 -> r12
#1:	       add	r11, r10 -> r11
	;;
#0:	       ldm.f	r11, 8
#1:	       add	r10, r12 -> r12
#2:	       add	r11, 8 -> r0
	;;
#0:	       ldx	$mem, 0 -> r1
#1:	       ldm.f	r12, 0
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       stm.a	r2, r1, 3
	;;
#0:	       stm.a	r1, r2, 2
#1:	       ldi	36 -> r1
	;;
#0:	       cmpult	r1, r13 -> c1
	;;
#0:	if  c1 br	.BB0_138
	;;
	       nop	2
	;;
; BB#118:                               ; %bb43.i.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldi	19 -> r1
	;;
#0:	       cmpult	r1, r13 -> c1
	;;
#0:	if !c1 br	.BB0_116
	;;
	       nop	2
	;;
; BB#119:                               ; %bb46.i.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.f	r10, 0
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       stm.a	r1, r0, 0
#1:	       add	r11, 16 -> r0
	;;
#0:	       ldm.f	r10, 4
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       stm.a	r1, r12, 0
#1:	       ldi	27 -> r12
	;;
#0:	       cmpult	r12, r13 -> c1
	;;
#0:	if  c1 br	.BB0_121
	;;
	       nop	2
	;;
; BB#120:                               ; %bb46.i.i.i.bb49.i.i.i_crit_edge
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       add	r10, 8 -> r10
#1:	       br	.BB0_116
	;;
	       nop	2
	;;
.BB0_121:                               ; %bb47.i.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.f	r10, 8
	;;
#0:	       ldx	$mem, 0 -> r12
	;;
#0:	       stm.a	r12, r0, 0
#1:	       add	r11, 24 -> r0
	;;
#0:	       ldm.f	r10, 12
	;;
#0:	       ldx	$mem, 0 -> r12
	;;
#0:	       stm.a	r12, r11, 5
#1:	       ldi	35 -> r12
	;;
#0:	       cmpult	r12, r13 -> c1
	;;
#0:	if  c1 br	.BB0_115
	;;
	       nop	2
	;;
; BB#122:                               ; %bb47.i.i.i.bb49.i.i.i_crit_edge
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       add	r10, 16 -> r10
#1:	       br	.BB0_116
	;;
	       nop	2
	;;
.BB0_123:                               ; %bb39.i.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.s	r14, 56
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       cmpeq	r0, 0 -> c1
	;;
#0:	if !c1 ldm.s	r14, 28
	;;
#0:	if !c1 ldx	$mem, 0 -> r0
	;;
#0:	if !c1 add	r0, r12 -> r0
	;;
#0:	if !c1 stm.s	r0, r14, 15
	;;
#0:	if !c1 ldm.s	r14, 68
	;;
#0:	if !c1 ldx	$mem, 0 -> r1
	;;
#0:	if !c1 cmplt	r0, r1 -> c1
	;;
#0:	if !c1 br	.BB0_117
	;;
	       nop	2
	;;
.BB0_124:                               ; %bb51.i.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.s	r14, 44
	;;
#0:	       callg	__malloc_r
#1:	       ldx	$mem, 0 -> r0
	;;
	       nop	3
	;;
#0:	       cmpeq	r0, 0 -> c1
	;;
#0:	if  c1 br	.BB0_144
	;;
	       nop	2
	;;
; BB#125:                               ; %bb53.i.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.f	r10, -4
#1:	       or	r0, 0 -> r11
#2:	       ldi	-2 -> r1
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       sub	r0, 8 -> r0
	;;
#0:	       and	r0, r1 -> r0
#1:	       sub	r11, 8 -> r1
	;;
#0:	       add	r10, r0 -> r0
	;;
#0:	       cmpne	r1, r0 -> c1
	;;
#0:	if  c1 br	.BB0_127
	;;
	       nop	2
	;;
; BB#126:                               ; %bb54.i.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.f	r11, -4
#1:	       ldi	-4 -> r11
	;;
#0:	       br	.BB0_85
#1:	       ldx	$mem, 0 -> r10
	;;
#0:	       and	r10, r11 -> r10
	;;
#0:	       add	r10, r12 -> r10
	;;
#0:	       stm.s	r10, r14, 15
	;;
.BB0_127:                               ; %bb55.i.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldi	36 -> r0
	;;
#0:	       cmpult	r0, r13 -> c1
	;;
#0:	if  c1 br	.BB0_136
	;;
	       nop	2
	;;
; BB#128:                               ; %bb57.i.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldi	19 -> r0
	;;
#0:	       cmpult	r0, r13 -> c1
	;;
#0:	if  c1 br	.BB0_130
	;;
	       nop	2
	;;
; BB#129:                               ; %bb57.i.i.i.bb63.i.i.i_crit_edge
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       or	r10, 0 -> r13
#1:	       br	.BB0_135
#2:	       or	r11, 0 -> r0
	;;
	       nop	2
	;;
.BB0_130:                               ; %bb60.i.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.f	r10, 0
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       stm.a	r0, r11, 0
	;;
#0:	       ldm.f	r10, 4
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       stm.a	r0, r11, 1
#1:	       ldi	27 -> r0
	;;
#0:	       cmpult	r0, r13 -> c1
	;;
#0:	if  c1 br	.BB0_132
	;;
	       nop	2
	;;
; BB#131:                               ; %bb60.i.i.i.bb63.i.i.i_crit_edge
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       add	r11, 8 -> r0
#1:	       br	.BB0_135
#2:	       add	r10, 8 -> r13
	;;
	       nop	2
	;;
.BB0_132:                               ; %bb61.i.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.f	r10, 8
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       stm.a	r0, r11, 2
	;;
#0:	       ldm.f	r10, 12
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       stm.a	r0, r11, 3
#1:	       ldi	35 -> r0
	;;
#0:	       cmpult	r0, r13 -> c1
	;;
#0:	if  c1 br	.BB0_134
	;;
	       nop	2
	;;
; BB#133:                               ; %bb61.i.i.i.bb63.i.i.i_crit_edge
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       add	r11, 16 -> r0
#1:	       br	.BB0_135
#2:	       add	r10, 16 -> r13
	;;
	       nop	2
	;;
.BB0_134:                               ; %bb62.i.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.f	r10, 16
#1:	       add	r11, 24 -> r0
	;;
#0:	       ldx	$mem, 0 -> r13
	;;
#0:	       stm.a	r13, r11, 4
#1:	       add	r10, 24 -> r13
	;;
#0:	       ldm.f	r10, 20
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       stm.a	r1, r11, 5
	;;
.BB0_135:                               ; %bb63.i.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.f	r13, 0
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       stm.a	r1, r0, 0
	;;
#0:	       ldm.f	r13, 4
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       br	.BB0_137
#1:	       stm.a	r1, r0, 1
	;;
#0:	       ldm.f	r13, 8
	;;
#0:	       ldx	$mem, 0 -> r13
	;;
#0:	       stm.a	r13, r0, 2
	;;
.BB0_136:                               ; %bb64.i.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       or	r11, 0 -> r0
#1:	       callg	_memmove
#2:	       or	r10, 0 -> r1
#3:	       or	r13, 0 -> r2
	;;
	       nop	3
	;;
.BB0_137:                               ; %bb65.i.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldga	_impure_data -> r0
#1:	       callg	__free_r
#2:	       or	r10, 0 -> r1
	;;
	       nop	3
	;;
#0:	       br	.BB0_76
#1:	       or	r11, 0 -> r0
	;;
	       nop	2
	;;
.BB0_138:                               ; %bb38.i.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       or	r10, 0 -> r1
#1:	       callg	_memmove
#2:	       or	r13, 0 -> r2
	;;
	       nop	3
	;;
.BB0_139:                               ; %split.i.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.s	r14, 68
	;;
#0:	       ldx	$mem, 0 -> r11
#1:	       ldm.s	r14, 60
	;;
#0:	       ldx	$mem, 0 -> r10
	;;
#0:	       sub	r10, r11 -> r10
	;;
#0:	       cmpult	r10, 16 -> c1
	;;
#0:	if  c1 br	.BB0_141
	;;
	       nop	2
	;;
; BB#140:                               ; %bb66.i.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.s	r14, 56
#1:	       or	r10, 1 -> r10
	;;
#0:	       ldx	$mem, 0 -> r11
	;;
#0:	       ldm.f	r11, 4
	;;
#0:	       ldx	$mem, 0 -> r0
#1:	       ldm.s	r14, 68
	;;
#0:	       and	r0, 1 -> r0
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       or	r0, r1 -> r0
#1:	       or	r1, 4 -> r2
	;;
#0:	       stm.a	r0, r11, 1
#1:	       add	r11, r2 -> r2
	;;
#0:	       ldm.s	r14, 60
	;;
#0:	       ldx	$mem, 0 -> r0
#1:	       stm.a	r10, r2, 0
	;;
#0:	       add	r0, r11 -> r0
#1:	       add	r1, r11 -> r11
	;;
#0:	       add	r11, 8 -> r1
	;;
#0:	       ldm.f	r0, 4
	;;
#0:	       callg	__free_r
#1:	       ldx	$mem, 0 -> r10
	;;
#0:	       or	r10, 1 -> r10
	;;
#0:	       stm.a	r10, r0, 1
#1:	       ldga	_impure_data -> r0
	;;
	       nop	1
	;;
#0:	       br	.BB0_142
	;;
	       nop	2
	;;
.BB0_141:                               ; %bb67.i.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.s	r14, 56
	;;
#0:	       ldx	$mem, 0 -> r10
	;;
#0:	       ldm.f	r10, 4
	;;
#0:	       ldx	$mem, 0 -> r11
#1:	       ldm.s	r14, 60
	;;
#0:	       and	r11, 1 -> r11
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       or	r11, r0 -> r11
#1:	       add	r0, r10 -> r1
	;;
#0:	       stm.a	r11, r10, 1
	;;
#0:	       ldm.f	r1, 4
	;;
#0:	       ldx	$mem, 0 -> r10
	;;
#0:	       or	r10, 1 -> r10
	;;
#0:	       stm.a	r10, r1, 1
	;;
.BB0_142:                               ; %bb68.i.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.s	r14, 56
	;;
#0:	       ldx	$mem, 0 -> r10
	;;
#0:	       add	r10, 8 -> r0
	;;
.BB0_143:                               ; %_realloc_r.exit.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       cmpeq	r0, 0 -> c1
	;;
#0:	if !c1 br	.BB0_76
	;;
	       nop	2
	;;
.BB0_144:                               ; %bb24.i.i
#0:	       ldm.s	r14, 72
#1:	       ldga	_impure_data -> r0
	;;
#0:	       ldx	$mem, 0 -> r10
	;;
#0:	       ldm.f	r10, 16
	;;
#0:	       callg	__free_r
#1:	       ldx	$mem, 0 -> r1
	;;
	       nop	3
	;;
#0:	       br	.BB0_60
	;;
	       nop	2
	;;
.BB0_145:                               ; %bb31.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.s	r14, 52
#1:	       or	r10, 0 -> r2
	;;
#0:	       callg	_memmove
#1:	       ldx	$mem, 0 -> r1
	;;
	       nop	3
	;;
#0:	       ldm.s	r14, 72
	;;
#0:	       ldx	$mem, 0 -> r11
	;;
#0:	       ldm.f	r11, 0
#1:	       or	r11, 0 -> r1
	;;
#0:	       callg	__fflush_r
#1:	       ldx	$mem, 0 -> r0
	;;
#0:	       add	r0, r10 -> r0
	;;
#0:	       stm.a	r0, r11, 0
#1:	       ldga	_impure_data -> r0
	;;
	       nop	1
	;;
#0:	       cmpne	r0, 0 -> c1
	;;
#0:	if  c1 br	.BB0_61
	;;
	       nop	2
	;;
#0:	       br	.BB0_151
	;;
	       nop	2
	;;
.BB0_146:                               ; %bb29.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.s	r14, 72
	;;
#0:	       ldx	$mem, 0 -> r11
	;;
#0:	       ldm.f	r11, 0
	;;
#0:	       ldx	$mem, 0 -> r0
#1:	       ldm.f	r11, 16
	;;
#0:	       ldx	$mem, 0 -> r11
	;;
#0:	       cmpule	r0, r11 -> c1
	;;
#0:	if !c1 ldm.s	r14, 64
	;;
#0:	if !c1 ldx	$mem, 0 -> r11
	;;
#0:	if !c1 cmpule	r11, r10 -> c1
	;;
#0:	if !c1 br	.BB0_145
	;;
	       nop	2
	;;
; BB#147:                               ; %bb32.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.s	r14, 72
	;;
#0:	       ldx	$mem, 0 -> r10
	;;
#0:	       ldm.f	r10, 20
	;;
#0:	       ldx	$mem, 0 -> r3
#1:	       ldm.s	r14, 64
	;;
#0:	       ldx	$mem, 0 -> r10
	;;
#0:	       cmpult	r10, r3 -> c1
	;;
#0:	if  c1 br	.BB0_150
	;;
	       nop	2
	;;
; BB#148:                               ; %bb33.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.s	r14, 72
#1:	       ldga	_impure_data -> r0
	;;
#0:	       ldx	$mem, 0 -> r10
	;;
#0:	       ldm.f	r10, 36
	;;
#0:	       ldx	$mem, 0 -> r11
#1:	       ldm.f	r10, 28
	;;
#0:	       ldx	$mem, 0 -> r1
#1:	       ldm.s	r14, 52
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       call	r11
	;;
	       nop	3
	;;
#0:	       cmplt	r0, 1 -> c1
	;;
#0:	if  c1 br	.BB0_61
	;;
	       nop	2
	;;
; BB#149:                               ; %bb33.i.i.bb35.i.i_crit_edge
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       or	r0, 0 -> r10
#1:	       br	.BB0_151
	;;
	       nop	2
	;;
.BB0_150:                               ; %bb34.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.s	r14, 52
#1:	       or	r10, 0 -> r2
	;;
#0:	       callg	_memmove
#1:	       ldx	$mem, 0 -> r1
	;;
	       nop	3
	;;
#0:	       ldm.s	r14, 72
	;;
#0:	       ldx	$mem, 0 -> r11
	;;
#0:	       ldm.f	r11, 8
	;;
#0:	       ldx	$mem, 0 -> r0
#1:	       ldm.f	r11, 0
	;;
#0:	       sub	r0, r10 -> r0
	;;
#0:	       ldx	$mem, 0 -> r1
#1:	       stm.a	r0, r11, 2
	;;
#0:	       add	r1, r10 -> r0
	;;
#0:	       stm.a	r0, r11, 0
	;;
.BB0_151:                               ; %bb35.i.i
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       ldm.s	r14, 48
	;;
#0:	       ldx	$mem, 0 -> r11
	;;
#0:	       cmpeq	r11, r10 -> c1
	;;
#0:	if  c1 br	.BB0_182
	;;
	       nop	2
	;;
; BB#152:                               ; %bb35.i.i.bb13.i.i_crit_edge
                                        ;   in Loop: Header=BB0_54 Depth=1
#0:	       sub	r11, r10 -> r11
	;;
#0:	       stm.s	r11, r14, 12
	;;
#0:	       ldm.s	r14, 64
	;;
#0:	       ldx	$mem, 0 -> r11
	;;
#0:	       sub	r11, r10 -> r11
	;;
#0:	       stm.s	r11, r14, 16
	;;
#0:	       br	.BB0_54
#1:	       ldm.s	r14, 52
	;;
#0:	       ldx	$mem, 0 -> r11
	;;
#0:	       add	r11, r10 -> r11
	;;
#0:	       stm.s	r11, r14, 13
	;;
.BB0_153:                               ; %bb37.i.i
                                        ;   in Loop: Header=BB0_154 Depth=1
#0:	       ldm.s	r14, 56
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       ldm.f	r0, -4
	;;
#0:	       ldx	$mem, 0 -> r10
#1:	       ldm.f	r0, 0
#2:	       add	r0, 8 -> r0
	;;
#0:	       ldx	$mem, 0 -> r11
#1:	       stm.s	r0, r14, 14
	;;
.BB0_154:                               ; %bb38.outer.i.i
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_155 Depth 2
                                        ;       Child Loop BB0_162 Depth 3
                                        ;       Child Loop BB0_169 Depth 3
                                        ;       Child Loop BB0_166 Depth 3
#0:	       ldi	0 -> r0
	;;
#0:	       stm.s	r0, r14, 16
	;;
.BB0_155:                               ; %bb38.i.i
                                        ;   Parent Loop BB0_154 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_162 Depth 3
                                        ;       Child Loop BB0_169 Depth 3
                                        ;       Child Loop BB0_166 Depth 3
#0:	       cmpeq	r11, 0 -> c1
	;;
#0:	if  c1 br	.BB0_153
	;;
	       nop	2
	;;
; BB#156:                               ; %bb39.i.i
                                        ;   in Loop: Header=BB0_155 Depth=2
#0:	       ldm.s	r14, 64
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       cmpeq	r0, 0 -> c1
	;;
#0:	if  c1 br	.BB0_158
	;;
	       nop	2
	;;
; BB#157:                               ; %bb39.i.i.bb44.i.i_crit_edge
                                        ;   in Loop: Header=BB0_155 Depth=2
#0:	       ldm.s	r14, 60
#1:	       br	.BB0_172
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       stm.s	r0, r14, 17
	;;
	       nop	0
	;;
.BB0_158:                               ; %bb39.i.i.bb5.i29.i.i_crit_edge
                                        ;   in Loop: Header=BB0_155 Depth=2
#0:	       ldi	0 -> r0
#1:	       br	.BB0_162
	;;
	       nop	2
	;;
.BB0_159:                               ; %bb.i26.i.i
                                        ;   in Loop: Header=BB0_162 Depth=3
#0:	       cmpeq	r11, r0 -> c1
	;;
#0:	if  c1 br	.BB0_170
	;;
	       nop	2
	;;
; BB#160:                               ; %bb2.i27.i.i
                                        ;   in Loop: Header=BB0_162 Depth=3
#0:	       ldm.f	r1, 0
	;;
#0:	       ldx	$membu, r1 -> r2
	;;
#0:	       cmpeq	r2, 10 -> c1
	;;
#0:	if  c1 br	.BB0_184
	;;
	       nop	2
	;;
; BB#161:                               ; %bb4.i28.i.i
                                        ;   in Loop: Header=BB0_162 Depth=3
#0:	       add	r0, 1 -> r0
	;;
.BB0_162:                               ; %bb5.i29.i.i
                                        ;   Parent Loop BB0_154 Depth=1
                                        ;     Parent Loop BB0_155 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
#0:	       add	r10, r0 -> r1
	;;
#0:	       and	r1, 3 -> r2
	;;
#0:	       cmpne	r2, 0 -> c1
	;;
#0:	if  c1 br	.BB0_159
	;;
	       nop	2
	;;
; BB#163:                               ; %bb6.i30.i.i
                                        ;   in Loop: Header=BB0_155 Depth=2
#0:	       sub	r11, r0 -> r2
#1:	       add	r10, r0 -> r1
#2:	       ldi	3 -> r0
	;;
#0:	       cmpult	r0, r2 -> c1
	;;
#0:	if  c1 br	.BB0_166
	;;
	       nop	2
	;;
#0:	       br	.BB0_169
	;;
	       nop	2
	;;
.BB0_164:                               ; %bb10.i32.i.i
                                        ;   in Loop: Header=BB0_166 Depth=3
#0:	       ldiu	522 -> r0
#1:	       ldm.f	r1, 0
#2:	       ldiu	1791 -> r5
	;;
#3:	       ldga	32896 -> r3.16
#0:	       ldim	321 -> r0
#1:	       ldim	991 -> r5
	;;
#3:	       or	r3.16, 0 -> r4
#0:	       ldx	$mem, 0 -> r3
#1:	       ldih	80 -> r0
#2:	       ldih	2039 -> r5
	;;
#0:	       ldih	1028 -> r4
#1:	       xor	r3, r0 -> r0
	;;
#0:	       and	r3, r4 -> r6
#1:	       add	r0, r5 -> r0
	;;
#0:	       xor	r6, r4 -> r3
	;;
#0:	       and	r3, r0 -> r0
	;;
#0:	       cmpeq	r0, 0 -> c1
	;;
#0:	if !c1 br	.BB0_169
	;;
	       nop	2
	;;
; BB#165:                               ; %bb12.i33.i.i
                                        ;   in Loop: Header=BB0_166 Depth=3
#0:	       sub	r2, 4 -> r2
#1:	       add	r1, 4 -> r1
	;;
.BB0_166:                               ; %bb13.i37.i.i
                                        ;   Parent Loop BB0_154 Depth=1
                                        ;     Parent Loop BB0_155 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
#0:	       ldi	3 -> r0
	;;
#0:	       cmpult	r0, r2 -> c1
	;;
#0:	if  c1 br	.BB0_164
	;;
	       nop	2
	;;
#0:	       br	.BB0_169
	;;
	       nop	2
	;;
.BB0_167:                               ; %bb15.i38.i.i
                                        ;   in Loop: Header=BB0_169 Depth=3
#0:	       ldm.f	r1, 0
	;;
#0:	       ldx	$membu, r1 -> r0
	;;
#0:	       cmpne	r0, 10 -> c1
	;;
#0:	if !c1 br	.BB0_184
	;;
	       nop	2
	;;
; BB#168:                               ; %bb17.i40.i.i
                                        ;   in Loop: Header=BB0_169 Depth=3
#0:	       sub	r2, 1 -> r2
#1:	       add	r1, 1 -> r1
	;;
.BB0_169:                               ; %bb18.i42.i.i
                                        ;   Parent Loop BB0_154 Depth=1
                                        ;     Parent Loop BB0_155 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
#0:	       cmpeq	r2, 0 -> c1
	;;
#0:	if !c1 br	.BB0_167
	;;
	       nop	2
	;;
.BB0_170:                               ; %bb42.i.i
                                        ;   in Loop: Header=BB0_155 Depth=2
#0:	       add	r11, 1 -> r0
	;;
.BB0_171:                               ; %bb42.i.i
                                        ;   in Loop: Header=BB0_155 Depth=2
#0:	       stm.s	r0, r14, 17
#1:	       ldi	1 -> r0
	;;
#0:	       stm.s	r0, r14, 16
	;;
.BB0_172:                               ; %bb44.i.i
                                        ;   in Loop: Header=BB0_155 Depth=2
#0:	       ldm.s	r14, 72
#1:	       or	r11, 0 -> r12
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       ldm.f	r1, 20
	;;
#0:	       ldx	$mem, 0 -> r3
#1:	       ldm.f	r1, 8
	;;
#0:	       ldx	$mem, 0 -> r2
#1:	       ldm.f	r1, 0
	;;
#0:	       ldx	$mem, 0 -> r0
#1:	       ldm.s	r14, 68
	;;
#0:	       ldx	$mem, 0 -> r4
#1:	       ldm.f	r1, 16
	;;
#0:	       cmpule	r4, r11 -> c1
	;;
#0:	       ldx	$mem, 0 -> r1
#1:	if  c1 or	r4, 0 -> r12
	;;
#0:	       cmpule	r0, r1 -> c1
	;;
#0:	if !c1 add	r3, r2 -> r13
	;;
#0:	if !c1 cmple	r12, r13 -> c1
	;;
#0:	if  c1 br	.BB0_174
	;;
	       nop	2
	;;
; BB#173:                               ; %bb48.i.i
                                        ;   in Loop: Header=BB0_155 Depth=2
#0:	       or	r10, 0 -> r1
#1:	       callg	_memmove
#2:	       or	r13, 0 -> r2
	;;
	       nop	3
	;;
#0:	       ldm.s	r14, 72
#1:	       ldga	_impure_data -> r0
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       ldm.f	r1, 0
	;;
#0:	       callg	__fflush_r
#1:	       ldx	$mem, 0 -> r12
	;;
#0:	       add	r12, r13 -> r12
	;;
#0:	       stm.a	r12, r1, 0
	;;
	       nop	1
	;;
#0:	       cmpne	r0, 0 -> c1
	;;
#0:	if  c1 br	.BB0_61
	;;
	       nop	2
	;;
#0:	       br	.BB0_178
	;;
	       nop	2
	;;
.BB0_174:                               ; %bb49.i.i
                                        ;   in Loop: Header=BB0_155 Depth=2
#0:	       cmplt	r12, r3 -> c1
	;;
#0:	if  c1 br	.BB0_177
	;;
	       nop	2
	;;
; BB#175:                               ; %bb50.i.i
                                        ;   in Loop: Header=BB0_155 Depth=2
#0:	       ldm.s	r14, 72
#1:	       ldga	_impure_data -> r0
#2:	       or	r10, 0 -> r2
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       ldm.f	r1, 36
	;;
#0:	       ldx	$mem, 0 -> r12
#1:	       ldm.f	r1, 28
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       call	r12
	;;
	       nop	3
	;;
#0:	       cmplt	r0, 1 -> c1
	;;
#0:	if  c1 br	.BB0_61
	;;
	       nop	2
	;;
; BB#176:                               ; %bb50.i.i.bb52.i.i_crit_edge
                                        ;   in Loop: Header=BB0_155 Depth=2
#0:	       or	r0, 0 -> r13
#1:	       br	.BB0_178
	;;
	       nop	2
	;;
.BB0_177:                               ; %bb51.i.i
                                        ;   in Loop: Header=BB0_155 Depth=2
#0:	       or	r10, 0 -> r1
#1:	       callg	_memmove
#2:	       or	r12, 0 -> r2
	;;
	       nop	3
	;;
#0:	       ldm.s	r14, 72
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       ldm.f	r1, 8
	;;
#0:	       ldx	$mem, 0 -> r13
#1:	       ldm.f	r1, 0
	;;
#0:	       sub	r13, r12 -> r13
	;;
#0:	       ldx	$mem, 0 -> r0
#1:	       stm.a	r13, r1, 2
	;;
#0:	       add	r0, r12 -> r13
	;;
#0:	       stm.a	r13, r1, 0
#1:	       or	r12, 0 -> r13
	;;
.BB0_178:                               ; %bb52.i.i
                                        ;   in Loop: Header=BB0_155 Depth=2
#0:	       ldm.s	r14, 68
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       cmpeq	r0, r13 -> c1
#1:	       sub	r0, r13 -> r1
	;;
#0:	if !c1 br	.BB0_181
#1:	       stm.s	r1, r14, 15
	;;
	       nop	2
	;;
; BB#179:                               ; %bb53.i.i
                                        ;   in Loop: Header=BB0_155 Depth=2
#0:	       ldm.s	r14, 72
#1:	       ldga	_impure_data -> r0
	;;
#0:	       callg	__fflush_r
#1:	       ldx	$mem, 0 -> r1
	;;
	       nop	3
	;;
#0:	       cmpne	r0, 0 -> c1
	;;
#0:	if  c1 br	.BB0_61
	;;
	       nop	2
	;;
; BB#180:                               ; %bb53.i.i.bb55.i.i_crit_edge
                                        ;   in Loop: Header=BB0_155 Depth=2
#0:	       ldi	0 -> r0
	;;
#0:	       stm.s	r0, r14, 16
	;;
.BB0_181:                               ; %bb55.i.i
                                        ;   in Loop: Header=BB0_155 Depth=2
#0:	       ldm.s	r14, 48
#1:	       add	r10, r13 -> r10
#2:	       sub	r11, r13 -> r11
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       cmpeq	r1, r13 -> c1
#1:	       sub	r1, r13 -> r0
	;;
#0:	if !c1 br	.BB0_155
#1:	       or	r0, 0 -> r1
	;;
#0:	       stm.s	r1, r14, 12
	;;
	       nop	1
	;;
.BB0_182:                               ; %puts.exit
#0:	       ldm.s	r14, 92
#1:	       or	r14, 0 -> r15
#2:	       ldi	0 -> r0
	;;
#2:	       ldx	$mem, 0 -> r2.23
#0:	       ldm.s	r14, 96
	;;
#0:	       ldx	$mem, 0 -> r0.23
#1:	       ldm.s	r14, 100
	;;
#0:	       ldx	$mem, 0 -> r13
#1:	       ldm.s	r14, 104
	;;
#0:	       ldx	$mem, 0 -> r12
#1:	       ldm.s	r14, 108
	;;
#0:	       ldx	$mem, 0 -> r11
#1:	       ldm.s	r14, 112
	;;
#0:	       ldx	$mem, 0 -> r10
#1:	       ldm.s	r15, 8
	;;
#3:	       ldx	$mem, 0 -> r3.31
#0:	       ldm.s	r15, 4
	;;
#3:	       stx	r3.31 -> $ro
	;;
#0:	       ldx	$mem, 0 -> r0.31
	;;
#0:	       stx	r0.31 -> $rb
	;;
.BB0_183:                               ; %puts.exit
#0:	       ldm.s	r15, 0
#1:	       s2add	r15, 29 -> r15
	;;
#0:	       ret
#1:	       ldx	$mem, 0 -> r14
	;;
	       nop	3
	;;
.BB0_184:                               ; %bb41.i.i
                                        ;   in Loop: Header=BB0_155 Depth=2
#0:	       add	r1, 1 -> r0
#1:	       br	.BB0_171
	;;
#0:	       sub	r0, r10 -> r0
	;;
	       nop	1
	;;
	.align	4
_main_end:

	.align	4
__fflush_r:                             ; @_fflush_r
	.size	__fflush_r_end-__fflush_r
__fflush_r_start:
; BB#0:                                 ; %entry
#1:	       wb.s	r15, 10
#2:	       ldiu	40 -> r2
#0:	       ldx	$ro, 0 -> r0.31
#3:	       cmpeq	r0, 0 -> c1     ; fflush.c:224
	;;
#0:	       sub	r15, r2 -> r15
	;;
#3:	       ldx	$rb, 0 -> r3.31
	;;
#0:	       stm.s	r14, r15, 0
#1:	       or	r15, 0 -> r14
	;;
#3:	       stm.s	r3.31, r15, 1
	;;
#0:	       stm.s	r0.31, r15, 2
	;;
#0:	       stm.s	r10, r14, 9
#1:	       or	r1, 0 -> r10
	;;
#0:	       stm.s	r11, r14, 8
	;;
#0:	       stm.s	r12, r14, 7
	;;
#0:	       stm.s	r13, r14, 6
	;;
#0:	       stm.s	r0, r14, 5
	;;
#0:	if !c1 ldm.f	r0, 56          ; fflush.c:224
	;;
#0:	if !c1 ldx	$mem, 0 -> r0   ; fflush.c:224
	;;
#0:	if !c1 cmpne	r0, 0 -> c1     ; fflush.c:224
	;;
#0:	if  c1 br	.BB1_2
	;;
	       nop	2
	;;
; BB#1:                                 ; %bb1
#0:	       ldm.s	r14, 20         ; fflush.c:224
	;;
#0:	       callg	___sinit        ; fflush.c:224
#1:	       ldx	$mem, 0 -> r0   ; fflush.c:224
	;;                              ; fflush.c:224
	       nop	3               ; fflush.c:224
	;;
.BB1_2:                                 ; %bb2
#0:	       add	r10, 12 -> r0   ; fflush.c:226
	;;
#0:	       stm.s	r0, r14, 4      ; fflush.c:226
	;;
#0:	       ldm.f	r10, 12         ; fflush.c:226
	;;
#0:	       ldx	$memhu, r0 -> r0 ; fflush.c:226
	;;
#0:	       cmpeq	r0, 0 -> c1     ; fflush.c:226
	;;
#0:	if  c1 br	.BB1_43
	;;
	       nop	2
	;;
; BB#3:                                 ; %bb4
#0:	       mask	r0, 12 -> r1    ; fflush.c:80[ fflush.c:230 ]
	;;
#0:	       btest	r1, 3 -> c1     ; fflush.c:81[ fflush.c:230 ]
	;;
#0:	if  c1 br	.BB1_34         ; fflush.c:81[ fflush.c:230 ]
	;;                              ; fflush.c:81[ fflush.c:230 ]
	       nop	2               ; fflush.c:81[ fflush.c:230 ]
	;;
; BB#4:                                 ; %bb.i
#0:	       ldm.f	r10, 4          ; fflush.c:95[ fflush.c:230 ]
#1:	       ldi	0 -> r3
#2:	       ldga	2048 -> r2
	;;
#0:	       or	r0, r2 -> r0    ; fflush.c:86[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; fflush.c:95[ fflush.c:230 ]
#1:	       stmh.a	r0, r10, 6      ; fflush.c:86[ fflush.c:230 ]
	;;
#0:	       cmplt	r3, r1 -> c1    ; fflush.c:95[ fflush.c:230 ]
	;;
#0:	if  c1 br	.BB1_6
	;;
	       nop	2
	;;
; BB#5:                                 ; %bb1.i
#0:	       ldm.f	r10, 60         ; fflush.c:95[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; fflush.c:95[ fflush.c:230 ]
	;;
#0:	       cmplt	r1, 1 -> c1     ; fflush.c:95[ fflush.c:230 ]
	;;
#0:	if  c1 br	.BB1_43
	;;
	       nop	2
	;;
.BB1_6:                                 ; %bb2.i
#0:	       ldm.f	r10, 40         ; fflush.c:95[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; fflush.c:95[ fflush.c:230 ]
	;;
#0:	       cmpeq	r1, 0 -> c1     ; fflush.c:95[ fflush.c:230 ]
	;;
#0:	if  c1 br	.BB1_43
	;;
	       nop	2
	;;
; BB#7:                                 ; %bb3.i
#0:	       ldm.s	r14, 20         ; fflush.c:107[ fflush.c:230 ]
#1:	       ldga	___mem_emergency -> r1
	;;
#0:	       ldx	$mem, 0 -> r0   ; fflush.c:107[ fflush.c:230 ]
	;;
#0:	       ldm.f	r0, 0           ; fflush.c:107[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r11  ; fflush.c:107[ fflush.c:230 ]
#1:	       stm.a	0, r0, 0        ; fflush.c:108[ fflush.c:230 ]
	;;
#0:	       ldm.f	r10, 12
	;;
#1:	       ldx	$mem, 0 -> r1.31
	;;
#1:	       stm.a	r1.31, r1, 0
	;;
#0:	       ldm.s	r14, 16
	;;
#0:	       ldx	$mem, 0 -> r1
#1:	       ldmg.d	___mem_emergency
	;;
#0:	       ldx	$memhu, r1 -> r1
	;;
#0:	       btest	r1, 12 -> c1    ; fflush.c:110[ fflush.c:230 ]
	;;
#0:	if !c1 br	.BB1_11         ; fflush.c:110[ fflush.c:230 ]
	;;                              ; fflush.c:110[ fflush.c:230 ]
	       nop	2               ; fflush.c:110[ fflush.c:230 ]
	;;
; BB#8:                                 ; %bb4.i
#0:	       ldm.f	r10, 80         ; fflush.c:111[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; fflush.c:111[ fflush.c:230 ]
	;;
.BB1_9:                                 ; %bb12.i
#0:	       ldm.f	r10, 12         ; fflush.c:135[ fflush.c:230 ]
#1:	       ldga	___mem_emergency -> r1 ; fflush.c:135[ fflush.c:230 ]
	;;
#3:	       ldx	$mem, 0 -> r3.31 ; fflush.c:135[ fflush.c:230 ]
	;;
#3:	       stm.a	r3.31, r1, 0    ; fflush.c:135[ fflush.c:230 ]
	;;
#0:	       ldm.s	r14, 16         ; fflush.c:135[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; fflush.c:135[ fflush.c:230 ]
#1:	       ldmg.d	___mem_emergency ; fflush.c:135[ fflush.c:230 ]
	;;
#0:	       ldx	$membu, r1 -> r1 ; fflush.c:135[ fflush.c:230 ]
	;;
#0:	       btest	r1, 2 -> c1     ; fflush.c:135[ fflush.c:230 ]
	;;
#0:	if  c1 br	.BB1_18
	;;
	       nop	2
	;;
; BB#10:                                ; %bb12.i.bb15.i_crit_edge
#0:	       or	r0, 0 -> r2
#1:	       br	.BB1_19
	;;
	       nop	2
	;;
.BB1_11:                                ; %bb5.i
#0:	       ldm.f	r10, 40         ; fflush.c:121[ fflush.c:230 ]
#1:	       ldi	0 -> r2
#2:	       ldi	1 -> r3
	;;
#0:	       ldx	$mem, 0 -> r4   ; fflush.c:121[ fflush.c:230 ]
#1:	       ldm.f	r10, 28         ; fflush.c:121[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; fflush.c:121[ fflush.c:230 ]
	;;
#0:	       call	r4              ; fflush.c:121[ fflush.c:230 ]
	;;                              ; fflush.c:121[ fflush.c:230 ]
	       nop	3               ; fflush.c:121[ fflush.c:230 ]
	;;
#0:	       cmpeq	r0, -1 -> c1    ; fflush.c:122[ fflush.c:230 ]
	;;
#0:	if !c1 br	.BB1_9
	;;
	       nop	2
	;;
; BB#12:                                ; %bb6.i
#0:	       ldm.s	r14, 20         ; fflush.c:122[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; fflush.c:122[ fflush.c:230 ]
	;;
#0:	       ldm.f	r1, 0           ; fflush.c:122[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; fflush.c:122[ fflush.c:230 ]
	;;
#0:	       cmpeq	r1, 0 -> c1
	;;
#0:	if  c1 br	.BB1_9
	;;
	       nop	2
	;;
; BB#13:                                ; %bb6.i
#0:	       ldi	22 -> r0
	;;
#0:	       cmpeq	r1, r0 -> c1
	;;
#0:	if  c1 br	.BB1_15
	;;
	       nop	2
	;;
; BB#14:                                ; %bb6.i
#0:	       ldi	29 -> r0
	;;
#0:	       cmpne	r1, r0 -> c1
	;;
#0:	if  c1 br	.BB1_16
	;;
	       nop	2
	;;
.BB1_15:                                ; %bb9.i
#0:	       ldm.s	r14, 20         ; fflush.c:128[ fflush.c:230 ]
#1:	       br	.BB1_30
	;;
#0:	       ldx	$mem, 0 -> r0   ; fflush.c:128[ fflush.c:230 ]
	;;
#0:	       stm.a	r11, r0, 0      ; fflush.c:128[ fflush.c:230 ]
	;;
	       nop	0
	;;
.BB1_16:                                ; %bb10.i
#0:	       ldm.f	r10, 12         ; fflush.c:131[ fflush.c:230 ]
#1:	       ldga	___mem_emergency -> r1 ; fflush.c:131[ fflush.c:230 ]
#2:	       ldi	64 -> r11
	;;
#2:	       ldx	$mem, 0 -> r2.31 ; fflush.c:131[ fflush.c:230 ]
	;;
#2:	       stm.a	r2.31, r1, 0    ; fflush.c:131[ fflush.c:230 ]
	;;
#0:	       ldm.s	r14, 16         ; fflush.c:131[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; fflush.c:131[ fflush.c:230 ]
#1:	       ldmg.d	___mem_emergency ; fflush.c:131[ fflush.c:230 ]
	;;
#0:	       ldx	$memhu, r1 -> r1 ; fflush.c:131[ fflush.c:230 ]
	;;
#0:	       or	r1, r11 -> r1   ; fflush.c:131[ fflush.c:230 ]
	;;
.BB1_17:                                ; %bb10.i
#0:	       stmh.a	r1, r10, 6      ; fflush.c:131[ fflush.c:230 ]
#1:	       br	.BB1_44
#2:	       ldi	-1 -> r0
	;;
	       nop	2
	;;
.BB1_18:                                ; %bb13.i
#0:	       ldm.f	r10, 4          ; fflush.c:139[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; fflush.c:139[ fflush.c:230 ]
#1:	       ldm.f	r10, 48         ; fflush.c:140[ fflush.c:230 ]
	;;
#0:	       sub	r0, r1 -> r2    ; fflush.c:139[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r3   ; fflush.c:140[ fflush.c:230 ]
	;;
#0:	       cmpne	r3, 0 -> c1     ; fflush.c:140[ fflush.c:230 ]
	;;
#0:	if  c1 ldm.f	r10, 60         ; fflush.c:141[ fflush.c:230 ]
	;;
#0:	if  c1 ldx	$mem, 0 -> r1   ; fflush.c:141[ fflush.c:230 ]
	;;
#0:	if  c1 sub	r2, r1 -> r2    ; fflush.c:141[ fflush.c:230 ]
	;;
.BB1_19:                                ; %bb15.i
#0:	       ldm.f	r10, 40         ; fflush.c:149[ fflush.c:230 ]
#1:	       ldi	0 -> r3
	;;
#0:	       ldx	$mem, 0 -> r4   ; fflush.c:149[ fflush.c:230 ]
#1:	       ldm.f	r10, 28         ; fflush.c:149[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; fflush.c:149[ fflush.c:230 ]
#1:	       ldm.s	r14, 20         ; fflush.c:149[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; fflush.c:149[ fflush.c:230 ]
	;;
#0:	       call	r4              ; fflush.c:149[ fflush.c:230 ]
	;;                              ; fflush.c:149[ fflush.c:230 ]
	       nop	3               ; fflush.c:149[ fflush.c:230 ]
	;;
#0:	       cmpne	r0, -1 -> c1    ; fflush.c:150[ fflush.c:230 ]
	;;
#0:	if  c1 br	.BB1_22
	;;
	       nop	2
	;;
; BB#20:                                ; %bb16.i
#0:	       ldm.s	r14, 20         ; fflush.c:150[ fflush.c:230 ]
#1:	       ldi	29 -> r2
	;;
#0:	       ldx	$mem, 0 -> r1   ; fflush.c:150[ fflush.c:230 ]
	;;
#0:	       ldm.f	r1, 0           ; fflush.c:150[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; fflush.c:150[ fflush.c:230 ]
	;;
#0:	       cmpult	r2, r1 -> c1
	;;
#0:	if  c1 br	.BB1_33
	;;
	       nop	2
	;;
; BB#21:                                ; %bb16.i
#0:	       ldiu	1 -> r2
#1:	       ldi	1 -> r3
	;;
#0:	       ldim	0 -> r2
#1:	       sl	r3, r1 -> r1
	;;
#0:	       ldih	258 -> r2
	;;
#0:	       and	r1, r2 -> r1
	;;
#0:	       cmpne	r1, 0 -> c1
	;;
#0:	if !c1 br	.BB1_33
	;;
	       nop	2
	;;
.BB1_22:                                ; %bb19.i
#0:	       ldm.f	r10, 12         ; fflush.c:155[ fflush.c:230 ]
#1:	       ldga	___mem_emergency -> r2 ; fflush.c:155[ fflush.c:230 ]
#2:	       ldiu	2047 -> r1
	;;
#0:	       ldim	30 -> r1
	;;
#1:	       ldx	$mem, 0 -> r1.31 ; fflush.c:155[ fflush.c:230 ]
	;;
#1:	       stm.a	r1.31, r2, 0    ; fflush.c:155[ fflush.c:230 ]
	;;
#0:	       ldm.s	r14, 16         ; fflush.c:155[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r2   ; fflush.c:155[ fflush.c:230 ]
#1:	       ldmg.d	___mem_emergency ; fflush.c:155[ fflush.c:230 ]
	;;
#0:	       ldx	$memhu, r2 -> r2 ; fflush.c:155[ fflush.c:230 ]
#1:	       ldm.f	r10, 16         ; fflush.c:157[ fflush.c:230 ]
	;;
#0:	       and	r2, r1 -> r1    ; fflush.c:155[ fflush.c:230 ]
#1:	       btest	r2, 12 -> c1    ; fflush.c:158[ fflush.c:230 ]
	;;
#0:	if !c1 br	.BB1_26
#1:	       ldx	$mem, 0 -> r3   ; fflush.c:157[ fflush.c:230 ]
	;;
#0:	       stm.a	r3, r10, 0      ; fflush.c:157[ fflush.c:230 ]
	;;
#0:	       stmh.a	r1, r10, 6      ; fflush.c:155[ fflush.c:230 ]
	;;
#0:	       stm.a	0, r10, 1       ; fflush.c:156[ fflush.c:230 ]
	;;
; BB#23:                                ; %bb20.i
#0:	       cmpne	r0, -1 -> c1    ; fflush.c:158[ fflush.c:230 ]
	;;
#0:	if  c1 br	.BB1_25
	;;
	       nop	2
	;;
; BB#24:                                ; %bb21.i
#0:	       ldm.s	r14, 20         ; fflush.c:158[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; fflush.c:158[ fflush.c:230 ]
	;;
#0:	       br	.BB1_26
#1:	       ldm.f	r1, 0           ; fflush.c:158[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; fflush.c:158[ fflush.c:230 ]
	;;
#0:	       cmpne	r1, 0 -> c1     ; fflush.c:158[ fflush.c:230 ]
	;;
#0:	if !c1 stm.a	r0, r10, 20     ; fflush.c:159[ fflush.c:230 ]
	;;
.BB1_25:                                ; %bb22.i
#0:	       stm.a	r0, r10, 20     ; fflush.c:159[ fflush.c:230 ]
	;;
.BB1_26:                                ; %bb23.i
#0:	       ldm.s	r14, 20         ; fflush.c:160[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; fflush.c:160[ fflush.c:230 ]
	;;
#0:	       stm.a	r11, r0, 0      ; fflush.c:160[ fflush.c:230 ]
	;;
#0:	       ldm.f	r10, 48         ; fflush.c:161[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; fflush.c:161[ fflush.c:230 ]
	;;
#0:	       cmpeq	r1, 0 -> c1     ; fflush.c:161[ fflush.c:230 ]
	;;
#0:	if  c1 br	.BB1_43
	;;
	       nop	2
	;;
; BB#27:                                ; %bb24.i
#0:	       s2add	r10, 16 -> r0
	;;
#0:	       cmpeq	r1, r0 -> c1    ; fflush.c:162[ fflush.c:230 ]
	;;
#0:	if  c1 br	.BB1_29
	;;
	       nop	2
	;;
; BB#28:                                ; %bb25.i
#0:	       ldm.s	r14, 20         ; fflush.c:162[ fflush.c:230 ]
	;;
#0:	       callg	__free_r        ; fflush.c:162[ fflush.c:230 ]
#1:	       ldx	$mem, 0 -> r0   ; fflush.c:162[ fflush.c:230 ]
	;;                              ; fflush.c:162[ fflush.c:230 ]
	       nop	3               ; fflush.c:162[ fflush.c:230 ]
	;;
.BB1_29:                                ; %bb26.i
#0:	       stm.a	0, r10, 12      ; fflush.c:162[ fflush.c:230 ]
	;;
.BB1_30:                                ; %bb26.i
#0:	       ldi	0 -> r0
	;;
.BB1_31:                                ; %bb26.i
#0:	       ldm.s	r14, 24         ; fflush.c:232
#1:	       or	r14, 0 -> r15   ; fflush.c:232
	;;
#0:	       ldx	$mem, 0 -> r13  ; fflush.c:232
#1:	       ldm.s	r14, 28         ; fflush.c:232
	;;
#0:	       ldx	$mem, 0 -> r12  ; fflush.c:232
#1:	       ldm.s	r14, 32         ; fflush.c:232
	;;
#0:	       ldx	$mem, 0 -> r11  ; fflush.c:232
#1:	       ldm.s	r14, 36         ; fflush.c:232
	;;
#0:	       ldx	$mem, 0 -> r10  ; fflush.c:232
#1:	       ldm.s	r15, 8          ; fflush.c:232
	;;
#1:	       ldx	$mem, 0 -> r1.31 ; fflush.c:232
#0:	       ldm.s	r15, 4          ; fflush.c:232
	;;
#1:	       stx	r1.31 -> $ro    ; fflush.c:232
	;;
#2:	       ldx	$mem, 0 -> r2.31 ; fflush.c:232
	;;
#2:	       stx	r2.31 -> $rb    ; fflush.c:232
	;;
.BB1_32:                                ; %bb26.i
#0:	       ldm.s	r15, 0          ; fflush.c:232
#1:	       s2add	r15, 10 -> r15  ; fflush.c:232
	;;
#0:	       ret                      ; fflush.c:232
#1:	       ldx	$mem, 0 -> r14  ; fflush.c:232
	;;                              ; fflush.c:232
	       nop	3               ; fflush.c:232
	;;
.BB1_33:                                ; %bb27.i
#0:	       ldm.f	r10, 12         ; fflush.c:166[ fflush.c:230 ]
#1:	       ldga	___mem_emergency -> r1 ; fflush.c:166[ fflush.c:230 ]
#2:	       ldi	64 -> r0
	;;
#0:	       ldx	$mem, 0 -> r0.31 ; fflush.c:166[ fflush.c:230 ]
	;;
#0:	       stm.a	r0.31, r1, 0    ; fflush.c:166[ fflush.c:230 ]
	;;
#0:	       br	.BB1_17
#1:	       ldm.s	r14, 16         ; fflush.c:166[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; fflush.c:166[ fflush.c:230 ]
#1:	       ldmg.d	___mem_emergency ; fflush.c:166[ fflush.c:230 ]
	;;
#0:	       ldx	$memhu, r1 -> r1 ; fflush.c:166[ fflush.c:230 ]
	;;
#0:	       or	r1, r0 -> r1    ; fflush.c:166[ fflush.c:230 ]
	;;
.BB1_34:                                ; %bb29.i
#0:	       ldm.f	r10, 16         ; fflush.c:172[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r11  ; fflush.c:172[ fflush.c:230 ]
	;;
#0:	       cmpeq	r11, 0 -> c1    ; fflush.c:172[ fflush.c:230 ]
	;;
#0:	if  c1 br	.BB1_43
	;;
	       nop	2
	;;
; BB#35:                                ; %bb31.i
#0:	       and	r1, 3 -> r1     ; fflush.c:185[ fflush.c:230 ]
#1:	       ldm.f	r10, 0          ; fflush.c:177[ fflush.c:230 ]
	;;
#0:	       cmpeq	r1, 0 -> c1     ; fflush.c:185[ fflush.c:230 ]
	;;
#0:	if  c1 br	.BB1_37         ; fflush.c:185[ fflush.c:230 ]
#1:	       ldx	$mem, 0 -> r0   ; fflush.c:177[ fflush.c:230 ]
#2:	       stm.a	r11, r10, 0     ; fflush.c:184[ fflush.c:230 ]
	;;
#0:	       sub	r0, r11 -> r12  ; fflush.c:177[ fflush.c:230 ]
	;;                              ; fflush.c:185[ fflush.c:230 ]
	       nop	1               ; fflush.c:185[ fflush.c:230 ]
	;;
; BB#36:                                ; %bb31.i.bb34.i_crit_edge
#0:	       ldi	0 -> r0
#1:	       br	.BB1_38
	;;
	       nop	2
	;;
.BB1_37:                                ; %bb32.i
#0:	       ldm.f	r10, 20         ; fflush.c:185[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; fflush.c:185[ fflush.c:230 ]
	;;
.BB1_38:                                ; %bb34.i
#0:	       stm.a	r0, r10, 2      ; fflush.c:185[ fflush.c:230 ]
#1:	       br	.BB1_42
#2:	       ldi	0 -> r13
	;;
	       nop	2
	;;
.BB1_39:                                ; %bb35.i
                                        ;   in Loop: Header=BB1_42 Depth=1
#0:	       ldm.f	r10, 36         ; fflush.c:189[ fflush.c:230 ]
#1:	       or	r11, 0 -> r2    ; fflush.c:189[ fflush.c:230 ]
#2:	       or	r12, 0 -> r3    ; fflush.c:189[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r4   ; fflush.c:189[ fflush.c:230 ]
#1:	       ldm.f	r10, 28         ; fflush.c:189[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; fflush.c:189[ fflush.c:230 ]
#1:	       ldm.s	r14, 20         ; fflush.c:189[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; fflush.c:189[ fflush.c:230 ]
	;;
#0:	       call	r4              ; fflush.c:189[ fflush.c:230 ]
	;;                              ; fflush.c:189[ fflush.c:230 ]
	       nop	3               ; fflush.c:189[ fflush.c:230 ]
	;;
#0:	       cmplt	r13, r0 -> c1   ; fflush.c:190[ fflush.c:230 ]
	;;
#0:	if  c1 br	.BB1_41         ; fflush.c:190[ fflush.c:230 ]
	;;                              ; fflush.c:190[ fflush.c:230 ]
	       nop	2               ; fflush.c:190[ fflush.c:230 ]
	;;
; BB#40:                                ; %bb36.i
#0:	       ldm.f	r10, 12         ; fflush.c:192[ fflush.c:230 ]
#1:	       ldga	___mem_emergency -> r11 ; fflush.c:192[ fflush.c:230 ]
#2:	       ldi	64 -> r12
#3:	       ldi	-1 -> r0
	;;
#2:	       ldx	$mem, 0 -> r2.31 ; fflush.c:192[ fflush.c:230 ]
	;;
#2:	       stm.a	r2.31, r11, 0   ; fflush.c:192[ fflush.c:230 ]
	;;
#0:	       ldm.s	r14, 16         ; fflush.c:192[ fflush.c:230 ]
	;;
#0:	       br	.BB1_31
#1:	       ldx	$mem, 0 -> r11  ; fflush.c:192[ fflush.c:230 ]
#2:	       ldmg.d	___mem_emergency ; fflush.c:192[ fflush.c:230 ]
	;;
#0:	       ldx	$memhu, r11 -> r11 ; fflush.c:192[ fflush.c:230 ]
	;;
#0:	       or	r11, r12 -> r11 ; fflush.c:192[ fflush.c:230 ]
	;;
#0:	       stmh.a	r11, r10, 6     ; fflush.c:192[ fflush.c:230 ]
	;;
.BB1_41:                                ; %bb37.i
                                        ;   in Loop: Header=BB1_42 Depth=1
#0:	       sub	r12, r0 -> r12  ; fflush.c:196[ fflush.c:230 ]
#1:	       add	r11, r0 -> r11  ; fflush.c:195[ fflush.c:230 ]
	;;
.BB1_42:                                ; %bb38.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       cmplt	r13, r12 -> c1  ; fflush.c:187[ fflush.c:230 ]
	;;
#0:	if  c1 br	.BB1_39         ; fflush.c:187[ fflush.c:230 ]
	;;                              ; fflush.c:187[ fflush.c:230 ]
	       nop	2               ; fflush.c:187[ fflush.c:230 ]
	;;
.BB1_43:                                ; %__sflush_r.exit
#0:	       ldi	0 -> r0
	;;
.BB1_44:                                ; %__sflush_r.exit
#0:	       ldm.s	r14, 24         ; fflush.c:232
#1:	       or	r14, 0 -> r15   ; fflush.c:232
	;;
#0:	       ldx	$mem, 0 -> r13  ; fflush.c:232
#1:	       ldm.s	r14, 28         ; fflush.c:232
	;;
#0:	       ldx	$mem, 0 -> r12  ; fflush.c:232
#1:	       ldm.s	r14, 32         ; fflush.c:232
	;;
#0:	       ldx	$mem, 0 -> r11  ; fflush.c:232
#1:	       ldm.s	r14, 36         ; fflush.c:232
	;;
#0:	       ldx	$mem, 0 -> r10  ; fflush.c:232
#1:	       ldm.s	r15, 8          ; fflush.c:232
	;;
#0:	       br	.BB1_32
#3:	       ldx	$mem, 0 -> r3.31 ; fflush.c:232
#1:	       ldm.s	r15, 4          ; fflush.c:232
	;;
#3:	       stx	r3.31 -> $ro    ; fflush.c:232
	;;
#0:	       ldx	$mem, 0 -> r0.31 ; fflush.c:232
	;;
#0:	       stx	r0.31 -> $rb    ; fflush.c:232
	;;
	.align	4
__fflush_r_end:

	.align	4
__free_r:                               ; @_free_r
	.size	__free_r_end-__free_r
__free_r_start:
; BB#0:                                 ; %entry
#0:	       cmpeq	r1, 0 -> c1     ; mallocr.c:2644
#1:	       ldiu	4 -> r0         ; mallocr.c:2644
#2:	       wb.s	r15, 1          ; mallocr.c:2644
	;;
#0:	if  c1 br	.BB2_15
#1:	       sub	r15, r0 -> r15  ; mallocr.c:2644
	;;
	       nop	2
	;;
; BB#1:                                 ; %bb
#0:	       ldm.f	r1, -4          ; mallocr.c:2650
#1:	       ldi	-2 -> r2
#2:	       ldi	-4 -> r5
#3:	       sub	r1, 8 -> r7     ; mallocr.c:2649
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2650
	;;
#0:	       and	r0, r2 -> r2    ; mallocr.c:2663
	;;
#0:	       sub	r2, 4 -> r3
#1:	       sub	r2, 8 -> r6
	;;
#0:	       add	r1, r3 -> r3
#1:	       add	r1, r6 -> r8    ; mallocr.c:2664
	;;
#0:	       ldm.f	r3, 0           ; mallocr.c:2665
	;;
#0:	       ldx	$mem, 0 -> r4   ; mallocr.c:2665
#1:	       ldmg.d	___malloc_av_+8 ; mallocr.c:2667
	;;
#0:	       and	r4, r5 -> r4    ; mallocr.c:2665
	;;
#0:	       ldx	$mem, 0 -> r5   ; mallocr.c:2667
	;;
#0:	       cmpne	r5, r8 -> c1    ; mallocr.c:2667
	;;
#0:	if  c1 br	.BB2_16         ; mallocr.c:2667
	;;                              ; mallocr.c:2667
	       nop	2               ; mallocr.c:2667
	;;
; BB#2:                                 ; %bb1
#0:	       btest	r0, 0 -> c1     ; mallocr.c:2671
#1:	       add	r4, r2 -> r2    ; mallocr.c:2669
	;;
#0:	if  c1 br	.BB2_4
	;;
	       nop	2
	;;
; BB#3:                                 ; %bb2
#0:	       ldm.f	r1, -8          ; mallocr.c:2673
#1:	       ldi	-8 -> r3
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2673
	;;
#0:	       sub	r3, r0 -> r3
#1:	       add	r0, r2 -> r2    ; mallocr.c:2675
	;;
#0:	       add	r1, r3 -> r7    ; mallocr.c:2674
	;;
#0:	       ldm.f	r7, 8           ; mallocr.c:2676
	;;
#0:	       ldx	$mem, 0 -> r3   ; mallocr.c:2676
#1:	       ldm.f	r7, 12          ; mallocr.c:2676
	;;
#0:	       ldx	$mem, 0 -> r4   ; mallocr.c:2676
	;;
#0:	       stm.a	r4, r3, 3       ; mallocr.c:2676
	;;
#0:	       stm.a	r3, r4, 2       ; mallocr.c:2676
	;;
.BB2_4:                                 ; %bb3
#0:	       ldga	131072 -> r3
#1:	       or	r2, 1 -> r0     ; mallocr.c:2679
#2:	       ldga	___malloc_av_ -> r1 ; mallocr.c:2680
	;;
#0:	       cmpult	r2, r3 -> c1    ; mallocr.c:2681
#1:	       stm.a	r0, r7, 1       ; mallocr.c:2679
	;;
#0:	if  c1 br	.BB2_15
#1:	       stm.a	r7, r1, 2       ; mallocr.c:2680
	;;
	       nop	2
	;;
; BB#5:                                 ; %bb4
#0:	       ldm.f	r7, 4           ; mallocr.c:3319[ mallocr.c:2682 ]
#1:	       ldi	-4 -> r2
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:3319[ mallocr.c:2682 ]
	;;
#0:	       and	r0, r2 -> r0    ; mallocr.c:3319[ mallocr.c:2682 ]
#1:	       ldiu	0 -> r2
	;;
#0:	       sub	r0, 17 -> r3
#1:	       ldim	2046 -> r2
	;;
#0:	       and	r3, r2 -> r2
#1:	       ldga	4096 -> r3
	;;
#0:	       cmplt	r2, r3 -> c1    ; mallocr.c:3322[ mallocr.c:2682 ]
	;;
#0:	if  c1 br	.BB2_15
	;;
	       nop	2
	;;
; BB#6:                                 ; %bb1.i
#0:	       ldmg.d	_heap_end.1081  ; sbrk.c:14[ sbrkr.c:60[ mallocr.c:3331[ mallocr.c:2682 ] ] ]
#1:	       ldga	_errno.b -> r1
	;;
#0:	       ldx	$mem, 0 -> r3   ; sbrk.c:14[ sbrkr.c:60[ mallocr.c:3331[ mallocr.c:2682 ] ] ]
#1:	       stmb.a	0, r1, 0
	;;
#0:	       cmpeq	r3, 0 -> c1     ; sbrk.c:14[ sbrkr.c:60[ mallocr.c:3331[ mallocr.c:2682 ] ] ]
	;;
#0:	if !c1 br	.BB2_8
	;;
	       nop	2
	;;
; BB#7:                                 ; %bb.i.i.i
#0:	       ldga	_end -> r3      ; sbrk.c:15[ sbrkr.c:60[ mallocr.c:3331[ mallocr.c:2682 ] ] ]
#1:	       ldga	_heap_end.1081 -> r1 ; sbrk.c:15[ sbrkr.c:60[ mallocr.c:3331[ mallocr.c:2682 ] ] ]
	;;
#0:	       stm.a	r3, r1, 0       ; sbrk.c:15[ sbrkr.c:60[ mallocr.c:3331[ mallocr.c:2682 ] ] ]
	;;
.BB2_8:                                 ; %_sbrk.exit.i.i
#0:	       add	r7, r0 -> r4    ; mallocr.c:3332[ mallocr.c:2682 ]
#1:	       ldga	_heap_end.1081 -> r1 ; sbrk.c:18[ sbrkr.c:60[ mallocr.c:3331[ mallocr.c:2682 ] ] ]
	;;
#0:	       cmpne	r4, r3 -> c1    ; mallocr.c:3332[ mallocr.c:2682 ]
#1:	       stm.a	r3, r1, 0       ; sbrk.c:18[ sbrkr.c:60[ mallocr.c:3331[ mallocr.c:2682 ] ] ]
	;;
#0:	if  c1 br	.BB2_15
	;;
	       nop	2
	;;
; BB#9:                                 ; %_sbrk.exit.i9.i
#0:	       cmpne	r3, -1 -> c1    ; sbrkr.c:60[ mallocr.c:3340[ mallocr.c:2682 ] ]
#1:	       ldga	_errno.b -> r1.16
#2:	       sub	r3, r2 -> r1    ; sbrk.c:18[ sbrkr.c:60[ mallocr.c:3340[ mallocr.c:2682 ] ] ]
	;;
#0:	if  c1 br	.BB2_14         ; sbrkr.c:60[ mallocr.c:3340[ mallocr.c:2682 ] ]
#1:	       stmb.a	0, r1.16, 0
	;;
#1:	       ldga	_heap_end.1081 -> r1.16 ; sbrk.c:18[ sbrkr.c:60[ mallocr.c:3331[ mallocr.c:2682 ] ] ]
	;;
#1:	       stm.a	r1, r1.16, 0    ; sbrk.c:18[ sbrkr.c:60[ mallocr.c:3340[ mallocr.c:2682 ] ] ]
	;;                              ; sbrkr.c:60[ mallocr.c:3340[ mallocr.c:2682 ] ]
	       nop	0               ; sbrkr.c:60[ mallocr.c:3340[ mallocr.c:2682 ] ]
	;;
; BB#10:                                ; %bb4.i
#0:	       cmpeq	r1, 0 -> c1     ; sbrk.c:14[ sbrkr.c:60[ mallocr.c:3345[ mallocr.c:2682 ] ] ]
#1:	       ldga	_errno.b -> r0
	;;
#0:	if !c1 br	.BB2_12
#1:	       stmb.a	0, r0, 0
	;;
	       nop	2
	;;
; BB#11:                                ; %bb.i.i1.i
#0:	       ldga	_end -> r1      ; sbrk.c:15[ sbrkr.c:60[ mallocr.c:3345[ mallocr.c:2682 ] ] ]
#1:	       ldga	_heap_end.1081 -> r0 ; sbrk.c:15[ sbrkr.c:60[ mallocr.c:3345[ mallocr.c:2682 ] ] ]
	;;
#0:	       stm.a	r1, r0, 0       ; sbrk.c:15[ sbrkr.c:60[ mallocr.c:3345[ mallocr.c:2682 ] ] ]
	;;
.BB2_12:                                ; %_sbrk.exit.i2.i
#0:	       ldmg.d	___malloc_av_+8 ; mallocr.c:3346[ mallocr.c:2682 ]
#1:	       ldi	16 -> r4
#2:	       ldga	_heap_end.1081 -> r2 ; sbrk.c:18[ sbrkr.c:60[ mallocr.c:3345[ mallocr.c:2682 ] ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:3346[ mallocr.c:2682 ]
#1:	       stm.a	r1, r2, 0       ; sbrk.c:18[ sbrkr.c:60[ mallocr.c:3345[ mallocr.c:2682 ] ] ]
	;;
#0:	       sub	r1, r0 -> r3    ; mallocr.c:3346[ mallocr.c:2682 ]
	;;
#0:	       cmplt	r3, r4 -> c1    ; mallocr.c:3347[ mallocr.c:2682 ]
	;;
#0:	if  c1 br	.BB2_15
	;;
	       nop	2
	;;
; BB#13:                                ; %bb5.i
#0:	       ldmg.d	___malloc_sbrk_base ; mallocr.c:3349[ mallocr.c:2682 ]
#1:	       s2add	r15, 1 -> r15   ; mallocr.c:2722
	;;
#3:	       ldga	___malloc_current_mallinfo.0 -> r3.16 ; mallocr.c:3349[ mallocr.c:2682 ]
	;;
#0:	       ret                      ; mallocr.c:2722
#1:	       ldx	$mem, 0 -> r2   ; mallocr.c:3349[ mallocr.c:2682 ]
	;;
#0:	       sub	r1, r2 -> r2    ; mallocr.c:3349[ mallocr.c:2682 ]
	;;
#3:	       stm.a	r2, r3.16, 0    ; mallocr.c:3349[ mallocr.c:2682 ]
#0:	       or	r3, 1 -> r2     ; mallocr.c:3350[ mallocr.c:2682 ]
	;;
#0:	       stm.a	r2, r0, 1       ; mallocr.c:3350[ mallocr.c:2682 ]
	;;                              ; mallocr.c:2722
	       nop	0               ; mallocr.c:2722
	;;
.BB2_14:                                ; %bb7.i
#0:	       sub	r0, r2 -> r0    ; mallocr.c:3360[ mallocr.c:2682 ]
#1:	       ldga	___malloc_current_mallinfo.0 -> r3 ; mallocr.c:3361[ mallocr.c:2682 ]
	;;
#0:	       or	r0, 1 -> r0     ; mallocr.c:3360[ mallocr.c:2682 ]
	;;
#0:	       stm.a	r0, r7, 1       ; mallocr.c:3360[ mallocr.c:2682 ]
	;;
#0:	       ldmg.d	___malloc_current_mallinfo.0 ; mallocr.c:3361[ mallocr.c:2682 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:3361[ mallocr.c:2682 ]
	;;
#0:	       sub	r0, r2 -> r0    ; mallocr.c:3361[ mallocr.c:2682 ]
	;;
#0:	       stm.a	r0, r3, 0       ; mallocr.c:3361[ mallocr.c:2682 ]
	;;
.BB2_15:                                ; %bb5
#0:	       s2add	r15, 1 -> r15   ; mallocr.c:2722
#1:	       ret                      ; mallocr.c:2722
	;;                              ; mallocr.c:2722
	       nop	3               ; mallocr.c:2722
	;;
.BB2_16:                                ; %bb6
#0:	       btest	r0, 0 -> c1     ; mallocr.c:2691
#1:	       stm.a	r4, r3, 0       ; mallocr.c:2687
	;;
#0:	if !c1 br	.BB2_18         ; mallocr.c:2691
	;;                              ; mallocr.c:2691
	       nop	2               ; mallocr.c:2691
	;;
; BB#17:                                ; %bb6.bb10_crit_edge
#0:	       ldi	0 -> r0
#1:	       br	.BB2_21
#2:	       or	r2, 0 -> r3
	;;
	       nop	2
	;;
.BB2_18:                                ; %bb7
#0:	       ldm.f	r1, -8          ; mallocr.c:2693
#2:	       ldi	-8 -> r3
#1:	       ldga	___malloc_av_ -> r1.16 ; mallocr.c:2697
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2693
	;;
#0:	       sub	r3, r0 -> r5
#2:	       add	r0, r2 -> r3    ; mallocr.c:2695
#1:	       add	r1.16, 8 -> r0  ; mallocr.c:2697
	;;
#0:	       add	r1, r5 -> r7    ; mallocr.c:2694
	;;
#0:	       ldm.f	r7, 8           ; mallocr.c:2697
	;;
#0:	       ldx	$mem, 0 -> r8   ; mallocr.c:2697
	;;
#0:	       cmpne	r8, r0 -> c1    ; mallocr.c:2697
	;;
#0:	if  c1 br	.BB2_20         ; mallocr.c:2697
	;;                              ; mallocr.c:2697
	       nop	2               ; mallocr.c:2697
	;;
; BB#19:                                ; %bb7.bb10_crit_edge
#0:	       ldi	1 -> r0
#1:	       br	.BB2_21
	;;
	       nop	2
	;;
.BB2_20:                                ; %bb9
#0:	       add	r5, r1 -> r0
	;;
#0:	       ldm.f	r0, 12          ; mallocr.c:2700
#1:	       ldi	0 -> r0
	;;
#0:	       ldx	$mem, 0 -> r5   ; mallocr.c:2700
	;;
#0:	       stm.a	r5, r8, 3       ; mallocr.c:2700
	;;
#0:	       stm.a	r8, r5, 2       ; mallocr.c:2700
	;;
.BB2_21:                                ; %bb10
#0:	       add	r4, r6 -> r5
	;;
#0:	       add	r5, r1 -> r5
	;;
#0:	       ldm.f	r5, 4           ; mallocr.c:2703
#1:	       add	r5, 4 -> r6
	;;
#0:	       ldx	$membu, r6 -> r5 ; mallocr.c:2703
	;;
#0:	       btest	r5, 0 -> c1     ; mallocr.c:2703
	;;
#0:	if  c1 br	.BB2_25
	;;
	       nop	2
	;;
; BB#22:                                ; %bb11
#0:	       cmpne	r0, 0 -> c1     ; mallocr.c:2707
#1:	       add	r1, r2 -> r5
#2:	       add	r3, r4 -> r3    ; mallocr.c:2705
	;;
#0:	if  c1 br	.BB2_24
#1:	       ldm.f	r5, 0           ; mallocr.c:2707
	;;
#0:	       ldx	$mem, 0 -> r5   ; mallocr.c:2707
	;;
	       nop	1
	;;
; BB#23:                                ; %bb11
#0:	       ldga	___malloc_av_ -> r0.16
	;;
#0:	       add	r0.16, 8 -> r4
	;;
#0:	       cmpne	r5, r4 -> c1
	;;
#0:	if !c1 br	.BB2_46
	;;
	       nop	2
	;;
.BB2_24:                                ; %bb14
#0:	       add	r2, r1 -> r1
	;;
#0:	       ldm.f	r1, 4           ; mallocr.c:2713
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:2713
	;;
#0:	       stm.a	r1, r5, 3       ; mallocr.c:2713
	;;
#0:	       stm.a	r5, r1, 2       ; mallocr.c:2713
	;;
.BB2_25:                                ; %bb15
#0:	       or	r3, 1 -> r1     ; mallocr.c:2717
#1:	       cmpne	r0, 0 -> c1     ; mallocr.c:2719
#2:	       add	r7, r3 -> r2    ; mallocr.c:2718
	;;
#0:	       stm.a	r1, r7, 1       ; mallocr.c:2717
#1:	if  c1 s2add	r15, 1 -> r15   ; mallocr.c:2722
	;;
#0:	       stm.a	r3, r2, 0       ; mallocr.c:2718
	;;
#0:	if  c1 ret                      ; mallocr.c:2722
	;;                              ; mallocr.c:2722
	       nop	3               ; mallocr.c:2722
	;;
; BB#26:                                ; %bb16
#0:	       ldi	511 -> r0
	;;
#0:	       cmpult	r0, r3 -> c1    ; mallocr.c:2720
	;;
#0:	if !c1 br	.BB2_47
	;;
	       nop	2
	;;
; BB#27:                                ; %bb20
#0:	       sr	r3, 9 -> r0     ; mallocr.c:2720
#1:	       ldi	4 -> r1
	;;
#0:	       cmpult	r1, r0 -> c1    ; mallocr.c:2720
	;;
#0:	if  c1 br	.BB2_29         ; mallocr.c:2720
	;;                              ; mallocr.c:2720
	       nop	2               ; mallocr.c:2720
	;;
; BB#28:                                ; %bb21
#0:	       sr	r3, 6 -> r0     ; mallocr.c:2720
#1:	       br	.BB2_38
	;;
#0:	       s2add	r0, 14 -> r0    ; mallocr.c:2720
	;;
	       nop	1
	;;
.BB2_29:                                ; %bb22
#0:	       ldi	20 -> r1
	;;
#0:	       cmpult	r1, r0 -> c1    ; mallocr.c:2720
	;;
#0:	if  c1 br	.BB2_31         ; mallocr.c:2720
	;;                              ; mallocr.c:2720
	       nop	2               ; mallocr.c:2720
	;;
; BB#30:                                ; %bb23
#0:	       ldi	91 -> r1
#1:	       br	.BB2_38
	;;
#0:	       add	r0, r1 -> r0    ; mallocr.c:2720
	;;
	       nop	1
	;;
.BB2_31:                                ; %bb24
#0:	       ldi	84 -> r1
	;;
#0:	       cmpult	r1, r0 -> c1    ; mallocr.c:2720
	;;
#0:	if  c1 br	.BB2_33         ; mallocr.c:2720
	;;                              ; mallocr.c:2720
	       nop	2               ; mallocr.c:2720
	;;
; BB#32:                                ; %bb25
#0:	       sr	r3, 12 -> r0    ; mallocr.c:2720
#1:	       br	.BB2_38
#2:	       ldi	110 -> r1
	;;
#0:	       add	r0, r1 -> r0    ; mallocr.c:2720
	;;
	       nop	1
	;;
.BB2_33:                                ; %bb26
#0:	       ldi	340 -> r1
	;;
#0:	       cmpult	r1, r0 -> c1    ; mallocr.c:2720
	;;
#0:	if  c1 br	.BB2_35         ; mallocr.c:2720
	;;                              ; mallocr.c:2720
	       nop	2               ; mallocr.c:2720
	;;
; BB#34:                                ; %bb27
#0:	       sr	r3, 15 -> r0    ; mallocr.c:2720
#1:	       br	.BB2_38
#2:	       ldi	119 -> r1
	;;
#0:	       add	r0, r1 -> r0    ; mallocr.c:2720
	;;
	       nop	1
	;;
.BB2_35:                                ; %bb28
#0:	       ldiu	1365 -> r1
	;;
#0:	       cmpult	r0, r1 -> c1
	;;
#0:	if  c1 br	.BB2_37         ; mallocr.c:2720
	;;                              ; mallocr.c:2720
	       nop	2               ; mallocr.c:2720
	;;
; BB#36:                                ; %bb28.bb36_crit_edge
#0:	       ldi	126 -> r0
#1:	       br	.BB2_38
	;;
	       nop	2
	;;
.BB2_37:                                ; %bb29
#0:	       sr	r3, 18 -> r0    ; mallocr.c:2720
	;;
#0:	       s2add	r0, 31 -> r0    ; mallocr.c:2720
	;;
.BB2_38:                                ; %bb36
#0:	       ldga	___malloc_av_ -> r1
#1:	       sl	r0, 3 -> r2
	;;
#0:	       add	r1, r2 -> r2
	;;
#0:	       ldm.f	r2, 8           ; mallocr.c:2720
	;;
#0:	       ldx	$mem, 0 -> r4   ; mallocr.c:2720
	;;
#0:	       cmpeq	r4, r2 -> c1    ; mallocr.c:2720
	;;
#0:	if  c1 br	.BB2_40         ; mallocr.c:2720
	;;                              ; mallocr.c:2720
	       nop	2               ; mallocr.c:2720
	;;
; BB#39:                                ; %bb36.bb39_crit_edge
#0:	       ldi	-4 -> r0
#1:	       br	.BB2_42
	;;
	       nop	2
	;;
.BB2_40:                                ; %bb37
#0:	       sra	r0, 31 -> r3    ; mallocr.c:2720
#1:	       ldmg.d	___malloc_av_+4 ; mallocr.c:2720
	;;
#0:	       sr	r3, 30 -> r3    ; mallocr.c:2720
	;;
#0:	       add	r0, r3 -> r0    ; mallocr.c:2720
#1:	       ldi	1 -> r3
#2:	       ldx	$mem, 0 -> r5   ; mallocr.c:2720
	;;
#0:	       br	.BB2_45
#1:	       sra	r0, 2 -> r0     ; mallocr.c:2720
	;;
#0:	       sl	r3, r0 -> r0    ; mallocr.c:2720
	;;
#0:	       or	r0, r5 -> r0    ; mallocr.c:2720
	;;
#0:	       stm.a	r0, r1, 1
	;;
.BB2_41:                                ; %bb38
                                        ;   in Loop: Header=BB2_42 Depth=1
#0:	       ldm.f	r4, 8           ; mallocr.c:2720
	;;
#0:	       ldx	$mem, 0 -> r4   ; mallocr.c:2720
	;;
.BB2_42:                                ; %bb39
                                        ; =>This Inner Loop Header: Depth=1
#0:	       cmpeq	r4, r2 -> c1    ; mallocr.c:2720
	;;
#0:	if  c1 br	.BB2_44
	;;
	       nop	2
	;;
; BB#43:                                ; %bb40
                                        ;   in Loop: Header=BB2_42 Depth=1
#0:	       ldm.f	r4, 4           ; mallocr.c:2720
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:2720
	;;
#0:	       and	r1, r0 -> r1    ; mallocr.c:2720
	;;
#0:	       cmpult	r3, r1 -> c1    ; mallocr.c:2720
	;;
#0:	if  c1 br	.BB2_41         ; mallocr.c:2720
	;;                              ; mallocr.c:2720
	       nop	2               ; mallocr.c:2720
	;;
.BB2_44:                                ; %bb41
#0:	       ldm.f	r4, 12          ; mallocr.c:2720
	;;
#0:	       ldx	$mem, 0 -> r2   ; mallocr.c:2720
	;;
.BB2_45:                                ; %bb42
#0:	       stm.a	r2, r7, 3       ; mallocr.c:2720
#1:	       s2add	r15, 1 -> r15   ; mallocr.c:2722
	;;
#0:	       stm.a	r4, r7, 2       ; mallocr.c:2720
	;;
#0:	       stm.a	r7, r2, 2       ; mallocr.c:2720
	;;
#0:	       stm.a	r7, r4, 3       ; mallocr.c:2720
	;;
#0:	       ret                      ; mallocr.c:2722
	;;                              ; mallocr.c:2722
	       nop	3               ; mallocr.c:2722
	;;
.BB2_46:                                ; %bb15.thread
#0:	       stm.a	r7, r0.16, 5    ; mallocr.c:2710
#1:	       or	r3, 1 -> r0     ; mallocr.c:2717
#2:	       s2add	r15, 1 -> r15   ; mallocr.c:2722
	;;
#0:	       stm.a	r7, r0.16, 4    ; mallocr.c:2710
	;;
#0:	       stm.a	r0, r7, 1       ; mallocr.c:2717
#1:	       add	r7, r3 -> r0    ; mallocr.c:2718
	;;
#0:	       stm.a	r4, r7, 3       ; mallocr.c:2710
	;;
#0:	       stm.a	r4, r7, 2       ; mallocr.c:2710
	;;
#0:	       stm.a	r3, r0, 0       ; mallocr.c:2718
	;;
#0:	       ret                      ; mallocr.c:2722
	;;                              ; mallocr.c:2722
	       nop	3               ; mallocr.c:2722
	;;
.BB2_47:                                ; %bb17
#0:	       ldmg.d	___malloc_av_+4 ; mallocr.c:2720
#1:	       ldi	1 -> r0
#2:	       sr	r3, 5 -> r1
#3:	       s2add	r15, 1 -> r15   ; mallocr.c:2722
	;;
#0:	       sl	r0, r1 -> r0    ; mallocr.c:2720
#1:	       ldi	-8 -> r1
	;;
#0:	       ldx	$mem, 0 -> r2   ; mallocr.c:2720
#1:	       and	r3, r1 -> r3
	;;
#0:	       or	r2, r0 -> r0    ; mallocr.c:2720
#1:	       ldga	___malloc_av_ -> r2 ; mallocr.c:2720
	;;
#0:	       stm.a	r0, r2, 1
#1:	       add	r2, r3 -> r3
	;;
#0:	       ldm.f	r3, 8           ; mallocr.c:2720
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2720
#1:	       stm.a	r3, r7, 3       ; mallocr.c:2720
	;;
#0:	       stm.a	r0, r7, 2       ; mallocr.c:2720
	;;
#0:	       stm.a	r7, r3, 2       ; mallocr.c:2720
	;;
#0:	       stm.a	r7, r0, 3       ; mallocr.c:2720
	;;
#0:	       ret                      ; mallocr.c:2722
	;;                              ; mallocr.c:2722
	       nop	3               ; mallocr.c:2722
	;;
	.align	4
__free_r_end:

	.align	4
__malloc_r:                             ; @_malloc_r
	.size	__malloc_r_end-__malloc_r
__malloc_r_start:
; BB#0:                                 ; %entry
#0:	       wb.s	r15, 10
#2:	       ldiu	40 -> r4
#1:	       ldx	$rb, 0 -> r1.31
#3:	       ldi	22 -> r1
	;;
#0:	       sub	r15, r4 -> r15
#2:	       ldx	$ro, 0 -> r2.31
#1:	       add	r0, 11 -> r2    ; mallocr.c:2348
#3:	       ldi	-8 -> r3
	;;
#0:	       cmpult	r1, r2 -> c1    ; mallocr.c:2348
#1:	       and	r2, r3 -> r1    ; mallocr.c:2348
	;;
#0:	       stm.s	r14, r15, 0
#1:	       or	r15, 0 -> r14
	;;
#1:	       stm.s	r1.31, r15, 1
	;;
#2:	       stm.s	r2.31, r15, 2
	;;
#0:	       stm.s	r10, r14, 9
#1:	       ldi	16 -> r10
	;;
#0:	if  c1 or	r1, 0 -> r10
#1:	       stm.s	r11, r14, 8
	;;
#0:	       cmplt	r10, 0 -> c1    ; mallocr.c:2351
#1:	       stm.s	r12, r14, 7
	;;
#0:	if  c1 br	.BB3_2
	;;
	       nop	2
	;;
; BB#1:                                 ; %entry
#0:	       cmpule	r0, r10 -> c1
	;;
#0:	if  c1 br	.BB3_3
	;;
	       nop	2
	;;
.BB3_2:                                 ; %bb4
#0:	       ldga	_impure_data -> r0 ; mallocr.c:2353
#1:	       br	.BB3_33
	;;
#0:	       stm.a	12, r0, 0       ; mallocr.c:2353
#1:	       ldi	0 -> r0
	;;
	       nop	1
	;;
.BB3_3:                                 ; %bb5
#0:	       ldi	503 -> r0
	;;
#0:	       cmpult	r0, r10 -> c1   ; mallocr.c:2361
	;;
#0:	if  c1 br	.BB3_10         ; mallocr.c:2361
	;;                              ; mallocr.c:2361
	       nop	2               ; mallocr.c:2361
	;;
; BB#4:                                 ; %bb6
#0:	       ldi	-4 -> r0
#1:	       ldga	___malloc_av_ -> r1
#2:	       sr	r10, 3 -> r3    ; mallocr.c:2363
	;;
#0:	       and	r10, r0 -> r0
	;;
#0:	       add	r1, r0 -> r0
	;;
#0:	       ldm.f	r0, 12          ; mallocr.c:2368
	;;
#0:	       ldx	$mem, 0 -> r2   ; mallocr.c:2368
	;;
#0:	       cmpeq	r2, r0 -> c1    ; mallocr.c:2372
	;;
#0:	if  c1 sr	r10, 2 -> r0
	;;
#0:	if  c1 s2add	r1, r0 -> r0
	;;
#0:	if  c1 ldm.f	r0, 20          ; mallocr.c:2375
#1:	if  c1 add	r0, 8 -> r0
	;;
#0:	if  c1 ldx	$mem, 0 -> r2   ; mallocr.c:2375
	;;
#0:	       cmpeq	r2, r0 -> c1    ; mallocr.c:2378
	;;
#0:	if  c1 br	.BB3_6          ; mallocr.c:2378
	;;                              ; mallocr.c:2378
	       nop	2               ; mallocr.c:2378
	;;
; BB#5:                                 ; %bb9
#0:	       ldm.f	r2, 4           ; mallocr.c:2380
#1:	       ldi	-4 -> r1
	;;
#0:	       ldx	$mem, 0 -> r3   ; mallocr.c:2380
#1:	       ldm.f	r2, 8           ; mallocr.c:2381
	;;
#0:	       add	r3, 4 -> r3
	;;
#0:	       ldx	$mem, 0 -> r10  ; mallocr.c:2381
#1:	       ldm.f	r2, 12          ; mallocr.c:2381
#2:	       and	r3, r1 -> r3
	;;
#0:	       add	r2, r3 -> r3
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2381
	;;
#0:	       stm.a	r0, r10, 3      ; mallocr.c:2381
	;;
#0:	       stm.a	r10, r0, 2      ; mallocr.c:2381
#1:	       add	r2, 8 -> r0     ; mallocr.c:2381
	;;
#0:	       br	.BB3_108
#1:	       ldm.f	r3, 0           ; mallocr.c:2382
	;;
#0:	       ldx	$mem, 0 -> r10  ; mallocr.c:2382
	;;
#0:	       or	r10, 1 -> r10   ; mallocr.c:2382
	;;
#0:	       stm.a	r10, r3, 0      ; mallocr.c:2382
	;;
.BB3_6:                                 ; %bb10
#0:	       add	r3, 2 -> r0     ; mallocr.c:2388
	;;
.BB3_7:                                 ; %bb37
#0:	       ldmg.d	___malloc_av_+16 ; mallocr.c:2423
#1:	       ldga	___malloc_av_ -> r1 ; mallocr.c:2423
	;;
#0:	       add	r1, 8 -> r1     ; mallocr.c:2423
	;;
#0:	       ldx	$mem, 0 -> r2   ; mallocr.c:2423
	;;
#0:	       cmpeq	r2, r1 -> c1    ; mallocr.c:2423
	;;
#0:	if  c1 br	.BB3_58
	;;
	       nop	2
	;;
; BB#8:                                 ; %bb38
#0:	       ldm.f	r2, 4           ; mallocr.c:2425
#1:	       ldi	-4 -> r3
#2:	       ldi	16 -> r5
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:2425
	;;
#0:	       and	r1, r3 -> r3    ; mallocr.c:2425
	;;
#0:	       sub	r3, r10 -> r4   ; mallocr.c:2426
	;;
#0:	       cmplt	r4, r5 -> c1    ; mallocr.c:2428
	;;
#0:	if  c1 br	.BB3_30
	;;
	       nop	2
	;;
; BB#9:                                 ; %bb39
#0:	       or	r10, 1 -> r0    ; mallocr.c:2431
#1:	       ldga	___malloc_av_ -> r1 ; mallocr.c:2432
#2:	       add	r2, r10 -> r5   ; mallocr.c:2430
	;;
#0:	       stm.a	r0, r2, 1       ; mallocr.c:2431
#1:	       or	r10, 4 -> r0
#2:	       or	r4, 1 -> r10    ; mallocr.c:2433
	;;
#0:	       add	r2, r0 -> r0
	;;
#0:	       stm.a	r5, r1, 5       ; mallocr.c:2432
	;;
#0:	       stm.a	r5, r1, 4       ; mallocr.c:2432
#1:	       add	r1, 8 -> r1     ; mallocr.c:2432
	;;
#0:	       br	.BB3_108
#1:	       stm.a	r10, r0, 0      ; mallocr.c:2433
#2:	       add	r2, 8 -> r0
	;;
#0:	       stm.a	r1, r5, 3       ; mallocr.c:2432
	;;
#0:	       stm.a	r1, r5, 2       ; mallocr.c:2432
#1:	       add	r2, r3 -> r1    ; mallocr.c:2434
	;;
#0:	       stm.a	r4, r1, 0       ; mallocr.c:2434
	;;
.BB3_10:                                ; %bb11
#0:	       ldi	511 -> r0
	;;
#0:	       cmpult	r0, r10 -> c1   ; mallocr.c:2393
	;;
#0:	if  c1 br	.BB3_12         ; mallocr.c:2393
	;;                              ; mallocr.c:2393
	       nop	2               ; mallocr.c:2393
	;;
; BB#11:                                ; %bb12
#0:	       sr	r10, 3 -> r0    ; mallocr.c:2393
#1:	       br	.BB3_23
	;;
	       nop	2
	;;
.BB3_12:                                ; %bb13
#0:	       sr	r10, 9 -> r0    ; mallocr.c:2393
#1:	       ldi	4 -> r1
	;;
#0:	       cmpult	r1, r0 -> c1    ; mallocr.c:2393
	;;
#0:	if  c1 br	.BB3_14         ; mallocr.c:2393
	;;                              ; mallocr.c:2393
	       nop	2               ; mallocr.c:2393
	;;
; BB#13:                                ; %bb14
#0:	       sr	r10, 6 -> r0    ; mallocr.c:2393
#1:	       br	.BB3_23
	;;
#0:	       s2add	r0, 14 -> r0    ; mallocr.c:2393
	;;
	       nop	1
	;;
.BB3_14:                                ; %bb15
#0:	       ldi	20 -> r1
	;;
#0:	       cmpult	r1, r0 -> c1    ; mallocr.c:2393
	;;
#0:	if  c1 br	.BB3_16         ; mallocr.c:2393
	;;                              ; mallocr.c:2393
	       nop	2               ; mallocr.c:2393
	;;
; BB#15:                                ; %bb16
#0:	       ldi	91 -> r1
#1:	       br	.BB3_23
	;;
#0:	       add	r0, r1 -> r0    ; mallocr.c:2393
	;;
	       nop	1
	;;
.BB3_16:                                ; %bb17
#0:	       ldi	84 -> r1
	;;
#0:	       cmpult	r1, r0 -> c1    ; mallocr.c:2393
	;;
#0:	if  c1 br	.BB3_18         ; mallocr.c:2393
	;;                              ; mallocr.c:2393
	       nop	2               ; mallocr.c:2393
	;;
; BB#17:                                ; %bb18
#0:	       sr	r10, 12 -> r0   ; mallocr.c:2393
#1:	       br	.BB3_23
#2:	       ldi	110 -> r1
	;;
#0:	       add	r0, r1 -> r0    ; mallocr.c:2393
	;;
	       nop	1
	;;
.BB3_18:                                ; %bb19
#0:	       ldi	340 -> r1
	;;
#0:	       cmpult	r1, r0 -> c1    ; mallocr.c:2393
	;;
#0:	if  c1 br	.BB3_20         ; mallocr.c:2393
	;;                              ; mallocr.c:2393
	       nop	2               ; mallocr.c:2393
	;;
; BB#19:                                ; %bb20
#0:	       sr	r10, 15 -> r0   ; mallocr.c:2393
#1:	       br	.BB3_23
#2:	       ldi	119 -> r1
	;;
#0:	       add	r0, r1 -> r0    ; mallocr.c:2393
	;;
	       nop	1
	;;
.BB3_20:                                ; %bb21
#0:	       ldiu	1365 -> r1
	;;
#0:	       cmpult	r0, r1 -> c1
	;;
#0:	if  c1 br	.BB3_22         ; mallocr.c:2393
	;;                              ; mallocr.c:2393
	       nop	2               ; mallocr.c:2393
	;;
; BB#21:                                ; %bb21.bb29_crit_edge
#0:	       ldi	126 -> r0
#1:	       br	.BB3_23
	;;
	       nop	2
	;;
.BB3_22:                                ; %bb22
#0:	       sr	r10, 18 -> r0   ; mallocr.c:2393
	;;
#0:	       s2add	r0, 31 -> r0    ; mallocr.c:2393
	;;
.BB3_23:                                ; %bb29
#0:	       ldga	___malloc_av_ -> r1
#1:	       sl	r0, 3 -> r2
#2:	       ldi	-4 -> r3
#3:	       ldi	16 -> r4
	;;
#0:	       add	r1, r2 -> r1
	;;
#0:	       ldm.f	r1, 12          ; mallocr.c:2396
	;;
#0:	       ldx	$mem, 0 -> r2   ; mallocr.c:2396
	;;
.BB3_24:                                ; %bb35
                                        ; =>This Inner Loop Header: Depth=1
#0:	       or	r2, 0 -> r5
	;;
#0:	       cmpne	r5, r1 -> c1    ; mallocr.c:2396
	;;
#0:	if !c1 br	.BB3_27
	;;
	       nop	2
	;;
; BB#25:                                ; %bb30
                                        ;   in Loop: Header=BB3_24 Depth=1
#0:	       ldm.f	r5, 4           ; mallocr.c:2398
	;;
#0:	       ldx	$mem, 0 -> r2   ; mallocr.c:2398
	;;
#0:	       and	r2, r3 -> r6    ; mallocr.c:2398
	;;
#0:	       sub	r6, r10 -> r7   ; mallocr.c:2399
	;;
#0:	       cmplt	r7, r4 -> c1    ; mallocr.c:2401
	;;
#0:	if  c1 br	.BB3_28         ; mallocr.c:2401
	;;                              ; mallocr.c:2401
	       nop	2               ; mallocr.c:2401
	;;
; BB#26:                                ; %bb31
#0:	       sub	r0, 1 -> r0
	;;
.BB3_27:                                ; %bb36
#0:	       add	r0, 1 -> r0     ; mallocr.c:2417
#1:	       br	.BB3_7
	;;
	       nop	2
	;;
.BB3_28:                                ; %bb32
                                        ;   in Loop: Header=BB3_24 Depth=1
#0:	       cmplt	r7, 0 -> c1     ; mallocr.c:2407
#1:	       ldm.f	r5, 12          ; mallocr.c:2409
	;;
#0:	if  c1 br	.BB3_24
#1:	       ldx	$mem, 0 -> r2   ; mallocr.c:2409
	;;
	       nop	2
	;;
; BB#29:                                ; %bb33
#0:	       ldm.f	r5, 8           ; mallocr.c:2409
#1:	       add	r6, r5 -> r1    ; mallocr.c:2409
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2409
	;;
#0:	       stm.a	r2, r0, 3       ; mallocr.c:2409
	;;
#0:	       br	.BB3_32
#1:	       stm.a	r0, r2, 2       ; mallocr.c:2409
#2:	       add	r5, 8 -> r0     ; mallocr.c:2409
	;;
#0:	       ldm.f	r1, 4           ; mallocr.c:2410
	;;
#0:	       ldx	$mem, 0 -> r2   ; mallocr.c:2410
	;;
#0:	       or	r2, 1 -> r2     ; mallocr.c:2410
	;;
.BB3_30:                                ; %bb40
#2:	       ldga	___malloc_av_ -> r2.16 ; mallocr.c:2440
#0:	       cmplt	r4, 0 -> c1     ; mallocr.c:2442
	;;
#0:	if  c1 br	.BB3_35         ; mallocr.c:2442
#2:	       add	r2.16, 8 -> r5  ; mallocr.c:2440
	;;
#2:	       stm.a	r5, r2.16, 5    ; mallocr.c:2440
	;;
#2:	       stm.a	r5, r2.16, 4    ; mallocr.c:2440
	;;                              ; mallocr.c:2442
	       nop	0               ; mallocr.c:2442
	;;
; BB#31:                                ; %bb41
#0:	       add	r3, r2 -> r1    ; mallocr.c:2444
#1:	       add	r2, 8 -> r0
	;;
#0:	       ldm.f	r1, 4           ; mallocr.c:2444
	;;
#0:	       ldx	$mem, 0 -> r3   ; mallocr.c:2444
	;;
#0:	       or	r3, 1 -> r2     ; mallocr.c:2444
	;;
.BB3_32:                                ; %bb41
#0:	       stm.a	r2, r1, 1       ; mallocr.c:2444
	;;
.BB3_33:                                ; %bb41
#0:	       ldm.s	r14, 28         ; mallocr.c:2590
#1:	       or	r14, 0 -> r15   ; mallocr.c:2590
	;;
#0:	       ldx	$mem, 0 -> r12  ; mallocr.c:2590
#1:	       ldm.s	r14, 32         ; mallocr.c:2590
	;;
#0:	       ldx	$mem, 0 -> r11  ; mallocr.c:2590
#1:	       ldm.s	r14, 36         ; mallocr.c:2590
	;;
#0:	       ldx	$mem, 0 -> r10  ; mallocr.c:2590
#1:	       ldm.s	r15, 8          ; mallocr.c:2590
	;;
#3:	       ldx	$mem, 0 -> r3.31 ; mallocr.c:2590
#0:	       ldm.s	r15, 4          ; mallocr.c:2590
	;;
#3:	       stx	r3.31 -> $ro    ; mallocr.c:2590
	;;
#0:	       ldx	$mem, 0 -> r0.31 ; mallocr.c:2590
	;;
#0:	       stx	r0.31 -> $rb    ; mallocr.c:2590
	;;
.BB3_34:                                ; %bb41
#0:	       ldm.s	r15, 0          ; mallocr.c:2590
#1:	       s2add	r15, 10 -> r15  ; mallocr.c:2590
	;;
#0:	       ret                      ; mallocr.c:2590
#1:	       ldx	$mem, 0 -> r14  ; mallocr.c:2590
	;;                              ; mallocr.c:2590
	       nop	3               ; mallocr.c:2590
	;;
.BB3_35:                                ; %bb42
#0:	       ldi	511 -> r4
	;;
#0:	       cmpult	r4, r3 -> c1    ; mallocr.c:2452
	;;
#0:	if  c1 br	.BB3_37         ; mallocr.c:2452
	;;                              ; mallocr.c:2452
	       nop	2               ; mallocr.c:2452
	;;
; BB#36:                                ; %bb43
#0:	       ldmg.d	___malloc_av_+4 ; mallocr.c:2452
#1:	       ldi	1 -> r3
#2:	       sr	r1, 5 -> r4
	;;
#0:	       sl	r3, r4 -> r3    ; mallocr.c:2452
#1:	       ldga	___malloc_av_ -> r1.16 ; mallocr.c:2452
#2:	       ldi	-8 -> r4
	;;
#0:	       ldx	$mem, 0 -> r5   ; mallocr.c:2452
#1:	       and	r1, r4 -> r1
	;;
#0:	       or	r5, r3 -> r3    ; mallocr.c:2452
#1:	       add	r1.16, r1 -> r1
	;;
#1:	       stm.a	r3, r1.16, 1
	;;
#0:	       ldm.f	r1, 8           ; mallocr.c:2452
	;;
#0:	       br	.BB3_58
#1:	       ldx	$mem, 0 -> r3   ; mallocr.c:2452
#2:	       stm.a	r1, r2, 3       ; mallocr.c:2452
	;;
#0:	       stm.a	r3, r2, 2       ; mallocr.c:2452
	;;
#0:	       stm.a	r2, r1, 2       ; mallocr.c:2452
	;;
#0:	       stm.a	r2, r3, 3       ; mallocr.c:2452
	;;
.BB3_37:                                ; %bb44
#0:	       cmpult	r4, r1 -> c1    ; mallocr.c:2452
	;;
#0:	if  c1 br	.BB3_39         ; mallocr.c:2452
	;;                              ; mallocr.c:2452
	       nop	2               ; mallocr.c:2452
	;;
; BB#38:                                ; %bb45
#0:	       sr	r1, 3 -> r1     ; mallocr.c:2452
#1:	       br	.BB3_50
	;;
	       nop	2
	;;
.BB3_39:                                ; %bb46
#0:	       sr	r1, 9 -> r4     ; mallocr.c:2452
#1:	       ldi	4 -> r5
	;;
#0:	       cmpult	r5, r4 -> c1    ; mallocr.c:2452
	;;
#0:	if  c1 br	.BB3_41         ; mallocr.c:2452
	;;                              ; mallocr.c:2452
	       nop	2               ; mallocr.c:2452
	;;
; BB#40:                                ; %bb47
#0:	       sr	r1, 6 -> r1     ; mallocr.c:2452
#1:	       br	.BB3_50
	;;
#0:	       s2add	r1, 14 -> r1    ; mallocr.c:2452
	;;
	       nop	1
	;;
.BB3_41:                                ; %bb48
#0:	       ldi	20 -> r5
	;;
#0:	       cmpult	r5, r4 -> c1    ; mallocr.c:2452
	;;
#0:	if  c1 br	.BB3_43         ; mallocr.c:2452
	;;                              ; mallocr.c:2452
	       nop	2               ; mallocr.c:2452
	;;
; BB#42:                                ; %bb49
#0:	       ldi	91 -> r1
#1:	       br	.BB3_50
	;;
#0:	       add	r4, r1 -> r1    ; mallocr.c:2452
	;;
	       nop	1
	;;
.BB3_43:                                ; %bb50
#0:	       ldi	84 -> r5
	;;
#0:	       cmpult	r5, r4 -> c1    ; mallocr.c:2452
	;;
#0:	if  c1 br	.BB3_45         ; mallocr.c:2452
	;;                              ; mallocr.c:2452
	       nop	2               ; mallocr.c:2452
	;;
; BB#44:                                ; %bb51
#0:	       sr	r1, 12 -> r1    ; mallocr.c:2452
#1:	       br	.BB3_50
#2:	       ldi	110 -> r4
	;;
#0:	       add	r1, r4 -> r1    ; mallocr.c:2452
	;;
	       nop	1
	;;
.BB3_45:                                ; %bb52
#0:	       ldi	340 -> r5
	;;
#0:	       cmpult	r5, r4 -> c1    ; mallocr.c:2452
	;;
#0:	if  c1 br	.BB3_47         ; mallocr.c:2452
	;;                              ; mallocr.c:2452
	       nop	2               ; mallocr.c:2452
	;;
; BB#46:                                ; %bb53
#0:	       sr	r1, 15 -> r1    ; mallocr.c:2452
#1:	       br	.BB3_50
#2:	       ldi	119 -> r4
	;;
#0:	       add	r1, r4 -> r1    ; mallocr.c:2452
	;;
	       nop	1
	;;
.BB3_47:                                ; %bb54
#0:	       ldiu	1365 -> r5
	;;
#0:	       cmpult	r4, r5 -> c1
	;;
#0:	if  c1 br	.BB3_49         ; mallocr.c:2452
	;;                              ; mallocr.c:2452
	       nop	2               ; mallocr.c:2452
	;;
; BB#48:                                ; %bb54.bb62_crit_edge
#0:	       ldi	126 -> r1
#1:	       br	.BB3_50
	;;
	       nop	2
	;;
.BB3_49:                                ; %bb55
#0:	       sr	r1, 18 -> r1    ; mallocr.c:2452
	;;
#0:	       s2add	r1, 31 -> r1    ; mallocr.c:2452
	;;
.BB3_50:                                ; %bb62
#3:	       ldga	___malloc_av_ -> r3.16
#0:	       sl	r1, 3 -> r4
	;;
#3:	       add	r3.16, r4 -> r4
	;;
#0:	       ldm.f	r4, 8           ; mallocr.c:2452
	;;
#0:	       ldx	$mem, 0 -> r5   ; mallocr.c:2452
	;;
#0:	       cmpeq	r5, r4 -> c1    ; mallocr.c:2452
	;;
#0:	if  c1 br	.BB3_52         ; mallocr.c:2452
	;;                              ; mallocr.c:2452
	       nop	2               ; mallocr.c:2452
	;;
; BB#51:                                ; %bb62.bb65_crit_edge
#0:	       ldi	-4 -> r1
#1:	       br	.BB3_54
	;;
	       nop	2
	;;
.BB3_52:                                ; %bb63
#0:	       sra	r1, 31 -> r3    ; mallocr.c:2452
#1:	       ldmg.d	___malloc_av_+4 ; mallocr.c:2452
	;;
#0:	       sr	r3, 30 -> r3    ; mallocr.c:2452
	;;
#0:	       add	r1, r3 -> r1    ; mallocr.c:2452
#1:	       ldi	1 -> r3
#2:	       ldx	$mem, 0 -> r6   ; mallocr.c:2452
	;;
#0:	       br	.BB3_57
#1:	       sra	r1, 2 -> r1     ; mallocr.c:2452
	;;
#0:	       sl	r3, r1 -> r1    ; mallocr.c:2452
	;;
#0:	       or	r1, r6 -> r1    ; mallocr.c:2452
	;;
#3:	       stm.a	r1, r3.16, 1
	;;
.BB3_53:                                ; %bb64
                                        ;   in Loop: Header=BB3_54 Depth=1
#0:	       ldm.f	r5, 8           ; mallocr.c:2452
	;;
#0:	       ldx	$mem, 0 -> r5   ; mallocr.c:2452
	;;
.BB3_54:                                ; %bb65
                                        ; =>This Inner Loop Header: Depth=1
#0:	       cmpeq	r5, r4 -> c1    ; mallocr.c:2452
	;;
#0:	if  c1 br	.BB3_56
	;;
	       nop	2
	;;
; BB#55:                                ; %bb66
                                        ;   in Loop: Header=BB3_54 Depth=1
#0:	       ldm.f	r5, 4           ; mallocr.c:2452
	;;
#0:	       ldx	$mem, 0 -> r6   ; mallocr.c:2452
	;;
#0:	       and	r6, r1 -> r6    ; mallocr.c:2452
	;;
#0:	       cmpult	r3, r6 -> c1    ; mallocr.c:2452
	;;
#0:	if  c1 br	.BB3_53         ; mallocr.c:2452
	;;                              ; mallocr.c:2452
	       nop	2               ; mallocr.c:2452
	;;
.BB3_56:                                ; %bb67
#0:	       ldm.f	r5, 12          ; mallocr.c:2452
	;;
#0:	       ldx	$mem, 0 -> r4   ; mallocr.c:2452
	;;
.BB3_57:                                ; %bb68
#0:	       stm.a	r4, r2, 3       ; mallocr.c:2452
	;;
#0:	       stm.a	r5, r2, 2       ; mallocr.c:2452
	;;
#0:	       stm.a	r2, r4, 2       ; mallocr.c:2452
	;;
#0:	       stm.a	r2, r5, 3       ; mallocr.c:2452
	;;
.BB3_58:                                ; %bb69
#0:	       sra	r0, 31 -> r1    ; mallocr.c:2460
#1:	       ldmg.d	___malloc_av_+4 ; mallocr.c:2460
#2:	       ldi	1 -> r3
	;;
#0:	       sr	r1, 30 -> r1    ; mallocr.c:2460
	;;
#0:	       add	r0, r1 -> r1    ; mallocr.c:2460
#1:	       ldx	$mem, 0 -> r2   ; mallocr.c:2460
	;;
#0:	       sra	r1, 2 -> r1     ; mallocr.c:2460
	;;
#0:	       sl	r3, r1 -> r1    ; mallocr.c:2460
	;;
#0:	       cmpult	r2, r1 -> c1    ; mallocr.c:2460
	;;
#0:	if  c1 br	.BB3_78
	;;
	       nop	2
	;;
; BB#59:                                ; %bb70
#0:	       and	r2, r1 -> r3    ; mallocr.c:2465
	;;
#0:	       cmpeq	r3, 0 -> c1     ; mallocr.c:2465
	;;
#0:	if  c1 add	r0, 4 -> r0
#1:	if  c1 ldi	-4 -> r3
#2:	if  c1 sl	r1, 1 -> r1
	;;
#0:	if  c1 and	r0, r3 -> r0
#1:	if  c1 and	r2, r1 -> r3    ; mallocr.c:2470
	;;
#0:	if  c1 cmpeq	r3, 0 -> c1     ; mallocr.c:2470
	;;
#0:	if !c1 br	.BB3_61
	;;
	       nop	2
	;;
.BB3_60:                                ; %bb72
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sl	r1, 1 -> r1
#1:	       add	r0, 4 -> r0
	;;
#0:	       and	r2, r1 -> r3    ; mallocr.c:2470
	;;
#0:	       cmpeq	r3, 0 -> c1     ; mallocr.c:2470
	;;
#0:	if  c1 br	.BB3_60         ; mallocr.c:2470
	;;                              ; mallocr.c:2470
	       nop	2               ; mallocr.c:2470
	;;
.BB3_61:                                ; %bb72.bb74_crit_edge
#0:	       or	r2, 0 -> r3
	;;
.BB3_62:                                ; %bb74
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB3_76 Depth 2
                                        ;     Child Loop BB3_71 Depth 2
                                        ;     Child Loop BB3_63 Depth 2
                                        ;       Child Loop BB3_64 Depth 3
#3:	       ldga	___malloc_av_ -> r3.16
#0:	       sl	r0, 3 -> r4
#1:	       add	r0, 1 -> r5
#2:	       ldi	-4 -> r7
	;;
#3:	       add	r3.16, r4 -> r6
#0:	       ldi	16 -> r8
	;;
.BB3_63:                                ; %bb75
                                        ;   Parent Loop BB3_62 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB3_64 Depth 3
#0:	       or	r6, 0 -> r9
	;;
.BB3_64:                                ; %bb81
                                        ;   Parent Loop BB3_62 Depth=1
                                        ;     Parent Loop BB3_63 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
#0:	       ldm.f	r9, 12
	;;
#0:	       ldx	$mem, 0 -> r9
	;;
#0:	       cmpne	r6, r9 -> c1    ; mallocr.c:2488
	;;
#0:	if !c1 br	.BB3_69
	;;
	       nop	2
	;;
; BB#65:                                ; %bb76
                                        ;   in Loop: Header=BB3_64 Depth=3
#0:	       ldm.f	r9, 4           ; mallocr.c:2490
	;;
#0:	       ldx	$mem, 0 -> r0.16 ; mallocr.c:2490
	;;
#0:	       and	r0.16, r7 -> r11 ; mallocr.c:2490
	;;
#0:	       sub	r11, r10 -> r12 ; mallocr.c:2491
	;;
#0:	       cmplt	r12, r8 -> c1   ; mallocr.c:2493
	;;
#0:	if  c1 br	.BB3_67         ; mallocr.c:2493
	;;                              ; mallocr.c:2493
	       nop	2               ; mallocr.c:2493
	;;
; BB#66:                                ; %bb77
#0:	       ldm.f	r9, 8           ; mallocr.c:2497
#1:	       or	r10, 1 -> r0    ; mallocr.c:2496
#2:	       add	r9, r10 -> r3   ; mallocr.c:2495
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:2497
#1:	       ldm.f	r9, 12          ; mallocr.c:2497
	;;
#0:	       ldx	$mem, 0 -> r2   ; mallocr.c:2497
#1:	       stm.a	r0, r9, 1       ; mallocr.c:2496
#2:	       ldga	___malloc_av_ -> r0 ; mallocr.c:2498
	;;
#0:	       stm.a	r2, r1, 3       ; mallocr.c:2497
	;;
#0:	       stm.a	r1, r2, 2       ; mallocr.c:2497
#1:	       or	r10, 4 -> r1
#2:	       or	r12, 1 -> r2    ; mallocr.c:2499
	;;
#0:	       add	r9, r1 -> r1
	;;
#0:	       stm.a	r3, r0, 5       ; mallocr.c:2498
	;;
#0:	       stm.a	r3, r0, 4       ; mallocr.c:2498
#1:	       add	r0, 8 -> r0     ; mallocr.c:2498
	;;
#0:	       br	.BB3_108
#1:	       stm.a	r2, r1, 0       ; mallocr.c:2499
#2:	       add	r9, r11 -> r1   ; mallocr.c:2500
	;;
#0:	       stm.a	r0, r3, 3       ; mallocr.c:2498
	;;
#0:	       stm.a	r0, r3, 2       ; mallocr.c:2498
#1:	       add	r9, 8 -> r0     ; mallocr.c:2497
	;;
#0:	       stm.a	r12, r1, 0      ; mallocr.c:2500
	;;
.BB3_67:                                ; %bb78
                                        ;   in Loop: Header=BB3_64 Depth=3
#0:	       cmplt	r12, 0 -> c1    ; mallocr.c:2506
	;;
#0:	if  c1 br	.BB3_64
	;;
	       nop	2
	;;
; BB#68:                                ; %bb79
#0:	       add	r11, r9 -> r1   ; mallocr.c:2508
#1:	       add	r9, 8 -> r0     ; mallocr.c:2509
	;;
#0:	       ldm.f	r1, 4           ; mallocr.c:2508
	;;
#0:	       ldx	$mem, 0 -> r2   ; mallocr.c:2508
	;;
#0:	       or	r2, 1 -> r2     ; mallocr.c:2508
	;;
#0:	       stm.a	r2, r1, 1       ; mallocr.c:2508
	;;
#0:	       ldm.f	r9, 8           ; mallocr.c:2509
	;;
#0:	       br	.BB3_33
#1:	       ldx	$mem, 0 -> r1   ; mallocr.c:2509
#2:	       ldm.f	r9, 12          ; mallocr.c:2509
	;;
#0:	       ldx	$mem, 0 -> r2   ; mallocr.c:2509
	;;
#0:	       stm.a	r2, r1, 3       ; mallocr.c:2509
	;;
#0:	       stm.a	r1, r2, 2       ; mallocr.c:2509
	;;
.BB3_69:                                ; %bb82
                                        ;   in Loop: Header=BB3_63 Depth=2
#0:	       add	r5, 1 -> r9
#1:	       and	r5, 3 -> r5     ; mallocr.c:2526
#2:	       add	r6, 8 -> r6
	;;
#0:	       cmpne	r5, 0 -> c1     ; mallocr.c:2526
#1:	       or	r9, 0 -> r5
	;;
#0:	if  c1 br	.BB3_63
	;;
	       nop	2
	;;
; BB#70:                                ; %bb83.loopexit
                                        ;   in Loop: Header=BB3_62 Depth=1
#3:	       ldga	___malloc_av_ -> r3.16
#0:	       sub	r9, 1 -> r5
	;;
#3:	       add	r3.16, r4 -> r4
	;;
.BB3_71:                                ; %bb83
                                        ;   Parent Loop BB3_62 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       and	r0, 3 -> r6     ; mallocr.c:2532
	;;
#0:	       cmpne	r6, 0 -> c1     ; mallocr.c:2532
	;;
#0:	if  c1 br	.BB3_73         ; mallocr.c:2532
	;;                              ; mallocr.c:2532
	       nop	2               ; mallocr.c:2532
	;;
; BB#72:                                ; %bb84
                                        ;   in Loop: Header=BB3_62 Depth=1
#0:	       xor	r1, -1 -> r0    ; mallocr.c:2534
#1:	       br	.BB3_74
	;;
#0:	       and	r3, r0 -> r2    ; mallocr.c:2534
#1:	       ldga	___malloc_av_ -> r0
	;;
#0:	       stm.a	r2, r0, 1
#1:	       or	r2, 0 -> r3
	;;
	       nop	0
	;;
.BB3_73:                                ; %bb86
                                        ;   in Loop: Header=BB3_71 Depth=2
#0:	       ldm.f	r4, 0           ; mallocr.c:2539
#1:	       sub	r4, 8 -> r6
#2:	       sub	r0, 1 -> r0
	;;
#0:	       ldx	$mem, 0 -> r4   ; mallocr.c:2539
	;;
#0:	       cmpeq	r6, r4 -> c1    ; mallocr.c:2539
#1:	       or	r6, 0 -> r4
	;;
#0:	if  c1 br	.BB3_71
	;;
	       nop	2
	;;
.BB3_74:                                ; %bb87
                                        ;   in Loop: Header=BB3_62 Depth=1
#0:	       sl	r1, 1 -> r1     ; mallocr.c:2543
	;;
#0:	       cmpult	r3, r1 -> c1    ; mallocr.c:2543
	;;
#0:	if !c1 cmpeq	r1, 0 -> c1
	;;
#0:	if  c1 br	.BB3_78
	;;
	       nop	2
	;;
; BB#75:                                ; %bb90.preheader
                                        ;   in Loop: Header=BB3_62 Depth=1
#0:	       and	r3, r1 -> r0    ; mallocr.c:2545
	;;
#0:	       cmpne	r0, 0 -> c1     ; mallocr.c:2545
#1:	       or	r5, 0 -> r0
	;;
#0:	if  c1 br	.BB3_62
	;;
	       nop	2
	;;
.BB3_76:                                ; %bb89
                                        ;   Parent Loop BB3_62 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       sl	r1, 1 -> r1     ; mallocr.c:2548
#1:	       add	r5, 4 -> r5
	;;
#0:	       and	r2, r1 -> r0    ; mallocr.c:2545
	;;
#0:	       cmpeq	r0, 0 -> c1     ; mallocr.c:2545
	;;
#0:	if  c1 br	.BB3_76
	;;
	       nop	2
	;;
; BB#77:                                ;   in Loop: Header=BB3_62 Depth=1
#0:	       or	r2, 0 -> r3
#1:	       br	.BB3_62
#2:	       or	r5, 0 -> r0
	;;
	       nop	2
	;;
.BB3_78:                                ; %bb91
#0:	       ldmg.d	___malloc_av_+8 ; mallocr.c:2560
#1:	       ldi	-4 -> r0
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:2560
	;;
#0:	       ldm.f	r1, 4           ; mallocr.c:2560
	;;
#0:	       ldx	$mem, 0 -> r2   ; mallocr.c:2560
	;;
#0:	       and	r2, r0 -> r0    ; mallocr.c:2560
	;;
#0:	       cmpult	r0, r10 -> c1   ; mallocr.c:2561
#1:	       stm.s	r0, r14, 5      ; mallocr.c:2561
	;;
#0:	if !c1 ldi	16 -> r2
#1:	if !c1 sub	r0, r10 -> r0   ; mallocr.c:2560
	;;
#0:	if !c1 cmplt	r0, r2 -> c1
	;;
#0:	if !c1 br	.BB3_109
	;;
	       nop	2
	;;
; BB#79:                                ; %bb93
#0:	       ldmg.d	___malloc_sbrk_base ; mallocr.c:2162[ mallocr.c:2575 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2162[ mallocr.c:2575 ]
#1:	       ldm.s	r14, 20         ; mallocr.c:2151[ mallocr.c:2575 ]
	;;
#0:	       cmpne	r0, -1 -> c1    ; mallocr.c:2162[ mallocr.c:2575 ]
	;;
#0:	if  c1 br	.BB3_81         ; mallocr.c:2162[ mallocr.c:2575 ]
#1:	       ldx	$mem, 0 -> r2   ; mallocr.c:2151[ mallocr.c:2575 ]
	;;
#0:	       add	r1, r2 -> r2    ; mallocr.c:2151[ mallocr.c:2575 ]
	;;
#0:	       stm.s	r2, r14, 4      ; mallocr.c:2162[ mallocr.c:2575 ]
	;;                              ; mallocr.c:2162[ mallocr.c:2575 ]
	       nop	0               ; mallocr.c:2162[ mallocr.c:2575 ]
	;;
; BB#80:                                ; %bb93.bb1.i_crit_edge
#0:	       add	r10, 16 -> r0   ; mallocr.c:2155[ mallocr.c:2575 ]
#1:	       br	.BB3_82
	;;
	       nop	2
	;;
.BB3_81:                                ; %bb.i
#0:	       ldiu	15 -> r0
#1:	       ldiu	0 -> r2
	;;
#0:	       ldim	2 -> r0
#1:	       ldim	2046 -> r2
	;;
#0:	       add	r10, r0 -> r0
	;;
#0:	       and	r0, r2 -> r0    ; mallocr.c:2163[ mallocr.c:2575 ]
	;;
.BB3_82:                                ; %bb.i
#0:	       stm.s	r0, r14, 6
#1:	       ldga	_errno.b -> r2
	;;
#0:	       ldmg.d	_heap_end.1081  ; sbrk.c:14[ sbrkr.c:60[ mallocr.c:2165[ mallocr.c:2575 ] ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; sbrk.c:14[ sbrkr.c:60[ mallocr.c:2165[ mallocr.c:2575 ] ] ]
#1:	       stmb.a	0, r2, 0
	;;
#0:	       cmpeq	r0, 0 -> c2     ; sbrk.c:14[ sbrkr.c:60[ mallocr.c:2165[ mallocr.c:2575 ] ] ]
	;;
#0:	if !c2 br	.BB3_84
	;;
	       nop	2
	;;
; BB#83:                                ; %bb.i.i
#0:	       ldga	_end -> r0      ; sbrk.c:15[ sbrkr.c:60[ mallocr.c:2165[ mallocr.c:2575 ] ] ]
#1:	       ldga	_heap_end.1081 -> r2 ; sbrk.c:15[ sbrkr.c:60[ mallocr.c:2165[ mallocr.c:2575 ] ] ]
	;;
#0:	       stm.a	r0, r2, 0       ; sbrk.c:15[ sbrkr.c:60[ mallocr.c:2165[ mallocr.c:2575 ] ] ]
	;;
.BB3_84:                                ; %_sbrk.exit.i
#0:	       ldm.s	r14, 24         ; sbrk.c:18[ sbrkr.c:60[ mallocr.c:2165[ mallocr.c:2575 ] ] ]
#1:	       cmpeq	r0, -1 -> c2    ; sbrkr.c:60[ mallocr.c:2165[ mallocr.c:2575 ] ]
#2:	       ldga	_heap_end.1081 -> r3 ; sbrk.c:18[ sbrkr.c:60[ mallocr.c:2165[ mallocr.c:2575 ] ] ]
	;;
#0:	if  c2 br	.BB3_106
#1:	       ldx	$mem, 0 -> r2   ; sbrk.c:18[ sbrkr.c:60[ mallocr.c:2165[ mallocr.c:2575 ] ] ]
	;;
#0:	       add	r0, r2 -> r2    ; sbrk.c:18[ sbrkr.c:60[ mallocr.c:2165[ mallocr.c:2575 ] ] ]
	;;
#0:	       stm.a	r2, r3, 0       ; sbrk.c:18[ sbrkr.c:60[ mallocr.c:2165[ mallocr.c:2575 ] ] ]
	;;
	       nop	0
	;;
; BB#85:                                ; %bb2.i
#0:	       ldm.s	r14, 16
	;;
#0:	       ldx	$mem, 0 -> r3
	;;
#0:	       cmpule	r3, r0 -> c2
	;;
#0:	if  c2 br	.BB3_87
	;;
	       nop	2
	;;
; BB#86:                                ; %bb2.i
#0:	       ldga	___malloc_av_ -> r3
	;;
#0:	       cmpne	r1, r3 -> c2
	;;
#0:	if  c2 br	.BB3_106
	;;
	       nop	2
	;;
.BB3_87:                                ; %bb4.i
#0:	       ldmg.d	___malloc_current_mallinfo.0 ; mallocr.c:2172[ mallocr.c:2575 ]
	;;
#3:	       ldga	___malloc_current_mallinfo.0 -> r3.16 ; mallocr.c:2172[ mallocr.c:2575 ]
	;;
#0:	       ldx	$mem, 0 -> r3   ; mallocr.c:2172[ mallocr.c:2575 ]
#1:	       ldm.s	r14, 24         ; mallocr.c:2172[ mallocr.c:2575 ]
	;;
#0:	       ldx	$mem, 0 -> r4   ; mallocr.c:2172[ mallocr.c:2575 ]
	;;
#0:	       add	r3, r4 -> r3    ; mallocr.c:2172[ mallocr.c:2575 ]
	;;
#3:	       stm.a	r3, r3.16, 0    ; mallocr.c:2172[ mallocr.c:2575 ]
	;;
#0:	       ldm.s	r14, 16         ; mallocr.c:2174[ mallocr.c:2575 ]
	;;
#0:	       ldx	$mem, 0 -> r4   ; mallocr.c:2174[ mallocr.c:2575 ]
	;;
#0:	       cmpne	r0, r4 -> c2    ; mallocr.c:2174[ mallocr.c:2575 ]
	;;
#0:	if !c2 ldm.s	r14, 16         ; mallocr.c:2174[ mallocr.c:2575 ]
#1:	if !c2 ldiu	2047 -> r4
	;;
#0:	if !c2 ldim	1 -> r4
	;;
#0:	if !c2 ldx	$mem, 0 -> r5   ; mallocr.c:2174[ mallocr.c:2575 ]
	;;
#0:	if !c2 and	r5, r4 -> r4    ; mallocr.c:2174[ mallocr.c:2575 ]
	;;
#0:	if !c2 cmpne	r4, 0 -> c2     ; mallocr.c:2174[ mallocr.c:2575 ]
	;;
#0:	if  c2 br	.BB3_89
	;;
	       nop	2
	;;
; BB#88:                                ; %bb6.i
#0:	       ldm.s	r14, 24         ; mallocr.c:2178[ mallocr.c:2575 ]
	;;
#0:	       ldx	$mem, 0 -> r2   ; mallocr.c:2178[ mallocr.c:2575 ]
#1:	       ldm.s	r14, 20         ; mallocr.c:2178[ mallocr.c:2575 ]
	;;
#0:	       br	.BB3_102
#1:	       ldx	$mem, 0 -> r0   ; mallocr.c:2178[ mallocr.c:2575 ]
	;;
#0:	       add	r2, r0 -> r0    ; mallocr.c:2178[ mallocr.c:2575 ]
	;;
#0:	       or	r0, 1 -> r0     ; mallocr.c:2179[ mallocr.c:2575 ]
	;;
#0:	       stm.a	r0, r1, 1       ; mallocr.c:2179[ mallocr.c:2575 ]
	;;
.BB3_89:                                ; %bb7.i
#0:	if  c1 br	.BB3_91         ; mallocr.c:2183[ mallocr.c:2575 ]
	;;                              ; mallocr.c:2183[ mallocr.c:2575 ]
	       nop	2               ; mallocr.c:2183[ mallocr.c:2575 ]
	;;
; BB#90:                                ; %bb8.i
#0:	       ldga	___malloc_sbrk_base -> r0.16 ; mallocr.c:2184[ mallocr.c:2575 ]
#1:	       br	.BB3_92
	;;
#0:	       stm.a	r0, r0.16, 0    ; mallocr.c:2184[ mallocr.c:2575 ]
	;;
	       nop	1
	;;
.BB3_91:                                ; %bb9.i
#0:	       ldm.s	r14, 16
#1:	       ldga	___malloc_current_mallinfo.0 -> r1.16 ; mallocr.c:2186[ mallocr.c:2575 ]
	;;
#0:	       ldx	$mem, 0 -> r4
	;;
#0:	       sub	r0, r4 -> r4
	;;
#0:	       add	r4, r3 -> r3    ; mallocr.c:2186[ mallocr.c:2575 ]
	;;
#1:	       stm.a	r3, r1.16, 0    ; mallocr.c:2186[ mallocr.c:2575 ]
	;;
.BB3_92:                                ; %bb10.i
#0:	       add	r0, 8 -> r4     ; mallocr.c:2189[ mallocr.c:2575 ]
	;;
#0:	       and	r4, 7 -> r4     ; mallocr.c:2189[ mallocr.c:2575 ]
	;;
#0:	       cmpne	r4, 0 -> c1     ; mallocr.c:2190[ mallocr.c:2575 ]
	;;
#0:	if  c1 br	.BB3_94         ; mallocr.c:2190[ mallocr.c:2575 ]
	;;                              ; mallocr.c:2190[ mallocr.c:2575 ]
	       nop	2               ; mallocr.c:2190[ mallocr.c:2575 ]
	;;
; BB#93:                                ; %bb10.i.bb13.i_crit_edge
#0:	       ldi	0 -> r4
#1:	       br	.BB3_95
	;;
	       nop	2
	;;
.BB3_94:                                ; %bb11.i
#0:	       ldi	8 -> r5
	;;
#0:	       sub	r5, r4 -> r4    ; mallocr.c:2192[ mallocr.c:2575 ]
	;;
#0:	       add	r0, r4 -> r0    ; mallocr.c:2193[ mallocr.c:2575 ]
	;;
.BB3_95:                                ; %bb13.i
#0:	       ldm.s	r14, 24         ; mallocr.c:2199[ mallocr.c:2575 ]
#1:	       ldiu	2047 -> r5
#2:	       cmpeq	r2, 0 -> c1     ; sbrk.c:14[ sbrkr.c:60[ mallocr.c:2202[ mallocr.c:2575 ] ] ]
	;;
#0:	       ldim	1 -> r5
#1:	       ldga	4096 -> r1.16
#2:	       ldga	_errno.b -> r2.16
	;;
#0:	       ldx	$mem, 0 -> r6   ; mallocr.c:2199[ mallocr.c:2575 ]
#2:	       stmb.a	0, r2.16, 0
	;;
#0:	if !c1 br	.BB3_97
#1:	       add	r0, r6 -> r6    ; mallocr.c:2199[ mallocr.c:2575 ]
	;;
#0:	       and	r6, r5 -> r5    ; mallocr.c:2199[ mallocr.c:2575 ]
	;;
#1:	       sub	r1.16, r5 -> r5 ; mallocr.c:2199[ mallocr.c:2575 ]
	;;
#0:	       add	r5, r4 -> r4    ; mallocr.c:2199[ mallocr.c:2575 ]
	;;
; BB#96:                                ; %bb.i.i4
#0:	       ldga	_end -> r2      ; sbrk.c:15[ sbrkr.c:60[ mallocr.c:2202[ mallocr.c:2575 ] ] ]
#2:	       ldga	_heap_end.1081 -> r2.16 ; sbrk.c:15[ sbrkr.c:60[ mallocr.c:2202[ mallocr.c:2575 ] ] ]
	;;
#2:	       stm.a	r2, r2.16, 0    ; sbrk.c:15[ sbrkr.c:60[ mallocr.c:2202[ mallocr.c:2575 ] ] ]
	;;
.BB3_97:                                ; %_sbrk.exit.i5
#0:	       cmpeq	r2, -1 -> c1    ; sbrkr.c:60[ mallocr.c:2202[ mallocr.c:2575 ] ]
#1:	       or	r2, 0 -> r6
#2:	       add	r2, r4 -> r2    ; sbrk.c:18[ sbrkr.c:60[ mallocr.c:2202[ mallocr.c:2575 ] ] ]
#3:	       ldi	0 -> r5
	;;
#1:	       stm.s	r2, r14, 6      ; sbrk.c:18[ sbrkr.c:60[ mallocr.c:2202[ mallocr.c:2575 ] ] ]
#2:	       ldga	___malloc_av_ -> r2
#3:	       or	r4, 0 -> r7
#0:	       ldga	_heap_end.1081 -> r0.16 ; sbrk.c:18[ sbrkr.c:60[ mallocr.c:2202[ mallocr.c:2575 ] ] ]
	;;
#0:	       stm.a	r0, r2, 2       ; mallocr.c:2212[ mallocr.c:2575 ]
#1:	if  c1 or	r5, 0 -> r7
#2:	if  c1 or	r0, 0 -> r6
	;;
#0:	       add	r7, r3 -> r3    ; mallocr.c:2210[ mallocr.c:2575 ]
#1:	       sub	r6, r0 -> r5
	;;
#3:	       ldga	___malloc_current_mallinfo.0 -> r3.16 ; mallocr.c:2210[ mallocr.c:2575 ]
#0:	       add	r5, r7 -> r4    ; mallocr.c:2213[ mallocr.c:2575 ]
	;;
#0:	       ldm.s	r14, 24         ; sbrk.c:18[ sbrkr.c:60[ mallocr.c:2202[ mallocr.c:2575 ] ] ]
	;;
#0:	       ldx	$mem, 0 -> r2   ; sbrk.c:18[ sbrkr.c:60[ mallocr.c:2202[ mallocr.c:2575 ] ] ]
	;;
#0:	       stm.a	r2, r0.16, 0    ; sbrk.c:18[ sbrkr.c:60[ mallocr.c:2202[ mallocr.c:2575 ] ] ]
#1:	       or	r4, 1 -> r2     ; mallocr.c:2214[ mallocr.c:2575 ]
	;;
#3:	       stm.a	r3, r3.16, 0    ; mallocr.c:2210[ mallocr.c:2575 ]
	;;
#0:	       stm.s	r2, r14, 6      ; mallocr.c:2216[ mallocr.c:2575 ]
#1:	       ldga	___malloc_av_ -> r2
	;;
#0:	       cmpne	r1, r2 -> c1    ; mallocr.c:2216[ mallocr.c:2575 ]
#1:	       ldm.s	r14, 24         ; mallocr.c:2214[ mallocr.c:2575 ]
	;;
#0:	if !c1 br	.BB3_102
#1:	       ldx	$mem, 0 -> r2   ; mallocr.c:2214[ mallocr.c:2575 ]
	;;
#0:	       stm.a	r2, r0, 1       ; mallocr.c:2214[ mallocr.c:2575 ]
	;;
	       nop	1
	;;
; BB#98:                                ; %bb16.i
#0:	       ldm.s	r14, 20         ; mallocr.c:2223[ mallocr.c:2575 ]
#1:	       ldi	15 -> r0
	;;
#0:	       ldx	$mem, 0 -> r2   ; mallocr.c:2223[ mallocr.c:2575 ]
	;;
#0:	       cmpult	r0, r2 -> c1    ; mallocr.c:2223[ mallocr.c:2575 ]
	;;
#0:	if  c1 br	.BB3_100        ; mallocr.c:2223[ mallocr.c:2575 ]
	;;                              ; mallocr.c:2223[ mallocr.c:2575 ]
	       nop	2               ; mallocr.c:2223[ mallocr.c:2575 ]
	;;
; BB#99:                                ; %bb17.i
#0:	       ldmg.d	___malloc_av_+8 ; mallocr.c:2225[ mallocr.c:2575 ]
#1:	       br	.BB3_106
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2225[ mallocr.c:2575 ]
	;;
#0:	       stm.a	1, r0, 1        ; mallocr.c:2225[ mallocr.c:2575 ]
	;;
	       nop	0
	;;
.BB3_100:                               ; %bb18.i
#0:	       ldm.f	r1, 4           ; mallocr.c:2231[ mallocr.c:2575 ]
#1:	       ldi	-8 -> r4
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2231[ mallocr.c:2575 ]
#1:	       ldm.s	r14, 20
	;;
#0:	       and	r0, 1 -> r0     ; mallocr.c:2231[ mallocr.c:2575 ]
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       sub	r2, 12 -> r2
	;;
#0:	       and	r2, r4 -> r4    ; mallocr.c:2230[ mallocr.c:2575 ]
#1:	       or	r2, 4 -> r2
	;;
#0:	       or	r0, r4 -> r0    ; mallocr.c:2231[ mallocr.c:2575 ]
#1:	       add	r1, r2 -> r2
#2:	       cmpult	r4, 16 -> c1    ; mallocr.c:2237[ mallocr.c:2575 ]
	;;
#0:	if  c1 br	.BB3_102
#1:	       stm.a	r0, r1, 1       ; mallocr.c:2231[ mallocr.c:2575 ]
	;;
#0:	       stm.a	5, r2, 0        ; mallocr.c:2232[ mallocr.c:2575 ]
	;;
#0:	       stm.a	5, r2, 1        ; mallocr.c:2234[ mallocr.c:2575 ]
	;;
	       nop	0
	;;
; BB#101:                               ; %bb19.i
#0:	       ldga	_impure_data -> r0 ; mallocr.c:2238[ mallocr.c:2575 ]
#1:	       callg	__free_r        ; mallocr.c:2238[ mallocr.c:2575 ]
#2:	       add	r1, 8 -> r1
	;;                              ; mallocr.c:2238[ mallocr.c:2575 ]
	       nop	3               ; mallocr.c:2238[ mallocr.c:2575 ]
	;;
#0:	       ldmg.d	___malloc_current_mallinfo.0
	;;
#0:	       ldx	$mem, 0 -> r3
	;;
.BB3_102:                               ; %bb20.i
#0:	       ldmg.d	___malloc_max_sbrked_mem ; mallocr.c:2242[ mallocr.c:2575 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2242[ mallocr.c:2575 ]
	;;
#0:	       cmpule	r3, r0 -> c1    ; mallocr.c:2242[ mallocr.c:2575 ]
	;;
#0:	if  c1 br	.BB3_104
	;;
	       nop	2
	;;
; BB#103:                               ; %bb21.i
#0:	       ldga	___malloc_max_sbrked_mem -> r0 ; mallocr.c:2243[ mallocr.c:2575 ]
	;;
#0:	       stm.a	r3, r0, 0       ; mallocr.c:2243[ mallocr.c:2575 ]
	;;
.BB3_104:                               ; %bb22.i
#0:	       ldmg.d	___malloc_max_total_mem ; mallocr.c:2248[ mallocr.c:2575 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2248[ mallocr.c:2575 ]
	;;
#0:	       cmpule	r3, r0 -> c1    ; mallocr.c:2248[ mallocr.c:2575 ]
	;;
#0:	if  c1 br	.BB3_106
	;;
	       nop	2
	;;
; BB#105:                               ; %bb23.i
#0:	       ldga	___malloc_max_total_mem -> r0 ; mallocr.c:2249[ mallocr.c:2575 ]
	;;
#0:	       stm.a	r3, r0, 0       ; mallocr.c:2249[ mallocr.c:2575 ]
	;;
.BB3_106:                               ; %malloc_extend_top.exit
#0:	       ldmg.d	___malloc_av_+8 ; mallocr.c:2576
#1:	       ldi	-4 -> r0
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:2576
	;;
#0:	       ldm.f	r1, 4           ; mallocr.c:2576
	;;
#0:	       ldx	$mem, 0 -> r2   ; mallocr.c:2576
	;;
#0:	       and	r2, r0 -> r0    ; mallocr.c:2576
	;;
#0:	       cmpult	r0, r10 -> c1   ; mallocr.c:2577
	;;
#0:	if !c1 sub	r0, r10 -> r0   ; mallocr.c:2576
#1:	if !c1 ldi	16 -> r2
	;;
#0:	if !c1 cmplt	r0, r2 -> c1
	;;
#0:	if !c1 br	.BB3_109
	;;
	       nop	2
	;;
; BB#107:                               ; %bb95
#0:	       ldi	0 -> r0
	;;
.BB3_108:                               ; %bb95
#0:	       ldm.s	r14, 28         ; mallocr.c:2590
#1:	       or	r14, 0 -> r15   ; mallocr.c:2590
	;;
#0:	       ldx	$mem, 0 -> r12  ; mallocr.c:2590
#1:	       ldm.s	r14, 32         ; mallocr.c:2590
	;;
#0:	       ldx	$mem, 0 -> r11  ; mallocr.c:2590
#1:	       ldm.s	r14, 36         ; mallocr.c:2590
	;;
#0:	       ldx	$mem, 0 -> r10  ; mallocr.c:2590
#1:	       ldm.s	r15, 8          ; mallocr.c:2590
	;;
#0:	       br	.BB3_34
#1:	       ldx	$mem, 0 -> r1.31 ; mallocr.c:2590
#2:	       ldm.s	r15, 4          ; mallocr.c:2590
	;;
#1:	       stx	r1.31 -> $ro    ; mallocr.c:2590
	;;
#2:	       ldx	$mem, 0 -> r2.31 ; mallocr.c:2590
	;;
#2:	       stx	r2.31 -> $rb    ; mallocr.c:2590
	;;
.BB3_109:                               ; %bb96
#1:	       or	r10, 1 -> r2    ; mallocr.c:2585
#2:	       add	r1, r10 -> r4   ; mallocr.c:2586
#0:	       ldga	___malloc_av_ -> r0.16 ; mallocr.c:2586
#3:	       or	r10, 4 -> r3
	;;
#0:	       br	.BB3_33
#1:	       stm.a	r2, r1, 1       ; mallocr.c:2585
#2:	       or	r0, 1 -> r0     ; mallocr.c:2587
#3:	       add	r1, r3 -> r2
	;;
#0:	       stm.a	r4, r0.16, 2    ; mallocr.c:2586
	;;
#0:	       stm.a	r0, r2, 0       ; mallocr.c:2587
#1:	       add	r1, 8 -> r0
	;;
	       nop	0
	;;
	.align	4
__malloc_r_end:

	.align	4
_memmove:                               ; @memmove
	.size	_memmove_end-_memmove
_memmove_start:
; BB#0:                                 ; %entry
#0:	       ldiu	8 -> r3         ; memmove.c:92
#1:	       cmpule	r0, r1 -> c1    ; memmove.c:92
#2:	       wb.s	r15, 2          ; memmove.c:92
	;;
#0:	       sub	r15, r3 -> r15  ; memmove.c:92
#1:	if !c1 add	r1, r2 -> r3    ; memmove.c:92
	;;
#0:	if !c1 cmpule	r3, r0 -> c1    ; memmove.c:92
	;;
#0:	if  c1 br	.BB4_4
#1:	       stm.s	r10, r15, 1     ; memmove.c:92
	;;
	       nop	2
	;;
; BB#1:                                 ; %bb1
#0:	       cmpeq	r2, 0 -> c1
	;;
#0:	if  c1 br	.BB4_15
	;;
	       nop	2
	;;
; BB#2:                                 ; %bb.nph34
#0:	       ldi	0 -> r3
	;;
#0:	       sub	r3, r2 -> r2
	;;
.BB4_3:                                 ; %bb2
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sub	r1, r2 -> r3
#1:	       sub	r0, r2 -> r5
#2:	       add	r2, 1 -> r2
	;;
#0:	       cmpeq	r2, 0 -> c1
#1:	       ldm.f	r3, -1          ; memmove.c:99
#2:	       sub	r3, 1 -> r4
	;;
#0:	if !c1 br	.BB4_3
#1:	       ldx	$membu, r4 -> r3 ; memmove.c:99
#2:	       sub	r5, 1 -> r4
	;;
#0:	       stmb.a	r3, r4, 0       ; memmove.c:99
	;;
	       nop	1
	;;
#0:	       br	.BB4_15
	;;
	       nop	2
	;;
.BB4_4:                                 ; %bb4
#0:	       ldi	15 -> r3
	;;
#0:	       cmpult	r3, r2 -> c1    ; memmove.c:107
	;;
#0:	if !c1 br	.BB4_13
	;;
	       nop	2
	;;
; BB#5:                                 ; %bb5
#0:	       or	r1, r0 -> r3    ; memmove.c:107
	;;
#0:	       and	r3, 3 -> r3     ; memmove.c:107
	;;
#0:	       cmpeq	r3, 0 -> c1     ; memmove.c:107
	;;
#0:	if !c1 br	.BB4_14
	;;
	       nop	2
	;;
; BB#6:                                 ; %bb5.bb7_crit_edge
#0:	       ldi	0 -> r3
#1:	       ldi	15 -> r4
	;;
.BB4_7:                                 ; %bb7
                                        ; =>This Inner Loop Header: Depth=1
#0:	       or	r3, 0 -> r5
	;;
#0:	       sub	r1, r5 -> r6
#1:	       sub	r0, r5 -> r7
	;;
#0:	       ldm.f	r6, 0           ; memmove.c:115
	;;
#0:	       ldx	$mem, 0 -> r3   ; memmove.c:115
	;;
#0:	       stm.a	r3, r7, 0       ; memmove.c:115
#1:	       sub	r5, 16 -> r3
	;;
#0:	       ldm.f	r6, 4           ; memmove.c:116
	;;
#0:	       ldx	$mem, 0 -> r8   ; memmove.c:116
	;;
#0:	       stm.a	r8, r7, 1       ; memmove.c:116
	;;
#0:	       ldm.f	r6, 8           ; memmove.c:117
	;;
#0:	       ldx	$mem, 0 -> r8   ; memmove.c:117
	;;
#0:	       stm.a	r8, r7, 2       ; memmove.c:117
#1:	       add	r2, r3 -> r8
	;;
#0:	       cmpult	r4, r8 -> c1    ; memmove.c:113
	;;
#0:	if  c1 br	.BB4_7          ; memmove.c:113
#1:	       ldm.f	r6, 12          ; memmove.c:118
	;;
#0:	       ldx	$mem, 0 -> r6   ; memmove.c:118
	;;
#0:	       stm.a	r6, r7, 3       ; memmove.c:118
	;;                              ; memmove.c:113
	       nop	0               ; memmove.c:113
	;;
; BB#8:                                 ; %bb10.preheader
#0:	       ldi	3 -> r4
	;;
#0:	       cmpult	r4, r8 -> c1    ; memmove.c:123
	;;
#0:	if  c1 br	.BB4_10         ; memmove.c:123
	;;                              ; memmove.c:123
	       nop	2               ; memmove.c:123
	;;
; BB#9:                                 ; %bb10.preheader.bb11_crit_edge
#0:	       sub	r0, r3 -> r0
#1:	       br	.BB4_13
#2:	       sub	r1, r3 -> r1
#3:	       or	r8, 0 -> r2
	;;
	       nop	2
	;;
.BB4_10:                                ; %bb.nph22
#0:	       ldi	0 -> r6
#1:	       add	r2, r3 -> r2
	;;
#0:	       or	r6, 0 -> r7
	;;
.BB4_11:                                ; %bb9
                                        ; =>This Inner Loop Header: Depth=1
#3:	       sub	r2, r6 -> r3.16
#0:	       add	r1, r6 -> r8
#1:	       add	r0, r6 -> r9
#2:	       sub	r7, 4 -> r7
	;;
#3:	       sub	r3.16, 4 -> r10
#0:	       sub	r8, r5 -> r8
#1:	       sub	r9, r5 -> r9
#2:	       add	r6, 4 -> r6
	;;
#0:	       cmpult	r4, r10 -> c1   ; memmove.c:123
#1:	       ldm.f	r8, 16          ; memmove.c:125
	;;
#0:	if  c1 br	.BB4_11         ; memmove.c:123
#1:	       ldx	$mem, 0 -> r8   ; memmove.c:125
	;;
#0:	       stm.a	r8, r9, 4       ; memmove.c:125
	;;                              ; memmove.c:123
	       nop	1               ; memmove.c:123
	;;
; BB#12:                                ; %bb10.bb11_crit_edge
#0:	       add	r1, r6 -> r1
#1:	       add	r0, r6 -> r0
#2:	       sub	r2, r6 -> r2
	;;
#0:	       sub	r1, r3 -> r1
#1:	       sub	r0, r3 -> r0
	;;
.BB4_13:                                ; %bb13.preheader
#0:	       cmpeq	r2, 0 -> c1
	;;
#0:	if  c1 br	.BB4_15
	;;
	       nop	2
	;;
.BB4_14:                                ; %bb12
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sub	r2, 1 -> r2
#1:	       ldm.f	r1, 0           ; memmove.c:136
#2:	       add	r0, 1 -> r4
	;;
#0:	       cmpne	r2, 0 -> c1     ; memmove.c:134
	;;
#0:	if  c1 br	.BB4_14         ; memmove.c:134
#1:	       ldx	$membu, r1 -> r3 ; memmove.c:136
#2:	       add	r1, 1 -> r1
	;;
#0:	       stmb.a	r3, r0, 0       ; memmove.c:136
#1:	       or	r4, 0 -> r0
	;;                              ; memmove.c:134
	       nop	1               ; memmove.c:134
	;;
.BB4_15:                                ; %bb14
#0:	       ldm.s	r15, 4
#1:	       s2add	r15, 2 -> r15
	;;
#0:	       ret
#1:	       ldx	$mem, 0 -> r10
	;;
	       nop	3
	;;
	.align	4
_memmove_end:

	.align	4
__cleanup_r:                            ; @_cleanup_r
	.size	__cleanup_r_end-__cleanup_r
__cleanup_r_start:
; BB#0:                                 ; %entry
#0:	       wb.s	r15, 9
#2:	       ldiu	36 -> r2
#1:	       ldx	$rb, 0 -> r1.31
#3:	       ldi	736 -> r1
	;;
#0:	       sub	r15, r2 -> r15
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
#1:	       add	r0, r1 -> r10   ; fwalk.c:47[ findfp.c:165 ]
	;;
#0:	       cmpeq	r10, 0 -> c1    ; fwalk.c:47[ findfp.c:165 ]
#1:	       stm.s	r11, r14, 7
	;;
#0:	if  c1 br	.BB5_20
#1:	       stm.s	r12, r14, 6
	;;
#0:	       stm.s	r13, r14, 5
	;;
#2:	       stm.s	r2.23, r14, 4
	;;
	       nop	0
	;;
; BB#1:                                 ; %entry.bb.i_crit_edge
#0:	       ldi	-1 -> r11
	;;
.BB5_2:                                 ; %bb.i
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB5_4 Depth 2
#0:	       ldm.f	r10, 4          ; fwalk.c:48[ findfp.c:165 ]
	;;
#0:	       ldx	$mem, 0 -> r12  ; fwalk.c:48[ findfp.c:165 ]
	;;
#0:	       sub	r12, 1 -> r0
	;;
#0:	       cmplt	r0, 0 -> c1     ; fwalk.c:48[ findfp.c:165 ]
	;;
#0:	if  c1 br	.BB5_19
	;;
	       nop	2
	;;
; BB#3:                                 ; %bb.nph.i
                                        ;   in Loop: Header=BB5_2 Depth=1
#0:	       ldm.f	r10, 8          ; fwalk.c:48[ findfp.c:165 ]
	;;
#0:	       ldx	$mem, 0 -> r13  ; fwalk.c:48[ findfp.c:165 ]
	;;
.BB5_4:                                 ; %bb1.i
                                        ;   Parent Loop BB5_2 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r13, 12         ; fwalk.c:49[ findfp.c:165 ]
#2:	       add	r13, 12 -> r2.23
	;;
#2:	       ldx	$memhu, r2.23 -> r0 ; fwalk.c:49[ findfp.c:165 ]
	;;
#0:	       cmpult	r0, 2 -> c1     ; fwalk.c:49[ findfp.c:165 ]
	;;
#0:	if !c1 ldm.f	r13, 14         ; fwalk.c:51[ findfp.c:165 ]
#1:	if !c1 add	r13, 14 -> r0
#2:	if !c1 ldiu	2047 -> r1
	;;
#0:	if !c1 ldim	31 -> r1
	;;
#0:	if !c1 ldx	$memhu, r0 -> r0 ; fwalk.c:51[ findfp.c:165 ]
	;;
#0:	if !c1 cmpeq	r0, r1 -> c1    ; fwalk.c:51[ findfp.c:165 ]
	;;
#0:	if  c1 br	.BB5_18
	;;
	       nop	2
	;;
; BB#5:                                 ; %bb1.i.i.i
                                        ;   in Loop: Header=BB5_4 Depth=2
#0:	       ldmg.d	_impure_data+56 ; fclose.c:77[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; fclose.c:77[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	       cmpne	r0, 0 -> c1     ; fclose.c:77[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	if  c1 br	.BB5_7
	;;
	       nop	2
	;;
; BB#6:                                 ; %bb4.i.i.i
                                        ;   in Loop: Header=BB5_4 Depth=2
#0:	       ldga	_impure_data -> r0 ; fclose.c:77[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
#1:	       callg	___sinit        ; fclose.c:77[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;                              ; fclose.c:77[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	       nop	3               ; fclose.c:77[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	       ldm.f	r13, 12
	;;
#2:	       ldx	$memhu, r2.23 -> r0
	;;
#0:	       cmpeq	r0, 0 -> c1     ; fclose.c:81[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	if  c1 br	.BB5_18
	;;
	       nop	2
	;;
.BB5_7:                                 ; %bb6.i.i.i
                                        ;   in Loop: Header=BB5_4 Depth=2
#0:	       ldga	_impure_data -> r0 ; fclose.c:77[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
#1:	       callg	__fflush_r      ; fclose.c:89[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
#2:	       or	r13, 0 -> r1    ; fclose.c:89[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;                              ; fclose.c:89[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	       nop	3               ; fclose.c:89[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	       ldm.f	r13, 44         ; fclose.c:90[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	       ldx	$mem, 0 -> r2   ; fclose.c:90[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	       cmpeq	r2, 0 -> c1     ; fclose.c:90[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	if  c1 br	.BB5_9
	;;
	       nop	2
	;;
; BB#8:                                 ; %bb7.i.i.i
                                        ;   in Loop: Header=BB5_4 Depth=2
#0:	       ldm.f	r13, 28         ; fclose.c:90[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
#1:	       ldga	_impure_data -> r0 ; fclose.c:77[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; fclose.c:90[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	       call	r2              ; fclose.c:90[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;                              ; fclose.c:90[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	       nop	3               ; fclose.c:90[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	       cmplt	r11, r0 -> c1   ; fclose.c:90[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
.BB5_9:                                 ; %bb9.i.i.i
                                        ;   in Loop: Header=BB5_4 Depth=2
#0:	       ldm.f	r13, 12
	;;
#2:	       ldx	$memhu, r2.23 -> r0
	;;
#0:	       btest	r0, 7 -> c1     ; fclose.c:92[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	if !c1 br	.BB5_11
	;;
	       nop	2
	;;
; BB#10:                                ; %bb10.i.i.i
                                        ;   in Loop: Header=BB5_4 Depth=2
#0:	       ldm.f	r13, 16         ; fclose.c:93[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
#1:	       ldga	_impure_data -> r0 ; fclose.c:77[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	       callg	__free_r        ; fclose.c:93[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
#1:	       ldx	$mem, 0 -> r1   ; fclose.c:93[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;                              ; fclose.c:93[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	       nop	3               ; fclose.c:93[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
.BB5_11:                                ; %bb11.i.i.i
                                        ;   in Loop: Header=BB5_4 Depth=2
#0:	       ldm.f	r13, 48         ; fclose.c:94[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; fclose.c:94[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	       cmpeq	r1, 0 -> c1     ; fclose.c:94[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	if  c1 br	.BB5_15
	;;
	       nop	2
	;;
; BB#12:                                ; %bb12.i.i.i
                                        ;   in Loop: Header=BB5_4 Depth=2
#0:	       s2add	r13, 16 -> r0
	;;
#0:	       cmpeq	r0, r1 -> c1    ; fclose.c:95[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	if  c1 br	.BB5_14
	;;
	       nop	2
	;;
; BB#13:                                ; %bb13.i.i.i
                                        ;   in Loop: Header=BB5_4 Depth=2
#0:	       ldga	_impure_data -> r0 ; fclose.c:77[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
#1:	       callg	__free_r        ; fclose.c:95[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;                              ; fclose.c:95[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	       nop	3               ; fclose.c:95[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
.BB5_14:                                ; %bb14.i.i.i
                                        ;   in Loop: Header=BB5_4 Depth=2
#0:	       stm.a	0, r13, 12      ; fclose.c:95[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
.BB5_15:                                ; %bb15.i.i.i
                                        ;   in Loop: Header=BB5_4 Depth=2
#0:	       ldm.f	r13, 68         ; fclose.c:96[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; fclose.c:96[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	       cmpeq	r1, 0 -> c1     ; fclose.c:96[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	if  c1 br	.BB5_17
	;;
	       nop	2
	;;
; BB#16:                                ; %bb16.i.i.i
                                        ;   in Loop: Header=BB5_4 Depth=2
#0:	       ldga	_impure_data -> r0 ; fclose.c:77[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
#1:	       callg	__free_r        ; fclose.c:97[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;                              ; fclose.c:97[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	       nop	3               ; fclose.c:97[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	       stm.a	0, r13, 17      ; fclose.c:97[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
.BB5_17:                                ; %bb17.i.i.i
                                        ;   in Loop: Header=BB5_4 Depth=2
#0:	       stmh.a	0, r13, 6       ; fclose.c:99[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
.BB5_18:                                ; %bb5.i
                                        ;   in Loop: Header=BB5_4 Depth=2
#0:	       sub	r12, 1 -> r12
#1:	       s2add	r13, 26 -> r13
	;;
#0:	       cmpne	r12, 0 -> c1    ; fwalk.c:48[ findfp.c:165 ]
	;;
#0:	if  c1 br	.BB5_4
	;;
	       nop	2
	;;
.BB5_19:                                ; %bb7.i
                                        ;   in Loop: Header=BB5_2 Depth=1
#0:	       ldm.f	r10, 0          ; fwalk.c:47[ findfp.c:165 ]
	;;
#0:	       ldx	$mem, 0 -> r10  ; fwalk.c:47[ findfp.c:165 ]
	;;
#0:	       cmpne	r10, 0 -> c1    ; fwalk.c:47[ findfp.c:165 ]
	;;
#0:	if  c1 br	.BB5_2
	;;
	       nop	2
	;;
.BB5_20:                                ; %_fwalk.exit
#0:	       ldm.s	r14, 16         ; findfp.c:167
#1:	       or	r14, 0 -> r15   ; findfp.c:167
	;;
#2:	       ldx	$mem, 0 -> r2.23 ; findfp.c:167
#0:	       ldm.s	r14, 20         ; findfp.c:167
	;;
#0:	       ldx	$mem, 0 -> r13  ; findfp.c:167
#1:	       ldm.s	r14, 24         ; findfp.c:167
	;;
#0:	       ldx	$mem, 0 -> r12  ; findfp.c:167
#1:	       ldm.s	r14, 28         ; findfp.c:167
	;;
#0:	       ldx	$mem, 0 -> r11  ; findfp.c:167
#1:	       ldm.s	r14, 32         ; findfp.c:167
	;;
#0:	       ldx	$mem, 0 -> r10  ; findfp.c:167
#1:	       ldm.s	r15, 8          ; findfp.c:167
	;;
#3:	       ldx	$mem, 0 -> r3.31 ; findfp.c:167
#0:	       ldm.s	r15, 4          ; findfp.c:167
	;;
#3:	       stx	r3.31 -> $ro    ; findfp.c:167
	;;
#0:	       ldx	$mem, 0 -> r0.31 ; findfp.c:167
#1:	       ldm.s	r15, 0          ; findfp.c:167
#2:	       s2add	r15, 9 -> r15   ; findfp.c:167
	;;
#0:	       stx	r0.31 -> $rb    ; findfp.c:167
	;;
#0:	       ret                      ; findfp.c:167
#1:	       ldx	$mem, 0 -> r14  ; findfp.c:167
	;;                              ; findfp.c:167
	       nop	3               ; findfp.c:167
	;;
	.align	4
__cleanup_r_end:

	.align	4
___sinit:                               ; @__sinit
	.size	___sinit_end-___sinit
___sinit_start:
; BB#0:                                 ; %entry
#0:	       wb.s	r15, 7          ; findfp.c:187
#2:	       ldiu	28 -> r2        ; findfp.c:187
#1:	       ldx	$rb, 0 -> r1.31 ; findfp.c:187
	;;
#0:	       sub	r15, r2 -> r15  ; findfp.c:187
#2:	       ldx	$ro, 0 -> r2.31 ; findfp.c:187
	;;
#0:	       stm.s	r14, r15, 0     ; findfp.c:187
#1:	       or	r15, 0 -> r14   ; findfp.c:187
	;;
#1:	       stm.s	r1.31, r15, 1   ; findfp.c:187
	;;
#2:	       stm.s	r2.31, r15, 2   ; findfp.c:187
	;;
#0:	       stm.s	r10, r14, 6     ; findfp.c:187
	;;
#0:	       stm.s	r11, r14, 5     ; findfp.c:187
	;;
#0:	       stm.s	r12, r14, 4     ; findfp.c:187
	;;
#0:	       ldm.f	r0, 56          ; findfp.c:187
	;;
#0:	       ldx	$mem, 0 -> r1   ; findfp.c:187
	;;
#0:	       cmpeq	r1, 0 -> c1     ; findfp.c:187
	;;
#0:	if  c1 br	.BB6_3          ; findfp.c:187
	;;                              ; findfp.c:187
	       nop	2               ; findfp.c:187
	;;
; BB#1:                                 ; %bb
#0:	       ldm.s	r14, 16         ; findfp.c:227
#1:	       or	r14, 0 -> r15   ; findfp.c:227
	;;
#0:	       ldx	$mem, 0 -> r12  ; findfp.c:227
#1:	       ldm.s	r14, 20         ; findfp.c:227
	;;
#0:	       ldx	$mem, 0 -> r11  ; findfp.c:227
#1:	       ldm.s	r14, 24         ; findfp.c:227
	;;
#0:	       ldx	$mem, 0 -> r10  ; findfp.c:227
#1:	       ldm.s	r15, 8          ; findfp.c:227
	;;
#3:	       ldx	$mem, 0 -> r3.31 ; findfp.c:227
#0:	       ldm.s	r15, 4          ; findfp.c:227
	;;
#3:	       stx	r3.31 -> $ro    ; findfp.c:227
	;;
#0:	       ldx	$mem, 0 -> r0.31 ; findfp.c:227
	;;
#0:	       stx	r0.31 -> $rb    ; findfp.c:227
	;;
.BB6_2:                                 ; %bb
#0:	       ldm.s	r15, 0          ; findfp.c:227
#1:	       s2add	r15, 7 -> r15   ; findfp.c:227
	;;
#0:	       ret                      ; findfp.c:227
#1:	       ldx	$mem, 0 -> r14  ; findfp.c:227
	;;                              ; findfp.c:227
	       nop	3               ; findfp.c:227
	;;
.BB6_3:                                 ; %bb1
#0:	       or	r0, 0 -> r10
#1:	       ldi	736 -> r0
#2:	       ldi	740 -> r1
#3:	       ldi	748 -> r2
	;;
#0:	       ldm.f	r10, 4          ; findfp.c:209
#1:	       add	r10, r0 -> r0
#2:	       add	r10, r1 -> r1
#3:	       ldi	744 -> r3
	;;
#1:	       add	r10, r2 -> r2
#2:	       add	r10, r3 -> r3
#0:	       ldga	__cleanup_r -> r0.16 ; findfp.c:194
	;;
#0:	       ldx	$mem, 0 -> r11  ; findfp.c:209
#1:	       stm.a	0, r0, 0        ; findfp.c:197
	;;
#0:	       s2add	r11, 23 -> r0
	;;
#0:	       stm.a	3, r1, 0        ; findfp.c:199
	;;
#0:	       stm.a	r2, r3, 0       ; findfp.c:200
	;;
#0:	       stm.a	r0.16, r10, 15  ; findfp.c:194
	;;
#0:	       stm.a	1, r10, 14      ; findfp.c:195
	;;
#0:	       stm.a	0, r11, 4
	;;
#0:	       stmh.a	0, r11, 7
	;;
#0:	       stm.a	0, r11, 25
	;;
#0:	       stmh.a	4, r11, 6
	;;
#0:	       stm.a	0, r11, 2
	;;
#0:	       stm.a	0, r11, 0
	;;
#0:	       stm.a	0, r11, 1
	;;
#0:	       stm.a	0, r11, 5
	;;
#0:	       stm.a	0, r11, 6
	;;
#0:	       callg	_memset
	;;
	       nop	3
	;;
#0:	       ldga	___sclose -> r0
#1:	       ldga	___sseek -> r1
#2:	       ldga	___swrite -> r2
#3:	       ldga	___sread -> r3
	;;
#0:	       stm.a	r0, r11, 11
	;;
#0:	       stm.a	r1, r11, 10
	;;
#0:	       stm.a	r2, r11, 9
	;;
#0:	       stm.a	r11, r11, 7
	;;
#0:	       stm.a	r3, r11, 8
#1:	       ldi	18 -> r11
	;;
#0:	       ldm.f	r10, 8          ; findfp.c:220
	;;
#0:	       ldx	$mem, 0 -> r12  ; findfp.c:220
	;;
#0:	       stm.a	0, r12, 4
#1:	       s2add	r12, 23 -> r0
	;;
#0:	       stmh.a	1, r12, 7
	;;
#0:	       stm.a	0, r12, 25
	;;
#0:	       stmh.a	9, r12, 6
	;;
#0:	       stm.a	0, r12, 2
	;;
#0:	       stm.a	0, r12, 0
	;;
#0:	       stm.a	0, r12, 1
	;;
#0:	       stm.a	0, r12, 5
	;;
#0:	       stm.a	0, r12, 6
	;;
#0:	       callg	_memset
	;;
	       nop	3
	;;
#0:	       ldga	___sclose -> r0
#1:	       ldga	___sseek -> r1
#2:	       ldga	___swrite -> r2
#3:	       ldga	___sread -> r3
	;;
#0:	       stm.a	r0, r12, 11
	;;
#0:	       stm.a	r1, r12, 10
	;;
#0:	       stm.a	r2, r12, 9
	;;
#0:	       stm.a	r12, r12, 7
	;;
#0:	       stm.a	r3, r12, 8
	;;
#0:	       ldm.f	r10, 12         ; findfp.c:225
	;;
#0:	       ldx	$mem, 0 -> r10  ; findfp.c:225
	;;
#0:	       stm.a	0, r10, 4
#1:	       s2add	r10, 23 -> r0
	;;
#0:	       stmh.a	2, r10, 7
	;;
#0:	       stm.a	0, r10, 25
	;;
#0:	       stmh.a	r11, r10, 6
	;;
#0:	       stm.a	0, r10, 2
	;;
#0:	       stm.a	0, r10, 0
	;;
#0:	       stm.a	0, r10, 1
	;;
#0:	       stm.a	0, r10, 5
	;;
#0:	       stm.a	0, r10, 6
	;;
#0:	       callg	_memset
	;;
	       nop	3
	;;
#0:	       ldga	___sclose -> r0
#1:	       ldga	___sseek -> r1
#2:	       ldga	___swrite -> r2
#3:	       ldga	___sread -> r3
	;;
#0:	       stm.a	r0, r10, 11
#1:	       or	r14, 0 -> r15   ; findfp.c:227
	;;
#0:	       stm.a	r1, r10, 10
	;;
#0:	       stm.a	r2, r10, 9
	;;
#0:	       stm.a	r10, r10, 7
	;;
#0:	       stm.a	r3, r10, 8
	;;
#0:	       ldm.s	r14, 16         ; findfp.c:227
	;;
#0:	       ldx	$mem, 0 -> r12  ; findfp.c:227
#1:	       ldm.s	r14, 20         ; findfp.c:227
	;;
#0:	       ldx	$mem, 0 -> r11  ; findfp.c:227
#1:	       ldm.s	r14, 24         ; findfp.c:227
	;;
#0:	       ldx	$mem, 0 -> r10  ; findfp.c:227
#1:	       ldm.s	r15, 8          ; findfp.c:227
	;;
#0:	       br	.BB6_2
#1:	       ldx	$mem, 0 -> r1.31 ; findfp.c:227
#2:	       ldm.s	r15, 4          ; findfp.c:227
	;;
#1:	       stx	r1.31 -> $ro    ; findfp.c:227
	;;
#2:	       ldx	$mem, 0 -> r2.31 ; findfp.c:227
	;;
#2:	       stx	r2.31 -> $rb    ; findfp.c:227
	;;
	.align	4
___sinit_end:

	.align	4
___sread:                               ; @__sread
	.size	___sread_end-___sread
___sread_start:
; BB#0:                                 ; %entry
#1:	       wb.s	r15, 1
#2:	       add	r1, 14 -> r4
#3:	       ldiu	4 -> r5
#0:	       ldga	_errno.b -> r0.16
	;;
#0:	       sub	r15, r5 -> r15
	;;
#0:	       ldm.f	r1, 14          ; stdio.c:48
	;;
#1:	       ldx	$memhu, r4 -> r4 ; stdio.c:48
#0:	       stmb.a	0, r0.16, 0
	;;
#0:	       cmpne	r4, 0 -> c1
	;;
#0:	if  c1 br	.BB7_9
	;;
	       nop	2
	;;
; BB#1:                                 ; %bb3.preheader.i.i
#0:	       cmplt	r3, 1 -> c1
	;;
#0:	if  c1 br	.BB7_6
	;;
	       nop	2
	;;
; BB#2:                                 ; %bb3.preheader.i.i.bb1.preheader.i.i_crit_edge
#0:	       ldi	-8 -> r0.16
#1:	       ldi	-4 -> r0
#2:	       or	r3, 0 -> r4
	;;
.BB7_3:                                 ; %bb3.preheader.i.i.bb1.preheader.i.i_crit_edge
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB7_4 Depth 2
#0:	       or	r2, 0 -> r5
	;;
.BB7_4:                                 ; %bb1.i.i
                                        ;   Parent Loop BB7_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.b	r0.16, 0
	;;
#0:	       ldx	$membu, r0.16 -> r2
	;;
#0:	       btest	r2, 1 -> c1
	;;
#0:	if !c1 br	.BB7_4
	;;
	       nop	2
	;;
; BB#5:                                 ; %bb2.i.i
                                        ;   in Loop: Header=BB7_3 Depth=1
#0:	       sub	r4, 1 -> r4
#1:	       ldm.b	r0, 0
#2:	       add	r5, 1 -> r2
	;;
#0:	       cmpeq	r4, 0 -> c1
	;;
#0:	if !c1 br	.BB7_3
#1:	       ldx	$membu, r0 -> r6
	;;
#0:	       stmb.a	r6, r5, 0
	;;
	       nop	1
	;;
.BB7_6:                                 ; %_read.exit.i
#0:	       ldi	-1 -> r0
	;;
#0:	       cmplt	r0, r3 -> c1
	;;
#0:	if !c1 br	.BB7_10
	;;
	       nop	2
	;;
; BB#7:                                 ; %bb
#0:	       ldm.f	r1, 80          ; stdio.c:58
	;;
#0:	       ldx	$mem, 0 -> r0   ; stdio.c:58
	;;
#0:	       add	r0, r3 -> r0    ; stdio.c:58
	;;
#0:	       stm.a	r0, r1, 20      ; stdio.c:58
	;;
.BB7_8:                                 ; %bb
#0:	       or	r3, 0 -> r0     ; stdio.c:61
#1:	       ret                      ; stdio.c:61
#2:	       s2add	r15, 1 -> r15   ; stdio.c:61
	;;                              ; stdio.c:61
	       nop	3               ; stdio.c:61
	;;
.BB7_9:                                 ; %bb1.i
#0:	       stmb.a	1, r0.16, 0
#1:	       ldi	88 -> r2
#2:	       ldi	-1 -> r3
	;;
#0:	       stm.a	r2, r0, 0       ; readr.c:59[ stdio.c:48 ]
	;;
.BB7_10:                                ; %bb1
#0:	       ldm.f	r1, 12          ; stdio.c:60
#1:	       add	r1, 12 -> r0
#2:	       ldiu	2047 -> r2
	;;
#0:	       br	.BB7_8
#1:	       ldim	29 -> r2
	;;
#0:	       ldx	$memhu, r0 -> r0 ; stdio.c:60
	;;
#0:	       and	r0, r2 -> r0    ; stdio.c:60
	;;
#0:	       stmh.a	r0, r1, 6       ; stdio.c:60
	;;
	.align	4
___sread_end:

	.align	4
___sclose:                              ; @__sclose
	.size	___sclose_end-___sclose
___sclose_start:
; BB#0:                                 ; %entry
#0:	       wb.s	r15, 1
#1:	       add	r1, 14 -> r2
#2:	       ldiu	4 -> r3
	;;
#0:	       sub	r15, r3 -> r15
	;;
#0:	       s2add	r15, 1 -> r15   ; stdio.c:135
	;;
#0:	       ldm.f	r1, 14          ; stdio.c:135
	;;
#0:	       ret                      ; stdio.c:135
#1:	       ldx	$memhu, r2 -> r1 ; stdio.c:135
#2:	       ldga	_errno.b -> r2
	;;
#0:	       stmb.a	0, r2, 0
#1:	       cmpult	r1, 3 -> c1
	;;
#0:	if  c1 ldi	0 -> r0
#1:	if !c1 ldi	88 -> r1
	;;
#0:	if !c1 stmb.a	1, r2, 0
	;;
#0:	if !c1 stm.a	r1, r0, 0       ; closer.c:54[ stdio.c:135 ]
#1:	if !c1 ldi	-1 -> r0
	;;
	.align	4
___sclose_end:

	.align	4
___sseek:                               ; @__sseek
	.size	___sseek_end-___sseek
___sseek_start:
; BB#0:                                 ; %bb
#0:	       wb.s	r15, 1
#1:	       ldi	88 -> r2
#2:	       add	r1, 12 -> r3
#3:	       ldiu	4 -> r4
	;;
#0:	       sub	r15, r4 -> r15
	;;
#0:	       s2add	r15, 1 -> r15   ; stdio.c:125
	;;
#0:	       stm.a	r2, r0, 0       ; lseekr.c:59[ stdio.c:117 ]
#1:	       ldga	_errno.b -> r2
#2:	       ldiu	2047 -> r0
	;;
#0:	       ldim	29 -> r0
	;;
#0:	       ldm.f	r1, 12          ; stdio.c:119
	;;
#0:	       ldx	$memhu, r3 -> r3 ; stdio.c:119
#1:	       stmb.a	1, r2, 0
	;;
#0:	       ret                      ; stdio.c:125
#1:	       and	r3, r0 -> r2    ; stdio.c:119
#2:	       ldi	-1 -> r0
	;;
#0:	       stmh.a	r2, r1, 6       ; stdio.c:119
	;;                              ; stdio.c:125
	       nop	2               ; stdio.c:125
	;;
	.align	4
___sseek_end:

	.align	4
___swrite:                              ; @__swrite
	.size	___swrite_end-___swrite
___swrite_start:
; BB#0:                                 ; %entry
#0:	       wb.s	r15, 1
#1:	       add	r1, 12 -> r4
#2:	       ldiu	4 -> r5
	;;
#0:	       sub	r15, r5 -> r15
	;;
#0:	       ldm.f	r1, 12          ; stdio.c:88
	;;
#0:	       ldx	$memhu, r4 -> r4 ; stdio.c:88
	;;
#0:	       btest	r4, 8 -> c1     ; stdio.c:88
	;;
#0:	if !c1 br	.BB10_2
	;;
	       nop	2
	;;
; BB#1:                                 ; %_lseek_r.exit
#0:	       ldga	_errno.b -> r0.16
#1:	       ldi	88 -> r4
	;;
#0:	       stmb.a	1, r0.16, 0
	;;
#0:	       stm.a	r4, r0, 0       ; lseekr.c:59[ stdio.c:89 ]
#1:	       add	r1, 12 -> r4
	;;
#0:	       ldm.f	r1, 12
	;;
#0:	       ldx	$memhu, r4 -> r4
	;;
.BB10_2:                                ; %bb1
#0:	       ldm.f	r1, 14          ; stdio.c:97
#1:	       add	r1, 14 -> r6
#2:	       ldiu	2047 -> r5
	;;
#2:	       ldga	_errno.b -> r2.16
#0:	       ldim	29 -> r5
	;;
#0:	       ldx	$memhs, r6 -> r6 ; stdio.c:97
#2:	       stmb.a	0, r2.16, 0
#1:	       and	r4, r5 -> r4    ; stdio.c:90
#3:	       ldi	1 -> r5
	;;
#0:	       sub	r6, 1 -> r6
	;;
#0:	       cmpult	r5, r6 -> c1
	;;
#0:	       stmh.a	r4, r1, 6       ; stdio.c:90
#1:	if  c1 ldi	88 -> r1
#2:	if  c1 s2add	r15, 1 -> r15   ; stdio.c:104
	;;
#2:	if  c1 stmb.a	1, r2.16, 0
	;;
#0:	if  c1 stm.a	r1, r0, 0       ; writer.c:59[ stdio.c:97 ]
#1:	if  c1 ldi	-1 -> r0
	;;
#0:	if  c1 ret                      ; stdio.c:104
	;;                              ; stdio.c:104
	       nop	3               ; stdio.c:104
	;;
; BB#3:                                 ; %bb3.preheader.i.i
#0:	       cmplt	r3, 1 -> c1
	;;
#0:	if  c1 ret                      ; stdio.c:104
#1:	if  c1 or	r3, 0 -> r0     ; stdio.c:104
#2:	if  c1 s2add	r15, 1 -> r15   ; stdio.c:104
	;;                              ; stdio.c:104
	       nop	3               ; stdio.c:104
	;;
; BB#4:                                 ; %bb3.preheader.i.i.bb1.preheader.i.i_crit_edge
#0:	       ldi	-8 -> r0
#1:	       ldi	-4 -> r1
#2:	       or	r3, 0 -> r4
	;;
.BB10_5:                                ; %bb1.i.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.b	r0, 0
	;;
#0:	       ldx	$membu, r0 -> r5
	;;
#0:	       btest	r5, 0 -> c1
	;;
#0:	if !c1 br	.BB10_5
	;;
	       nop	2
	;;
; BB#6:                                 ; %bb2.i.i
                                        ;   in Loop: Header=BB10_5 Depth=1
#0:	       sub	r4, 1 -> r4
#1:	       ldm.f	r2, 0
	;;
#0:	       cmpeq	r4, 0 -> c1
	;;
#0:	if !c1 br	.BB10_5
#1:	       ldx	$membu, r2 -> r5
#2:	       add	r2, 1 -> r2
	;;
#0:	       stmb.a	r5, r1, 0
	;;
	       nop	1
	;;
.BB10_7:                                ; %_write.exit.i
#0:	       or	r3, 0 -> r0     ; stdio.c:104
#1:	       ret                      ; stdio.c:104
#2:	       s2add	r15, 1 -> r15   ; stdio.c:104
	;;                              ; stdio.c:104
	       nop	3               ; stdio.c:104
	;;
.BB10_8:                                ; %bb1.i2
	.align	4
___swrite_end:

	.align	4
_memset:                                ; @memset
	.size	_memset_end-_memset
_memset_start:
; BB#0:                                 ; %entry
#0:	       ldiu	4 -> r3
#1:	       wb.s	r15, 1
#2:	       ldi	8 -> r1
#3:	       or	r0, 0 -> r2
	;;
#0:	       br	.BB11_3
#1:	       sub	r15, r3 -> r15
	;;
	       nop	2
	;;
.BB11_1:                                ; %bb
                                        ;   in Loop: Header=BB11_3 Depth=1
#0:	       cmpeq	r1, 0 -> c1     ; memset.c:59
	;;
#0:	if  c1 br	.BB11_14
	;;
	       nop	2
	;;
; BB#2:                                 ; %bb1
                                        ;   in Loop: Header=BB11_3 Depth=1
#0:	       add	r2, 1 -> r3
#1:	       stmb.a	0, r2, 0        ; memset.c:60
#2:	       sub	r1, 1 -> r1
	;;
#0:	       or	r3, 0 -> r2
	;;
.BB11_3:                                ; %bb3
                                        ; =>This Inner Loop Header: Depth=1
#0:	       and	r2, 3 -> r3     ; memset.c:57
	;;
#0:	       cmpne	r3, 0 -> c1     ; memset.c:57
	;;
#0:	if  c1 br	.BB11_1         ; memset.c:57
	;;                              ; memset.c:57
	       nop	2               ; memset.c:57
	;;
; BB#4:                                 ; %bb4
#0:	       ldi	3 -> r3
	;;
#0:	       cmpult	r3, r1 -> c1    ; memset.c:65
	;;
#0:	if !c1 br	.BB11_12
	;;
	       nop	2
	;;
; BB#5:                                 ; %bb5
#0:	       ldi	15 -> r3
	;;
#0:	       cmpult	r3, r1 -> c1    ; memset.c:78
	;;
#0:	if !c1 br	.BB11_10
	;;
	       nop	2
	;;
.BB11_6:                                ; %bb8
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sub	r1, 16 -> r4
#1:	       sub	r0, r1 -> r1
	;;
#0:	       stm.a	0, r1, 5        ; memset.c:83
#1:	       cmpult	r3, r4 -> c1    ; memset.c:78
	;;
#0:	if  c1 br	.BB11_6         ; memset.c:78
#1:	       stm.a	0, r1, 4        ; memset.c:82
	;;
#0:	       stm.a	0, r1, 2        ; memset.c:80
	;;
#0:	       stm.a	0, r1, 3        ; memset.c:81
#1:	       or	r4, 0 -> r1
	;;                              ; memset.c:78
	       nop	0               ; memset.c:78
	;;
; BB#7:                                 ; %bb11.preheader
#0:	       sub	r0, r4 -> r1
	;;
#0:	       add	r1, 8 -> r2
#1:	       ldi	3 -> r1
	;;
#0:	       cmpult	r1, r4 -> c1    ; memset.c:87
	;;
#0:	if  c1 br	.BB11_9         ; memset.c:87
	;;                              ; memset.c:87
	       nop	2               ; memset.c:87
	;;
; BB#8:                                 ; %bb11.preheader.bb12_crit_edge
#0:	       or	r4, 0 -> r1
#1:	       br	.BB11_12
	;;
	       nop	2
	;;
.BB11_9:                                ; %bb11.preheader.bb10_crit_edge
#0:	       or	r4, 0 -> r1
	;;
.BB11_10:                               ; %bb10
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sub	r1, 4 -> r1
#1:	       ldi	3 -> r3
#2:	       add	r2, 4 -> r0
#3:	       stm.a	0, r2, 0        ; memset.c:89
	;;
#0:	       cmpult	r3, r1 -> c1    ; memset.c:87
#1:	       or	r0, 0 -> r2
	;;
#0:	if  c1 br	.BB11_10        ; memset.c:87
	;;                              ; memset.c:87
	       nop	2               ; memset.c:87
	;;
; BB#11:                                ; %bb10.bb12_crit_edge
#0:	       or	r0, 0 -> r2
	;;
.BB11_12:                               ; %bb14.preheader
#0:	       cmpeq	r1, 0 -> c1
	;;
#0:	if  c1 ret
#1:	if  c1 s2add	r15, 1 -> r15
	;;
	       nop	3
	;;
.BB11_13:                               ; %bb13
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sub	r1, 1 -> r1
#1:	       add	r2, 1 -> r0
#2:	       stmb.a	0, r2, 0        ; memset.c:99
	;;
#0:	       cmpne	r1, 0 -> c1     ; memset.c:98
#1:	       or	r0, 0 -> r2
	;;
#0:	if  c1 br	.BB11_13        ; memset.c:98
	;;                              ; memset.c:98
	       nop	2               ; memset.c:98
	;;
.BB11_14:                               ; %bb16
#0:	       s2add	r15, 1 -> r15
#1:	       ret
	;;
	       nop	3
	;;
	.align	4
_memset_end:

	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	4                       ; @.str
._.str:
	.ascii	 "Hello, World!\000"

	.align	4                       ; @.str1
._.str1:
	.ascii	 "\n\000"

	.align	4                       ; @.str5
._.str5:
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
	.long	._.str5
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
	.local	_errno.b                ; @errno.b
                                        ; @errno.b
	.comm	_errno.b,1,1
	.local	_heap_end.1081          ; @heap_end.1081
                                        ; @heap_end.1081
	.comm	_heap_end.1081,4,4
