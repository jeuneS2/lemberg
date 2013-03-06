	.file	"helloworld.opt.bc"
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
	.globl	_main
	.type	_main,@function
_main:                                  ; @main
	.funsz	_main_end-_main
_main_start:
; BB#0:
#3:	       ldga	._.str+8 -> r3.16
#0:	       ldga	._.str+12 -> r0.16
#1:	       wb.s	r15, 42
#2:	       addi	-168 -> r15
	;;
#0:	       ldiu	128 -> r0
#1:	       ldx	$rb, 0 -> r2
#2:	       ldx	$ro, 0 -> r3
	;;
#0:	       add	r15, r0 -> r0
	;;
#0:	       stm.s	r10, r0, 5
	;;
#0:	       stm.s	r11, r0, 4
	;;
#0:	       stm.s	r12, r0, 3
	;;
#0:	       stm.s	r13, r0, 2
	;;
#0:	       stm.s	r14, r0, 1
	;;
#0:	       stm.s	r0.23, r0, 0
#1:	       ldga	._.str -> r0
	;;
#1:	       stm.s	r1.23, r15, 31
#0:	       and	r0, 3 -> r1
#2:	       add	r0, 5 -> r14
#3:	       add	r0, 7 -> r9
	;;
#2:	       stm.s	r2.23, r15, 30
#0:	       cmp eq	r1, 0 -> c2
#1:	       add	r0, 1 -> r1
#3:	       and	r14, 3 -> r14
	;;
#3:	       stm.s	r3.23, r15, 29
#0:	       and	r1, 3 -> r1
#1:	       and	r9, 3 -> r9
#2:	       add	r0, 9 -> r6
	;;
#0:	       stm.s	r0.24, r15, 28
#1:	       cmp eq	r1, 0 -> c1
#2:	       add	r0, 2 -> r1
#3:	       add	r0, 10 -> r5
	;;
#1:	       stm.s	r1.24, r15, 27
#0:	       and	r1, 3 -> r1
#2:	       and	r6, 3 -> r6
#3:	       add	r0, 11 -> r4
	;;
#2:	       stm.s	r2.24, r15, 26
#0:	       and	r5, 3 -> r5
#1:	       and	r4, 3 -> r4
	;;
#3:	       stm.s	r3.24, r15, 25
	;;
#2:	       stm.s	r2.25, r15, 24
	;;
#3:	       stm.s	r3.25, r15, 23
	;;
#2:	       stm.s	r2.26, r15, 22
	;;
#3:	       stm.s	r3.26, r15, 21
	;;
#2:	       stm.s	r2.27, r15, 20
	;;
#2:	       stm.s	r2.28, r15, 19
	;;
#2:	       stm.s	r2.29, r15, 18
	;;
#0:	       stm.s	r2, r15, 17
#1:	       add	r0, 13 -> r2
	;;
#0:	       stm.s	r3, r15, 16
#1:	       ldx	$c2, 0 -> r3
#2:	       comb	or c2, c1 -> c2
#3:	       cmp eq	r1, 0 -> c1
	;;
#0:	       add	r0, 3 -> r1
#1:	       ldx	$c2, 0 -> r7
#2:	       comb	or c2, c1 -> c2
#3:	       stm.s	r3, r15, 11
	;;
#0:	       and	r1, 3 -> r1
#1:	       stm.s	r7, r15, 10
#2:	       ldx	$c2, 0 -> r8
#3:	       add	r0, 6 -> r3
	;;
#0:	       cmp eq	r1, 0 -> c1
#1:	       ldga	._.str+4 -> r1
#2:	       stm.s	r8, r15, 8
#3:	       and	r3, 3 -> r7
	;;
#3:	       and	r3.16, 3 -> r8
#0:	       and	r0.16, 3 -> r3
#1:	       and	r1, 3 -> r1
#2:	       comb	or c2, c1 -> c2
	;;
#0:	       cmp eq	r1, 0 -> c1
#1:	       ldx	$c2, 0 -> r10
#2:	       cmp eq	r8, 0 -> c3
	;;
#0:	       comb	or c2, c1 -> c2
#1:	       cmp eq	r14, 0 -> c1
#2:	       stm.s	r10, r15, 9
	;;
#0:	       ldx	$c2, 0 -> r1
#1:	       comb	or c2, c1 -> c2
#2:	       cmp eq	r7, 0 -> c1
	;;
#0:	       stm.s	r1, r15, 7
#1:	       ldx	$c2, 0 -> r10
#2:	       comb	or c2, c1 -> c2
#3:	       cmp eq	r9, 0 -> c1
	;;
#0:	       ldx	$c2, 0 -> r7
#1:	       comb	or c2, c1 -> c2
#2:	       stm.s	r10, r15, 6
#3:	       cmp eq	r5, 0 -> c1
	;;
#0:	       stm.s	r7, r15, 5
#1:	       ldx	$c2, 0 -> r7
#2:	       comb	or c2, c3 -> c3
#3:	       cmp eq	r6, 0 -> c2
	;;
#0:	       comb	or c3, c2 -> c2
#1:	       stm.s	r7, r15, 3
#2:	       and	r2, 3 -> r1
	;;
#0:	       ldx	$c2, 0 -> r7
#1:	       comb	or c2, c1 -> c2
#2:	       cmp eq	r4, 0 -> c1
	;;
#0:	       ldx	$c2, 0 -> r8
#1:	       comb	or c2, c1 -> c2
#2:	       cmp eq	r3, 0 -> c1
#3:	       stm.s	r7, r15, 4
	;;
#0:	       ldx	$c2, 0 -> r9
#1:	       comb	or c2, c1 -> c2
#2:	       cmp eq	r1, 0 -> c1
#3:	       stm.s	r8, r15, 1
	;;
#0:	       comb	or c2, c1 -> c1
#1:	       stm.s	r9, r15, 2
	;;
#0:	if !c1 br @	.BB0_6
	;;
.BB0_1:
#0:	       ldm.s	r15, 44
#1:	       or	r0, 0 -> r1
#2:	       ldiu	1791 -> r2
#3:	       ldga	32896 -> r3
	;;
#0:	       ldim	991 -> r2
#1:	       ldih	1028 -> r3
	;;
#0:	       stx	r31 -> $c1
#1:	       ldm.s	r15, 40
#2:	       ldih	2039 -> r2
	;;
#0:	if !c1 add	r1, 1 -> r1 ; aiaf
	;;
#0:	       stx	r31 -> $c1
#1:	       ldm.s	r15, 32
	;;
#0:	if !c1 add	r0, 2 -> r1 ; aiaf
	;;
#0:	       stx	r31 -> $c1
#1:	       ldm.s	r15, 36
	;;
#0:	if !c1 add	r0, 3 -> r1 ; aiaf
	;;
#0:	       stx	r31 -> $c1
#1:	       ldm.s	r15, 28
	;;
#0:	if !c1 add	r0, 4 -> r1 ; aiaf
	;;
#0:	       stx	r31 -> $c1
#1:	       ldm.s	r15, 24
	;;
#0:	if !c1 add	r0, 5 -> r1 ; aiaf
	;;
#0:	       stx	r31 -> $c1
#1:	       ldm.s	r15, 20
	;;
#0:	if !c1 add	r0, 6 -> r1 ; aiaf
	;;
#0:	       stx	r31 -> $c1
#1:	       ldm.s	r15, 12
	;;
#0:	if !c1 add	r0, 7 -> r1 ; aiaf
	;;
#0:	       stx	r31 -> $c1
#1:	       ldm.s	r15, 16
	;;
#0:	if !c1 add	r0, 8 -> r1 ; aiaf
	;;
#0:	if !c3 add	r0, 9 -> r1 ; aiaf
#1:	       stx	r31 -> $c3
#2:	       ldm.s	r15, 4
	;;
#0:	if !c3 add	r0, 10 -> r1 ; aiaf
	;;
#0:	       stx	r31 -> $c3
#1:	       ldm.s	r15, 8
	;;
#0:	if !c3 add	r0, 11 -> r1 ; aiaf
	;;
#0:	       stx	r31 -> $c3
	;;
#0:	if !c3 add	r0, 12 -> r1 ; aiaf
	;;
#0:	if !c2 add	r0, 13 -> r1 ; aiaf
	;;
#0:	       ldm.f	r1, 0
	;;
#0:	       and	r31, r3 -> r5
#1:	       add	r31, r2 -> r4
	;;
#0:	       xor	r5, r3 -> r5
	;;
#0:	       and	r5, r4 -> r4
	;;
#0:	       brz ne @	r4, .BB0_3
	;;
.BB0_2:                                 ; %.lr.ph5.i.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r1, 4
#1:	       add	r1, 4 -> r1
	;;
#0:	       and	r31, r3 -> r5
#1:	       add	r31, r2 -> r4
	;;
#0:	       xor	r5, r3 -> r5
	;;
#0:	       and	r5, r4 -> r4
	;;
#0:	       brz eq @	r4, .BB0_2
	;;
.BB0_3:                                 ; %._crit_edge6.i.i
#0:	       ldm.f	r1, 0
	;;
#0:	       bbh	mzext8 r1 -> r2
	;;
#0:	       brz eq @	r2, .BB0_5
	;;
.BB0_4:                                 ; %.lr.ph.i.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r1, 1
#1:	       add	r1, 1 -> r2
	;;
#0:	       or	r2, 0 -> r1
	;;
#0:	       bbh	mzext8 r2 -> r3
	;;
#0:	       brz ne @	r3, .BB0_4
	;;
#0:	       brz eq @	r3, .BB0_6
	;;
.BB0_5:
#0:	       or	r1, 0 -> r2
	;;
.BB0_6:                                 ; %strlen.exit.i
#0:	       s2add	r15, 8 -> r1
#1:	       stm.a	r0, r15, 12
#2:	       sub	r2, r0 -> r0
#3:	       ldga	._.str9 -> r3
	;;
#0:	       add	r1, 16 -> r10
#1:	       ldmg.d	_impure_data+8
#2:	       add	r0, 1 -> r13
	;;
#0:	       or	r10, 4 -> r1
	;;
#3:	       or	r31, 0 -> r3.26
#0:	       stm.a	r0, r1, 0
	;;
#0:	       stm.a	r3, r15, 14
	;;
#0:	       stm.a	1, r15, 15
	;;
#3:	       ldm.f	r3.26, 12
	;;
#3:	       bbh	mzext16 r3.26 -> r1
	;;
#0:	       btest	r1, 13 -> c1
	;;
#0:	if  c1 br @	.BB0_8
	;;
.BB0_7:
#0:	       ldga	8192 -> r0
	;;
#0:	       or	r1, r0 -> r1
#1:	       ldiu	2047 -> r0
	;;
#3:	       stmh.a	r1, r3.26, 6
#0:	       ldim	2043 -> r0
	;;
#3:	       ldm.f	r3.26, 100
	;;
#0:	       and	r31, r0 -> r0
	;;
#3:	       stm.a	r0, r3.26, 25
	;;
.BB0_8:                                 ; %_puts_r.exit.i
#0:	       cmp eq	r13, 0 -> c3
	;;
#0:	if  c3 br @	.BB0_294
	;;
.BB0_9:
#0:	       btest	r1, 3 -> !c1
	;;
#0:	if  c1 br @	.BB0_11
	;;
.BB0_10:
#3:	       ldm.f	r3.26, 16
	;;
#0:	       cmp ne	r31, 0 -> c3
	;;
#0:	if  c3 br @	.BB0_38
	;;
.BB0_11:
#0:	       ldmg.d	_impure_data+56
	;;
#0:	       brz ne @	r31, .BB0_13
	;;
.BB0_12:
#0:	       callg	___sinit
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#3:	       ldm.f	r3.26, 12
	;;
#3:	       bbh	mzext16 r3.26 -> r1
	;;
.BB0_13:
#0:	       bbh	sext16 r1 -> r0
	;;
#0:	       btest	r0, 3 -> c1
	;;
#0:	if  c1 br @	.BB0_22
	;;
.BB0_14:
#0:	       btest	r0, 4 -> !c1
	;;
#0:	if  c1 br @	.BB0_37
	;;
.BB0_15:
#0:	       btest	r0, 2 -> !c1
	;;
#0:	if  c1 br @	.BB0_21
	;;
.BB0_16:
#3:	       ldm.f	r3.26, 48
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       brz eq @	r0, .BB0_20
	;;
.BB0_17:
#3:	       s2add	r3.26, 16 -> r2
	;;
#0:	       cmp eq	r0, r2 -> c1
	;;
#0:	if  c1 br @	.BB0_19
	;;
.BB0_18:
#0:	       callg	__free_r
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#3:	       ldm.f	r3.26, 12
	;;
#3:	       bbh	mzext16 r3.26 -> r1
	;;
.BB0_19:
#3:	       stm.a	0, r3.26, 12
	;;
.BB0_20:                                ; %._crit_edge
#0:	       ldiu	2011 -> r0
	;;
#0:	       ldim	31 -> r0
	;;
#0:	       and	r1, r0 -> r1
	;;
#3:	       stmh.a	r1, r3.26, 6
	;;
#3:	       stm.a	0, r3.26, 1
	;;
#3:	       ldm.f	r3.26, 16
	;;
#3:	       stm.a	r31, r3.26, 0
	;;
.BB0_21:
#0:	       or	r1, 8 -> r1
	;;
#3:	       stmh.a	r1, r3.26, 6
	;;
.BB0_22:                                ; %._crit_edge.i.i.i
#3:	       ldm.f	r3.26, 16
	;;
#0:	       brz ne @	r31, .BB0_32
	;;
.BB0_23:
#0:	       ldi	640 -> r0
#1:	       ldi	512 -> r2
	;;
#0:	       and	r1, r0 -> r0
	;;
#0:	       cmp eq	r0, r2 -> c1
	;;
#0:	if  c1 br @	.BB0_32
	;;
.BB0_24:
#0:	       btest	r1, 1 -> !c1
	;;
#0:	if !c1 br @	.BB0_31
	;;
.BB0_25:
#3:	       ldm.f	r3.26, 14
	;;
#3:	       add	r3.26, 2 -> r0
	;;
#0:	       bbh	msext16 r0 -> r0
	;;
#0:	       brz lt @	r0, .BB0_27
	;;
.BB0_26:                                ; %_fstat_r.exit.i.i.i.i
#0:	       ldga	_errno.b -> r0
#1:	       ldga	_impure_data -> r3
#2:	       ldi	88 -> r2
	;;
#0:	       stmb.a	1, r0, 0
	;;
#0:	       stm.a	r2, r3, 0
	;;
.BB0_27:
#0:	       callg	__malloc_r
	;;
#0:	       ldga	2048 -> r0
#1:	       btest	r1, 7 -> !c1
#2:	       ldi	64 -> r11
#3:	       ldiu	1024 -> r3
	;;
#0:	       or	r1, r0 -> r0
#1:	if  c1 or	r3, 0 -> r11
	;;
#3:	       stmh.a	r0, r3.26, 6
#0:	       or	r11, 0 -> r0
	;;
#0:	       brz eq @	r0, .BB0_29
	;;
.BB0_28:
#0:	       ldga	_impure_data -> r1
#1:	       ldga	__cleanup_r -> r2
	;;
#0:	       stm.a	r2, r1, 15
#1:	       ldi	128 -> r2
	;;
#3:	       ldm.f	r3.26, 12
	;;
#3:	       bbh	mzext16 r3.26 -> r1
	;;
#0:	       or	r1, r2 -> r1
	;;
#3:	       stmh.a	r1, r3.26, 6
	;;
#0:	       br	.BB0_32
#3:	       stm.a	r0, r3.26, 0
	;;
#3:	       stm.a	r0, r3.26, 4
	;;
#3:	       stm.a	r11, r3.26, 5
	;;
.BB0_29:
#3:	       ldm.f	r3.26, 12
	;;
#3:	       bbh	mzext16 r3.26 -> r1
	;;
#0:	       btest	r1, 9 -> c1
	;;
#0:	if  c1 br @	.BB0_32
	;;
.BB0_30:
#0:	       or	r1, 2 -> r1
	;;
#3:	       stmh.a	r1, r3.26, 6
	;;
.BB0_31:
#3:	       or	r3.26, 0 -> r0
	;;
#0:	       addi	67 -> r0
	;;
#3:	       stm.a	r0, r3.26, 0
	;;
#3:	       stm.a	r0, r3.26, 4
	;;
#3:	       stm.a	1, r3.26, 5
	;;
.BB0_32:                                ; %__smakebuf_r.exit.i.i.i
#0:	       btest	r1, 0 -> c1
	;;
#0:	if !c1 br @	.BB0_34
	;;
.BB0_33:
#3:	       stm.a	0, r3.26, 2
#0:	       ldi	0 -> r0
	;;
#0:	       br	.BB0_35
#3:	       ldm.f	r3.26, 20
	;;
#0:	       sub	r0, r31 -> r0
	;;
#3:	       stm.a	r0, r3.26, 6
	;;
.BB0_34:
#0:	       bbh	sext16 r1 -> r0
	;;
#0:	       btest	r0, 1 -> c1
#1:	       ldi	0 -> r0
	;;
#3:	if !c1 ldm.f	r3.26, 20
	;;
#0:	if !c1 or	r31, 0 -> r0
	;;
#3:	       stm.a	r0, r3.26, 2
	;;
.BB0_35:
#3:	       ldm.f	r3.26, 16
	;;
#0:	       brz ne @	r31, .BB0_38
	;;
.BB0_36:                                ; %__swsetup_r.exit.i.i
#0:	       btest	r1, 7 -> !c1
	;;
#0:	if  c1 br @	.BB0_38
	;;
.BB0_37:                                ; %__swsetup_r.exit.i.i.thread3
#0:	       ldi	64 -> r0
#1:	       ldga	_impure_data -> r3
	;;
#0:	       br	.BB0_294
#1:	       or	r1, r0 -> r0
	;;
#3:	       stmh.a	r0, r3.26, 6
	;;
#0:	       stm.a	9, r3, 0
	;;
.BB0_38:                                ; %._crit_edge18.i.i
#0:	       bbh	sext16 r1 -> r0
	;;
#0:	       btest	r0, 1 -> !c1
	;;
#0:	if  c1 br @	.BB0_40
	;;
.BB0_39:                                ; %.preheader.i.i
#0:	       ldi	0 -> r11
#1:	       br @	.BB0_43
#2:	       ldiu	1024 -> r12
#3:	       ldi	0 -> r14
	;;
.BB0_40:
#0:	       btest	r0, 0 -> c1
	;;
#0:	if !c1 br @	.BB0_46
	;;
.BB0_41:                                ; %.preheader3.i.i
#3:	       ldiu	522 -> r3.24
#0:	       ldi	0 -> r0.23
#1:	       s2add	r15, 8 -> r0
#2:	       ldi	0 -> r11
	;;
#3:	       ldiu	1791 -> r3.25
#0:	       ldi	0 -> r0.24
#1:	       ldi	0 -> r14
#2:	       ldi	0 -> r10
	;;
#3:	       ldim	321 -> r3.24
	;;
#3:	       ldim	991 -> r3.25
	;;
#3:	       add	r0, 16 -> r3.23
	;;
#3:	       ldih	80 -> r3.24
	;;
#3:	       ldih	2039 -> r3.25
	;;
#0:	       br	.BB0_48
#3:	       ldga	32896 -> r3.16
	;;
#3:	       ldih	1028 -> r3.16
	;;
#3:	       stm.s	r3.16, r15, 11
	;;
.BB0_42:                                ;   in Loop: Header=BB0_43 Depth=1
#0:	       ldm.f	r10, 4
#1:	       add	r10, 8 -> r0
	;;
#0:	       or	r31, 0 -> r14
#1:	       ldm.f	r10, 0
#2:	       or	r0, 0 -> r10
	;;
#0:	       or	r31, 0 -> r11
	;;
.BB0_43:                                ; =>This Inner Loop Header: Depth=1
#0:	       brz eq @	r14, .BB0_42
	;;
.BB0_44:                                ;   in Loop: Header=BB0_43 Depth=1
#3:	       ldm.f	r3.26, 28
#0:	       cmpu lt	r14, r12 -> c1
#1:	       ldiu	1024 -> r3
#2:	       ldga	_impure_data -> r0
	;;
#0:	if  c1 or	r14, 0 -> r3
#1:	       or	r11, 0 -> r2
	;;
#0:	       or	r31, 0 -> r1
	;;
#3:	       ldm.f	r3.26, 36
	;;
#0:	       jop	call	r31
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       cmp lt	r0, 1 -> c1
	;;
#0:	if  c1 br @	.BB0_293
	;;
.BB0_45:                                ;   in Loop: Header=BB0_43 Depth=1
#0:	       sub	r13, r0 -> r1
#1:	       cmp eq	r13, r0 -> c1
#2:	       sub	r14, r0 -> r14
#3:	       add	r11, r0 -> r11
	;;
#0:	if  c1 br @	.BB0_294
#1:	if !c1 br @	.BB0_43
#2:	       or	r1, 0 -> r13
	;;
.BB0_46:                                ; %.preheader9.i.i
#1:	       ldiu	895 -> r1.23
#3:	       ldiu	1152 -> r3.23
#2:	       ldi	-4 -> r2.25
#0:	       s2add	r15, 8 -> r0
	;;
#2:	       add	r0, 16 -> r2.23
#1:	       ldim	31 -> r1.23
#3:	       ldi	0 -> r3.24
#0:	       ldi	0 -> r11
	;;
#0:	       br	.BB0_102
#2:	       ldi	36 -> r2.26
#1:	       ldi	128 -> r1.24
	;;
#2:	       ldi	-2 -> r2.27
	;;
	       nop	0
	;;
.BB0_47:                                ;   in Loop: Header=BB0_48 Depth=1
#3:	       ldm.f	r3.23, 4
#0:	       ldi	0 -> r0.24
	;;
#3:	       add	r3.23, 8 -> r0
	;;
#0:	       or	r31, 0 -> r14
	;;
#3:	       ldm.f	r3.23, 0
	;;
#3:	       or	r0, 0 -> r3.23
	;;
#0:	       or	r31, 0 -> r11
	;;
.BB0_48:                                ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_69 Depth 2
                                        ;     Child Loop BB0_60 Depth 2
                                        ;     Child Loop BB0_57 Depth 2
                                        ;     Child Loop BB0_50 Depth 2
                                        ;     Child Loop BB0_89 Depth 2
                                        ;     Child Loop BB0_87 Depth 2
                                        ;     Child Loop BB0_85 Depth 2
                                        ;     Child Loop BB0_74 Depth 2
                                        ;     Child Loop BB0_96 Depth 2
                                        ;     Child Loop BB0_94 Depth 2
                                        ;     Child Loop BB0_92 Depth 2
#0:	       brz eq @	r14, .BB0_47
	;;
.BB0_49:                                ;   in Loop: Header=BB0_48 Depth=1
#1:	       ldi	0 -> r2
#0:	       brz ne @	r0.24, .BB0_66
	;;
.BB0_50:                                ; %.preheader
                                        ;   Parent Loop BB0_48 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       add	r11, r2 -> r1
	;;
#0:	       and	r1, 3 -> r0
	;;
#0:	       brz eq @	r0, .BB0_54
	;;
.BB0_51:                                ;   in Loop: Header=BB0_50 Depth=2
#0:	       cmp eq	r14, r2 -> c1
	;;
#0:	if  c1 br @	.BB0_63
	;;
.BB0_52:                                ;   in Loop: Header=BB0_50 Depth=2
#0:	       ldm.f	r1, 0
#1:	       add	r2, 1 -> r2
	;;
#0:	       bbh	mzext8 r1 -> r0
	;;
#0:	       cmp eq	r0, 10 -> c1
	;;
#0:	if !c1 br @	.BB0_50
	;;
.BB0_53:                                ; %memchr.exit.i.i.loopexit3
                                        ;   in Loop: Header=BB0_48 Depth=1
#0:	       add	r11, r2 -> r0
#1:	       br	.BB0_62
	;;
#0:	       sub	r0, 1 -> r1
	;;
	       nop	0
	;;
.BB0_54:                                ;   in Loop: Header=BB0_48 Depth=1
#0:	       sub	r14, r2 -> r0
	;;
#0:	       cmpu lt	r0, 4 -> c1
	;;
#0:	if  c1 br @	.BB0_59
	;;
.BB0_55:                                ;   in Loop: Header=BB0_48 Depth=1
#0:	       add	r11, r2 -> r1
#1:	       br @	.BB0_57
	;;
.BB0_56:                                ;   in Loop: Header=BB0_57 Depth=2
#0:	       add	r1, 4 -> r1
#1:	       sub	r0, 4 -> r0
	;;
.BB0_57:                                ;   Parent Loop BB0_48 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       cmpu lt	r0, 4 -> c1
	;;
#0:	if  c1 br @	.BB0_59
	;;
.BB0_58:                                ;   in Loop: Header=BB0_57 Depth=2
#0:	       ldm.f	r1, 0
	;;
#3:	       xor	r31, r3.24 -> r3
	;;
#3:	       add	r3, r3.25 -> r2
	;;
#3:	       and	r3, r3.16 -> r3
	;;
#3:	       xor	r3, r3.16 -> r3
	;;
#0:	       and	r3, r2 -> r2
	;;
#0:	       brz eq @	r2, .BB0_56
	;;
.BB0_59:                                ; %.preheader.i4.i.i.preheader
                                        ;   in Loop: Header=BB0_48 Depth=1
#0:	       sub	r1, 1 -> r2
	;;
.BB0_60:                                ; %.preheader.i4.i.i
                                        ;   Parent Loop BB0_48 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       brz eq @	r0, .BB0_63
	;;
.BB0_61:                                ;   in Loop: Header=BB0_60 Depth=2
#0:	       ldm.f	r2, 1
#1:	       add	r2, 1 -> r1
#2:	       sub	r0, 1 -> r0
	;;
#0:	       bbh	mzext8 r1 -> r2
	;;
#0:	       cmp eq	r2, 10 -> c1
#1:	       or	r1, 0 -> r2
	;;
#0:	if !c1 br @	.BB0_60
	;;
.BB0_62:                                ; %memchr.exit.i.i
                                        ;   in Loop: Header=BB0_48 Depth=1
#0:	       brz ne @	r1, .BB0_64
	;;
.BB0_63:                                ; %memchr.exit.i.i.thread
                                        ;   in Loop: Header=BB0_48 Depth=1
#0:	       add	r14, 1 -> r10
#1:	       br @	.BB0_65
	;;
.BB0_64:                                ;   in Loop: Header=BB0_48 Depth=1
#0:	       add	r1, 1 -> r0
	;;
#0:	       sub	r0, r11 -> r10
	;;
.BB0_65:                                ; %memchr.exit.i.i.thread
                                        ;   in Loop: Header=BB0_48 Depth=1
#0:	       ldi	1 -> r0.24
	;;
.BB0_66:                                ; %._crit_edge17.i.i
                                        ;   in Loop: Header=BB0_48 Depth=1
#3:	       ldm.f	r3.26, 8
#0:	       cmpu lt	r14, r10 -> c1
#1:	       or	r10, 0 -> r1
	;;
#0:	if  c1 or	r14, 0 -> r1
	;;
#0:	       or	r31, 0 -> r0
	;;
#3:	       ldm.f	r3.26, 20
	;;
#0:	       or	r31, 0 -> r3
	;;
#3:	       ldm.f	r3.26, 16
#0:	       add	r3, r0 -> r12
	;;
#0:	       cmp gt	r1, r12 -> c1
	;;
#0:	       or	r31, 0 -> r2
	;;
#3:	       ldm.f	r3.26, 0
	;;
#0:	       cmpu gt	r31, r2 -> c2
#1:	       or	r31, 0 -> r0
	;;
#0:	       comb	and c2, c1 -> c1
	;;
#0:	if !c1 br @	.BB0_70
	;;
.BB0_67:                                ;   in Loop: Header=BB0_48 Depth=1
#0:	       cmpu ge	r11, r0 -> c1
	;;
#0:	if !c1 add	r11, r12 -> r1
	;;
#0:	if !c1 cmpu le	r1, r0 -> c1
	;;
#0:	if  c1 br @	.BB0_75
	;;
.BB0_68:                                ;   in Loop: Header=BB0_48 Depth=1
#0:	       cmp eq	r12, 0 -> c3
#1:	       or	r12, 0 -> r1
	;;
#0:	if  c3 br @	.BB0_90
	;;
.BB0_69:                                ;   Parent Loop BB0_48 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       add	r11, r1 -> r2
	;;
#0:	       ldm.f	r2, -1
#1:	       sub	r2, 1 -> r3
	;;
#0:	       bbh	mzext8 r3 -> r2
#1:	       add	r0, r1 -> r3
#2:	       sub	r1, 1 -> r1
	;;
#0:	       brz ne	r1, .BB0_69
#1:	       sub	r3, 1 -> r3
	;;
#0:	       brz eq	r1, .BB0_90
#1:	       stmb.a	r2, r3, 0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB0_70:                                ;   in Loop: Header=BB0_48 Depth=1
#0:	       cmp lt	r1, r3 -> c1
	;;
#0:	if !c1 br @	.BB0_79
	;;
.BB0_71:                                ;   in Loop: Header=BB0_48 Depth=1
#0:	       cmpu ge	r11, r0 -> c1
	;;
#0:	if !c1 add	r11, r1 -> r2
	;;
#0:	if !c1 cmpu le	r2, r0 -> c1
	;;
#0:	if  c1 br @	.BB0_80
	;;
.BB0_72:                                ;   in Loop: Header=BB0_48 Depth=1
#0:	       cmp eq	r1, 0 -> c3
	;;
#0:	if  c3 br @	.BB0_97
	;;
.BB0_73:                                ; %.lr.ph24.i30
                                        ;   in Loop: Header=BB0_48 Depth=1
#0:	       xor	r14, -1 -> r3
#1:	       xor	r10, -1 -> r2
	;;
#0:	       cmpu gt	r2, r3 -> c1
	;;
#0:	if !c1 xor	r14, -1 -> r2 ; aiaf
	;;
#0:	       sub	r0.23, r2 -> r2
	;;
.BB0_74:                                ;   Parent Loop BB0_48 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       add	r11, r2 -> r3
#1:	       add	r0, r2 -> r12
#2:	       sub	r2, 1 -> r2
	;;
#0:	       cmp eq	r2, 1 -> c1
#1:	       ldm.f	r3, -2
#2:	       sub	r3, 2 -> r4
	;;
#0:	if  c1 br	.BB0_97
#1:	if !c1 br	.BB0_74
#2:	       bbh	mzext8 r4 -> r3
#3:	       sub	r12, 2 -> r4
	;;
#0:	       stmb.a	r3, r4, 0
	;;
	       nop	0
	;;
.BB0_75:                                ;   in Loop: Header=BB0_48 Depth=1
#0:	       cmpu lt	r12, 16 -> c1
	;;
#0:	if  c1 br @	.BB0_78
	;;
.BB0_76:                                ;   in Loop: Header=BB0_48 Depth=1
#0:	       or	r0, r11 -> r1
	;;
#0:	       and	r1, 3 -> r1
	;;
#0:	       brz ne @	r1, .BB0_78
	;;
.BB0_77:                                ;   in Loop: Header=BB0_48 Depth=1
#0:	       br	.BB0_85
	;;
#0:	       cmpu gt	r12, 15 -> c1
#1:	       or	r11, 0 -> r2
#2:	       or	r12, 0 -> r1
#3:	       or	r11, 0 -> r3
	;;
	       nop	0
	;;
.BB0_78:                                ;   in Loop: Header=BB0_48 Depth=1
#0:	       or	r11, 0 -> r2
#1:	       br @	.BB0_88
#2:	       or	r12, 0 -> r1
	;;
.BB0_79:                                ;   in Loop: Header=BB0_48 Depth=1
#3:	       ldm.f	r3.26, 28
#0:	       ldga	_impure_data -> r0
#1:	       or	r11, 0 -> r2
	;;
#0:	       or	r31, 0 -> r1
	;;
#3:	       ldm.f	r3.26, 36
	;;
#0:	       jop	call	r31
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r12
	;;
#0:	       cmp lt	r12, 1 -> c1
	;;
#0:	if  c1 br @	.BB0_293
#1:	if !c1 br @	.BB0_98
	;;
.BB0_80:                                ;   in Loop: Header=BB0_48 Depth=1
#0:	       cmpu lt	r1, 16 -> c1
	;;
#0:	if  c1 br @	.BB0_83
	;;
.BB0_81:                                ;   in Loop: Header=BB0_48 Depth=1
#0:	       or	r0, r11 -> r2
	;;
#0:	       and	r2, 3 -> r2
	;;
#0:	       brz ne @	r2, .BB0_83
	;;
.BB0_82:                                ;   in Loop: Header=BB0_48 Depth=1
#0:	       br	.BB0_92
	;;
#0:	       cmpu gt	r1, 15 -> c1
#1:	       or	r11, 0 -> r3
#2:	       or	r1, 0 -> r2
#3:	       or	r11, 0 -> r4
	;;
	       nop	0
	;;
.BB0_83:                                ;   in Loop: Header=BB0_48 Depth=1
#0:	       or	r11, 0 -> r3
#1:	       br @	.BB0_95
#2:	       or	r1, 0 -> r2
	;;
.BB0_84:                                ; %.lr.ph10.i128
                                        ;   in Loop: Header=BB0_85 Depth=2
