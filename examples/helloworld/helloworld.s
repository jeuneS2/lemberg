	.file	"helloworld.opt.bc"
                                        ; Start of file scope inline assembly
.stabs "_lseek is not implemented and will always fail",30,0,0,0
.stabs "_lseek",1,0,0,0

.stabs "_fstat is not implemented and will always fail",30,0,0,0
.stabs "_fstat",1,0,0,0

.stabs "_kill is not implemented and will always fail",30,0,0,0
.stabs "_kill",1,0,0,0

.stabs "_getpid is not implemented and will always fail",30,0,0,0
.stabs "_getpid",1,0,0,0

                                        ; End of file scope inline assembly
	.text
	.globl	_main
	.align	4
_main:                                  ; @main
	.size	_main_end-_main
_main_start:
; BB#0:                                 ; %entry
#0:	       ldiu	136 -> r2
#1:	       wb.s	r15, 34
#2:	       ldi	0 -> r0
#3:	       ldga	._.str -> r1
	;;
#0:	       sub	r15, r2 -> r15
#1:	       ldx	$rb, 0 -> r2
	;;
#0:	       stm.s	r10, r15, 29
	;;
#0:	       stm.s	r11, r15, 28
	;;
#0:	       stm.s	r12, r15, 27
	;;
#0:	       stm.s	r13, r15, 26
	;;
#0:	       stm.s	r14, r15, 25
	;;
#1:	       stm.s	r1.23, r15, 24
	;;
#0:	       br	.BB0_3
#3:	       stm.s	r3.23, r15, 23
	;;
#0:	       stm.s	r2, r15, 22
#1:	       ldx	$ro, 0 -> r2
	;;
#0:	       stm.s	r2, r15, 21
	;;
.BB0_1:                                 ; %bb.i1.i
                                        ;   in Loop: Header=BB0_3 Depth=1
#0:	       cmpeq	r0, 13 -> c1
#1:	       ldi	13 -> r2
	;;
#0:	if  c1 br @	.BB0_9
	;;
.BB0_2:                                 ; %bb2.i.i
                                        ;   in Loop: Header=BB0_3 Depth=1
#0:	       add	r0, 1 -> r0
	;;
.BB0_3:                                 ; %bb3.i.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       add	r1, r0 -> r2
	;;
#0:	       and	r2, 3 -> r2
	;;
#0:	       brz ne @	r2, .BB0_1
	;;
.BB0_4:                                 ; %bb4.i.i
#0:	       ldga	._.str -> r2
#1:	       ldga	32896 -> r3
	;;
#0:	       add	r2, r0 -> r2
#1:	       ldiu	1791 -> r0
#2:	       ldih	1028 -> r3
	;;
#0:	       ldm.f	r2, 0
#1:	       ldim	991 -> r0
	;;
#0:	       ldx	$mem, 0 -> r1
#1:	       ldih	2039 -> r0
	;;
#0:	       and	r1, r3 -> r4
#1:	       add	r1, r0 -> r1
	;;
#0:	       xor	r4, r3 -> r4
	;;
#0:	       and	r4, r1 -> r1
	;;
#0:	       brz ne @	r1, .BB0_6
	;;
.BB0_5:                                 ; %bb5.i.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r2, 4
#1:	       add	r2, 4 -> r2
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       and	r1, r3 -> r4
#1:	       add	r1, r0 -> r1
	;;
#0:	       xor	r4, r3 -> r4
	;;
#0:	       and	r4, r1 -> r1
	;;
#0:	       brz eq @	r1, .BB0_5
	;;
.BB0_6:                                 ; %bb8.i.i
#0:	       ldm.f	r2, 0
#1:	       or	r2, 0 -> r1
	;;
#0:	       ldx	$membu, r2 -> r0
	;;
#0:	       brz eq @	r0, .BB0_8
	;;
.BB0_7:                                 ; %bb9.i.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       add	r2, 1 -> r1
#1:	       ldm.f	r2, 1
	;;
#0:	       or	r1, 0 -> r2
	;;
#0:	       ldx	$membu, r1 -> r0
	;;
#0:	       brz ne @	r0, .BB0_7
	;;
.BB0_8:                                 ; %bb11.i.i
#0:	       ldga	._.str -> r2
	;;
#0:	       sub	r1, r2 -> r2
	;;
.BB0_9:                                 ; %strlen.exit.i
#0:	       s2add	r15, 16 -> r3
#1:	       ldga	._.str -> r0
	;;
#0:	       add	r3, 0 -> r10
	;;
#0:	       or	r10, 4 -> r1
	;;
#0:	       stm.s	r1, r15, 14
	;;
#0:	       stm.a	r0, r15, 16
#1:	       ldga	._.str5 -> r0
	;;
#0:	       stm.a	r2, r1, 0
	;;
#0:	       stm.a	r0, r15, 18
	;;
#0:	       stm.a	1, r15, 19
	;;
#0:	       ldmg.d	_impure_data+8
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       stm.s	r0, r15, 15
#1:	       add	r0, 12 -> r1
	;;
#0:	       ldm.f	r0, 12
	;;
#0:	       ldx	$memhu, r1 -> r0
	;;
#0:	       btest	r0, 13 -> c1
	;;
#0:	if  c1 br @	.BB0_11
	;;
.BB0_10:                                ; %bb.i.i
#0:	       ldm.s	r15, 60
#1:	       ldga	8192 -> r1
	;;
#0:	       or	r0, r1 -> r0
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       stmh.a	r0, r1, 6
#1:	       ldiu	2047 -> r1
	;;
#0:	       ldmg.d	_impure_data+8
#1:	       ldim	2043 -> r1
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       ldm.f	r0, 100
	;;
#0:	       ldx	$mem, 0 -> r3
	;;
#0:	       and	r3, r1 -> r1
	;;
#0:	       stm.a	r1, r0, 25
	;;
#0:	       ldmg.d	_impure_data+8
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       stm.s	r0, r15, 15
	;;
.BB0_11:                                ; %_puts_r.exit.i
#0:	       add	r2, 1 -> r0
	;;
#0:	       cmpeq	r0, 0 -> c3
#1:	       stm.s	r0, r15, 10
	;;
#0:	if  c3 br @	.BB0_178
	;;
.BB0_12:                                ; %bb1.i2.i
#0:	       ldm.s	r15, 60
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       add	r0, 12 -> r1
	;;
#0:	       stm.s	r1, r15, 4
	;;
#0:	       ldm.f	r0, 12
	;;
#0:	       ldx	$memhu, r1 -> r1
	;;
#0:	       btest	r1, 3 -> c1
	;;
#0:	if !c1 br @	.BB0_14
	;;
.BB0_13:                                ; %bb2.i3.i
#0:	       ldm.f	r0, 16
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       cmpne	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB0_41
	;;
.BB0_14:                                ; %bb3.i4.i
#0:	       ldmg.d	_impure_data+56
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       brz ne @	r0, .BB0_16
	;;
.BB0_15:                                ; %bb1.i.i.i
#0:	       callg	___sinit
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldm.s	r15, 60
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       ldm.f	r1, 12
#1:	       ldiu	lo11{ ___mem_emergency } -> r1
	;;
#1:	       ldx	$mem, 0 -> r1.31
	;;
#1:	       stm.a	r1.31, r1, 0
	;;
#0:	       ldm.s	r15, 16
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       ldmg.d	___mem_emergency
	;;
#0:	       ldx	$memhu, r1 -> r1
	;;
.BB0_16:                                ; %bb2.i.i.i
#0:	       btest	r1, 3 -> c1
	;;
#0:	if  c1 br @	.BB0_25
	;;
.BB0_17:                                ; %bb3.i.i.i
#0:	       bbh	zext16 r1 -> r0
	;;
#0:	       btest	r0, 4 -> c1
	;;
#0:	if !c1 br @	.BB0_40
	;;
.BB0_18:                                ; %bb5.i.i.i
#0:	       btest	r0, 2 -> c1
	;;
#0:	if !c1 br @	.BB0_24
	;;
.BB0_19:                                ; %bb6.i.i.i
#0:	       ldm.s	r15, 60
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       ldm.f	r0, 48
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       brz eq @	r0, .BB0_23
	;;
.BB0_20:                                ; %bb7.i.i.i
#0:	       ldm.s	r15, 60
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       s2add	r2, 16 -> r2
	;;
#0:	       cmpeq	r0, r2 -> c1
	;;
#0:	if  c1 br @	.BB0_22
	;;
.BB0_21:                                ; %bb8.i.i.i
#0:	       callg	__free_r
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldm.s	r15, 60
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       ldm.f	r1, 12
#1:	       ldiu	lo11{ ___mem_emergency } -> r1
	;;
#2:	       ldx	$mem, 0 -> r2.31
	;;
#2:	       stm.a	r2.31, r1, 0
	;;
#0:	       ldm.s	r15, 16
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       ldmg.d	___mem_emergency
	;;
#0:	       ldx	$memhu, r1 -> r1
	;;
.BB0_22:                                ; %bb9.i.i.i
#0:	       ldm.s	r15, 60
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       stm.a	0, r0, 12
	;;
.BB0_23:                                ; %bb10.i.i.i
#0:	       ldiu	2011 -> r0
#1:	       ldm.s	r15, 60
	;;
#0:	       ldim	31 -> r0
	;;
#0:	       and	r1, r0 -> r1
#1:	       ldx	$mem, 0 -> r0
	;;
#0:	       stmh.a	r1, r0, 6
	;;
#0:	       stm.a	0, r0, 1
	;;
#0:	       ldm.f	r0, 16
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       stm.a	r2, r0, 0
	;;
.BB0_24:                                ; %bb11.i.i.i
#0:	       ldm.s	r15, 60
#1:	       or	r1, 8 -> r1
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       stmh.a	r1, r0, 6
	;;
.BB0_25:                                ; %bb12.i.i.i
#0:	       ldm.s	r15, 60
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       ldm.f	r0, 16
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       brz ne @	r0, .BB0_35
	;;
.BB0_26:                                ; %bb13.i.i.i
#0:	       ldi	640 -> r0
#1:	       ldi	512 -> r2
	;;
#0:	       and	r1, r0 -> r0
	;;
#0:	       cmpeq	r0, r2 -> c1
	;;
#0:	if  c1 br @	.BB0_35
	;;
.BB0_27:                                ; %bb15.i.i.i
#0:	       bbh	zext16 r1 -> r0
	;;
#0:	       btest	r0, 1 -> c1
	;;
#0:	if !c1 br @	.BB0_29
	;;
.BB0_28:                                ; %bb.i.i.i.i
#0:	       ldm.s	r15, 60
#1:	       ldi	67 -> r0
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       add	r2, r0 -> r0
	;;
#0:	       br	.BB0_35
#1:	       stm.a	r0, r2, 0
	;;
#0:	       stm.a	r0, r2, 4
	;;
#0:	       stm.a	1, r2, 5
	;;
.BB0_29:                                ; %bb1.i.i.i.i
#0:	       ldm.s	r15, 60
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       ldm.f	r0, 14
#1:	       add	r0, 14 -> r2
	;;
#0:	       ldx	$memhs, r2 -> r0
	;;
#0:	       cmplt	r0, 0 -> c1
	;;
#0:	if  c1 br @	.BB0_31
	;;
.BB0_30:                                ; %_fstat_r.exit.i.i.i.i
#0:	       ldi	88 -> r1
#1:	       ldga	_impure_data -> r0
	;;
#0:	       stm.a	r1, r0, 0
	;;
#0:	       ldm.s	r15, 60
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       ldm.f	r1, 12
#1:	       ldiu	lo11{ ___mem_emergency } -> r1
	;;
#3:	       ldx	$mem, 0 -> r3.31
	;;
#3:	       stm.a	r3.31, r1, 0
	;;
#0:	       ldm.s	r15, 16
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       ldmg.d	___mem_emergency
	;;
#0:	       ldx	$memhu, r1 -> r1
	;;
.BB0_31:                                ; %bb11.i.i.i.i
#0:	       ldm.s	r15, 60
#1:	       ldga	2048 -> r0
#2:	       btest	r1, 7 -> c1
#3:	       ldi	64 -> r11
	;;
#0:	       or	r1, r0 -> r0
#1:	       ldiu	1024 -> r1
	;;
#0:	       callg	__malloc_r
#1:	       ldx	$mem, 0 -> r2
#2:	if !c1 or	r1, 0 -> r11
	;;
#0:	       stmh.a	r0, r2, 6
#1:	       or	r11, 0 -> r0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz ne @	r0, .BB0_34
	;;
.BB0_32:                                ; %bb12.i.i.i.i
#0:	       ldm.s	r15, 60
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       ldm.f	r1, 12
#1:	       ldiu	lo11{ ___mem_emergency } -> r1
	;;
#0:	       ldx	$mem, 0 -> r0.31
	;;
#0:	       stm.a	r0.31, r1, 0
	;;
#0:	       ldm.s	r15, 16
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       ldmg.d	___mem_emergency
	;;
#0:	       ldx	$memhu, r1 -> r1
	;;
#0:	       btest	r1, 9 -> c1
	;;
#0:	if  c1 br @	.BB0_35
	;;
.BB0_33:                                ; %bb13.i.i.i.i
#0:	       ldm.s	r15, 60
#1:	       or	r1, 2 -> r1
#2:	       ldi	67 -> r11
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       add	r0, r11 -> r11
#1:	       stmh.a	r1, r0, 6
	;;
#0:	       br	.BB0_35
#1:	       stm.a	r11, r0, 0
	;;
#0:	       stm.a	r11, r0, 4
	;;
#0:	       stm.a	1, r0, 5
	;;
.BB0_34:                                ; %bb14.i.i.i.i
#0:	       ldga	__cleanup_r -> r1
#1:	       ldga	_impure_data -> r2
#2:	       ldi	128 -> r3
	;;
#0:	       stm.a	r1, r2, 15
#1:	       ldiu	lo11{ ___mem_emergency } -> r1
	;;
#0:	       ldm.s	r15, 60
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       ldm.f	r2, 12
	;;
#0:	       ldx	$mem, 0 -> r0.31
	;;
#0:	       stm.a	r0.31, r1, 0
	;;
#0:	       ldm.s	r15, 16
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       ldmg.d	___mem_emergency
	;;
#0:	       ldx	$memhu, r1 -> r1
	;;
#0:	       or	r1, r3 -> r1
	;;
#0:	       stmh.a	r1, r2, 6
	;;
#0:	       stm.a	r0, r2, 0
	;;
#0:	       stm.a	r0, r2, 4
	;;
#0:	       stm.a	r11, r2, 5
	;;
.BB0_35:                                ; %bb16.i.i.i
#0:	       btest	r1, 0 -> c1
#1:	       bbh	zext16 r1 -> r0
	;;
#0:	if !c1 br @	.BB0_37
	;;
.BB0_36:                                ; %bb17.i.i.i
#0:	       ldm.s	r15, 60
#1:	       ldi	0 -> r4
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       stm.a	0, r2, 2
	;;
#0:	       ldm.f	r2, 20
	;;
#0:	       br	.BB0_38
#1:	       ldx	$mem, 0 -> r3
	;;
#0:	       sub	r4, r3 -> r3
	;;
#0:	       stm.a	r3, r2, 6
	;;
.BB0_37:                                ; %bb18.i.i.i
#0:	       btest	r0, 1 -> c1
#1:	       ldi	0 -> r2
	;;
#0:	if !c1 ldm.s	r15, 60
	;;
#0:	if !c1 ldx	$mem, 0 -> r2
	;;
#0:	if !c1 ldm.f	r2, 20
	;;
#0:	if !c1 ldx	$mem, 0 -> r2
#1:	       ldm.s	r15, 60
	;;
#0:	       ldx	$mem, 0 -> r3
	;;
#0:	       stm.a	r2, r3, 2
	;;
.BB0_38:                                ; %bb22.i.i.i
#0:	       ldm.s	r15, 60
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       ldm.f	r2, 16
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       brz ne @	r2, .BB0_41
	;;
.BB0_39:                                ; %__swsetup_r.exit.i.i
#0:	       btest	r0, 7 -> c1
	;;
#0:	if !c1 br @	.BB0_41
	;;
.BB0_40:                                ; %bb4.i5.i
#0:	       ldm.s	r15, 60
#1:	       ldi	64 -> r10
#2:	       ldga	_impure_data -> r0
	;;
#0:	       or	r1, r10 -> r1
	;;
#0:	       br	.BB0_178
#1:	       ldx	$mem, 0 -> r10
	;;
#0:	       stmh.a	r1, r10, 6
	;;
#0:	       stm.a	9, r0, 0
	;;
.BB0_41:                                ; %bb5.i6.i
#0:	       btest	r1, 1 -> c1
	;;
#0:	if !c1 br @	.BB0_47
	;;
.BB0_42:                                ; %bb7.preheader.i.i
#0:	       ldi	0 -> r10
#1:	       br	.BB0_44
#2:	       ldiu	1024 -> r11
	;;
#0:	       or	r10, 0 -> r12
	;;
	       nop	0
	;;
.BB0_43:                                ; %bb6.i.i
                                        ;   in Loop: Header=BB0_44 Depth=1
#0:	       ldm.s	r15, 56
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       ldm.f	r1, -4
	;;
#0:	       ldx	$mem, 0 -> r10
#1:	       ldm.f	r1, 0
#2:	       add	r1, 8 -> r1
	;;
#0:	       ldx	$mem, 0 -> r12
#1:	       stm.s	r1, r15, 14
	;;
.BB0_44:                                ; %bb7.i.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       brz eq @	r12, .BB0_43
	;;
.BB0_45:                                ; %bb8.i8.i
                                        ;   in Loop: Header=BB0_44 Depth=1
#0:	       ldm.s	r15, 60
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
#0:	       jop	call	r4
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       cmplt	r0, 1 -> c1
	;;
#0:	if  c1 br @	.BB0_173
	;;
.BB0_46:                                ; %bb10.i.i
                                        ;   in Loop: Header=BB0_44 Depth=1
#0:	       ldm.s	r15, 40
#1:	       add	r10, r0 -> r10
#2:	       sub	r12, r0 -> r12
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       cmpeq	r1, r0 -> c1
#1:	       sub	r1, r0 -> r2
	;;
#0:	if  c1 br	.BB0_178
#1:	if !c1 br	.BB0_44
#2:	       or	r2, 0 -> r1
	;;
#0:	       stm.s	r1, r15, 10
	;;
	       nop	0
	;;
.BB0_47:                                ; %bb11.i9.i
#0:	       bbh	zext16 r1 -> r0
	;;
#0:	       btest	r0, 0 -> c1
	;;
#0:	if  c1 br @	.BB0_49
	;;
.BB0_48:                                ; %bb13.preheader.i.i
#0:	       ldi	0 -> r0
#1:	       or	r10, 4 -> r10
	;;
#0:	       stm.s	r0, r15, 11
	;;
#0:	       stm.s	r10, r15, 2
#1:	       ldiu	895 -> r10
	;;
#0:	       br	.BB0_51
#1:	       ldim	31 -> r10
	;;
#0:	       stm.s	r10, r15, 3
#1:	       or	r0, 0 -> r10
	;;
#0:	       stm.s	r10, r15, 14
	;;
.BB0_49:                                ; %bb38.preheader.i.i
#0:	       or	r10, 4 -> r0
#1:	       ldga	32896 -> r2
#2:	       ldiu	1791 -> r1
#3:	       ldi	0 -> r11
	;;
#0:	       stm.s	r0, r15, 9
#1:	       ldiu	522 -> r0
#2:	       ldih	1028 -> r2
#3:	       ldim	991 -> r1
	;;
#0:	       ldim	321 -> r0
#1:	       stm.s	r2, r15, 14
#2:	       ldih	2039 -> r1
#3:	       or	r11, 0 -> r10
	;;
#0:	       br	.BB0_151
#1:	       ldih	80 -> r0
#2:	       or	r11, 0 -> r12
	;;
#0:	       stm.s	r0, r15, 13
	;;
#0:	       stm.s	r1, r15, 12
	;;
.BB0_50:                                ; %bb12.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldm.s	r15, 8
	;;
#0:	       ldx	$mem, 0 -> r10
	;;
#0:	       ldm.f	r10, -4
	;;
#0:	       ldx	$mem, 0 -> r11
	;;
#0:	       stm.s	r11, r15, 11
	;;
#0:	       ldm.f	r10, 0
#1:	       add	r10, 8 -> r10
	;;
#0:	       ldx	$mem, 0 -> r11
	;;
#0:	       stm.s	r11, r15, 14
	;;
#0:	       stm.s	r10, r15, 2
	;;
#0:	       ldm.s	r15, 20
	;;
#0:	       ldx	$mem, 0 -> r10
	;;
#0:	       stm.s	r10, r15, 10
	;;
.BB0_51:                                ; %bb13.i.i
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_70 Depth 2
                                        ;     Child Loop BB0_62 Depth 2
                                        ;     Child Loop BB0_66 Depth 2
#0:	       ldm.s	r15, 40
	;;
#0:	       ldx	$mem, 0 -> r10
	;;
#0:	       stm.s	r10, r15, 5
	;;
#0:	       ldm.s	r15, 56
	;;
#0:	       ldx	$mem, 0 -> r10
	;;
#0:	       brz eq @	r10, .BB0_50
	;;
.BB0_52:                                ; %bb14.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldm.s	r15, 60
#1:	       ldiu	lo11{ ___mem_emergency } -> r11
	;;
#0:	       ldx	$mem, 0 -> r10
	;;
#0:	       ldm.f	r10, 12
	;;
#1:	       ldx	$mem, 0 -> r1.31
	;;
#1:	       stm.a	r1.31, r11, 0
	;;
#0:	       ldm.s	r15, 16
	;;
#0:	       ldx	$mem, 0 -> r11
	;;
#0:	       ldmg.d	___mem_emergency
	;;
#0:	       ldx	$memhu, r11 -> r11
#1:	       ldm.f	r10, 8
	;;
#0:	       btest	r11, 9 -> c1
	;;
#0:	if !c1 br @	.BB0_144
#1:	       ldx	$mem, 0 -> r10
	;;
.BB0_53:                                ; %bb15.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldm.s	r15, 56
	;;
#0:	       ldx	$mem, 0 -> r12
	;;
#0:	       cmpult	r12, r10 -> c1
	;;
#0:	if  c1 br @	.BB0_73
	;;
.BB0_54:                                ; %bb16.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldiu	1152 -> r12
	;;