#0:	       ldm.f	r3, 0
#1:	       sub	r1, 16 -> r1
#2:	       add	r3, 16 -> r2
#3:	       add	r4, 16 -> r0
	;;
#0:	       cmpu gt	r1, 15 -> c1
	;;
#0:	       stm.a	r31, r4, 0
	;;
#0:	       ldm.f	r3, 4
	;;
#0:	       stm.a	r31, r4, 1
	;;
#0:	       ldm.f	r3, 8
	;;
#0:	       stm.a	r31, r4, 2
	;;
#0:	       ldm.f	r3, 12
#1:	       or	r2, 0 -> r3
	;;
#0:	       stm.a	r31, r4, 3
	;;
.BB0_85:                                ;   Parent Loop BB0_48 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       or	r0, 0 -> r4
#1:	if  c1 br @	.BB0_84
#2:	if !c1 br @	.BB0_87
	;;
.BB0_86:                                ; %.lr.ph.i132
                                        ;   in Loop: Header=BB0_87 Depth=2
#0:	       ldm.f	r2, 0
#1:	       add	r2, 4 -> r2
#2:	       sub	r1, 4 -> r1
	;;
#0:	       stm.a	r31, r0, 0
#1:	       add	r0, 4 -> r0
	;;
.BB0_87:                                ; %.lr.ph.i132
                                        ;   Parent Loop BB0_48 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       cmpu gt	r1, 3 -> c1
	;;
#0:	if  c1 br @	.BB0_86
	;;
.BB0_88:                                ; %.preheader14.i140
                                        ;   in Loop: Header=BB0_48 Depth=1
#0:	       brz eq @	r1, .BB0_90
	;;
.BB0_89:                                ; %.lr.ph18.i144
                                        ;   Parent Loop BB0_48 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r2, 0
#1:	       sub	r1, 1 -> r1
	;;
#0:	       brz ne	r1, .BB0_89
#1:	       bbh	mzext8 r2 -> r3
#2:	       add	r2, 1 -> r2
	;;
#0:	       stmb.a	r3, r0, 0
#1:	       add	r0, 1 -> r0
	;;
	       nop	0
	;;
.BB0_90:                                ; %memmove.exit145
                                        ;   in Loop: Header=BB0_48 Depth=1
#3:	       ldm.f	r3.26, 0
	;;
#0:	       callg	__fflush_r
#1:	       add	r31, r12 -> r0
	;;
#3:	       stm.a	r0, r3.26, 0
	;;
#3:	       or	r3.26, 0 -> r0
	;;
	       nop	0
	;;
#0:	       brz eq @	r0, .BB0_98
	;;
#0:	       br @	.BB0_293
	;;
.BB0_91:                                ; %.lr.ph10.i41
                                        ;   in Loop: Header=BB0_92 Depth=2
#0:	       ldm.f	r4, 0
#1:	       sub	r2, 16 -> r2
#2:	       add	r4, 16 -> r3
#3:	       add	r5, 16 -> r0
	;;
#0:	       cmpu gt	r2, 15 -> c1
	;;
#0:	       stm.a	r31, r5, 0
	;;
#0:	       ldm.f	r4, 4
	;;
#0:	       stm.a	r31, r5, 1
	;;
#0:	       ldm.f	r4, 8
	;;
#0:	       stm.a	r31, r5, 2
	;;
#0:	       ldm.f	r4, 12
#1:	       or	r3, 0 -> r4
	;;
#0:	       stm.a	r31, r5, 3
	;;
.BB0_92:                                ;   Parent Loop BB0_48 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       or	r0, 0 -> r5
#1:	if  c1 br @	.BB0_91
#2:	if !c1 br @	.BB0_94
	;;
.BB0_93:                                ; %.lr.ph.i45
                                        ;   in Loop: Header=BB0_94 Depth=2
#0:	       ldm.f	r3, 0
#1:	       add	r3, 4 -> r3
#2:	       sub	r2, 4 -> r2
	;;
#0:	       stm.a	r31, r0, 0
#1:	       add	r0, 4 -> r0
	;;
.BB0_94:                                ; %.lr.ph.i45
                                        ;   Parent Loop BB0_48 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       cmpu gt	r2, 3 -> c1
	;;
#0:	if  c1 br @	.BB0_93
	;;
.BB0_95:                                ; %.preheader14.i53
                                        ;   in Loop: Header=BB0_48 Depth=1
#0:	       brz eq @	r2, .BB0_97
	;;
.BB0_96:                                ; %.lr.ph18.i57
                                        ;   Parent Loop BB0_48 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r3, 0
#1:	       sub	r2, 1 -> r2
	;;
#0:	       brz ne	r2, .BB0_96
#1:	       bbh	mzext8 r3 -> r4
#2:	       add	r3, 1 -> r3
	;;
#0:	       stmb.a	r4, r0, 0
#1:	       add	r0, 1 -> r0
	;;
	       nop	0
	;;
.BB0_97:                                ; %memmove.exit58
                                        ;   in Loop: Header=BB0_48 Depth=1
#3:	       ldm.f	r3.26, 8
#0:	       or	r1, 0 -> r12
	;;
#0:	       sub	r31, r1 -> r0
	;;
#3:	       stm.a	r0, r3.26, 2
	;;
#3:	       ldm.f	r3.26, 0
	;;
#0:	       add	r31, r1 -> r0
	;;
#3:	       stm.a	r0, r3.26, 0
	;;
.BB0_98:                                ;   in Loop: Header=BB0_48 Depth=1
#0:	       cmp ne	r10, r12 -> c1
	;;
#0:	if  c1 br @	.BB0_100
	;;
.BB0_99:                                ;   in Loop: Header=BB0_48 Depth=1
#3:	       or	r3.26, 0 -> r0
#0:	       callg	__fflush_r
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldi	0 -> r0.24
#1:	       cmp ne	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB0_293
	;;
.BB0_100:                               ;   in Loop: Header=BB0_48 Depth=1
#0:	       ldm.s	r15, 44
#1:	       sub	r13, r12 -> r0
#2:	       cmp eq	r13, r12 -> c1
#3:	       sub	r10, r12 -> r10
	;;
#0:	if !c1 br	.BB0_48
#1:	       sub	r14, r12 -> r14
#2:	       add	r11, r12 -> r11
#3:	       or	r0, 0 -> r13
	;;
#0:	if  c1 br	.BB0_294
#3:	       or	r31, 0 -> r3.16
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB0_101:                               ;   in Loop: Header=BB0_102 Depth=1
#2:	       ldm.f	r2.23, 4
#3:	       or	r3.25, 0 -> r13
	;;
#2:	       add	r2.23, 8 -> r0
	;;
#3:	       or	r31, 0 -> r3.24
#2:	       ldm.f	r2.23, 0
	;;
#2:	       or	r0, 0 -> r2.23
	;;
#0:	       or	r31, 0 -> r11
	;;
.BB0_102:                               ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB0_167 Depth 2
                                        ;     Child Loop BB0_288 Depth 2
                                        ;     Child Loop BB0_286 Depth 2
                                        ;     Child Loop BB0_268 Depth 2
                                        ;     Child Loop BB0_248 Depth 2
                                        ;     Child Loop BB0_284 Depth 2
                                        ;     Child Loop BB0_282 Depth 2
                                        ;     Child Loop BB0_262 Depth 2
                                        ;     Child Loop BB0_242 Depth 2
                                        ;     Child Loop BB0_227 Depth 2
                                        ;     Child Loop BB0_274 Depth 2
                                        ;     Child Loop BB0_272 Depth 2
                                        ;     Child Loop BB0_255 Depth 2
                                        ;     Child Loop BB0_209 Depth 2
                                        ;     Child Loop BB0_279 Depth 2
                                        ;     Child Loop BB0_277 Depth 2
                                        ;     Child Loop BB0_236 Depth 2
                                        ;     Child Loop BB0_142 Depth 2
                                        ;     Child Loop BB0_132 Depth 2
                                        ;     Child Loop BB0_130 Depth 2
                                        ;     Child Loop BB0_177 Depth 2
                                        ;     Child Loop BB0_175 Depth 2
                                        ;     Child Loop BB0_173 Depth 2
                                        ;     Child Loop BB0_116 Depth 2
                                        ;     Child Loop BB0_154 Depth 2
                                        ;     Child Loop BB0_152 Depth 2
                                        ;     Child Loop BB0_150 Depth 2
                                        ;     Child Loop BB0_107 Depth 2
                                        ;     Child Loop BB0_138 Depth 2
                                        ;     Child Loop BB0_136 Depth 2
                                        ;     Child Loop BB0_134 Depth 2
#3:	       brz eq	r3.24, .BB0_101
	;;
#3:	       or	r13, 0 -> r3.25
	;;
	       nop	0
	;;
.BB0_103:                               ;   in Loop: Header=BB0_102 Depth=1
#3:	       ldm.f	r3.26, 8
	;;
#0:	       or	r31, 0 -> r12
	;;
#3:	       ldm.f	r3.26, 12
	;;
#3:	       bbh	msext16 r3.26 -> r0
	;;
#0:	       btest	r0, 9 -> !c1
	;;
#0:	if !c1 br @	.BB0_108
	;;
.BB0_104:                               ;   in Loop: Header=BB0_102 Depth=1
#3:	       ldm.f	r3.26, 16
	;;
#3:	       cmpu gt	r3.24, r12 -> c1
	;;
#0:	       or	r31, 0 -> r0
	;;
#3:	       ldm.f	r3.26, 0
	;;
#0:	       cmpu gt	r31, r0 -> c2
#1:	       or	r31, 0 -> r0
	;;
#0:	       comb	and c2, c1 -> c1
	;;
#0:	if !c1 br @	.BB0_113
	;;
.BB0_105:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       cmpu ge	r11, r0 -> c1
	;;
#0:	if !c1 add	r11, r12 -> r1
	;;
#0:	if !c1 cmpu le	r1, r0 -> c1
	;;
#0:	if  c1 br @	.BB0_117
	;;
.BB0_106:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       cmp eq	r12, 0 -> c3
#1:	       or	r12, 0 -> r1
	;;
#0:	if  c3 br @	.BB0_139
	;;
.BB0_107:                               ;   Parent Loop BB0_102 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       add	r11, r1 -> r2
	;;
#0:	       ldm.f	r2, -1
#1:	       sub	r2, 1 -> r3
	;;
#0:	       bbh	mzext8 r3 -> r2
#1:	       add	r0, r1 -> r3
#2:	       sub	r1, 1 -> r1
	;;
#0:	       brz ne	r1, .BB0_107
#1:	       sub	r3, 1 -> r3
	;;
#0:	       stmb.a	r2, r3, 0
	;;
	       nop	0
	;;
#0:	       br @	.BB0_139
	;;
.BB0_108:                               ;   in Loop: Header=BB0_102 Depth=1
#3:	       cmpu lt	r3.24, r12 -> c1
	;;
#0:	if  c1 br @	.BB0_164
	;;
.BB0_109:                               ;   in Loop: Header=BB0_102 Depth=1
#3:	       and	r0, r3.23 -> r1
	;;
#0:	       cmp eq	r1, 0 -> c3
	;;
#0:	if  c3 br @	.BB0_164
	;;
.BB0_110:                               ;   in Loop: Header=BB0_102 Depth=1
#3:	       ldm.f	r3.26, 16
#0:	       btest	r0, 10 -> !c2
	;;
#0:	       or	r31, 0 -> r13
	;;
#3:	       ldm.f	r3.26, 0
	;;
#0:	       sub	r31, r13 -> r10
	;;
#3:	       ldm.f	r3.26, 20
	;;
#3:	       add	r3.24, r10 -> r1
	;;
#0:	       mul	r31, 3 -> $mul0.0
#1:	       add	r1, 1 -> r12
	;;
#0:	       ldx	$mul0.0, 0 -> r1
	;;
#0:	       sr	r1, 31 -> r1
	;;
#0:	       ldx	$mul0.0, r1 -> r1
	;;
#0:	if !c2 br	.BB0_126
#1:	       sra	r1, 1 -> r2
	;;
#0:	       cmpu lt	r2, r12 -> c1
	;;
#0:	if !c1 sra	r1, 1 -> r12 ; aiaf
	;;
.BB0_111:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       cmp ne	r13, 0 -> c3
	;;
#0:	if  c3 br @	.BB0_144
	;;
.BB0_112:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       callg	__malloc_r
	;;
#0:	       stm.s	r10, r15, 10
#1:	       or	r12, 0 -> r0
	;;
#0:	       stm.s	r12, r15, 11
	;;
	       nop	0
	;;
#0:	       br @	.BB0_162
#1:	       or	r0, 0 -> r14
	;;
.BB0_113:                               ;   in Loop: Header=BB0_102 Depth=1
#3:	       ldm.f	r3.26, 20
	;;
#0:	       or	r31, 0 -> r3
	;;
#3:	       cmpu lt	r3.24, r3 -> c1
	;;
#0:	if !c1 br @	.BB0_121
	;;
.BB0_114:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       cmpu ge	r11, r0 -> c1
	;;
#0:	if  c1 br @	.BB0_122
	;;
.BB0_115:                               ;   in Loop: Header=BB0_102 Depth=1
#3:	       add	r11, r3.24 -> r1
	;;
#0:	       cmpu le	r1, r0 -> c1
	;;
#0:	if  c1 br @	.BB0_122
#3:	       or	r3.24, 0 -> r1
	;;
.BB0_116:                               ;   Parent Loop BB0_102 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       add	r11, r1 -> r2
	;;
#0:	       ldm.f	r2, -1
#1:	       sub	r2, 1 -> r3
	;;
#0:	       bbh	mzext8 r3 -> r2
#1:	       add	r0, r1 -> r3
#2:	       sub	r1, 1 -> r1
	;;
#0:	       brz ne	r1, .BB0_116
#1:	       sub	r3, 1 -> r3
	;;
#0:	       stmb.a	r2, r3, 0
	;;
	       nop	0
	;;
#0:	       br @	.BB0_155
	;;
.BB0_117:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       cmpu lt	r12, 16 -> c1
	;;
#0:	if  c1 br @	.BB0_120
	;;
.BB0_118:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       or	r0, r11 -> r1
	;;
#0:	       and	r1, 3 -> r1
	;;
#0:	       brz ne @	r1, .BB0_120
	;;
.BB0_119:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       br	.BB0_134
	;;
#0:	       cmpu gt	r12, 15 -> c1
#1:	       or	r11, 0 -> r2
#2:	       or	r12, 0 -> r1
#3:	       or	r11, 0 -> r3
	;;
	       nop	0
	;;
.BB0_120:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       or	r11, 0 -> r2
#1:	       br @	.BB0_137
#2:	       or	r12, 0 -> r1
	;;
.BB0_121:                               ;   in Loop: Header=BB0_102 Depth=1
#3:	       ldm.f	r3.26, 28
#0:	       ldga	_impure_data -> r0
#1:	       or	r11, 0 -> r2
	;;
#0:	       or	r31, 0 -> r1
	;;
#3:	       ldm.f	r3.26, 36
	;;
#0:	       jop	call	r31
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r12
	;;
#0:	       cmp lt	r12, 1 -> c1
	;;
#0:	if  c1 br @	.BB0_293
#1:	if !c1 br @	.BB0_180
	;;
.BB0_122:                               ;   in Loop: Header=BB0_102 Depth=1
#3:	       cmpu lt	r3.24, 16 -> c1
	;;
#0:	if  c1 br @	.BB0_125
	;;
.BB0_123:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       or	r0, r11 -> r1
	;;
#0:	       and	r1, 3 -> r1
	;;
#0:	       brz ne @	r1, .BB0_125
	;;
.BB0_124:                               ;   in Loop: Header=BB0_102 Depth=1
#3:	       cmpu gt	r3.24, 15 -> c1
#0:	       br	.BB0_150
#1:	       or	r11, 0 -> r2
#2:	       or	r11, 0 -> r3
	;;
#3:	       or	r3.24, 0 -> r1
	;;
	       nop	0
	;;
.BB0_125:                               ;   in Loop: Header=BB0_102 Depth=1
#3:	       or	r3.24, 0 -> r1
#0:	       br @	.BB0_153
#1:	       or	r11, 0 -> r2
	;;
.BB0_126:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       or	r12, 0 -> r0
#1:	       callg	__malloc_r
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r14
	;;
#0:	       cmp eq	r14, 0 -> c3
	;;
#0:	if  c3 br @	.BB0_292
	;;
.BB0_127:                               ;   in Loop: Header=BB0_102 Depth=1
#3:	       ldm.f	r3.26, 16
#0:	       cmpu lt	r10, 16 -> c1
	;;
#0:	if  c1 br @	.BB0_140
#1:	       or	r31, 0 -> r0
	;;
.BB0_128:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       or	r0, r14 -> r1
	;;
#0:	       and	r1, 3 -> r1
	;;
#0:	       brz ne @	r1, .BB0_140
	;;
.BB0_129:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       cmpu gt	r10, 15 -> c1
#1:	       or	r14, 0 -> r2
#2:	       or	r10, 0 -> r1
#3:	       or	r0, 0 -> r3
	;;
#0:	if !c1 br @	.BB0_132
#1:	       or	r14, 0 -> r4
	;;
.BB0_130:                               ; %.lr.ph10.i.i.i
                                        ;   Parent Loop BB0_102 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r3, 0
#1:	       sub	r1, 16 -> r1
#2:	       add	r4, 16 -> r2
#3:	       add	r3, 16 -> r0
	;;
#0:	       cmpu gt	r1, 15 -> c1
	;;
#0:	       stm.a	r31, r4, 0
	;;
#0:	       ldm.f	r3, 4
	;;
#0:	       stm.a	r31, r4, 1
	;;
#0:	       ldm.f	r3, 8
	;;
#0:	if !c1 br	.BB0_132
#1:	if  c1 br	.BB0_130
#2:	       stm.a	r31, r4, 2
	;;
#0:	       ldm.f	r3, 12
#1:	       or	r0, 0 -> r3
	;;
#0:	       stm.a	r31, r4, 3
#1:	       or	r2, 0 -> r4
	;;
.BB0_131:                               ; %.lr.ph.i.i.i
                                        ;   in Loop: Header=BB0_132 Depth=2
#0:	       ldm.f	r0, 0
#1:	       add	r0, 4 -> r0
#2:	       sub	r1, 4 -> r1
	;;
#0:	       stm.a	r31, r2, 0
#1:	       add	r2, 4 -> r2
	;;
.BB0_132:                               ; %.lr.ph.i.i.i
                                        ;   Parent Loop BB0_102 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       cmpu gt	r1, 3 -> c1
	;;
#0:	if !c1 br @	.BB0_141
#1:	if  c1 br @	.BB0_131
	;;
.BB0_133:                               ; %.lr.ph10.i215
                                        ;   in Loop: Header=BB0_134 Depth=2
#0:	       ldm.f	r3, 0
#1:	       sub	r1, 16 -> r1
#2:	       add	r3, 16 -> r2
#3:	       add	r4, 16 -> r0
	;;
#0:	       cmpu gt	r1, 15 -> c1
	;;
#0:	       stm.a	r31, r4, 0
	;;
#0:	       ldm.f	r3, 4
	;;
#0:	       stm.a	r31, r4, 1
	;;
#0:	       ldm.f	r3, 8
	;;
#0:	       stm.a	r31, r4, 2
	;;
#0:	       ldm.f	r3, 12
#1:	       or	r2, 0 -> r3
	;;
#0:	       stm.a	r31, r4, 3
	;;
.BB0_134:                               ;   Parent Loop BB0_102 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       or	r0, 0 -> r4
#1:	if  c1 br @	.BB0_133
#2:	if !c1 br @	.BB0_136
	;;
.BB0_135:                               ; %.lr.ph.i219
                                        ;   in Loop: Header=BB0_136 Depth=2
#0:	       ldm.f	r2, 0
#1:	       add	r2, 4 -> r2
#2:	       sub	r1, 4 -> r1
	;;
#0:	       stm.a	r31, r0, 0
#1:	       add	r0, 4 -> r0
	;;
.BB0_136:                               ; %.lr.ph.i219
                                        ;   Parent Loop BB0_102 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       cmpu gt	r1, 3 -> c1
	;;
#0:	if  c1 br @	.BB0_135
	;;
.BB0_137:                               ; %.preheader14.i227
                                        ;   in Loop: Header=BB0_102 Depth=1
#0:	       brz eq @	r1, .BB0_139
	;;
.BB0_138:                               ; %.lr.ph18.i231
                                        ;   Parent Loop BB0_102 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r2, 0
#1:	       sub	r1, 1 -> r1
	;;
#0:	       brz ne	r1, .BB0_138
#1:	       bbh	mzext8 r2 -> r3
#2:	       add	r2, 1 -> r2
	;;
#0:	       stmb.a	r3, r0, 0
#1:	       add	r0, 1 -> r0
	;;
	       nop	0
	;;
.BB0_139:                               ; %memmove.exit232
                                        ;   in Loop: Header=BB0_102 Depth=1
#3:	       ldm.f	r3.26, 0
	;;
#0:	       callg	__fflush_r
#1:	       add	r31, r12 -> r0
	;;
#3:	       stm.a	r0, r3.26, 0
	;;
#3:	       or	r3.26, 0 -> r0
	;;
	       nop	0
	;;
#0:	       cmp eq	r0, 0 -> c3
	;;
#0:	if !c3 br @	.BB0_293
#1:	if  c3 br @	.BB0_180
	;;
.BB0_140:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       or	r14, 0 -> r2
#1:	       or	r10, 0 -> r1
	;;
.BB0_141:                               ; %.preheader14.i.i.i
                                        ;   in Loop: Header=BB0_102 Depth=1
#0:	       stm.s	r12, r15, 11
#1:	       brz eq	r1, .BB0_143
	;;
#0:	       stm.s	r10, r15, 10
	;;
	       nop	0
	;;
.BB0_142:                               ; %.lr.ph18.i.i.i
                                        ;   Parent Loop BB0_102 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r0, 0
#1:	       sub	r1, 1 -> r1
	;;
#0:	       brz ne	r1, .BB0_142
#1:	       bbh	mzext8 r0 -> r3
#2:	       add	r0, 1 -> r0
	;;
#0:	       stmb.a	r3, r2, 0
#1:	       add	r2, 1 -> r2
	;;
	       nop	0
	;;
.BB0_143:                               ; %memcpy.exit.i.i
                                        ;   in Loop: Header=BB0_102 Depth=1
#3:	       ldm.f	r3.26, 12
	;;
#3:	       bbh	mzext16 r3.26 -> r0
	;;
#0:	       br	.BB0_163
#1:	       and	r0, r1.23 -> r0
	;;
#1:	       or	r0, r1.24 -> r0
	;;
#3:	       stmh.a	r0, r3.26, 6
	;;
.BB0_144:                               ;   in Loop: Header=BB0_102 Depth=1
#2:	       ldi	16 -> r2.28
#0:	       add	r12, 11 -> r0
#1:	       ldi	-8 -> r1
#3:	       stm.s	r10, r15, 10
	;;
#0:	       cmpu lt	r0, 23 -> c1
#1:	       ldm.f	r13, -4
	;;
#2:	if !c1 and	r0, r1 -> r2.28 ; aaaf
	;;
#2:	       cmpu lt	r2.28, r12 -> c1
#0:	       or	r31, 0 -> r1
	;;
#2:	       cmp lt	r2.28, 0 -> c2
	;;
#0:	       comb	or c2, c1 -> c1
	;;
#0:	if  c1 br @	.BB0_290
	;;
.BB0_145:                               ;   in Loop: Header=BB0_102 Depth=1
#2:	       sub	r13, 8 -> r2.29
#0:	       stm.s	r12, r15, 11
	;;
#2:	       and	r1, r2.25 -> r12
	;;
#2:	       cmp ge	r12, r2.28 -> c1
	;;
#0:	if  c1 br @	.BB0_156
	;;
.BB0_146:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       sub	r12, 4 -> r10
#1:	       add	r12, r13 -> r2
	;;
#2:	       add	r13, r10 -> r2.24
#0:	       ldmr.f	r10, r13, 0
#1:	       sub	r2, 8 -> r3
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldmg.d	___malloc_av_+8
	;;
#0:	       cmp eq	r3, r31 -> c1
#1:	       or	r31, 0 -> r6
	;;
#0:	if !c1 br @	.BB0_181
	;;
.BB0_147:                               ;   in Loop: Header=BB0_102 Depth=1
#2:	       and	r0, r2.25 -> r2
	;;
#2:	       add	r2.28, 16 -> r4
#0:	       add	r2, r12 -> r0
	;;
#0:	       cmp lt	r0, r4 -> c1
	;;
#0:	if  c1 br @	.BB0_184
	;;
.BB0_148:                               ;   in Loop: Header=BB0_102 Depth=1
#2:	       add	r2.28, r13 -> r0
#0:	       ldga	___malloc_av_ -> r3
#1:	       or	r13, 0 -> r14
	;;
#0:	       sub	r0, 8 -> r1
#1:	       sub	r0, 4 -> r0
	;;
#0:	       stm.a	r1, r3, 2
#2:	       sub	r12, r2.28 -> r1
	;;
#0:	       add	r1, r2 -> r1
	;;
#0:	       or	r1, 1 -> r1
	;;
#0:	       stm.a	r1, r0, 0
#1:	       sub	r13, 4 -> r1
	;;
#0:	       ldm.f	r13, -4
	;;
#0:	       br	.BB0_162
#1:	       and	r31, 1 -> r0
	;;
#2:	       or	r0, r2.28 -> r0
	;;
#0:	       stm.a	r0, r1, 0
	;;
.BB0_149:                               ; %.lr.ph10.i157
                                        ;   in Loop: Header=BB0_150 Depth=2
#0:	       ldm.f	r3, 0
#1:	       sub	r1, 16 -> r1
#2:	       add	r3, 16 -> r2
#3:	       add	r4, 16 -> r0
	;;
#0:	       cmpu gt	r1, 15 -> c1
	;;
#0:	       stm.a	r31, r4, 0
	;;
#0:	       ldm.f	r3, 4
	;;
#0:	       stm.a	r31, r4, 1
	;;
#0:	       ldm.f	r3, 8
	;;
#0:	       stm.a	r31, r4, 2
	;;
#0:	       ldm.f	r3, 12
#1:	       or	r2, 0 -> r3
	;;
#0:	       stm.a	r31, r4, 3
	;;
.BB0_150:                               ;   Parent Loop BB0_102 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       or	r0, 0 -> r4
#1:	if  c1 br @	.BB0_149
#2:	if !c1 br @	.BB0_152
	;;
.BB0_151:                               ; %.lr.ph.i161
                                        ;   in Loop: Header=BB0_152 Depth=2
#0:	       ldm.f	r2, 0
#1:	       add	r2, 4 -> r2
#2:	       sub	r1, 4 -> r1
	;;
#0:	       stm.a	r31, r0, 0
#1:	       add	r0, 4 -> r0
	;;
.BB0_152:                               ; %.lr.ph.i161
                                        ;   Parent Loop BB0_102 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       cmpu gt	r1, 3 -> c1
	;;
#0:	if  c1 br @	.BB0_151
	;;
.BB0_153:                               ; %.preheader14.i169
                                        ;   in Loop: Header=BB0_102 Depth=1
#0:	       brz eq @	r1, .BB0_155
	;;
.BB0_154:                               ; %.lr.ph18.i173
                                        ;   Parent Loop BB0_102 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r2, 0
#1:	       sub	r1, 1 -> r1
	;;
#0:	       brz ne	r1, .BB0_154
#1:	       bbh	mzext8 r2 -> r3
#2:	       add	r2, 1 -> r2
	;;
#0:	       stmb.a	r3, r0, 0
#1:	       add	r0, 1 -> r0
	;;
	       nop	0
	;;
.BB0_155:                               ; %memmove.exit174
                                        ;   in Loop: Header=BB0_102 Depth=1
#3:	       ldm.f	r3.26, 8
	;;
#3:	       sub	r31, r3.24 -> r0
	;;
#0:	       br	.BB0_179
#3:	       stm.a	r0, r3.26, 2
	;;
#3:	       ldm.f	r3.26, 0
	;;
#3:	       add	r31, r3.24 -> r0
	;;
.BB0_156:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       or	r12, 0 -> r0
	;;
.BB0_157:                               ;   in Loop: Header=BB0_102 Depth=1
#2:	       or	r2.29, 0 -> r14
	;;
.BB0_158:                               ; %memmove.exit29
                                        ;   in Loop: Header=BB0_102 Depth=1
#2:	       sub	r0, r2.28 -> r1
	;;
#0:	       cmpu lt	r1, 16 -> c1
	;;
#0:	if  c1 br @	.BB0_160
	;;
.BB0_159:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       ldm.f	r14, 4
#1:	       or	r1, 1 -> r1
#2:	       add	r0, r14 -> r0
	;;
#0:	       and	r31, 1 -> r2
	;;
#2:	       or	r2, r2.28 -> r2
	;;
#0:	       stm.a	r2, r14, 1
#2:	       or	r2.28, 4 -> r2
	;;
#0:	       add	r14, r2 -> r2
	;;
#0:	       stm.a	r1, r2, 0
#2:	       add	r2.28, r14 -> r1
	;;
#0:	       callg	__free_r
	;;
#0:	       ldm.f	r0, 4
	;;
#0:	       or	r31, 1 -> r3
	;;
#0:	       stm.a	r3, r0, 1
#1:	       add	r1, 8 -> r0
	;;
#0:	       br @	.BB0_161
	;;
.BB0_160:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       ldm.f	r14, 4
	;;
#0:	       and	r31, 1 -> r1
	;;
#0:	       or	r1, r0 -> r1
#1:	       add	r0, r14 -> r0
	;;
#0:	       stm.a	r1, r14, 1
	;;
#0:	       ldm.f	r0, 4
	;;
#0:	       or	r31, 1 -> r3
	;;
#0:	       stm.a	r3, r0, 1
	;;
.BB0_161:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       add	r14, 8 -> r14
	;;
.BB0_162:                               ; %_realloc_r.exit.i.i
                                        ;   in Loop: Header=BB0_102 Depth=1
#0:	       cmp eq	r14, 0 -> c3
	;;
#0:	if  c3 br @	.BB0_289
	;;
.BB0_163:                               ;   in Loop: Header=BB0_102 Depth=1
#3:	       stm.a	r14, r3.26, 4
	;;
#3:	       or	r3.24, 0 -> r12
#0:	       ldm.s	r15, 40
	;;
#0:	       or	r31, 0 -> r1
	;;
#0:	       add	r14, r1 -> r0
	;;
#3:	       stm.a	r0, r3.26, 0
	;;
#0:	       ldm.s	r15, 44
	;;
#0:	       or	r31, 0 -> r0
	;;
#3:	       stm.a	r0, r3.26, 5
#0:	       sub	r0, r1 -> r0
	;;
#3:	       stm.a	r0, r3.26, 2
	;;
.BB0_164:                               ; %._crit_edge.i1.i
                                        ;   in Loop: Header=BB0_102 Depth=1
#3:	       ldm.f	r3.26, 0
#0:	       or	r12, 0 -> r0
	;;
#3:	       cmpu lt	r3.24, r12 -> c1
	;;
#3:	if  c1 or	r3.24, 0 -> r0
#0:	       cmpu ge	r11, r31 -> c3
#1:	       or	r31, 0 -> r1
	;;
#0:	if !c3 add	r11, r0 -> r2
	;;
#0:	if !c3 cmpu le	r2, r1 -> c1
	;;
#0:	if  c1 br @	.BB0_168
	;;
.BB0_165:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       brz eq @	r0, .BB0_178
	;;
.BB0_166:                               ; %.lr.ph24.i175
                                        ;   in Loop: Header=BB0_102 Depth=1
#3:	       xor	r3.24, -1 -> r3
#0:	       xor	r12, -1 -> r2
	;;
#0:	       cmpu gt	r2, r3 -> c1
#1:	       ldi	0 -> r3
	;;
#3:	if !c1 xor	r3.24, -1 -> r2 ; aiaf
	;;
#0:	       sub	r3, r2 -> r2
	;;
.BB0_167:                               ;   Parent Loop BB0_102 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       add	r11, r2 -> r3
#1:	       add	r1, r2 -> r14
#2:	       sub	r2, 1 -> r2
	;;
#0:	       cmp eq	r2, 1 -> c1
#1:	       ldm.f	r3, -2
#2:	       sub	r3, 2 -> r4
	;;
#0:	if  c1 br	.BB0_178
#1:	if !c1 br	.BB0_167
#2:	       bbh	mzext8 r4 -> r3
#3:	       sub	r14, 2 -> r4
	;;
#0:	       stmb.a	r3, r4, 0
	;;
	       nop	0
	;;
.BB0_168:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       cmpu lt	r0, 16 -> c1
	;;
#0:	if  c1 br @	.BB0_171
	;;
.BB0_169:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       or	r1, r11 -> r2
	;;
#0:	       and	r2, 3 -> r2
	;;
#0:	       brz ne @	r2, .BB0_171
	;;
.BB0_170:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       br	.BB0_173
	;;
#0:	       cmpu gt	r0, 15 -> c1
#1:	       or	r11, 0 -> r3
#2:	       or	r0, 0 -> r2
#3:	       or	r11, 0 -> r4
	;;
	       nop	0
	;;
.BB0_171:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       or	r11, 0 -> r3
#1:	       br @	.BB0_176
#2:	       or	r0, 0 -> r2
	;;
.BB0_172:                               ; %.lr.ph10.i186
                                        ;   in Loop: Header=BB0_173 Depth=2
#0:	       ldm.f	r4, 0
#1:	       sub	r2, 16 -> r2
#2:	       add	r4, 16 -> r3
#3:	       add	r5, 16 -> r1
	;;
#0:	       cmpu gt	r2, 15 -> c1
	;;
#0:	       stm.a	r31, r5, 0
	;;
#0:	       ldm.f	r4, 4
	;;
#0:	       stm.a	r31, r5, 1
	;;
#0:	       ldm.f	r4, 8
	;;
#0:	       stm.a	r31, r5, 2
	;;
#0:	       ldm.f	r4, 12
#1:	       or	r3, 0 -> r4
	;;
#0:	       stm.a	r31, r5, 3
	;;
.BB0_173:                               ;   Parent Loop BB0_102 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       or	r1, 0 -> r5
#1:	if  c1 br @	.BB0_172
#2:	if !c1 br @	.BB0_175
	;;
.BB0_174:                               ; %.lr.ph.i190
                                        ;   in Loop: Header=BB0_175 Depth=2
#0:	       ldm.f	r3, 0
#1:	       add	r3, 4 -> r3
#2:	       sub	r2, 4 -> r2
	;;
#0:	       stm.a	r31, r1, 0
#1:	       add	r1, 4 -> r1
	;;
.BB0_175:                               ; %.lr.ph.i190
                                        ;   Parent Loop BB0_102 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       cmpu gt	r2, 3 -> c1
	;;
#0:	if  c1 br @	.BB0_174
	;;
.BB0_176:                               ; %.preheader14.i198
                                        ;   in Loop: Header=BB0_102 Depth=1
#0:	       brz eq @	r2, .BB0_178
	;;
.BB0_177:                               ; %.lr.ph18.i202
                                        ;   Parent Loop BB0_102 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r3, 0
#1:	       sub	r2, 1 -> r2
	;;
#0:	       brz ne	r2, .BB0_177
#1:	       bbh	mzext8 r3 -> r4
#2:	       add	r3, 1 -> r3
	;;
#0:	       stmb.a	r4, r1, 0
#1:	       add	r1, 1 -> r1
	;;
	       nop	0
	;;
.BB0_178:                               ; %memmove.exit203
                                        ;   in Loop: Header=BB0_102 Depth=1
#3:	       ldm.f	r3.26, 8
	;;
#0:	       sub	r31, r0 -> r1
	;;
#3:	       stm.a	r1, r3.26, 2
	;;
#3:	       ldm.f	r3.26, 0
	;;
#0:	       add	r31, r0 -> r0
	;;
.BB0_179:                               ; %memmove.exit174
                                        ;   in Loop: Header=BB0_102 Depth=1
#3:	       or	r3.24, 0 -> r12
	;;
#3:	       stm.a	r0, r3.26, 0
	;;
.BB0_180:                               ;   in Loop: Header=BB0_102 Depth=1
#3:	       cmp eq	r3.25, r12 -> c1
#0:	       add	r11, r12 -> r11
	;;
#0:	if  c1 br	.BB0_294
#1:	if !c1 br	.BB0_102
#3:	       sub	r3.25, r12 -> r13
	;;
#3:	       sub	r3.24, r12 -> r3.24
	;;
	       nop	0
	;;
.BB0_181:                               ;   in Loop: Header=BB0_102 Depth=1
#2:	       and	r0, r2.27 -> r2
#0:	       ldi	0 -> r7
	;;
#0:	       add	r2, r10 -> r2
	;;
#0:	       ldmr.f	r2, r13, 0
#1:	       ldi	0 -> r2
	;;
#0:	       btest	r31, 0 -> c1
	;;
#0:	if  c1 br @	.BB0_185
	;;
.BB0_182:                               ;   in Loop: Header=BB0_102 Depth=1
#2:	       and	r0, r2.25 -> r2
#0:	       or	r3, 0 -> r7
	;;
#0:	       add	r2, r12 -> r0
	;;
#2:	       cmp lt	r0, r2.28 -> c1
	;;
#0:	if  c1 br @	.BB0_185
	;;
.BB0_183:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       ldmr.f	r12, r13, 0
#1:	       add	r13, r12 -> r2
	;;
#0:	       br	.BB0_157
#1:	       or	r31, 0 -> r1
#2:	       ldm.f	r2, 4
	;;
#0:	       stm.a	r31, r1, 3
	;;
#0:	       stm.a	r1, r31, 2
	;;
.BB0_184:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       or	r3, 0 -> r7
	;;
.BB0_185:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       btest	r1, 0 -> c1
	;;
#0:	if  c1 br @	.BB0_197
	;;
.BB0_186:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       ldm.f	r13, -8
#1:	       ldi	-8 -> r0
	;;
#0:	       or	r31, 0 -> r5
	;;
#0:	       brz eq	r7, .BB0_195
#2:	       sub	r2.25, r5 -> r4
#1:	       sub	r0, r5 -> r1
	;;
#0:	       ldmr.f	r4, r13, 0
#1:	       add	r13, r1 -> r14
	;;
#2:	       and	r31, r2.25 -> r3
	;;
.BB0_187:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       cmp ne	r7, r6 -> c1
#1:	       add	r2, r12 -> r0
	;;
#0:	if  c1 br @	.BB0_194
#1:	       add	r0, r3 -> r0
	;;
.BB0_188:                               ;   in Loop: Header=BB0_102 Depth=1
#2:	       add	r2.28, 16 -> r6
	;;
#0:	       cmp lt	r0, r6 -> c1
	;;
#0:	if  c1 br @	.BB0_195
	;;
.BB0_189:                               ;   in Loop: Header=BB0_102 Depth=1
#2:	       cmpu gt	r10, r2.26 -> c1
#0:	       add	r1, 8 -> r6
#1:	       add	r1, 12 -> r0
	;;
#0:	       ldmr.f	r6, r13, 0
#1:	       add	r13, r6 -> r14
	;;
#0:	if  c1 br	.BB0_205
#1:	       or	r31, 0 -> r7
#2:	       ldmr.f	r0, r13, 0
	;;
#0:	       stm.a	r31, r7, 3
	;;
#0:	       stm.a	r7, r31, 2
	;;
.BB0_190:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       cmpu lt	r10, 20 -> c1
	;;
#0:	if  c1 br @	.BB0_210
	;;
.BB0_191:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       ldm.f	r13, 0
#1:	       cmpu lt	r10, 28 -> c1
#2:	       add	r1, r13 -> r5
#3:	       add	r13, r0 -> r0
	;;
#0:	if  c1 br	.BB0_211
#1:	       stm.a	r31, r14, 0
	;;
#0:	       ldm.f	r13, 4
	;;
#0:	       stm.a	r31, r0, 0
#1:	       add	r5, 16 -> r0
	;;
.BB0_192:                               ;   in Loop: Header=BB0_102 Depth=1
#2:	       cmpu lt	r10, r2.26 -> c1
#0:	       ldm.f	r13, 8
	;;
#0:	if  c1 br	.BB0_212
#1:	       stm.a	r31, r0, 0
#2:	       add	r5, 24 -> r0
	;;
#0:	       ldm.f	r13, 12
	;;
#0:	       stm.a	r31, r5, 5
	;;
.BB0_193:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       ldm.f	r13, 16
	;;
#0:	       br	.BB0_213
#1:	       stm.a	r31, r0, 0
#2:	       s2add	r5, 8 -> r0
	;;
#0:	       ldm.f	r13, 20
	;;
#0:	       stm.a	r31, r5, 7
#1:	       add	r13, 24 -> r5
	;;
.BB0_194:                               ;   in Loop: Header=BB0_102 Depth=1
#2:	       cmp lt	r0, r2.28 -> c1
	;;
#0:	if !c1 br @	.BB0_214
	;;
.BB0_195:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       brz eq @	r14, .BB0_197
	;;
.BB0_196:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       add	r3, r12 -> r0
	;;
#2:	       cmp lt	r0, r2.28 -> c1
	;;
#0:	if !c1 br @	.BB0_219
	;;
.BB0_197:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       callg	__malloc_r
	;;
#0:	       ldm.s	r15, 44
	;;
#0:	       or	r31, 0 -> r0
	;;
	       nop	0
	;;
#0:	       or	r0, 0 -> r14
	;;
#0:	       cmp eq	r14, 0 -> c3
	;;
#0:	if  c3 br @	.BB0_289
	;;
.BB0_198:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       ldm.f	r13, -4
#1:	       sub	r14, 8 -> r1
	;;
#0:	       sub	r31, 8 -> r0
	;;
#2:	       and	r0, r2.27 -> r0
	;;
#0:	       add	r13, r0 -> r0
	;;
#0:	       cmp ne	r1, r0 -> c1
	;;
#0:	if  c1 br @	.BB0_200
	;;
.BB0_199:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       ldm.f	r14, -4
#1:	       br	.BB0_157
	;;
#2:	       and	r31, r2.25 -> r0
	;;
#0:	       add	r0, r12 -> r0
	;;
.BB0_200:                               ;   in Loop: Header=BB0_102 Depth=1
#2:	       cmpu gt	r10, r2.26 -> c1
	;;
#0:	if  c1 br @	.BB0_224
	;;
.BB0_201:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       cmpu lt	r10, 20 -> c1
	;;
#0:	if  c1 br @	.BB0_228
	;;
.BB0_202:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       ldm.f	r13, 0
#1:	       cmpu lt	r10, 28 -> c1
#2:	       add	r14, 8 -> r0
	;;
#0:	if  c1 br	.BB0_229
#1:	       stm.a	r31, r14, 0
	;;
#0:	       ldm.f	r13, 4
	;;
#0:	       stm.a	r31, r14, 1
	;;
.BB0_203:                               ;   in Loop: Header=BB0_102 Depth=1
#2:	       cmpu lt	r10, r2.26 -> c1
#0:	       ldm.f	r13, 8
	;;
#0:	if  c1 br	.BB0_230
#1:	       stm.a	r31, r0, 0
#2:	       add	r14, 16 -> r0
	;;
#0:	       ldm.f	r13, 12
	;;
#0:	       stm.a	r31, r14, 3
	;;
.BB0_204:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       ldm.f	r13, 16
#1:	       add	r13, 24 -> r1
	;;
#0:	       br	.BB0_231
#1:	       stm.a	r31, r0, 0
#2:	       add	r14, 24 -> r0
	;;
#0:	       ldm.f	r13, 20
	;;
#0:	       stm.a	r31, r14, 5
	;;
.BB0_205:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       cmp lt	r6, 1 -> c1
	;;
#0:	if  c1 br @	.BB0_233
	;;
.BB0_206:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       cmp le	r10, r6 -> c1
	;;
#0:	if  c1 br @	.BB0_232
	;;
.BB0_207:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       cmp eq	r10, 0 -> c3
	;;
#0:	if  c3 br @	.BB0_280
	;;
.BB0_208:                               ; %.lr.ph24.i
                                        ;   in Loop: Header=BB0_102 Depth=1
#0:	       sub	r13, r5 -> r0
#1:	       or	r12, 0 -> r5
	;;
.BB0_209:                               ;   Parent Loop BB0_102 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       add	r13, r5 -> r6
#1:	       add	r0, r5 -> r10
#2:	       sub	r5, 1 -> r5
	;;
#0:	       cmp eq	r5, 4 -> c1
#1:	       ldm.f	r6, -5
#2:	       sub	r6, 1 -> r7
	;;
#0:	if  c1 br	.BB0_280
#1:	if !c1 br	.BB0_209
#2:	       bbh	mzext8 r7 -> r6
#3:	       sub	r10, 5 -> r7
	;;
#0:	       stmb.a	r6, r7, 0
	;;
	       nop	0
	;;
.BB0_210:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       or	r13, 0 -> r5
#1:	       br @	.BB0_213
#2:	       or	r14, 0 -> r0
	;;
.BB0_211:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       add	r13, 8 -> r5
#1:	       br @	.BB0_213
	;;
.BB0_212:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       add	r13, 16 -> r5
	;;
.BB0_213:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       ldm.f	r5, 0
	;;
#0:	       stm.a	r31, r0, 0
	;;
#0:	       ldm.f	r5, 4
	;;
#0:	       br	.BB0_280
#1:	       stm.a	r31, r0, 1
	;;
#0:	       ldm.f	r5, 8
	;;
#0:	       stm.a	r31, r0, 2
	;;
.BB0_214:                               ;   in Loop: Header=BB0_102 Depth=1
#2:	       cmpu gt	r10, r2.26 -> c1
#0:	       ldm.f	r7, 8
#1:	       add	r1, 8 -> r4
#3:	       add	r1, 12 -> r3
	;;
#0:	       or	r31, 0 -> r2
#1:	       ldm.f	r7, 12
	;;
#0:	       stm.a	r31, r2, 3
	;;
#0:	       stm.a	r2, r31, 2
	;;
#0:	       ldmr.f	r4, r13, 0
	;;
#0:	if  c1 br	.BB0_238
#1:	       or	r31, 0 -> r2
#2:	       ldmr.f	r3, r13, 0
	;;
#0:	       stm.a	r31, r2, 3
	;;
#0:	       stm.a	r2, r31, 2
#1:	       add	r13, r4 -> r2
	;;
.BB0_215:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       cmpu lt	r10, 20 -> c1
	;;
#0:	if  c1 br @	.BB0_251
	;;
.BB0_216:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       ldm.f	r13, 0
#1:	       cmpu lt	r10, 28 -> c1
#2:	       add	r1, r13 -> r1
	;;
#0:	if  c1 br	.BB0_243
#1:	       stm.a	r31, r2, 0
#2:	       add	r13, r3 -> r2
	;;
#0:	       ldm.f	r13, 4
	;;
#0:	       stm.a	r31, r2, 0
#1:	       add	r1, 16 -> r2
	;;
.BB0_217:                               ;   in Loop: Header=BB0_102 Depth=1
#2:	       cmpu lt	r10, r2.26 -> c1
#0:	       ldm.f	r13, 8
	;;
#0:	if !c1 br	.BB0_250
#1:	       stm.a	r31, r2, 0
#2:	       add	r1, 24 -> r2
	;;
#0:	       ldm.f	r13, 12
	;;
#0:	       stm.a	r31, r1, 5
	;;
.BB0_218:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       add	r13, 16 -> r13
#1:	       br @	.BB0_251
	;;
.BB0_219:                               ;   in Loop: Header=BB0_102 Depth=1
#2:	       cmpu gt	r10, r2.26 -> c1
#0:	       add	r1, 8 -> r4
#1:	       add	r1, 12 -> r3
	;;
#0:	       ldmr.f	r4, r13, 0
	;;
#0:	if  c1 br	.BB0_244
#1:	       or	r31, 0 -> r2
#2:	       ldmr.f	r3, r13, 0
	;;
#0:	       stm.a	r31, r2, 3
	;;
#0:	       stm.a	r2, r31, 2
#1:	       add	r13, r4 -> r2
	;;
.BB0_220:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       cmpu lt	r10, 20 -> c1
	;;
#0:	if  c1 br @	.BB0_251
	;;
.BB0_221:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       ldm.f	r13, 0
#1:	       cmpu lt	r10, 28 -> c1
#2:	       add	r1, r13 -> r1
	;;
#0:	if  c1 br	.BB0_249
#1:	       stm.a	r31, r2, 0
#2:	       add	r13, r3 -> r2
	;;
#0:	       ldm.f	r13, 4
	;;
#0:	       stm.a	r31, r2, 0
#1:	       add	r1, 16 -> r2
	;;
.BB0_222:                               ;   in Loop: Header=BB0_102 Depth=1
#2:	       cmpu lt	r10, r2.26 -> c1
#0:	       ldm.f	r13, 8
	;;
#0:	if !c1 br	.BB0_250
#1:	       stm.a	r31, r2, 0
#2:	       add	r1, 24 -> r2
	;;
#0:	       ldm.f	r13, 12
	;;
#0:	       stm.a	r31, r1, 5
	;;
.BB0_223:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       add	r13, 16 -> r13
#1:	       br @	.BB0_251
	;;
.BB0_224:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       cmpu ge	r13, r14 -> c1
	;;
#0:	if  c1 br @	.BB0_253
	;;
.BB0_225:                               ;   in Loop: Header=BB0_102 Depth=1
#2:	       cmpu le	r2.24, r14 -> c1
	;;
#0:	if  c1 br @	.BB0_252
	;;
.BB0_226:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       cmp eq	r10, 0 -> c3
	;;
#0:	if  c3 br @	.BB0_275
	;;
.BB0_227:                               ;   Parent Loop BB0_102 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       add	r13, r12 -> r0
#1:	       add	r14, r12 -> r3
#2:	       sub	r12, 1 -> r12
	;;
#0:	       cmp eq	r12, 4 -> c1
#1:	       ldm.f	r0, -5
#2:	       sub	r0, 1 -> r1
	;;
#0:	if  c1 br	.BB0_275
#1:	if !c1 br	.BB0_227
#2:	       bbh	mzext8 r1 -> r0
#3:	       sub	r3, 5 -> r1
	;;
#0:	       stmb.a	r0, r1, 0
	;;
	       nop	0
	;;
.BB0_228:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       or	r13, 0 -> r1
#1:	       br @	.BB0_231
#2:	       or	r14, 0 -> r0
	;;
.BB0_229:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       add	r13, 8 -> r1
#1:	       br @	.BB0_231
	;;
.BB0_230:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       add	r13, 16 -> r1
	;;
.BB0_231:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       ldm.f	r1, 0
	;;
#0:	       stm.a	r31, r0, 0
	;;
#0:	       ldm.f	r1, 4
	;;
#0:	       br	.BB0_275
#1:	       stm.a	r31, r0, 1
	;;
#0:	       ldm.f	r1, 8
	;;
#0:	       stm.a	r31, r0, 2
	;;
.BB0_232:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       cmpu lt	r10, 16 -> c1
	;;
#0:	if  c1 br @	.BB0_256
	;;
.BB0_233:                               ; %.thread
                                        ;   in Loop: Header=BB0_102 Depth=1
#0:	       or	r14, r13 -> r0
	;;
#0:	       and	r0, 3 -> r0
	;;
#0:	       cmp ne	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB0_256
	;;
.BB0_234:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       cmpu lt	r10, 16 -> c1
	;;
#0:	if  c1 br @	.BB0_257
	;;
.BB0_235:                               ; %.lr.ph10.i.preheader
                                        ;   in Loop: Header=BB0_102 Depth=1
#0:	       ldi	0 -> r0
#1:	       add	r13, 12 -> r6
	;;
#0:	       sub	r0, r5 -> r0
	;;
.BB0_236:                               ; %.lr.ph10.i
                                        ;   Parent Loop BB0_102 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       add	r6, r0 -> r7
#1:	       ldm.f	r6, -12
#2:	       sub	r10, 16 -> r10
	;;
#0:	       sub	r7, 12 -> r8
#1:	       cmpu gt	r10, 15 -> c1
	;;
#0:	       stm.a	r31, r8, 0
#1:	       sub	r7, 8 -> r8
	;;
#0:	       ldm.f	r6, -8
	;;
#0:	       stm.a	r31, r8, 0
#1:	       sub	r7, 4 -> r8
	;;
#0:	       ldm.f	r6, -4
	;;
#0:	if  c1 br	.BB0_236
#1:	       stm.a	r31, r8, 0
#2:	       add	r6, 16 -> r8
	;;
#0:	       ldm.f	r6, 0
#1:	       or	r8, 0 -> r6
	;;
#0:	       stm.a	r31, r7, 0
	;;
.BB0_237:                               ; %.preheader.i.loopexit
                                        ;   in Loop: Header=BB0_102 Depth=1
#0:	       sub	r8, r5 -> r0
#1:	       br	.BB0_277
	;;
#0:	       sub	r0, 12 -> r5
#1:	       sub	r8, 12 -> r0
	;;
	       nop	0
	;;
.BB0_238:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       cmp lt	r4, 1 -> c1
	;;
#0:	if  c1 br @	.BB0_259
	;;
.BB0_239:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       cmp le	r10, r4 -> c1
	;;
#0:	if  c1 br @	.BB0_258
	;;
.BB0_240:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       cmp eq	r10, 0 -> c3
	;;
#0:	if  c3 br @	.BB0_158
	;;
.BB0_241:                               ; %.lr.ph24.i1
                                        ;   in Loop: Header=BB0_102 Depth=1
#0:	       sub	r13, r5 -> r1
	;;
.BB0_242:                               ;   Parent Loop BB0_102 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       add	r13, r12 -> r2
	;;
#0:	       ldm.f	r2, -5
#1:	       sub	r2, 1 -> r3
	;;
#0:	       bbh	mzext8 r3 -> r2
#1:	       add	r1, r12 -> r3
#2:	       sub	r12, 1 -> r12
	;;
#0:	       cmp eq	r12, 4 -> c1
#1:	       sub	r3, 5 -> r3
	;;
#0:	if  c1 br @	.BB0_158
#1:	if !c1 br @	.BB0_242
#2:	       stmb.a	r2, r3, 0
	;;
.BB0_243:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       add	r13, 8 -> r13
#1:	       br @	.BB0_251
	;;
.BB0_244:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       cmp lt	r4, 1 -> c1
	;;
#0:	if  c1 br @	.BB0_265
	;;
.BB0_245:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       cmp le	r10, r4 -> c1
	;;
#0:	if  c1 br @	.BB0_264
	;;
.BB0_246:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       cmp eq	r10, 0 -> c3
	;;
#0:	if  c3 br @	.BB0_158
	;;
.BB0_247:                               ; %.lr.ph24.i59
                                        ;   in Loop: Header=BB0_102 Depth=1
#0:	       sub	r13, r5 -> r1
	;;
.BB0_248:                               ;   Parent Loop BB0_102 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       add	r13, r12 -> r2
	;;
#0:	       ldm.f	r2, -5
#1:	       sub	r2, 1 -> r3
	;;
#0:	       bbh	mzext8 r3 -> r2
#1:	       add	r1, r12 -> r3
#2:	       sub	r12, 1 -> r12
	;;
#0:	       cmp eq	r12, 4 -> c1
#1:	       sub	r3, 5 -> r3
	;;
#0:	if  c1 br @	.BB0_158
#1:	if !c1 br @	.BB0_248
#2:	       stmb.a	r2, r3, 0
	;;
.BB0_249:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       add	r13, 8 -> r13
#1:	       br @	.BB0_251
	;;
.BB0_250:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       ldm.f	r13, 16
	;;
#0:	       stm.a	r31, r2, 0
#1:	       s2add	r1, 8 -> r2
	;;
#0:	       ldm.f	r13, 20
#1:	       add	r13, 24 -> r13
	;;
#0:	       stm.a	r31, r1, 7
	;;
.BB0_251:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       ldm.f	r13, 0
	;;
#0:	       stm.a	r31, r2, 0
	;;
#0:	       ldm.f	r13, 4
	;;
#0:	       br	.BB0_158
#1:	       stm.a	r31, r2, 1
	;;
#0:	       ldm.f	r13, 8
	;;
#0:	       stm.a	r31, r2, 2
	;;
.BB0_252:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       cmpu lt	r10, 16 -> c1
	;;
#0:	if  c1 br @	.BB0_270
	;;
.BB0_253:                               ; %.thread235
                                        ;   in Loop: Header=BB0_102 Depth=1
#0:	       or	r14, r13 -> r0
	;;
#0:	       and	r0, 3 -> r0
	;;
#0:	       brz ne @	r0, .BB0_270
	;;
.BB0_254:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       cmpu gt	r10, 15 -> c1
#1:	       or	r13, 0 -> r0
#2:	       or	r14, 0 -> r1
#3:	       or	r13, 0 -> r2
	;;
#0:	if !c1 br @	.BB0_272
#1:	       or	r14, 0 -> r3
	;;
.BB0_255:                               ; %.lr.ph10.i99
                                        ;   Parent Loop BB0_102 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r2, 0
#1:	       sub	r10, 16 -> r10
#2:	       add	r3, 16 -> r1
#3:	       add	r2, 16 -> r0
	;;
#0:	       cmpu gt	r10, 15 -> c1
	;;
#0:	       stm.a	r31, r3, 0
	;;
#0:	       ldm.f	r2, 4
	;;
#0:	       stm.a	r31, r3, 1
	;;
#0:	       ldm.f	r2, 8
	;;
#0:	if !c1 br	.BB0_272
#1:	if  c1 br	.BB0_255
#2:	       stm.a	r31, r3, 2
	;;
#0:	       ldm.f	r2, 12
#1:	       or	r0, 0 -> r2
	;;
#0:	       stm.a	r31, r3, 3
#1:	       or	r1, 0 -> r3
	;;
.BB0_256:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       or	r13, 0 -> r0
#1:	       br @	.BB0_278
#2:	       or	r14, 0 -> r5
	;;
.BB0_257:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       or	r13, 0 -> r0
#1:	       br @	.BB0_277
#2:	       or	r14, 0 -> r5
	;;
.BB0_258:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       cmpu lt	r10, 16 -> c1
	;;
#0:	if  c1 br @	.BB0_283
	;;
.BB0_259:                               ; %.thread233
                                        ;   in Loop: Header=BB0_102 Depth=1
#0:	       or	r2, r13 -> r1
	;;
#0:	       and	r1, 3 -> r1
	;;
#0:	       cmp ne	r1, 0 -> c3
	;;
#0:	if  c3 br @	.BB0_283
	;;
.BB0_260:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       cmpu lt	r10, 16 -> c1
	;;
#0:	if  c1 br @	.BB0_282
	;;
.BB0_261:                               ; %.lr.ph10.i12.preheader
                                        ;   in Loop: Header=BB0_102 Depth=1
#0:	       ldi	0 -> r1
#1:	       add	r13, 12 -> r2
	;;
#0:	       sub	r1, r5 -> r1
	;;
.BB0_262:                               ; %.lr.ph10.i12
                                        ;   Parent Loop BB0_102 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       add	r2, r1 -> r3
#1:	       ldm.f	r2, -12
#2:	       sub	r10, 16 -> r10
	;;
#0:	       sub	r3, 12 -> r4
#1:	       cmpu gt	r10, 15 -> c1
	;;
#0:	       stm.a	r31, r4, 0
#1:	       sub	r3, 8 -> r4
	;;
#0:	       ldm.f	r2, -8
	;;
#0:	       stm.a	r31, r4, 0
#1:	       sub	r3, 4 -> r4
	;;
#0:	       ldm.f	r2, -4
	;;
#0:	if  c1 br	.BB0_262
#1:	       stm.a	r31, r4, 0
#2:	       add	r2, 16 -> r4
	;;
#0:	       ldm.f	r2, 0
#1:	       or	r4, 0 -> r2
	;;
#0:	       stm.a	r31, r3, 0
	;;
.BB0_263:                               ; %.preheader.i8.loopexit
                                        ;   in Loop: Header=BB0_102 Depth=1
#0:	       sub	r4, r5 -> r1
#1:	       br	.BB0_282
#2:	       sub	r4, 12 -> r13
	;;
#0:	       sub	r1, 12 -> r2
	;;
	       nop	0
	;;
.BB0_264:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       cmpu lt	r10, 16 -> c1
	;;
#0:	if  c1 br @	.BB0_287
	;;
.BB0_265:                               ; %.thread234
                                        ;   in Loop: Header=BB0_102 Depth=1
#0:	       or	r2, r13 -> r1
	;;
#0:	       and	r1, 3 -> r1
	;;
#0:	       brz ne @	r1, .BB0_287
	;;
.BB0_266:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       cmpu lt	r10, 16 -> c1
	;;
#0:	if  c1 br @	.BB0_286
	;;
.BB0_267:                               ; %.lr.ph10.i70.preheader
                                        ;   in Loop: Header=BB0_102 Depth=1
#0:	       ldi	0 -> r1
#1:	       add	r13, 12 -> r2
	;;
#0:	       sub	r1, r5 -> r1
	;;
.BB0_268:                               ; %.lr.ph10.i70
                                        ;   Parent Loop BB0_102 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       add	r2, r1 -> r3
#1:	       ldm.f	r2, -12
#2:	       sub	r10, 16 -> r10
	;;
#0:	       sub	r3, 12 -> r4
#1:	       cmpu gt	r10, 15 -> c1
	;;
#0:	       stm.a	r31, r4, 0
#1:	       sub	r3, 8 -> r4
	;;
#0:	       ldm.f	r2, -8
	;;
#0:	       stm.a	r31, r4, 0
#1:	       sub	r3, 4 -> r4
	;;
#0:	       ldm.f	r2, -4
	;;
#0:	if  c1 br	.BB0_268
#1:	       stm.a	r31, r4, 0
#2:	       add	r2, 16 -> r4
	;;
#0:	       ldm.f	r2, 0
#1:	       or	r4, 0 -> r2
	;;
#0:	       stm.a	r31, r3, 0
	;;
.BB0_269:                               ; %.preheader.i66.loopexit
                                        ;   in Loop: Header=BB0_102 Depth=1
#0:	       sub	r4, r5 -> r1
#1:	       br	.BB0_286
#2:	       sub	r4, 12 -> r13
	;;
#0:	       sub	r1, 12 -> r2
	;;
	       nop	0
	;;
.BB0_270:                               ;   in Loop: Header=BB0_102 Depth=1
#0:	       or	r13, 0 -> r0
#1:	       br @	.BB0_273
#2:	       or	r14, 0 -> r1
	;;
.BB0_271:                               ; %.lr.ph.i103
                                        ;   in Loop: Header=BB0_272 Depth=2
#0:	       ldm.f	r0, 0
#1:	       add	r0, 4 -> r0
#2:	       sub	r10, 4 -> r10
	;;
#0:	       stm.a	r31, r1, 0
#1:	       add	r1, 4 -> r1
	;;
.BB0_272:                               ; %.lr.ph.i103
                                        ;   Parent Loop BB0_102 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       cmpu gt	r10, 3 -> c1
	;;
#0:	if  c1 br @	.BB0_271
	;;
.BB0_273:                               ; %.preheader14.i111
                                        ;   in Loop: Header=BB0_102 Depth=1
#0:	       brz eq @	r10, .BB0_275
	;;
.BB0_274:                               ; %.lr.ph18.i115
                                        ;   Parent Loop BB0_102 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r0, 0
#1:	       sub	r10, 1 -> r10
	;;
#0:	       brz ne	r10, .BB0_274
#1:	       bbh	mzext8 r0 -> r2
#2:	       add	r0, 1 -> r0
	;;
#0:	       stmb.a	r2, r1, 0
#1:	       add	r1, 1 -> r1
	;;
	       nop	0
	;;
.BB0_275:                               ; %memmove.exit116
                                        ;   in Loop: Header=BB0_102 Depth=1
#0:	       or	r13, 0 -> r0
#1:	       callg	__free_r
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       br @	.BB0_162
	;;
.BB0_276:                               ; %.lr.ph.i
                                        ;   in Loop: Header=BB0_277 Depth=2
#0:	       ldm.f	r0, 0
#1:	       add	r0, 4 -> r0
#2:	       sub	r10, 4 -> r10
	;;
#0:	       stm.a	r31, r5, 0
#1:	       add	r5, 4 -> r5
	;;
.BB0_277:                               ; %.lr.ph.i
                                        ;   Parent Loop BB0_102 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       cmpu gt	r10, 3 -> c1
	;;
#0:	if  c1 br @	.BB0_276
	;;
.BB0_278:                               ; %.preheader14.i
                                        ;   in Loop: Header=BB0_102 Depth=1
#0:	       brz eq @	r10, .BB0_280
	;;
.BB0_279:                               ; %.lr.ph18.i
                                        ;   Parent Loop BB0_102 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r0, 0
#1:	       sub	r10, 1 -> r10
	;;
#0:	       brz ne	r10, .BB0_279
#1:	       bbh	mzext8 r0 -> r6
#2:	       add	r0, 1 -> r0
	;;
#0:	       stmb.a	r6, r5, 0
#1:	       add	r5, 1 -> r5
	;;
	       nop	0
	;;
.BB0_280:                               ; %memmove.exit
                                        ;   in Loop: Header=BB0_102 Depth=1
#2:	       add	r1, r2.28 -> r0
#0:	       ldga	___malloc_av_ -> r1
	;;
#0:	       add	r13, r0 -> r0
	;;
#0:	       stm.a	r0, r1, 2
#2:	       sub	r12, r2.28 -> r1
	;;
#0:	       add	r1, r2 -> r1
	;;
#0:	       add	r1, r3 -> r1
	;;
#0:	       or	r1, 1 -> r1
	;;
#0:	       stm.a	r1, r0, 1
#1:	       add	r13, r4 -> r0
	;;
#0:	       ldmr.f	r4, r13, 0
	;;
#0:	       br	.BB0_162
#1:	       and	r31, 1 -> r1
	;;
#2:	       or	r1, r2.28 -> r1
	;;
#0:	       stm.a	r1, r0, 0
	;;
.BB0_281:                               ; %.lr.ph.i16
                                        ;   in Loop: Header=BB0_282 Depth=2
#0:	       ldm.f	r13, 0
#1:	       add	r13, 4 -> r13
#2:	       sub	r10, 4 -> r10
	;;
#0:	       stm.a	r31, r2, 0
#1:	       add	r2, 4 -> r2
	;;