#0:	       and	r11, r12 -> r12
	;;
#0:	       cmpeq	r12, 0 -> c3
	;;
#0:	if  c3 br @	.BB0_73
	;;
.BB0_55:                                ; %bb17.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldm.s	r15, 60
	;;
#0:	       ldx	$mem, 0 -> r10
	;;
#0:	       ldm.f	r10, 20
	;;
#0:	       ldx	$mem, 0 -> r12
#1:	       ldm.f	r10, 0
	;;
#0:	       mul	r12, 3 -> $mul0.0
	;;
#1:	       ldx	$mem, 0 -> r13
#2:	       ldm.f	r10, 16
#0:	       ldx	$mul0.0, 0 -> r0
	;;
#0:	       sr	r0, 31 -> r0
	;;
#1:	       ldx	$mem, 0 -> r10
#0:	       ldx	$mul0.0, r0 -> r0
	;;
#0:	       sub	r13, r10 -> r12
#1:	       sra	r0, 1 -> r0
	;;
#0:	       stm.s	r12, r15, 9
	;;
#0:	       ldm.s	r15, 56
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       add	r1, r12 -> r12
	;;
#0:	       add	r12, 1 -> r1
	;;
#0:	       cmpult	r0, r1 -> c1
	;;
#0:	if  c1 add	r12, 1 -> r0
#1:	       btest	r11, 10 -> c1
	;;
#0:	if !c1 br @	.BB0_74
#1:	       stm.s	r0, r15, 8
	;;
.BB0_56:                                ; %bb20.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldm.s	r15, 32
	;;
#0:	       callg	__malloc_r
#1:	       ldx	$mem, 0 -> r0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz ne @	r0, .BB0_58
	;;
.BB0_57:                                ; %bb21.i.i
#0:	       ldga	_impure_data -> r0
#1:	       br	.BB0_173
	;;
#0:	       stm.a	12, r0, 0
	;;
	       nop	0
	;;
.BB0_58:                                ; %bb22.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldm.s	r15, 60
	;;
#0:	       ldx	$mem, 0 -> r11
	;;
#0:	       ldm.f	r11, 16
	;;
#0:	       ldx	$mem, 0 -> r11
#1:	       ldm.s	r15, 36
	;;
#0:	       ldx	$mem, 0 -> r12
	;;
#0:	       cmpult	r12, 16 -> c1
	;;
#0:	if !c1 br @	.BB0_60
	;;
.BB0_59:                                ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldm.s	r15, 36
#1:	       br	.BB0_69
#2:	       or	r0, 0 -> r12
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
	       nop	0
	;;
.BB0_60:                                ; %bb.i.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldm.s	r15, 36
#1:	       or	r11, r0 -> r12
	;;
#0:	       and	r12, 3 -> r2
#1:	       or	r0, 0 -> r12
	;;
#0:	       brz ne @	r2, .BB0_69
#1:	       ldx	$mem, 0 -> r1
	;;
.BB0_61:                                ; %bb.nph22.i.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldi	0 -> r2
#1:	       sub	r13, r10 -> r10
	;;
.BB0_62:                                ; %bb2.i1.i.i
                                        ;   Parent Loop BB0_51 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       or	r2, 0 -> r12
	;;
#0:	       sub	r11, r12 -> r1
#1:	       sub	r0, r12 -> r3
	;;
#0:	       ldm.f	r1, 0
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       stm.a	r2, r3, 0
#1:	       sub	r12, 16 -> r2
	;;
#0:	       ldm.f	r1, 4
	;;
#0:	       ldx	$mem, 0 -> r4
	;;
#0:	       stm.a	r4, r3, 1
	;;
#0:	       ldm.f	r1, 8
	;;
#0:	       ldx	$mem, 0 -> r4
	;;
#0:	       stm.a	r4, r3, 2
	;;
#0:	       ldm.f	r1, 12
#1:	       add	r10, r2 -> r1
	;;
#0:	       ldx	$mem, 0 -> r4
	;;
#0:	       stm.a	r4, r3, 3
#1:	       ldi	15 -> r3
	;;
#0:	       cmpult	r3, r1 -> c1
	;;
#0:	if  c1 br @	.BB0_62
	;;
.BB0_63:                                ; %bb5.preheader.i.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       cmpult	r1, 4 -> c1
	;;
#0:	if !c1 br @	.BB0_65
	;;
.BB0_64:                                ;   in Loop: Header=BB0_51 Depth=1
#0:	       sub	r0, r2 -> r12
#1:	       br @	.BB0_68
	;;
.BB0_65:                                ; %bb.nph16.i.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldi	0 -> r1
#1:	       add	r10, r2 -> r10
	;;
#0:	       or	r1, 0 -> r3
	;;
.BB0_66:                                ; %bb4.i.i.i
                                        ;   Parent Loop BB0_51 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       add	r11, r1 -> r4
#1:	       add	r0, r1 -> r5
#2:	       sub	r10, r1 -> r6
#3:	       sub	r3, 4 -> r3
	;;
#0:	       sub	r4, r12 -> r4
#1:	       sub	r5, r12 -> r5
#2:	       sub	r6, 4 -> r6
#3:	       add	r1, 4 -> r1
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
#0:	if  c1 br @	.BB0_66
	;;
.BB0_67:                                ; %bb5.bb6_crit_edge.i.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       add	r0, r1 -> r12
#1:	       add	r11, r1 -> r11
#2:	       sub	r10, r1 -> r1
	;;
#0:	       sub	r12, r2 -> r12
	;;
.BB0_68:                                ; %bb5.bb6_crit_edge.i.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       sub	r11, r2 -> r11
	;;
.BB0_69:                                ; %bb8.preheader.i.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       brz eq @	r1, .BB0_71
	;;
.BB0_70:                                ; %bb7.i3.i.i
                                        ;   Parent Loop BB0_51 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r11, 0
#1:	       add	r12, 1 -> r2
#2:	       sub	r1, 1 -> r1
	;;
#0:	       brz ne	r1, .BB0_70
#1:	       ldx	$membu, r11 -> r10
#2:	       add	r11, 1 -> r11
	;;
#0:	       stmb.a	r10, r12, 0
#1:	       or	r2, 0 -> r12
	;;
	       nop	0
	;;
.BB0_71:                                ; %memcpy.exit.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldm.s	r15, 60
#1:	       ldiu	lo11{ ___mem_emergency } -> r11
	;;
#0:	       ldx	$mem, 0 -> r10
	;;
#0:	       ldm.f	r10, 12
	;;
#3:	       ldx	$mem, 0 -> r3.31
	;;
#3:	       stm.a	r3.31, r11, 0
	;;
#0:	       ldm.s	r15, 16
	;;
#0:	       ldx	$mem, 0 -> r11
	;;
#0:	       ldmg.d	___mem_emergency
	;;
#0:	       ldx	$memhu, r11 -> r11
#1:	       ldm.s	r15, 12
	;;
#0:	       ldx	$mem, 0 -> r12
	;;
#0:	       and	r11, r12 -> r11
#1:	       ldi	128 -> r12
	;;
#0:	       or	r11, r12 -> r11
	;;
#0:	       stmh.a	r11, r10, 6
	;;
.BB0_72:                                ; %bb25.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldm.s	r15, 36
	;;
#0:	       ldx	$mem, 0 -> r10
	;;
#0:	       ldm.s	r15, 60
#1:	       add	r0, r10 -> r11
	;;
#0:	       ldx	$mem, 0 -> r12
	;;
#0:	       stm.a	r0, r12, 4
	;;
#0:	       stm.a	r11, r12, 0
	;;
#0:	       ldm.s	r15, 32
	;;
#0:	       ldx	$mem, 0 -> r11
	;;
#0:	       sub	r11, r10 -> r10
#1:	       stm.a	r11, r12, 5
	;;
#0:	       stm.a	r10, r12, 2
	;;
#0:	       ldm.s	r15, 56
	;;
#0:	       ldx	$mem, 0 -> r10
	;;
.BB0_73:                                ; %bb26.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldm.s	r15, 60
	;;
#0:	       ldx	$mem, 0 -> r11
	;;
#0:	       ldm.f	r11, 0
	;;
#0:	       ldx	$mem, 0 -> r0
#1:	       ldm.s	r15, 56
	;;
#0:	       ldx	$mem, 0 -> r12
	;;
#0:	       cmpult	r12, r10 -> c1
#1:	       ldm.s	r15, 44
	;;
#0:	if  c1 or	r12, 0 -> r10
	;;
#0:	       callg	_memmove
#1:	       ldx	$mem, 0 -> r1
#2:	       or	r10, 0 -> r2
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldm.f	r11, 8
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       sub	r0, r10 -> r0
	;;
#0:	       stm.a	r0, r11, 2
	;;
#0:	       ldm.f	r11, 0
	;;
#0:	       br	.BB0_149
#1:	       ldx	$mem, 0 -> r0
	;;
#0:	       add	r0, r10 -> r10
	;;
#0:	       stm.a	r10, r11, 0
#1:	       or	r12, 0 -> r10
	;;
.BB0_74:                                ; %bb23.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       brz ne @	r10, .BB0_76
	;;
.BB0_75:                                ; %bb.i5.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       callg	__malloc_r
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       br @	.BB0_142
	;;
.BB0_76:                                ; %bb1.i6.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldm.f	r10, -4
#1:	       ldi	22 -> r1
#2:	       ldi	16 -> r13
	;;
#0:	       ldx	$mem, 0 -> r11
#1:	       ldm.s	r15, 32
	;;
#0:	       ldx	$mem, 0 -> r12
	;;
#0:	       add	r12, 11 -> r0
	;;
#0:	       cmpult	r1, r0 -> c1
#1:	       ldi	-8 -> r1
	;;
#0:	if  c1 and	r0, r1 -> r13
	;;
#0:	       cmplt	r13, 0 -> c1
#1:	       cmpult	r13, r12 -> c2
	;;
#0:	       comb	or c1, c2 -> c1
	;;
#0:	if !c1 br @	.BB0_78
	;;
.BB0_77:                                ; %bb6.i7.i.i
#0:	       ldga	_impure_data -> r0
#1:	       br	.BB0_143
	;;
#0:	       stm.a	12, r0, 0
	;;
	       nop	0
	;;
.BB0_78:                                ; %bb7.i8.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       sub	r10, 8 -> r12
	;;
#0:	       stm.s	r12, r15, 7
#1:	       ldi	-4 -> r12
	;;
#0:	       and	r11, r12 -> r12
	;;
#0:	       cmple	r13, r12 -> c1
	;;
#0:	if !c1 br @	.BB0_81
	;;
.BB0_79:                                ;   in Loop: Header=BB0_51 Depth=1
#0:	       stm.s	r12, r15, 13
	;;
.BB0_80:                                ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldm.s	r15, 28
#1:	       br	.BB0_138
	;;
#0:	       ldx	$mem, 0 -> r10
	;;
#0:	       stm.s	r10, r15, 12
	;;
.BB0_81:                                ; %bb8.i10.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldmg.d	___malloc_av_+8
#1:	       add	r12, r10 -> r1
#2:	       sub	r12, 4 -> r14
	;;
#0:	       sub	r1, 8 -> r1
#1:	       add	r10, r14 -> r0
	;;
#0:	       ldx	$mem, 0 -> r2
#1:	       ldm.f	r0, 0
	;;
#0:	       cmpeq	r2, r1 -> c1
	;;
#0:	if  c1 br @	.BB0_85
#1:	       ldx	$mem, 0 -> r0
	;;
.BB0_82:                                ; %bb9.i11.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldi	-2 -> r3
#1:	       ldi	0 -> r4
	;;
#0:	       and	r0, r3 -> r3
#1:	       stm.s	r4, r15, 10
	;;
#0:	       add	r3, r14 -> r3
	;;
#0:	       add	r10, r3 -> r3
	;;
#0:	       ldm.f	r3, 0
	;;
#0:	       ldx	$membu, r3 -> r3
	;;
#0:	       btest	r3, 0 -> c1
	;;
#0:	if  c1 br @	.BB0_87
	;;
.BB0_83:                                ; %bb13.i15.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldi	-4 -> r4
	;;
#0:	       and	r0, r4 -> r4
	;;
#0:	       stm.s	r4, r15, 10
#1:	       add	r4, r12 -> r4
	;;
#0:	       cmplt	r4, r13 -> c1
#1:	       stm.s	r4, r15, 13
#2:	       or	r1, 0 -> r4
	;;
#0:	if  c1 br @	.BB0_87
	;;
.BB0_84:                                ; %bb14.i16.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       add	r10, r12 -> r10
	;;
#0:	       ldm.f	r10, 0
	;;
#0:	       ldx	$mem, 0 -> r11
#1:	       ldm.f	r10, 4
	;;
#0:	       br	.BB0_80
#1:	       ldx	$mem, 0 -> r10
	;;
#0:	       stm.a	r10, r11, 3
	;;
#0:	       stm.a	r11, r10, 2
	;;
.BB0_85:                                ; %bb11.i13.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldi	-4 -> r4
	;;
#0:	       and	r0, r4 -> r0
#1:	       add	r13, 16 -> r4
	;;
#0:	       stm.s	r0, r15, 10
#1:	       add	r0, r12 -> r0
	;;
#0:	       cmplt	r0, r4 -> c1
	;;
#0:	if !c1 br @	.BB0_89
	;;
.BB0_86:                                ;   in Loop: Header=BB0_51 Depth=1
#0:	       or	r1, 0 -> r4
	;;
.BB0_87:                                ; %bb16.i17.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       btest	r11, 0 -> c1
	;;
#0:	if  c1 br @	.BB0_123
	;;
.BB0_88:                                ; %bb17.i18.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldm.f	r10, -8
#1:	       ldi	-4 -> r0
#2:	       ldi	-8 -> r3
#3:	       cmpeq	r4, 0 -> c3
	;;
#0:	       ldx	$mem, 0 -> r11
	;;
#0:	       sub	r0, r11 -> r1
#1:	       sub	r3, r11 -> r11
	;;
#1:	       add	r10, r1 -> r1.23
#0:	       add	r10, r11 -> r3
	;;
#1:	       ldm.f	r1.23, 0
	;;
#0:	if !c3 br	.BB0_90
#1:	if  c3 br	.BB0_113
#2:	       ldx	$mem, 0 -> r1
#3:	       stm.s	r3, r15, 12
	;;
#0:	       and	r1, r0 -> r0
	;;
#0:	       stm.s	r0, r15, 6
	;;
.BB0_89:                                ; %bb12.i14.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldm.s	r15, 40
#1:	       add	r13, r10 -> r11
#2:	       sub	r12, r13 -> r12
#3:	       ldga	___malloc_av_ -> r1
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       add	r12, r0 -> r12
#1:	       sub	r11, 8 -> r0
#2:	       sub	r11, 4 -> r11
	;;
#0:	       stm.a	r0, r1, 2
#1:	       or	r12, 1 -> r12
#2:	       or	r10, 0 -> r0
	;;
#0:	       stm.a	r12, r11, 0
#1:	       sub	r10, 4 -> r12
	;;
#0:	       ldm.f	r10, -4
	;;
#0:	       ldx	$mem, 0 -> r11
	;;
#0:	       br	.BB0_142
#1:	       and	r11, 1 -> r11
	;;
#0:	       or	r11, r13 -> r11
	;;
#0:	       stm.a	r11, r12, 0
	;;
.BB0_90:                                ; %bb18.i19.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldm.s	r15, 40
#1:	       cmpne	r2, r4 -> c1
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       ldm.s	r15, 24
#1:	       add	r0, r12 -> r0
	;;
#0:	if  c1 br	.BB0_103
#1:	       ldx	$mem, 0 -> r1
	;;
#0:	       add	r0, r1 -> r0
	;;
#0:	       stm.s	r0, r15, 13
	;;
.BB0_91:                                ; %bb19.i20.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       add	r13, 16 -> r4
	;;
#0:	       cmplt	r0, r4 -> c1
	;;
#0:	if  c1 br @	.BB0_113
	;;
.BB0_92:                                ; %bb20.i.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       add	r11, r10 -> r0
#1:	       add	r11, 12 -> r4
	;;
#0:	       ldm.f	r0, 8
#1:	       add	r10, r4 -> r4
	;;
#3:	       add	r0, 8 -> r3.23
	;;
#0:	       ldx	$mem, 0 -> r1
#1:	       ldm.f	r4, 0
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       stm.a	r2, r1, 3
	;;
#0:	       stm.a	r1, r2, 2
#1:	       ldi	36 -> r1
	;;
#0:	       cmpult	r1, r14 -> c1
	;;
#0:	if  c1 br @	.BB0_101
	;;
.BB0_93:                                ; %bb21.i21.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       cmpult	r14, 20 -> c1
	;;
#0:	if !c1 br @	.BB0_95
	;;
.BB0_94:                                ;   in Loop: Header=BB0_51 Depth=1
#0:	       or	r10, 0 -> r4
#1:	       br	.BB0_100
	;;
#3:	       or	r3.23, 0 -> r1
	;;
	       nop	0
	;;
.BB0_95:                                ; %bb22.i22.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldm.f	r10, 0
#1:	       cmpult	r14, 28 -> c1
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#3:	       stm.a	r1, r3.23, 0
#0:	       add	r0, 16 -> r1
	;;
#0:	if !c1 br	.BB0_97
#1:	       ldm.f	r10, 4
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       stm.a	r2, r4, 0
	;;
.BB0_96:                                ;   in Loop: Header=BB0_51 Depth=1
#0:	       add	r10, 8 -> r4
#1:	       br @	.BB0_100
	;;
.BB0_97:                                ; %bb23.i23.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldm.f	r10, 8
	;;
#0:	       ldx	$mem, 0 -> r4
	;;
#0:	       stm.a	r4, r1, 0
#1:	       add	r0, 24 -> r1
	;;
#0:	       ldm.f	r10, 12
	;;
#0:	       ldx	$mem, 0 -> r4
	;;
#0:	       stm.a	r4, r0, 5
#1:	       ldi	36 -> r4
	;;
#0:	       cmpult	r14, r4 -> c1
	;;
#0:	if !c1 br @	.BB0_99
	;;
.BB0_98:                                ;   in Loop: Header=BB0_51 Depth=1
#0:	       add	r10, 16 -> r4
#1:	       br @	.BB0_100
	;;
.BB0_99:                                ; %bb24.i.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldm.f	r10, 16
	;;
#0:	       ldx	$mem, 0 -> r4
	;;
#0:	       stm.a	r4, r1, 0
#1:	       s2add	r0, 8 -> r1
#2:	       add	r10, 24 -> r4
	;;
#0:	       ldm.f	r10, 20
	;;
#0:	       ldx	$mem, 0 -> r14
	;;
#0:	       stm.a	r14, r0, 7
	;;
.BB0_100:                               ; %bb25.i24.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldm.f	r4, 0
	;;
#0:	       ldx	$mem, 0 -> r14
	;;
#0:	       stm.a	r14, r1, 0
	;;
#0:	       ldm.f	r4, 4
	;;
#0:	       ldx	$mem, 0 -> r14
	;;
#0:	       stm.a	r14, r1, 1
	;;
#0:	       br	.BB0_102
#1:	       ldm.f	r4, 8
	;;
#0:	       ldx	$mem, 0 -> r4
	;;
#0:	       stm.a	r4, r1, 2
	;;
.BB0_101:                               ; %bb26.i.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#3:	       or	r3.23, 0 -> r0
#0:	       callg	_memmove
#1:	       or	r10, 0 -> r1
#2:	       or	r14, 0 -> r2
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB0_102:                               ; %bb27.i25.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldm.s	r15, 40
#1:	       sub	r12, r13 -> r12
#2:	       add	r11, r13 -> r11
#3:	       ldga	___malloc_av_ -> r0
	;;
#0:	       add	r10, r11 -> r10
	;;
#0:	       ldx	$mem, 0 -> r4
	;;
#0:	       ldm.s	r15, 24
#1:	       add	r12, r4 -> r12
	;;
#0:	       ldx	$mem, 0 -> r4
	;;
#0:	       add	r12, r4 -> r12
#1:	       stm.a	r10, r0, 2
	;;
#0:	       or	r12, 1 -> r11
	;;
#0:	       stm.a	r11, r10, 1
	;;
#1:	       ldm.f	r1.23, 0
#3:	       or	r3.23, 0 -> r0
	;;
#0:	       ldx	$mem, 0 -> r10
	;;
#0:	       br	.BB0_142
#1:	       and	r10, 1 -> r10
	;;
#0:	       or	r10, r13 -> r10
	;;
#1:	       stm.a	r10, r1.23, 0
	;;
.BB0_103:                               ; %bb28.i.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldm.s	r15, 52
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       cmplt	r0, r13 -> c1
	;;
#0:	if  c1 br @	.BB0_113
	;;
.BB0_104:                               ; %bb29.i.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldm.f	r4, 8
#1:	       add	r11, 12 -> r1
#2:	       add	r11, r10 -> r11
	;;
#0:	       ldx	$mem, 0 -> r12
#1:	       ldm.f	r4, 12
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
#0:	       cmpult	r1, r14 -> c1
	;;
#0:	if  c1 br @	.BB0_137
	;;
.BB0_105:                               ; %bb31.i.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       cmpult	r14, 20 -> c1
	;;
#0:	if  c1 br @	.BB0_111
	;;
.BB0_106:                               ; %bb34.i.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldm.f	r10, 0
#1:	       cmpult	r14, 28 -> c1
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       stm.a	r1, r0, 0
#1:	       add	r11, 16 -> r0
	;;
#0:	if !c1 br	.BB0_108
#1:	       ldm.f	r10, 4
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       stm.a	r1, r12, 0
	;;
.BB0_107:                               ;   in Loop: Header=BB0_51 Depth=1
#0:	       add	r10, 8 -> r10
#1:	       br @	.BB0_111
	;;
.BB0_108:                               ; %bb35.i.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
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
#1:	       ldi	36 -> r12
	;;
#0:	       cmpult	r14, r12 -> c1
	;;
#0:	if !c1 br @	.BB0_110
	;;
.BB0_109:                               ;   in Loop: Header=BB0_51 Depth=1
#0:	       add	r10, 16 -> r10
#1:	       br @	.BB0_111
	;;
.BB0_110:                               ; %bb36.i.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
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
.BB0_111:                               ; %bb37.i.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
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
#0:	       stm.a	r11, r0, 1
	;;