.BB0_282:                               ; %.lr.ph.i16
                                        ;   Parent Loop BB0_102 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       cmpu gt	r10, 3 -> c1
	;;
#0:	if  c1 br @	.BB0_281
	;;
.BB0_283:                               ; %.preheader14.i24
                                        ;   in Loop: Header=BB0_102 Depth=1
#0:	       cmp eq	r10, 0 -> c3
	;;
#0:	if  c3 br @	.BB0_158
	;;
.BB0_284:                               ; %.lr.ph18.i28
                                        ;   Parent Loop BB0_102 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r13, 0
#1:	       sub	r10, 1 -> r10
	;;
#0:	       brz ne	r10, .BB0_284
#1:	       bbh	mzext8 r13 -> r1
#2:	       add	r13, 1 -> r13
	;;
#0:	       stmb.a	r1, r2, 0
#1:	       add	r2, 1 -> r2
	;;
	       nop	0
	;;
#0:	       br @	.BB0_158
	;;
.BB0_285:                               ; %.lr.ph.i74
                                        ;   in Loop: Header=BB0_286 Depth=2
#0:	       ldm.f	r13, 0
#1:	       add	r13, 4 -> r13
#2:	       sub	r10, 4 -> r10
	;;
#0:	       stm.a	r31, r2, 0
#1:	       add	r2, 4 -> r2
	;;
.BB0_286:                               ; %.lr.ph.i74
                                        ;   Parent Loop BB0_102 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       cmpu gt	r10, 3 -> c1
	;;
#0:	if  c1 br @	.BB0_285
	;;
.BB0_287:                               ; %.preheader14.i82
                                        ;   in Loop: Header=BB0_102 Depth=1
#0:	       cmp eq	r10, 0 -> c3
	;;
#0:	if  c3 br @	.BB0_158
	;;
.BB0_288:                               ; %.lr.ph18.i86
                                        ;   Parent Loop BB0_102 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r13, 0
#1:	       sub	r10, 1 -> r10
	;;
#0:	       brz ne	r10, .BB0_288
#1:	       bbh	mzext8 r13 -> r1
#2:	       add	r13, 1 -> r13
	;;
#0:	       stmb.a	r1, r2, 0
#1:	       add	r2, 1 -> r2
	;;
	       nop	0
	;;
#0:	       br @	.BB0_158
	;;
.BB0_289:                               ; %_realloc_r.exit.i.i.thread.loopexit
#3:	       ldm.f	r3.26, 16
#0:	       br	.BB0_291
	;;
#0:	       or	r31, 0 -> r13
	;;
	       nop	0
	;;
.BB0_290:
#0:	       ldga	_impure_data -> r0
	;;
#0:	       stm.a	12, r0, 0
	;;
.BB0_291:                               ; %_realloc_r.exit.i.i.thread
#0:	       or	r13, 0 -> r0
#1:	       callg	__free_r
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB0_292:
#0:	       ldga	_impure_data -> r0
	;;
#0:	       stm.a	12, r0, 0
	;;
.BB0_293:                               ; %.loopexit2.i.i
#3:	       ldm.f	r3.26, 12
#0:	       ldi	64 -> r1
	;;
#3:	       bbh	mzext16 r3.26 -> r0
	;;
#0:	       or	r0, r1 -> r0
	;;
#3:	       stmh.a	r0, r3.26, 6
	;;
.BB0_294:                               ; %puts.exit
#0:	       ldm.s	r15, 64
#1:	       ldi	0 -> r0
	;;
#0:	       stx	r31 -> $ro
#1:	       ldm.s	r15, 68
	;;
#0:	       stx	r31 -> $rb
#1:	       ldm.s	r15, 72
	;;
#2:	       or	r31, 0 -> r2.29
#0:	       ldm.s	r15, 76
	;;
#2:	       or	r31, 0 -> r2.28
#0:	       ldm.s	r15, 80
	;;
#2:	       or	r31, 0 -> r2.27
#0:	       ldm.s	r15, 84
	;;
#3:	       or	r31, 0 -> r3.26
#0:	       ldm.s	r15, 88
	;;
#2:	       or	r31, 0 -> r2.26
#0:	       ldm.s	r15, 92
	;;
#3:	       or	r31, 0 -> r3.25
#0:	       ldm.s	r15, 96
	;;
#2:	       or	r31, 0 -> r2.25
#0:	       ldm.s	r15, 100
	;;
#3:	       or	r31, 0 -> r3.24
#0:	       ldm.s	r15, 104
	;;
#2:	       or	r31, 0 -> r2.24
#0:	       ldm.s	r15, 108
	;;
#1:	       or	r31, 0 -> r1.24
#0:	       ldm.s	r15, 112
	;;
#0:	       or	r31, 0 -> r0.24
#1:	       ldm.s	r15, 116
	;;
#3:	       or	r31, 0 -> r3.23
#0:	       ldm.s	r15, 120
	;;
#2:	       or	r31, 0 -> r2.23
#0:	       ldm.s	r15, 124
	;;
#1:	       or	r31, 0 -> r1.23
#0:	       ldm.s	r15, 128
	;;
#0:	       or	r31, 0 -> r0.23
#1:	       ldm.s	r15, 132
	;;
#0:	       or	r31, 0 -> r14
#1:	       ldm.s	r15, 136
	;;
#0:	       or	r31, 0 -> r13
#1:	       ldm.s	r15, 140
	;;
#0:	       or	r31, 0 -> r12
#1:	       ldm.s	r15, 144
	;;
#0:	       or	r31, 0 -> r11
#1:	       ldm.s	r15, 148
#2:	       addi	168 -> r15
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
.tmp0:
	.size	_main, .tmp0-_main

	.globl	_memcpy
	.type	_memcpy,@function
_memcpy:                                ; @memcpy
	.funsz	_memcpy_end-_memcpy
_memcpy_start:
; BB#0:
#0:	       cmpu lt	r2, 16 -> c1
	;;
#0:	if  c1 br @	.BB1_2
	;;
.BB1_1:
#0:	       or	r1, r0 -> r3
	;;
#0:	       and	r3, 3 -> r3
	;;
#0:	       brz eq @	r3, .BB1_3
	;;
.BB1_2:
#0:	       or	r1, 0 -> r3
#1:	       br @	.BB1_9
#2:	       or	r0, 0 -> r4
	;;
.BB1_3:
#0:	       cmpu gt	r2, 15 -> c1
	;;
#0:	if !c1 br @	.BB1_6
	;;
.BB1_4:
#0:	       or	r0, 0 -> r5
	;;
.BB1_5:                                 ; %.lr.ph10
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r1, 0
#1:	       sub	r2, 16 -> r2
#2:	       add	r5, 16 -> r4
#3:	       add	r1, 16 -> r3
	;;
#0:	       cmpu gt	r2, 15 -> c1
	;;
#0:	       stm.a	r31, r5, 0
	;;
#0:	       ldm.f	r1, 4
	;;
#0:	       stm.a	r31, r5, 1
	;;
#0:	       ldm.f	r1, 8
	;;
#0:	if !c1 br	.BB1_8
#1:	if  c1 br	.BB1_5
#2:	       stm.a	r31, r5, 2
	;;
#0:	       ldm.f	r1, 12
#1:	       or	r3, 0 -> r1
	;;
#0:	       stm.a	r31, r5, 3
#1:	       or	r4, 0 -> r5
	;;
.BB1_6:
#0:	       or	r1, 0 -> r3
#1:	       br @	.BB1_8
#2:	       or	r0, 0 -> r4
	;;
.BB1_7:                                 ; %.lr.ph
                                        ;   in Loop: Header=BB1_8 Depth=1
#0:	       ldm.f	r3, 0
#1:	       add	r3, 4 -> r3
#2:	       sub	r2, 4 -> r2
	;;
#0:	       stm.a	r31, r4, 0
#1:	       add	r4, 4 -> r4
	;;
.BB1_8:                                 ; %.preheader
                                        ; =>This Inner Loop Header: Depth=1
#0:	       cmpu gt	r2, 3 -> c1
	;;
#0:	if  c1 br @	.BB1_7
	;;
.BB1_9:                                 ; %.preheader14
#0:	       brz eq @	r2, .BB1_11
	;;
.BB1_10:                                ; %.lr.ph18
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r3, 0
#1:	       sub	r2, 1 -> r2
	;;
#0:	       brz ne	r2, .BB1_10
#1:	       bbh	mzext8 r3 -> r1
#2:	       add	r3, 1 -> r3
	;;
#0:	       stmb.a	r1, r4, 0
#1:	       add	r4, 1 -> r4
	;;
	       nop	0
	;;
.BB1_11:                                ; %._crit_edge19
#0:	       jop	ret
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
_memcpy_end:
.tmp1:
	.size	_memcpy, .tmp1-_memcpy

	.globl	_memmove
	.type	_memmove,@function
_memmove:                               ; @memmove
	.funsz	_memmove_end-_memmove
_memmove_start:
; BB#0:
#0:	       cmpu ge	r1, r0 -> c1
	;;
#0:	if !c1 add	r1, r2 -> r3
	;;
#0:	if !c1 cmpu le	r3, r0 -> c1
	;;
#0:	if  c1 br @	.BB2_3
	;;
.BB2_1:
#0:	       brz eq @	r2, .BB2_14
	;;
.BB2_2:                                 ; =>This Inner Loop Header: Depth=1
#0:	       add	r1, r2 -> r3
#1:	       add	r0, r2 -> r9
#2:	       sub	r2, 1 -> r2
	;;
#0:	       brz ne	r2, .BB2_2
#1:	       ldm.f	r3, -1
#2:	       sub	r3, 1 -> r4
	;;
#0:	       brz eq	r2, .BB2_14
#1:	       bbh	mzext8 r4 -> r3
#2:	       sub	r9, 1 -> r4
	;;
#0:	       stmb.a	r3, r4, 0
	;;
	       nop	0
	;;
.BB2_3:
#0:	       cmpu lt	r2, 16 -> c1
	;;
#0:	if  c1 br @	.BB2_5
	;;
.BB2_4:
#0:	       or	r1, r0 -> r3
	;;
#0:	       and	r3, 3 -> r3
	;;
#0:	       brz eq @	r3, .BB2_6
	;;
.BB2_5:
#0:	       or	r1, 0 -> r3
#1:	       br @	.BB2_12
#2:	       or	r0, 0 -> r4
	;;
.BB2_6:
#0:	       cmpu gt	r2, 15 -> c1
	;;
#0:	if !c1 br @	.BB2_9
	;;
.BB2_7:
#0:	       or	r0, 0 -> r5
	;;
.BB2_8:                                 ; %.lr.ph10
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r1, 0
#1:	       sub	r2, 16 -> r2
#2:	       add	r5, 16 -> r4
#3:	       add	r1, 16 -> r3
	;;
#0:	       cmpu gt	r2, 15 -> c1
	;;
#0:	       stm.a	r31, r5, 0
	;;
#0:	       ldm.f	r1, 4
	;;
#0:	       stm.a	r31, r5, 1
	;;
#0:	       ldm.f	r1, 8
	;;
#0:	if !c1 br	.BB2_11
#1:	if  c1 br	.BB2_8
#2:	       stm.a	r31, r5, 2
	;;
#0:	       ldm.f	r1, 12
#1:	       or	r3, 0 -> r1
	;;
#0:	       stm.a	r31, r5, 3
#1:	       or	r4, 0 -> r5
	;;
.BB2_9:
#0:	       or	r1, 0 -> r3
#1:	       br @	.BB2_11
#2:	       or	r0, 0 -> r4
	;;
.BB2_10:                                ; %.lr.ph
                                        ;   in Loop: Header=BB2_11 Depth=1
#0:	       ldm.f	r3, 0
#1:	       add	r3, 4 -> r3
#2:	       sub	r2, 4 -> r2
	;;
#0:	       stm.a	r31, r4, 0
#1:	       add	r4, 4 -> r4
	;;
.BB2_11:                                ; %.preheader
                                        ; =>This Inner Loop Header: Depth=1
#0:	       cmpu gt	r2, 3 -> c1
	;;
#0:	if  c1 br @	.BB2_10
	;;
.BB2_12:                                ; %.preheader14
#0:	       brz eq @	r2, .BB2_14
	;;
.BB2_13:                                ; %.lr.ph18
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r3, 0
#1:	       sub	r2, 1 -> r2
	;;
#0:	       brz ne	r2, .BB2_13
#1:	       bbh	mzext8 r3 -> r1
#2:	       add	r3, 1 -> r3
	;;
#0:	       stmb.a	r1, r4, 0
#1:	       add	r4, 1 -> r4
	;;
	       nop	0
	;;
.BB2_14:                                ; %.loopexit
#0:	       jop	ret
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
_memmove_end:
.tmp2:
	.size	_memmove, .tmp2-_memmove

	.globl	_memset
	.type	_memset,@function
_memset:                                ; @memset
	.funsz	_memset_end-_memset
_memset_start:
; BB#0:
#0:	       bbh	zext8 r1 -> r4
#1:	       br @	.BB3_2
#2:	       ldi	0 -> r5
	;;
.BB3_1:                                 ;   in Loop: Header=BB3_2 Depth=1
#0:	       add	r5, 1 -> r5
#1:	       stmb.a	r1, r3, 0
	;;
.BB3_2:                                 ; =>This Inner Loop Header: Depth=1
#0:	       add	r0, r5 -> r3
	;;
#0:	       and	r3, 3 -> r6
	;;
#0:	       brz eq @	r6, .BB3_4
	;;
.BB3_3:                                 ;   in Loop: Header=BB3_2 Depth=1
#0:	       cmp eq	r2, r5 -> c1
	;;
#0:	if  c1 br @	.BB3_11
#1:	if !c1 br @	.BB3_1
	;;
.BB3_4:
#0:	       sub	r2, r5 -> r2
	;;
#0:	       cmpu lt	r2, 4 -> c1
	;;
#0:	if  c1 br @	.BB3_9
	;;
.BB3_5:
#0:	       sl	r4, 8 -> r3
#1:	       cmpu gt	r2, 15 -> c1
	;;
#0:	if !c1 br	.BB3_7
#1:	       or	r3, r4 -> r3
	;;
#0:	       sl	r3, 16 -> r4
	;;
#0:	       or	r4, r3 -> r4
#1:	       add	r0, r5 -> r3
	;;
.BB3_6:                                 ; %.lr.ph8
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sub	r2, 16 -> r2
#1:	       stm.a	r4, r3, 0
	;;
#0:	       cmpu gt	r2, 15 -> c1
#1:	       stm.a	r4, r3, 1
	;;
#0:	if !c1 br	.BB3_8
#1:	if  c1 br	.BB3_6
#2:	       stm.a	r4, r3, 2
	;;
#0:	       stm.a	r4, r3, 3
#1:	       add	r3, 16 -> r3
	;;
	       nop	0
	;;
.BB3_7:                                 ; %.lr.ph
#0:	       stm.a	r4, r3, 0
#1:	       add	r3, 4 -> r3
#2:	       sub	r2, 4 -> r2
	;;
.BB3_8:                                 ; %.lr.ph
#0:	       cmpu gt	r2, 3 -> c1
	;;
#0:	if  c1 br @	.BB3_7
	;;
.BB3_9:                                 ; %.preheader11
#0:	       brz eq @	r2, .BB3_11
	;;
.BB3_10:                                ; %.lr.ph14
                                        ; =>This Inner Loop Header: Depth=1
#0:	       stmb.a	r1, r3, 0
#1:	       add	r3, 1 -> r3
#2:	       sub	r2, 1 -> r2
	;;
#0:	       brz ne @	r2, .BB3_10
	;;
.BB3_11:                                ; %.loopexit
#0:	       jop	ret
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
_memset_end:
.tmp3:
	.size	_memset, .tmp3-_memset

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
#1:	       or	r0, 0 -> r10
	;;
#0:	       stm.s	r11, r15, 4
	;;
#0:	       stm.s	r12, r15, 3
	;;
#0:	       stm.s	r1, r15, 2
	;;
#0:	       stm.s	r3, r15, 1
	;;
#0:	       ldmg.d	_impure_data+56
	;;
#0:	       brz ne @	r31, .BB4_2
	;;
.BB4_1:
#0:	       callg	___sinit
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB4_2:
#0:	       ldm.f	r10, 12
#1:	       ldi	0 -> r0
	;;
#0:	       bbh	mzext16 r10 -> r1
	;;
#0:	       cmp eq	r1, 0 -> c3
	;;
#0:	if  c3 br @	.BB4_35
	;;
.BB4_3:
#0:	       bbh	sext16 r1 -> r2
	;;
#0:	       btest	r2, 3 -> c1
	;;
#0:	if !c1 br @	.BB4_12
	;;
.BB4_4:
#0:	       ldm.f	r10, 16
#1:	       ldi	0 -> r0
	;;
#0:	       or	r31, 0 -> r11
	;;
#0:	       cmp eq	r11, 0 -> c3
	;;
#0:	if  c3 br @	.BB4_35
	;;
.BB4_5:
#0:	       and	r2, 3 -> r2
#1:	       ldm.f	r10, 0
#2:	       ldi	0 -> r1
	;;
#0:	       brz ne @	r2, .BB4_7
#1:	       or	r31, 0 -> r0
#2:	       stm.a	r11, r10, 0
	;;
.BB4_6:
#0:	       ldm.f	r10, 20
	;;
#0:	       or	r31, 0 -> r1
	;;
.BB4_7:
#0:	       sub	r0, r11 -> r12
#1:	       br @	.BB4_9
#2:	       stm.a	r1, r10, 2
	;;
.BB4_8:                                 ;   in Loop: Header=BB4_9 Depth=1
#0:	       sub	r12, r0 -> r12
#1:	       add	r11, r0 -> r11
	;;
.BB4_9:                                 ; =>This Inner Loop Header: Depth=1
#0:	       cmp lt	r12, 1 -> c1
#1:	       ldi	0 -> r0
	;;
#0:	if  c1 br @	.BB4_35
	;;
.BB4_10:                                ;   in Loop: Header=BB4_9 Depth=1
#0:	       ldm.f	r10, 28
#1:	       ldga	_impure_data -> r0
#2:	       or	r11, 0 -> r2
#3:	       or	r12, 0 -> r3
	;;
#0:	       or	r31, 0 -> r1
#1:	       ldm.f	r10, 36
	;;
#0:	       jop	call	r31
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       brz gt @	r0, .BB4_8
	;;
.BB4_11:
#0:	       ldm.f	r10, 12
#1:	       ldi	64 -> r1
	;;
#0:	       br	.BB4_35
#1:	       bbh	mzext16 r10 -> r0
	;;
#0:	       or	r0, r1 -> r0
	;;
#0:	       stmh.a	r0, r10, 6
#1:	       ldi	-1 -> r0
	;;
.BB4_12:
#0:	       ldga	2048 -> r0
	;;
#0:	       or	r1, r0 -> r0
	;;
#0:	       stmh.a	r0, r10, 6
	;;
#0:	       ldm.f	r10, 4
	;;
#0:	       brz gt @	r31, .BB4_14
	;;
.BB4_13:
#0:	       ldm.f	r10, 60
#1:	       ldi	0 -> r0
	;;
#0:	       cmp lt	r31, 1 -> c1
	;;
#0:	if  c1 br @	.BB4_35
	;;
.BB4_14:
#0:	       ldm.f	r10, 40
#1:	       ldi	0 -> r0
	;;
#0:	       or	r31, 0 -> r4
	;;
#0:	       brz eq @	r4, .BB4_35
	;;
.BB4_15:
#0:	       btest	r1, 12 -> !c1
#1:	       ldmg.d	_impure_data
#2:	       ldga	_impure_data -> r0
	;;
#0:	if  c1 br @	.BB4_17
#1:	       or	r31, 0 -> r11
#2:	       stm.a	0, r0, 0
	;;
.BB4_16:
#0:	       ldm.f	r10, 80
#1:	       br	.BB4_19
	;;
#0:	       or	r31, 0 -> r2
	;;
	       nop	0
	;;
.BB4_17:
#0:	       ldm.f	r10, 28
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
#0:	if  c1 br @	.BB4_19
	;;
.BB4_18:
#0:	       ldmg.d	_impure_data
#1:	       ldi	-1 -> r2
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       brz ne @	r0, .BB4_31
	;;
.BB4_19:                                ; %._crit_edge2.i
#0:	       ldm.f	r10, 12
	;;
#0:	       bbh	mzext8 r10 -> r0
	;;
#0:	       btest	r0, 2 -> !c1
	;;
#0:	if  c1 br @	.BB4_22
	;;
.BB4_20:
#0:	       ldm.f	r10, 4
	;;
#0:	       sub	r2, r31 -> r2
#1:	       ldm.f	r10, 48
	;;
#0:	       brz eq @	r31, .BB4_22
	;;
.BB4_21:
#0:	       ldm.f	r10, 60
	;;
#0:	       sub	r2, r31 -> r2
	;;
.BB4_22:                                ; %._crit_edge.i
#0:	       ldm.f	r10, 28
#1:	       ldga	_impure_data -> r0
#2:	       ldi	0 -> r3
	;;
#0:	       or	r31, 0 -> r1
#1:	       ldm.f	r10, 40
	;;
#0:	       jop	call	r31
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       cmp ne	r0, -1 -> c1
	;;
#0:	if  c1 br @	.BB4_25
	;;
.BB4_23:
#0:	       ldmg.d	_impure_data
	;;
#0:	       or	r31, 0 -> r1
	;;
#0:	       cmpu gt	r1, 29 -> c1
	;;
#0:	if  c1 br @	.BB4_11
	;;
.BB4_24:
#0:	       ldiu	1 -> r3
#1:	       ldi	1 -> r2
	;;
#0:	       sl	r2, r1 -> r1
#1:	       ldih	258 -> r3
	;;
#0:	       and	r1, r3 -> r1
	;;
#0:	       brz eq @	r1, .BB4_11
	;;
.BB4_25:
#0:	       ldm.f	r10, 12
#1:	       ldiu	2047 -> r2
	;;
#0:	       ldim	30 -> r2
	;;
#0:	       bbh	mzext16 r10 -> r1
	;;
#0:	       and	r1, r2 -> r2
#1:	       btest	r1, 12 -> !c1
	;;
#0:	       stmh.a	r2, r10, 6
	;;
#0:	if  c1 br	.BB4_27
#1:	       stm.a	0, r10, 1
	;;
#0:	       ldm.f	r10, 16
	;;
#0:	       stm.a	r31, r10, 0
	;;
.BB4_26:
#0:	       ldmg.d	_impure_data
#1:	       cmp ne	r0, -1 -> c1
	;;
#0:	       cmp eq	r31, 0 -> c2
	;;
#0:	       comb	or c1, c2 -> c1
	;;
#0:	if  c1 stm.a	r0, r10, 20
	;;
.BB4_27:
#0:	       ldga	_impure_data -> r0
	;;
#0:	       stm.a	r11, r0, 0
#1:	       ldi	0 -> r0
	;;
#0:	       ldm.f	r10, 48
	;;
#0:	       or	r31, 0 -> r1
	;;
#0:	       brz eq @	r1, .BB4_35
	;;
.BB4_28:
#0:	       s2add	r10, 16 -> r0
	;;
#0:	       cmp eq	r1, r0 -> c1
	;;
#0:	if  c1 br @	.BB4_30
	;;
.BB4_29:
#0:	       or	r1, 0 -> r0
#1:	       callg	__free_r
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB4_30:
#0:	       stm.a	0, r10, 12
#1:	       br @	.BB4_34
	;;
.BB4_31:
#0:	       cmpu eq	r0, 22 -> c1
	;;
#0:	if  c1 br @	.BB4_33
	;;
.BB4_32:
#0:	       cmpu ne	r0, 29 -> c1
	;;
#0:	if  c1 br @	.BB4_11
	;;
.BB4_33:
#0:	       ldga	_impure_data -> r0
	;;
#0:	       stm.a	r11, r0, 0
	;;
.BB4_34:
#0:	       ldi	0 -> r0
	;;
.BB4_35:                                ; %__sflush_r.exit
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
__fflush_r_end:
.tmp4:
	.size	__fflush_r, .tmp4-__fflush_r

	.type	__free_r,@function
__free_r:                               ; @_free_r
	.funsz	__free_r_end-__free_r
__free_r_start:
; BB#0:
#0:	       cmp eq	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB5_41
	;;
.BB5_1:
#0:	       ldm.f	r0, -4
#1:	       ldi	-2 -> r1
	;;
#0:	       or	r31, 0 -> r7
	;;
#0:	       and	r7, r1 -> r4
#1:	       ldi	-4 -> r1
	;;
#1:	       add	r4, r0 -> r1.16
#0:	       sub	r4, 4 -> r6
	;;
#0:	       ldmr.f	r6, r0, 0
	;;
#0:	       and	r31, r1 -> r5
#1:	       sub	r1.16, 8 -> r1
#2:	       ldmg.d	___malloc_av_+8
	;;
#0:	       cmp ne	r1, r31 -> c1
#1:	       sub	r0, 8 -> r1
	;;
#0:	if !c1 br @	.BB5_4
	;;
.BB5_2:
#0:	       btest	r7, 0 -> c1
#1:	       add	r0, r6 -> r2
	;;
#0:	if !c1 br @	.BB5_13
#1:	       stm.a	r5, r2, 0
	;;
.BB5_3:
#0:	       ldi	0 -> r7
#1:	       br @	.BB5_14
#2:	       or	r4, 0 -> r2
	;;
.BB5_4:
#0:	       btest	r7, 0 -> c1
#1:	       add	r5, r4 -> r2
	;;
#0:	if  c1 br @	.BB5_6
	;;
.BB5_5:
#0:	       ldm.f	r0, -8
#1:	       ldi	-8 -> r1
	;;
#0:	       or	r31, 0 -> r3
	;;
#0:	       sub	r1, r3 -> r1
#1:	       add	r3, r2 -> r2
	;;
#0:	       add	r0, r1 -> r1
	;;
#0:	       ldm.f	r1, 8
	;;
#0:	       or	r31, 0 -> r0
#1:	       ldm.f	r1, 12
	;;
#0:	       stm.a	r31, r0, 3
	;;
#0:	       stm.a	r0, r31, 2
	;;
.BB5_6:
#0:	       or	r2, 1 -> r0
#1:	       ldga	___malloc_av_ -> r3
	;;
#0:	       stm.a	r0, r1, 1
	;;
#0:	       stm.a	r1, r3, 2
#1:	       ldga	131072 -> r3
	;;
#0:	       cmpu lt	r2, r3 -> c1
	;;
#0:	if  c1 br @	.BB5_41
	;;
.BB5_7:
#0:	       ldi	-4 -> r0
#1:	       ldiu	0 -> r3
	;;
#0:	       and	r2, r0 -> r4
#1:	       ldim	2046 -> r3
	;;
#0:	       sub	r4, 17 -> r0
	;;
#0:	       and	r0, r3 -> r2
#1:	       ldga	4096 -> r3
	;;
#0:	       cmp lt	r2, r3 -> c1
	;;
#0:	if  c1 br @	.BB5_41
	;;
.BB5_8:
#0:	       ldmg.d	__sbrk.heap_end
#1:	       ldga	_errno.b -> r0
	;;
#0:	       brz ne	r31, .BB5_10
#1:	       stmb.a	0, r0, 0
	;;
#0:	       or	r31, 0 -> r0
	;;
	       nop	0
	;;
.BB5_9:
#0:	       ldga	__sbrk.heap_end -> r3
#1:	       ldga	_end -> r0
	;;
#0:	       stm.a	r0, r3, 0
	;;
.BB5_10:                                ; %_sbrk_r.exit.i
#0:	       ldga	__sbrk.heap_end -> r0.16
#1:	       add	r1, r4 -> r3
	;;
#0:	       stm.a	r0, r0.16, 0
#1:	       cmp ne	r0, r3 -> c1
	;;
#0:	if  c1 br @	.BB5_41
	;;
.BB5_11:                                ; %_sbrk_r.exit8.i
#3:	       ldga	_errno.b -> r3.16
#0:	       cmp ne	r0, -1 -> c1
#1:	       sub	r0, r2 -> r3
	;;
#0:	if !c1 br	.BB5_27
#3:	       stmb.a	0, r3.16, 0
	;;
#0:	       stm.a	r3, r0.16, 0
	;;
	       nop	0
	;;
.BB5_12:
#0:	       sub	r4, r2 -> r0
	;;
#0:	       or	r0, 1 -> r0
	;;
#0:	       stm.a	r0, r1, 1
#1:	       ldga	___malloc_current_mallinfo.0 -> r1
	;;
#0:	       jop	ret
	;;
#0:	       ldmg.d	___malloc_current_mallinfo.0
	;;
#0:	       sub	r31, r2 -> r3
	;;
#0:	       stm.a	r3, r1, 0
	;;
.BB5_13:
#0:	       ldm.f	r0, -8
#1:	       ldi	-8 -> r1
#2:	       ldga	___malloc_av_+8 -> r3
#3:	       ldi	1 -> r7
	;;
#0:	       sub	r1, r31 -> r9
#1:	       add	r31, r4 -> r2
	;;
#0:	       add	r0, r9 -> r1
	;;
#0:	       ldm.f	r1, 8
	;;
#0:	       or	r31, 0 -> r8
	;;
#0:	       cmp eq	r8, r3 -> c1
	;;
#0:	if !c1 add	r9, r0 -> r3
#1:	if !c1 ldi	0 -> r7
	;;
#0:	if !c1 ldm.f	r3, 12
	;;
#0:	if !c1 stm.a	r31, r8, 3
	;;
#0:	if !c1 stm.a	r8, r31, 2
	;;
.BB5_14:
#0:	       add	r6, r5 -> r3
	;;
#0:	       ldmr.f	r3, r0, 0
	;;
#0:	       btest	r31, 0 -> c1
	;;
#0:	if  c1 br @	.BB5_17
	;;
.BB5_15:
#0:	       ldmr.f	r4, r0, 0
#1:	       ldga	___malloc_av_+8 -> r3
#2:	       cmp eq	r7, 0 -> c2
#3:	       add	r2, r5 -> r2
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       cmp eq	r0, r3 -> c1
	;;
#0:	       comb	and c2, c1 -> c1
	;;
#0:	if  c1 br @	.BB5_42
	;;
.BB5_16:                                ; %._crit_edge
#1:	       ldm.f	r1.16, 4
	;;
#0:	       stm.a	r31, r0, 3
	;;
#0:	       stm.a	r0, r31, 2
	;;
.BB5_17:                                ; %._crit_edge
#0:	       cmp ne	r7, 0 -> c3
#1:	       or	r2, 1 -> r0
#2:	       add	r1, r2 -> r3
	;;
#0:	if  c3 br	.BB5_41
#1:	       stm.a	r0, r1, 1
	;;
#0:	       stm.a	r2, r3, 0
	;;
	       nop	0
	;;
.BB5_18:
#0:	       ldi	511 -> r0
	;;
#0:	       cmpu gt	r2, r0 -> c1
	;;
#0:	if !c1 br @	.BB5_43
	;;
.BB5_19:
#0:	       sr	r2, 9 -> r0
	;;
#0:	       brz eq @	r0, .BB5_22
	;;
.BB5_20:
#0:	       ldiu	511 -> r4
#1:	       ldiu	511 -> r3
	;;
#0:	       ldim	1 -> r4
	;;
#0:	       cmpu gt	r2, r4 -> c1
	;;
#0:	if  c1 br @	.BB5_23
	;;
.BB5_21:
#0:	       sr	r2, 6 -> r0
#1:	       br	.BB5_34
	;;
#0:	       s2add	r0, 14 -> r0
	;;
	       nop	0
	;;
.BB5_22:
#0:	       sr	r2, 3 -> r0
#1:	       br @	.BB5_34
	;;
.BB5_23:
#0:	       ldim	5 -> r3
	;;
#0:	       cmpu gt	r2, r3 -> c1
	;;
#0:	if  c1 br @	.BB5_25
	;;
.BB5_24:
#0:	       addi	91 -> r0
#1:	       br @	.BB5_34
	;;
.BB5_25:
#0:	       ldiu	511 -> r3
#1:	       ldiu	511 -> r0
	;;
#0:	       ldim	21 -> r3
	;;
#0:	       cmpu gt	r2, r3 -> c1
	;;
#0:	if  c1 br @	.BB5_31
	;;
.BB5_26:
#0:	       sr	r2, 12 -> r0
#1:	       br	.BB5_34
	;;
#0:	       addi	110 -> r0
	;;
	       nop	0
	;;
.BB5_27:
#3:	       stmb.a	0, r3.16, 0
#0:	       brz ne @	r3, .BB5_29
	;;
.BB5_28:
#0:	       ldga	__sbrk.heap_end -> r0
#1:	       ldga	_end -> r3
	;;
#0:	       stm.a	r3, r0, 0
	;;
.BB5_29:                                ; %_sbrk_r.exit4.i
#0:	       ldga	__sbrk.heap_end -> r0
#1:	       ldi	16 -> r2
	;;
#0:	       stm.a	r3, r0, 0
#1:	       sub	r3, r1 -> r0
	;;
#0:	       cmp lt	r0, r2 -> c1
	;;
#0:	if  c1 br @	.BB5_41
	;;
.BB5_30:
#0:	       ldmg.d	___malloc_sbrk_base
#1:	       or	r0, 1 -> r0
	;;
#0:	       jop	ret
#1:	       sub	r3, r31 -> r2
#2:	       ldga	___malloc_current_mallinfo.0 -> r3
	;;
#0:	       stm.a	r2, r3, 0
	;;
#0:	       stm.a	r0, r1, 1
	;;
	       nop	0
	;;
.BB5_31:
#0:	       ldim	85 -> r0
	;;
#0:	       cmpu gt	r2, r0 -> c1
	;;
#0:	if  c1 br @	.BB5_33
	;;
.BB5_32:
#0:	       sr	r2, 15 -> r0
#1:	       br	.BB5_34
	;;
#0:	       addi	119 -> r0
	;;
	       nop	0
	;;
.BB5_33:
#0:	       ldiu	511 -> r0
#1:	       ldi	126 -> r3
	;;
#0:	       ldim	341 -> r0
	;;
#0:	       cmpu gt	r2, r0 -> c1
	;;
#0:	if !c1 sr	r2, 18 -> r0
	;;
#0:	if !c1 s2add	r0, 31 -> r0
	;;
.BB5_34:
#2:	       ldga	___malloc_av_ -> r2.16
#0:	       sl	r0, 3 -> r3
	;;
#2:	       add	r2.16, r3 -> r3
	;;
#0:	       ldm.f	r3, 8
	;;
#0:	       or	r31, 0 -> r4
	;;
#0:	       cmp ne	r4, r3 -> c1
	;;
#0:	if !c1 br @	.BB5_39
	;;
.BB5_35:
#0:	       ldi	-4 -> r0
#1:	       br @	.BB5_37
	;;
.BB5_36:                                ;   in Loop: Header=BB5_37 Depth=1
#0:	       ldm.f	r4, 8
	;;
#0:	       or	r31, 0 -> r4
	;;
.BB5_37:                                ; %.preheader
                                        ; =>This Inner Loop Header: Depth=1
#0:	       cmp eq	r4, r3 -> c1
	;;
#0:	if !c1 ldm.f	r4, 4
	;;
#0:	if !c1 and	r31, r0 -> r5
	;;
#0:	if !c1 cmpu ge	r2, r5 -> c1
	;;
#0:	if !c1 br @	.BB5_36
	;;
.BB5_38:                                ; %.critedge
#0:	       ldm.f	r4, 12
#1:	       br	.BB5_40
	;;
#0:	       or	r31, 0 -> r3
	;;
	       nop	0
	;;
.BB5_39:
#0:	       sra	r0, 31 -> r2
#1:	       ldmg.d	___malloc_av_+4
#2:	       or	r3, 0 -> r4
	;;
#0:	       sr	r2, 30 -> r2
	;;
#0:	       add	r0, r2 -> r2
	;;
#0:	       sra	r2, 2 -> r0
#1:	       ldi	1 -> r2
	;;
#0:	       sl	r2, r0 -> r0
	;;
#0:	       or	r31, r0 -> r0
	;;
#2:	       stm.a	r0, r2.16, 1
	;;
.BB5_40:
#0:	       stm.a	r3, r1, 3
	;;
#0:	       stm.a	r4, r1, 2
	;;
#0:	       stm.a	r1, r3, 2
	;;
#0:	       stm.a	r1, r4, 3
	;;
.BB5_41:                                ; %_malloc_trim_r.exit
#0:	       jop	ret
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB5_42:                                ; %.thread
#0:	       ldga	___malloc_av_ -> r0
	;;
#0:	       stm.a	r1, r0, 5
	;;
#0:	       stm.a	r1, r0, 4
#1:	       or	r2, 1 -> r0
	;;
#0:	       stm.a	r3, r1, 3
	;;
#0:	       jop	ret
	;;
#0:	       stm.a	r3, r1, 2
#1:	       add	r1, r2 -> r3
	;;
#0:	       stm.a	r0, r1, 1
	;;
#0:	       stm.a	r2, r3, 0
	;;
.BB5_43:
#0:	       sr	r2, 5 -> r0
#1:	       ldi	1 -> r3
#2:	       ldmg.d	___malloc_av_+4
	;;
#0:	       sl	r3, r0 -> r0
	;;
#0:	       or	r31, r0 -> r3
#1:	       ldga	___malloc_av_ -> r0
	;;
#0:	       stm.a	r3, r0, 1
#1:	       ldi	-8 -> r3
	;;
#0:	       and	r2, r3 -> r3
	;;
#0:	       add	r0, r3 -> r0
	;;
#0:	       ldm.f	r0, 8
	;;
#0:	       stm.a	r0, r1, 3
	;;
#0:	       stm.a	r31, r1, 2
	;;
#0:	       stm.a	r1, r0, 2
	;;
#0:	       stm.a	r1, r31, 3
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
.tmp5:
	.size	__free_r, .tmp5-__free_r

	.type	__malloc_r,@function
__malloc_r:                             ; @_malloc_r
	.funsz	__malloc_r_end-__malloc_r
__malloc_r_start:
; BB#0:
#0:	       wb.s	r15, 8
#1:	       addi	-32 -> r15
#2:	       add	r0, 11 -> r1
#3:	       ldi	-8 -> r2
	;;
#0:	       stm.s	r10, r15, 3
#1:	       cmpu lt	r1, 23 -> c1
#2:	       ldi	16 -> r10
#3:	       ldx	$rb, 0 -> r3
	;;
#0:	if !c1 and	r1, r2 -> r10 ; aaaf
#1:	       stm.s	r3, r15, 2
#2:	       ldx	$ro, 0 -> r3
	;;
#0:	       cmpu lt	r10, r0 -> c1
#1:	       cmp lt	r10, 0 -> c2
#2:	       stm.s	r3, r15, 1
	;;
#0:	       comb	or c2, c1 -> c1
	;;
#0:	if !c1 br @	.BB6_2
	;;
.BB6_1:
#0:	       ldga	_impure_data -> r0
#1:	       br	.BB6_99
	;;
#0:	       stm.a	12, r0, 0
#1:	       ldi	0 -> r0
	;;
	       nop	0
	;;
.BB6_2:
#0:	       ldi	503 -> r0
	;;
#0:	       cmpu gt	r10, r0 -> c1
	;;
#0:	if  c1 br @	.BB6_5
	;;
.BB6_3:
#0:	       sr	r10, 2 -> r2
#1:	       ldga	___malloc_av_ -> r3
	;;
#0:	       s2add	r3, r2 -> r1
	;;
#0:	       ldm.f	r1, 12
	;;
#0:	       cmp ne	r31, r1 -> c1
#1:	       or	r31, 0 -> r0
	;;
#0:	if !c1 s2add	r3, r2 -> r0
	;;
#0:	if !c1 ldm.f	r0, 20
#1:	if !c1 add	r0, 8 -> r1
	;;
#0:	if !c1 or	r31, 0 -> r0
	;;
#0:	       cmp eq	r0, r1 -> c1
	;;
#0:	if  c1 br @	.BB6_8
	;;
.BB6_4:
#0:	       ldm.f	r0, 4
#1:	       ldi	-4 -> r3
	;;
#0:	       or	r31, 0 -> r1
#1:	       ldm.f	r0, 8
	;;
#0:	       add	r1, 4 -> r1
	;;
#0:	       or	r31, 0 -> r2
#1:	       ldm.f	r0, 12
	;;
#0:	       stm.a	r31, r2, 3
	;;
#0:	       stm.a	r2, r31, 2
#1:	       and	r1, r3 -> r2
	;;
#0:	       br	.BB6_99
#1:	       add	r0, r2 -> r1
#2:	       ldmr.f	r2, r0, 0
#3:	       add	r0, 8 -> r0
	;;
#0:	       or	r31, 1 -> r2
	;;
#0:	       stm.a	r2, r1, 0
	;;
.BB6_5:
#0:	       sr	r10, 9 -> r0
	;;
#0:	       brz eq @	r0, .BB6_9
	;;
.BB6_6:
#0:	       ldiu	511 -> r2
#1:	       ldiu	511 -> r1
	;;
#0:	       ldim	1 -> r2
	;;
#0:	       cmpu gt	r10, r2 -> c1
	;;
#0:	if  c1 br @	.BB6_10
	;;
.BB6_7:
#0:	       sr	r10, 6 -> r0
#1:	       br	.BB6_17
	;;
#0:	       s2add	r0, 14 -> r0
	;;
	       nop	0
	;;
.BB6_8:
#0:	       sr	r10, 3 -> r0
#1:	       br	.BB6_24
	;;
#0:	       add	r0, 2 -> r0
	;;
	       nop	0
	;;
.BB6_9:
#0:	       sr	r10, 3 -> r0
#1:	       br @	.BB6_17
	;;
.BB6_10:
#0:	       ldim	5 -> r1
	;;
#0:	       cmpu gt	r10, r1 -> c1
	;;
#0:	if  c1 br @	.BB6_12
	;;
.BB6_11:
#0:	       addi	91 -> r0
#1:	       br @	.BB6_17
	;;
.BB6_12:
#0:	       ldiu	511 -> r1
#1:	       ldiu	511 -> r0
	;;
#0:	       ldim	21 -> r1
	;;
#0:	       cmpu gt	r10, r1 -> c1
	;;
#0:	if  c1 br @	.BB6_14
	;;
.BB6_13:
#0:	       sr	r10, 12 -> r0
#1:	       br	.BB6_17
	;;
#0:	       addi	110 -> r0
	;;
	       nop	0
	;;
.BB6_14:
#0:	       ldim	85 -> r0
	;;
#0:	       cmpu gt	r10, r0 -> c1
	;;
#0:	if  c1 br @	.BB6_16
	;;
.BB6_15:
#0:	       sr	r10, 15 -> r0
#1:	       br	.BB6_17
	;;
#0:	       addi	119 -> r0
	;;
	       nop	0
	;;
.BB6_16:
#0:	       ldiu	511 -> r0
#1:	       ldi	126 -> r3
	;;
#0:	       ldim	341 -> r0
	;;
#0:	       cmpu gt	r10, r0 -> c1
	;;
#0:	if !c1 sr	r10, 18 -> r0
	;;
#0:	if !c1 s2add	r0, 31 -> r0
	;;
.BB6_17:
#0:	       sl	r0, 3 -> r1
#1:	       ldga	___malloc_av_ -> r2
#2:	       ldi	-4 -> r3
#3:	       ldi	16 -> r4
	;;
#0:	       add	r2, r1 -> r2
	;;
#0:	       ldm.f	r2, 12
	;;
#0:	       or	r31, 0 -> r6
	;;
.BB6_18:                                ; =>This Inner Loop Header: Depth=1
#0:	       or	r6, 0 -> r1
	;;
#0:	       cmp eq	r1, r2 -> c1
	;;
#0:	if  c1 br @	.BB6_23
	;;
.BB6_19:                                ;   in Loop: Header=BB6_18 Depth=1
#0:	       ldm.f	r1, 4
	;;
#0:	       and	r31, r3 -> r5
	;;
#0:	       sub	r5, r10 -> r7
	;;
#0:	       cmp lt	r7, r4 -> c1
	;;
#0:	if !c1 br @	.BB6_22
	;;
.BB6_20:                                ;   in Loop: Header=BB6_18 Depth=1
#0:	       ldm.f	r1, 12
#1:	       brz lt	r7, .BB6_18
	;;
#0:	       or	r31, 0 -> r6
	;;
	       nop	0
	;;
.BB6_21:
#0:	       add	r5, r1 -> r0
#1:	       br	.BB6_29
#2:	       ldm.f	r1, 8
	;;
#0:	       stm.a	r6, r31, 3
	;;
#0:	       stm.a	r31, r6, 2
	;;
.BB6_22:
#0:	       sub	r0, 1 -> r0
	;;
.BB6_23:                                ; %.loopexit
#0:	       add	r0, 1 -> r0
	;;
.BB6_24:
#0:	       ldmg.d	___malloc_av_+16
#1:	       ldga	___malloc_av_+8 -> r2
	;;
#0:	       or	r31, 0 -> r1
	;;
#0:	       cmp eq	r1, r2 -> c1
	;;
#0:	if  c1 br @	.BB6_50
	;;
.BB6_25:
#0:	       ldm.f	r1, 4
#1:	       ldi	-4 -> r2
#2:	       ldi	16 -> r5
	;;
#0:	       or	r31, 0 -> r3
	;;
#0:	       and	r3, r2 -> r2
	;;
#0:	       sub	r2, r10 -> r4
	;;
#0:	       cmp lt	r4, r5 -> c1
	;;
#0:	if  c1 br @	.BB6_27
	;;
.BB6_26:
#0:	       or	r10, 1 -> r0
#1:	       ldga	___malloc_av_ -> r3
#2:	       add	r1, r2 -> r2
	;;
#0:	       stm.a	r0, r1, 1
#1:	       add	r1, r10 -> r0
	;;
#0:	       stm.a	r0, r3, 5
	;;
#0:	       stm.a	r0, r3, 4
#1:	       ldga	___malloc_av_+8 -> r3
	;;
#0:	       stm.a	r3, r0, 3
	;;
#0:	       stm.a	r3, r0, 2
#1:	       or	r10, 4 -> r3
	;;
#0:	       br	.BB6_99
#1:	       add	r1, r3 -> r0
#2:	       or	r4, 1 -> r3
	;;
#0:	       stm.a	r3, r0, 0
#1:	       add	r1, 8 -> r0
	;;
#0:	       stm.a	r4, r2, 0
	;;
.BB6_27:
#2:	       ldga	___malloc_av_ -> r2.16
	;;
#0:	       brz lt	r4, .BB6_30
#2:	       ldga	___malloc_av_+8 -> r2.17
	;;
#2:	       stm.a	r2.17, r2.16, 5
	;;
#2:	       stm.a	r2.17, r2.16, 4
	;;
.BB6_28:
#0:	       add	r2, r1 -> r0
	;;
.BB6_29:
#0:	       ldm.f	r0, 4
#1:	       br	.BB6_99
	;;
#0:	       or	r31, 1 -> r2
	;;
#0:	       stm.a	r2, r0, 1
#1:	       add	r1, 8 -> r0
	;;
.BB6_30:
#0:	       ldi	511 -> r4
	;;
#0:	       cmpu gt	r2, r4 -> c1
	;;
#0:	if  c1 br @	.BB6_32
	;;
.BB6_31:
#0:	       sr	r3, 5 -> r2
#1:	       ldi	1 -> r4
#2:	       ldmg.d	___malloc_av_+4
#3:	       ldi	-8 -> r9
	;;
#0:	       sl	r4, r2 -> r2
#1:	       and	r3, r9 -> r3
	;;
#0:	       or	r31, r2 -> r4
#1:	       ldga	___malloc_av_ -> r2
	;;
#0:	       stm.a	r4, r2, 1
#1:	       add	r2, r3 -> r2
	;;
#0:	       ldm.f	r2, 8
	;;
#0:	       stm.a	r2, r1, 3
	;;
#0:	       br	.BB6_50
#1:	       stm.a	r31, r1, 2
	;;
#0:	       stm.a	r1, r2, 2
	;;
#0:	       stm.a	r1, r31, 3
	;;
.BB6_32:
#0:	       sr	r3, 9 -> r4
	;;
#0:	       brz eq @	r4, .BB6_35
	;;
.BB6_33:
#0:	       ldiu	511 -> r6
#1:	       ldiu	511 -> r5
	;;
#0:	       ldim	1 -> r6
	;;
#0:	       cmpu gt	r3, r6 -> c1
	;;
#0:	if  c1 br @	.BB6_36
	;;
.BB6_34:
#0:	       sr	r3, 6 -> r3
#1:	       br	.BB6_43
	;;
#0:	       s2add	r3, 14 -> r4
	;;
	       nop	0
	;;
.BB6_35:
#0:	       sr	r3, 3 -> r4
#1:	       br @	.BB6_43
	;;
.BB6_36:
#0:	       ldim	5 -> r5
	;;
#0:	       cmpu gt	r3, r5 -> c1
	;;
#0:	if  c1 br @	.BB6_38
	;;
.BB6_37:
#0:	       addi	91 -> r4
#1:	       br @	.BB6_43
	;;
.BB6_38:
#0:	       ldiu	511 -> r5
#1:	       ldiu	511 -> r4
	;;
#0:	       ldim	21 -> r5
	;;
#0:	       cmpu gt	r3, r5 -> c1
	;;
#0:	if  c1 br @	.BB6_40
	;;
.BB6_39:
#0:	       sr	r3, 12 -> r4
#1:	       br	.BB6_43
	;;
#0:	       addi	110 -> r4
	;;
	       nop	0
	;;
.BB6_40:
#0:	       ldim	85 -> r4
	;;
#0:	       cmpu gt	r3, r4 -> c1
	;;
#0:	if  c1 br @	.BB6_42
	;;
.BB6_41:
#0:	       sr	r3, 15 -> r4
#1:	       br	.BB6_43
	;;
#0:	       addi	119 -> r4
	;;
	       nop	0
	;;
.BB6_42:
#0:	       ldiu	511 -> r4
	;;
#0:	       ldim	341 -> r4
	;;
#0:	       cmpu gt	r3, r4 -> c1
#1:	       ldi	126 -> r4
	;;
#0:	if !c1 sr	r3, 18 -> r3
	;;
#0:	if !c1 s2add	r3, 31 -> r4
	;;
.BB6_43:
#2:	       ldga	___malloc_av_ -> r2.16
#0:	       sl	r4, 3 -> r3
	;;
#2:	       add	r2.16, r3 -> r3
	;;
#0:	       ldm.f	r3, 8
	;;
#0:	       or	r31, 0 -> r5
	;;
#0:	       cmp ne	r5, r3 -> c1
	;;
#0:	if !c1 br @	.BB6_48
	;;
.BB6_44:
#0:	       ldi	-4 -> r4
#1:	       br @	.BB6_46
	;;
.BB6_45:                                ;   in Loop: Header=BB6_46 Depth=1
#0:	       ldm.f	r5, 8
	;;
#0:	       or	r31, 0 -> r5
	;;
.BB6_46:                                ; %.preheader
                                        ; =>This Inner Loop Header: Depth=1
#0:	       cmp eq	r5, r3 -> c1
	;;
#0:	if !c1 ldm.f	r5, 4
	;;
#0:	if !c1 and	r31, r4 -> r6
	;;
#0:	if !c1 cmpu ge	r2, r6 -> c1
	;;
#0:	if !c1 br @	.BB6_45
	;;
.BB6_47:                                ; %.critedge
#0:	       ldm.f	r5, 12
#1:	       br	.BB6_49
	;;
#0:	       or	r31, 0 -> r3
	;;
	       nop	0
	;;
.BB6_48:
#0:	       sra	r4, 31 -> r2
#1:	       ldmg.d	___malloc_av_+4
#2:	       or	r3, 0 -> r5
	;;
#0:	       sr	r2, 30 -> r2
	;;
#0:	       add	r4, r2 -> r2
#1:	       ldi	1 -> r4
	;;
#0:	       sra	r2, 2 -> r2
	;;
#0:	       sl	r4, r2 -> r2
	;;
#0:	       or	r31, r2 -> r2
	;;
#2:	       stm.a	r2, r2.16, 1
	;;
.BB6_49:
#0:	       stm.a	r3, r1, 3
	;;
#0:	       stm.a	r5, r1, 2
	;;
#0:	       stm.a	r1, r3, 2
	;;
#0:	       stm.a	r1, r5, 3
	;;
.BB6_50:                                ; %._crit_edge
#0:	       sra	r0, 31 -> r1
#1:	       ldmg.d	___malloc_av_+4
#2:	       ldi	1 -> r2
	;;
#0:	       sr	r1, 30 -> r1
	;;
#3:	       or	r31, 0 -> r3.17
#0:	       add	r0, r1 -> r1
	;;
#0:	       sra	r1, 2 -> r1
	;;
#0:	       sl	r2, r1 -> r1
	;;
#3:	       cmpu gt	r1, r3.17 -> c1
	;;
#0:	if  c1 br @	.BB6_69
	;;
.BB6_51:
#3:	       and	r1, r3.17 -> r2
	;;
#0:	       brz ne @	r2, .BB6_54
	;;
.BB6_52:
#0:	       add	r0, 4 -> r0
#1:	       ldi	-4 -> r2
#2:	       sl	r1, 1 -> r1
	;;
#0:	       and	r0, r2 -> r0
	;;
#3:	       and	r1, r3.17 -> r2
	;;
#0:	       brz ne @	r2, .BB6_54
	;;
.BB6_53:                                ; %.lr.ph59
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sl	r1, 1 -> r1
#1:	       add	r0, 4 -> r0
	;;
#3:	       and	r1, r3.17 -> r2
	;;
#0:	       brz eq @	r2, .BB6_53
	;;
.BB6_54:
#3:	       or	r3.17, 0 -> r3.16
#0:	       br @	.BB6_56
	;;
.BB6_55:                                ;   in Loop: Header=BB6_56 Depth=1
#3:	       or	r3.17, 0 -> r3.16
#0:	       or	r4, 0 -> r0
	;;
.BB6_56:                                ; %.preheader54
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB6_68 Depth 2
                                        ;     Child Loop BB6_63 Depth 2
                                        ;     Child Loop BB6_57 Depth 2
                                        ;       Child Loop BB6_58 Depth 3
#0:	       sl	r0, 3 -> r2
#1:	       ldga	___malloc_av_ -> r3
#2:	       ldi	-4 -> r7
#3:	       ldi	16 -> r8
	;;
#0:	       add	r3, r2 -> r5
#1:	       or	r0, 0 -> r4
	;;
#0:	       or	r5, 0 -> r9
	;;
.BB6_57:                                ;   Parent Loop BB6_56 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB6_58 Depth 3
#0:	       or	r9, 0 -> r6
	;;
.BB6_58:                                ;   Parent Loop BB6_56 Depth=1
                                        ;     Parent Loop BB6_57 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
#0:	       ldm.f	r6, 12
	;;
#0:	       or	r31, 0 -> r6
	;;
#0:	       cmp eq	r6, r9 -> c1
	;;
#0:	if  c1 br @	.BB6_62
	;;
.BB6_59:                                ;   in Loop: Header=BB6_58 Depth=3
#0:	       ldm.f	r6, 4
	;;
#0:	       and	r31, r7 -> r2
	;;
#0:	       sub	r2, r10 -> r3
	;;
#0:	       cmp lt	r3, r8 -> c1
	;;
#0:	if !c1 br @	.BB6_72
	;;
.BB6_60:                                ;   in Loop: Header=BB6_58 Depth=3
#0:	       brz lt @	r3, .BB6_58
	;;
.BB6_61:
#0:	       add	r2, r6 -> r0
	;;
#0:	       ldm.f	r0, 4
	;;
#0:	       or	r31, 1 -> r1
	;;
#0:	       stm.a	r1, r0, 1
#1:	       add	r6, 8 -> r0
	;;
#0:	       ldm.f	r6, 8
	;;
#0:	       br	.BB6_99
#1:	       or	r31, 0 -> r3
#2:	       ldm.f	r6, 12
	;;
#0:	       stm.a	r31, r3, 3
	;;
#0:	       stm.a	r3, r31, 2
	;;
.BB6_62:                                ;   in Loop: Header=BB6_57 Depth=2
#0:	       add	r4, 1 -> r4
#1:	       add	r9, 8 -> r9
	;;
#0:	       and	r4, 3 -> r2
	;;
#0:	       brz ne @	r2, .BB6_57
	;;
.BB6_63:                                ; %.loopexit46
                                        ;   Parent Loop BB6_56 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       and	r0, 3 -> r2
	;;
#0:	       brz eq @	r2, .BB6_65
	;;
.BB6_64:                                ;   in Loop: Header=BB6_63 Depth=2
#0:	       ldm.f	r5, 0
#1:	       sub	r5, 8 -> r5
#2:	       sub	r0, 1 -> r0
	;;
#0:	       cmp eq	r5, r31 -> c1
	;;
#0:	if !c1 br @	.BB6_66
#1:	if  c1 br @	.BB6_63
	;;
.BB6_65:                                ;   in Loop: Header=BB6_56 Depth=1
#0:	       xor	r1, -1 -> r0
	;;
#3:	       and	r3.16, r0 -> r3.17
#0:	       ldga	___malloc_av_ -> r0
	;;
#3:	       or	r3.17, 0 -> r3.16
	;;
#3:	       stm.a	r3.17, r0, 1
	;;
.BB6_66:                                ; %.loopexit48
                                        ;   in Loop: Header=BB6_56 Depth=1
#0:	       sl	r1, 1 -> r1
	;;
#3:	       cmpu le	r1, r3.16 -> c1
#0:	       cmp ne	r1, 0 -> c2
	;;
#0:	       comb	and c1, c2 -> c1
	;;
#0:	if !c1 br @	.BB6_69
	;;
.BB6_67:                                ; %.preheader49
                                        ;   in Loop: Header=BB6_56 Depth=1
#3:	       and	r3.16, r1 -> r2
#0:	       or	r4, 0 -> r0
	;;
#0:	       brz ne @	r2, .BB6_56
	;;
.BB6_68:                                ; %.lr.ph
                                        ;   Parent Loop BB6_56 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       sl	r1, 1 -> r1
#1:	       add	r4, 4 -> r4
	;;
#3:	       and	r1, r3.17 -> r0
	;;
#0:	       brz eq @	r0, .BB6_68
	;;
#0:	       brz ne @	r0, .BB6_55
	;;
.BB6_69:                                ; %.loopexit55
#0:	       ldmg.d	___malloc_av_+8
#1:	       ldi	-4 -> r0
	;;
#0:	       or	r31, 0 -> r9
	;;
#0:	       ldm.f	r9, 4
	;;
#0:	       and	r31, r0 -> r4
#1:	       ldi	16 -> r0
	;;
#0:	       sub	r4, r10 -> r2
#1:	       cmpu lt	r4, r10 -> c1
	;;
#0:	       cmp lt	r2, r0 -> c2
	;;
#0:	       comb	or c1, c2 -> c1
	;;
#0:	if !c1 br @	.BB6_98
	;;
.BB6_70:
#0:	       ldmg.d	___malloc_sbrk_base
#1:	       add	r9, r4 -> r6
	;;
#0:	       or	r31, 0 -> r7
	;;
#0:	       cmp eq	r7, -1 -> c1
	;;
#0:	if  c1 br @	.BB6_73
	;;
.BB6_71:
#0:	       ldiu	15 -> r0
#1:	       ldiu	0 -> r2
	;;
#0:	       br	.BB6_74
#1:	       ldim	2 -> r0
#2:	       ldim	2046 -> r2
	;;
#0:	       add	r10, r0 -> r0
	;;
#0:	       and	r0, r2 -> r5
	;;
.BB6_72:
#2:	       ldga	___malloc_av_+8 -> r2.16
#0:	       or	r10, 1 -> r0
#1:	       or	r3, 1 -> r4
#3:	       add	r6, r2 -> r2
	;;
#0:	       stm.a	r0, r6, 1
#1:	       ldga	___malloc_av_ -> r0
	;;
#0:	       ldm.f	r6, 8
	;;
#0:	       or	r31, 0 -> r1
#1:	       ldm.f	r6, 12
	;;
#0:	       stm.a	r31, r1, 3
	;;
#0:	       stm.a	r1, r31, 2
#1:	       add	r6, r10 -> r1
	;;
#0:	       stm.a	r1, r0, 5
	;;
#0:	       stm.a	r1, r0, 4
#1:	       or	r10, 4 -> r0
	;;
#2:	       stm.a	r2.16, r1, 3
#0:	       add	r6, r0 -> r5
#1:	       add	r6, 8 -> r0
	;;
#0:	       br	.BB6_99
#2:	       stm.a	r2.16, r1, 2
	;;
#0:	       stm.a	r4, r5, 0
	;;
#0:	       stm.a	r3, r2, 0
	;;
.BB6_73:
#0:	       add	r10, 16 -> r5
	;;
.BB6_74:
#0:	       ldmg.d	__sbrk.heap_end
#1:	       ldga	_errno.b -> r0
	;;
#0:	       brz ne	r31, .BB6_76
#1:	       stmb.a	0, r0, 0
	;;
#0:	       or	r31, 0 -> r3
	;;
	       nop	0
	;;
.BB6_75:
#0:	       ldga	__sbrk.heap_end -> r0
#1:	       ldga	_end -> r3
	;;
#0:	       stm.a	r3, r0, 0
	;;
.BB6_76:                                ; %_sbrk_r.exit
#0:	       cmp eq	r3, -1 -> c1
#1:	       add	r3, r5 -> r0
#2:	       ldga	__sbrk.heap_end -> r2
	;;
#0:	if  c1 br @	.BB6_97
#1:	       stm.a	r0, r2, 0
	;;
.BB6_77:
#0:	       ldga	___malloc_av_ -> r2
#1:	       cmpu ge	r3, r6 -> c1
	;;
#0:	       cmp eq	r9, r2 -> c2
	;;
#0:	       comb	or c1, c2 -> c1
	;;
#0:	if !c1 br @	.BB6_97
	;;
.BB6_78:
#0:	       cmp ne	r3, r6 -> c1
#1:	       ldmg.d	___malloc_current_mallinfo.0
#2:	       ldga	___malloc_current_mallinfo.0 -> r1
	;;
#0:	if  c1 br	.BB6_80
#1:	       add	r31, r5 -> r2
	;;
#0:	       stm.a	r2, r1, 0
	;;
	       nop	0
	;;
.BB6_79:
#0:	       ldiu	2047 -> r8
	;;
#0:	       ldim	1 -> r8
	;;
#0:	       and	r6, r8 -> r1
	;;
#0:	       brz eq @	r1, .BB6_90
	;;
.BB6_80:
#0:	       cmp ne	r7, -1 -> c1
	;;
#0:	if !c1 br @	.BB6_82
	;;
.BB6_81:
#0:	       sub	r3, r6 -> r1
#1:	       br	.BB6_83
	;;
#0:	       add	r2, r1 -> r2
#1:	       ldga	___malloc_current_mallinfo.0 -> r1
	;;
#0:	       stm.a	r2, r1, 0
	;;
.BB6_82:
#0:	       ldga	___malloc_sbrk_base -> r1
	;;
#0:	       stm.a	r3, r1, 0
	;;
.BB6_83:
#0:	       add	r3, 8 -> r1
#1:	       ldi	0 -> r6
	;;
#0:	       and	r1, 7 -> r7
	;;
#0:	       brz eq @	r7, .BB6_85
	;;
.BB6_84:
#0:	       ldi	8 -> r1
	;;
#0:	       sub	r1, r7 -> r6
	;;
#0:	       add	r3, r6 -> r3
	;;
.BB6_85:
#0:	       ldiu	2047 -> r7
#1:	       ldga	_errno.b -> r1
#2:	       add	r3, r5 -> r5
	;;
#0:	       ldim	1 -> r7
#1:	       stmb.a	0, r1, 0
#2:	       ldga	4096 -> r1
	;;
#0:	       brz ne	r0, .BB6_87
#1:	       and	r5, r7 -> r5
	;;
#0:	       sub	r1, r5 -> r1
	;;
#0:	       add	r1, r6 -> r5
	;;
.BB6_86:
#0:	       ldga	__sbrk.heap_end -> r0.16
#1:	       ldga	_end -> r0
	;;
#0:	       stm.a	r0, r0.16, 0
	;;
.BB6_87:                                ; %_sbrk_r.exit5
#0:	       ldga	___malloc_av_ -> r0.16
#1:	       cmp eq	r0, -1 -> c1
#2:	       ldi	0 -> r8
#3:	       add	r0, r5 -> r6
	;;
#0:	       stm.a	r3, r0.16, 2
#1:	       ldga	__sbrk.heap_end -> r1
#2:	if  c1 or	r8, 0 -> r5
#3:	if  c1 or	r3, 0 -> r0
	;;
#0:	       cmp eq	r9, r0.16 -> c1
#1:	       stm.a	r6, r1, 0
#2:	       add	r5, r2 -> r2
#3:	       ldga	___malloc_current_mallinfo.0 -> r1
	;;
#0:	       stm.a	r2, r1, 0
#1:	       sub	r5, r3 -> r1
	;;
#0:	if  c1 br	.BB6_93
#1:	       add	r1, r0 -> r0
	;;
#0:	       or	r0, 1 -> r0
	;;
#0:	       stm.a	r0, r3, 1
	;;
.BB6_88:
#0:	       cmpu gt	r4, 15 -> c1
	;;
#0:	if  c1 br @	.BB6_91
	;;
.BB6_89:
#0:	       stm.a	1, r3, 1
#1:	       br @	.BB6_97
	;;
.BB6_90:
#0:	       add	r5, r4 -> r0
#1:	       br	.BB6_93
	;;
#0:	       or	r0, 1 -> r0
	;;
#0:	       stm.a	r0, r9, 1
	;;
.BB6_91:
#0:	       ldm.f	r9, 4
#1:	       sub	r4, 12 -> r3
#2:	       ldi	-8 -> r0
	;;
#0:	       and	r3, r0 -> r0
#1:	       or	r3, 4 -> r3
	;;
#0:	       and	r31, 1 -> r1
#1:	       cmpu lt	r0, 16 -> c1
#2:	       add	r9, r3 -> r3
	;;
#0:	       or	r1, r0 -> r1
	;;
#0:	if  c1 br	.BB6_93
#1:	       stm.a	r1, r9, 1
	;;
#0:	       stm.a	5, r3, 0
	;;