.BB0_112:                               ; %bb37.i.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldm.f	r10, 8
#1:	       br	.BB0_138
	;;
#0:	       ldx	$mem, 0 -> r10
	;;
#0:	       stm.a	r10, r0, 2
	;;
.BB0_113:                               ; %bb39.i.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldm.s	r15, 48
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       brz eq @	r0, .BB0_123
	;;
.BB0_114:                               ; %bb40.i.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldm.s	r15, 24
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       add	r0, r12 -> r0
	;;
#0:	       cmplt	r0, r13 -> c1
#1:	       stm.s	r0, r15, 13
	;;
#0:	if  c1 br @	.BB0_123
	;;
.BB0_115:                               ; %bb41.i.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
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
#0:	       cmpult	r1, r14 -> c1
	;;
#0:	if  c1 br @	.BB0_137
	;;
.BB0_116:                               ; %bb43.i.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       cmpult	r14, 20 -> c1
	;;
#0:	if  c1 br @	.BB0_122
	;;
.BB0_117:                               ; %bb46.i.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldm.f	r10, 0
#1:	       cmpult	r14, 28 -> c1
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       stm.a	r1, r0, 0
#1:	       add	r11, 16 -> r0
	;;
#0:	if !c1 br	.BB0_119
#1:	       ldm.f	r10, 4
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       stm.a	r1, r12, 0
	;;
.BB0_118:                               ;   in Loop: Header=BB0_51 Depth=1
#0:	       add	r10, 8 -> r10
#1:	       br @	.BB0_122
	;;
.BB0_119:                               ; %bb47.i.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
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
#1:	       ldi	36 -> r12
	;;
#0:	       cmpult	r14, r12 -> c1
	;;
#0:	if !c1 br @	.BB0_121
	;;
.BB0_120:                               ;   in Loop: Header=BB0_51 Depth=1
#0:	       add	r10, 16 -> r10
#1:	       br @	.BB0_122
	;;
.BB0_121:                               ; %bb48.i.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
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
.BB0_122:                               ; %bb49.i.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldm.f	r10, 0
	;;
#0:	       ldx	$mem, 0 -> r12
	;;
#0:	       stm.a	r12, r0, 0
	;;
#0:	       br	.BB0_112
#1:	       ldm.f	r10, 4
	;;
#0:	       ldx	$mem, 0 -> r12
	;;
#0:	       stm.a	r12, r0, 1
	;;
.BB0_123:                               ; %bb51.i.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldm.s	r15, 32
	;;
#0:	       callg	__malloc_r
#1:	       ldx	$mem, 0 -> r0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       cmpeq	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB0_143
	;;
.BB0_124:                               ; %bb53.i.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
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
#0:	if  c1 br @	.BB0_126
	;;
.BB0_125:                               ; %bb54.i.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldm.f	r11, -4
#1:	       ldi	-4 -> r11
	;;
#0:	       ldx	$mem, 0 -> r10
	;;
#0:	       br	.BB0_80
#1:	       and	r10, r11 -> r10
	;;
#0:	       add	r10, r12 -> r10
	;;
#0:	       stm.s	r10, r15, 13
	;;
.BB0_126:                               ; %bb55.i.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldi	36 -> r12
	;;
#0:	       cmpult	r12, r14 -> c1
	;;
#0:	if  c1 br @	.BB0_135
	;;
.BB0_127:                               ; %bb57.i.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       cmpult	r14, 20 -> c1
	;;
#0:	if !c1 br @	.BB0_129
	;;
.BB0_128:                               ;   in Loop: Header=BB0_51 Depth=1
#0:	       or	r10, 0 -> r12
#1:	       br @	.BB0_134
#2:	       or	r11, 0 -> r13
	;;
.BB0_129:                               ; %bb60.i.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldm.f	r10, 0
#1:	       cmpult	r14, 28 -> c1
	;;
#0:	       ldx	$mem, 0 -> r12
	;;
#0:	       stm.a	r12, r11, 0
	;;
#0:	if !c1 br	.BB0_131
#1:	       ldm.f	r10, 4
	;;
#0:	       ldx	$mem, 0 -> r12
	;;
#0:	       stm.a	r12, r11, 1
	;;
.BB0_130:                               ;   in Loop: Header=BB0_51 Depth=1
#0:	       add	r11, 8 -> r13
#1:	       br @	.BB0_134
#2:	       add	r10, 8 -> r12
	;;
.BB0_131:                               ; %bb61.i.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldm.f	r10, 8
	;;
#0:	       ldx	$mem, 0 -> r12
	;;
#0:	       stm.a	r12, r11, 2
	;;
#0:	       ldm.f	r10, 12
	;;
#0:	       ldx	$mem, 0 -> r12
	;;
#0:	       stm.a	r12, r11, 3
#1:	       ldi	36 -> r12
	;;
#0:	       cmpult	r14, r12 -> c1
	;;
#0:	if !c1 br @	.BB0_133
	;;
.BB0_132:                               ;   in Loop: Header=BB0_51 Depth=1
#0:	       add	r11, 16 -> r13
#1:	       br @	.BB0_134
#2:	       add	r10, 16 -> r12
	;;
.BB0_133:                               ; %bb62.i.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldm.f	r10, 16
#1:	       add	r11, 24 -> r13
	;;
#0:	       ldx	$mem, 0 -> r12
	;;
#0:	       stm.a	r12, r11, 4
#1:	       add	r10, 24 -> r12
	;;
#0:	       ldm.f	r10, 20
	;;
#0:	       ldx	$mem, 0 -> r14
	;;
#0:	       stm.a	r14, r11, 5
	;;
.BB0_134:                               ; %bb63.i.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldm.f	r12, 0
	;;
#0:	       ldx	$mem, 0 -> r14
	;;
#0:	       stm.a	r14, r13, 0
	;;
#0:	       ldm.f	r12, 4
	;;
#0:	       ldx	$mem, 0 -> r14
	;;
#0:	       stm.a	r14, r13, 1
	;;
#0:	       br	.BB0_136
#1:	       ldm.f	r12, 8
	;;
#0:	       ldx	$mem, 0 -> r12
	;;
#0:	       stm.a	r12, r13, 2
	;;
.BB0_135:                               ; %bb64.i.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       or	r11, 0 -> r0
#1:	       callg	_memmove
#2:	       or	r10, 0 -> r1
#3:	       or	r14, 0 -> r2
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB0_136:                               ; %bb65.i.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       or	r10, 0 -> r0
#1:	       callg	__free_r
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       br @	.BB0_142
#1:	       or	r11, 0 -> r0
	;;
.BB0_137:                               ; %bb38.i.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       or	r10, 0 -> r1
#1:	       callg	_memmove
#2:	       or	r14, 0 -> r2
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB0_138:                               ; %split.i.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldm.s	r15, 52
	;;
#0:	       ldx	$mem, 0 -> r10
	;;
#0:	       sub	r10, r13 -> r10
	;;
#0:	       cmpult	r10, 16 -> c1
	;;
#0:	if  c1 br @	.BB0_140
	;;
.BB0_139:                               ; %bb66.i.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldm.s	r15, 48
#1:	       or	r13, 4 -> r0
#2:	       or	r10, 1 -> r10
	;;
#0:	       ldx	$mem, 0 -> r11
	;;
#0:	       ldm.f	r11, 4
#1:	       add	r11, r0 -> r0
	;;
#0:	       ldx	$mem, 0 -> r12
	;;
#0:	       and	r12, 1 -> r12
	;;
#0:	       or	r12, r13 -> r12
	;;
#0:	       stm.a	r12, r11, 1
	;;
#0:	       ldm.s	r15, 52
	;;
#0:	       ldx	$mem, 0 -> r12
	;;
#0:	       add	r12, r11 -> r12
#1:	       stm.a	r10, r0, 0
#2:	       add	r13, r11 -> r11
	;;
#0:	       ldm.f	r12, 4
#1:	       add	r11, 8 -> r0
	;;
#0:	       callg	__free_r
#1:	       ldx	$mem, 0 -> r10
	;;
#0:	       or	r10, 1 -> r10
	;;
#0:	       stm.a	r10, r12, 1
	;;
	       nop	0
	;;
#0:	       br @	.BB0_141
	;;
.BB0_140:                               ; %bb67.i.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldm.s	r15, 48
	;;
#0:	       ldx	$mem, 0 -> r10
	;;
#0:	       ldm.f	r10, 4
	;;
#0:	       ldx	$mem, 0 -> r11
#1:	       ldm.s	r15, 52
	;;
#0:	       and	r11, 1 -> r11
	;;
#0:	       ldx	$mem, 0 -> r12
	;;
#0:	       or	r11, r12 -> r11
#1:	       add	r12, r10 -> r0
	;;
#0:	       stm.a	r11, r10, 1
	;;
#0:	       ldm.f	r0, 4
	;;
#0:	       ldx	$mem, 0 -> r10
	;;
#0:	       or	r10, 1 -> r10
	;;
#0:	       stm.a	r10, r0, 1
	;;
.BB0_141:                               ; %bb68.i.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldm.s	r15, 48
	;;
#0:	       ldx	$mem, 0 -> r10
	;;
#0:	       add	r10, 8 -> r0
	;;
.BB0_142:                               ; %_realloc_r.exit.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       cmpne	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB0_72
	;;
.BB0_143:                               ; %bb24.i.i
#0:	       ldm.s	r15, 60
	;;
#0:	       ldx	$mem, 0 -> r10
	;;
#0:	       ldm.f	r10, 16
	;;
#0:	       callg	__free_r
#1:	       ldx	$mem, 0 -> r0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       br @	.BB0_57
	;;
.BB0_144:                               ; %bb29.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldm.s	r15, 60
	;;
#0:	       ldx	$mem, 0 -> r11
	;;
#0:	       ldm.f	r11, 0
	;;
#0:	       ldx	$mem, 0 -> r0
#1:	       ldm.f	r11, 16
	;;
#0:	       ldx	$mem, 0 -> r11
#1:	       ldm.s	r15, 56
	;;
#0:	       cmpult	r11, r0 -> c2
	;;
#0:	       ldx	$mem, 0 -> r12
	;;
#0:	       cmpult	r10, r12 -> c1
	;;
#0:	       comb	and c2, c1 -> c1
	;;
#0:	if !c1 br @	.BB0_146
	;;
.BB0_145:                               ; %bb31.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldm.s	r15, 44
#1:	       or	r10, 0 -> r2
	;;
#0:	       callg	_memmove
#1:	       ldx	$mem, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldm.s	r15, 60
	;;
#0:	       ldx	$mem, 0 -> r11
	;;
#0:	       ldm.f	r11, 0
#1:	       or	r11, 0 -> r0
	;;
#0:	       callg	__fflush_r
#1:	       ldx	$mem, 0 -> r12
	;;
#0:	       add	r12, r10 -> r12
	;;
#0:	       stm.a	r12, r11, 0
	;;
	       nop	0
	;;
#0:	       brz eq @	r0, .BB0_149
	;;
#0:	       br @	.BB0_173
	;;
.BB0_146:                               ; %bb32.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldm.s	r15, 60
	;;
#0:	       ldx	$mem, 0 -> r10
	;;
#0:	       ldm.f	r10, 20
	;;
#0:	       ldx	$mem, 0 -> r3
#1:	       ldm.s	r15, 56
	;;
#0:	       ldx	$mem, 0 -> r10
	;;
#0:	       cmpult	r10, r3 -> c1
	;;
#0:	if  c1 br @	.BB0_148
	;;
.BB0_147:                               ; %bb33.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldm.s	r15, 60
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
#1:	       ldm.s	r15, 44
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       jop	call	r11
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       cmplt	r0, 1 -> c1
#1:	       or	r0, 0 -> r10
	;;
#0:	if  c1 br @	.BB0_173
#1:	if !c1 br @	.BB0_149
	;;
.BB0_148:                               ; %bb34.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldm.s	r15, 44
#1:	       or	r10, 0 -> r2
	;;
#0:	       callg	_memmove
#1:	       ldx	$mem, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldm.s	r15, 60
	;;
#0:	       ldx	$mem, 0 -> r11
	;;
#0:	       ldm.f	r11, 8
	;;
#0:	       ldx	$mem, 0 -> r12
	;;
#0:	       sub	r12, r10 -> r12
	;;
#0:	       stm.a	r12, r11, 2
	;;
#0:	       ldm.f	r11, 0
	;;
#0:	       ldx	$mem, 0 -> r12
	;;
#0:	       add	r12, r10 -> r12
	;;
#0:	       stm.a	r12, r11, 0
	;;
.BB0_149:                               ; %bb35.i.i
                                        ;   in Loop: Header=BB0_51 Depth=1
#0:	       ldm.s	r15, 44
	;;
#0:	       ldx	$mem, 0 -> r11
	;;
#0:	       add	r11, r10 -> r11
	;;
#0:	       stm.s	r11, r15, 11
	;;
#0:	       ldm.s	r15, 56
	;;
#0:	       ldx	$mem, 0 -> r11
	;;
#0:	       sub	r11, r10 -> r11
	;;
#0:	       stm.s	r11, r15, 14
	;;
#0:	       ldm.s	r15, 20
	;;
#0:	       ldx	$mem, 0 -> r11
	;;
#0:	       cmpeq	r11, r10 -> c1
#1:	       sub	r11, r10 -> r12
	;;
#0:	if  c1 br @	.BB0_178
#1:	if !c1 br @	.BB0_51
#2:	       stm.s	r12, r15, 10
	;;
.BB0_150:                               ; %bb37.i.i
                                        ;   in Loop: Header=BB0_151 Depth=1
#0:	       ldm.s	r15, 36
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       ldm.f	r0, -4
	;;
#0:	       ldx	$mem, 0 -> r11
#1:	       ldm.f	r0, 0
#2:	       add	r0, 8 -> r0
	;;
#0:	       ldx	$mem, 0 -> r10
#1:	       stm.s	r0, r15, 9
	;;
.BB0_151:                               ; %bb38.outer.i.i
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_152 Depth 2
                                        ;       Child Loop BB0_157 Depth 3
                                        ;       Child Loop BB0_164 Depth 3
                                        ;       Child Loop BB0_160 Depth 3
#0:	       ldi	0 -> r0
	;;
#0:	       stm.s	r0, r15, 11
	;;
.BB0_152:                               ; %bb38.i.i
                                        ;   Parent Loop BB0_151 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB0_157 Depth 3
                                        ;       Child Loop BB0_164 Depth 3
                                        ;       Child Loop BB0_160 Depth 3
#0:	       brz eq @	r10, .BB0_150
	;;
.BB0_153:                               ; %bb39.i.i
                                        ;   in Loop: Header=BB0_152 Depth=2
#0:	       ldm.s	r15, 44
#1:	       ldi	0 -> r0
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       brz ne @	r1, .BB0_169
	;;
#0:	       brz eq @	r1, .BB0_157
	;;
.BB0_154:                               ; %bb.i26.i.i
                                        ;   in Loop: Header=BB0_157 Depth=3
#0:	       cmpeq	r10, r0 -> c1
	;;
#0:	if  c1 br @	.BB0_167
	;;
.BB0_155:                               ; %bb2.i27.i.i
                                        ;   in Loop: Header=BB0_157 Depth=3
#0:	       ldm.f	r12, 0
	;;
#0:	       ldx	$membu, r12 -> r1
	;;
#0:	       cmpeq	r1, 10 -> c1
	;;
#0:	if  c1 br @	.BB0_165
	;;
.BB0_156:                               ; %bb4.i28.i.i
                                        ;   in Loop: Header=BB0_157 Depth=3
#0:	       add	r0, 1 -> r0
	;;
.BB0_157:                               ; %bb5.i29.i.i
                                        ;   Parent Loop BB0_151 Depth=1
                                        ;     Parent Loop BB0_152 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
#0:	       add	r11, r0 -> r12
	;;
#0:	       and	r12, 3 -> r1
	;;
#0:	       brz ne @	r1, .BB0_154
	;;
.BB0_158:                               ; %bb6.i30.i.i
                                        ;   in Loop: Header=BB0_152 Depth=2
#0:	       sub	r10, r0 -> r1
#1:	       add	r11, r0 -> r12
#2:	       ldi	3 -> r0
	;;
#0:	       cmpult	r0, r1 -> c1
	;;
#0:	if  c1 ldi	3 -> r0
	;;
#0:	if  c1 cmpult	r0, r1 -> c1
	;;
#0:	if !c1 br @	.BB0_164
#1:	if  c1 br @	.BB0_160
	;;
.BB0_159:                               ; %bb13.i37.i.i
                                        ;   in Loop: Header=BB0_160 Depth=3
#0:	       ldi	3 -> r0
	;;
#0:	       cmpult	r0, r1 -> c1
	;;
#0:	if !c1 br @	.BB0_164
	;;
.BB0_160:                               ; %bb10.i32.i.i
                                        ;   Parent Loop BB0_151 Depth=1
                                        ;     Parent Loop BB0_152 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
#0:	       ldm.f	r12, 0
	;;
#0:	       ldx	$mem, 0 -> r0
#1:	       ldm.s	r15, 56
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       ldm.s	r15, 52
#1:	       and	r0, r2 -> r3
	;;
#0:	       xor	r3, r2 -> r2
	;;
#0:	       ldx	$mem, 0 -> r4
	;;
#0:	       ldm.s	r15, 48
#1:	       xor	r0, r4 -> r0
	;;
#0:	       ldx	$mem, 0 -> r3
	;;
#0:	       add	r0, r3 -> r0
	;;
#0:	       and	r2, r0 -> r0
	;;
#0:	       brz ne @	r0, .BB0_164
	;;
.BB0_161:                               ; %bb12.i33.i.i
                                        ;   in Loop: Header=BB0_160 Depth=3
#0:	       add	r12, 4 -> r12
#1:	       br @	.BB0_159
#2:	       sub	r1, 4 -> r1
	;;
.BB0_162:                               ; %bb15.i38.i.i
                                        ;   in Loop: Header=BB0_164 Depth=3
#0:	       ldm.f	r12, 0
	;;
#0:	       ldx	$membu, r12 -> r0
	;;
#0:	       cmpeq	r0, 10 -> c1
	;;
#0:	if  c1 br @	.BB0_165
	;;
.BB0_163:                               ; %bb17.i40.i.i
                                        ;   in Loop: Header=BB0_164 Depth=3
#0:	       add	r12, 1 -> r12
#1:	       sub	r1, 1 -> r1
	;;
.BB0_164:                               ; %bb18.i42.i.i
                                        ;   Parent Loop BB0_151 Depth=1
                                        ;     Parent Loop BB0_152 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
#0:	       brz ne @	r1, .BB0_162
	;;
#0:	       brz eq @	r1, .BB0_167
	;;
.BB0_165:                               ; %memchr.exit.i.i
                                        ;   in Loop: Header=BB0_152 Depth=2
#0:	       brz eq @	r12, .BB0_167
	;;
.BB0_166:                               ; %bb41.i.i
                                        ;   in Loop: Header=BB0_152 Depth=2
#0:	       add	r12, 1 -> r12
#1:	       br	.BB0_168
	;;
#0:	       sub	r12, r11 -> r12
	;;
	       nop	0
	;;
.BB0_167:                               ; %bb42.i.i
                                        ;   in Loop: Header=BB0_152 Depth=2
#0:	       add	r10, 1 -> r12
	;;
.BB0_168:                               ; %bb42.i.i
                                        ;   in Loop: Header=BB0_152 Depth=2
#0:	       ldi	1 -> r0
	;;
#0:	       stm.s	r0, r15, 11
	;;
.BB0_169:                               ; %bb44.i.i
                                        ;   in Loop: Header=BB0_152 Depth=2
#0:	       ldm.s	r15, 60
#1:	       cmpule	r12, r10 -> c1
#2:	       or	r10, 0 -> r13
	;;
#0:	if  c1 or	r12, 0 -> r13
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
#0:	       add	r3, r2 -> r14
	;;
#0:	       ldx	$mem, 0 -> r0
#1:	       ldm.f	r1, 16
#2:	       cmplt	r14, r13 -> c2
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       cmpult	r1, r0 -> c1
	;;
#0:	       comb	and c1, c2 -> c1
	;;
#0:	if !c1 br @	.BB0_171
	;;
.BB0_170:                               ; %bb48.i.i
                                        ;   in Loop: Header=BB0_152 Depth=2
#0:	       or	r11, 0 -> r1
#1:	       callg	_memmove
#2:	       or	r14, 0 -> r2
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldm.s	r15, 60
	;;
#0:	       ldx	$mem, 0 -> r13
	;;
#0:	       ldm.f	r13, 0
	;;
#0:	       callg	__fflush_r
#1:	       ldx	$mem, 0 -> r0
	;;
#0:	       add	r0, r14 -> r0
	;;
#0:	       stm.a	r0, r13, 0
#1:	       or	r13, 0 -> r0
	;;
	       nop	0
	;;
#0:	       brz ne @	r0, .BB0_173
	;;
#0:	       brz eq @	r0, .BB0_175
	;;
.BB0_171:                               ; %bb49.i.i
                                        ;   in Loop: Header=BB0_152 Depth=2
#0:	       cmplt	r13, r3 -> c1
	;;
#0:	if  c1 br @	.BB0_174
	;;
.BB0_172:                               ; %bb50.i.i
                                        ;   in Loop: Header=BB0_152 Depth=2
#0:	       ldm.s	r15, 60
#1:	       ldga	_impure_data -> r0
#2:	       or	r11, 0 -> r2
	;;
#0:	       ldx	$mem, 0 -> r13
	;;
#0:	       ldm.f	r13, 36
	;;
#0:	       ldx	$mem, 0 -> r14
#1:	       ldm.f	r13, 28
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       jop	call	r14
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       cmplt	r0, 1 -> c1
#1:	       or	r0, 0 -> r14
	;;
#0:	if !c1 br @	.BB0_175
	;;
.BB0_173:                               ; %err.i.i
#0:	       ldm.s	r15, 60
#1:	       ldiu	lo11{ ___mem_emergency } -> r1
#2:	       ldi	64 -> r2
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       ldm.f	r0, 12
	;;
#2:	       ldx	$mem, 0 -> r2.31
	;;
#2:	       stm.a	r2.31, r1, 0
	;;
#0:	       ldm.s	r15, 16
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       ldmg.d	___mem_emergency
	;;