#0:	       stm.a	5, r3, 1
	;;
.BB6_92:
#0:	       add	r9, 8 -> r0
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
#0:	       or	r31, 0 -> r2
	;;
.BB6_93:
#0:	       ldmg.d	___malloc_max_sbrked_mem
	;;
#0:	       cmpu le	r2, r31 -> c1
	;;
#0:	if  c1 br @	.BB6_95
	;;
.BB6_94:
#0:	       ldga	___malloc_max_sbrked_mem -> r0
	;;
#0:	       stm.a	r2, r0, 0
	;;
.BB6_95:
#0:	       ldmg.d	___malloc_max_total_mem
	;;
#0:	       cmpu le	r2, r31 -> c1
	;;
#0:	if  c1 br @	.BB6_97
	;;
.BB6_96:
#0:	       ldga	___malloc_max_total_mem -> r0
	;;
#0:	       stm.a	r2, r0, 0
	;;
.BB6_97:                                ; %malloc_extend_top.exit
#0:	       ldmg.d	___malloc_av_+8
#1:	       ldi	-4 -> r0
#2:	       ldi	16 -> r3
	;;
#0:	       or	r31, 0 -> r9
	;;
#0:	       ldm.f	r9, 4
	;;
#0:	       and	r31, r0 -> r0
	;;
#0:	       sub	r0, r10 -> r2
#1:	       cmpu lt	r0, r10 -> c1
#2:	       ldi	0 -> r0
	;;
#0:	       cmp lt	r2, r3 -> c2
	;;
#0:	       comb	or c1, c2 -> c1
	;;
#0:	if  c1 br @	.BB6_99
	;;
.BB6_98:
#0:	       or	r10, 1 -> r0
#1:	       add	r9, r10 -> r3
#2:	       ldga	___malloc_av_ -> r1
	;;
#0:	       stm.a	r0, r9, 1
	;;
#0:	       stm.a	r3, r1, 2
#1:	       or	r10, 4 -> r3
#2:	       or	r2, 1 -> r1
	;;
#0:	       add	r9, r3 -> r0
	;;
#0:	       stm.a	r1, r0, 0
#1:	       add	r9, 8 -> r0
	;;
.BB6_99:
#0:	       ldm.s	r15, 4
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
.tmp6:
	.size	__malloc_r, .tmp6-__malloc_r

	.type	___sinit,@function
___sinit:                               ; @__sinit
	.funsz	___sinit_end-___sinit
___sinit_start:
; BB#0:
#0:	       ldmg.d	_impure_data+56
	;;
#0:	       cmp ne	r31, 0 -> c3
	;;
#0:	if  c3 br @	.BB7_41
	;;
.BB7_1:
#0:	       ldga	_impure_data -> r0
#1:	       ldga	__cleanup_r -> r1
#2:	       ldga	_impure_data+740 -> r2
#3:	       ldga	_impure_data+744 -> r3
	;;
#0:	       stm.a	r1, r0, 15
#1:	       ldga	_impure_data+736 -> r1
	;;
#0:	       stm.a	1, r0, 14
	;;
#0:	       stm.a	0, r1, 0
#1:	       ldga	_impure_data+748 -> r1
	;;
#0:	       stm.a	3, r2, 0
	;;
#0:	       stm.a	r1, r3, 0
#1:	       ldi	-8 -> r3
	;;
#0:	       ldmg.d	_impure_data+4
	;;
#0:	       stm.a	0, r31, 0
#1:	       or	r31, 0 -> r0
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
#0:	       br	.BB7_3
#1:	       stmh.a	0, r31, 9
	;;
#0:	       stmh.a	0, r31, 8
	;;
#0:	       stmh.a	0, r31, 7
	;;
.BB7_2:                                 ;   in Loop: Header=BB7_3 Depth=1
#0:	       add	r3, 1 -> r3
#1:	       stmb.a	0, r1, 0
	;;
.BB7_3:                                 ; =>This Inner Loop Header: Depth=1
#0:	       add	r0, r3 -> r4
	;;
#0:	       s2add	r4, 25 -> r1
	;;
#0:	       and	r1, 3 -> r2
	;;
#0:	       brz eq @	r2, .BB7_5
	;;
.BB7_4:                                 ;   in Loop: Header=BB7_3 Depth=1
#0:	       brz ne @	r3, .BB7_2
	;;
#0:	       brz eq @	r3, .BB7_14
	;;
.BB7_5:
#0:	       ldi	0 -> r2
	;;
#0:	       sub	r2, r3 -> r2
	;;
#0:	       cmpu lt	r2, 4 -> c1
	;;
#0:	if  c1 br @	.BB7_12
	;;
.BB7_6:
#0:	       cmpu lt	r2, 16 -> c1
#1:	       s2add	r4, 25 -> r1
	;;
#0:	if  c1 br @	.BB7_10
	;;
.BB7_7:                                 ; %.lr.ph8.i.preheader
#0:	       ldi	-16 -> r4
#1:	       ldi	-16 -> r5
	;;
#0:	       sub	r4, r3 -> r4
	;;
#0:	       and	r4, r5 -> r4
	;;
.BB7_8:                                 ; %.lr.ph8.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sub	r2, 16 -> r2
#1:	       stm.a	0, r1, 3
	;;
#0:	       cmpu gt	r2, 15 -> c1
#1:	       stm.a	0, r1, 2
	;;
#0:	if  c1 br	.BB7_8
#1:	       stm.a	0, r1, 1
	;;
#0:	       stm.a	0, r1, 0
#1:	       add	r1, 16 -> r1
	;;
	       nop	0
	;;
.BB7_9:                                 ; %.preheader.i
#0:	       ldi	0 -> r2
#1:	       add	r0, r4 -> r1
	;;
#0:	       br	.BB7_11
#1:	       sub	r2, r4 -> r2
#2:	       add	r1, r3 -> r1
	;;
#0:	       sub	r2, r3 -> r2
#1:	       s2add	r1, 29 -> r1
	;;
#0:	       sub	r2, 16 -> r2
	;;
.BB7_10:                                ; %.lr.ph.i
#0:	       stm.a	0, r1, 0
#1:	       add	r1, 4 -> r1
#2:	       sub	r2, 4 -> r2
	;;
.BB7_11:                                ; %.lr.ph.i
#0:	       cmpu gt	r2, 3 -> c1
	;;
#0:	if  c1 br @	.BB7_10
	;;
.BB7_12:                                ; %.preheader11.i
#0:	       brz eq @	r2, .BB7_14
	;;
.BB7_13:                                ; %.lr.ph14.i
                                        ; =>This Inner Loop Header: Depth=1
#0:	       stmb.a	0, r1, 0
#1:	       add	r1, 1 -> r1
#2:	       sub	r2, 1 -> r2
	;;
#0:	       brz ne @	r2, .BB7_13
	;;
.BB7_14:                                ; %memset.exit
#0:	       stm.a	r0, r0, 7
#1:	       ldga	___sread -> r1
#2:	       ldga	___swrite -> r3
#3:	       ldga	___sseek -> r2
	;;
#0:	       stm.a	r1, r0, 8
	;;
#0:	       stm.a	r3, r0, 9
#1:	       ldga	___sclose -> r3
	;;
#0:	       stm.a	r2, r0, 10
	;;
#0:	       stm.a	r3, r0, 11
#1:	       ldi	-8 -> r3
	;;
#0:	       ldmg.d	_impure_data+8
	;;
#0:	       stm.a	0, r31, 0
#1:	       or	r31, 0 -> r0
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
#0:	       br	.BB7_16
#1:	       stm.a	0, r31, 4
	;;
#0:	       stm.a	0, r31, 5
	;;
#0:	       stm.a	0, r31, 6
	;;
.BB7_15:                                ;   in Loop: Header=BB7_16 Depth=1
#0:	       add	r3, 1 -> r3
#1:	       stmb.a	0, r1, 0
	;;
.BB7_16:                                ; =>This Inner Loop Header: Depth=1
#0:	       add	r0, r3 -> r4
	;;
#0:	       s2add	r4, 25 -> r1
	;;
#0:	       and	r1, 3 -> r2
	;;
#0:	       brz eq @	r2, .BB7_18
	;;
.BB7_17:                                ;   in Loop: Header=BB7_16 Depth=1
#0:	       brz ne @	r3, .BB7_15
	;;
#0:	       brz eq @	r3, .BB7_27
	;;
.BB7_18:
#0:	       ldi	0 -> r2
	;;
#0:	       sub	r2, r3 -> r2
	;;
#0:	       cmpu lt	r2, 4 -> c1
	;;
#0:	if  c1 br @	.BB7_25
	;;
.BB7_19:
#0:	       cmpu lt	r2, 16 -> c1
#1:	       s2add	r4, 25 -> r1
	;;
#0:	if  c1 br @	.BB7_23
	;;
.BB7_20:                                ; %.lr.ph8.i25.preheader
#0:	       ldi	-16 -> r4
#1:	       ldi	-16 -> r5
	;;
#0:	       sub	r4, r3 -> r4
	;;
#0:	       and	r4, r5 -> r4
	;;
.BB7_21:                                ; %.lr.ph8.i25
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sub	r2, 16 -> r2
#1:	       stm.a	0, r1, 3
	;;
#0:	       cmpu gt	r2, 15 -> c1
#1:	       stm.a	0, r1, 2
	;;
#0:	if  c1 br	.BB7_21
#1:	       stm.a	0, r1, 1
	;;
#0:	       stm.a	0, r1, 0
#1:	       add	r1, 16 -> r1
	;;
	       nop	0
	;;
.BB7_22:                                ; %.preheader.i22
#0:	       ldi	0 -> r2
#1:	       add	r0, r4 -> r1
	;;
#0:	       br	.BB7_24
#1:	       sub	r2, r4 -> r2
#2:	       add	r1, r3 -> r1
	;;
#0:	       sub	r2, r3 -> r2
#1:	       s2add	r1, 29 -> r1
	;;
#0:	       sub	r2, 16 -> r2
	;;
.BB7_23:                                ; %.lr.ph.i28
#0:	       stm.a	0, r1, 0
#1:	       add	r1, 4 -> r1
#2:	       sub	r2, 4 -> r2
	;;
.BB7_24:                                ; %.lr.ph.i28
#0:	       cmpu gt	r2, 3 -> c1
	;;
#0:	if  c1 br @	.BB7_23
	;;
.BB7_25:                                ; %.preheader11.i34
#0:	       brz eq @	r2, .BB7_27
	;;
.BB7_26:                                ; %.lr.ph14.i37
                                        ; =>This Inner Loop Header: Depth=1
#0:	       stmb.a	0, r1, 0
#1:	       add	r1, 1 -> r1
#2:	       sub	r2, 1 -> r2
	;;
#0:	       brz ne @	r2, .BB7_26
	;;
.BB7_27:                                ; %memset.exit38
#0:	       stm.a	r0, r0, 7
#1:	       ldga	___sread -> r1
#2:	       ldga	___swrite -> r3
#3:	       ldga	___sseek -> r2
	;;
#0:	       stm.a	r1, r0, 8
	;;
#0:	       stm.a	r3, r0, 9
#1:	       ldga	___sclose -> r3
	;;
#0:	       stm.a	r2, r0, 10
	;;
#0:	       stm.a	r3, r0, 11
#1:	       ldi	18 -> r0
#2:	       ldi	-8 -> r3
	;;
#0:	       ldmg.d	_impure_data+12
	;;
#0:	       stm.a	0, r31, 0
	;;
#0:	       stm.a	0, r31, 1
	;;
#0:	       stm.a	0, r31, 2
	;;
#0:	       stmh.a	r0, r31, 6
#1:	       or	r31, 0 -> r0
	;;
#0:	       stm.a	0, r31, 25
	;;
#0:	       stmh.a	2, r31, 7
	;;
#0:	       br	.BB7_29
#1:	       stm.a	0, r31, 4
	;;
#0:	       stm.a	0, r31, 5
	;;
#0:	       stm.a	0, r31, 6
	;;
.BB7_28:                                ;   in Loop: Header=BB7_29 Depth=1
#0:	       add	r3, 1 -> r3
#1:	       stmb.a	0, r1, 0
	;;
.BB7_29:                                ; =>This Inner Loop Header: Depth=1
#0:	       add	r0, r3 -> r4
	;;
#0:	       s2add	r4, 25 -> r1
	;;
#0:	       and	r1, 3 -> r2
	;;
#0:	       brz eq @	r2, .BB7_31
	;;
.BB7_30:                                ;   in Loop: Header=BB7_29 Depth=1
#0:	       brz ne @	r3, .BB7_28
	;;
#0:	       brz eq @	r3, .BB7_40
	;;
.BB7_31:
#0:	       ldi	0 -> r2
	;;
#0:	       sub	r2, r3 -> r2
	;;
#0:	       cmpu lt	r2, 4 -> c1
	;;
#0:	if  c1 br @	.BB7_38
	;;
.BB7_32:
#0:	       cmpu lt	r2, 16 -> c1
#1:	       s2add	r4, 25 -> r1
	;;
#0:	if  c1 br @	.BB7_36
	;;
.BB7_33:                                ; %.lr.ph8.i6.preheader
#0:	       ldi	-16 -> r4
#1:	       ldi	-16 -> r5
	;;
#0:	       sub	r4, r3 -> r4
	;;
#0:	       and	r4, r5 -> r4
	;;
.BB7_34:                                ; %.lr.ph8.i6
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sub	r2, 16 -> r2
#1:	       stm.a	0, r1, 3
	;;
#0:	       cmpu gt	r2, 15 -> c1
#1:	       stm.a	0, r1, 2
	;;
#0:	if  c1 br	.BB7_34
#1:	       stm.a	0, r1, 1
	;;
#0:	       stm.a	0, r1, 0
#1:	       add	r1, 16 -> r1
	;;
	       nop	0
	;;
.BB7_35:                                ; %.preheader.i3
#0:	       ldi	0 -> r2
#1:	       add	r0, r4 -> r1
	;;
#0:	       br	.BB7_37
#1:	       sub	r2, r4 -> r2
#2:	       add	r1, r3 -> r1
	;;
#0:	       sub	r2, r3 -> r2
#1:	       s2add	r1, 29 -> r1
	;;
#0:	       sub	r2, 16 -> r2
	;;
.BB7_36:                                ; %.lr.ph.i9
#0:	       stm.a	0, r1, 0
#1:	       add	r1, 4 -> r1
#2:	       sub	r2, 4 -> r2
	;;
.BB7_37:                                ; %.lr.ph.i9
#0:	       cmpu gt	r2, 3 -> c1
	;;
#0:	if  c1 br @	.BB7_36
	;;
.BB7_38:                                ; %.preheader11.i15
#0:	       brz eq @	r2, .BB7_40
	;;
.BB7_39:                                ; %.lr.ph14.i18
                                        ; =>This Inner Loop Header: Depth=1
#0:	       stmb.a	0, r1, 0
#1:	       add	r1, 1 -> r1
#2:	       sub	r2, 1 -> r2
	;;
#0:	       brz ne @	r2, .BB7_39
	;;
.BB7_40:                                ; %memset.exit19
#0:	       stm.a	r0, r0, 7
#1:	       ldga	___sread -> r1
#2:	       ldga	___swrite -> r3
#3:	       ldga	___sseek -> r2
	;;
#0:	       stm.a	r1, r0, 8
	;;
#0:	       stm.a	r3, r0, 9
#1:	       ldga	___sclose -> r3
	;;
#0:	       stm.a	r2, r0, 10
	;;
#0:	       stm.a	r3, r0, 11
	;;
.BB7_41:
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
.tmp7:
	.size	___sinit, .tmp7-___sinit

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
#1:	       or	r0, 0 -> r10
	;;
#0:	       stm.s	r11, r15, 6
#1:	       addi	736 -> r10
	;;
#0:	       stm.s	r12, r15, 5
	;;
#0:	       stm.s	r13, r15, 4
	;;
#0:	       brz eq	r10, .BB8_22
#1:	       stm.s	r14, r15, 3
	;;
#0:	       stm.s	r1, r15, 2
	;;
#0:	       stm.s	r3, r15, 1
	;;
.BB8_1:
#0:	       ldiu	2047 -> r12
	;;
#0:	       ldim	31 -> r12
	;;
.BB8_2:                                 ; %.lr.ph6.i
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB8_4 Depth 2
#0:	       ldm.f	r10, 4
	;;
#0:	       or	r31, 0 -> r13
	;;
#0:	       cmp lt	r13, 1 -> c1
	;;
#0:	if  c1 br @	.BB8_21
	;;
.BB8_3:                                 ; %.lr.ph.i
                                        ;   in Loop: Header=BB8_2 Depth=1
#0:	       ldm.f	r10, 8
	;;
#0:	       s2add	r31, 17 -> r14
	;;
.BB8_4:                                 ;   Parent Loop BB8_2 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r14, -56
	;;
#0:	       bbh	mzext16 r14 -> r0
	;;
#0:	       cmpu lt	r0, 2 -> c1
	;;
#0:	if  c1 br @	.BB8_20
	;;
.BB8_5:                                 ;   in Loop: Header=BB8_4 Depth=2
#0:	       ldm.f	r14, -54
#1:	       or	r14, 0 -> r11
#2:	       sub	r14, 2 -> r1
	;;
#0:	       addi	-68 -> r11
	;;
#0:	       bbh	mzext16 r1 -> r1
#1:	       cmp eq	r11, 0 -> c2
	;;
#0:	       cmp eq	r1, r12 -> c1
	;;
#0:	       comb	or c1, c2 -> c1
	;;
#0:	if  c1 br @	.BB8_20
	;;
.BB8_6:                                 ;   in Loop: Header=BB8_4 Depth=2
#0:	       ldmg.d	_impure_data+56
	;;
#0:	       brz ne @	r31, .BB8_8
	;;
.BB8_7:                                 ;   in Loop: Header=BB8_4 Depth=2
#0:	       callg	___sinit
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldm.f	r14, -56
	;;
#0:	       bbh	mzext16 r14 -> r0
	;;
.BB8_8:                                 ;   in Loop: Header=BB8_4 Depth=2
#0:	       bbh	zext16 r0 -> r0
	;;
#0:	       brz eq @	r0, .BB8_20
	;;
.BB8_9:                                 ;   in Loop: Header=BB8_4 Depth=2
#0:	       or	r11, 0 -> r0
#1:	       callg	__fflush_r
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       ldm.f	r14, -24
	;;
#0:	       or	r31, 0 -> r2
	;;
#0:	       brz eq @	r2, .BB8_11
	;;
.BB8_10:                                ;   in Loop: Header=BB8_4 Depth=2
#0:	       ldm.f	r14, -40
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
.BB8_11:                                ;   in Loop: Header=BB8_4 Depth=2
#0:	       ldm.f	r14, -56
	;;
#0:	       bbh	mzext8 r14 -> r0
	;;
#0:	       btest	r0, 7 -> !c1
	;;
#0:	if  c1 br @	.BB8_13
	;;
.BB8_12:                                ;   in Loop: Header=BB8_4 Depth=2
#0:	       callg	__free_r
	;;
#0:	       ldm.f	r14, -52
	;;
#0:	       or	r31, 0 -> r0
	;;
	       nop	0
	;;
.BB8_13:                                ;   in Loop: Header=BB8_4 Depth=2
#0:	       ldm.f	r14, -20
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       brz eq @	r0, .BB8_17
	;;
.BB8_14:                                ;   in Loop: Header=BB8_4 Depth=2
#0:	       sub	r14, 4 -> r1
	;;
#0:	       cmp eq	r1, r0 -> c1
	;;
#0:	if  c1 br @	.BB8_16
	;;
.BB8_15:                                ;   in Loop: Header=BB8_4 Depth=2
#0:	       callg	__free_r
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB8_16:                                ;   in Loop: Header=BB8_4 Depth=2
#0:	       sub	r14, 20 -> r0
	;;
#0:	       stm.a	0, r0, 0
	;;
.BB8_17:                                ;   in Loop: Header=BB8_4 Depth=2
#0:	       ldm.f	r14, 0
	;;
#0:	       or	r31, 0 -> r0
	;;
#0:	       brz eq @	r0, .BB8_19
	;;
.BB8_18:                                ;   in Loop: Header=BB8_4 Depth=2
#0:	       callg	__free_r
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       stm.a	0, r14, 0
	;;
.BB8_19:                                ;   in Loop: Header=BB8_4 Depth=2
#0:	       or	r14, 0 -> r0
	;;
#0:	       addi	-56 -> r0
	;;
#0:	       stmh.a	0, r0, 0
	;;
.BB8_20:                                ; %fclose.exit.i
                                        ;   in Loop: Header=BB8_4 Depth=2
#0:	       sub	r13, 1 -> r13
#1:	       s2add	r14, 26 -> r14
	;;
#0:	       brz gt @	r13, .BB8_4
	;;
.BB8_21:                                ; %._crit_edge.i
                                        ;   in Loop: Header=BB8_2 Depth=1
#0:	       ldm.f	r10, 0
	;;
#0:	       brz ne @	r31, .BB8_2
#1:	       or	r31, 0 -> r10
	;;
.BB8_22:                                ; %_fwalk.exit
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
.tmp8:
	.size	__cleanup_r, .tmp8-__cleanup_r

	.type	___sread,@function
___sread:                               ; @__sread
	.funsz	___sread_end-___sread
___sread_start:
; BB#0:
#1:	       ldga	_errno.b -> r1.16
#0:	       ldm.f	r1, 14
#2:	       add	r1, 2 -> r4
	;;
#0:	       bbh	mzext16 r4 -> r4
#1:	       stmb.a	0, r1.16, 0
	;;
#0:	       brz eq @	r4, .BB9_2
	;;
.BB9_1:
#1:	       stmb.a	1, r1.16, 0
#0:	       br @	.BB9_7
#2:	       ldi	-1 -> r3
#3:	       comb	or c1, !c1 -> c1
	;;
.BB9_2:                                 ; %.preheader1.i.i
#0:	       cmp lt	r3, 1 -> c1
	;;
#0:	if  c1 br @	.BB9_10
	;;
.BB9_3:
#0:	       ldi	0 -> r4
#1:	       ldi	-120 -> r5
#2:	       ldi	-116 -> r6
	;;
.BB9_4:                                 ; =>This Inner Loop Header: Depth=1
#0:	       ldm.b	r5, 0
	;;
#0:	       bbh	mzext8 0 -> r7
	;;
#0:	       btest	r7, 1 -> !c1
	;;
#0:	if  c1 br @	.BB9_4
	;;
.BB9_5:                                 ;   in Loop: Header=BB9_4 Depth=1
#0:	       add	r2, r4 -> r7
#1:	       add	r4, 1 -> r4
#2:	       ldm.b	r6, 0
	;;
#0:	       cmp eq	r4, r3 -> c1
	;;
#0:	if !c1 br	.BB9_4
#1:	       bbh	mzext8 r6 -> r8
	;;
#0:	       stmb.a	r8, r7, 0
	;;
	       nop	0
	;;
.BB9_6:                                 ; %_read.exit.i.loopexit
#0:	       ldmg.d	_errno.b
#1:	       ldga	_errno.b -> r2
	;;
#0:	       bbh	mzext8 r2 -> r2
	;;
#0:	       btest	r2, 0 -> c1
	;;
.BB9_7:                                 ; %_read.exit.i
#0:	       cmp eq	r3, -1 -> c2
	;;
#0:	       comb	and c2, c1 -> c1
	;;
#0:	if !c1 br @	.BB9_10
	;;
.BB9_8:                                 ; %_read_r.exit.thread
#0:	       ldi	88 -> r2
#1:	       ldi	-1 -> r3
	;;
#0:	       stm.a	r2, r0, 0
	;;
.BB9_9:
#0:	       ldm.f	r1, 12
#1:	       ldiu	2047 -> r2
	;;
#0:	       ldim	29 -> r2
	;;
#0:	       jop	ret
#1:	       bbh	mzext16 r1 -> r0
	;;
#0:	       and	r0, r2 -> r0
	;;
#0:	       stmh.a	r0, r1, 6
#1:	       or	r3, 0 -> r0
	;;
	       nop	0
	;;
.BB9_10:                                ; %_read_r.exit
#0:	       brz lt @	r3, .BB9_9
	;;
.BB9_11:
#0:	       jop	ret
	;;
#0:	       ldm.f	r1, 80
	;;
#0:	       add	r31, r3 -> r0
	;;
#0:	       stm.a	r0, r1, 20
#1:	       or	r3, 0 -> r0
	;;
	.align	4
___sread_end:
.tmp9:
	.size	___sread, .tmp9-___sread

	.type	___swrite,@function
___swrite:                              ; @__swrite
	.funsz	___swrite_end-___swrite
___swrite_start:
; BB#0:
#0:	       ldm.f	r1, 12
	;;
#0:	       bbh	mzext16 r1 -> r4
	;;
#0:	       btest	r4, 8 -> !c1
	;;
#0:	if  c1 br @	.BB10_2
	;;
.BB10_1:                                ; %_lseek_r.exit
#1:	       ldga	_errno.b -> r1.16
#0:	       ldi	88 -> r5
	;;
#1:	       stmb.a	1, r1.16, 0
	;;
#0:	       stm.a	r5, r0, 0
	;;
.BB10_2:                                ; %._crit_edge
#0:	       ldiu	2047 -> r5
	;;
#0:	       ldim	29 -> r5
	;;
#0:	       and	r4, r5 -> r4
	;;
#0:	       stmh.a	r4, r1, 6
#1:	       add	r1, 2 -> r4
	;;
#0:	       ldm.f	r1, 14
#1:	       ldga	_errno.b -> r1
	;;
#0:	       bbh	msext16 r4 -> r4
#1:	       stmb.a	0, r1, 0
	;;
#0:	       sub	r4, 1 -> r4
	;;
#0:	       cmpu gt	r4, 1 -> c1
	;;
#0:	if  c1 br @	.BB10_8
	;;
.BB10_3:                                ; %.preheader2.i.i
#0:	       cmp lt	r3, 1 -> c1
	;;
#0:	if  c1 br @	.BB10_10
	;;
.BB10_4:
#0:	       ldi	0 -> r1
#1:	       ldi	-120 -> r4
#2:	       ldi	-116 -> r5
	;;
.BB10_5:                                ; =>This Inner Loop Header: Depth=1
#0:	       ldm.b	r4, 0
	;;
#0:	       bbh	mzext8 0 -> r6
	;;
#0:	       btest	r6, 0 -> c1
	;;
#0:	if !c1 br @	.BB10_5
	;;
.BB10_6:                                ;   in Loop: Header=BB10_5 Depth=1
#0:	       add	r2, r1 -> r6
#1:	       ldmr.f	r1, r2, 0
#2:	       add	r1, 1 -> r1
	;;
#0:	       cmp eq	r1, r3 -> c1
	;;
#0:	if !c1 br	.BB10_5
#1:	       bbh	mzext8 r6 -> r6
	;;
#0:	       stmb.a	r6, r5, 0
	;;
	       nop	0
	;;
.BB10_7:                                ; %_write.exit.i.loopexit
#0:	       ldmg.d	_errno.b
#1:	       br	.BB10_9
#2:	       ldga	_errno.b -> r1
	;;
#0:	       bbh	mzext8 r1 -> r1
	;;
#0:	       btest	r1, 0 -> c1
	;;
.BB10_8:
#0:	       ldi	-1 -> r3
#1:	       comb	or c1, !c1 -> c1
#2:	       stmb.a	1, r1, 0
	;;
.BB10_9:                                ; %_write.exit.i
#0:	       cmp eq	r3, -1 -> c2
	;;
#0:	       comb	and c2, c1 -> c1
	;;
#0:	if  c1 ldi	88 -> r1
#1:	if  c1 ldi	-1 -> r3
	;;
#0:	if  c1 stm.a	r1, r0, 0
	;;
.BB10_10:                               ; %_write_r.exit
#0:	       or	r3, 0 -> r0
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
.tmp10:
	.size	___swrite, .tmp10-___swrite

	.type	___sseek,@function
___sseek:                               ; @__sseek
	.funsz	___sseek_end-___sseek
___sseek_start:
; BB#0:
#0:	       ldga	_errno.b -> r2
#1:	       ldi	88 -> r3
	;;
#0:	       stmb.a	1, r2, 0
#1:	       ldiu	2047 -> r2
	;;
#0:	       stm.a	r3, r0, 0
#1:	       ldim	29 -> r2
	;;
#0:	       ldm.f	r1, 12
	;;
#0:	       jop	ret
#1:	       bbh	mzext16 r1 -> r0
	;;
#0:	       and	r0, r2 -> r0
	;;
#0:	       stmh.a	r0, r1, 6
#1:	       ldi	-1 -> r0
	;;
	       nop	0
	;;
	.align	4
___sseek_end:
.tmp11:
	.size	___sseek, .tmp11-___sseek

	.type	___sclose,@function
___sclose:                              ; @__sclose
	.funsz	___sclose_end-___sclose
___sclose_start:
; BB#0:
#0:	       ldm.f	r1, 14
#1:	       add	r1, 2 -> r2
	;;
#0:	       bbh	mzext16 r2 -> r1
	;;
#0:	       cmpu gt	r1, 2 -> c1
	;;
#0:	if  c1 br @	.BB12_2
	;;
.BB12_1:                                ; %_close.exit.i.thread
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
.BB12_2:
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
.tmp12:
	.size	___sclose, .tmp12-___sclose

	.globl	___ashldi3
	.type	___ashldi3,@function
___ashldi3:                             ; @__ashldi3
	.funsz	___ashldi3_end-___ashldi3
___ashldi3_start:
; BB#0:
#0:	       btest	r2, 5 -> !c1
	;;
#0:	if !c1 br @	.BB13_4
	;;
.BB13_1:
#0:	       brz eq @	r2, .BB13_3
	;;
.BB13_2:
#0:	       ldi	32 -> r3
#1:	       sl	r1, r2 -> r1
	;;
#0:	       sub	r3, r2 -> r3
	;;
#0:	       sr	r0, r3 -> r3
#1:	       sl	r0, r2 -> r0
	;;
#0:	       or	r1, r3 -> r1
	;;
.BB13_3:
#0:	       jop	ret
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB13_4:
#0:	       addi	-32 -> r2
#1:	       jop	ret
	;;
#0:	       sl	r0, r2 -> r1
#1:	       ldi	0 -> r0
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
___ashldi3_end:
.tmp13:
	.size	___ashldi3, .tmp13-___ashldi3

	.globl	___ashrdi3
	.type	___ashrdi3,@function
___ashrdi3:                             ; @__ashrdi3
	.funsz	___ashrdi3_end-___ashrdi3
___ashrdi3_start:
; BB#0:
#0:	       btest	r2, 5 -> !c1
	;;
#0:	if !c1 br @	.BB14_4
	;;
.BB14_1:
#0:	       brz eq @	r2, .BB14_3
	;;
.BB14_2:
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
.BB14_3:
#0:	       jop	ret
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB14_4:
#0:	       addi	-32 -> r2
#1:	       jop	ret
	;;
#0:	       sra	r1, r2 -> r0
#1:	       sra	r1, 31 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
___ashrdi3_end:
.tmp14:
	.size	___ashrdi3, .tmp14-___ashrdi3

	.globl	___divdf3
	.type	___divdf3,@function
___divdf3:                              ; @__divdf3
	.funsz	___divdf3_end-___divdf3
___divdf3_start:
; BB#0:
#0:	       wb.s	r15, 50
#1:	       addi	-200 -> r15
#2:	       ldiu	128 -> r4
#3:	       stx	r2 -> $f0
	;;
#0:	       add	r15, r4 -> r4
#1:	       stx	r3 -> $f2
#2:	       s2add	r15, 16 -> r5
#3:	       s2add	r15, 24 -> r9
	;;
#0:	       stm.s	r10, r4, 13
#1:	       stx	r1 -> $f4
#2:	       add	r5, 24 -> r3
#3:	       ldiu	0 -> r6
	;;
#0:	       stm.s	r11, r4, 12
#1:	       ldih	1024 -> r6
#2:	       ldi	0 -> r8
	;;
#0:	       stm.s	r12, r4, 11
	;;
#0:	       stm.s	r13, r4, 10
#1:	       ldx	$ro, 0 -> r13
	;;
#0:	       stm.s	r14, r4, 9
	;;
#0:	       stm.s	r0.23, r4, 8
	;;
#1:	       stm.s	r1.23, r4, 7
	;;
#2:	       stm.s	r2.23, r4, 6
	;;
#3:	       stm.s	r3.23, r4, 5
	;;
#0:	       stm.s	r0.24, r4, 4
	;;
#1:	       stm.s	r1.24, r4, 3
	;;
#2:	       stm.s	r2.24, r4, 2
	;;
#3:	       stm.s	r3.24, r4, 1
	;;
#1:	       stm.s	r1.25, r4, 0
#0:	       ldx	$rb, 0 -> r4
	;;
#2:	       stm.s	r2.25, r15, 31
	;;
#1:	       stm.s	r1.26, r15, 30
	;;
#1:	       stm.s	r1.27, r15, 29
	;;
#1:	       stm.s	r1.28, r15, 28
	;;
#0:	       stm.s	r4, r15, 27
	;;
#0:	       stm.s	r13, r15, 26
#1:	       fop	fmov	f2 -> f1
	;;