#0:	       br	.BB0_178
#1:	       ldx	$memhu, r1 -> r1
	;;
#0:	       or	r1, r2 -> r1
	;;
#0:	       stmh.a	r1, r0, 6
	;;
.BB0_174:                               ; %bb51.i.i
                                        ;   in Loop: Header=BB0_152 Depth=2
#0:	       or	r11, 0 -> r1
#1:	       callg	_memmove
#2:	       or	r13, 0 -> r2
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldm.s	r15, 60
	;;
#0:	       ldx	$mem, 0 -> r14
	;;
#0:	       ldm.f	r14, 8
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       sub	r0, r13 -> r0
	;;
#0:	       stm.a	r0, r14, 2
	;;
#0:	       ldm.f	r14, 0
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       add	r0, r13 -> r0
	;;
#0:	       stm.a	r0, r14, 0
#1:	       or	r13, 0 -> r14
	;;
.BB0_175:                               ; %bb52.i.i
                                        ;   in Loop: Header=BB0_152 Depth=2
#0:	       cmpne	r12, r14 -> c1
	;;
#0:	if  c1 br @	.BB0_177
	;;
.BB0_176:                               ; %bb53.i.i
                                        ;   in Loop: Header=BB0_152 Depth=2
#0:	       ldi	0 -> r0
	;;
#0:	       stm.s	r0, r15, 11
	;;
#0:	       ldm.s	r15, 60
	;;
#0:	       callg	__fflush_r
#1:	       ldx	$mem, 0 -> r0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz ne @	r0, .BB0_173
	;;
.BB0_177:                               ; %bb55.i.i
                                        ;   in Loop: Header=BB0_152 Depth=2
#0:	       ldm.s	r15, 40
#1:	       sub	r12, r14 -> r12
#2:	       add	r11, r14 -> r11
#3:	       sub	r10, r14 -> r10
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       cmpeq	r0, r14 -> c1
#1:	       sub	r0, r14 -> r1
	;;
#0:	if !c1 br	.BB0_152
#1:	       or	r1, 0 -> r0
	;;
#0:	       stm.s	r0, r15, 10
	;;
	       nop	0
	;;
.BB0_178:                               ; %puts.exit
#0:	       ldm.s	r15, 84
#1:	       ldi	0 -> r0
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       stx	r1 -> $ro
	;;
#0:	       ldm.s	r15, 88
	;;
#0:	       ldx	$mem, 0 -> r1
	;;
#0:	       stx	r1 -> $rb
#1:	       ldiu	136 -> r1
	;;
#0:	       ldm.s	r15, 92
	;;
#3:	       ldx	$mem, 0 -> r3.23
	;;
#0:	       ldm.s	r15, 96
	;;
#1:	       ldx	$mem, 0 -> r1.23
	;;
#0:	       ldm.s	r15, 100
	;;
#0:	       ldx	$mem, 0 -> r14
	;;
#0:	       ldm.s	r15, 104
	;;
#0:	       ldx	$mem, 0 -> r13
	;;
#0:	       ldm.s	r15, 108
	;;
#0:	       ldx	$mem, 0 -> r12
	;;
#0:	       ldm.s	r15, 112
	;;
#0:	       ldx	$mem, 0 -> r11
	;;
#0:	       ldm.s	r15, 116
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

	.align	4
_memset:                                ; @memset
	.size	_memset_end-_memset
_memset_start:
; BB#0:                                 ; %entry
#0:	       wb.s	r15, 6
#1:	       br @	.BB1_3
#2:	       sub	r15, 24 -> r15
#3:	       ldi	0 -> r1
	;;
.BB1_1:                                 ; %bb
                                        ;   in Loop: Header=BB1_3 Depth=1
#0:	       cmpeq	r1, 8 -> c1     ; memset.c:59
	;;
#0:	if  c1 br @	.BB1_13
	;;
.BB1_2:                                 ; %bb1
                                        ;   in Loop: Header=BB1_3 Depth=1
#0:	       add	r1, 1 -> r1
#1:	       stmb.a	0, r2, 0        ; memset.c:60
	;;
.BB1_3:                                 ; %bb3
                                        ; =>This Inner Loop Header: Depth=1
#0:	       add	r0, r1 -> r2
	;;
#0:	       and	r2, 3 -> r3     ; memset.c:57
	;;
#0:	       brz ne @	r3, .BB1_1      ; memset.c:57
	;;
.BB1_4:                                 ; %bb4
#0:	       ldi	8 -> r3
	;;
#0:	       sub	r3, r1 -> r3
	;;
#0:	       cmpult	r3, 4 -> c1     ; memset.c:65
	;;
#0:	if  c1 br @	.BB1_11
	;;
.BB1_5:                                 ; %bb5
#0:	       ldi	15 -> r2
	;;
#0:	       cmpult	r2, r3 -> c1    ; memset.c:78
	;;
#0:	if  c1 br @	.BB1_7
	;;
.BB1_6:                                 ; %bb11.preheader.thread
#0:	       add	r0, r1 -> r1
#1:	       br @	.BB1_10
	;;
.BB1_7:                                 ; %bb.nph26
#0:	       ldi	-8 -> r4
#1:	       ldi	-16 -> r5
	;;
#0:	       sub	r4, r1 -> r4
	;;
#0:	       and	r4, r5 -> r4
	;;
.BB1_8:                                 ; %bb8
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sub	r0, r3 -> r5
#1:	       sub	r3, 16 -> r3
	;;
#0:	       cmpult	r2, r3 -> c1    ; memset.c:78
#1:	       stm.a	0, r5, 2        ; memset.c:80
	;;
#0:	if  c1 br	.BB1_8
#1:	       stm.a	0, r5, 3        ; memset.c:81
	;;
#0:	       stm.a	0, r5, 4        ; memset.c:82
	;;
#0:	       stm.a	0, r5, 5        ; memset.c:83
	;;
.BB1_9:                                 ; %bb11.preheader
#0:	       ldi	-8 -> r2
#1:	       add	r0, r4 -> r3
	;;
#0:	       sub	r2, r4 -> r2
#1:	       add	r3, r1 -> r0
	;;
#0:	       sub	r2, r1 -> r3
#1:	       add	r0, 16 -> r1
	;;
#0:	       cmpult	r3, 4 -> c1     ; memset.c:87
#1:	       or	r1, 0 -> r2
	;;
#0:	if  c1 br @	.BB1_11
	;;
.BB1_10:                                ; %bb10
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sub	r3, 4 -> r3
#1:	       ldi	3 -> r0
#2:	       add	r1, 4 -> r2
#3:	       stm.a	0, r1, 0        ; memset.c:89
	;;
#0:	       cmpult	r0, r3 -> c1    ; memset.c:87
#1:	       or	r2, 0 -> r1
	;;
#0:	if  c1 br @	.BB1_10
	;;
.BB1_11:                                ; %bb14.preheader
#0:	       brz eq @	r3, .BB1_13     ; memset.c:98
	;;
.BB1_12:                                ; %bb13
                                        ; =>This Inner Loop Header: Depth=1
#0:	       add	r2, 1 -> r0
#1:	       stmb.a	0, r2, 0        ; memset.c:99
#2:	       sub	r3, 1 -> r3
	;;
#0:	       brz ne @	r3, .BB1_12     ; memset.c:98
#1:	       or	r0, 0 -> r2
	;;
.BB1_13:                                ; %bb16
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
_memset_end:

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
#1:	       stm.s	r10, r15, 1     ; memmove.c:92
	;;
#0:	if !c1 cmpule	r3, r0 -> c1    ; memmove.c:92
	;;
#0:	if  c1 br @	.BB2_4
	;;
.BB2_1:                                 ; %bb1
#0:	       brz eq @	r2, .BB2_14     ; memmove.c:97
	;;
.BB2_2:                                 ; %bb.nph34
#0:	       ldi	0 -> r3
	;;
#0:	       sub	r3, r2 -> r2
	;;
.BB2_3:                                 ; %bb2
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sub	r1, r2 -> r3
#1:	       sub	r0, r2 -> r5
#2:	       add	r2, 1 -> r2
	;;
#0:	       brz ne	r2, .BB2_3      ; memmove.c:97
#1:	       ldm.f	r3, -1          ; memmove.c:99
#2:	       sub	r3, 1 -> r4
	;;
#0:	       brz eq	r2, .BB2_14     ; memmove.c:97
#1:	       ldx	$membu, r4 -> r3 ; memmove.c:99
#2:	       sub	r5, 1 -> r4
	;;
#0:	       stmb.a	r3, r4, 0       ; memmove.c:99
	;;
	       nop	0
	;;
.BB2_4:                                 ; %bb4
#0:	       cmpult	r2, 16 -> c1    ; memmove.c:107
	;;
#0:	if  c1 br @	.BB2_12
	;;
.BB2_5:                                 ; %bb5
#0:	       or	r1, r0 -> r4    ; memmove.c:107
#1:	       ldi	0 -> r3
	;;
#0:	       and	r4, 3 -> r4     ; memmove.c:107
	;;
#0:	       brz ne @	r4, .BB2_12     ; memmove.c:107
	;;
.BB2_6:                                 ; %bb7
                                        ; =>This Inner Loop Header: Depth=1
#0:	       or	r3, 0 -> r4
#1:	       ldi	15 -> r8
	;;
#0:	       sub	r1, r4 -> r5
#1:	       sub	r0, r4 -> r6
	;;
#0:	       ldm.f	r5, 0           ; memmove.c:115
	;;
#0:	       ldx	$mem, 0 -> r3   ; memmove.c:115
	;;
#0:	       stm.a	r3, r6, 0       ; memmove.c:115
#1:	       sub	r4, 16 -> r3
	;;
#0:	       ldm.f	r5, 4           ; memmove.c:116
	;;
#0:	       ldx	$mem, 0 -> r7   ; memmove.c:116
	;;
#0:	       stm.a	r7, r6, 1       ; memmove.c:116
	;;
#0:	       ldm.f	r5, 8           ; memmove.c:117
	;;
#0:	       ldx	$mem, 0 -> r7   ; memmove.c:117
	;;
#0:	       stm.a	r7, r6, 2       ; memmove.c:117
#1:	       add	r2, r3 -> r7
	;;
#0:	       cmpult	r8, r7 -> c1    ; memmove.c:113
#1:	       ldm.f	r5, 12          ; memmove.c:118
	;;
#0:	if  c1 br	.BB2_6
#1:	       ldx	$mem, 0 -> r5   ; memmove.c:118
	;;
#0:	       stm.a	r5, r6, 3       ; memmove.c:118
	;;
	       nop	0
	;;
.BB2_7:                                 ; %bb10.preheader
#0:	       cmpult	r7, 4 -> c1     ; memmove.c:123
	;;
#0:	if !c1 br @	.BB2_9
	;;
.BB2_8:
#0:	       sub	r0, r3 -> r0
#1:	       br @	.BB2_12
#2:	       sub	r1, r3 -> r1
#3:	       or	r7, 0 -> r2
	;;
.BB2_9:                                 ; %bb.nph22
#0:	       ldi	0 -> r5
#1:	       add	r2, r3 -> r2
#2:	       ldi	3 -> r6
	;;
#0:	       or	r5, 0 -> r7
	;;
.BB2_10:                                ; %bb9
                                        ; =>This Inner Loop Header: Depth=1
#2:	       sub	r2, r5 -> r2.16
#0:	       add	r1, r5 -> r8
#1:	       add	r0, r5 -> r9
#3:	       sub	r7, 4 -> r7
	;;
#2:	       sub	r2.16, 4 -> r10
#0:	       sub	r8, r4 -> r8
#1:	       add	r5, 4 -> r5
#3:	       sub	r9, r4 -> r9
	;;
#0:	       cmpult	r6, r10 -> c1   ; memmove.c:123
#1:	       ldm.f	r8, 16          ; memmove.c:125
	;;
#0:	if  c1 br	.BB2_10
#1:	       ldx	$mem, 0 -> r8   ; memmove.c:125
	;;
#0:	       stm.a	r8, r9, 4       ; memmove.c:125
	;;
	       nop	0
	;;
.BB2_11:                                ; %bb10.bb11_crit_edge
#0:	       add	r0, r5 -> r0
#1:	       add	r1, r5 -> r1
#2:	       sub	r2, r5 -> r2
	;;
#0:	       sub	r0, r3 -> r0
#1:	       sub	r1, r3 -> r1
	;;
.BB2_12:                                ; %bb13.preheader
#0:	       brz eq @	r2, .BB2_14     ; memmove.c:134
	;;
.BB2_13:                                ; %bb12
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r1, 0           ; memmove.c:136
#1:	       add	r0, 1 -> r4
#2:	       sub	r2, 1 -> r2
	;;
#0:	       brz ne	r2, .BB2_13     ; memmove.c:134
#1:	       ldx	$membu, r1 -> r3 ; memmove.c:136
#2:	       add	r1, 1 -> r1
	;;
#0:	       stmb.a	r3, r0, 0       ; memmove.c:136
#1:	       or	r4, 0 -> r0
	;;
	       nop	0
	;;
.BB2_14:                                ; %bb14
#0:	       ldm.s	r15, 4
#1:	       add	r15, 24 -> r15
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
_memmove_end:

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
#0:	       brz ne @	r0, .BB3_2      ; fflush.c:224
	;;
.BB3_1:                                 ; %bb1
#0:	       callg	___sinit        ; fflush.c:224
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB3_2:                                 ; %bb2
#0:	       ldm.f	r10, 12         ; fflush.c:226
#1:	       add	r10, 12 -> r11  ; fflush.c:226
#2:	       ldi	0 -> r0
	;;
#0:	       ldx	$memhu, r11 -> r1 ; fflush.c:226
	;;
#0:	       cmpeq	r1, 0 -> c3     ; fflush.c:226
	;;
#0:	if  c3 br @	.BB3_36         ; fflush.c:226
	;;
.BB3_3:                                 ; %bb4
#0:	       bbh	sext16 r1 -> r2 ; fflush.c:80[ fflush.c:230 ]
	;;
#0:	       btest	r2, 3 -> c1     ; fflush.c:81[ fflush.c:230 ]
	;;
#0:	if  c1 br @	.BB3_28
	;;
.BB3_4:                                 ; %bb.i
#0:	       ldga	2048 -> r2
#1:	       ldi	0 -> r0
	;;
#0:	       or	r1, r2 -> r2    ; fflush.c:86[ fflush.c:230 ]
	;;
#0:	       stmh.a	r2, r10, 6      ; fflush.c:86[ fflush.c:230 ]
	;;
#0:	       ldm.f	r10, 4          ; fflush.c:95[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r2   ; fflush.c:95[ fflush.c:230 ]
	;;
#0:	       cmplt	r0, r2 -> c1    ; fflush.c:95[ fflush.c:230 ]
	;;
#0:	if  c1 br @	.BB3_6
	;;
.BB3_5:                                 ; %bb1.i
#0:	       ldm.f	r10, 60         ; fflush.c:95[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r2   ; fflush.c:95[ fflush.c:230 ]
	;;
#0:	       cmplt	r2, 1 -> c1     ; fflush.c:95[ fflush.c:230 ]
	;;
#0:	if  c1 br @	.BB3_36
	;;
.BB3_6:                                 ; %bb2.i
#0:	       ldm.f	r10, 40         ; fflush.c:95[ fflush.c:230 ]
#1:	       ldi	0 -> r0
	;;
#0:	       ldx	$mem, 0 -> r2   ; fflush.c:95[ fflush.c:230 ]
	;;
#0:	       cmpeq	r2, 0 -> c3     ; fflush.c:95[ fflush.c:230 ]
	;;
#0:	if  c3 br @	.BB3_36         ; fflush.c:95[ fflush.c:230 ]
	;;
.BB3_7:                                 ; %bb3.i
#0:	       ldmg.d	_impure_data    ; fflush.c:107[ fflush.c:230 ]
#1:	       ldga	_impure_data -> r2 ; fflush.c:108[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r12  ; fflush.c:107[ fflush.c:230 ]
#1:	       stm.a	0, r2, 0        ; fflush.c:108[ fflush.c:230 ]
	;;
#0:	       ldm.f	r10, 12
	;;
#0:	       ldx	$memhu, r11 -> r2
	;;
#0:	       btest	r2, 12 -> c1    ; fflush.c:110[ fflush.c:230 ]
	;;
#0:	if !c1 br @	.BB3_11
	;;
.BB3_8:                                 ; %bb4.i
#0:	       ldm.f	r10, 80         ; fflush.c:111[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; fflush.c:111[ fflush.c:230 ]
	;;
.BB3_9:                                 ; %bb12.i
#0:	       ldm.f	r10, 12
	;;
#0:	       ldx	$memhu, r11 -> r2
	;;
#0:	       btest	r2, 2 -> c1     ; fflush.c:135[ fflush.c:230 ]
	;;
#0:	if  c1 br @	.BB3_16
	;;
.BB3_10:
#0:	       or	r0, 0 -> r2
#1:	       br @	.BB3_18
	;;
.BB3_11:                                ; %bb5.i
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
#0:	if  c1 br @	.BB3_9
	;;
.BB3_12:                                ; %bb6.i
#0:	       ldmg.d	_impure_data    ; fflush.c:122[ fflush.c:230 ]
#1:	       ldi	-1 -> r0
	;;
#0:	       ldx	$mem, 0 -> r2   ; fflush.c:122[ fflush.c:230 ]
	;;
#0:	       brz eq @	r2, .BB3_9
	;;
.BB3_13:                                ; %bb6.i
#0:	       ldi	22 -> r0
	;;
#0:	       cmpeq	r2, r0 -> c1
	;;
#0:	if  c1 br @	.BB3_15
	;;
.BB3_14:                                ; %bb6.i
#0:	       ldi	29 -> r0
	;;
#0:	       cmpne	r2, r0 -> c1
	;;
#0:	if  c1 br @	.BB3_27
	;;
.BB3_15:                                ; %bb9.i
#0:	       ldga	_impure_data -> r2 ; fflush.c:128[ fflush.c:230 ]
#1:	       br	.BB3_36
#2:	       ldi	0 -> r0
	;;
#0:	       stm.a	r12, r2, 0      ; fflush.c:128[ fflush.c:230 ]
	;;
	       nop	0
	;;
.BB3_16:                                ; %bb13.i
#0:	       ldm.f	r10, 4          ; fflush.c:139[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r2   ; fflush.c:139[ fflush.c:230 ]
#1:	       ldm.f	r10, 48         ; fflush.c:140[ fflush.c:230 ]
	;;
#0:	       sub	r0, r2 -> r2    ; fflush.c:139[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; fflush.c:140[ fflush.c:230 ]
	;;
#0:	       brz eq @	r1, .BB3_18     ; fflush.c:140[ fflush.c:230 ]
	;;
.BB3_17:                                ; %bb14.i
#0:	       ldm.f	r10, 60         ; fflush.c:141[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; fflush.c:141[ fflush.c:230 ]
	;;
#0:	       sub	r2, r0 -> r2    ; fflush.c:141[ fflush.c:230 ]
	;;
.BB3_18:                                ; %bb15.i
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
#0:	if  c1 br @	.BB3_21
	;;
.BB3_19:                                ; %bb16.i
#0:	       ldmg.d	_impure_data    ; fflush.c:150[ fflush.c:230 ]
#1:	       ldi	29 -> r1
	;;
#0:	       ldx	$mem, 0 -> r2   ; fflush.c:150[ fflush.c:230 ]
	;;
#0:	       cmpult	r1, r2 -> c1
	;;
#0:	if  c1 br @	.BB3_27
	;;
.BB3_20:                                ; %bb16.i
#0:	       ldiu	1 -> r1
#1:	       ldi	1 -> r3
	;;
#0:	       ldim	0 -> r1
#1:	       sl	r3, r2 -> r2
	;;
#0:	       ldih	258 -> r1
	;;
#0:	       and	r2, r1 -> r2
	;;
#0:	       brz ne @	r2, .BB3_21
	;;
#0:	       brz eq @	r2, .BB3_27
	;;
.BB3_21:                                ; %bb19.i
#0:	       ldm.f	r10, 12         ; fflush.c:155[ fflush.c:230 ]
#1:	       ldiu	2047 -> r2
	;;
#0:	       ldim	30 -> r2
	;;
#0:	       ldx	$memhu, r11 -> r11 ; fflush.c:155[ fflush.c:230 ]
	;;
#0:	       and	r11, r2 -> r2   ; fflush.c:155[ fflush.c:230 ]
#1:	       btest	r11, 12 -> c1   ; fflush.c:158[ fflush.c:230 ]
	;;
#0:	       stmh.a	r2, r10, 6      ; fflush.c:155[ fflush.c:230 ]
	;;
#0:	       stm.a	0, r10, 1       ; fflush.c:156[ fflush.c:230 ]
	;;
#0:	if !c1 br	.BB3_23
#1:	       ldm.f	r10, 16         ; fflush.c:157[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r2   ; fflush.c:157[ fflush.c:230 ]
	;;
#0:	       stm.a	r2, r10, 0      ; fflush.c:157[ fflush.c:230 ]
	;;
.BB3_22:                                ; %bb20.i
#0:	       ldmg.d	_impure_data    ; fflush.c:158[ fflush.c:230 ]
#1:	       cmpne	r0, -1 -> c1
	;;
#0:	       ldx	$mem, 0 -> r2   ; fflush.c:158[ fflush.c:230 ]
	;;
#0:	       cmpeq	r2, 0 -> c2     ; fflush.c:158[ fflush.c:230 ]
	;;
#0:	       comb	or c2, c1 -> c1
	;;
#0:	if  c1 stm.a	r0, r10, 20     ; fflush.c:159[ fflush.c:230 ]
	;;
.BB3_23:                                ; %bb23.i
#0:	       ldga	_impure_data -> r2 ; fflush.c:160[ fflush.c:230 ]
#1:	       ldi	0 -> r0
	;;
#0:	       stm.a	r12, r2, 0      ; fflush.c:160[ fflush.c:230 ]
	;;
#0:	       ldm.f	r10, 48         ; fflush.c:161[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r2   ; fflush.c:161[ fflush.c:230 ]
	;;
#0:	       brz eq @	r2, .BB3_36     ; fflush.c:161[ fflush.c:230 ]
	;;
.BB3_24:                                ; %bb24.i
#0:	       s2add	r10, 16 -> r11
	;;