#0:	       stx	r0 -> $f2
#1:	       stm.a	r2, r15, 22
#2:	       or	r3, 4 -> r0
#3:	       add	r9, 0 -> r3
	;;
#0:	       fop	fmov	f4 -> f3
	;;
#0:	       ldx	$f1 -> r2
	;;
#0:	       stm.a	r2, r0, 0
#1:	       ldx	$f2 -> r1
#2:	       or	r3, 4 -> r2
#3:	       ldiu	2047 -> r3
	;;
#0:	       stm.a	r1, r15, 24
#1:	       ldx	$f3 -> r1
#2:	       ldim	511 -> r3
	;;
#0:	       stm.a	r1, r2, 0
#1:	       ldiu	2047 -> r1
	;;
#0:	       ldm.f	r0, 0
	;;
#0:	       or	r31, 0 -> r4
#1:	       ldm.f	r2, 0
	;;
#0:	       and	r4, r3 -> r13
#1:	       sr	r4, 20 -> r5
	;;
#1:	       and	r5, r1 -> r1.26
#0:	       or	r31, 0 -> r2
	;;
#0:	       sr	r2, 20 -> r0
#1:	       and	r2, r3 -> r3
#2:	       xor	r4, r2 -> r7
	;;
#1:	       and	r0, r1 -> r1.25
#0:	       stm.s	r3, r15, 2
#2:	       ldiu	2045 -> r3
#3:	       and	r7, r6 -> r6
	;;
#1:	       sub	r1.25, 1 -> r0
#0:	       ldm.f	r15, 88
	;;
#0:	       cmpu gt	r0, r3 -> c1
	;;
#1:	if  c1 br	.BB15_2
#0:	       or	r31, 0 -> r0.24
#2:	       ldm.f	r15, 96
	;;
#1:	       or	r31, 0 -> r1.23
	;;
	       nop	0
	;;
.BB15_1:
#1:	       sub	r1.26, 1 -> r0
#0:	       ldiu	2046 -> r3
	;;
#0:	       cmpu lt	r0, r3 -> c1
	;;
#0:	if  c1 br @	.BB15_6
	;;
.BB15_2:
#1:	       cmp eq	r1.23, 0 -> c2
#0:	       ldim	1023 -> r1
#2:	       ldga	1048576 -> r0
	;;
#0:	       ldih	1023 -> r1
#1:	       ldih	1023 -> r0
	;;
#0:	       and	r2, r1 -> r3
	;;
#0:	       cmp eq	r3, r0 -> c1
	;;
#0:	if !c1 cmpu lt	r3, r0 -> c2 ; aacf
	;;
#0:	if  c2 br @	.BB15_4
	;;
.BB15_3:
#0:	       ldga	524288 -> r0
#1:	       add	r15, 16 -> r3
	;;
#0:	       or	r2, r0 -> r1
#1:	       or	r3, 4 -> r0
	;;
#0:	       br	.BB15_28
#1:	       stm.a	r1, r0, 0
	;;
#1:	       stm.a	r1.23, r15, 4
	;;
#0:	       ldm.f	r15, 16
	;;
.BB15_4:
#0:	       cmp eq	r0.24, 0 -> c2
#1:	       and	r4, r1 -> r10
	;;
#0:	       cmp eq	r10, r0 -> c1
	;;
#0:	if !c1 cmpu lt	r10, r0 -> c2 ; aacf
	;;
#0:	if  c2 br @	.BB15_9
	;;
.BB15_5:
#0:	       ldga	524288 -> r0
#1:	       add	r15, 24 -> r3
	;;
#0:	       or	r4, r0 -> r1
#1:	       or	r3, 4 -> r0
	;;
#0:	       br	.BB15_28
#1:	       stm.a	r1, r0, 0
	;;
#0:	       stm.a	r0.24, r15, 6
	;;
#0:	       ldm.f	r15, 24
	;;
.BB15_6:
#3:	       or	r8, 0 -> r3.23
#0:	       stm.s	r6, r15, 3
	;;
.BB15_7:
#1:	       ldiu	0 -> r1.27
#0:	       sr	r0.24, 21 -> r1
#3:	       ldi	0 -> r3.24
#2:	       ldiu	0 -> r0
	;;
#0:	       ldim	512 -> r0
#1:	       ldiu	819 -> r3
	;;
#0:	       or	r13, r0 -> r0.23
#1:	       ldim	158 -> r3
	;;
#1:	       callg	___muldi3
#0:	       sl	r0.23, 11 -> r0
#2:	       ldih	936 -> r3
	;;
#0:	       or	r1, r0 -> r14
#1:	       ldi	0 -> r1
	;;
#0:	       sub	r3, r14 -> r10
#1:	       or	r14, 0 -> r2
#2:	       ldi	0 -> r3
	;;
#0:	       or	r10, 0 -> r0
	;;
#0:	       callg	___muldi3
	;;
#3:	       sub	r3.24, r1 -> r0
#0:	       ldi	0 -> r1
#1:	       or	r10, 0 -> r2
#2:	       ldi	0 -> r3
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       callg	___muldi3
	;;
#0:	       sl	r1, 1 -> r1
#1:	       sr	r0, 31 -> r0
#2:	       or	r14, 0 -> r2
#3:	       ldi	0 -> r3
	;;
#0:	       or	r0, r1 -> r10
#1:	       ldi	0 -> r1
	;;
#0:	       or	r10, 0 -> r0
	;;
#0:	       callg	___muldi3
	;;
#3:	       sub	r3.24, r1 -> r0
#0:	       ldi	0 -> r1
#1:	       or	r10, 0 -> r2
#2:	       ldi	0 -> r3
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       callg	___muldi3
	;;
#0:	       sl	r1, 1 -> r1
#1:	       sr	r0, 31 -> r0
#2:	       or	r14, 0 -> r2
#3:	       ldi	0 -> r3
	;;
#0:	       or	r0, r1 -> r10
#1:	       ldi	0 -> r1
	;;
#0:	       or	r10, 0 -> r0
	;;
#0:	       callg	___muldi3
	;;
#3:	       sub	r3.24, r1 -> r0
#0:	       ldi	0 -> r1
#1:	       or	r10, 0 -> r2
#2:	       ldi	0 -> r3
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       sl	r0.24, 11 -> r2
#1:	       sl	r1, 1 -> r1
#2:	       sr	r0, 31 -> r0
#3:	       ldi	0 -> r3
	;;
#0:	       callg	___muldi3
#1:	       or	r0, r1 -> r0
#2:	       ldi	0 -> r1
	;;
#0:	       sub	r0, 1 -> r12
	;;
#0:	       or	r12, 0 -> r0
	;;
	       nop	0
	;;
#0:	       callg	___muldi3
	;;
#0:	       or	r1, 0 -> r10
#1:	       or	r12, 0 -> r0
#2:	       ldi	0 -> r1
#3:	       or	r14, 0 -> r2
	;;
#0:	       ldi	0 -> r3
	;;
	       nop	0
	;;
#0:	       callg	___muldi3
#1:	       carr	r0, r10 -> r3
#2:	       add	r0, r10 -> r13
	;;
#3:	       borr	r3.24, r13 -> r2
#0:	       add	r1, r3 -> r0
#1:	       ldi	0 -> r1
#2:	       ldi	0 -> r3
	;;
#3:	       sub	r3.24, r0 -> r0
	;;
#0:	       sub	r0, r2 -> r0
#1:	       or	r12, 0 -> r2
	;;
#0:	       callg	___muldi3
	;;
#0:	       or	r0, 0 -> r10
#1:	       or	r1, 0 -> r11
#2:	       ldi	0 -> r1
#3:	       or	r12, 0 -> r2
	;;
#3:	       sub	r3.24, r13 -> r0
#0:	       ldi	0 -> r3
	;;
	       nop	0
	;;
#1:	       sl	r1.23, 2 -> r1.24
#0:	       carr	r10, r1 -> r2
#2:	       add	r10, r1 -> r12
#3:	       ldi	-2 -> r0
	;;
#0:	       add	r11, r2 -> r2
#1:	       carr	r12, r0 -> r0
#2:	       ldi	0 -> r1
#3:	       ldi	0 -> r3
	;;
#0:	       callg	___muldi3
#2:	       add	r2, r0 -> r0
#1:	       or	r1.24, 0 -> r2
	;;
#0:	       sub	r0, 1 -> r10
	;;
#0:	       or	r10, 0 -> r0
	;;
	       nop	0
	;;
#2:	       or	r0, 0 -> r2.23
#1:	       or	r1, 0 -> r1.28
#0:	       ldm.s	r15, 8
	;;
#1:	       sr	r1.23, 30 -> r0
	;;
#1:	       ldih	2 -> r1.27
#0:	       or	r31, 0 -> r3
	;;
#0:	       callg	___muldi3
#1:	       sl	r3, 2 -> r1
#2:	       ldi	0 -> r3
	;;
#0:	       or	r0, r1 -> r0
#1:	       ldi	0 -> r1
	;;
#1:	       or	r0, r1.27 -> r11
#0:	       or	r10, 0 -> r0
	;;
#0:	       or	r11, 0 -> r2
	;;
#0:	       callg	___muldi3
	;;
#2:	       or	r1, 0 -> r2.25
#0:	       sub	r12, 2 -> r12
#1:	       or	r0, 0 -> r10
#3:	       ldi	0 -> r1
	;;
#0:	       or	r12, 0 -> r0
#1:	       or	r11, 0 -> r2
#2:	       ldi	0 -> r3
	;;
	       nop	0
	;;
#2:	       or	r0, 0 -> r2.24
#1:	       sub	r1.25, r1.26 -> r0
#0:	       ldiu	2047 -> r13
#3:	       add	r1, r10 -> r2
	;;
#1:	       carr	r2, r1.28 -> r3
#3:	       add	r3.23, r0 -> r11
#0:	       carr	r1, r10 -> r1
#2:	       ldim	1023 -> r13
	;;
#0:	       callg	___muldi3
#2:	       add	r2.25, r1 -> r1
#1:	       add	r2, r1.28 -> r10
#3:	       ldi	-4 -> r0
	;;
#2:	       and	r2.23, r0 -> r14
#1:	       or	r1.24, 0 -> r2
#0:	       add	r1, r3 -> r1
#3:	       or	r12, 0 -> r0
	;;
#0:	       stm.s	r1, r15, 2
#1:	       ldi	0 -> r1
#2:	       ldi	0 -> r3
	;;
	       nop	0
	;;
#0:	       carr	r1, r14 -> r0
#1:	       add	r1, r14 -> r1
#2:	       ldm.s	r15, 8
	;;
#2:	       carr	r1, r2.24 -> r1
	;;
#0:	       add	r0, r1 -> r0
#1:	       or	r31, 0 -> r2
	;;
#0:	       carr	r10, r0 -> r1
#1:	       add	r10, r0 -> r12
	;;
#0:	       add	r2, r1 -> r14
	;;
#0:	       cmpu gt	r14, r13 -> c1
	;;
#0:	if  c1 br @	.BB15_12
	;;
.BB15_8:
#0:	       or	r0.24, 0 -> r2
#1:	       callg	___muldi3
#2:	       or	r12, 0 -> r0
#3:	       or	r14, 0 -> r1
	;;
#0:	       or	r0.23, 0 -> r3
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       br	.BB15_13
#1:	       sl	r1.23, 21 -> r3
#3:	       borr	r3.24, r0 -> r2
#2:	       sub	r11, 1 -> r11
	;;
#3:	       sub	r3.24, r0 -> r0
#0:	       sub	r3, r1 -> r1
	;;
#0:	       sub	r1, r2 -> r1
	;;
.BB15_9:
#0:	       ldga	1048576 -> r0
	;;
#0:	       ldih	1023 -> r0
	;;
#0:	       xor	r3, r0 -> r1
	;;
#1:	       or	r1.23, r1 -> r1
	;;
#0:	       brz ne @	r1, .BB15_17
	;;
.BB15_10:
#0:	       xor	r10, r0 -> r0
#1:	       fop	dnan -> d0
	;;
#0:	       or	r0.24, r0 -> r0
	;;
#0:	       cmp eq	r0, 0 -> c3
	;;
#0:	if  c3 br @	.BB15_29
	;;
.BB15_11:
#0:	       ldga	1048576 -> r0
#1:	       s2add	r15, 8 -> r2
	;;
#0:	       ldih	1023 -> r0
#1:	       add	r2, 0 -> r3
	;;
#0:	       or	r6, r0 -> r1
#1:	       or	r3, 4 -> r0
	;;
#0:	       br	.BB15_28
#1:	       stm.a	r1, r0, 0
	;;
#0:	       stm.a	r8, r15, 8
	;;
#0:	       ldm.f	r15, 32
	;;
.BB15_12:
#0:	       callg	___muldi3
	;;
#0:	       or	r0.24, 0 -> r2
#1:	       sl	r14, 31 -> r1
#2:	       sr	r12, 1 -> r0
#3:	       sr	r14, 1 -> r14
	;;
#0:	       or	r0.23, 0 -> r3
#1:	       or	r0, r1 -> r12
#2:	       or	r14, 0 -> r1
	;;
#0:	       or	r12, 0 -> r0
	;;
#1:	       sl	r1.23, 20 -> r3
#3:	       borr	r3.24, r0 -> r2
	;;
#3:	       sub	r3.24, r0 -> r0
#0:	       sub	r3, r1 -> r1
	;;
#0:	       sub	r1, r2 -> r1
	;;
.BB15_13:
#0:	       addi	1023 -> r11
#1:	       ldiu	2047 -> r2
#2:	       ldm.s	r15, 12
#3:	       ldi	0 -> r3
	;;
#0:	       cmp lt	r11, r2 -> c1
	;;
#0:	if  c1 br @	.BB15_15
#1:	       or	r31, 0 -> r4
	;;
.BB15_14:
#0:	       ldga	1048576 -> r0
#1:	       s2add	r15, 8 -> r2
	;;
#0:	       ldih	1023 -> r0
#1:	       add	r2, 24 -> r2
	;;
#0:	       or	r4, r0 -> r1
#1:	       or	r2, 4 -> r0
	;;
#0:	       br	.BB15_28
#1:	       stm.a	r1, r0, 0
	;;
#0:	       stm.a	r3, r15, 14
	;;
#0:	       ldm.f	r15, 56
	;;
.BB15_15:
#0:	       brz le @	r11, .BB15_19
	;;
.BB15_16:
#0:	       add	r0, r0 -> r2
#1:	       carr	r0, r0 -> r0
#2:	       add	r1, r1 -> r1
#3:	       s2add	r15, 16 -> r5
	;;
#0:	       cmpu gt	r2, r0.24 -> c1
#1:	       add	r1, r0 -> r0
#2:	       ldiu	2047 -> r2
	;;
#0:	       cmp eq	r0, r0.23 -> c2
#1:	       ldim	511 -> r2
	;;
#0:	if !c2 cmpu gt	r0, r0.23 -> c1 ; aacf
	;;
#0:	       ldx	$c1 -> r0
	;;
#0:	       carr	r12, r0 -> r1
#1:	       and	r14, r2 -> r0
#2:	       sl	r11, 20 -> r2
#3:	if  c1 add	r12, 1 -> r12
	;;
#0:	       or	r2, r0 -> r2
#1:	       add	r5, 8 -> r0
#2:	       or	r12, r3 -> r3
	;;
#0:	       add	r2, r1 -> r1
#1:	       or	r0, 4 -> r0
	;;
#0:	       or	r1, r4 -> r1
	;;
#0:	       br	.BB15_28
#1:	       stm.a	r1, r0, 0
	;;
#0:	       stm.a	r3, r15, 18
	;;
#0:	       ldm.f	r15, 72
	;;
.BB15_17:
#0:	       xor	r10, r0 -> r0
	;;
#0:	       or	r0.24, r0 -> r0
	;;
#0:	       brz ne @	r0, .BB15_20
	;;
.BB15_18:
#0:	       s2add	r15, 8 -> r1
	;;
#0:	       add	r1, 8 -> r0
	;;
#0:	       or	r0, 4 -> r0
	;;
#0:	       br	.BB15_28
#1:	       stm.a	r6, r0, 0
	;;
#0:	       stm.a	r8, r15, 10
	;;
#0:	       ldm.f	r15, 40
	;;
.BB15_19:
#0:	       s2add	r15, 16 -> r1
	;;
#0:	       add	r1, 0 -> r0
	;;
#0:	       or	r0, 4 -> r0
	;;
#0:	       br	.BB15_28
#1:	       stm.a	r4, r0, 0
	;;
#0:	       stm.a	r3, r15, 16
	;;
#0:	       ldm.f	r15, 64
	;;
.BB15_20:
#1:	       or	r1.23, r3 -> r0
	;;
#0:	       brz eq @	r0, .BB15_25
	;;
.BB15_21:
#0:	       or	r0.24, r10 -> r0
	;;
#0:	       brz eq @	r0, .BB15_27
	;;
.BB15_22:
#3:	       ldi	0 -> r3.23
#0:	       ldiu	2047 -> r11
	;;
#0:	       ldim	511 -> r11
	;;
#0:	       cmpu gt	r3, r11 -> c1
	;;
#0:	if  c1 br @	.BB15_30
	;;
.BB15_23:
#0:	       ldm.s	r15, 8
	;;
#0:	       or	r31, 0 -> r1
	;;
#0:	       brz eq @	r1, .BB15_31
	;;
.BB15_24:
#0:	       bbh	clz r1 -> r12
#1:	       br @	.BB15_32
#2:	       stm.s	r6, r15, 3
	;;
.BB15_25:
#0:	       or	r0.24, r10 -> r0
#1:	       fop	dnan -> d0
	;;
#0:	       brz eq @	r0, .BB15_29
	;;
.BB15_26:
#0:	       s2add	r15, 8 -> r1
	;;
#0:	       add	r1, 16 -> r0
	;;
#0:	       or	r0, 4 -> r0
	;;
#0:	       br	.BB15_28
#1:	       stm.a	r6, r0, 0
	;;
#0:	       stm.a	r8, r15, 12
	;;
#0:	       ldm.f	r15, 48
	;;
.BB15_27:
#0:	       ldga	1048576 -> r0
#1:	       s2add	r15, 16 -> r2
	;;
#0:	       ldih	1023 -> r0
#1:	       add	r2, 16 -> r3
	;;
#0:	       or	r6, r0 -> r1
#1:	       or	r3, 4 -> r0
	;;
#0:	       stm.a	r1, r0, 0
	;;
#0:	       stm.a	r8, r15, 20
	;;
#0:	       ldm.f	r15, 80
	;;
.BB15_28:
#0:	       stx	r31 -> $f0
#1:	       ldm.f	r0, 0
	;;
#0:	       stx	r31 -> $f2
	;;
#0:	       fop	fmov	f2 -> f1
	;;
.BB15_29:
#0:	       ldm.s	r15, 104
	;;
#0:	       stx	r31 -> $ro
#1:	       ldm.s	r15, 108
	;;
#0:	       stx	r31 -> $rb
#1:	       ldm.s	r15, 112
	;;
#1:	       or	r31, 0 -> r1.28
#0:	       ldm.s	r15, 116
	;;
#1:	       or	r31, 0 -> r1.27
#0:	       ldm.s	r15, 120
	;;
#1:	       or	r31, 0 -> r1.26
#0:	       ldm.s	r15, 124
	;;
#2:	       or	r31, 0 -> r2.25
#0:	       ldm.s	r15, 128
	;;
#1:	       or	r31, 0 -> r1.25
#0:	       ldm.s	r15, 132
	;;
#3:	       or	r31, 0 -> r3.24
#0:	       ldm.s	r15, 136
	;;
#2:	       or	r31, 0 -> r2.24
#0:	       ldm.s	r15, 140
	;;
#1:	       or	r31, 0 -> r1.24
#0:	       ldm.s	r15, 144
	;;
#0:	       or	r31, 0 -> r0.24
#1:	       ldm.s	r15, 148
	;;
#3:	       or	r31, 0 -> r3.23
#0:	       ldm.s	r15, 152
	;;
#2:	       or	r31, 0 -> r2.23
#0:	       ldm.s	r15, 156
	;;
#1:	       or	r31, 0 -> r1.23
#0:	       ldm.s	r15, 160
	;;
#0:	       or	r31, 0 -> r0.23
#1:	       ldm.s	r15, 164
	;;
#0:	       or	r31, 0 -> r14
#1:	       ldm.s	r15, 168
	;;
#0:	       or	r31, 0 -> r13
#1:	       ldm.s	r15, 172
	;;
#0:	       or	r31, 0 -> r12
#1:	       ldm.s	r15, 176
	;;
#0:	       or	r31, 0 -> r11
#1:	       ldm.s	r15, 180
#2:	       addi	200 -> r15
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
.BB15_30:
#0:	       stm.s	r6, r15, 3
#1:	       br	.BB15_33
	;;
#0:	       ldm.s	r15, 8
	;;
#0:	       or	r31, 0 -> r1
	;;
.BB15_31:
#1:	       bbh	clz r1.23 -> r0
#0:	       stm.s	r6, r15, 3
	;;
#0:	       s2add	r0, 8 -> r12
	;;
.BB15_32:                               ; %normalize.exit3
#1:	       or	r1.23, 0 -> r0
#0:	       callg	___ashldi3
#2:	       sub	r12, 11 -> r2
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#1:	       or	r0, 0 -> r1.23
#0:	       ldi	12 -> r0
	;;
#3:	       sub	r0, r12 -> r3.23
	;;
.BB15_33:
#0:	       cmpu gt	r10, r11 -> c1
#1:	       stm.s	r1, r15, 2
	;;
#0:	if  c1 br @	.BB15_7
	;;
.BB15_34:
#0:	       brz eq @	r13, .BB15_36
	;;
.BB15_35:
#0:	       bbh	clz r13 -> r10
#1:	       br @	.BB15_37
	;;
.BB15_36:
#0:	       bbh	clz r0.24 -> r0
	;;
#0:	       s2add	r0, 8 -> r10
	;;
.BB15_37:                               ; %normalize.exit
#0:	       or	r0.24, 0 -> r0
#1:	       callg	___ashldi3
#2:	       sub	r10, 11 -> r2
#3:	       or	r13, 0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#1:	       br	.BB15_7
#0:	       or	r0, 0 -> r0.24
#3:	       add	r3.23, r10 -> r0
#2:	       or	r1, 0 -> r13
	;;
#3:	       sub	r0, 12 -> r3.23
	;;
	       nop	0
	;;
	.align	4
___divdf3_end:
.tmp15:
	.size	___divdf3, .tmp15-___divdf3

	.globl	___divdi3
	.type	___divdi3,@function
___divdi3:                              ; @__divdi3
	.funsz	___divdi3_end-___divdi3
___divdi3_start:
; BB#0:
#0:	       wb.s	r15, 12
#1:	       addi	-48 -> r15
#2:	       ldx	$rb, 0 -> r7
	;;
#0:	       stm.s	r10, r15, 5
#1:	       or	r3, 0 -> r10
	;;
#0:	       stm.s	r11, r15, 4
#1:	       or	r1, 0 -> r11
#2:	       sra	r10, 31 -> r5
	;;
#0:	       sra	r11, 31 -> r4
#1:	       xor	r5, r10 -> r6
#2:	       xor	r5, r2 -> r2
#3:	       stm.s	r7, r15, 3
	;;
#0:	       xor	r4, r11 -> r3
#1:	       xor	r4, r0 -> r0
#2:	       ldx	$ro, 0 -> r7
#3:	       sub	r6, r5 -> r6
	;;
#0:	       callg	___udivmoddi4
	;;
#0:	       borr	r0, r4 -> r1
#1:	       sub	r3, r4 -> r3
#2:	       stm.s	r7, r15, 2
#3:	       sub	r0, r4 -> r0
	;;
#0:	       sub	r3, r1 -> r1
#1:	       borr	r2, r5 -> r3
#2:	       sub	r2, r5 -> r2
#3:	       stm.a	0, r15, 0
	;;
#0:	       sub	r6, r3 -> r3
	;;
#0:	       ldm.s	r15, 8
#1:	       xor	r10, r11 -> r2
	;;
#0:	       sra	r2, 31 -> r2
	;;
#0:	       stx	r31 -> $ro
#1:	       ldm.s	r15, 12
#2:	       xor	r1, r2 -> r1
#3:	       xor	r0, r2 -> r0
	;;
#0:	       borr	r0, r2 -> r3
#1:	       sub	r1, r2 -> r1
#2:	       sub	r0, r2 -> r0
	;;
#0:	       stx	r31 -> $rb
#1:	       ldm.s	r15, 16
#2:	       sub	r1, r3 -> r1
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
.tmp16:
	.size	___divdi3, .tmp16-___divdi3

	.globl	___divsf3
	.type	___divsf3,@function
___divsf3:                              ; @__divsf3
	.funsz	___divsf3_end-___divsf3
___divsf3_start:
; BB#0:
#0:	       wb.s	r15, 16
#1:	       addi	-64 -> r15
#2:	       stx	r0 -> $f0
#3:	       ldi	253 -> r7
	;;
#0:	       stm.s	r10, r15, 11
#1:	       ldx	$f0 -> r3
#2:	       ldiu	0 -> r5
#3:	       ldx	$rb, 0 -> r8
	;;
#0:	       stm.s	r11, r15, 10
#1:	       sr	r3, 23 -> r6
#2:	       stx	r1 -> $f0
#3:	       ldiu	2047 -> r1
	;;
#0:	       stm.s	r12, r15, 9
#1:	       ldx	$f0 -> r2
#2:	       ldim	1023 -> r1
#3:	       ldih	1024 -> r5
	;;
#0:	       stm.s	r13, r15, 8
#1:	       or	r1, 0 -> r4
#2:	       xor	r2, r3 -> r0
#3:	       ldx	$ro, 0 -> r9
	;;
#0:	       stm.s	r14, r15, 7
#1:	       ldih	3 -> r4
	;;
#0:	       stm.s	r0.23, r15, 6
	;;
#0:	       bbh	zext8 r6 -> r0.23
#2:	       stm.s	r2.23, r15, 5
	;;
#0:	       sub	r0.23, 1 -> r6
#3:	       stm.s	r3.23, r15, 4
#2:	       and	r0, r5 -> r2.23
#1:	       sr	r2, 23 -> r5
	;;
#0:	       stm.s	r0.24, r15, 3
#3:	       and	r3, r4 -> r3.23
#1:	       cmpu gt	r6, r7 -> c1
#2:	       and	r2, r4 -> r0
	;;
#1:	if  c1 br	.BB17_2
#0:	       stm.s	r0.25, r15, 2
	;;
#0:	       bbh	zext8 r5 -> r0.24
#1:	       stm.s	r8, r15, 1
	;;
#0:	       stm.s	r9, r15, 0
	;;
.BB17_1:
#0:	       sub	r0.24, 1 -> r4
#1:	       ldi	254 -> r5
#2:	       ldi	0 -> r12
	;;
#0:	       cmpu lt	r4, r5 -> c1
	;;
#0:	if  c1 br @	.BB17_14
	;;
.BB17_2:
#0:	       ldiu	1 -> r5
#1:	       ldih	1023 -> r1
	;;
#0:	       and	r3, r1 -> r4
#1:	       ldih	1020 -> r5
	;;
#0:	       cmpu lt	r4, r5 -> c1
	;;
#0:	if  c1 br @	.BB17_4
	;;
.BB17_3:
#0:	       ldiu	0 -> r0
#1:	       br	.BB17_20
	;;
#0:	       ldih	2 -> r0
	;;
#0:	       or	r3, r0 -> r0
	;;
.BB17_4:
#0:	       and	r2, r1 -> r1
	;;
#0:	       cmpu lt	r1, r5 -> c1
	;;
#0:	if  c1 br @	.BB17_6
	;;
.BB17_5:
#0:	       ldiu	0 -> r0
#1:	       br	.BB17_20
	;;
#0:	       ldih	2 -> r0
	;;
#0:	       or	r2, r0 -> r0
	;;
.BB17_6:
#0:	       ldiu	0 -> r2
	;;
#0:	       ldih	1020 -> r2
	;;
#0:	       cmp ne	r4, r2 -> c1
	;;
#0:	if  c1 br @	.BB17_9
	;;
.BB17_7:
#0:	       cmp eq	r1, r2 -> c1
#1:	       fop	fnan -> f0
	;;
#0:	if  c1 br @	.BB17_21
	;;
.BB17_8:
#0:	       ldiu	0 -> r0
#1:	       br	.BB17_20
	;;
#0:	       ldih	1020 -> r0
	;;
#2:	       or	r2.23, r0 -> r0
	;;
.BB17_9:
#0:	       cmp ne	r1, r2 -> c1
	;;
#0:	if  c1 br @	.BB17_11
	;;
.BB17_10:
#2:	       stx	r2.23 -> $f0
#0:	       br @	.BB17_21
	;;
.BB17_11:
#0:	       cmp eq	r4, 0 -> c3
	;;
#0:	if  c3 br @	.BB17_23
	;;
.BB17_12:
#0:	       brz eq @	r1, .BB17_8
	;;
.BB17_13:
#0:	       ldiu	2047 -> r2
#1:	       ldi	0 -> r12
	;;
#0:	       ldim	1023 -> r2
	;;
#0:	       ldih	3 -> r2
	;;
#0:	       cmpu gt	r4, r2 -> c1
#1:	       cmpu gt	r1, r2 -> c3
	;;
#3:	if !c1 bbh	clz r3.23 -> r3
#0:	if !c1 ldi	9 -> r4
#1:	if !c3 bbh	clz r0 -> r1
	;;
#0:	if !c1 sub	r4, r3 -> r12
#1:	if !c3 sub	r1, 8 -> r2
#2:	if !c1 sub	r3, 8 -> r3
	;;
#3:	if !c1 sl	r3.23, r3 -> r3.23
#0:	if !c3 add	r12, r1 -> r1
#1:	if !c3 sl	r0, r2 -> r0
	;;
#0:	if !c3 sub	r1, 9 -> r12
	;;
.BB17_14:
#0:	       ldi	0 -> r0.25
#1:	       ldiu	0 -> r1
#2:	       ldiu	819 -> r3
#3:	       ldiu	0 -> r13
	;;
#0:	       ldih	4 -> r1
#1:	       ldim	158 -> r3
	;;
#0:	       callg	___muldi3
#1:	       or	r0, r1 -> r14
#2:	       ldih	936 -> r3
#3:	       ldi	0 -> r1
	;;
#0:	       sl	r14, 8 -> r10
	;;
#0:	       sub	r3, r10 -> r11
#1:	       or	r10, 0 -> r2
#2:	       ldi	0 -> r3
	;;
#0:	       or	r11, 0 -> r0
	;;
#0:	       callg	___muldi3
	;;
#0:	       sub	r0.25, r1 -> r0
#1:	       ldi	0 -> r1
#2:	       or	r11, 0 -> r2
#3:	       ldi	0 -> r3
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       callg	___muldi3
	;;
#0:	       sl	r1, 1 -> r1
#1:	       sr	r0, 31 -> r0
#2:	       or	r10, 0 -> r2
#3:	       ldi	0 -> r3
	;;
#0:	       or	r0, r1 -> r11
#1:	       ldi	0 -> r1
	;;
#0:	       or	r11, 0 -> r0
	;;
#0:	       callg	___muldi3
	;;
#0:	       sub	r0.25, r1 -> r0
#1:	       ldi	0 -> r1
#2:	       or	r11, 0 -> r2
#3:	       ldi	0 -> r3
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       callg	___muldi3
	;;
#0:	       sl	r1, 1 -> r1
#1:	       sr	r0, 31 -> r0
#2:	       or	r10, 0 -> r2
#3:	       ldi	0 -> r3
	;;
#0:	       or	r0, r1 -> r11
#1:	       ldi	0 -> r1
	;;
#0:	       or	r11, 0 -> r0
	;;
#0:	       callg	___muldi3
	;;
#0:	       sub	r0.25, r1 -> r0
#1:	       ldi	0 -> r1
#2:	       or	r11, 0 -> r2
#3:	       ldi	0 -> r3
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       callg	___muldi3
	;;
#3:	       sl	r3.23, 1 -> r2
#0:	       sl	r1, 1 -> r1
#1:	       sr	r0, 31 -> r0
#2:	       ldih	8 -> r13
	;;
#0:	       or	r0, r1 -> r0
#1:	       or	r2, r13 -> r2
#2:	       ldi	0 -> r1
#3:	       ldi	0 -> r3
	;;
#0:	       sub	r0, 2 -> r0
	;;
#0:	       sub	r0.23, r0.24 -> r0
#1:	       ldiu	2047 -> r2
	;;
#0:	       ldim	1023 -> r2
#1:	       add	r12, r0 -> r0
	;;
#0:	       ldih	7 -> r2
	;;
#0:	       cmpu gt	r1, r2 -> c1
	;;
#0:	if  c1 br @	.BB17_16
	;;
.BB17_15:
#1:	       mul	r1, r14 -> $mul1.0
#0:	       br	.BB17_17
#3:	       sl	r3.23, 24 -> r3
#2:	       sub	r0, 1 -> r0
	;;
#1:	       ldx	$mul1.0, 0 -> r2
	;;
#0:	       sub	r3, r2 -> r2
	;;
.BB17_16:
#3:	       sl	r3.23, 23 -> r3
#0:	       sr	r1, 1 -> r1
	;;
#0:	       mul	r1, r14 -> $mul0.0
	;;
#0:	       ldx	$mul0.0, 0 -> r2
	;;