#0:	       cmpeq	r2, r11 -> c1   ; fflush.c:162[ fflush.c:230 ]
	;;
#0:	if  c1 br @	.BB3_26
	;;
.BB3_25:                                ; %bb25.i
#0:	       or	r2, 0 -> r0     ; fflush.c:162[ fflush.c:230 ]
#1:	       callg	__free_r        ; fflush.c:162[ fflush.c:230 ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB3_26:                                ; %bb26.i
#0:	       ldi	0 -> r0
#1:	       br @	.BB3_36
#2:	       stm.a	0, r10, 12      ; fflush.c:162[ fflush.c:230 ]
	;;
.BB3_27:                                ; %bb10.i
#0:	       ldm.f	r10, 12         ; fflush.c:131[ fflush.c:230 ]
#1:	       ldi	-1 -> r0
	;;
#0:	       br	.BB3_36
#1:	       ldx	$memhu, r11 -> r2 ; fflush.c:131[ fflush.c:230 ]
#2:	       ldi	64 -> r11
	;;
#0:	       or	r2, r11 -> r2   ; fflush.c:131[ fflush.c:230 ]
	;;
#0:	       stmh.a	r2, r10, 6      ; fflush.c:131[ fflush.c:230 ]
	;;
.BB3_28:                                ; %bb29.i
#0:	       ldm.f	r10, 16         ; fflush.c:172[ fflush.c:230 ]
#1:	       ldi	0 -> r0
	;;
#0:	       ldx	$mem, 0 -> r12  ; fflush.c:172[ fflush.c:230 ]
	;;
#0:	       brz eq @	r12, .BB3_36    ; fflush.c:172[ fflush.c:230 ]
	;;
.BB3_29:                                ; %bb31.i
#0:	       ldm.f	r10, 0          ; fflush.c:177[ fflush.c:230 ]
#1:	       and	r2, 3 -> r1     ; fflush.c:185[ fflush.c:230 ]
#2:	       ldi	0 -> r13
#3:	       ldi	0 -> r2
	;;
#0:	       brz ne @	r1, .BB3_31     ; fflush.c:185[ fflush.c:230 ]
#1:	       ldx	$mem, 0 -> r0   ; fflush.c:177[ fflush.c:230 ]
#2:	       stm.a	r12, r10, 0     ; fflush.c:184[ fflush.c:230 ]
	;;
.BB3_30:                                ; %bb32.i
#0:	       ldm.f	r10, 20         ; fflush.c:185[ fflush.c:230 ]
	;;
#0:	       ldx	$mem, 0 -> r2   ; fflush.c:185[ fflush.c:230 ]
	;;
.BB3_31:                                ; %bb34.i
#0:	       sub	r0, r12 -> r14  ; fflush.c:177[ fflush.c:230 ]
#1:	       br @	.BB3_35
#2:	       stm.a	r2, r10, 2      ; fflush.c:185[ fflush.c:230 ]
	;;
.BB3_32:                                ; %bb36.i
#0:	       ldm.f	r10, 12         ; fflush.c:192[ fflush.c:230 ]
#1:	       ldi	64 -> r12
#2:	       ldi	-1 -> r0
	;;
#0:	       br	.BB3_36
#1:	       ldx	$memhu, r11 -> r11 ; fflush.c:192[ fflush.c:230 ]
	;;
#0:	       or	r11, r12 -> r11 ; fflush.c:192[ fflush.c:230 ]
	;;
#0:	       stmh.a	r11, r10, 6     ; fflush.c:192[ fflush.c:230 ]
	;;
.BB3_33:                                ; %bb35.i
                                        ;   in Loop: Header=BB3_35 Depth=1
#0:	       ldm.f	r10, 36         ; fflush.c:189[ fflush.c:230 ]
#1:	       ldga	_impure_data -> r0 ; fflush.c:189[ fflush.c:230 ]
#2:	       or	r12, 0 -> r2    ; fflush.c:189[ fflush.c:230 ]
#3:	       or	r14, 0 -> r3    ; fflush.c:189[ fflush.c:230 ]
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
#0:	if !c1 br @	.BB3_32
	;;
.BB3_34:                                ; %bb37.i
                                        ;   in Loop: Header=BB3_35 Depth=1
#0:	       add	r12, r0 -> r12  ; fflush.c:195[ fflush.c:230 ]
#1:	       sub	r14, r0 -> r14  ; fflush.c:196[ fflush.c:230 ]
	;;
.BB3_35:                                ; %bb38.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldi	0 -> r0
	;;
#0:	       cmplt	r0, r14 -> c1   ; fflush.c:187[ fflush.c:230 ]
	;;
#0:	if  c1 br @	.BB3_33
	;;
.BB3_36:                                ; %__sflush_r.exit
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
#1:	       brz eq @	r0, .BB4_15     ; mallocr.c:2644
#2:	       sub	r15, 24 -> r15  ; mallocr.c:2644
	;;
.BB4_1:                                 ; %bb
#0:	       ldm.f	r0, -4          ; mallocr.c:2650
#1:	       ldi	-2 -> r2
#2:	       ldi	-4 -> r6
#3:	       sub	r0, 8 -> r8     ; mallocr.c:2649
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:2650
	;;
#0:	       and	r1, r2 -> r2    ; mallocr.c:2663
	;;
#0:	       sub	r2, 4 -> r3
#1:	       add	r2, r0 -> r7    ; mallocr.c:2649
	;;
#0:	       add	r0, r3 -> r4
#1:	       sub	r7, 8 -> r9     ; mallocr.c:2664
	;;
#0:	       ldm.f	r4, 0           ; mallocr.c:2665
	;;
#0:	       ldx	$mem, 0 -> r5   ; mallocr.c:2665
#1:	       ldmg.d	___malloc_av_+8 ; mallocr.c:2667
	;;
#0:	       and	r5, r6 -> r5    ; mallocr.c:2665
	;;
#0:	       ldx	$mem, 0 -> r6   ; mallocr.c:2667
	;;
#0:	       cmpne	r6, r9 -> c1    ; mallocr.c:2667
	;;
#0:	if  c1 br @	.BB4_16
	;;
.BB4_2:                                 ; %bb1
#0:	       btest	r1, 0 -> c1     ; mallocr.c:2671
#1:	       add	r5, r2 -> r2    ; mallocr.c:2669
	;;
#0:	if  c1 br @	.BB4_4
	;;
.BB4_3:                                 ; %bb2
#0:	       ldm.f	r0, -8          ; mallocr.c:2673
#1:	       ldi	-8 -> r3
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:2673
	;;
#0:	       sub	r3, r1 -> r3
#1:	       add	r1, r2 -> r2    ; mallocr.c:2675
	;;
#0:	       add	r0, r3 -> r8    ; mallocr.c:2674
	;;
#0:	       ldm.f	r8, 8           ; mallocr.c:2676
	;;
#0:	       ldx	$mem, 0 -> r3   ; mallocr.c:2676
#1:	       ldm.f	r8, 12          ; mallocr.c:2676
	;;
#0:	       ldx	$mem, 0 -> r4   ; mallocr.c:2676
	;;
#0:	       stm.a	r4, r3, 3       ; mallocr.c:2676
	;;
#0:	       stm.a	r3, r4, 2       ; mallocr.c:2676
	;;
.BB4_4:                                 ; %bb3
#0:	       ldga	131072 -> r3
#1:	       or	r2, 1 -> r1     ; mallocr.c:2679
#2:	       ldga	___malloc_av_ -> r0 ; mallocr.c:2680
	;;
#0:	       cmpult	r2, r3 -> c1    ; mallocr.c:2681
#1:	       stm.a	r1, r8, 1       ; mallocr.c:2679
	;;
#0:	if  c1 br @	.BB4_15
#1:	       stm.a	r8, r0, 2       ; mallocr.c:2680
	;;
.BB4_5:                                 ; %bb4
#0:	       ldm.f	r8, 4           ; mallocr.c:3319[ mallocr.c:2682 ]
#1:	       ldi	-4 -> r2
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:3319[ mallocr.c:2682 ]
	;;
#0:	       and	r1, r2 -> r1    ; mallocr.c:3319[ mallocr.c:2682 ]
#1:	       ldiu	0 -> r2
	;;
#0:	       sub	r1, 17 -> r3
#1:	       ldim	2046 -> r2
	;;
#0:	       and	r3, r2 -> r2
#1:	       ldga	4096 -> r3
	;;
#0:	       cmplt	r2, r3 -> c1    ; mallocr.c:3322[ mallocr.c:2682 ]
	;;
#0:	if  c1 br @	.BB4_15
	;;
.BB4_6:                                 ; %bb1.i
#0:	       ldmg.d	_heap_end.1081  ; sbrk.c:14[ sbrkr.c:60[ mallocr.c:3331[ mallocr.c:2682 ] ] ]
	;;
#0:	       ldx	$mem, 0 -> r3   ; sbrk.c:14[ sbrkr.c:60[ mallocr.c:3331[ mallocr.c:2682 ] ] ]
	;;
#0:	       brz ne @	r3, .BB4_8      ; sbrk.c:14[ sbrkr.c:60[ mallocr.c:3331[ mallocr.c:2682 ] ] ]
	;;
.BB4_7:                                 ; %bb.i.i.i
#0:	       ldga	_end -> r3      ; sbrk.c:15[ sbrkr.c:60[ mallocr.c:3331[ mallocr.c:2682 ] ] ]
#1:	       ldga	_heap_end.1081 -> r0 ; sbrk.c:15[ sbrkr.c:60[ mallocr.c:3331[ mallocr.c:2682 ] ] ]
	;;
#0:	       stm.a	r3, r0, 0       ; sbrk.c:15[ sbrkr.c:60[ mallocr.c:3331[ mallocr.c:2682 ] ] ]
	;;
.BB4_8:                                 ; %_sbrk.exit.i.i
#0:	       add	r8, r1 -> r4    ; mallocr.c:3332[ mallocr.c:2682 ]
#1:	       ldga	_heap_end.1081 -> r0 ; sbrk.c:18[ sbrkr.c:60[ mallocr.c:3331[ mallocr.c:2682 ] ] ]
	;;
#0:	       cmpne	r4, r3 -> c1    ; mallocr.c:3332[ mallocr.c:2682 ]
#1:	       stm.a	r3, r0, 0       ; sbrk.c:18[ sbrkr.c:60[ mallocr.c:3331[ mallocr.c:2682 ] ] ]
	;;
#0:	if  c1 br @	.BB4_15
	;;
.BB4_9:                                 ; %_sbrk.exit.i9.i
#0:	       cmpne	r3, -1 -> c1    ; sbrkr.c:60[ mallocr.c:3340[ mallocr.c:2682 ] ]
#1:	       sub	r3, r2 -> r0    ; sbrk.c:18[ sbrkr.c:60[ mallocr.c:3340[ mallocr.c:2682 ] ] ]
	;;
#0:	if  c1 br	.BB4_14
#2:	       ldga	_heap_end.1081 -> r2.16 ; sbrk.c:18[ sbrkr.c:60[ mallocr.c:3331[ mallocr.c:2682 ] ] ]
	;;
#2:	       stm.a	r0, r2.16, 0    ; sbrk.c:18[ sbrkr.c:60[ mallocr.c:3340[ mallocr.c:2682 ] ] ]
	;;
	       nop	0
	;;
.BB4_10:                                ; %bb4.i
#0:	       brz ne @	r0, .BB4_12     ; sbrk.c:14[ sbrkr.c:60[ mallocr.c:3345[ mallocr.c:2682 ] ] ]
	;;
.BB4_11:                                ; %bb.i.i1.i
#0:	       ldga	_end -> r0      ; sbrk.c:15[ sbrkr.c:60[ mallocr.c:3345[ mallocr.c:2682 ] ] ]
#1:	       ldga	_heap_end.1081 -> r1 ; sbrk.c:15[ sbrkr.c:60[ mallocr.c:3345[ mallocr.c:2682 ] ] ]
	;;
#0:	       stm.a	r0, r1, 0       ; sbrk.c:15[ sbrkr.c:60[ mallocr.c:3345[ mallocr.c:2682 ] ] ]
	;;
.BB4_12:                                ; %_sbrk.exit.i2.i
#0:	       sub	r0, r8 -> r1    ; mallocr.c:3346[ mallocr.c:2682 ]
#1:	       ldi	16 -> r3
#2:	       ldga	_heap_end.1081 -> r2 ; sbrk.c:18[ sbrkr.c:60[ mallocr.c:3345[ mallocr.c:2682 ] ] ]
	;;
#0:	       cmplt	r1, r3 -> c1    ; mallocr.c:3347[ mallocr.c:2682 ]
#1:	       stm.a	r0, r2, 0       ; sbrk.c:18[ sbrkr.c:60[ mallocr.c:3345[ mallocr.c:2682 ] ] ]
	;;
#0:	if  c1 br @	.BB4_15
	;;
.BB4_13:                                ; %bb5.i
#0:	       ldmg.d	___malloc_sbrk_base ; mallocr.c:3349[ mallocr.c:2682 ]
#1:	       ldga	___malloc_current_mallinfo.0 -> r3 ; mallocr.c:3349[ mallocr.c:2682 ]
#2:	       or	r1, 1 -> r1     ; mallocr.c:3350[ mallocr.c:2682 ]
#3:	       add	r15, 24 -> r15  ; mallocr.c:2722
	;;
#0:	       jop	ret             ; mallocr.c:2722
#1:	       ldx	$mem, 0 -> r2   ; mallocr.c:3349[ mallocr.c:2682 ]
	;;
#0:	       sub	r0, r2 -> r2    ; mallocr.c:3349[ mallocr.c:2682 ]
	;;
#0:	       stm.a	r2, r3, 0       ; mallocr.c:3349[ mallocr.c:2682 ]
	;;
#0:	       stm.a	r1, r8, 1       ; mallocr.c:3350[ mallocr.c:2682 ]
	;;
.BB4_14:                                ; %bb7.i
#0:	       sub	r1, r2 -> r1    ; mallocr.c:3360[ mallocr.c:2682 ]
#1:	       ldga	___malloc_current_mallinfo.0 -> r3 ; mallocr.c:3361[ mallocr.c:2682 ]
	;;
#0:	       or	r1, 1 -> r1     ; mallocr.c:3360[ mallocr.c:2682 ]
	;;
#0:	       stm.a	r1, r8, 1       ; mallocr.c:3360[ mallocr.c:2682 ]
	;;
#0:	       ldmg.d	___malloc_current_mallinfo.0 ; mallocr.c:3361[ mallocr.c:2682 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:3361[ mallocr.c:2682 ]
	;;
#0:	       sub	r1, r2 -> r1    ; mallocr.c:3361[ mallocr.c:2682 ]
	;;
#0:	       stm.a	r1, r3, 0       ; mallocr.c:3361[ mallocr.c:2682 ]
	;;
.BB4_15:                                ; %bb5
#0:	       add	r15, 24 -> r15  ; mallocr.c:2722
#1:	       jop	ret             ; mallocr.c:2722
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB4_16:                                ; %bb6
#0:	       btest	r1, 0 -> c1     ; mallocr.c:2691
#1:	       stm.a	r5, r4, 0       ; mallocr.c:2687
	;;
#0:	if !c1 br @	.BB4_18
	;;
.BB4_17:
#0:	       ldi	0 -> r1
#1:	       br @	.BB4_19
#2:	       or	r2, 0 -> r4
	;;
.BB4_18:                                ; %bb7
#1:	       ldm.f	r0, -8          ; mallocr.c:2693
#2:	       ldi	-8 -> r4
#0:	       ldga	___malloc_av_ -> r0.16 ; mallocr.c:2697
	;;
#0:	       add	r0.16, 8 -> r0.16 ; mallocr.c:2697
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:2693
	;;
#0:	       sub	r4, r1 -> r6
#1:	       add	r1, r2 -> r4    ; mallocr.c:2695
#2:	       ldi	1 -> r1
	;;
#0:	       add	r0, r6 -> r8    ; mallocr.c:2694
	;;
#0:	       ldm.f	r8, 8           ; mallocr.c:2697
	;;
#0:	       ldx	$mem, 0 -> r9   ; mallocr.c:2697
	;;
#0:	       cmpeq	r9, r0.16 -> c1 ; mallocr.c:2697
	;;
#0:	if !c1 add	r6, r0 -> r1
	;;
#0:	if !c1 ldm.f	r1, 12          ; mallocr.c:2700
#1:	if !c1 ldi	0 -> r1
	;;
#0:	if !c1 ldx	$mem, 0 -> r6   ; mallocr.c:2700
	;;
#0:	if !c1 stm.a	r6, r9, 3       ; mallocr.c:2700
	;;
#0:	if !c1 stm.a	r9, r6, 2       ; mallocr.c:2700
	;;
.BB4_19:                                ; %bb10
#0:	       add	r3, r5 -> r3
	;;
#0:	       add	r0, r3 -> r3
	;;
#0:	       ldm.f	r3, 0           ; mallocr.c:2703
	;;
#0:	       ldx	$membu, r3 -> r3 ; mallocr.c:2703
	;;
#0:	       btest	r3, 0 -> c1     ; mallocr.c:2703
	;;
#0:	if !c1 br @	.BB4_21
	;;
.BB4_20:                                ; %bb10.bb15_crit_edge
#0:	       or	r4, 1 -> r2     ; mallocr.c:2717
#1:	       brz ne	r1, .BB4_15     ; mallocr.c:2719
#2:	       add	r8, r4 -> r5    ; mallocr.c:2718
	;;
#0:	       brz eq	r1, .BB4_23     ; mallocr.c:2719
#1:	       stm.a	r2, r8, 1       ; mallocr.c:2717
	;;
#0:	       stm.a	r4, r5, 0       ; mallocr.c:2718
	;;
	       nop	0
	;;
.BB4_21:                                ; %bb11
#0:	       add	r0, r2 -> r0
#1:	       ldga	___malloc_av_ -> r2 ; mallocr.c:2707
#2:	       cmpeq	r1, 0 -> c1     ; mallocr.c:2707
#3:	       add	r4, r5 -> r4    ; mallocr.c:2705
	;;
#0:	       ldm.f	r0, 0           ; mallocr.c:2707
#1:	       add	r2, 8 -> r3     ; mallocr.c:2707
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2707
	;;
#0:	       cmpeq	r0, r3 -> c2    ; mallocr.c:2707
	;;
#0:	       comb	and c1, c2 -> c1
	;;
#0:	if  c1 br @	.BB4_41
	;;
.BB4_22:                                ; %bb15
#0:	       ldm.f	r7, 4           ; mallocr.c:2713
#1:	       or	r4, 1 -> r3     ; mallocr.c:2717
	;;
#0:	       ldx	$mem, 0 -> r2   ; mallocr.c:2713
	;;
#0:	       stm.a	r2, r0, 3       ; mallocr.c:2713
	;;
#0:	       brz ne	r1, .BB4_15     ; mallocr.c:2719
#1:	       stm.a	r0, r2, 2       ; mallocr.c:2713
#2:	       add	r8, r4 -> r0    ; mallocr.c:2718
	;;
#0:	       stm.a	r3, r8, 1       ; mallocr.c:2717
	;;
#0:	       stm.a	r4, r0, 0       ; mallocr.c:2718
	;;
.BB4_23:                                ; %bb16
#0:	       ldi	511 -> r0
	;;
#0:	       cmpult	r0, r4 -> c1    ; mallocr.c:2720
	;;
#0:	if !c1 br @	.BB4_42
	;;
.BB4_24:                                ; %bb20
#0:	       ldiu	511 -> r1
#1:	       ldiu	511 -> r0
	;;
#0:	       ldim	1 -> r1
	;;
#0:	       cmpult	r1, r4 -> c1    ; mallocr.c:2720
	;;
#0:	if  c1 br @	.BB4_26
	;;
.BB4_25:                                ; %bb21
#0:	       sr	r4, 6 -> r0     ; mallocr.c:2720
#1:	       br	.BB4_33
	;;
#0:	       s2add	r0, 14 -> r0    ; mallocr.c:2720
	;;
	       nop	0
	;;
.BB4_26:                                ; %bb22
#0:	       ldim	5 -> r0
	;;
#0:	       cmpult	r0, r4 -> c1    ; mallocr.c:2720
	;;
#0:	if  c1 br @	.BB4_28
	;;
.BB4_27:                                ; %bb23
#0:	       sr	r4, 9 -> r0     ; mallocr.c:2720
#1:	       br	.BB4_33
#2:	       ldi	91 -> r1
	;;
#0:	       add	r0, r1 -> r0    ; mallocr.c:2720
	;;
	       nop	0
	;;
.BB4_28:                                ; %bb24
#0:	       ldiu	511 -> r1
#1:	       ldiu	511 -> r0
	;;
#0:	       ldim	21 -> r1
	;;
#0:	       cmpult	r1, r4 -> c1    ; mallocr.c:2720
	;;
#0:	if  c1 br @	.BB4_30
	;;
.BB4_29:                                ; %bb25
#0:	       sr	r4, 12 -> r0    ; mallocr.c:2720
#1:	       br	.BB4_33
#2:	       ldi	110 -> r1
	;;
#0:	       add	r0, r1 -> r0    ; mallocr.c:2720
	;;
	       nop	0
	;;
.BB4_30:                                ; %bb26
#0:	       ldim	85 -> r0
	;;
#0:	       cmpult	r0, r4 -> c1    ; mallocr.c:2720
	;;
#0:	if  c1 br @	.BB4_32
	;;
.BB4_31:                                ; %bb27
#0:	       sr	r4, 15 -> r0    ; mallocr.c:2720
#1:	       br	.BB4_33
#2:	       ldi	119 -> r1
	;;
#0:	       add	r0, r1 -> r0    ; mallocr.c:2720
	;;
	       nop	0
	;;
.BB4_32:                                ; %bb28
#0:	       ldiu	511 -> r1
#1:	       ldi	126 -> r0
	;;
#0:	       ldim	341 -> r1
	;;
#0:	       cmpult	r1, r4 -> c1    ; mallocr.c:2720
	;;
#0:	if !c1 sr	r4, 18 -> r0    ; mallocr.c:2720
	;;
#0:	if !c1 s2add	r0, 31 -> r0    ; mallocr.c:2720
	;;
.BB4_33:                                ; %bb36
#0:	       ldga	___malloc_av_ -> r1
#1:	       sl	r0, 3 -> r2
	;;
#0:	       add	r1, r2 -> r2
	;;