#0:	       sub	r3, r2 -> r2
	;;
.BB17_17:
#0:	       addi	127 -> r0
#1:	       ldi	255 -> r3
	;;
#0:	       cmp lt	r0, r3 -> c1
	;;
#0:	if !c1 br @	.BB17_8
	;;
.BB17_18:
#0:	       brz le @	r0, .BB17_22
	;;
.BB17_19:
#0:	       sl	r2, 1 -> r3
#1:	       ldiu	2047 -> r2
#2:	       sl	r0, 23 -> r0
	;;
#0:	       ldim	1023 -> r2
#1:	       cmpu gt	r3, r14 -> c1
	;;
#0:	       ldih	3 -> r2
	;;
#0:	       and	r1, r2 -> r1
	;;
#0:	       or	r1, r0 -> r0
	;;
#0:	if  c1 add	r0, 1 -> r0
	;;
#2:	       or	r0, r2.23 -> r0
	;;
.BB17_20:
#0:	       stx	r0 -> $f0
	;;
.BB17_21:
#0:	       ldm.s	r15, 0
	;;
#0:	       stx	r31 -> $ro
#1:	       ldm.s	r15, 4
	;;
#0:	       stx	r31 -> $rb
#1:	       ldm.s	r15, 8
	;;
#0:	       or	r31, 0 -> r0.25
#1:	       ldm.s	r15, 12
	;;
#0:	       or	r31, 0 -> r0.24
#1:	       ldm.s	r15, 16
	;;
#3:	       or	r31, 0 -> r3.23
#0:	       ldm.s	r15, 20
	;;
#2:	       or	r31, 0 -> r2.23
#0:	       ldm.s	r15, 24
	;;
#0:	       or	r31, 0 -> r0.23
#1:	       ldm.s	r15, 28
	;;
#0:	       or	r31, 0 -> r14
#1:	       ldm.s	r15, 32
	;;
#0:	       or	r31, 0 -> r13
#1:	       ldm.s	r15, 36
	;;
#0:	       or	r31, 0 -> r12
#1:	       ldm.s	r15, 40
	;;
#0:	       or	r31, 0 -> r11
#1:	       ldm.s	r15, 44
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
.BB17_22:
#2:	       stx	r2.23 -> $f0
#0:	       br @	.BB17_21
	;;
.BB17_23:
#0:	       fop	fnan -> f0
#1:	       brz eq @	r1, .BB17_21
	;;
.BB17_24:
#2:	       stx	r2.23 -> $f0
#0:	       br @	.BB17_21
	;;
	.align	4
___divsf3_end:
.tmp17:
	.size	___divsf3, .tmp17-___divsf3

	.globl	___lshrdi3
	.type	___lshrdi3,@function
___lshrdi3:                             ; @__lshrdi3
	.funsz	___lshrdi3_end-___lshrdi3
___lshrdi3_start:
; BB#0:
#0:	       btest	r2, 5 -> !c1
	;;
#0:	if !c1 br @	.BB18_4
	;;
.BB18_1:
#0:	       brz eq @	r2, .BB18_3
	;;
.BB18_2:
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
.BB18_3:
#0:	       jop	ret
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
.BB18_4:
#0:	       addi	-32 -> r2
#1:	       jop	ret
	;;
#0:	       sr	r1, r2 -> r0
#1:	       ldi	0 -> r1
	;;
	       nop	0
	;;
	       nop	0
	;;
	.align	4
___lshrdi3_end:
.tmp18:
	.size	___lshrdi3, .tmp18-___lshrdi3

	.globl	___moddi3
	.type	___moddi3,@function
___moddi3:                              ; @__moddi3
	.funsz	___moddi3_end-___moddi3
___moddi3_start:
; BB#0:
#0:	       wb.s	r15, 16
#1:	       addi	-64 -> r15
#2:	       sra	r3, 31 -> r9
#3:	       ldx	$rb, 0 -> r6
	;;
#0:	       stm.s	r10, r15, 9
#1:	       sra	r1, 31 -> r10
#2:	       xor	r9, r3 -> r3
#3:	       xor	r9, r2 -> r2
	;;
#0:	       xor	r10, r1 -> r4
#1:	       xor	r10, r0 -> r0
#2:	       stm.s	r11, r15, 8
#3:	       sub	r3, r9 -> r3
	;;
#0:	       borr	r0, r10 -> r1
#1:	       sub	r4, r10 -> r5
#2:	       stm.s	r6, r15, 7
#3:	       ldx	$ro, 0 -> r6
	;;
#0:	       callg	___udivmoddi4
	;;
#0:	       sub	r5, r1 -> r1
#1:	       borr	r2, r9 -> r5
#2:	       stm.s	r6, r15, 6
#3:	       add	r15, 16 -> r11
	;;
#0:	       sub	r3, r5 -> r3
#1:	       sub	r0, r10 -> r0
#2:	       sub	r2, r9 -> r2
#3:	       stm.a	r11, r15, 0
	;;
	       nop	0
	;;
#0:	       ldm.f	r15, 16
#1:	       or	r11, 4 -> r2
	;;
#0:	       xor	r31, r10 -> r0
#1:	       ldm.f	r2, 0
	;;
#0:	       borr	r0, r10 -> r1
#1:	       sub	r0, r10 -> r0
	;;
#0:	       xor	r31, r10 -> r2
#1:	       ldm.s	r15, 24
	;;
#0:	       sub	r2, r10 -> r2
	;;
#0:	       stx	r31 -> $ro
#1:	       ldm.s	r15, 28
#2:	       sub	r2, r1 -> r1
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
.tmp19:
	.size	___moddi3, .tmp19-___moddi3

	.globl	___modsi3
	.type	___modsi3,@function
___modsi3:                              ; @__modsi3
	.funsz	___modsi3_end-___modsi3
___modsi3_start:
; BB#0:
#0:	       cmp eq	r0, 0 -> c1
#1:	       cmp eq	r1, 0 -> c2
#2:	       ldi	0 -> r3
	;;
#0:	       comb	or c2, c1 -> c1
	;;
#0:	if  c1 br @	.BB20_8
	;;
.BB20_1:
#0:	       sra	r1, 31 -> r2
#1:	       sra	r0, 31 -> r3
	;;
#0:	       xor	r2, r1 -> r4
#1:	       xor	r3, r0 -> r9
	;;
#0:	       sub	r9, r3 -> r5
#1:	       sub	r4, r2 -> r2
#2:	       ldi	0 -> r3
	;;
#0:	       bbh	clz r5 -> r8
#1:	       bbh	clz r2 -> r6
	;;
#0:	       sub	r6, r8 -> r4
	;;
#0:	       cmpu gt	r4, 31 -> c1
	;;
#0:	if  c1 br @	.BB20_8
	;;
.BB20_2:
#0:	       cmpu eq	r4, 31 -> c1
	;;
#0:	if  c1 br @	.BB20_7
	;;
.BB20_3:
#0:	       ldi	31 -> r3
#1:	       add	r4, 1 -> r7
	;;
#0:	       brz eq	r7, .BB20_6
#1:	       sub	r3, r4 -> r3
#2:	       ldi	0 -> r4
	;;
#0:	       sl	r5, r3 -> r3
	;;
	       nop	0
	;;
.BB20_4:                                ; %.lr.ph.i.i
#0:	       sub	r8, 1 -> r4
#1:	       sr	r5, r7 -> r7
	;;
#0:	       sub	r4, r6 -> r5
#1:	       sub	r2, 1 -> r6
#2:	       ldi	0 -> r4
	;;
.BB20_5:                                ; =>This Inner Loop Header: Depth=1
#0:	       sr	r3, 31 -> r8
#1:	       sl	r7, 1 -> r7
#2:	       sl	r3, 1 -> r3
#3:	       add	r5, 1 -> r5
	;;
#0:	       or	r8, r7 -> r7
#1:	       or	r3, r4 -> r3
	;;
#0:	       sub	r6, r7 -> r8
	;;
#0:	       brz ne	r5, .BB20_5
#1:	       sra	r8, 31 -> r8
	;;
#0:	       and	r8, r2 -> r9
#1:	       and	r8, 1 -> r4
	;;
#0:	       sub	r7, r9 -> r7
	;;
.BB20_6:                                ; %._crit_edge.i.i
#0:	       sl	r3, 1 -> r2
#1:	       br	.BB20_8
	;;
#0:	       or	r2, r4 -> r3
	;;
	       nop	0
	;;
.BB20_7:
#0:	       or	r5, 0 -> r3
	;;
.BB20_8:                                ; %__divsi3.exit
#0:	       xor	r1, r0 -> r2
	;;
#0:	       sra	r2, 31 -> r2
	;;
#0:	       xor	r3, r2 -> r3
	;;
#0:	       jop	ret
#1:	       sub	r3, r2 -> r2
	;;
#0:	       mul	r2, r1 -> $mul0.0
	;;
#0:	       ldx	$mul0.0, 0 -> r1
	;;
#0:	       sub	r0, r1 -> r0
	;;
	.align	4
___modsi3_end:
.tmp20:
	.size	___modsi3, .tmp20-___modsi3

	.globl	___muldi3
	.type	___muldi3,@function
___muldi3:                              ; @__muldi3
	.funsz	___muldi3_end-___muldi3
___muldi3_start:
; BB#0:
#1:	       mul	r1, r2 -> $mul1.0
#2:	       mul	r3, r0 -> $mul2.0
#0:	       sr	r0, 16 -> r5
#3:	       sr	r2, 16 -> r4
	;;
#0:	       mul	r4, r5 -> $mul0.0
#1:	       ldx	$mul1.0, 0 -> r1
#2:	       bbh	zext16 r2 -> r3
#3:	       bbh	zext16 r0 -> r2
	;;
#0:	       ldx	$mul0.0, r1 -> r1
#3:	       mul	r3, r5 -> $mul3.0
#1:	       mul	r4, r2 -> $mul1.0
	;;
#0:	       mul	r3, r2 -> $mul0.0
#2:	       ldx	$mul2.0, r1 -> r1
	;;
#0:	       ldx	$mul0.0, 0 -> r0
	;;
#0:	       sr	r0, 16 -> r3
#1:	       bbh	zext16 r0 -> r0
	;;
#3:	       ldx	$mul3.0, r3 -> r3
	;;
#0:	       bbh	zext16 r3 -> r5
#1:	       sr	r3, 16 -> r9
	;;
#1:	       ldx	$mul1.0, r5 -> r2
#0:	       add	r1, r9 -> r1
	;;
#0:	       jop	ret
#1:	       sr	r2, 16 -> r2
	;;
#0:	       add	r1, r2 -> r1
#1:	       ldx	$mul1.0, r3 -> r2
	;;
#0:	       sl	r2, 16 -> r2
	;;
#0:	       or	r2, r0 -> r0
	;;
	.align	4
___muldi3_end:
.tmp21:
	.size	___muldi3, .tmp21-___muldi3

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
.tmp22:
	.size	___udivdi3, .tmp22-___udivdi3

	.globl	___udivsi3
	.type	___udivsi3,@function
___udivsi3:                             ; @__udivsi3
	.funsz	___udivsi3_end-___udivsi3
___udivsi3_start:
; BB#0:
#0:	       cmp eq	r0, 0 -> c1
#1:	       cmp eq	r1, 0 -> c2
#2:	       ldi	0 -> r2
	;;
#0:	       comb	or c2, c1 -> c1
	;;
#0:	if  c1 br @	.BB23_7
	;;
.BB23_1:
#0:	       bbh	clz r0 -> r6
#1:	       bbh	clz r1 -> r4
#2:	       ldi	0 -> r2
	;;
#0:	       sub	r4, r6 -> r3
	;;
#0:	       cmpu gt	r3, 31 -> c1
	;;
#0:	if  c1 br @	.BB23_7
	;;
.BB23_2:
#0:	       cmpu eq	r3, 31 -> c1
	;;
#0:	if  c1 br @	.BB23_8
	;;
.BB23_3:
#0:	       ldi	31 -> r2
#1:	       add	r3, 1 -> r5
	;;
#0:	       brz eq	r5, .BB23_6
#1:	       sub	r2, r3 -> r2
#2:	       ldi	0 -> r3
	;;
#0:	       sl	r0, r2 -> r2
	;;
	       nop	0
	;;
.BB23_4:                                ; %.lr.ph
#0:	       sub	r6, 1 -> r3
#1:	       sr	r0, r5 -> r5
	;;
#0:	       sub	r3, r4 -> r0
#1:	       sub	r1, 1 -> r4
#2:	       ldi	0 -> r3
	;;
.BB23_5:                                ; =>This Inner Loop Header: Depth=1
#0:	       sr	r2, 31 -> r6
#1:	       sl	r5, 1 -> r5
#2:	       sl	r2, 1 -> r2
#3:	       add	r0, 1 -> r0
	;;
#0:	       or	r6, r5 -> r5
#1:	       or	r2, r3 -> r2
	;;
#0:	       sub	r4, r5 -> r6
	;;
#0:	       brz ne	r0, .BB23_5
#1:	       sra	r6, 31 -> r6
	;;
#0:	       and	r6, r1 -> r7
#1:	       and	r6, 1 -> r3
	;;
#0:	       sub	r5, r7 -> r5
	;;
.BB23_6:                                ; %._crit_edge
#0:	       sl	r2, 1 -> r0
	;;
#0:	       or	r0, r3 -> r2
	;;
.BB23_7:
#0:	       or	r2, 0 -> r0
	;;
.BB23_8:
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
.tmp23:
	.size	___udivsi3, .tmp23-___udivsi3

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
.tmp24:
	.size	___umoddi3, .tmp24-___umoddi3

	.globl	___umodsi3
	.type	___umodsi3,@function
___umodsi3:                             ; @__umodsi3
	.funsz	___umodsi3_end-___umodsi3
___umodsi3_start:
; BB#0:
#0:	       cmp eq	r0, 0 -> c1
#1:	       cmp eq	r1, 0 -> c2
#2:	       ldi	0 -> r2
	;;
#0:	       comb	or c2, c1 -> c1
	;;
#0:	if  c1 br @	.BB25_7
	;;
.BB25_1:
#0:	       bbh	clz r0 -> r5
#1:	       bbh	clz r1 -> r4
#2:	       ldi	0 -> r2
	;;
#0:	       sub	r4, r5 -> r3
	;;
#0:	       cmpu gt	r3, 31 -> c1
	;;
#0:	if  c1 br @	.BB25_7
	;;
.BB25_2:
#0:	       cmpu eq	r3, 31 -> c1
#1:	       or	r0, 0 -> r2
	;;
#0:	if  c1 br @	.BB25_7
	;;
.BB25_3:
#0:	       ldi	31 -> r2
#1:	       add	r3, 1 -> r6
	;;
#0:	       brz eq	r6, .BB25_6
#1:	       sub	r2, r3 -> r2
#2:	       ldi	0 -> r3
	;;
#0:	       sl	r0, r2 -> r2
	;;
	       nop	0
	;;
.BB25_4:                                ; %.lr.ph.i
#0:	       sub	r5, 1 -> r3
#1:	       sr	r0, r6 -> r6
#2:	       sub	r1, 1 -> r5
	;;
#0:	       sub	r3, r4 -> r4
#1:	       ldi	0 -> r3
	;;
.BB25_5:                                ; =>This Inner Loop Header: Depth=1
#0:	       sr	r2, 31 -> r7
#1:	       sl	r6, 1 -> r6
#2:	       sl	r2, 1 -> r2
#3:	       add	r4, 1 -> r4
	;;
#0:	       or	r7, r6 -> r6
#1:	       or	r2, r3 -> r2
	;;
#0:	       sub	r5, r6 -> r7
	;;
#0:	       brz ne	r4, .BB25_5
#1:	       sra	r7, 31 -> r7
	;;
#0:	       and	r7, r1 -> r8
#1:	       and	r7, 1 -> r3
	;;
#0:	       sub	r6, r8 -> r6
	;;
.BB25_6:                                ; %._crit_edge.i
#0:	       sl	r2, 1 -> r2
	;;
#0:	       or	r2, r3 -> r2
	;;
.BB25_7:                                ; %__udivsi3.exit
#0:	       mul	r2, r1 -> $mul0.0
#1:	       jop	ret
	;;
#0:	       ldx	$mul0.0, 0 -> r1
	;;
#0:	       sub	r0, r1 -> r0
	;;
	       nop	0
	;;
	.align	4
___umodsi3_end:
.tmp25:
	.size	___umodsi3, .tmp25-___umodsi3

	.globl	___divsi3
	.type	___divsi3,@function
___divsi3:                              ; @__divsi3
	.funsz	___divsi3_end-___divsi3
___divsi3_start:
; BB#0:
#0:	       cmp eq	r0, 0 -> c1
#1:	       cmp eq	r1, 0 -> c2
#2:	       ldi	0 -> r3
	;;
#0:	       comb	or c2, c1 -> c1
	;;
#0:	if  c1 br @	.BB26_8
	;;
.BB26_1:
#0:	       sra	r1, 31 -> r2
#1:	       sra	r0, 31 -> r3
	;;
#0:	       xor	r2, r1 -> r4
#1:	       xor	r3, r0 -> r9
	;;
#0:	       sub	r9, r3 -> r5
#1:	       sub	r4, r2 -> r2
#2:	       ldi	0 -> r3
	;;
#0:	       bbh	clz r5 -> r8
#1:	       bbh	clz r2 -> r6
	;;
#0:	       sub	r6, r8 -> r4
	;;
#0:	       cmpu gt	r4, 31 -> c1
	;;
#0:	if  c1 br @	.BB26_8
	;;
.BB26_2:
#0:	       cmpu eq	r4, 31 -> c1
	;;
#0:	if  c1 br @	.BB26_7
	;;
.BB26_3:
#0:	       ldi	31 -> r3
#1:	       add	r4, 1 -> r7
	;;
#0:	       brz eq	r7, .BB26_6
#1:	       sub	r3, r4 -> r3
#2:	       ldi	0 -> r4
	;;
#0:	       sl	r5, r3 -> r3
	;;
	       nop	0
	;;
.BB26_4:                                ; %.lr.ph.i
#0:	       sub	r8, 1 -> r4
#1:	       sr	r5, r7 -> r7
	;;
#0:	       sub	r4, r6 -> r5
#1:	       sub	r2, 1 -> r6
#2:	       ldi	0 -> r4
	;;
.BB26_5:                                ; =>This Inner Loop Header: Depth=1
#0:	       sr	r3, 31 -> r8
#1:	       sl	r7, 1 -> r7
#2:	       sl	r3, 1 -> r3
#3:	       add	r5, 1 -> r5
	;;
#0:	       or	r8, r7 -> r7
#1:	       or	r3, r4 -> r3
	;;
#0:	       sub	r6, r7 -> r8
	;;
#0:	       brz ne	r5, .BB26_5
#1:	       sra	r8, 31 -> r8
	;;
#0:	       and	r8, r2 -> r9
#1:	       and	r8, 1 -> r4
	;;
#0:	       sub	r7, r9 -> r7
	;;
.BB26_6:                                ; %._crit_edge.i
#0:	       sl	r3, 1 -> r2
#1:	       br	.BB26_8
	;;
#0:	       or	r2, r4 -> r3
	;;
	       nop	0
	;;
.BB26_7:
#0:	       or	r5, 0 -> r3
	;;
.BB26_8:                                ; %__udivsi3.exit
#0:	       xor	r1, r0 -> r0
#1:	       jop	ret
	;;
#0:	       sra	r0, 31 -> r0
	;;
#0:	       xor	r3, r0 -> r3
	;;
#0:	       sub	r3, r0 -> r0
	;;
	.align	4
___divsi3_end:
.tmp26:
	.size	___divsi3, .tmp26-___divsi3

	.type	___udivmoddi4,@function
___udivmoddi4:                          ; @__udivmoddi4
	.funsz	___udivmoddi4_end-___udivmoddi4
___udivmoddi4_start:
; BB#0:
#0:	       wb.s	r15, 14
#1:	       addi	-56 -> r15
#2:	       ldx	$rb, 0 -> r4
	;;
#0:	       stm.s	r10, r15, 9
	;;
#0:	       stm.s	r11, r15, 8
#1:	       or	r3, 0 -> r11
	;;
#0:	       stm.s	r12, r15, 7
#1:	       or	r0, 0 -> r12
	;;
#0:	       stm.s	r13, r15, 6
#1:	       or	r1, 0 -> r13
	;;
#0:	       stm.s	r14, r15, 5
#1:	       ldx	$ro, 0 -> r14
	;;
#1:	       stm.s	r1.23, r15, 4
	;;
#0:	       brz eq	r13, .BB27_5
#1:	       or	r2, 0 -> r1.23
#2:	       ldm.f	r15, 56
	;;
#0:	       stm.s	r4, r15, 3
	;;
#0:	       stm.s	r14, r15, 2
#1:	       or	r31, 0 -> r14
	;;
.BB27_1:
#1:	       brz eq @	r1.23, .BB27_9
	;;
.BB27_2:
#0:	       brz eq @	r11, .BB27_18
	;;
.BB27_3:
#0:	       bbh	clz r13 -> r0
#1:	       bbh	clz r11 -> r1
#2:	       ldi	32 -> r3
	;;
#0:	       sub	r1, r0 -> r1
	;;
#0:	       cmpu lt	r1, r3 -> c1
	;;
#0:	if !c1 br @	.BB27_13
	;;
.BB27_4:
#0:	       ldi	31 -> r0
	;;
#0:	       sub	r0, r1 -> r3
#1:	       add	r1, 1 -> r0
#2:	       sub	r1, 31 -> r1
	;;
#0:	       sr	r12, r0 -> r5
#1:	       sra	r1, 31 -> r6
#2:	       sr	r13, r0 -> r2
#3:	       sl	r13, r3 -> r4
	;;
#0:	       br	.BB27_34
#1:	       and	r5, r6 -> r1
#2:	       and	r2, r6 -> r2
	;;
#0:	       or	r1, r4 -> r1
	;;
	       nop	0
	;;
.BB27_5:
#0:	       brz ne @	r11, .BB27_15
	;;
.BB27_6:
#0:	       brz eq @	r14, .BB27_8
	;;
.BB27_7:
#1:	       or	r1.23, 0 -> r1
#0:	       callg	___umodsi3
#2:	       or	r12, 0 -> r0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       stm.a	r0, r14, 0
	;;
#0:	       stm.a	0, r14, 1
	;;
.BB27_8:                                ; %._crit_edge88
#1:	       or	r1.23, 0 -> r1
#0:	       callg	___udivsi3
#2:	       or	r12, 0 -> r0
	;;
	       nop	0
	;;
	       nop	0
	;;
	       nop	0
	;;
#0:	       br @	.BB27_42
#1:	       ldi	0 -> r10
	;;
.BB27_9:
#0:	       brz eq @	r11, .BB27_20
	;;
.BB27_10:
#0:	       brz eq @	r12, .BB27_23
	;;
.BB27_11:
#0:	       sub	r11, 1 -> r0
	;;
#0:	       and	r0, r11 -> r1
	;;
#0:	       brz eq @	r1, .BB27_30
	;;
.BB27_12:
#0:	       bbh	clz r13 -> r0
#1:	       bbh	clz r11 -> r1
	;;
#0:	       sub	r1, r0 -> r1
	;;
#0:	       cmpu lt	r1, 31 -> c1
	;;
#0:	if  c1 br @	.BB27_33
	;;
.BB27_13:
#0:	       cmp eq	r14, 0 -> c3
#1:	       ldi	0 -> r0
#2:	       ldi	0 -> r10
	;;
#0:	if  c3 br @	.BB27_42
	;;
.BB27_14:
#0:	       stm.a	r12, r14, 0
#1:	       br	.BB27_17
	;;
#0:	       stm.a	r13, r14, 1
	;;
	       nop	0
	;;
.BB27_15:
#0:	       cmp eq	r14, 0 -> c3
#1:	       ldi	0 -> r0
#2:	       ldi	0 -> r10
	;;
#0:	if  c3 br @	.BB27_42
	;;
.BB27_16:
#0:	       stm.a	r12, r14, 0
	;;
#0:	       stm.a	0, r14, 1
	;;
.BB27_17:
#0:	       ldi	0 -> r0
#1:	       br @	.BB27_42
#2:	       ldi	0 -> r10
	;;
.BB27_18:
#1:	       sub	r1.23, 1 -> r0
	;;
#1:	       and	r0, r1.23 -> r1
	;;
#0:	       brz eq @	r1, .BB27_26
	;;
.BB27_19:
#1:	       bbh	clz r1.23 -> r1
#0:	       bbh	clz r13 -> r0
#2:	       ldi	32 -> r6
#3:	       ldi	31 -> r2
	;;
#0:	       addi	33 -> r1
#1:	       ldi	64 -> r3
	;;
#0:	       sub	r1, r0 -> r0
	;;
#0:	       or	r0, 0 -> r9
#1:	       or	r0, 0 -> r1
#2:	       sub	r6, r0 -> r6
#3:	       sub	r2, r0 -> r5
	;;
#0:	       addi	-33 -> r9
#1:	       addi	-32 -> r1
#2:	       sub	r3, r0 -> r3
#3:	       sl	r12, r6 -> r7
	;;
#0:	       sra	r9, 31 -> r9
#1:	       sl	r13, r3 -> r4
#2:	       sr	r12, r1 -> r2
#3:	       sra	r5, 31 -> r8
	;;
#0:	       sra	r6, 31 -> r5
#1:	       and	r7, r9 -> r7
#2:	       sr	r13, r1 -> r10
#3:	       sr	r12, r0 -> r9
	;;
#0:	       sl	r13, r6 -> r6
#1:	       or	r4, r2 -> r2
#2:	       and	r8, r10 -> r4
#3:	       sra	r1, 31 -> r10
	;;
#0:	       br	.BB27_35
#1:	       or	r6, r9 -> r8
#2:	       and	r2, r5 -> r2
#3:	       sl	r12, r3 -> r3
	;;
#0:	       and	r8, r10 -> r1
#1:	       sr	r13, r0 -> r8
#2:	       and	r3, r5 -> r13
	;;
#0:	       or	r4, r1 -> r1
#1:	       or	r2, r7 -> r4
#2:	       and	r10, r8 -> r2
	;;
.BB27_20:
#0:	       brz eq @	r14, .BB27_22
	;;
.BB27_21:
#0:	       stm.a	0, r14, 1
	;;
#0:	       stm.a	0, r14, 0
	;;
.BB27_22:
#0:	       ldi	0 -> r10
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
#0:	       br @	.BB27_42
	;;
.BB27_23:
#0:	       brz eq @	r14, .BB27_25
	;;
.BB27_24:
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
#0:	       stm.a	r0, r14, 1
	;;
#0:	       stm.a	0, r14, 0
	;;
.BB27_25:
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
#0:	       br @	.BB27_42
#1:	       ldi	0 -> r10
	;;
.BB27_26:
#0:	       brz eq @	r14, .BB27_28
	;;
.BB27_27:
#0:	       and	r0, r12 -> r0
	;;
#0:	       stm.a	r0, r14, 0
	;;
#0:	       stm.a	0, r14, 1
	;;
.BB27_28:
#1:	       cmp eq	r1.23, 1 -> c1
	;;
#0:	if  c1 br @	.BB27_43
	;;
.BB27_29:
#1:	       bbh	ctz r1.23 -> r1
#0:	       ldi	32 -> r2
	;;
#0:	       br	.BB27_42
#1:	       sub	r2, r1 -> r2
#2:	       sr	r12, r1 -> r0
#3:	       sr	r13, r1 -> r10
	;;
#0:	       sl	r13, r2 -> r2
	;;
#0:	       or	r2, r0 -> r0
	;;
.BB27_30:
#0:	       brz eq @	r14, .BB27_32
	;;
.BB27_31:
#0:	       stm.a	r12, r14, 0
#1:	       and	r0, r13 -> r0
	;;
#0:	       stm.a	r0, r14, 1
	;;
.BB27_32:
#0:	       bbh	ctz r11 -> r0
#1:	       br	.BB27_42
#2:	       ldi	0 -> r10
	;;
#0:	       sr	r13, r0 -> r0
	;;
	       nop	0
	;;
.BB27_33:
#0:	       ldi	31 -> r3
#1:	       add	r1, 1 -> r0
	;;
#0:	       sub	r3, r1 -> r3
#1:	       sr	r12, r0 -> r2
	;;
#0:	       sl	r13, r3 -> r1
	;;
#0:	       or	r1, r2 -> r1
#1:	       sr	r13, r0 -> r2
	;;
.BB27_34:
#0:	       sl	r12, r3 -> r4
#1:	       ldi	0 -> r13
	;;
.BB27_35:                               ; %.preheader
#0:	       ldi	0 -> r5
#1:	       brz eq @	r0, .BB27_39
#2:	       stm.s	r14, r15, 1
	;;
.BB27_36:                               ; %.lr.ph
#0:	       ldi	-1 -> r3
#1:	       sr	r1, 31 -> r5
#2:	       sl	r2, 1 -> r2
#3:	       sr	r13, 31 -> r6
	;;
#1:	       carr	r1.23, r3 -> r3
#0:	       sl	r4, 1 -> r7
#2:	       or	r5, r2 -> r12
#3:	       sr	r4, 31 -> r10
	;;
#0:	       add	r11, r3 -> r3
#2:	       or	r6, r7 -> r8
#1:	       sub	r1.23, 1 -> r7
#3:	       ldi	0 -> r5
	;;
#0:	       sub	r3, 1 -> r6
#1:	       ldi	-2 -> r9
	;;
.BB27_37:                               ; =>This Inner Loop Header: Depth=1
#0:	       sl	r1, 1 -> r2
#1:	       and	r12, r9 -> r4
#2:	       sr	r1, 31 -> r1
#3:	       sl	r13, 1 -> r14
	;;
#0:	       or	r10, r2 -> r3
#1:	       or	r4, r1 -> r1
#2:	       sr	r13, 31 -> r13
#3:	       sub	r0, 1 -> r0
	;;
#0:	       borr	r7, r3 -> r2
#1:	       sub	r6, r1 -> r4
	;;
#0:	       sub	r4, r2 -> r2
	;;
#0:	       sra	r2, 31 -> r10
	;;
#1:	       and	r10, r1.23 -> r4
#0:	       and	r10, r11 -> r12
	;;
#0:	       borr	r3, r4 -> r2
#1:	       sub	r1, r12 -> r1
	;;
#0:	       sub	r1, r2 -> r2
#1:	       sub	r3, r4 -> r1
#2:	       and	r8, r9 -> r4
#3:	       or	r14, r5 -> r3
	;;
#0:	       or	r4, r13 -> r4
#1:	       sr	r3, 31 -> r14
#2:	       sl	r2, 1 -> r5
#3:	       sr	r1, 31 -> r12
	;;
#0:	       sl	r4, 1 -> r13
#1:	       or	r12, r5 -> r12
#2:	       and	r10, 1 -> r5
#3:	       sr	r8, 31 -> r10
	;;
#0:	       brz ne	r0, .BB27_37
#1:	       or	r14, r13 -> r14
#2:	       or	r3, 0 -> r13
	;;
#0:	       or	r14, 0 -> r8
	;;
	       nop	0
	;;
.BB27_38:                               ; %._crit_edge
#0:	       ldi	0 -> r6
#1:	       br @	.BB27_40
	;;
.BB27_39:
#0:	       or	r5, 0 -> r6
#1:	       or	r13, 0 -> r3
	;;
.BB27_40:                               ; %._crit_edge
#0:	       add	r3, r3 -> r0
#1:	       ldm.s	r15, 4
#2:	       carr	r3, r3 -> r3
#3:	       add	r4, r4 -> r4
	;;
#0:	       add	r4, r3 -> r3
#1:	       or	r0, r5 -> r0
	;;
#0:	       or	r31, 0 -> r7
#1:	       or	r3, r6 -> r10
	;;
#0:	       brz eq @	r7, .BB27_42
	;;
.BB27_41:
#0:	       stm.a	r1, r7, 0
	;;
#0:	       stm.a	r2, r7, 1
	;;
.BB27_42:
#0:	       ldm.s	r15, 8
#1:	       or	r10, 0 -> r1
	;;
#0:	       stx	r31 -> $ro
#1:	       ldm.s	r15, 12
	;;
#0:	       stx	r31 -> $rb
#1:	       ldm.s	r15, 16
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
.BB27_43:
#0:	       or	r12, 0 -> r0
#1:	       br @	.BB27_42
#2:	       or	r13, 0 -> r10
	;;
	.align	4
___udivmoddi4_end:
.tmp27:
	.size	___udivmoddi4, .tmp27-___udivmoddi4

	.type	._.str,@object          ; @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
._.str:
	.ascii	 "Hello, World!\000"
	.size	._.str, 14

	.type	._.str9,@object         ; @.str9
._.str9:
	.ascii	 "\n\000"
	.size	._.str9, 2

	.type	._.str14,@object        ; @.str14
._.str14:
	.ascii	 "C\000"
	.size	._.str14, 2

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
	.long	._.str14
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

	.type	___malloc_av_,@object   ; @__malloc_av_
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
	.type	_errno.b,@object        ; @errno.b
	.local	_errno.b
	.comm	_errno.b,1,4
	.type	__sbrk.heap_end,@object ; @_sbrk.heap_end
	.local	__sbrk.heap_end
	.comm	__sbrk.heap_end,4,4