#0:	       ldm.f	r2, 8           ; mallocr.c:2720
	;;
#0:	       ldx	$mem, 0 -> r3   ; mallocr.c:2720
	;;
#0:	       cmpne	r3, r2 -> c1    ; mallocr.c:2720
	;;
#0:	if !c1 br @	.BB4_35
	;;
.BB4_34:
#0:	       ldi	-4 -> r0
#1:	       br @	.BB4_37
	;;
.BB4_35:                                ; %bb37
#0:	       sra	r0, 31 -> r4    ; mallocr.c:2720
#1:	       ldmg.d	___malloc_av_+4 ; mallocr.c:2720
	;;
#0:	       sr	r4, 30 -> r4    ; mallocr.c:2720
	;;
#0:	       add	r0, r4 -> r0    ; mallocr.c:2720
#1:	       ldi	1 -> r4
#2:	       ldx	$mem, 0 -> r5   ; mallocr.c:2720
	;;
#0:	       sra	r0, 2 -> r0     ; mallocr.c:2720
	;;
#0:	       br	.BB4_40
#1:	       sl	r4, r0 -> r0    ; mallocr.c:2720
	;;
#0:	       or	r0, r5 -> r0    ; mallocr.c:2720
	;;
#0:	       stm.a	r0, r1, 1
	;;
.BB4_36:                                ; %bb38
                                        ;   in Loop: Header=BB4_37 Depth=1
#0:	       ldm.f	r3, 8           ; mallocr.c:2720
	;;
#0:	       ldx	$mem, 0 -> r3   ; mallocr.c:2720
	;;
.BB4_37:                                ; %bb39
                                        ; =>This Inner Loop Header: Depth=1
#0:	       cmpeq	r3, r2 -> c1    ; mallocr.c:2720
	;;
#0:	if  c1 br @	.BB4_39
	;;
.BB4_38:                                ; %bb40
                                        ;   in Loop: Header=BB4_37 Depth=1
#0:	       ldm.f	r3, 4           ; mallocr.c:2720
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:2720
	;;
#0:	       and	r1, r0 -> r1    ; mallocr.c:2720
	;;
#0:	       cmpult	r4, r1 -> c1    ; mallocr.c:2720
	;;
#0:	if  c1 br @	.BB4_36
	;;
.BB4_39:                                ; %bb41
#0:	       ldm.f	r3, 12          ; mallocr.c:2720
	;;
#0:	       ldx	$mem, 0 -> r2   ; mallocr.c:2720
	;;
.BB4_40:                                ; %bb42
#0:	       stm.a	r2, r8, 3       ; mallocr.c:2720
#1:	       add	r15, 24 -> r15  ; mallocr.c:2722
	;;
#0:	       stm.a	r3, r8, 2       ; mallocr.c:2720
	;;
#0:	       stm.a	r8, r2, 2       ; mallocr.c:2720
	;;
#0:	       stm.a	r8, r3, 3       ; mallocr.c:2720
	;;
#0:	       jop	ret             ; mallocr.c:2722
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB4_41:                                ; %bb15.thread
#0:	       stm.a	r8, r2, 5       ; mallocr.c:2710
#1:	       or	r4, 1 -> r0     ; mallocr.c:2717
#2:	       add	r8, r4 -> r1    ; mallocr.c:2718
#3:	       add	r15, 24 -> r15  ; mallocr.c:2722
	;;
#0:	       stm.a	r8, r2, 4       ; mallocr.c:2710
	;;
#0:	       stm.a	r3, r8, 3       ; mallocr.c:2710
	;;
#0:	       stm.a	r3, r8, 2       ; mallocr.c:2710
	;;
#0:	       stm.a	r0, r8, 1       ; mallocr.c:2717
	;;
#0:	       stm.a	r4, r1, 0       ; mallocr.c:2718
	;;
#0:	       jop	ret             ; mallocr.c:2722
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB4_42:                                ; %bb17
#0:	       ldmg.d	___malloc_av_+4 ; mallocr.c:2720
#1:	       ldi	1 -> r0
#2:	       sr	r4, 5 -> r1
#3:	       add	r15, 24 -> r15  ; mallocr.c:2722
	;;
#0:	       sl	r0, r1 -> r0    ; mallocr.c:2720
#1:	       ldi	-8 -> r1
	;;
#0:	       ldx	$mem, 0 -> r2   ; mallocr.c:2720
#1:	       and	r4, r1 -> r4
	;;
#0:	       or	r2, r0 -> r0    ; mallocr.c:2720
#1:	       ldga	___malloc_av_ -> r2 ; mallocr.c:2720
	;;
#0:	       stm.a	r0, r2, 1
#1:	       add	r2, r4 -> r4
	;;
#0:	       ldm.f	r4, 8           ; mallocr.c:2720
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2720
#1:	       stm.a	r4, r8, 3       ; mallocr.c:2720
	;;
#0:	       stm.a	r0, r8, 2       ; mallocr.c:2720
	;;
#0:	       stm.a	r8, r4, 2       ; mallocr.c:2720
	;;
#0:	       stm.a	r8, r0, 3       ; mallocr.c:2720
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
#0:	       ldiu	48 -> r3
#1:	       wb.s	r15, 12
#2:	       ldi	22 -> r1
#3:	       add	r0, 11 -> r2    ; mallocr.c:2348
	;;
#0:	       sub	r15, r3 -> r15
#1:	       cmpult	r1, r2 -> c1    ; mallocr.c:2348
#2:	       ldi	-8 -> r1
#3:	       ldx	$rb, 0 -> r3
	;;
#0:	       stm.s	r10, r15, 7
#1:	       ldi	16 -> r10
	;;
#0:	if  c1 and	r2, r1 -> r10
#1:	       stm.s	r11, r15, 6
	;;
#0:	       cmplt	r10, 0 -> c1    ; mallocr.c:2351
#1:	       cmpult	r10, r0 -> c2   ; mallocr.c:2351
#2:	       stm.s	r12, r15, 5
	;;
#0:	       comb	or c1, c2 -> c1
#1:	       stm.s	r3, r15, 4
#2:	       ldx	$ro, 0 -> r3
	;;
#0:	if !c1 br @	.BB5_2
#1:	       stm.s	r3, r15, 3
	;;
.BB5_1:                                 ; %bb4
#0:	       ldga	_impure_data -> r0 ; mallocr.c:2353
#1:	       br	.BB5_97
	;;
#0:	       stm.a	12, r0, 0       ; mallocr.c:2353
	;;
	       nop	0
	;;
.BB5_2:                                 ; %bb5
#0:	       ldi	503 -> r0
	;;
#0:	       cmpult	r0, r10 -> c1   ; mallocr.c:2361
	;;
#0:	if  c1 br @	.BB5_6
	;;
.BB5_3:                                 ; %bb6
#0:	       ldi	-4 -> r0
#1:	       ldga	___malloc_av_ -> r1
	;;
#0:	       and	r10, r0 -> r0
	;;
#0:	       add	r1, r0 -> r0
	;;
#0:	       ldm.f	r0, 12          ; mallocr.c:2368
	;;
#0:	       ldx	$mem, 0 -> r2   ; mallocr.c:2368
	;;
#0:	       cmpne	r2, r0 -> c1    ; mallocr.c:2372
	;;
#0:	if !c1 sr	r10, 2 -> r0
	;;
#0:	if !c1 s2add	r1, r0 -> r0
	;;
#0:	if !c1 ldm.f	r0, 20          ; mallocr.c:2375
#1:	if !c1 add	r0, 8 -> r0
	;;
#0:	if !c1 ldx	$mem, 0 -> r2   ; mallocr.c:2375
	;;
#0:	       cmpeq	r2, r0 -> c1    ; mallocr.c:2378
	;;
#0:	if  c1 br @	.BB5_5
	;;
.BB5_4:                                 ; %bb9
#0:	       ldm.f	r2, 4           ; mallocr.c:2380
#1:	       ldi	-4 -> r3
	;;
#0:	       ldx	$mem, 0 -> r10  ; mallocr.c:2380
#1:	       ldm.f	r2, 8           ; mallocr.c:2381
	;;
#0:	       add	r10, 4 -> r10
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2381
#1:	       ldm.f	r2, 12          ; mallocr.c:2381
#2:	       and	r10, r3 -> r10
	;;
#0:	       add	r2, r10 -> r10
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:2381
	;;
#0:	       stm.a	r1, r0, 3       ; mallocr.c:2381
	;;
#0:	       stm.a	r0, r1, 2       ; mallocr.c:2381
#1:	       add	r2, 8 -> r0     ; mallocr.c:2381
	;;
#0:	       ldm.f	r10, 0          ; mallocr.c:2382
	;;
#0:	       br	.BB5_98
#1:	       ldx	$mem, 0 -> r1   ; mallocr.c:2382
	;;
#0:	       or	r1, 1 -> r1     ; mallocr.c:2382
	;;
#0:	       stm.a	r1, r10, 0      ; mallocr.c:2382
	;;
.BB5_5:                                 ; %bb10
#0:	       sr	r10, 3 -> r0    ; mallocr.c:2363
#1:	       br	.BB5_24
	;;
#0:	       add	r0, 2 -> r0     ; mallocr.c:2388
	;;
	       nop	0
	;;
.BB5_6:                                 ; %bb11
#0:	       ldi	511 -> r0
	;;
#0:	       cmpult	r0, r10 -> c1   ; mallocr.c:2393
	;;
#0:	if  c1 br @	.BB5_8
	;;
.BB5_7:                                 ; %bb12
#0:	       sr	r10, 3 -> r0    ; mallocr.c:2393
#1:	       br @	.BB5_17
	;;
.BB5_8:                                 ; %bb13
#0:	       ldiu	511 -> r1
#1:	       ldiu	511 -> r0
	;;
#0:	       ldim	1 -> r1
	;;
#0:	       cmpult	r1, r10 -> c1   ; mallocr.c:2393
	;;
#0:	if  c1 br @	.BB5_10
	;;
.BB5_9:                                 ; %bb14
#0:	       sr	r10, 6 -> r0    ; mallocr.c:2393
#1:	       br	.BB5_17
	;;
#0:	       s2add	r0, 14 -> r0    ; mallocr.c:2393
	;;
	       nop	0
	;;
.BB5_10:                                ; %bb15
#0:	       ldim	5 -> r0
	;;
#0:	       cmpult	r0, r10 -> c1   ; mallocr.c:2393
	;;
#0:	if  c1 br @	.BB5_12
	;;
.BB5_11:                                ; %bb16
#0:	       sr	r10, 9 -> r0    ; mallocr.c:2393
#1:	       br	.BB5_17
#2:	       ldi	91 -> r1
	;;
#0:	       add	r0, r1 -> r0    ; mallocr.c:2393
	;;
	       nop	0
	;;
.BB5_12:                                ; %bb17
#0:	       ldiu	511 -> r1
#1:	       ldiu	511 -> r0
	;;
#0:	       ldim	21 -> r1
	;;
#0:	       cmpult	r1, r10 -> c1   ; mallocr.c:2393
	;;
#0:	if  c1 br @	.BB5_14
	;;
.BB5_13:                                ; %bb18
#0:	       sr	r10, 12 -> r0   ; mallocr.c:2393
#1:	       br	.BB5_17
#2:	       ldi	110 -> r1
	;;
#0:	       add	r0, r1 -> r0    ; mallocr.c:2393
	;;
	       nop	0
	;;
.BB5_14:                                ; %bb19
#0:	       ldim	85 -> r0
	;;
#0:	       cmpult	r0, r10 -> c1   ; mallocr.c:2393
	;;
#0:	if  c1 br @	.BB5_16
	;;
.BB5_15:                                ; %bb20
#0:	       sr	r10, 15 -> r0   ; mallocr.c:2393
#1:	       br	.BB5_17
#2:	       ldi	119 -> r1
	;;
#0:	       add	r0, r1 -> r0    ; mallocr.c:2393
	;;
	       nop	0
	;;
.BB5_16:                                ; %bb21
#0:	       ldiu	511 -> r1
#1:	       ldi	126 -> r0
	;;
#0:	       ldim	341 -> r1
	;;
#0:	       cmpult	r1, r10 -> c1   ; mallocr.c:2393
	;;
#0:	if !c1 sr	r10, 18 -> r0   ; mallocr.c:2393
	;;
#0:	if !c1 s2add	r0, 31 -> r0    ; mallocr.c:2393
	;;
.BB5_17:                                ; %bb29
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
.BB5_18:                                ; %bb35
                                        ; =>This Inner Loop Header: Depth=1
#0:	       or	r2, 0 -> r5
	;;
#0:	       cmpne	r5, r1 -> c1    ; mallocr.c:2396
	;;
#0:	if !c1 br @	.BB5_23
	;;
.BB5_19:                                ; %bb30
                                        ;   in Loop: Header=BB5_18 Depth=1
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
#0:	if !c1 br @	.BB5_22
	;;
.BB5_20:                                ; %bb32
                                        ;   in Loop: Header=BB5_18 Depth=1
#0:	       cmplt	r7, 0 -> c1     ; mallocr.c:2407
#1:	       ldm.f	r5, 12          ; mallocr.c:2409
	;;
#0:	if  c1 br @	.BB5_18
#1:	       ldx	$mem, 0 -> r2   ; mallocr.c:2409
	;;
.BB5_21:                                ; %bb33
#0:	       ldm.f	r5, 8           ; mallocr.c:2409
#1:	       add	r6, r5 -> r1    ; mallocr.c:2409
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2409
	;;
#0:	       stm.a	r2, r0, 3       ; mallocr.c:2409
	;;
#0:	       stm.a	r0, r2, 2       ; mallocr.c:2409
#1:	       add	r5, 8 -> r0     ; mallocr.c:2409
	;;
#0:	       ldm.f	r1, 4           ; mallocr.c:2410
	;;
#0:	       br	.BB5_98
#1:	       ldx	$mem, 0 -> r2   ; mallocr.c:2410
	;;
#0:	       or	r2, 1 -> r2     ; mallocr.c:2410
	;;
#0:	       stm.a	r2, r1, 1       ; mallocr.c:2444
	;;
.BB5_22:                                ; %bb31
#0:	       sub	r0, 1 -> r0
	;;
.BB5_23:                                ; %bb36
#0:	       add	r0, 1 -> r0     ; mallocr.c:2417
	;;
.BB5_24:                                ; %bb37
#0:	       ldmg.d	___malloc_av_+16 ; mallocr.c:2423
#1:	       ldga	___malloc_av_ -> r1 ; mallocr.c:2423
	;;
#0:	       add	r1, 8 -> r1     ; mallocr.c:2423
	;;
#0:	       ldx	$mem, 0 -> r2   ; mallocr.c:2423
	;;
#0:	       cmpeq	r2, r1 -> c1    ; mallocr.c:2423
	;;
#0:	if  c1 br @	.BB5_50
	;;
.BB5_25:                                ; %bb38
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
#0:	if  c1 br @	.BB5_27
	;;
.BB5_26:                                ; %bb39
#0:	       or	r10, 1 -> r0    ; mallocr.c:2431
#1:	       ldga	___malloc_av_ -> r1 ; mallocr.c:2432
#2:	       add	r2, r10 -> r5   ; mallocr.c:2430
	;;
#0:	       stm.a	r0, r2, 1       ; mallocr.c:2431
#1:	       add	r1, 8 -> r0     ; mallocr.c:2432
	;;
#0:	       stm.a	r5, r1, 5       ; mallocr.c:2432
	;;
#0:	       stm.a	r5, r1, 4       ; mallocr.c:2432
#1:	       or	r10, 4 -> r1
#2:	       or	r4, 1 -> r10    ; mallocr.c:2433
	;;
#0:	       stm.a	r0, r5, 3       ; mallocr.c:2432
#1:	       add	r2, r1 -> r1
	;;
#0:	       br	.BB5_98
#1:	       stm.a	r0, r5, 2       ; mallocr.c:2432
#2:	       add	r2, r3 -> r0    ; mallocr.c:2434
	;;
#0:	       stm.a	r10, r1, 0      ; mallocr.c:2433
	;;
#0:	       stm.a	r4, r0, 0       ; mallocr.c:2434
#1:	       add	r2, 8 -> r0
	;;
.BB5_27:                                ; %bb40
#0:	       cmplt	r4, 0 -> c1     ; mallocr.c:2442
#2:	       ldga	___malloc_av_ -> r2.16 ; mallocr.c:2440
	;;
#0:	if  c1 br	.BB5_29
#2:	       add	r2.16, 8 -> r5  ; mallocr.c:2440
	;;
#2:	       stm.a	r5, r2.16, 5    ; mallocr.c:2440
	;;
#2:	       stm.a	r5, r2.16, 4    ; mallocr.c:2440
	;;
.BB5_28:                                ; %bb41
#0:	       add	r3, r2 -> r1    ; mallocr.c:2444
#1:	       add	r2, 8 -> r0
	;;
#0:	       ldm.f	r1, 4           ; mallocr.c:2444
	;;
#0:	       br	.BB5_98
#1:	       ldx	$mem, 0 -> r3   ; mallocr.c:2444
	;;
#0:	       or	r3, 1 -> r2     ; mallocr.c:2444
	;;
#0:	       stm.a	r2, r1, 1       ; mallocr.c:2444
	;;
.BB5_29:                                ; %bb42
#0:	       ldi	511 -> r4
	;;
#0:	       cmpult	r4, r3 -> c1    ; mallocr.c:2452
	;;
#0:	if  c1 br @	.BB5_31
	;;
.BB5_30:                                ; %bb43
#0:	       ldmg.d	___malloc_av_+4 ; mallocr.c:2452
#1:	       ldi	1 -> r3
#2:	       sr	r1, 5 -> r4
	;;
#0:	       sl	r3, r4 -> r3    ; mallocr.c:2452
#1:	       ldi	-8 -> r4
	;;
#0:	       ldx	$mem, 0 -> r5   ; mallocr.c:2452
#2:	       ldga	___malloc_av_ -> r2.16 ; mallocr.c:2452
#1:	       and	r1, r4 -> r1
	;;
#0:	       or	r5, r3 -> r3    ; mallocr.c:2452
#2:	       add	r2.16, r1 -> r1
	;;
#2:	       stm.a	r3, r2.16, 1
	;;
#0:	       ldm.f	r1, 8           ; mallocr.c:2452
	;;
#0:	       ldx	$mem, 0 -> r3   ; mallocr.c:2452
#1:	       stm.a	r1, r2, 3       ; mallocr.c:2452
	;;
#0:	       br	.BB5_50
#1:	       stm.a	r3, r2, 2       ; mallocr.c:2452
	;;
#0:	       stm.a	r2, r1, 2       ; mallocr.c:2452
	;;
#0:	       stm.a	r2, r3, 3       ; mallocr.c:2452
	;;
.BB5_31:                                ; %bb44
#0:	       cmpult	r4, r1 -> c1    ; mallocr.c:2452
	;;
#0:	if  c1 br @	.BB5_33
	;;
.BB5_32:                                ; %bb45
#0:	       sr	r1, 3 -> r4     ; mallocr.c:2452
#1:	       br @	.BB5_42
	;;
.BB5_33:                                ; %bb46
#0:	       ldiu	511 -> r5
#1:	       ldiu	511 -> r4
	;;
#0:	       ldim	1 -> r5
	;;
#0:	       cmpult	r5, r1 -> c1    ; mallocr.c:2452
	;;
#0:	if  c1 br @	.BB5_35
	;;
.BB5_34:                                ; %bb47
#0:	       sr	r1, 6 -> r4     ; mallocr.c:2452
#1:	       br	.BB5_42
	;;
#0:	       s2add	r4, 14 -> r4    ; mallocr.c:2452
	;;
	       nop	0
	;;
.BB5_35:                                ; %bb48
#0:	       ldim	5 -> r4
	;;
#0:	       cmpult	r4, r1 -> c1    ; mallocr.c:2452
	;;
#0:	if  c1 br @	.BB5_37
	;;
.BB5_36:                                ; %bb49
#0:	       sr	r1, 9 -> r1     ; mallocr.c:2452
#1:	       br	.BB5_42
#2:	       ldi	91 -> r4
	;;
#0:	       add	r1, r4 -> r4    ; mallocr.c:2452
	;;
	       nop	0
	;;
.BB5_37:                                ; %bb50
#0:	       ldiu	511 -> r5
#1:	       ldiu	511 -> r4
	;;
#0:	       ldim	21 -> r5
	;;
#0:	       cmpult	r5, r1 -> c1    ; mallocr.c:2452
	;;
#0:	if  c1 br @	.BB5_39
	;;
.BB5_38:                                ; %bb51
#0:	       sr	r1, 12 -> r4    ; mallocr.c:2452
#1:	       br	.BB5_42
#2:	       ldi	110 -> r1
	;;
#0:	       add	r4, r1 -> r4    ; mallocr.c:2452
	;;
	       nop	0
	;;
.BB5_39:                                ; %bb52
#0:	       ldim	85 -> r4
	;;
#0:	       cmpult	r4, r1 -> c1    ; mallocr.c:2452
	;;
#0:	if  c1 br @	.BB5_41
	;;
.BB5_40:                                ; %bb53
#0:	       sr	r1, 15 -> r1    ; mallocr.c:2452
#1:	       br	.BB5_42
#2:	       ldi	119 -> r4
	;;
#0:	       add	r1, r4 -> r4    ; mallocr.c:2452
	;;
	       nop	0
	;;
.BB5_41:                                ; %bb54
#0:	       ldiu	511 -> r5
#1:	       ldi	126 -> r4
	;;
#0:	       ldim	341 -> r5
	;;
#0:	       cmpult	r5, r1 -> c1    ; mallocr.c:2452
	;;
#0:	if !c1 sr	r1, 18 -> r4    ; mallocr.c:2452
	;;
#0:	if !c1 s2add	r4, 31 -> r4    ; mallocr.c:2452
	;;
.BB5_42:                                ; %bb62
#0:	       ldga	___malloc_av_ -> r1
#1:	       sl	r4, 3 -> r5
	;;
#0:	       add	r1, r5 -> r5
	;;
#0:	       ldm.f	r5, 8           ; mallocr.c:2452
	;;
#0:	       ldx	$mem, 0 -> r6   ; mallocr.c:2452
	;;
#0:	       cmpne	r6, r5 -> c1    ; mallocr.c:2452
	;;
#0:	if !c1 br @	.BB5_44
	;;
.BB5_43:
#0:	       ldi	-4 -> r1
#1:	       br @	.BB5_46
	;;
.BB5_44:                                ; %bb63
#0:	       sra	r4, 31 -> r3    ; mallocr.c:2452
#1:	       ldmg.d	___malloc_av_+4 ; mallocr.c:2452
	;;
#0:	       sr	r3, 30 -> r3    ; mallocr.c:2452
	;;
#0:	       add	r4, r3 -> r3    ; mallocr.c:2452
#1:	       ldi	1 -> r4
#2:	       ldx	$mem, 0 -> r7   ; mallocr.c:2452
	;;
#0:	       sra	r3, 2 -> r3     ; mallocr.c:2452
	;;
#0:	       br	.BB5_49
#1:	       sl	r4, r3 -> r3    ; mallocr.c:2452
	;;
#0:	       or	r3, r7 -> r3    ; mallocr.c:2452
	;;
#0:	       stm.a	r3, r1, 1
	;;
.BB5_45:                                ; %bb64
                                        ;   in Loop: Header=BB5_46 Depth=1
#0:	       ldm.f	r6, 8           ; mallocr.c:2452
	;;
#0:	       ldx	$mem, 0 -> r6   ; mallocr.c:2452
	;;
.BB5_46:                                ; %bb65
                                        ; =>This Inner Loop Header: Depth=1
#0:	       cmpeq	r6, r5 -> c1    ; mallocr.c:2452
	;;
#0:	if  c1 br @	.BB5_48
	;;
.BB5_47:                                ; %bb66
                                        ;   in Loop: Header=BB5_46 Depth=1
#0:	       ldm.f	r6, 4           ; mallocr.c:2452
	;;
#0:	       ldx	$mem, 0 -> r4   ; mallocr.c:2452
	;;
#0:	       and	r4, r1 -> r4    ; mallocr.c:2452
	;;
#0:	       cmpult	r3, r4 -> c1    ; mallocr.c:2452
	;;
#0:	if  c1 br @	.BB5_45
	;;
.BB5_48:                                ; %bb67
#0:	       ldm.f	r6, 12          ; mallocr.c:2452
	;;
#0:	       ldx	$mem, 0 -> r5   ; mallocr.c:2452
	;;
.BB5_49:                                ; %bb68
#0:	       stm.a	r5, r2, 3       ; mallocr.c:2452
	;;
#0:	       stm.a	r6, r2, 2       ; mallocr.c:2452
	;;
#0:	       stm.a	r2, r5, 2       ; mallocr.c:2452
	;;
#0:	       stm.a	r2, r6, 3       ; mallocr.c:2452
	;;
.BB5_50:                                ; %bb69
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
#0:	if  c1 br @	.BB5_69
	;;
.BB5_51:                                ; %bb70
#0:	       or	r2, 0 -> r4
#1:	       and	r2, r1 -> r3    ; mallocr.c:2465
	;;
#0:	       brz ne @	r3, .BB5_54     ; mallocr.c:2465
	;;
.BB5_52:                                ; %bb71
#0:	       add	r0, 4 -> r0
#1:	       ldi	-4 -> r4
#2:	       sl	r1, 1 -> r1
	;;
#0:	       and	r0, r4 -> r0
#1:	       or	r2, 0 -> r4
#2:	       and	r1, r2 -> r3    ; mallocr.c:2470
	;;
#0:	       brz ne @	r3, .BB5_54     ; mallocr.c:2470
	;;
.BB5_53:                                ; %bb72
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sl	r1, 1 -> r1
#1:	       add	r0, 4 -> r0
#2:	       or	r2, 0 -> r4
	;;
#0:	       and	r1, r2 -> r3    ; mallocr.c:2470
	;;
#0:	       brz eq @	r3, .BB5_53     ; mallocr.c:2470
	;;
.BB5_54:                                ; %bb74
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB5_68 Depth 2
                                        ;     Child Loop BB5_63 Depth 2
                                        ;     Child Loop BB5_55 Depth 2
                                        ;       Child Loop BB5_56 Depth 3
#0:	       ldga	___malloc_av_ -> r3
#1:	       sl	r0, 3 -> r5
#2:	       add	r0, 1 -> r6
#3:	       ldi	-4 -> r7
	;;
#0:	       add	r3, r5 -> r3
#1:	       ldi	16 -> r8
	;;
.BB5_55:                                ; %bb75
                                        ;   Parent Loop BB5_54 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB5_56 Depth 3
#0:	       or	r3, 0 -> r9
	;;
.BB5_56:                                ; %bb81
                                        ;   Parent Loop BB5_54 Depth=1
                                        ;     Parent Loop BB5_55 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
#0:	       ldm.f	r9, 12
	;;
#0:	       ldx	$mem, 0 -> r9
	;;
#0:	       cmpne	r3, r9 -> c1    ; mallocr.c:2488
	;;
#0:	if !c1 br @	.BB5_61
	;;
.BB5_57:                                ; %bb76
                                        ;   in Loop: Header=BB5_56 Depth=3
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
#0:	if !c1 br @	.BB5_60
	;;
.BB5_58:                                ; %bb78
                                        ;   in Loop: Header=BB5_56 Depth=3
#0:	       cmplt	r12, 0 -> c1    ; mallocr.c:2506
	;;
#0:	if  c1 br @	.BB5_56
	;;
.BB5_59:                                ; %bb79
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
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:2509
#1:	       ldm.f	r9, 12          ; mallocr.c:2509
	;;
#0:	       br	.BB5_98
#1:	       ldx	$mem, 0 -> r2   ; mallocr.c:2509
	;;
#0:	       stm.a	r2, r1, 3       ; mallocr.c:2509
	;;
#0:	       stm.a	r1, r2, 2       ; mallocr.c:2509
	;;
.BB5_60:                                ; %bb77
#0:	       or	r10, 1 -> r0    ; mallocr.c:2496
#1:	       ldga	___malloc_av_ -> r2 ; mallocr.c:2498
#2:	       add	r9, r10 -> r3   ; mallocr.c:2495
	;;
#0:	       stm.a	r0, r9, 1       ; mallocr.c:2496
	;;
#0:	       ldm.f	r9, 8           ; mallocr.c:2497
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2497
#1:	       ldm.f	r9, 12          ; mallocr.c:2497
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:2497
	;;
#0:	       stm.a	r1, r0, 3       ; mallocr.c:2497
	;;
#0:	       stm.a	r0, r1, 2       ; mallocr.c:2497
#1:	       add	r2, 8 -> r0     ; mallocr.c:2498
#2:	       or	r10, 4 -> r1
	;;
#0:	       stm.a	r3, r2, 5       ; mallocr.c:2498
#1:	       add	r9, r1 -> r1
	;;
#0:	       stm.a	r3, r2, 4       ; mallocr.c:2498
#1:	       or	r12, 1 -> r2    ; mallocr.c:2499
	;;
#0:	       stm.a	r0, r3, 3       ; mallocr.c:2498
	;;
#0:	       br	.BB5_98
#1:	       stm.a	r0, r3, 2       ; mallocr.c:2498
#2:	       add	r9, r11 -> r0   ; mallocr.c:2500
	;;
#0:	       stm.a	r2, r1, 0       ; mallocr.c:2499
	;;
#0:	       stm.a	r12, r0, 0      ; mallocr.c:2500
#1:	       add	r9, 8 -> r0     ; mallocr.c:2497
	;;
.BB5_61:                                ; %bb82
                                        ;   in Loop: Header=BB5_55 Depth=2
#1:	       add	r6, 1 -> r9
#0:	       and	r6, 3 -> r0.16  ; mallocr.c:2526
#2:	       add	r3, 8 -> r3
	;;
#0:	       brz ne @	r0.16, .BB5_55  ; mallocr.c:2526
#1:	       or	r9, 0 -> r6
	;;
.BB5_62:                                ; %bb83.loopexit
                                        ;   in Loop: Header=BB5_54 Depth=1
#0:	       sub	r9, 1 -> r3
#1:	       ldga	___malloc_av_ -> r1.16
	;;
.BB5_63:                                ; %bb83
                                        ;   Parent Loop BB5_54 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       and	r0, 3 -> r6     ; mallocr.c:2532
	;;
#0:	       brz ne @	r6, .BB5_65     ; mallocr.c:2532
	;;
.BB5_64:                                ; %bb84
                                        ;   in Loop: Header=BB5_54 Depth=1
#0:	       xor	r1, -1 -> r0    ; mallocr.c:2534
#1:	       br	.BB5_66
	;;
#0:	       and	r4, r0 -> r2    ; mallocr.c:2534
#1:	       ldga	___malloc_av_ -> r0
	;;
#0:	       stm.a	r2, r0, 1
#1:	       or	r2, 0 -> r4
	;;
.BB5_65:                                ; %bb86
                                        ;   in Loop: Header=BB5_63 Depth=2
#0:	       sl	r0, 3 -> r6
#1:	       sub	r5, 8 -> r5
#2:	       sub	r0, 1 -> r0
	;;
#1:	       add	r1.16, r6 -> r6
	;;
#0:	       ldm.f	r6, 0           ; mallocr.c:2539
#1:	       add	r1.16, r5 -> r7
	;;
#0:	       ldx	$mem, 0 -> r6   ; mallocr.c:2539
	;;
#0:	       cmpeq	r7, r6 -> c1    ; mallocr.c:2539
	;;
#0:	if  c1 br @	.BB5_63
	;;
.BB5_66:                                ; %bb87
                                        ;   in Loop: Header=BB5_54 Depth=1
#0:	       sl	r1, 1 -> r1     ; mallocr.c:2543
	;;
#0:	       cmpult	r4, r1 -> c1    ; mallocr.c:2543
#1:	       cmpeq	r1, 0 -> c2     ; mallocr.c:2543
	;;
#0:	       comb	or c1, c2 -> c1
	;;
#0:	if  c1 br @	.BB5_69
	;;
.BB5_67:                                ; %bb90.preheader
                                        ;   in Loop: Header=BB5_54 Depth=1
#0:	       or	r3, 0 -> r0
#1:	       and	r4, r1 -> r5    ; mallocr.c:2545
	;;
#0:	       brz ne @	r5, .BB5_54     ; mallocr.c:2545
	;;
.BB5_68:                                ; %bb89
                                        ;   Parent Loop BB5_54 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       add	r3, 4 -> r0
#1:	       sl	r1, 1 -> r1     ; mallocr.c:2548
#2:	       or	r2, 0 -> r4
	;;
#0:	       or	r0, 0 -> r3
#1:	       and	r1, r2 -> r5    ; mallocr.c:2545
	;;
#0:	       brz ne @	r5, .BB5_54     ; mallocr.c:2545
	;;
#0:	       brz eq @	r5, .BB5_68     ; mallocr.c:2545
	;;
.BB5_69:                                ; %bb91
#0:	       ldmg.d	___malloc_av_+8 ; mallocr.c:2560
#1:	       ldi	-4 -> r1
#2:	       ldi	16 -> r3
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2560
	;;
#0:	       ldm.f	r0, 4           ; mallocr.c:2560
	;;
#0:	       ldx	$mem, 0 -> r2   ; mallocr.c:2560
	;;
#0:	       and	r2, r1 -> r1    ; mallocr.c:2560
	;;
#0:	       sub	r1, r10 -> r2   ; mallocr.c:2560
#1:	       cmpult	r1, r10 -> c1   ; mallocr.c:2561
	;;
#0:	       cmplt	r2, r3 -> c2
	;;
#0:	       comb	or c1, c2 -> c1
	;;
#0:	if !c1 br @	.BB5_99
	;;
.BB5_70:                                ; %bb93
#0:	       ldmg.d	___malloc_sbrk_base ; mallocr.c:2162[ mallocr.c:2575 ]
	;;
#0:	       ldx	$mem, 0 -> r2   ; mallocr.c:2162[ mallocr.c:2575 ]
	;;
#0:	       cmpeq	r2, -1 -> c1    ; mallocr.c:2162[ mallocr.c:2575 ]
#1:	       stm.s	r2, r15, 2      ; mallocr.c:2162[ mallocr.c:2575 ]
	;;
#0:	if !c1 br @	.BB5_72
	;;
.BB5_71:
#0:	       add	r10, 16 -> r2   ; mallocr.c:2155[ mallocr.c:2575 ]
#1:	       br @	.BB5_73
	;;
.BB5_72:                                ; %bb.i
#0:	       ldiu	15 -> r2
#1:	       ldiu	0 -> r3
	;;
#0:	       ldim	2 -> r2
#1:	       ldim	2046 -> r3
	;;
#0:	       add	r10, r2 -> r2
	;;
#0:	       and	r2, r3 -> r2    ; mallocr.c:2163[ mallocr.c:2575 ]
	;;
.BB5_73:                                ; %bb1.i
#0:	       ldmg.d	_heap_end.1081  ; sbrk.c:14[ sbrkr.c:60[ mallocr.c:2165[ mallocr.c:2575 ] ] ]
	;;
#0:	       ldx	$mem, 0 -> r3   ; sbrk.c:14[ sbrkr.c:60[ mallocr.c:2165[ mallocr.c:2575 ] ] ]
	;;
#0:	       brz ne @	r3, .BB5_75     ; sbrk.c:14[ sbrkr.c:60[ mallocr.c:2165[ mallocr.c:2575 ] ] ]
	;;
.BB5_74:                                ; %bb.i.i
#1:	       ldga	_end -> r3      ; sbrk.c:15[ sbrkr.c:60[ mallocr.c:2165[ mallocr.c:2575 ] ] ]
#0:	       ldga	_heap_end.1081 -> r0.16 ; sbrk.c:15[ sbrkr.c:60[ mallocr.c:2165[ mallocr.c:2575 ] ] ]
	;;
#0:	       stm.a	r3, r0.16, 0    ; sbrk.c:15[ sbrkr.c:60[ mallocr.c:2165[ mallocr.c:2575 ] ] ]
	;;
.BB5_75:                                ; %_sbrk.exit.i
#0:	       cmpeq	r3, -1 -> c1    ; sbrkr.c:60[ mallocr.c:2165[ mallocr.c:2575 ] ]
#1:	       add	r3, r2 -> r1.16 ; sbrk.c:18[ sbrkr.c:60[ mallocr.c:2165[ mallocr.c:2575 ] ] ]
	;;
#0:	if  c1 br	.BB5_96
#1:	       ldga	_heap_end.1081 -> r1.17 ; sbrk.c:18[ sbrkr.c:60[ mallocr.c:2165[ mallocr.c:2575 ] ] ]
	;;
#1:	       stm.a	r1.16, r1.17, 0 ; sbrk.c:18[ sbrkr.c:60[ mallocr.c:2165[ mallocr.c:2575 ] ] ]
	;;
	       nop	0
	;;
.BB5_76:                                ; %bb2.i
#0:	       add	r0, r1 -> r4    ; mallocr.c:2151[ mallocr.c:2575 ]
	;;
#3:	       ldga	___malloc_av_ -> r3.16 ; mallocr.c:2168[ mallocr.c:2575 ]
#0:	       cmpule	r4, r3 -> c1
	;;
#3:	       cmpeq	r0, r3.16 -> c2 ; mallocr.c:2168[ mallocr.c:2575 ]
	;;
#0:	       comb	or c1, c2 -> c1
	;;
#0:	if !c1 br @	.BB5_96
	;;
.BB5_77:                                ; %bb4.i
#0:	       ldmg.d	___malloc_current_mallinfo.0 ; mallocr.c:2172[ mallocr.c:2575 ]
#1:	       cmpne	r3, r4 -> c1    ; mallocr.c:2174[ mallocr.c:2575 ]
	;;
#2:	       ldga	___malloc_current_mallinfo.0 -> r2.16 ; mallocr.c:2172[ mallocr.c:2575 ]
	;;
#0:	if  c1 br	.BB5_80
#1:	       ldx	$mem, 0 -> r5   ; mallocr.c:2172[ mallocr.c:2575 ]
	;;
#0:	       add	r5, r2 -> r5    ; mallocr.c:2172[ mallocr.c:2575 ]
	;;
#2:	       stm.a	r5, r2.16, 0    ; mallocr.c:2172[ mallocr.c:2575 ]
	;;
.BB5_78:                                ; %bb5.i
#0:	       ldiu	2047 -> r6
	;;
#0:	       ldim	1 -> r6
	;;
#0:	       and	r4, r6 -> r6    ; mallocr.c:2174[ mallocr.c:2575 ]
	;;
#0:	       brz ne @	r6, .BB5_80     ; mallocr.c:2174[ mallocr.c:2575 ]
	;;
.BB5_79:                                ; %bb6.i
#0:	       add	r2, r1 -> r2    ; mallocr.c:2178[ mallocr.c:2575 ]
#1:	       br	.BB5_92
	;;
#0:	       or	r2, 1 -> r2     ; mallocr.c:2179[ mallocr.c:2575 ]
	;;
#0:	       stm.a	r2, r0, 1       ; mallocr.c:2179[ mallocr.c:2575 ]
	;;
.BB5_80:                                ; %bb7.i
#0:	       ldm.s	r15, 8          ; mallocr.c:2183[ mallocr.c:2575 ]
	;;
#0:	       ldx	$mem, 0 -> r6   ; mallocr.c:2183[ mallocr.c:2575 ]
	;;
#0:	       cmpne	r6, -1 -> c1    ; mallocr.c:2183[ mallocr.c:2575 ]
	;;
#0:	if  c1 br @	.BB5_82
	;;
.BB5_81:                                ; %bb8.i
#0:	       ldga	___malloc_sbrk_base -> r0.16 ; mallocr.c:2184[ mallocr.c:2575 ]
#1:	       br	.BB5_83
	;;
#0:	       stm.a	r3, r0.16, 0    ; mallocr.c:2184[ mallocr.c:2575 ]
	;;
	       nop	0
	;;
.BB5_82:                                ; %bb9.i
#0:	       sub	r3, r4 -> r4
	;;
#0:	       add	r5, r4 -> r5    ; mallocr.c:2186[ mallocr.c:2575 ]
	;;
#3:	       ldga	___malloc_current_mallinfo.0 -> r3.16 ; mallocr.c:2186[ mallocr.c:2575 ]
	;;
#3:	       stm.a	r5, r3.16, 0    ; mallocr.c:2186[ mallocr.c:2575 ]
	;;
.BB5_83:                                ; %bb10.i
#0:	       add	r3, 8 -> r4     ; mallocr.c:2189[ mallocr.c:2575 ]
#1:	       ldi	0 -> r6
	;;
#0:	       and	r4, 7 -> r4     ; mallocr.c:2189[ mallocr.c:2575 ]
	;;
#0:	       brz eq @	r4, .BB5_85     ; mallocr.c:2190[ mallocr.c:2575 ]
	;;
.BB5_84:                                ; %bb11.i
#0:	       ldi	8 -> r6
	;;
#0:	       sub	r6, r4 -> r6    ; mallocr.c:2192[ mallocr.c:2575 ]
	;;
#0:	       add	r3, r6 -> r3    ; mallocr.c:2193[ mallocr.c:2575 ]
	;;
.BB5_85:                                ; %bb13.i
#1:	       brz ne @	r1.16, .BB5_87  ; sbrk.c:14[ sbrkr.c:60[ mallocr.c:2202[ mallocr.c:2575 ] ] ]
	;;
.BB5_86:                                ; %bb.i.i4
#1:	       ldga	_end -> r1.16   ; sbrk.c:15[ sbrkr.c:60[ mallocr.c:2202[ mallocr.c:2575 ] ] ]
	;;
#1:	       ldga	_heap_end.1081 -> r1.17 ; sbrk.c:15[ sbrkr.c:60[ mallocr.c:2202[ mallocr.c:2575 ] ] ]
	;;
#1:	       stm.a	r1.16, r1.17, 0 ; sbrk.c:15[ sbrkr.c:60[ mallocr.c:2202[ mallocr.c:2575 ] ] ]
	;;
.BB5_87:                                ; %_sbrk.exit.i5
#2:	       ldiu	2047 -> r4
#3:	       add	r3, r2 -> r2    ; mallocr.c:2199[ mallocr.c:2575 ]
#0:	       ldga	4096 -> r0.16
#1:	       cmpeq	r1.16, -1 -> c1 ; sbrkr.c:60[ mallocr.c:2202[ mallocr.c:2575 ] ]
	;;
#0:	       ldim	1 -> r4
#2:	       ldga	_heap_end.1081 -> r2.16 ; sbrk.c:18[ sbrkr.c:60[ mallocr.c:2202[ mallocr.c:2575 ] ] ]
	;;
#0:	       and	r2, r4 -> r2    ; mallocr.c:2199[ mallocr.c:2575 ]
#1:	       ldi	0 -> r4
	;;
#0:	       sub	r0.16, r2 -> r2 ; mallocr.c:2199[ mallocr.c:2575 ]
#3:	       ldga	___malloc_av_ -> r3.17
	;;
#0:	       add	r2, r6 -> r2    ; mallocr.c:2199[ mallocr.c:2575 ]
	;;
#0:	       or	r2, 0 -> r6
#1:	       add	r1.16, r2 -> r2 ; sbrk.c:18[ sbrkr.c:60[ mallocr.c:2202[ mallocr.c:2575 ] ] ]
	;;
#0:	if  c1 or	r4, 0 -> r6
#1:	if  c1 or	r3, 0 -> r1.16
#2:	       stm.a	r2, r2.16, 0    ; sbrk.c:18[ sbrkr.c:60[ mallocr.c:2202[ mallocr.c:2575 ] ] ]
	;;
#3:	       cmpeq	r0, r3.17 -> c1
#0:	       sub	r6, r3 -> r4
#1:	       add	r6, r5 -> r5    ; mallocr.c:2210[ mallocr.c:2575 ]
	;;
#3:	       ldga	___malloc_current_mallinfo.0 -> r3.16 ; mallocr.c:2210[ mallocr.c:2575 ]
#1:	       add	r4, r1.16 -> r2 ; mallocr.c:2213[ mallocr.c:2575 ]
	;;
#0:	if  c1 br	.BB5_92
#3:	       stm.a	r5, r3.16, 0    ; mallocr.c:2210[ mallocr.c:2575 ]
#1:	       or	r2, 1 -> r2     ; mallocr.c:2214[ mallocr.c:2575 ]
	;;
#3:	       stm.a	r3, r3.17, 2    ; mallocr.c:2212[ mallocr.c:2575 ]
	;;
#0:	       stm.a	r2, r3, 1       ; mallocr.c:2214[ mallocr.c:2575 ]
	;;
.BB5_88:                                ; %bb16.i
#0:	       ldi	15 -> r2
	;;
#0:	       cmpult	r2, r1 -> c1    ; mallocr.c:2223[ mallocr.c:2575 ]
	;;
#0:	if  c1 br @	.BB5_90
	;;
.BB5_89:                                ; %bb17.i
#0:	       ldmg.d	___malloc_av_+8 ; mallocr.c:2225[ mallocr.c:2575 ]
#1:	       br	.BB5_96
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2225[ mallocr.c:2575 ]
	;;
#0:	       stm.a	1, r0, 1        ; mallocr.c:2225[ mallocr.c:2575 ]
	;;
.BB5_90:                                ; %bb18.i
#0:	       ldm.f	r0, 4           ; mallocr.c:2231[ mallocr.c:2575 ]
#1:	       sub	r1, 12 -> r1
#2:	       ldi	-8 -> r3
	;;
#0:	       and	r1, r3 -> r3    ; mallocr.c:2230[ mallocr.c:2575 ]
#1:	       or	r1, 4 -> r1
	;;
#0:	       ldx	$mem, 0 -> r2   ; mallocr.c:2231[ mallocr.c:2575 ]
#1:	       cmpult	r3, 16 -> c1    ; mallocr.c:2237[ mallocr.c:2575 ]
#2:	       add	r0, r1 -> r1
	;;
#0:	       and	r2, 1 -> r2     ; mallocr.c:2231[ mallocr.c:2575 ]
	;;
#0:	       or	r2, r3 -> r2    ; mallocr.c:2231[ mallocr.c:2575 ]
	;;
#0:	if  c1 br	.BB5_92
#1:	       stm.a	r2, r0, 1       ; mallocr.c:2231[ mallocr.c:2575 ]
	;;
#0:	       stm.a	5, r1, 0        ; mallocr.c:2232[ mallocr.c:2575 ]
	;;
#0:	       stm.a	5, r1, 1        ; mallocr.c:2234[ mallocr.c:2575 ]
	;;
.BB5_91:                                ; %bb19.i
#0:	       add	r0, 8 -> r0
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
#0:	       ldx	$mem, 0 -> r5
	;;
.BB5_92:                                ; %bb20.i
#0:	       ldmg.d	___malloc_max_sbrked_mem ; mallocr.c:2242[ mallocr.c:2575 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2242[ mallocr.c:2575 ]
	;;
#0:	       cmpule	r5, r0 -> c1    ; mallocr.c:2242[ mallocr.c:2575 ]
	;;
#0:	if  c1 br @	.BB5_94
	;;
.BB5_93:                                ; %bb21.i
#0:	       ldga	___malloc_max_sbrked_mem -> r0 ; mallocr.c:2243[ mallocr.c:2575 ]
	;;
#0:	       stm.a	r5, r0, 0       ; mallocr.c:2243[ mallocr.c:2575 ]
	;;
.BB5_94:                                ; %bb22.i
#0:	       ldmg.d	___malloc_max_total_mem ; mallocr.c:2248[ mallocr.c:2575 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2248[ mallocr.c:2575 ]
	;;
#0:	       cmpule	r5, r0 -> c1    ; mallocr.c:2248[ mallocr.c:2575 ]
	;;
#0:	if  c1 br @	.BB5_96
	;;
.BB5_95:                                ; %bb23.i
#0:	       ldga	___malloc_max_total_mem -> r0 ; mallocr.c:2249[ mallocr.c:2575 ]
	;;
#0:	       stm.a	r5, r0, 0       ; mallocr.c:2249[ mallocr.c:2575 ]
	;;
.BB5_96:                                ; %malloc_extend_top.exit
#0:	       ldmg.d	___malloc_av_+8 ; mallocr.c:2576
#1:	       ldi	-4 -> r2
#2:	       ldi	16 -> r3
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2576
	;;
#0:	       ldm.f	r0, 4           ; mallocr.c:2576
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:2576
	;;
#0:	       and	r1, r2 -> r1    ; mallocr.c:2576
	;;
#0:	       sub	r1, r10 -> r2   ; mallocr.c:2576
#1:	       cmpult	r1, r10 -> c1   ; mallocr.c:2577
	;;
#0:	       cmplt	r2, r3 -> c2
	;;
#0:	       comb	or c1, c2 -> c1
	;;
#0:	if !c1 br @	.BB5_99
	;;
.BB5_97:                                ; %bb95
#0:	       ldi	0 -> r0
	;;
.BB5_98:                                ; %bb95
#0:	       ldm.s	r15, 12         ; mallocr.c:2590
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:2590
	;;
#0:	       stx	r1 -> $ro       ; mallocr.c:2590
	;;
#0:	       ldm.s	r15, 16         ; mallocr.c:2590
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:2590
	;;
#0:	       stx	r1 -> $rb       ; mallocr.c:2590
	;;
#0:	       ldm.s	r15, 20         ; mallocr.c:2590
	;;
#0:	       ldx	$mem, 0 -> r12  ; mallocr.c:2590
	;;
#0:	       ldm.s	r15, 24         ; mallocr.c:2590
	;;
#0:	       ldx	$mem, 0 -> r11  ; mallocr.c:2590
	;;
#0:	       ldm.s	r15, 28         ; mallocr.c:2590
#1:	       s2add	r15, 12 -> r15  ; mallocr.c:2590
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
.BB5_99:                                ; %bb96
#0:	       or	r10, 1 -> r1    ; mallocr.c:2585
#1:	       or	r10, 4 -> r3
#2:	       add	r0, r10 -> r4   ; mallocr.c:2586
	;;
#0:	       stm.a	r1, r0, 1       ; mallocr.c:2585
#2:	       ldga	___malloc_av_ -> r2.16 ; mallocr.c:2586
#1:	       or	r2, 1 -> r1     ; mallocr.c:2587
#3:	       add	r0, r3 -> r2
	;;
#0:	       br	.BB5_98
#2:	       stm.a	r4, r2.16, 2    ; mallocr.c:2586
#1:	       add	r0, 8 -> r0
	;;
#0:	       stm.a	r1, r2, 0       ; mallocr.c:2587
	;;
	       nop	0
	;;
	.align	4
__malloc_r_end:

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
#1:	       add	r0, r1 -> r10   ; fwalk.c:47[ findfp.c:165 ]
	;;
#0:	       stm.s	r11, r15, 6
	;;
#0:	       stm.s	r12, r15, 5
	;;
#0:	       brz eq	r10, .BB6_21    ; fwalk.c:47[ findfp.c:165 ]
#1:	       stm.s	r13, r15, 4
	;;
#0:	       stm.s	r2, r15, 3
#1:	       ldx	$ro, 0 -> r2
	;;
#0:	       stm.s	r2, r15, 2
	;;
.BB6_1:                                 ; %bb.i
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB6_3 Depth 2
#0:	       ldm.f	r10, 4          ; fwalk.c:48[ findfp.c:165 ]
	;;
#0:	       ldx	$mem, 0 -> r11  ; fwalk.c:48[ findfp.c:165 ]
	;;
#0:	       cmplt	r11, 1 -> c1    ; fwalk.c:48[ findfp.c:165 ]
	;;
#0:	if  c1 br @	.BB6_20
	;;
.BB6_2:                                 ; %bb.nph.i
                                        ;   in Loop: Header=BB6_1 Depth=1
#0:	       ldm.f	r10, 8          ; fwalk.c:48[ findfp.c:165 ]
	;;
#0:	       ldx	$mem, 0 -> r12  ; fwalk.c:48[ findfp.c:165 ]
	;;
.BB6_3:                                 ; %bb1.i
                                        ;   Parent Loop BB6_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r12, 12         ; fwalk.c:49[ findfp.c:165 ]
#1:	       add	r12, 12 -> r13
	;;
#0:	       ldx	$memhu, r13 -> r0 ; fwalk.c:49[ findfp.c:165 ]
	;;
#0:	       cmpult	r0, 2 -> c1     ; fwalk.c:49[ findfp.c:165 ]
	;;
#0:	if  c1 br @	.BB6_19
	;;
.BB6_4:                                 ; %bb3.i
                                        ;   in Loop: Header=BB6_3 Depth=2
#0:	       ldm.f	r12, 14         ; fwalk.c:51[ findfp.c:165 ]
#1:	       add	r12, 14 -> r1
#2:	       ldiu	2047 -> r2
#3:	       cmpeq	r12, 0 -> c2    ; fclose.c:74[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	       ldim	31 -> r2
	;;
#0:	       ldx	$memhu, r1 -> r1 ; fwalk.c:51[ findfp.c:165 ]
	;;
#0:	       cmpeq	r1, r2 -> c1    ; fwalk.c:51[ findfp.c:165 ]
	;;
#0:	       comb	or c1, c2 -> c1
	;;
#0:	if  c1 br @	.BB6_19
	;;
.BB6_5:                                 ; %bb1.i.i.i
                                        ;   in Loop: Header=BB6_3 Depth=2
#0:	       ldmg.d	_impure_data+56 ; fclose.c:77[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; fclose.c:77[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	       brz ne @	r1, .BB6_7      ; fclose.c:77[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
.BB6_6:                                 ; %bb3.i.i.i
                                        ;   in Loop: Header=BB6_3 Depth=2
#0:	       callg	___sinit        ; fclose.c:77[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldm.f	r12, 12
	;;
#0:	       ldx	$memhu, r13 -> r0
	;;
.BB6_7:                                 ; %bb4.i.i.i
                                        ;   in Loop: Header=BB6_3 Depth=2
#0:	       bbh	zext16 r0 -> r0 ; fclose.c:81[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	       brz eq @	r0, .BB6_19     ; fclose.c:81[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
.BB6_8:                                 ; %bb6.i.i.i
                                        ;   in Loop: Header=BB6_3 Depth=2
#0:	       or	r12, 0 -> r0    ; fclose.c:89[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
#1:	       callg	__fflush_r      ; fclose.c:89[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldm.f	r12, 44         ; fclose.c:90[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	       ldx	$mem, 0 -> r2   ; fclose.c:90[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	       brz eq @	r2, .BB6_10     ; fclose.c:90[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
.BB6_9:                                 ; %bb7.i.i.i
                                        ;   in Loop: Header=BB6_3 Depth=2
#0:	       ldm.f	r12, 28         ; fclose.c:90[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
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
.BB6_10:                                ; %bb9.i.i.i
                                        ;   in Loop: Header=BB6_3 Depth=2
#0:	       ldm.f	r12, 12
	;;
#0:	       ldx	$memhu, r13 -> r0
	;;
#0:	       btest	r0, 7 -> c1     ; fclose.c:92[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	if !c1 br @	.BB6_12
	;;
.BB6_11:                                ; %bb10.i.i.i
                                        ;   in Loop: Header=BB6_3 Depth=2
#0:	       ldm.f	r12, 16         ; fclose.c:93[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
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
.BB6_12:                                ; %bb11.i.i.i
                                        ;   in Loop: Header=BB6_3 Depth=2
#0:	       ldm.f	r12, 48         ; fclose.c:94[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; fclose.c:94[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	       brz eq @	r0, .BB6_16     ; fclose.c:94[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
.BB6_13:                                ; %bb12.i.i.i
                                        ;   in Loop: Header=BB6_3 Depth=2
#0:	       s2add	r12, 16 -> r1
	;;
#0:	       cmpeq	r1, r0 -> c1    ; fclose.c:95[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	if  c1 br @	.BB6_15
	;;
.BB6_14:                                ; %bb13.i.i.i
                                        ;   in Loop: Header=BB6_3 Depth=2
#0:	       callg	__free_r        ; fclose.c:95[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB6_15:                                ; %bb14.i.i.i
                                        ;   in Loop: Header=BB6_3 Depth=2
#0:	       stm.a	0, r12, 12      ; fclose.c:95[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
.BB6_16:                                ; %bb15.i.i.i
                                        ;   in Loop: Header=BB6_3 Depth=2
#0:	       ldm.f	r12, 68         ; fclose.c:96[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; fclose.c:96[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
#0:	       brz eq @	r0, .BB6_18     ; fclose.c:96[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
.BB6_17:                                ; %bb16.i.i.i
                                        ;   in Loop: Header=BB6_3 Depth=2
#0:	       callg	__free_r        ; fclose.c:97[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       stm.a	0, r12, 17      ; fclose.c:97[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
.BB6_18:                                ; %bb17.i.i.i
                                        ;   in Loop: Header=BB6_3 Depth=2
#0:	       stmh.a	0, r12, 6       ; fclose.c:99[ fclose.c:116[ fwalk.c:52[ findfp.c:165 ] ] ]
	;;
.BB6_19:                                ; %bb5.i
                                        ;   in Loop: Header=BB6_3 Depth=2
#0:	       sub	r11, 1 -> r11
#1:	       s2add	r12, 26 -> r12
	;;
#0:	       brz ne @	r11, .BB6_3     ; fwalk.c:48[ findfp.c:165 ]
	;;
.BB6_20:                                ; %bb7.i
                                        ;   in Loop: Header=BB6_1 Depth=1
#0:	       ldm.f	r10, 0          ; fwalk.c:47[ findfp.c:165 ]
	;;
#0:	       ldx	$mem, 0 -> r10  ; fwalk.c:47[ findfp.c:165 ]
	;;
#0:	       brz ne @	r10, .BB6_1     ; fwalk.c:47[ findfp.c:165 ]
	;;
.BB6_21:                                ; %_fwalk.exit
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
#0:	       brz eq @	r0, .BB7_2      ; findfp.c:187
	;;
.BB7_1:                                 ; %bb
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
.BB7_2:                                 ; %bb1
#0:	       ldga	_impure_data -> r0 ; findfp.c:194
#1:	       ldga	__cleanup_r -> r1 ; findfp.c:194
#2:	       ldi	736 -> r2
#3:	       ldi	748 -> r3
	;;
#0:	       stm.a	r1, r0, 15      ; findfp.c:194
#1:	       ldi	740 -> r1
#2:	       add	r0, r2 -> r2    ; findfp.c:197
#3:	       ldi	744 -> r4
	;;
#0:	       stm.a	1, r0, 14       ; findfp.c:195
#1:	       add	r0, r1 -> r1    ; findfp.c:199
	;;
#0:	       stm.a	0, r2, 0        ; findfp.c:197
#1:	       add	r0, r3 -> r2    ; findfp.c:200
#2:	       add	r0, r4 -> r0    ; findfp.c:200
	;;
#0:	       stm.a	3, r1, 0        ; findfp.c:199
	;;
#0:	       stm.a	r2, r0, 0       ; findfp.c:200
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
#2:	       ldga	___swrite -> r1
#3:	       ldga	___sseek -> r2
	;;
#0:	       stm.a	r0, r10, 8
#1:	       ldga	___sclose -> r3
#2:	       ldi	18 -> r11
	;;
#0:	       stm.a	r1, r10, 9
	;;
#0:	       stm.a	r2, r10, 10
	;;
#0:	       stm.a	r3, r10, 11
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
#2:	       ldga	___swrite -> r1
#3:	       ldga	___sseek -> r2
	;;
#0:	       stm.a	r0, r10, 8
#1:	       ldga	___sclose -> r3
	;;
#0:	       stm.a	r1, r10, 9
	;;
#0:	       stm.a	r2, r10, 10
	;;
#0:	       stm.a	r3, r10, 11
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
#2:	       ldga	___swrite -> r1
#3:	       ldga	___sseek -> r2
	;;
#0:	       stm.a	r0, r10, 8
#1:	       ldga	___sclose -> r3
	;;
#0:	       br	.BB7_1
#1:	       stm.a	r1, r10, 9
	;;
#0:	       stm.a	r2, r10, 10
	;;
#0:	       stm.a	r3, r10, 11
	;;
	.align	4
___sinit_end:

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
#0:	       brz ne @	r4, .BB8_9
	;;
.BB8_1:                                 ; %bb3.preheader.i.i
#0:	       ldi	0 -> r0
	;;
#0:	       cmplt	r0, r3 -> c1
	;;
#0:	if !c1 br @	.BB8_7
	;;
.BB8_2:
#0:	       ldi	-120 -> r0
#1:	       ldi	-116 -> r4
#2:	       or	r3, 0 -> r5
	;;
.BB8_3:                                 ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB8_4 Depth 2
#0:	       or	r2, 0 -> r6
	;;
.BB8_4:                                 ; %bb1.i.i
                                        ;   Parent Loop BB8_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.b	r0, 0
	;;
#0:	       ldx	$membu, r0 -> r2
	;;
#0:	       btest	r2, 1 -> c1
	;;
#0:	if !c1 br @	.BB8_4
	;;
.BB8_5:                                 ; %bb2.i.i
                                        ;   in Loop: Header=BB8_3 Depth=1
#0:	       ldm.b	r4, 0
#1:	       sub	r5, 1 -> r5
#2:	       add	r6, 1 -> r2
	;;
#0:	       brz eq	r5, .BB8_7
#1:	       ldx	$membu, r4 -> r7
	;;
#0:	       stmb.a	r7, r6, 0
	;;
	       nop	0
	;;
.BB8_6:                                 ; %bb1.preheader.i.i
                                        ;   in Loop: Header=BB8_3 Depth=1
#0:	       br @	.BB8_3
	;;
.BB8_7:                                 ; %_read.exit.i
#0:	       ldi	-1 -> r0
	;;
#0:	       cmplt	r0, r3 -> c1
	;;
#0:	if !c1 br @	.BB8_10
	;;
.BB8_8:                                 ; %bb
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
.BB8_9:                                 ; %_read_r.exit.thread
#0:	       ldi	88 -> r2
#1:	       ldi	-1 -> r3
	;;
#0:	       stm.a	r2, r0, 0       ; readr.c:59[ stdio.c:48 ]
	;;
.BB8_10:                                ; %bb1
#0:	       ldm.f	r1, 12          ; stdio.c:60
#1:	       or	r3, 0 -> r0
#2:	       add	r1, 12 -> r2
#3:	       ldiu	2047 -> r3
	;;
#0:	       ldim	29 -> r3
#1:	       add	r15, 24 -> r15  ; stdio.c:61
	;;
#0:	       jop	ret             ; stdio.c:61
#1:	       ldx	$memhu, r2 -> r2 ; stdio.c:60
	;;
#0:	       and	r2, r3 -> r2    ; stdio.c:60
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
#1:	       add	r15, 24 -> r15  ; stdio.c:135
	;;
#0:	       jop	ret             ; stdio.c:135
#1:	       ldx	$memhu, r2 -> r1 ; stdio.c:135
#2:	       ldi	0 -> r2
	;;
#0:	       cmpult	r1, 3 -> c1
	;;
#0:	if !c1 ldi	88 -> r1
#1:	if !c1 ldi	-1 -> r2
	;;
#0:	if !c1 stm.a	r1, r0, 0       ; closer.c:54[ stdio.c:135 ]
#1:	       or	r2, 0 -> r0
	;;
	.align	4
___sclose_end:

	.align	4
___sseek:                               ; @__sseek
	.size	___sseek_end-___sseek
___sseek_start:
; BB#0:                                 ; %bb
#0:	       wb.s	r15, 6
#1:	       ldi	88 -> r2
#2:	       add	r1, 12 -> r3
#3:	       sub	r15, 24 -> r15
	;;
#0:	       stm.a	r2, r0, 0       ; lseekr.c:59[ stdio.c:117 ]
#1:	       ldiu	2047 -> r0
#2:	       add	r15, 24 -> r15  ; stdio.c:125
	;;
#0:	       ldm.f	r1, 12          ; stdio.c:119
#1:	       ldim	29 -> r0
	;;
#0:	       jop	ret             ; stdio.c:125
#1:	       ldx	$memhu, r3 -> r2 ; stdio.c:119
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
#0:	if  c1 ldi	88 -> r4
#1:	if  c1 add	r1, 12 -> r5
	;;
#0:	if  c1 stm.a	r4, r0, 0       ; lseekr.c:59[ stdio.c:89 ]
	;;
#0:	if  c1 ldm.f	r1, 12
	;;
#0:	if  c1 ldx	$memhu, r5 -> r4
#1:	       ldiu	2047 -> r5
	;;
#0:	       ldim	29 -> r5
	;;
#0:	       and	r4, r5 -> r4    ; stdio.c:90
#1:	       add	r1, 14 -> r5
	;;
#0:	       stmh.a	r4, r1, 6       ; stdio.c:90
#1:	       ldi	1 -> r4
	;;
#0:	       ldm.f	r1, 14          ; stdio.c:97
	;;
#0:	       ldx	$memhs, r5 -> r1 ; stdio.c:97
	;;
#0:	       sub	r1, 1 -> r1
	;;
#0:	       cmpult	r4, r1 -> c1
	;;
#0:	if  c1 br @	.BB11_6
	;;
.BB11_1:                                ; %bb3.preheader.i.i
#0:	       ldi	0 -> r0
	;;
#0:	       cmplt	r0, r3 -> c1
	;;
#0:	if !c1 br @	.BB11_5
	;;
.BB11_2:
#0:	       ldi	-120 -> r1
#1:	       ldi	-116 -> r4
	;;
.BB11_3:                                ; %bb1.i.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.b	r1, 0
	;;
#0:	       ldx	$membu, r1 -> r5
	;;
#0:	       btest	r5, 0 -> c1
	;;
#0:	if !c1 br @	.BB11_3
	;;
.BB11_4:                                ; %bb2.i.i
                                        ;   in Loop: Header=BB11_3 Depth=1
#0:	       add	r2, r0 -> r5
#1:	       add	r0, 1 -> r0
	;;
#0:	       cmpeq	r3, r0 -> c1
#1:	       ldm.f	r5, 0
	;;
#0:	if !c1 br	.BB11_3
#1:	       ldx	$membu, r5 -> r5
	;;
#0:	       stmb.a	r5, r4, 0
	;;
	       nop	0
	;;
.BB11_5:
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
.BB11_6:                                ; %bb1.i2
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

	.section	.rodata,"a",@progbits
	.align	4                       ; @.str
._.str:
	.ascii	 "Hello, World!\000"

	.align	4                       ; @.str5
._.str5:
	.ascii	 "\n\000"

	.align	4                       ; @.str8
._.str8:
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
	.long	._.str8
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
	.local	_heap_end.1081          ; @heap_end.1081
                                        ; @heap_end.1081
	.comm	_heap_end.1081,4,4
