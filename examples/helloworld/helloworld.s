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
#0:	       wb.s	r15, 4
#2:	       ldiu	16 -> r0
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
#0:	       callg	_puts
	;;
	       nop	3
	;;
#0:	       or	r14, 0 -> r15
#1:	       ldi	0 -> r0
	;;
#0:	       ldm.s	r15, 8
	;;
#3:	       ldx	$mem, 0 -> r3.31
#0:	       ldm.s	r15, 4
	;;
#3:	       stx	r3.31 -> $ro
	;;
#0:	       ldx	$mem, 0 -> r0.31
#1:	       ldm.s	r15, 0
#2:	       s2add	r15, 4 -> r15
	;;
#0:	       stx	r0.31 -> $rb
	;;
#0:	       ret
#1:	       ldx	$mem, 0 -> r14
	;;
	       nop	3
	;;
	.align	4
_main_end:

	.align	4
_puts:                                  ; @puts
	.size	_puts_end-_puts
_puts_start:
; BB#0:                                 ; %entry
#0:	       wb.s	r15, 13         ; puts.c:81[ puts.c:103 ]
#2:	       ldiu	52 -> r0        ; puts.c:81[ puts.c:103 ]
#1:	       ldx	$rb, 0 -> r1.31 ; puts.c:81[ puts.c:103 ]
	;;
#0:	       sub	r15, r0 -> r15  ; puts.c:81[ puts.c:103 ]
#2:	       ldx	$ro, 0 -> r2.31 ; puts.c:81[ puts.c:103 ]
	;;
#0:	       stm.s	r14, r15, 0     ; puts.c:81[ puts.c:103 ]
#1:	       or	r15, 0 -> r14   ; puts.c:81[ puts.c:103 ]
	;;
#1:	       stm.s	r1.31, r15, 1   ; puts.c:81[ puts.c:103 ]
	;;
#2:	       stm.s	r2.31, r15, 2   ; puts.c:81[ puts.c:103 ]
	;;
#0:	       callg	_strlen         ; puts.c:81[ puts.c:103 ]
	;;                              ; puts.c:81[ puts.c:103 ]
	       nop	3               ; puts.c:81[ puts.c:103 ]
	;;
#1:	       add	r14, 20 -> r1
#0:	       ldga	._.str1 -> r0.16 ; puts.c:87[ puts.c:103 ]
#2:	       ldga	._.str -> r2    ; puts.c:85[ puts.c:103 ]
#3:	       s2add	r14, 8 -> r5
	;;
#0:	       stm.a	1, r1, 3        ; puts.c:88[ puts.c:103 ]
#1:	       add	r5, 4 -> r3
#2:	       add	r0, 1 -> r4     ; puts.c:89[ puts.c:103 ]
	;;
#0:	       stm.a	r0.16, r1, 2    ; puts.c:87[ puts.c:103 ]
	;;
#0:	       stm.a	r2, r1, 0       ; puts.c:85[ puts.c:103 ]
	;;
#0:	       stm.a	r0, r1, 1       ; puts.c:86[ puts.c:103 ]
	;;
#0:	       stm.a	2, r3, 1        ; puts.c:91[ puts.c:103 ]
	;;
#0:	       stm.a	r1, r3, 0       ; puts.c:90[ puts.c:103 ]
	;;
#0:	       stm.a	r4, r3, 2       ; puts.c:89[ puts.c:103 ]
	;;
#0:	       ldmg.d	_impure_data+8  ; puts.c:93[ puts.c:103 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; puts.c:93[ puts.c:103 ]
	;;
#0:	       ldm.f	r0, 12          ; puts.c:93[ puts.c:103 ]
#1:	       add	r0, 12 -> r1    ; puts.c:93[ puts.c:103 ]
	;;
#0:	       ldx	$memhu, r1 -> r1 ; puts.c:93[ puts.c:103 ]
	;;
#0:	       btest	r1, 13 -> c1    ; puts.c:93[ puts.c:103 ]
	;;
#0:	if  c1 br	.BB1_2
	;;
	       nop	2
	;;
; BB#1:                                 ; %bb.i
#0:	       ldga	8192 -> r2
	;;
#0:	       or	r1, r2 -> r1    ; puts.c:93[ puts.c:103 ]
	;;
#0:	       stmh.a	r1, r0, 6       ; puts.c:93[ puts.c:103 ]
#1:	       ldiu	2047 -> r1
	;;
#0:	       ldim	2043 -> r1
	;;
#0:	       ldmg.d	_impure_data+8  ; puts.c:93[ puts.c:103 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; puts.c:93[ puts.c:103 ]
	;;
#0:	       ldm.f	r0, 100         ; puts.c:93[ puts.c:103 ]
	;;
#0:	       ldx	$mem, 0 -> r2   ; puts.c:93[ puts.c:103 ]
	;;
#0:	       and	r2, r1 -> r1    ; puts.c:93[ puts.c:103 ]
	;;
#0:	       stm.a	r1, r0, 25      ; puts.c:93[ puts.c:103 ]
	;;
#0:	       ldmg.d	_impure_data+8
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
.BB1_2:                                 ; %_puts_r.exit
#0:	       s2add	r14, 8 -> r2
#1:	       callg	___sfvwrite_r   ; puts.c:94[ puts.c:103 ]
	;;
#0:	       add	r2, 4 -> r1
	;;                              ; puts.c:94[ puts.c:103 ]
	       nop	2               ; puts.c:94[ puts.c:103 ]
	;;
#0:	       or	r14, 0 -> r15
	;;
#0:	       ldm.s	r15, 8
	;;
#3:	       ldx	$mem, 0 -> r3.31
#0:	       ldm.s	r15, 4
	;;
#3:	       stx	r3.31 -> $ro
	;;
#0:	       ldx	$mem, 0 -> r0.31
#1:	       ldm.s	r15, 0
#2:	       s2add	r15, 13 -> r15
	;;
#0:	       stx	r0.31 -> $rb
	;;
#0:	       ret
#1:	       ldx	$mem, 0 -> r14
	;;
	       nop	3
	;;
	.align	4
_puts_end:

	.align	4
___sfvwrite_r:                          ; @__sfvwrite_r
	.size	___sfvwrite_r_end-___sfvwrite_r
___sfvwrite_r_start:
; BB#0:                                 ; %entry
#0:	       wb.s	r15, 15
#2:	       ldiu	60 -> r2
#1:	       ldx	$rb, 0 -> r1.31
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
#0:	       stm.s	r10, r14, 14
#1:	       or	r0, 0 -> r10
	;;
#0:	       stm.s	r11, r14, 13
	;;
#0:	       stm.s	r12, r14, 12
	;;
#0:	       stm.s	r13, r14, 11
	;;
#0:	       stm.s	r1, r14, 7
	;;
#0:	       ldm.f	r1, 8           ; fvwrite.c:59
	;;
#0:	       ldx	$mem, 0 -> r0   ; fvwrite.c:59
	;;
#0:	       cmpeq	r0, 0 -> c1     ; fvwrite.c:59
	;;
#0:	if  c1 br	.BB2_56
	;;
	       nop	2
	;;
; BB#1:                                 ; %bb1
#0:	       add	r10, 12 -> r0   ; fvwrite.c:63
	;;
#0:	       stm.s	r0, r14, 6      ; fvwrite.c:63
	;;
#0:	       ldm.f	r10, 12         ; fvwrite.c:63
	;;
#0:	       ldx	$memhu, r0 -> r1 ; fvwrite.c:63
	;;
#0:	       btest	r1, 3 -> c1     ; fvwrite.c:63
	;;
#0:	if !c1 br	.BB2_3
	;;
	       nop	2
	;;
; BB#2:                                 ; %bb2
#0:	       ldm.f	r10, 16         ; fvwrite.c:63
	;;
#0:	       ldx	$mem, 0 -> r0   ; fvwrite.c:63
	;;
#0:	       cmpeq	r0, 0 -> c1     ; fvwrite.c:63
	;;
#0:	if !c1 br	.BB2_5
	;;
	       nop	2
	;;
.BB2_3:                                 ; %bb3
#0:	       or	r10, 0 -> r0    ; fvwrite.c:63
#1:	       callg	___swsetup_r    ; fvwrite.c:63
	;;                              ; fvwrite.c:63
	       nop	3               ; fvwrite.c:63
	;;
#0:	       ldm.f	r10, 12
#1:	       ldga	___mem_emergency -> r1
#2:	       cmpne	r0, 0 -> c1     ; fvwrite.c:63
	;;
#1:	       ldx	$mem, 0 -> r1.31
	;;
#0:	if !c1 br	.BB2_5
#1:	       stm.a	r1.31, r1, 0
	;;
#0:	       ldm.s	r14, 24
	;;
#0:	       ldx	$mem, 0 -> r1
#1:	       ldmg.d	___mem_emergency
	;;
#0:	       ldx	$memhu, r1 -> r1
	;;
; BB#4:                                 ; %bb4
#0:	       ldi	64 -> r0
#1:	       br	.BB2_57
	;;
#0:	       or	r1, r0 -> r1    ; fvwrite.c:65
#1:	       ldga	_impure_data -> r0 ; fvwrite.c:66
	;;
#0:	       stmh.a	r1, r10, 6      ; fvwrite.c:65
	;;
#0:	       stm.a	9, r0, 0        ; fvwrite.c:66
#1:	       ldi	-1 -> r0
	;;
.BB2_5:                                 ; %bb5
#0:	       ldm.s	r14, 28         ; fvwrite.c:70
#1:	       btest	r1, 1 -> c1     ; fvwrite.c:93
	;;
#0:	if !c1 br	.BB2_11         ; fvwrite.c:93
#1:	       ldx	$mem, 0 -> r0   ; fvwrite.c:70
	;;
#0:	       ldm.f	r0, 0           ; fvwrite.c:70
	;;
#0:	       ldx	$mem, 0 -> r0   ; fvwrite.c:70
	;;                              ; fvwrite.c:93
	       nop	0               ; fvwrite.c:93
	;;
; BB#6:                                 ; %bb7.preheader
#0:	       ldi	0 -> r11
#1:	       br	.BB2_8
#2:	       add	r0, 4 -> r0
#3:	       ldiu	1024 -> r12
	;;
#0:	       stm.s	r0, r14, 10
#1:	       or	r11, 0 -> r13
	;;
	       nop	1
	;;
.BB2_7:                                 ; %bb6
                                        ;   in Loop: Header=BB2_8 Depth=1
#0:	       ldm.s	r14, 40         ; fvwrite.c:100
	;;
#0:	       ldx	$mem, 0 -> r0   ; fvwrite.c:100
	;;
#0:	       ldm.f	r0, -4          ; fvwrite.c:100
	;;
#0:	       ldx	$mem, 0 -> r11  ; fvwrite.c:100
#1:	       ldm.f	r0, 0           ; fvwrite.c:100
#2:	       add	r0, 8 -> r0
	;;
#0:	       ldx	$mem, 0 -> r13  ; fvwrite.c:100
#1:	       stm.s	r0, r14, 10
	;;
.BB2_8:                                 ; %bb7
                                        ; =>This Inner Loop Header: Depth=1
#0:	       cmpeq	r13, 0 -> c1    ; fvwrite.c:100
	;;
#0:	if  c1 br	.BB2_7          ; fvwrite.c:100
	;;                              ; fvwrite.c:100
	       nop	2               ; fvwrite.c:100
	;;
; BB#9:                                 ; %bb8
                                        ;   in Loop: Header=BB2_8 Depth=1
#0:	       ldm.f	r10, 36         ; fvwrite.c:101
#1:	       cmpult	r12, r13 -> c1
#2:	       or	r13, 0 -> r3    ; fvwrite.c:101
#3:	       ldga	_impure_data -> r0 ; fvwrite.c:101
	;;
#0:	if  c1 or	r12, 0 -> r3    ; fvwrite.c:101
#1:	       or	r11, 0 -> r2    ; fvwrite.c:101
	;;
#0:	       ldx	$mem, 0 -> r4   ; fvwrite.c:101
#1:	       ldm.f	r10, 28         ; fvwrite.c:101
	;;
#0:	       ldx	$mem, 0 -> r1   ; fvwrite.c:101
	;;
#0:	       call	r4              ; fvwrite.c:101
	;;                              ; fvwrite.c:101
	       nop	3               ; fvwrite.c:101
	;;
#0:	       cmplt	r0, 1 -> c1
	;;
#0:	if  c1 br	.BB2_22
	;;
	       nop	2
	;;
; BB#10:                                ; %bb10
                                        ;   in Loop: Header=BB2_8 Depth=1
#0:	       ldm.s	r14, 28         ; fvwrite.c:107
#1:	       add	r11, r0 -> r11  ; fvwrite.c:104
#2:	       sub	r13, r0 -> r13  ; fvwrite.c:105
	;;
#0:	       ldx	$mem, 0 -> r1   ; fvwrite.c:107
	;;
#0:	       ldm.f	r1, 8           ; fvwrite.c:107
	;;
#0:	       ldx	$mem, 0 -> r2   ; fvwrite.c:107
	;;
#0:	       cmpeq	r2, r0 -> c1
#1:	       sub	r2, r0 -> r3    ; fvwrite.c:107
	;;
#0:	if !c1 br	.BB2_8
#1:	       stm.a	r3, r1, 2       ; fvwrite.c:107
	;;
	       nop	2
	;;
#0:	       br	.BB2_56
	;;
	       nop	2
	;;
.BB2_11:                                ; %bb11
#0:	       mask	r1, 4 -> r1
	;;
#0:	       cmpne	r1, 0 -> c1     ; fvwrite.c:109
	;;
#0:	if  c1 br	.BB2_13         ; fvwrite.c:109
	;;                              ; fvwrite.c:109
	       nop	2               ; fvwrite.c:109
	;;
; BB#12:                                ; %bb13.preheader
#0:	       ldi	0 -> r1
#1:	       br	.BB2_15
#2:	       add	r0, 4 -> r0
	;;
#0:	       stm.s	r1, r14, 10
#1:	       or	r1, 0 -> r11
	;;
#0:	       stm.s	r0, r14, 5
	;;
	       nop	0
	;;
.BB2_13:                                ; %bb38.preheader
#0:	       add	r0, 4 -> r11
	;;
#0:	       br	.BB2_38
#1:	       stm.s	r11, r14, 4
#2:	       ldi	0 -> r11
	;;
#0:	       stm.s	r11, r14, 10
	;;
#0:	       stm.s	r11, r14, 9
	;;
#0:	       stm.s	r11, r14, 5
	;;
.BB2_14:                                ; %bb12
                                        ;   in Loop: Header=BB2_15 Depth=1
#0:	       ldm.s	r14, 20         ; fvwrite.c:126
	;;
#0:	       ldx	$mem, 0 -> r0   ; fvwrite.c:126
	;;
#0:	       ldm.f	r0, -4          ; fvwrite.c:126
	;;
#0:	       ldx	$mem, 0 -> r11  ; fvwrite.c:126
	;;
#0:	       stm.s	r11, r14, 10    ; fvwrite.c:126
	;;
#0:	       ldm.f	r0, 0           ; fvwrite.c:126
#1:	       add	r0, 8 -> r0
	;;
#0:	       ldx	$mem, 0 -> r11  ; fvwrite.c:126
#1:	       stm.s	r0, r14, 5
	;;
.BB2_15:                                ; %bb13
                                        ; =>This Inner Loop Header: Depth=1
#0:	       cmpeq	r11, 0 -> c1    ; fvwrite.c:126
	;;
#0:	if  c1 br	.BB2_14         ; fvwrite.c:126
	;;                              ; fvwrite.c:126
	       nop	2               ; fvwrite.c:126
	;;
; BB#16:                                ; %bb14
                                        ;   in Loop: Header=BB2_15 Depth=1
#0:	       ldm.f	r10, 12
#1:	       ldga	___mem_emergency -> r0
	;;
#2:	       ldx	$mem, 0 -> r2.31
	;;
#2:	       stm.a	r2.31, r0, 0
	;;
#0:	       ldm.s	r14, 24
	;;
#0:	       ldx	$mem, 0 -> r0
#1:	       ldmg.d	___mem_emergency
	;;
#0:	       ldx	$memhu, r0 -> r0
	;;
#0:	       btest	r0, 9 -> c1     ; fvwrite.c:128
#1:	       stm.s	r0, r14, 8      ; fvwrite.c:127
	;;
#0:	if !c1 br	.BB2_30         ; fvwrite.c:128
#1:	       ldm.f	r10, 8          ; fvwrite.c:127
	;;
#0:	       ldx	$mem, 0 -> r12  ; fvwrite.c:127
	;;                              ; fvwrite.c:128
	       nop	1               ; fvwrite.c:128
	;;
; BB#17:                                ; %bb15
                                        ;   in Loop: Header=BB2_15 Depth=1
#0:	       cmpule	r12, r11 -> c1  ; fvwrite.c:130
	;;
#0:	if !c1 br	.BB2_28
	;;
	       nop	2
	;;
; BB#18:                                ; %bb16
                                        ;   in Loop: Header=BB2_15 Depth=1
#0:	       ldm.s	r14, 32         ; fvwrite.c:130
#1:	       ldiu	1152 -> r0
	;;
#0:	       ldx	$mem, 0 -> r1   ; fvwrite.c:130
	;;
#0:	       and	r1, r0 -> r0    ; fvwrite.c:130
	;;
#0:	       cmpeq	r0, 0 -> c1     ; fvwrite.c:130
	;;
#0:	if  c1 br	.BB2_28
	;;
	       nop	2
	;;
; BB#19:                                ; %bb17
                                        ;   in Loop: Header=BB2_15 Depth=1
#0:	       ldm.f	r10, 20         ; fvwrite.c:141
	;;
#0:	       ldx	$mem, 0 -> r12  ; fvwrite.c:141
#1:	       ldm.f	r10, 16         ; fvwrite.c:133
	;;
#0:	       mul	r12, 3 -> $mul0 ; fvwrite.c:141
	;;
#0:	       ldx	$mem, 0 -> r0   ; fvwrite.c:133
#1:	       ldm.f	r10, 0          ; fvwrite.c:133
	;;
#0:	       ldx	$mem, 0 -> r1   ; fvwrite.c:133
	;;
#1:	       sub	r1, r0 -> r12   ; fvwrite.c:133
#0:	       ldx	$mul0, 0 -> r1  ; fvwrite.c:141
	;;
#0:	       sr	r1, 31 -> r2    ; fvwrite.c:141
#1:	       stm.s	r12, r14, 9     ; fvwrite.c:141
#2:	       add	r11, r12 -> r12 ; fvwrite.c:142
	;;
#0:	       add	r1, r2 -> r1    ; fvwrite.c:141
#1:	       add	r12, 1 -> r12   ; fvwrite.c:142
#2:	       ldm.s	r14, 32         ; fvwrite.c:144
	;;
#0:	       sra	r1, 1 -> r13    ; fvwrite.c:141
	;;
#0:	       cmpult	r13, r12 -> c1  ; fvwrite.c:142
	;;
#0:	if  c1 or	r12, 0 -> r13
#1:	       ldx	$mem, 0 -> r12  ; fvwrite.c:144
	;;
#0:	       btest	r12, 10 -> c1   ; fvwrite.c:144
	;;
#0:	if !c1 br	.BB2_23         ; fvwrite.c:144
	;;                              ; fvwrite.c:144
	       nop	2               ; fvwrite.c:144
	;;
; BB#20:                                ; %bb20
                                        ;   in Loop: Header=BB2_15 Depth=1
#0:	       or	r13, 0 -> r0    ; fvwrite.c:147
#1:	       callg	__malloc_r      ; fvwrite.c:147
	;;                              ; fvwrite.c:147
	       nop	3               ; fvwrite.c:147
	;;
#0:	       cmpne	r0, 0 -> c1     ; fvwrite.c:148
	;;
#0:	if  c1 br	.BB2_26         ; fvwrite.c:148
	;;                              ; fvwrite.c:148
	       nop	2               ; fvwrite.c:148
	;;
.BB2_21:                                ; %bb21
#0:	       ldga	_impure_data -> r0 ; fvwrite.c:150
	;;
#0:	       stm.a	12, r0, 0       ; fvwrite.c:150
	;;
.BB2_22:                                ; %err
#0:	       ldm.f	r10, 12         ; fvwrite.c:269
#1:	       ldga	___mem_emergency -> r0 ; fvwrite.c:269
#2:	       ldi	64 -> r1
#3:	       or	r14, 0 -> r15   ; fvwrite.c:270
	;;
#3:	       ldx	$mem, 0 -> r3.31 ; fvwrite.c:269
	;;
#3:	       stm.a	r3.31, r0, 0    ; fvwrite.c:269
	;;
#0:	       ldm.s	r14, 24         ; fvwrite.c:269
	;;
#0:	       ldx	$mem, 0 -> r0   ; fvwrite.c:269
#1:	       ldmg.d	___mem_emergency ; fvwrite.c:269
	;;
#0:	       ldx	$memhu, r0 -> r0 ; fvwrite.c:269
	;;
#0:	       or	r0, r1 -> r0    ; fvwrite.c:269
	;;
#0:	       stmh.a	r0, r10, 6      ; fvwrite.c:269
#1:	       ldi	-1 -> r0
	;;
#0:	       ldm.s	r14, 44         ; fvwrite.c:270
	;;
#0:	       ldx	$mem, 0 -> r13  ; fvwrite.c:270
#1:	       ldm.s	r14, 48         ; fvwrite.c:270
	;;
#0:	       ldx	$mem, 0 -> r12  ; fvwrite.c:270
#1:	       ldm.s	r14, 52         ; fvwrite.c:270
	;;
#0:	       ldx	$mem, 0 -> r11  ; fvwrite.c:270
#1:	       ldm.s	r14, 56         ; fvwrite.c:270
	;;
#0:	       ldx	$mem, 0 -> r10  ; fvwrite.c:270
#1:	       ldm.s	r15, 8          ; fvwrite.c:270
	;;
#0:	       br	.BB2_58
#1:	       ldx	$mem, 0 -> r1.31 ; fvwrite.c:270
#2:	       ldm.s	r15, 4          ; fvwrite.c:270
	;;
#1:	       stx	r1.31 -> $ro    ; fvwrite.c:270
	;;
#2:	       ldx	$mem, 0 -> r2.31 ; fvwrite.c:270
	;;
#2:	       stx	r2.31 -> $rb    ; fvwrite.c:270
	;;
.BB2_23:                                ; %bb23
                                        ;   in Loop: Header=BB2_15 Depth=1
#0:	       or	r13, 0 -> r1    ; fvwrite.c:158
#1:	       callg	__realloc_r     ; fvwrite.c:158
	;;                              ; fvwrite.c:158
	       nop	3               ; fvwrite.c:158
	;;
#0:	       cmpeq	r0, 0 -> c1     ; fvwrite.c:160
	;;
#0:	if  c1 br	.BB2_25         ; fvwrite.c:160
	;;                              ; fvwrite.c:160
	       nop	2               ; fvwrite.c:160
	;;
; BB#24:                                ; %bb23.bb25_crit_edge
                                        ;   in Loop: Header=BB2_15 Depth=1
#0:	       or	r0, 0 -> r12
#1:	       br	.BB2_27
	;;
	       nop	2
	;;
.BB2_25:                                ; %bb24
#0:	       ldm.f	r10, 16         ; fvwrite.c:163
#1:	       ldga	_impure_data -> r0 ; fvwrite.c:165
	;;
#0:	       callg	__free_r        ; fvwrite.c:163
#1:	       ldx	$mem, 0 -> r1   ; fvwrite.c:163
	;;                              ; fvwrite.c:163
	       nop	3               ; fvwrite.c:163
	;;
#0:	       br	.BB2_21
	;;
	       nop	2
	;;
.BB2_26:                                ; %bb22
                                        ;   in Loop: Header=BB2_15 Depth=1
#0:	       ldm.f	r10, 16         ; fvwrite.c:153
#1:	       or	r0, 0 -> r12    ; fvwrite.c:147
	;;
#0:	       ldx	$mem, 0 -> r1   ; fvwrite.c:153
#1:	       ldm.s	r14, 36         ; fvwrite.c:153
	;;
#0:	       callg	_memcpy         ; fvwrite.c:153
#1:	       ldx	$mem, 0 -> r2   ; fvwrite.c:153
	;;                              ; fvwrite.c:153
	       nop	3               ; fvwrite.c:153
	;;
#0:	       ldm.f	r10, 12         ; fvwrite.c:154
#1:	       ldga	___mem_emergency -> r0 ; fvwrite.c:154
#2:	       ldiu	895 -> r1
	;;
#0:	       ldim	31 -> r1
	;;
#0:	       ldx	$mem, 0 -> r0.31 ; fvwrite.c:154
	;;
#0:	       stm.a	r0.31, r0, 0    ; fvwrite.c:154
	;;
#0:	       ldm.s	r14, 24         ; fvwrite.c:154
	;;
#0:	       ldx	$mem, 0 -> r0   ; fvwrite.c:154
#1:	       ldmg.d	___mem_emergency ; fvwrite.c:154
	;;
#0:	       ldx	$memhu, r0 -> r0 ; fvwrite.c:154
	;;
#0:	       and	r0, r1 -> r0    ; fvwrite.c:154
#1:	       ldi	128 -> r1
	;;
#0:	       or	r0, r1 -> r0    ; fvwrite.c:154
	;;
#0:	       stmh.a	r0, r10, 6      ; fvwrite.c:154
	;;
.BB2_27:                                ; %bb25
                                        ;   in Loop: Header=BB2_15 Depth=1
#0:	       ldm.s	r14, 36         ; fvwrite.c:173
	;;
#0:	       ldx	$mem, 0 -> r0   ; fvwrite.c:173
	;;
#0:	       sub	r13, r0 -> r1   ; fvwrite.c:173
#1:	       add	r12, r0 -> r0   ; fvwrite.c:170
	;;
#0:	       stm.a	r1, r10, 2      ; fvwrite.c:173
	;;
#0:	       stm.a	r13, r10, 5     ; fvwrite.c:171
	;;
#0:	       stm.a	r12, r10, 4     ; fvwrite.c:169
#1:	       or	r11, 0 -> r12
	;;
#0:	       stm.a	r0, r10, 0      ; fvwrite.c:170
	;;
.BB2_28:                                ; %bb26
                                        ;   in Loop: Header=BB2_15 Depth=1
#0:	       ldm.f	r10, 0          ; fvwrite.c:177
#1:	       cmpult	r11, r12 -> c1  ; fvwrite.c:175
	;;
#0:	if  c1 or	r11, 0 -> r12
	;;
#0:	       ldx	$mem, 0 -> r0   ; fvwrite.c:177
#1:	       ldm.s	r14, 40         ; fvwrite.c:177
#2:	       or	r12, 0 -> r2    ; fvwrite.c:177
	;;
#0:	       callg	_memmove        ; fvwrite.c:177
#1:	       ldx	$mem, 0 -> r1   ; fvwrite.c:177
	;;                              ; fvwrite.c:177
	       nop	3               ; fvwrite.c:177
	;;
#0:	       ldm.f	r10, 8          ; fvwrite.c:178
	;;
#0:	       br	.BB2_35
#1:	       ldx	$mem, 0 -> r0   ; fvwrite.c:178
#2:	       ldm.f	r10, 0          ; fvwrite.c:179
	;;
#0:	       sub	r0, r12 -> r0   ; fvwrite.c:178
	;;
#0:	       ldx	$mem, 0 -> r1   ; fvwrite.c:179
#1:	       stm.a	r0, r10, 2      ; fvwrite.c:178
	;;
#0:	       add	r1, r12 -> r12  ; fvwrite.c:179
	;;
.BB2_29:                                ; %bb31
                                        ;   in Loop: Header=BB2_15 Depth=1
#0:	       ldm.s	r14, 40         ; fvwrite.c:185
#1:	       or	r12, 0 -> r2    ; fvwrite.c:185
	;;
#0:	       callg	_memmove        ; fvwrite.c:185
#1:	       ldx	$mem, 0 -> r1   ; fvwrite.c:185
	;;                              ; fvwrite.c:185
	       nop	3               ; fvwrite.c:185
	;;
#0:	       ldm.f	r10, 0          ; fvwrite.c:187
#1:	       or	r10, 0 -> r1    ; fvwrite.c:188
	;;
#0:	       callg	__fflush_r      ; fvwrite.c:188
#1:	       ldx	$mem, 0 -> r0   ; fvwrite.c:187
	;;
#0:	       add	r0, r12 -> r0   ; fvwrite.c:187
	;;
#0:	       stm.a	r0, r10, 0      ; fvwrite.c:187
#1:	       ldga	_impure_data -> r0 ; fvwrite.c:188
	;;                              ; fvwrite.c:188
	       nop	1               ; fvwrite.c:188
	;;
#0:	       cmpne	r0, 0 -> c1     ; fvwrite.c:188
	;;
#0:	if  c1 br	.BB2_22
	;;
	       nop	2
	;;
#0:	       br	.BB2_36
	;;
	       nop	2
	;;
.BB2_30:                                ; %bb29
                                        ;   in Loop: Header=BB2_15 Depth=1
#0:	       ldm.f	r10, 0          ; fvwrite.c:182
	;;
#0:	       ldx	$mem, 0 -> r0   ; fvwrite.c:182
#1:	       ldm.f	r10, 16         ; fvwrite.c:182
	;;
#0:	       ldx	$mem, 0 -> r1   ; fvwrite.c:182
	;;
#0:	       cmpule	r0, r1 -> c1    ; fvwrite.c:182
	;;
#0:	if !c1 cmpule	r11, r12 -> c1
	;;
#0:	if !c1 br	.BB2_29
	;;
	       nop	2
	;;
; BB#31:                                ; %bb32
                                        ;   in Loop: Header=BB2_15 Depth=1
#0:	       ldm.f	r10, 20         ; fvwrite.c:191
	;;
#0:	       ldx	$mem, 0 -> r3   ; fvwrite.c:191
	;;
#0:	       cmpult	r11, r3 -> c1   ; fvwrite.c:191
	;;
#0:	if  c1 br	.BB2_34         ; fvwrite.c:191
	;;                              ; fvwrite.c:191
	       nop	2               ; fvwrite.c:191
	;;
; BB#32:                                ; %bb33
                                        ;   in Loop: Header=BB2_15 Depth=1
#0:	       ldm.f	r10, 36         ; fvwrite.c:194
#1:	       ldga	_impure_data -> r0 ; fvwrite.c:188
	;;
#0:	       ldx	$mem, 0 -> r12  ; fvwrite.c:194
#1:	       ldm.f	r10, 28         ; fvwrite.c:194
	;;
#0:	       ldx	$mem, 0 -> r1   ; fvwrite.c:194
#1:	       ldm.s	r14, 40         ; fvwrite.c:194
	;;
#0:	       ldx	$mem, 0 -> r2   ; fvwrite.c:194
	;;
#0:	       call	r12             ; fvwrite.c:194
	;;                              ; fvwrite.c:194
	       nop	3               ; fvwrite.c:194
	;;
#0:	       cmplt	r0, 1 -> c1
	;;
#0:	if  c1 br	.BB2_22
	;;
	       nop	2
	;;
; BB#33:                                ; %bb33.bb35_crit_edge
                                        ;   in Loop: Header=BB2_15 Depth=1
#0:	       or	r0, 0 -> r12
#1:	       br	.BB2_36
	;;
	       nop	2
	;;
.BB2_34:                                ; %bb34
                                        ;   in Loop: Header=BB2_15 Depth=1
#0:	       ldm.s	r14, 40         ; fvwrite.c:202
#1:	       or	r11, 0 -> r2    ; fvwrite.c:202
	;;
#0:	       callg	_memmove        ; fvwrite.c:202
#1:	       ldx	$mem, 0 -> r1   ; fvwrite.c:202
	;;                              ; fvwrite.c:202
	       nop	3               ; fvwrite.c:202
	;;
#0:	       ldm.f	r10, 8          ; fvwrite.c:203
	;;
#0:	       ldx	$mem, 0 -> r12  ; fvwrite.c:203
#1:	       ldm.f	r10, 0          ; fvwrite.c:204
	;;
#0:	       sub	r12, r11 -> r12 ; fvwrite.c:203
	;;
#0:	       ldx	$mem, 0 -> r0   ; fvwrite.c:204
#1:	       stm.a	r12, r10, 2     ; fvwrite.c:203
	;;
#0:	       add	r0, r11 -> r12  ; fvwrite.c:204
	;;
.BB2_35:                                ; %bb34
                                        ;   in Loop: Header=BB2_15 Depth=1
#0:	       stm.a	r12, r10, 0     ; fvwrite.c:204
#1:	       or	r11, 0 -> r12
	;;
.BB2_36:                                ; %bb35
                                        ;   in Loop: Header=BB2_15 Depth=1
#0:	       ldm.s	r14, 28         ; fvwrite.c:209
#1:	       sub	r11, r12 -> r11 ; fvwrite.c:207
	;;
#0:	       ldx	$mem, 0 -> r0   ; fvwrite.c:209
	;;
#0:	       ldm.f	r0, 8           ; fvwrite.c:209
	;;
#0:	       ldx	$mem, 0 -> r1   ; fvwrite.c:209
#1:	       ldm.s	r14, 40         ; fvwrite.c:206
	;;
#0:	       cmpeq	r1, r12 -> c1
	;;
#0:	if !c1 br	.BB2_15
#1:	       ldx	$mem, 0 -> r2   ; fvwrite.c:206
	;;
#0:	       add	r2, r12 -> r2   ; fvwrite.c:206
	;;
#0:	       stm.s	r2, r14, 10     ; fvwrite.c:207
#1:	       sub	r1, r12 -> r2   ; fvwrite.c:209
	;;
#0:	       stm.a	r2, r0, 2       ; fvwrite.c:209
	;;
#0:	       br	.BB2_56
	;;
	       nop	2
	;;
.BB2_37:                                ; %bb37
                                        ;   in Loop: Header=BB2_38 Depth=1
#0:	       ldm.s	r14, 16         ; fvwrite.c:224
	;;
#0:	       ldx	$mem, 0 -> r0   ; fvwrite.c:224
	;;
#0:	       ldm.f	r0, -4          ; fvwrite.c:224
	;;
#0:	       ldx	$mem, 0 -> r1   ; fvwrite.c:224
	;;
#0:	       stm.s	r1, r14, 10     ; fvwrite.c:224
	;;
#0:	       ldm.f	r0, 0           ; fvwrite.c:224
#1:	       add	r0, 8 -> r0
	;;
#0:	       ldx	$mem, 0 -> r1   ; fvwrite.c:224
	;;
#0:	       stm.s	r1, r14, 9
	;;
#0:	       stm.s	r0, r14, 4
	;;
.BB2_38:                                ; %bb38.outer
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB2_39 Depth 2
#0:	       ldi	0 -> r0
	;;
#0:	       stm.s	r0, r14, 8
	;;
.BB2_39:                                ; %bb38
                                        ;   Parent Loop BB2_38 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.s	r14, 36         ; fvwrite.c:224
	;;
#0:	       ldx	$mem, 0 -> r0   ; fvwrite.c:224
	;;
#0:	       cmpeq	r0, 0 -> c1     ; fvwrite.c:224
	;;
#0:	if  c1 br	.BB2_37         ; fvwrite.c:224
	;;                              ; fvwrite.c:224
	       nop	2               ; fvwrite.c:224
	;;
; BB#40:                                ; %bb39
                                        ;   in Loop: Header=BB2_39 Depth=2
#0:	       ldm.s	r14, 32         ; fvwrite.c:225
	;;
#0:	       ldx	$mem, 0 -> r0   ; fvwrite.c:225
	;;
#0:	       cmpeq	r0, 0 -> c1     ; fvwrite.c:225
	;;
#0:	if  c1 br	.BB2_42         ; fvwrite.c:225
	;;                              ; fvwrite.c:225
	       nop	2               ; fvwrite.c:225
	;;
; BB#41:                                ; %bb39.bb44_crit_edge
                                        ;   in Loop: Header=BB2_39 Depth=2
#0:	       ldm.s	r14, 20
#1:	       br	.BB2_46
	;;
#0:	       ldx	$mem, 0 -> r11
	;;
	       nop	1
	;;
.BB2_42:                                ; %bb40
                                        ;   in Loop: Header=BB2_39 Depth=2
#0:	       ldm.s	r14, 40         ; fvwrite.c:227
	;;
#0:	       ldx	$mem, 0 -> r0   ; fvwrite.c:227
#1:	       ldm.s	r14, 36         ; fvwrite.c:227
	;;
#0:	       callg	_memchr         ; fvwrite.c:227
#1:	       ldx	$mem, 0 -> r1   ; fvwrite.c:227
	;;                              ; fvwrite.c:227
	       nop	3               ; fvwrite.c:227
	;;
#0:	       cmpeq	r0, 0 -> c1     ; fvwrite.c:228
	;;
#0:	if  c1 br	.BB2_44         ; fvwrite.c:228
	;;                              ; fvwrite.c:228
	       nop	2               ; fvwrite.c:228
	;;
; BB#43:                                ; %bb41
                                        ;   in Loop: Header=BB2_39 Depth=2
#0:	       ldm.s	r14, 40         ; fvwrite.c:228
#1:	       br	.BB2_45
#2:	       add	r0, 1 -> r11    ; fvwrite.c:228
	;;
#0:	       ldx	$mem, 0 -> r0   ; fvwrite.c:228
	;;
#0:	       sub	r11, r0 -> r11  ; fvwrite.c:228
	;;
	       nop	0
	;;
.BB2_44:                                ; %bb42
                                        ;   in Loop: Header=BB2_39 Depth=2
#0:	       ldm.s	r14, 36         ; fvwrite.c:228
	;;
#0:	       ldx	$mem, 0 -> r11  ; fvwrite.c:228
	;;
#0:	       add	r11, 1 -> r11   ; fvwrite.c:228
	;;
.BB2_45:                                ; %bb42
                                        ;   in Loop: Header=BB2_39 Depth=2
#0:	       ldi	1 -> r0
	;;
#0:	       stm.s	r0, r14, 8
	;;
.BB2_46:                                ; %bb44
                                        ;   in Loop: Header=BB2_39 Depth=2
#0:	       ldm.f	r10, 20         ; fvwrite.c:232
	;;
#0:	       ldx	$mem, 0 -> r3   ; fvwrite.c:232
#1:	       ldm.f	r10, 8          ; fvwrite.c:232
	;;
#0:	       ldx	$mem, 0 -> r1   ; fvwrite.c:232
#1:	       ldm.f	r10, 0          ; fvwrite.c:233
	;;
#0:	       ldx	$mem, 0 -> r0   ; fvwrite.c:233
#1:	       ldm.s	r14, 36         ; fvwrite.c:231
	;;
#0:	       ldx	$mem, 0 -> r2   ; fvwrite.c:231
#1:	       ldm.f	r10, 16         ; fvwrite.c:233
	;;
#0:	       cmpule	r11, r2 -> c1   ; fvwrite.c:231
#1:	       or	r2, 0 -> r12    ; fvwrite.c:231
	;;
#0:	       ldx	$mem, 0 -> r4   ; fvwrite.c:233
#1:	if  c1 or	r11, 0 -> r12   ; fvwrite.c:231
	;;
#0:	       cmpule	r0, r4 -> c1    ; fvwrite.c:233
	;;
#0:	if !c1 add	r3, r1 -> r13   ; fvwrite.c:232
	;;
#0:	if !c1 cmple	r12, r13 -> c1
	;;
#0:	if  c1 br	.BB2_48
	;;
	       nop	2
	;;
; BB#47:                                ; %bb48
                                        ;   in Loop: Header=BB2_39 Depth=2
#0:	       ldm.s	r14, 40         ; fvwrite.c:235
#1:	       or	r13, 0 -> r2    ; fvwrite.c:235
	;;
#0:	       callg	_memmove        ; fvwrite.c:235
#1:	       ldx	$mem, 0 -> r1   ; fvwrite.c:235
	;;                              ; fvwrite.c:235
	       nop	3               ; fvwrite.c:235
	;;
#0:	       ldm.f	r10, 0          ; fvwrite.c:237
#1:	       ldga	_impure_data -> r0 ; fvwrite.c:238
#2:	       or	r10, 0 -> r1    ; fvwrite.c:238
	;;
#0:	       callg	__fflush_r      ; fvwrite.c:238
#1:	       ldx	$mem, 0 -> r12  ; fvwrite.c:237
	;;
#0:	       add	r12, r13 -> r12 ; fvwrite.c:237
	;;
#0:	       stm.a	r12, r10, 0     ; fvwrite.c:237
	;;                              ; fvwrite.c:238
	       nop	1               ; fvwrite.c:238
	;;
#0:	       cmpne	r0, 0 -> c1     ; fvwrite.c:238
	;;
#0:	if  c1 br	.BB2_22
	;;
	       nop	2
	;;
#0:	       br	.BB2_52
	;;
	       nop	2
	;;
.BB2_48:                                ; %bb49
                                        ;   in Loop: Header=BB2_39 Depth=2
#0:	       cmplt	r12, r3 -> c1   ; fvwrite.c:241
	;;
#0:	if  c1 br	.BB2_51         ; fvwrite.c:241
	;;                              ; fvwrite.c:241
	       nop	2               ; fvwrite.c:241
	;;
; BB#49:                                ; %bb50
                                        ;   in Loop: Header=BB2_39 Depth=2
#0:	       ldm.f	r10, 36         ; fvwrite.c:243
#1:	       ldga	_impure_data -> r0 ; fvwrite.c:238
	;;
#0:	       ldx	$mem, 0 -> r12  ; fvwrite.c:243
#1:	       ldm.f	r10, 28         ; fvwrite.c:243
	;;
#0:	       ldx	$mem, 0 -> r1   ; fvwrite.c:243
#1:	       ldm.s	r14, 40         ; fvwrite.c:243
	;;
#0:	       ldx	$mem, 0 -> r2   ; fvwrite.c:243
	;;
#0:	       call	r12             ; fvwrite.c:243
	;;                              ; fvwrite.c:243
	       nop	3               ; fvwrite.c:243
	;;
#0:	       cmplt	r0, 1 -> c1
	;;
#0:	if  c1 br	.BB2_22
	;;
	       nop	2
	;;
; BB#50:                                ; %bb50.bb52_crit_edge
                                        ;   in Loop: Header=BB2_39 Depth=2
#0:	       or	r0, 0 -> r13
#1:	       br	.BB2_52
	;;
	       nop	2
	;;
.BB2_51:                                ; %bb51
                                        ;   in Loop: Header=BB2_39 Depth=2
#0:	       ldm.s	r14, 40         ; fvwrite.c:250
#1:	       or	r12, 0 -> r2    ; fvwrite.c:250
	;;
#0:	       callg	_memmove        ; fvwrite.c:250
#1:	       ldx	$mem, 0 -> r1   ; fvwrite.c:250
	;;                              ; fvwrite.c:250
	       nop	3               ; fvwrite.c:250
	;;
#0:	       ldm.f	r10, 8          ; fvwrite.c:251
	;;
#0:	       ldx	$mem, 0 -> r13  ; fvwrite.c:251
#1:	       ldm.f	r10, 0          ; fvwrite.c:252
	;;
#0:	       sub	r13, r12 -> r13 ; fvwrite.c:251
	;;
#0:	       ldx	$mem, 0 -> r0   ; fvwrite.c:252
#1:	       stm.a	r13, r10, 2     ; fvwrite.c:251
	;;
#0:	       add	r0, r12 -> r13  ; fvwrite.c:252
	;;
#0:	       stm.a	r13, r10, 0     ; fvwrite.c:252
#1:	       or	r12, 0 -> r13
	;;
.BB2_52:                                ; %bb52
                                        ;   in Loop: Header=BB2_39 Depth=2
#0:	       cmpeq	r11, r13 -> c1
#1:	       sub	r11, r13 -> r0  ; fvwrite.c:254
	;;
#0:	if !c1 br	.BB2_55
#1:	       stm.s	r0, r14, 5
	;;
	       nop	2
	;;
; BB#53:                                ; %bb53
                                        ;   in Loop: Header=BB2_39 Depth=2
#0:	       ldga	_impure_data -> r0 ; fvwrite.c:238
#1:	       callg	__fflush_r      ; fvwrite.c:257
#2:	       or	r10, 0 -> r1    ; fvwrite.c:257
	;;                              ; fvwrite.c:257
	       nop	3               ; fvwrite.c:257
	;;
#0:	       cmpne	r0, 0 -> c1     ; fvwrite.c:257
	;;
#0:	if  c1 br	.BB2_22
	;;
	       nop	2
	;;
; BB#54:                                ; %bb53.bb55_crit_edge
                                        ;   in Loop: Header=BB2_39 Depth=2
#0:	       ldi	0 -> r0
	;;
#0:	       stm.s	r0, r14, 8
	;;
.BB2_55:                                ; %bb55
                                        ;   in Loop: Header=BB2_39 Depth=2
#0:	       ldm.s	r14, 28         ; fvwrite.c:264
	;;
#0:	       ldx	$mem, 0 -> r1   ; fvwrite.c:264
	;;
#0:	       ldm.f	r1, 8           ; fvwrite.c:264
	;;
#0:	       ldx	$mem, 0 -> r0   ; fvwrite.c:264
#1:	       ldm.s	r14, 40         ; fvwrite.c:261
	;;
#0:	       cmpeq	r0, r13 -> c1
	;;
#0:	       ldx	$mem, 0 -> r2   ; fvwrite.c:261
	;;
#0:	       add	r2, r13 -> r2   ; fvwrite.c:261
	;;
#0:	       stm.s	r2, r14, 10     ; fvwrite.c:262
	;;
#0:	       ldm.s	r14, 36         ; fvwrite.c:262
	;;
#0:	if !c1 br	.BB2_39
#1:	       ldx	$mem, 0 -> r2   ; fvwrite.c:262
	;;
#0:	       sub	r2, r13 -> r2   ; fvwrite.c:262
	;;
#0:	       stm.s	r2, r14, 9      ; fvwrite.c:264
#1:	       sub	r0, r13 -> r2   ; fvwrite.c:264
	;;
#0:	       stm.a	r2, r1, 2       ; fvwrite.c:264
	;;
.BB2_56:                                ; %bb57
#0:	       ldi	0 -> r0
	;;
.BB2_57:                                ; %bb57
#0:	       ldm.s	r14, 44         ; fvwrite.c:270
#1:	       or	r14, 0 -> r15   ; fvwrite.c:270
	;;
#0:	       ldx	$mem, 0 -> r13  ; fvwrite.c:270
#1:	       ldm.s	r14, 48         ; fvwrite.c:270
	;;
#0:	       ldx	$mem, 0 -> r12  ; fvwrite.c:270
#1:	       ldm.s	r14, 52         ; fvwrite.c:270
	;;
#0:	       ldx	$mem, 0 -> r11  ; fvwrite.c:270
#1:	       ldm.s	r14, 56         ; fvwrite.c:270
	;;
#0:	       ldx	$mem, 0 -> r10  ; fvwrite.c:270
#1:	       ldm.s	r15, 8          ; fvwrite.c:270
	;;
#3:	       ldx	$mem, 0 -> r3.31 ; fvwrite.c:270
#0:	       ldm.s	r15, 4          ; fvwrite.c:270
	;;
#3:	       stx	r3.31 -> $ro    ; fvwrite.c:270
	;;
#0:	       ldx	$mem, 0 -> r0.31 ; fvwrite.c:270
	;;
#0:	       stx	r0.31 -> $rb    ; fvwrite.c:270
	;;
.BB2_58:                                ; %bb57
#0:	       ldm.s	r15, 0          ; fvwrite.c:270
#1:	       s2add	r15, 15 -> r15  ; fvwrite.c:270
	;;
#0:	       ret                      ; fvwrite.c:270
#1:	       ldx	$mem, 0 -> r14  ; fvwrite.c:270
	;;                              ; fvwrite.c:270
	       nop	3               ; fvwrite.c:270
	;;
	.align	4
___sfvwrite_r_end:

	.align	4
_strlen:                                ; @strlen
	.size	_strlen_end-_strlen
_strlen_start:
; BB#0:                                 ; %entry
#0:	       ldiu	4 -> r2
#1:	       wb.s	r15, 1
#2:	       ldi	0 -> r0
#3:	       ldga	._.str -> r1
	;;
#0:	       br	.BB3_3
#1:	       sub	r15, r2 -> r15
	;;
	       nop	2
	;;
.BB3_1:                                 ; %bb
                                        ;   in Loop: Header=BB3_3 Depth=1
#0:	       cmpne	r0, 13 -> c1    ; strlen.c:68
	;;
#0:	if !c1 ret                      ; strlen.c:87
#1:	if !c1 s2add	r15, 1 -> r15   ; strlen.c:87
	;;                              ; strlen.c:87
	       nop	3               ; strlen.c:87
	;;
; BB#2:                                 ; %bb2
                                        ;   in Loop: Header=BB3_3 Depth=1
#0:	       add	r0, 1 -> r0
	;;
.BB3_3:                                 ; %bb3
                                        ; =>This Inner Loop Header: Depth=1
#0:	       add	r1, r0 -> r2
	;;
#0:	       and	r2, 3 -> r2     ; strlen.c:66
	;;
#0:	       cmpne	r2, 0 -> c1     ; strlen.c:66
	;;
#0:	if  c1 br	.BB3_1          ; strlen.c:66
	;;                              ; strlen.c:66
	       nop	2               ; strlen.c:66
	;;
; BB#4:                                 ; %bb4
#0:	       ldga	._.str -> r1
#1:	       ldga	32896 -> r3
	;;
#0:	       add	r1, r0 -> r0
#1:	       ldiu	1791 -> r1
#2:	       ldih	1028 -> r3
	;;
#0:	       ldm.f	r0, 0           ; strlen.c:76
#1:	       ldim	991 -> r1
	;;
#0:	       ldih	2039 -> r1
	;;
#0:	       ldx	$mem, 0 -> r2   ; strlen.c:76
	;;
#0:	       and	r2, r3 -> r4
#1:	       add	r2, r1 -> r2
	;;
#0:	       xor	r4, r3 -> r4
	;;
#0:	       and	r4, r2 -> r2    ; strlen.c:76
	;;
#0:	       cmpeq	r2, 0 -> c1     ; strlen.c:76
	;;
#0:	if !c1 br	.BB3_6
	;;
	       nop	2
	;;
.BB3_5:                                 ; %bb5
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r0, 4           ; strlen.c:76
#1:	       add	r0, 4 -> r0
	;;
#0:	       ldx	$mem, 0 -> r2   ; strlen.c:76
	;;
#0:	       and	r2, r3 -> r4
#1:	       add	r2, r1 -> r2
	;;
#0:	       xor	r4, r3 -> r4
	;;
#0:	       and	r4, r2 -> r2    ; strlen.c:76
	;;
#0:	       cmpeq	r2, 0 -> c1     ; strlen.c:76
	;;
#0:	if  c1 br	.BB3_5          ; strlen.c:76
	;;                              ; strlen.c:76
	       nop	2               ; strlen.c:76
	;;
.BB3_6:                                 ; %bb8
#0:	       ldm.f	r0, 0           ; strlen.c:85
	;;
#0:	       ldx	$membu, r0 -> r1 ; strlen.c:85
	;;
#0:	       cmpeq	r1, 0 -> c1     ; strlen.c:85
	;;
#0:	if  c1 br	.BB3_9
	;;
	       nop	2
	;;
.BB3_7:                                 ; %bb9
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.f	r0, 1           ; strlen.c:85
#1:	       add	r0, 1 -> r1
	;;
#0:	       ldx	$membu, r1 -> r0 ; strlen.c:85
	;;
#0:	       cmpne	r0, 0 -> c1     ; strlen.c:85
#1:	       or	r1, 0 -> r0
	;;
#0:	if  c1 br	.BB3_7          ; strlen.c:85
	;;                              ; strlen.c:85
	       nop	2               ; strlen.c:85
	;;
; BB#8:                                 ; %bb9.bb11_crit_edge
#0:	       or	r1, 0 -> r0
	;;
.BB3_9:                                 ; %bb11
#0:	       ldga	._.str -> r1    ; strlen.c:87
	;;
#0:	       sub	r0, r1 -> r0    ; strlen.c:87
	;;
.BB3_10:                                ; %bb1
#0:	       s2add	r15, 1 -> r15   ; strlen.c:87
#1:	       ret                      ; strlen.c:87
	;;                              ; strlen.c:87
	       nop	3               ; strlen.c:87
	;;
	.align	4
_strlen_end:

	.align	4
___swsetup_r:                           ; @__swsetup_r
	.size	___swsetup_r_end-___swsetup_r
___swsetup_r_start:
; BB#0:                                 ; %bb
#0:	       wb.s	r15, 6
#2:	       ldiu	24 -> r1
#1:	       ldx	$rb, 0 -> r1.31
	;;
#0:	       sub	r15, r1 -> r15
#2:	       ldx	$ro, 0 -> r2.31
	;;
#0:	       stm.s	r14, r15, 0
#1:	       or	r15, 0 -> r14
	;;
#1:	       stm.s	r1.31, r15, 1
	;;
#2:	       stm.s	r2.31, r15, 2
	;;
#0:	       stm.s	r10, r14, 5
#1:	       or	r0, 0 -> r10
	;;
#0:	       stm.s	r11, r14, 4
	;;
#0:	       ldmg.d	_impure_data+56 ; wsetup.c:38
	;;
#0:	       ldx	$mem, 0 -> r0   ; wsetup.c:38
	;;
#0:	       cmpne	r0, 0 -> c1     ; wsetup.c:38
	;;
#0:	if  c1 br	.BB4_2
	;;
	       nop	2
	;;
; BB#1:                                 ; %bb1
#0:	       ldga	_impure_data -> r0 ; wsetup.c:38
#1:	       callg	___sinit        ; wsetup.c:38
	;;                              ; wsetup.c:38
	       nop	3               ; wsetup.c:38
	;;
.BB4_2:                                 ; %bb2
#0:	       ldm.f	r10, 12         ; wsetup.c:44
#1:	       add	r10, 12 -> r11  ; wsetup.c:44
	;;
#0:	       ldx	$memhu, r11 -> r0 ; wsetup.c:44
	;;
#0:	       btest	r0, 3 -> c1     ; wsetup.c:44
	;;
#0:	if  c1 br	.BB4_11
	;;
	       nop	2
	;;
; BB#3:                                 ; %bb3
#0:	       btest	r0, 4 -> c1     ; wsetup.c:46
	;;
#0:	if !c1 br	.BB4_23         ; wsetup.c:46
	;;                              ; wsetup.c:46
	       nop	2               ; wsetup.c:46
	;;
; BB#4:                                 ; %bb5
#0:	       btest	r0, 2 -> c1     ; wsetup.c:48
	;;
#0:	if !c1 br	.BB4_10
	;;
	       nop	2
	;;
; BB#5:                                 ; %bb6
#0:	       ldm.f	r10, 48         ; wsetup.c:51
	;;
#0:	       ldx	$mem, 0 -> r1   ; wsetup.c:51
	;;
#0:	       cmpne	r1, 0 -> c1     ; wsetup.c:51
	;;
#0:	if !c1 br	.BB4_9
	;;
	       nop	2
	;;
; BB#6:                                 ; %bb7
#0:	       s2add	r10, 16 -> r2
	;;
#0:	       cmpne	r1, r2 -> c1    ; wsetup.c:52
	;;
#0:	if !c1 br	.BB4_8
	;;
	       nop	2
	;;
; BB#7:                                 ; %bb8
#0:	       ldga	_impure_data -> r0 ; wsetup.c:52
#1:	       callg	__free_r        ; wsetup.c:52
	;;                              ; wsetup.c:52
	       nop	3               ; wsetup.c:52
	;;
#0:	       ldm.f	r10, 12
	;;
#0:	       ldx	$memhu, r11 -> r0
	;;
.BB4_8:                                 ; %bb9
#0:	       stm.a	0, r10, 12      ; wsetup.c:52
	;;
.BB4_9:                                 ; %bb10
#0:	       ldm.f	r10, 16         ; wsetup.c:55
#1:	       ldiu	2011 -> r1
	;;
#0:	       ldim	31 -> r1
	;;
#0:	       ldx	$mem, 0 -> r2   ; wsetup.c:55
#1:	       and	r0, r1 -> r0    ; wsetup.c:53
	;;
#0:	       stm.a	r2, r10, 0      ; wsetup.c:55
	;;
#0:	       stmh.a	r0, r10, 6      ; wsetup.c:53
	;;
#0:	       stm.a	0, r10, 1       ; wsetup.c:54
	;;
.BB4_10:                                ; %bb11
#0:	       or	r0, 8 -> r0     ; wsetup.c:57
	;;
#0:	       stmh.a	r0, r10, 6      ; wsetup.c:57
	;;
.BB4_11:                                ; %bb12
#0:	       ldm.f	r10, 16         ; wsetup.c:65
	;;
#0:	       ldx	$mem, 0 -> r1   ; wsetup.c:65
	;;
#0:	       cmpeq	r1, 0 -> c1     ; wsetup.c:65
	;;
#0:	if !c1 br	.BB4_14
	;;
	       nop	2
	;;
; BB#12:                                ; %bb13
#0:	       btest	r0, 9 -> c1     ; wsetup.c:65
	;;
#0:	if  c1 ldi	128 -> r1
	;;
#0:	if  c1 and	r0, r1 -> r1    ; wsetup.c:65
	;;
#0:	if  c1 cmpeq	r1, 0 -> c1
	;;
#0:	if  c1 br	.BB4_14
	;;
	       nop	2
	;;
; BB#13:                                ; %bb15
#0:	       or	r10, 0 -> r0    ; wsetup.c:67
#1:	       callg	___smakebuf_r   ; wsetup.c:67
	;;                              ; wsetup.c:67
	       nop	3               ; wsetup.c:67
	;;
#0:	       ldm.f	r10, 12
	;;
#0:	       ldx	$memhu, r11 -> r0
	;;
.BB4_14:                                ; %bb16
#0:	       btest	r0, 0 -> c1     ; wsetup.c:69
#1:	       mask	r0, 4 -> r1
	;;
#0:	if !c1 br	.BB4_16         ; wsetup.c:69
	;;                              ; wsetup.c:69
	       nop	2               ; wsetup.c:69
	;;
; BB#15:                                ; %bb17
#0:	       ldm.f	r10, 20         ; wsetup.c:77
#1:	       ldi	0 -> r2
	;;
#0:	       br	.BB4_20
#1:	       ldx	$mem, 0 -> r0   ; wsetup.c:77
	;;
#0:	       sub	r2, r0 -> r0    ; wsetup.c:77
	;;
#0:	       stm.a	r0, r10, 6      ; wsetup.c:77
	;;
#0:	       stm.a	0, r10, 2       ; wsetup.c:76
	;;
.BB4_16:                                ; %bb18
#0:	       btest	r1, 1 -> c1     ; wsetup.c:80
	;;
#0:	if !c1 br	.BB4_18         ; wsetup.c:80
	;;                              ; wsetup.c:80
	       nop	2               ; wsetup.c:80
	;;
; BB#17:                                ; %bb18.bb21_crit_edge
#0:	       ldi	0 -> r0
#1:	       br	.BB4_19
	;;
	       nop	2
	;;
.BB4_18:                                ; %bb19
#0:	       ldm.f	r10, 20         ; wsetup.c:80
	;;
#0:	       ldx	$mem, 0 -> r0   ; wsetup.c:80
	;;
.BB4_19:                                ; %bb21
#0:	       stm.a	r0, r10, 2      ; wsetup.c:80
	;;
.BB4_20:                                ; %bb22
#0:	       ldm.f	r10, 16         ; wsetup.c:82
	;;
#0:	       ldx	$mem, 0 -> r0   ; wsetup.c:82
	;;
#0:	       cmpne	r0, 0 -> c1     ; wsetup.c:82
	;;
#0:	if  c1 br	.BB4_22         ; wsetup.c:82
	;;                              ; wsetup.c:82
	       nop	2               ; wsetup.c:82
	;;
; BB#21:                                ; %bb23
#0:	       sr	r1, 7 -> r0
#1:	       br	.BB4_24
#2:	       ldi	-1 -> r1
	;;
#0:	       cmpne	r0, 0 -> c1
#1:	       ldi	0 -> r0
	;;
#0:	if  c1 or	r1, 0 -> r0
	;;
	       nop	0
	;;
.BB4_22:                                ; %bb25
#0:	       ldm.s	r14, 16         ; wsetup.c:82
#1:	       or	r14, 0 -> r15   ; wsetup.c:82
#2:	       ldi	0 -> r0
	;;
#0:	       ldx	$mem, 0 -> r11  ; wsetup.c:82
#1:	       ldm.s	r14, 20         ; wsetup.c:82
	;;
#0:	       ldx	$mem, 0 -> r10  ; wsetup.c:82
#1:	       ldm.s	r15, 8          ; wsetup.c:82
	;;
#0:	       br	.BB4_25
#1:	       ldx	$mem, 0 -> r1.31 ; wsetup.c:82
#2:	       ldm.s	r15, 4          ; wsetup.c:82
	;;
#1:	       stx	r1.31 -> $ro    ; wsetup.c:82
	;;
#2:	       ldx	$mem, 0 -> r2.31 ; wsetup.c:82
	;;
#2:	       stx	r2.31 -> $rb    ; wsetup.c:82
	;;
.BB4_23:                                ; %bb27
#0:	       ldi	-1 -> r0
	;;
.BB4_24:                                ; %bb27
#0:	       ldm.s	r14, 16         ; wsetup.c:82
#1:	       or	r14, 0 -> r15   ; wsetup.c:82
	;;
#0:	       ldx	$mem, 0 -> r11  ; wsetup.c:82
#1:	       ldm.s	r14, 20         ; wsetup.c:82
	;;
#0:	       ldx	$mem, 0 -> r10  ; wsetup.c:82
#1:	       ldm.s	r15, 8          ; wsetup.c:82
	;;
#3:	       ldx	$mem, 0 -> r3.31 ; wsetup.c:82
#0:	       ldm.s	r15, 4          ; wsetup.c:82
	;;
#3:	       stx	r3.31 -> $ro    ; wsetup.c:82
	;;
#0:	       ldx	$mem, 0 -> r0.31 ; wsetup.c:82
	;;
#0:	       stx	r0.31 -> $rb    ; wsetup.c:82
	;;
.BB4_25:                                ; %bb27
#0:	       ldm.s	r15, 0          ; wsetup.c:82
#1:	       s2add	r15, 6 -> r15   ; wsetup.c:82
	;;
#0:	       ret                      ; wsetup.c:82
#1:	       ldx	$mem, 0 -> r14  ; wsetup.c:82
	;;                              ; wsetup.c:82
	       nop	3               ; wsetup.c:82
	;;
	.align	4
___swsetup_r_end:

	.align	4
___sflush_r:                            ; @__sflush_r
	.size	___sflush_r_end-___sflush_r
___sflush_r_start:
; BB#0:                                 ; %entry
#0:	       wb.s	r15, 9          ; fflush.c:80
#2:	       ldiu	36 -> r3        ; fflush.c:80
#1:	       ldx	$rb, 0 -> r1.31 ; fflush.c:80
#3:	       add	r1, 12 -> r2    ; fflush.c:80
	;;
#0:	       sub	r15, r3 -> r15  ; fflush.c:80
#2:	       ldx	$ro, 0 -> r2.31 ; fflush.c:80
	;;
#0:	       stm.s	r14, r15, 0     ; fflush.c:80
#1:	       or	r15, 0 -> r14   ; fflush.c:80
	;;
#1:	       stm.s	r1.31, r15, 1   ; fflush.c:80
	;;
#2:	       stm.s	r2.31, r15, 2   ; fflush.c:80
	;;
#0:	       stm.s	r10, r14, 8     ; fflush.c:80
#1:	       or	r1, 0 -> r10
	;;
#0:	       stm.s	r11, r14, 7     ; fflush.c:80
	;;
#0:	       stm.s	r12, r14, 6     ; fflush.c:80
	;;
#0:	       stm.s	r13, r14, 5     ; fflush.c:80
	;;
#0:	       ldm.f	r1, 12          ; fflush.c:80
	;;
#0:	       ldx	$memhs, r2 -> r2 ; fflush.c:80
#1:	       stm.s	r0, r14, 4
	;;
#0:	       btest	r2, 3 -> c1     ; fflush.c:81
	;;
#0:	if  c1 br	.BB5_31         ; fflush.c:81
	;;                              ; fflush.c:81
	       nop	2               ; fflush.c:81
	;;
; BB#1:                                 ; %bb
#0:	       ldm.f	r10, 4          ; fflush.c:95
#1:	       ldi	0 -> r3
#2:	       ldga	2048 -> r1
	;;
#0:	       or	r2, r1 -> r2    ; fflush.c:86
	;;
#0:	       ldx	$mem, 0 -> r0   ; fflush.c:95
#1:	       stmh.a	r2, r10, 6      ; fflush.c:86
	;;
#0:	       cmplt	r3, r0 -> c1    ; fflush.c:95
	;;
#0:	if  c1 br	.BB5_3
	;;
	       nop	2
	;;
; BB#2:                                 ; %bb1
#0:	       ldm.f	r10, 60         ; fflush.c:95
	;;
#0:	       ldx	$mem, 0 -> r2   ; fflush.c:95
	;;
#0:	       cmplt	r2, 1 -> c1     ; fflush.c:95
	;;
#0:	if  c1 br	.BB5_40
	;;
	       nop	2
	;;
.BB5_3:                                 ; %bb2
#0:	       ldm.f	r10, 40         ; fflush.c:95
	;;
#0:	       ldx	$mem, 0 -> r2   ; fflush.c:95
	;;
#0:	       cmpeq	r2, 0 -> c1     ; fflush.c:95
	;;
#0:	if  c1 br	.BB5_40
	;;
	       nop	2
	;;
; BB#4:                                 ; %bb3
#0:	       ldm.s	r14, 16         ; fflush.c:107
#1:	       add	r10, 12 -> r12
	;;
#0:	       ldx	$mem, 0 -> r0   ; fflush.c:107
	;;
#0:	       ldm.f	r0, 0           ; fflush.c:107
	;;
#0:	       ldx	$mem, 0 -> r11  ; fflush.c:107
#1:	       stm.a	0, r0, 0        ; fflush.c:108
	;;
#0:	       ldm.f	r10, 12
	;;
#0:	       ldx	$memhu, r12 -> r2
	;;
#0:	       btest	r2, 12 -> c1    ; fflush.c:110
	;;
#0:	if !c1 br	.BB5_8          ; fflush.c:110
	;;                              ; fflush.c:110
	       nop	2               ; fflush.c:110
	;;
; BB#5:                                 ; %bb4
#0:	       ldm.f	r10, 80         ; fflush.c:111
	;;
#0:	       ldx	$mem, 0 -> r0   ; fflush.c:111
	;;
.BB5_6:                                 ; %bb12
#0:	       ldm.f	r10, 12         ; fflush.c:135
	;;
#0:	       ldx	$membu, r12 -> r2 ; fflush.c:135
	;;
#0:	       btest	r2, 2 -> c1     ; fflush.c:135
	;;
#0:	if  c1 br	.BB5_15
	;;
	       nop	2
	;;
; BB#7:                                 ; %bb12.bb15_crit_edge
#0:	       or	r0, 0 -> r2
#1:	       br	.BB5_16
	;;
	       nop	2
	;;
.BB5_8:                                 ; %bb5
#0:	       ldm.f	r10, 40         ; fflush.c:121
#1:	       ldi	0 -> r2
#2:	       ldi	1 -> r3
	;;
#0:	       ldx	$mem, 0 -> r4   ; fflush.c:121
#1:	       ldm.f	r10, 28         ; fflush.c:121
	;;
#0:	       ldx	$mem, 0 -> r1   ; fflush.c:121
	;;
#0:	       call	r4              ; fflush.c:121
	;;                              ; fflush.c:121
	       nop	3               ; fflush.c:121
	;;
#0:	       cmpeq	r0, -1 -> c1    ; fflush.c:122
	;;
#0:	if !c1 br	.BB5_6
	;;
	       nop	2
	;;
; BB#9:                                 ; %bb6
#0:	       ldm.s	r14, 16         ; fflush.c:122
	;;
#0:	       ldx	$mem, 0 -> r2   ; fflush.c:122
	;;
#0:	       ldm.f	r2, 0           ; fflush.c:122
	;;
#0:	       ldx	$mem, 0 -> r2   ; fflush.c:122
	;;
#0:	       cmpeq	r2, 0 -> c1
	;;
#0:	if  c1 br	.BB5_6
	;;
	       nop	2
	;;
; BB#10:                                ; %bb6
#0:	       ldi	22 -> r0
	;;
#0:	       cmpeq	r2, r0 -> c1
	;;
#0:	if  c1 br	.BB5_12
	;;
	       nop	2
	;;
; BB#11:                                ; %bb6
#0:	       ldi	29 -> r0
	;;
#0:	       cmpne	r2, r0 -> c1
	;;
#0:	if  c1 br	.BB5_13
	;;
	       nop	2
	;;
.BB5_12:                                ; %bb9
#0:	       ldm.s	r14, 16         ; fflush.c:128
#1:	       br	.BB5_27
	;;
#0:	       ldx	$mem, 0 -> r0   ; fflush.c:128
	;;
#0:	       stm.a	r11, r0, 0      ; fflush.c:128
	;;
	       nop	0
	;;
.BB5_13:                                ; %bb10
#0:	       ldm.f	r10, 12         ; fflush.c:131
#1:	       ldi	64 -> r11
	;;
#0:	       ldx	$memhu, r12 -> r2 ; fflush.c:131
	;;
#0:	       or	r2, r11 -> r2   ; fflush.c:131
	;;
.BB5_14:                                ; %bb10
#0:	       stmh.a	r2, r10, 6      ; fflush.c:131
#1:	       br	.BB5_41
#2:	       ldi	-1 -> r0
	;;
	       nop	2
	;;
.BB5_15:                                ; %bb13
#0:	       ldm.f	r10, 4          ; fflush.c:139
	;;
#0:	       ldx	$mem, 0 -> r2   ; fflush.c:139
#1:	       ldm.f	r10, 48         ; fflush.c:140
	;;
#0:	       sub	r0, r2 -> r2    ; fflush.c:139
	;;
#0:	       ldx	$mem, 0 -> r1   ; fflush.c:140
	;;
#0:	       cmpne	r1, 0 -> c1     ; fflush.c:140
	;;
#0:	if  c1 ldm.f	r10, 60         ; fflush.c:141
	;;
#0:	if  c1 ldx	$mem, 0 -> r0   ; fflush.c:141
	;;
#0:	if  c1 sub	r2, r0 -> r2    ; fflush.c:141
	;;
.BB5_16:                                ; %bb15
#0:	       ldm.f	r10, 40         ; fflush.c:149
#1:	       ldi	0 -> r3
	;;
#0:	       ldx	$mem, 0 -> r4   ; fflush.c:149
#1:	       ldm.f	r10, 28         ; fflush.c:149
	;;
#0:	       ldx	$mem, 0 -> r1   ; fflush.c:149
#1:	       ldm.s	r14, 16         ; fflush.c:149
	;;
#0:	       ldx	$mem, 0 -> r0   ; fflush.c:149
	;;
#0:	       call	r4              ; fflush.c:149
	;;                              ; fflush.c:149
	       nop	3               ; fflush.c:149
	;;
#0:	       cmpne	r0, -1 -> c1    ; fflush.c:150
	;;
#0:	if  c1 br	.BB5_19
	;;
	       nop	2
	;;
; BB#17:                                ; %bb16
#0:	       ldm.s	r14, 16         ; fflush.c:150
#1:	       ldi	29 -> r1
	;;
#0:	       ldx	$mem, 0 -> r2   ; fflush.c:150
	;;
#0:	       ldm.f	r2, 0           ; fflush.c:150
	;;
#0:	       ldx	$mem, 0 -> r2   ; fflush.c:150
	;;
#0:	       cmpult	r1, r2 -> c1
	;;
#0:	if  c1 br	.BB5_30
	;;
	       nop	2
	;;
; BB#18:                                ; %bb16
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
#0:	       cmpne	r2, 0 -> c1
	;;
#0:	if !c1 br	.BB5_30
	;;
	       nop	2
	;;
.BB5_19:                                ; %bb19
#0:	       ldm.f	r10, 12         ; fflush.c:155
#1:	       ldiu	2047 -> r2
	;;
#0:	       ldim	30 -> r2
	;;
#0:	       ldx	$memhu, r12 -> r12 ; fflush.c:155
#1:	       ldm.f	r10, 16         ; fflush.c:157
	;;
#0:	       and	r12, r2 -> r2   ; fflush.c:155
#1:	       btest	r12, 12 -> c1   ; fflush.c:158
	;;
#0:	if !c1 br	.BB5_23
#1:	       ldx	$mem, 0 -> r1   ; fflush.c:157
	;;
#0:	       stm.a	r1, r10, 0      ; fflush.c:157
	;;
#0:	       stmh.a	r2, r10, 6      ; fflush.c:155
	;;
#0:	       stm.a	0, r10, 1       ; fflush.c:156
	;;
; BB#20:                                ; %bb20
#0:	       cmpne	r0, -1 -> c1    ; fflush.c:158
	;;
#0:	if  c1 br	.BB5_22
	;;
	       nop	2
	;;
; BB#21:                                ; %bb21
#0:	       ldm.s	r14, 16         ; fflush.c:158
	;;
#0:	       ldx	$mem, 0 -> r2   ; fflush.c:158
	;;
#0:	       br	.BB5_23
#1:	       ldm.f	r2, 0           ; fflush.c:158
	;;
#0:	       ldx	$mem, 0 -> r2   ; fflush.c:158
	;;
#0:	       cmpne	r2, 0 -> c1     ; fflush.c:158
	;;
#0:	if !c1 stm.a	r0, r10, 20     ; fflush.c:159
	;;
.BB5_22:                                ; %bb22
#0:	       stm.a	r0, r10, 20     ; fflush.c:159
	;;
.BB5_23:                                ; %bb23
#0:	       ldm.s	r14, 16         ; fflush.c:160
	;;
#0:	       ldx	$mem, 0 -> r0   ; fflush.c:160
	;;
#0:	       stm.a	r11, r0, 0      ; fflush.c:160
	;;
#0:	       ldm.f	r10, 48         ; fflush.c:161
	;;
#0:	       ldx	$mem, 0 -> r1   ; fflush.c:161
	;;
#0:	       cmpeq	r1, 0 -> c1     ; fflush.c:161
	;;
#0:	if  c1 br	.BB5_40
	;;
	       nop	2
	;;
; BB#24:                                ; %bb24
#0:	       s2add	r10, 16 -> r2
	;;
#0:	       cmpeq	r1, r2 -> c1    ; fflush.c:162
	;;
#0:	if  c1 br	.BB5_26
	;;
	       nop	2
	;;
; BB#25:                                ; %bb25
#0:	       callg	__free_r        ; fflush.c:162
	;;                              ; fflush.c:162
	       nop	3               ; fflush.c:162
	;;
.BB5_26:                                ; %bb26
#0:	       stm.a	0, r10, 12      ; fflush.c:162
	;;
.BB5_27:                                ; %bb26
#0:	       ldi	0 -> r0
	;;
.BB5_28:                                ; %bb26
#0:	       ldm.s	r14, 20         ; fflush.c:198
#1:	       or	r14, 0 -> r15   ; fflush.c:198
	;;
#0:	       ldx	$mem, 0 -> r13  ; fflush.c:198
#1:	       ldm.s	r14, 24         ; fflush.c:198
	;;
#0:	       ldx	$mem, 0 -> r12  ; fflush.c:198
#1:	       ldm.s	r14, 28         ; fflush.c:198
	;;
#0:	       ldx	$mem, 0 -> r11  ; fflush.c:198
#1:	       ldm.s	r14, 32         ; fflush.c:198
	;;
#0:	       ldx	$mem, 0 -> r10  ; fflush.c:198
#1:	       ldm.s	r15, 8          ; fflush.c:198
	;;
#3:	       ldx	$mem, 0 -> r3.31 ; fflush.c:198
#0:	       ldm.s	r15, 4          ; fflush.c:198
	;;
#3:	       stx	r3.31 -> $ro    ; fflush.c:198
	;;
#0:	       ldx	$mem, 0 -> r0.31 ; fflush.c:198
	;;
#0:	       stx	r0.31 -> $rb    ; fflush.c:198
	;;
.BB5_29:                                ; %bb26
#0:	       ldm.s	r15, 0          ; fflush.c:198
#1:	       s2add	r15, 9 -> r15   ; fflush.c:198
	;;
#0:	       ret                      ; fflush.c:198
#1:	       ldx	$mem, 0 -> r14  ; fflush.c:198
	;;                              ; fflush.c:198
	       nop	3               ; fflush.c:198
	;;
.BB5_30:                                ; %bb27
#0:	       ldm.f	r10, 12         ; fflush.c:166
#1:	       br	.BB5_14
#2:	       ldi	64 -> r0
	;;
#0:	       ldx	$memhu, r12 -> r2 ; fflush.c:166
	;;
#0:	       or	r2, r0 -> r2    ; fflush.c:166
	;;
	       nop	0
	;;
.BB5_31:                                ; %bb29
#0:	       ldm.f	r10, 16         ; fflush.c:172
	;;
#0:	       ldx	$mem, 0 -> r11  ; fflush.c:172
	;;
#0:	       cmpeq	r11, 0 -> c1    ; fflush.c:172
	;;
#0:	if  c1 br	.BB5_40
	;;
	       nop	2
	;;
; BB#32:                                ; %bb31
#0:	       and	r2, 3 -> r1     ; fflush.c:185
#1:	       ldm.f	r10, 0          ; fflush.c:177
	;;
#0:	       cmpeq	r1, 0 -> c1     ; fflush.c:185
	;;
#0:	if  c1 br	.BB5_34         ; fflush.c:185
#1:	       ldx	$mem, 0 -> r0   ; fflush.c:177
#2:	       stm.a	r11, r10, 0     ; fflush.c:184
	;;
#0:	       sub	r0, r11 -> r12  ; fflush.c:177
	;;                              ; fflush.c:185
	       nop	1               ; fflush.c:185
	;;
; BB#33:                                ; %bb31.bb34_crit_edge
#0:	       ldi	0 -> r0
#1:	       br	.BB5_35
	;;
	       nop	2
	;;
.BB5_34:                                ; %bb32
#0:	       ldm.f	r10, 20         ; fflush.c:185
	;;
#0:	       ldx	$mem, 0 -> r0   ; fflush.c:185
	;;
.BB5_35:                                ; %bb34
#0:	       stm.a	r0, r10, 2      ; fflush.c:185
#1:	       br	.BB5_39
#2:	       ldi	0 -> r13
	;;
	       nop	2
	;;
.BB5_36:                                ; %bb35
                                        ;   in Loop: Header=BB5_39 Depth=1
#0:	       ldm.f	r10, 36         ; fflush.c:189
#1:	       or	r11, 0 -> r2    ; fflush.c:189
#2:	       or	r12, 0 -> r3    ; fflush.c:189
	;;
#0:	       ldx	$mem, 0 -> r4   ; fflush.c:189
#1:	       ldm.f	r10, 28         ; fflush.c:189
	;;
#0:	       ldx	$mem, 0 -> r1   ; fflush.c:189
#1:	       ldm.s	r14, 16         ; fflush.c:189
	;;
#0:	       ldx	$mem, 0 -> r0   ; fflush.c:189
	;;
#0:	       call	r4              ; fflush.c:189
	;;                              ; fflush.c:189
	       nop	3               ; fflush.c:189
	;;
#0:	       cmplt	r13, r0 -> c1   ; fflush.c:190
	;;
#0:	if  c1 br	.BB5_38         ; fflush.c:190
	;;                              ; fflush.c:190
	       nop	2               ; fflush.c:190
	;;
; BB#37:                                ; %bb36
#0:	       ldm.f	r10, 12         ; fflush.c:192
#1:	       add	r10, 12 -> r11
#2:	       ldi	64 -> r12
#3:	       ldi	-1 -> r0
	;;
#0:	       br	.BB5_28
#1:	       ldx	$memhu, r11 -> r11 ; fflush.c:192
	;;
#0:	       or	r11, r12 -> r11 ; fflush.c:192
	;;
#0:	       stmh.a	r11, r10, 6     ; fflush.c:192
	;;
	       nop	0
	;;
.BB5_38:                                ; %bb37
                                        ;   in Loop: Header=BB5_39 Depth=1
#0:	       sub	r12, r0 -> r12  ; fflush.c:196
#1:	       add	r11, r0 -> r11  ; fflush.c:195
	;;
.BB5_39:                                ; %bb38
                                        ; =>This Inner Loop Header: Depth=1
#0:	       cmplt	r13, r12 -> c1  ; fflush.c:187
	;;
#0:	if  c1 br	.BB5_36         ; fflush.c:187
	;;                              ; fflush.c:187
	       nop	2               ; fflush.c:187
	;;
.BB5_40:                                ; %bb40
#0:	       ldi	0 -> r0
	;;
.BB5_41:                                ; %bb40
#0:	       ldm.s	r14, 20         ; fflush.c:198
#1:	       or	r14, 0 -> r15   ; fflush.c:198
	;;
#0:	       ldx	$mem, 0 -> r13  ; fflush.c:198
#1:	       ldm.s	r14, 24         ; fflush.c:198
	;;
#0:	       ldx	$mem, 0 -> r12  ; fflush.c:198
#1:	       ldm.s	r14, 28         ; fflush.c:198
	;;
#0:	       ldx	$mem, 0 -> r11  ; fflush.c:198
#1:	       ldm.s	r14, 32         ; fflush.c:198
	;;
#0:	       ldx	$mem, 0 -> r10  ; fflush.c:198
#1:	       ldm.s	r15, 8          ; fflush.c:198
	;;
#0:	       br	.BB5_29
#1:	       ldx	$mem, 0 -> r1.31 ; fflush.c:198
#2:	       ldm.s	r15, 4          ; fflush.c:198
	;;
#1:	       stx	r1.31 -> $ro    ; fflush.c:198
	;;
#2:	       ldx	$mem, 0 -> r2.31 ; fflush.c:198
	;;
#2:	       stx	r2.31 -> $rb    ; fflush.c:198
	;;
	.align	4
___sflush_r_end:

	.align	4
__fflush_r:                             ; @_fflush_r
	.size	__fflush_r_end-__fflush_r
__fflush_r_start:
; BB#0:                                 ; %entry
#1:	       wb.s	r15, 6
#2:	       ldiu	24 -> r2
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
#0:	       stm.s	r10, r14, 5
#1:	       or	r1, 0 -> r10
	;;
#0:	       stm.s	r11, r14, 4
#1:	       or	r0, 0 -> r11
	;;
#0:	if !c1 ldm.f	r11, 56         ; fflush.c:224
	;;
#0:	if !c1 ldx	$mem, 0 -> r0   ; fflush.c:224
	;;
#0:	if !c1 cmpne	r0, 0 -> c1     ; fflush.c:224
	;;
#0:	if  c1 br	.BB6_2
	;;
	       nop	2
	;;
; BB#1:                                 ; %bb1
#0:	       or	r11, 0 -> r0    ; fflush.c:224
#1:	       callg	___sinit        ; fflush.c:224
	;;                              ; fflush.c:224
	       nop	3               ; fflush.c:224
	;;
.BB6_2:                                 ; %bb2
#0:	       ldm.f	r10, 12         ; fflush.c:226
#1:	       add	r10, 12 -> r0   ; fflush.c:226
	;;
#0:	       ldx	$memhu, r0 -> r0 ; fflush.c:226
	;;
#0:	       cmpeq	r0, 0 -> c1     ; fflush.c:226
	;;
#0:	if  c1 br	.BB6_4          ; fflush.c:226
	;;                              ; fflush.c:226
	       nop	2               ; fflush.c:226
	;;
; BB#3:                                 ; %bb4
#0:	       or	r11, 0 -> r0    ; fflush.c:230
#1:	       callg	___sflush_r     ; fflush.c:230
#2:	       or	r10, 0 -> r1    ; fflush.c:230
	;;                              ; fflush.c:230
	       nop	3               ; fflush.c:230
	;;
#0:	       ldm.s	r14, 16         ; fflush.c:232
#1:	       or	r14, 0 -> r15   ; fflush.c:232
	;;
#0:	       ldx	$mem, 0 -> r11  ; fflush.c:232
#1:	       ldm.s	r14, 20         ; fflush.c:232
	;;
#0:	       ldx	$mem, 0 -> r10  ; fflush.c:232
#1:	       ldm.s	r15, 8          ; fflush.c:232
	;;
#0:	       br	.BB6_5
#1:	       ldx	$mem, 0 -> r1.31 ; fflush.c:232
#2:	       ldm.s	r15, 4          ; fflush.c:232
	;;
#1:	       stx	r1.31 -> $ro    ; fflush.c:232
	;;
#2:	       ldx	$mem, 0 -> r2.31 ; fflush.c:232
	;;
#2:	       stx	r2.31 -> $rb    ; fflush.c:232
	;;
.BB6_4:                                 ; %bb5
#0:	       ldm.s	r14, 16         ; fflush.c:232
#1:	       or	r14, 0 -> r15   ; fflush.c:232
#2:	       ldi	0 -> r0
	;;
#0:	       ldx	$mem, 0 -> r11  ; fflush.c:232
#1:	       ldm.s	r14, 20         ; fflush.c:232
	;;
#0:	       ldx	$mem, 0 -> r10  ; fflush.c:232
#1:	       ldm.s	r15, 8          ; fflush.c:232
	;;
#3:	       ldx	$mem, 0 -> r3.31 ; fflush.c:232
#0:	       ldm.s	r15, 4          ; fflush.c:232
	;;
#3:	       stx	r3.31 -> $ro    ; fflush.c:232
	;;
#0:	       ldx	$mem, 0 -> r0.31 ; fflush.c:232
	;;
#0:	       stx	r0.31 -> $rb    ; fflush.c:232
	;;
.BB6_5:                                 ; %bb5
#0:	       ldm.s	r15, 0          ; fflush.c:232
#1:	       s2add	r15, 6 -> r15   ; fflush.c:232
	;;
#0:	       ret                      ; fflush.c:232
#1:	       ldx	$mem, 0 -> r14  ; fflush.c:232
	;;                              ; fflush.c:232
	       nop	3               ; fflush.c:232
	;;
	.align	4
__fflush_r_end:

	.align	4
__free_r:                               ; @_free_r
	.size	__free_r_end-__free_r
__free_r_start:
; BB#0:                                 ; %entry
#0:	       wb.s	r15, 4          ; mallocr.c:2644
#1:	       ldiu	16 -> r2        ; mallocr.c:2644
#2:	       cmpeq	r1, 0 -> c1     ; mallocr.c:2644
	;;
#0:	if  c1 br	.BB7_6
#3:	       sub	r15, r2 -> r15  ; mallocr.c:2644
#1:	       ldx	$rb, 0 -> r1.31 ; mallocr.c:2644
#2:	       ldx	$ro, 0 -> r2.31 ; mallocr.c:2644
	;;
#0:	       stm.s	r14, r15, 0     ; mallocr.c:2644
#1:	       or	r15, 0 -> r14   ; mallocr.c:2644
	;;
#1:	       stm.s	r1.31, r15, 1   ; mallocr.c:2644
	;;
#2:	       stm.s	r2.31, r15, 2   ; mallocr.c:2644
	;;
; BB#1:                                 ; %bb
#0:	       ldm.f	r1, -4          ; mallocr.c:2650
#1:	       ldi	-2 -> r3
#2:	       ldi	-4 -> r6
#3:	       sub	r1, 8 -> r8     ; mallocr.c:2649
	;;
#0:	       ldx	$mem, 0 -> r2   ; mallocr.c:2650
	;;
#0:	       and	r2, r3 -> r3    ; mallocr.c:2663
	;;
#0:	       sub	r3, 4 -> r4
#1:	       sub	r3, 8 -> r7
	;;
#0:	       add	r1, r4 -> r4
#1:	       add	r1, r7 -> r9    ; mallocr.c:2664
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
#0:	if  c1 br	.BB7_8          ; mallocr.c:2667
	;;                              ; mallocr.c:2667
	       nop	2               ; mallocr.c:2667
	;;
; BB#2:                                 ; %bb1
#0:	       btest	r2, 0 -> c1     ; mallocr.c:2671
#1:	       add	r5, r3 -> r3    ; mallocr.c:2669
	;;
#0:	if  c1 br	.BB7_4
	;;
	       nop	2
	;;
; BB#3:                                 ; %bb2
#0:	       ldm.f	r1, -8          ; mallocr.c:2673
#1:	       ldi	-8 -> r4
	;;
#0:	       ldx	$mem, 0 -> r2   ; mallocr.c:2673
	;;
#0:	       sub	r4, r2 -> r4
#1:	       add	r2, r3 -> r3    ; mallocr.c:2675
	;;
#0:	       add	r1, r4 -> r8    ; mallocr.c:2674
	;;
#0:	       ldm.f	r8, 8           ; mallocr.c:2676
	;;
#0:	       ldx	$mem, 0 -> r4   ; mallocr.c:2676
#1:	       ldm.f	r8, 12          ; mallocr.c:2676
	;;
#0:	       ldx	$mem, 0 -> r5   ; mallocr.c:2676
	;;
#0:	       stm.a	r5, r4, 3       ; mallocr.c:2676
	;;
#0:	       stm.a	r4, r5, 2       ; mallocr.c:2676
	;;
.BB7_4:                                 ; %bb3
#0:	       ldga	131072 -> r1
#2:	       or	r3, 1 -> r2     ; mallocr.c:2679
#1:	       ldga	___malloc_av_ -> r1.16 ; mallocr.c:2680
	;;
#0:	       cmpult	r3, r1 -> c1    ; mallocr.c:2681
#1:	       stm.a	r2, r8, 1       ; mallocr.c:2679
	;;
#0:	if  c1 br	.BB7_6
#1:	       stm.a	r8, r1.16, 2    ; mallocr.c:2680
	;;
	       nop	2
	;;
; BB#5:                                 ; %bb4
#0:	       callg	__malloc_trim_r ; mallocr.c:2682
	;;                              ; mallocr.c:2682
	       nop	3               ; mallocr.c:2682
	;;
#0:	       br	.BB7_40
	;;
	       nop	2
	;;
.BB7_6:                                 ; %bb5
#0:	       or	r14, 0 -> r15   ; mallocr.c:2722
	;;
#0:	       ldm.s	r15, 8          ; mallocr.c:2722
	;;
#1:	       ldx	$mem, 0 -> r1.31 ; mallocr.c:2722
#0:	       ldm.s	r15, 4          ; mallocr.c:2722
	;;
#1:	       stx	r1.31 -> $ro    ; mallocr.c:2722
	;;
#2:	       ldx	$mem, 0 -> r2.31 ; mallocr.c:2722
	;;
#2:	       stx	r2.31 -> $rb    ; mallocr.c:2722
	;;
.BB7_7:                                 ; %bb5
#0:	       ldm.s	r15, 0          ; mallocr.c:2722
#1:	       s2add	r15, 4 -> r15   ; mallocr.c:2722
	;;
#0:	       ret                      ; mallocr.c:2722
#1:	       ldx	$mem, 0 -> r14  ; mallocr.c:2722
	;;                              ; mallocr.c:2722
	       nop	3               ; mallocr.c:2722
	;;
.BB7_8:                                 ; %bb6
#0:	       btest	r2, 0 -> c1     ; mallocr.c:2691
#1:	       stm.a	r5, r4, 0       ; mallocr.c:2687
	;;
#0:	if !c1 br	.BB7_10         ; mallocr.c:2691
	;;                              ; mallocr.c:2691
	       nop	2               ; mallocr.c:2691
	;;
; BB#9:                                 ; %bb6.bb10_crit_edge
#0:	       ldi	0 -> r0
#1:	       br	.BB7_13
#2:	       or	r3, 0 -> r2
	;;
	       nop	2
	;;
.BB7_10:                                ; %bb7
#0:	       ldm.f	r1, -8          ; mallocr.c:2693
#1:	       ldi	-8 -> r2
	;;
#2:	       ldga	___malloc_av_ -> r2.16 ; mallocr.c:2697
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2693
	;;
#0:	       sub	r2, r0 -> r4
#1:	       add	r0, r3 -> r2    ; mallocr.c:2695
	;;
#0:	       add	r1, r4 -> r8    ; mallocr.c:2694
#2:	       add	r2.16, 8 -> r0  ; mallocr.c:2697
	;;
#0:	       ldm.f	r8, 8           ; mallocr.c:2697
	;;
#0:	       ldx	$mem, 0 -> r6   ; mallocr.c:2697
	;;
#0:	       cmpne	r6, r0 -> c1    ; mallocr.c:2697
	;;
#0:	if  c1 br	.BB7_12         ; mallocr.c:2697
	;;                              ; mallocr.c:2697
	       nop	2               ; mallocr.c:2697
	;;
; BB#11:                                ; %bb7.bb10_crit_edge
#0:	       ldi	1 -> r0
#1:	       br	.BB7_13
	;;
	       nop	2
	;;
.BB7_12:                                ; %bb9
#0:	       add	r4, r1 -> r0
	;;
#0:	       ldm.f	r0, 12          ; mallocr.c:2700
#1:	       ldi	0 -> r0
	;;
#0:	       ldx	$mem, 0 -> r4   ; mallocr.c:2700
	;;
#0:	       stm.a	r4, r6, 3       ; mallocr.c:2700
	;;
#0:	       stm.a	r6, r4, 2       ; mallocr.c:2700
	;;
.BB7_13:                                ; %bb10
#0:	       add	r5, r7 -> r4
	;;
#0:	       add	r4, r1 -> r4
	;;
#0:	       ldm.f	r4, 4           ; mallocr.c:2703
#1:	       add	r4, 4 -> r6
	;;
#0:	       ldx	$membu, r6 -> r4 ; mallocr.c:2703
	;;
#0:	       btest	r4, 0 -> c1     ; mallocr.c:2703
	;;
#0:	if  c1 br	.BB7_18
	;;
	       nop	2
	;;
; BB#14:                                ; %bb11
#0:	       cmpne	r0, 0 -> c1     ; mallocr.c:2707
#1:	       add	r1, r3 -> r4
#2:	       add	r2, r5 -> r2    ; mallocr.c:2705
	;;
#0:	if  c1 br	.BB7_17
#1:	       ldm.f	r4, 0           ; mallocr.c:2707
	;;
#0:	       ldx	$mem, 0 -> r4   ; mallocr.c:2707
	;;
	       nop	1
	;;
; BB#15:                                ; %bb11
#3:	       ldga	___malloc_av_ -> r3.16
	;;
#3:	       add	r3.16, 8 -> r5
	;;
#0:	       cmpne	r4, r5 -> c1
	;;
#0:	if  c1 br	.BB7_17
	;;
	       nop	2
	;;
; BB#16:                                ; %bb15.thread
#3:	       stm.a	r8, r3.16, 5    ; mallocr.c:2710
#0:	       or	r2, 1 -> r0     ; mallocr.c:2717
	;;
#3:	       stm.a	r8, r3.16, 4    ; mallocr.c:2710
	;;
#0:	       br	.BB7_40
#1:	       stm.a	r0, r8, 1       ; mallocr.c:2717
#2:	       add	r8, r2 -> r0    ; mallocr.c:2718
	;;
#0:	       stm.a	r5, r8, 3       ; mallocr.c:2710
	;;
#0:	       stm.a	r5, r8, 2       ; mallocr.c:2710
	;;
#0:	       stm.a	r2, r0, 0       ; mallocr.c:2718
	;;
.BB7_17:                                ; %bb14
#0:	       add	r3, r1 -> r1
	;;
#0:	       ldm.f	r1, 4           ; mallocr.c:2713
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:2713
	;;
#0:	       stm.a	r1, r4, 3       ; mallocr.c:2713
	;;
#0:	       stm.a	r4, r1, 2       ; mallocr.c:2713
	;;
.BB7_18:                                ; %bb15
#0:	       or	r2, 1 -> r1     ; mallocr.c:2717
#1:	       cmpne	r0, 0 -> c1     ; mallocr.c:2719
#2:	       add	r8, r2 -> r3    ; mallocr.c:2718
	;;
#0:	if  c1 br	.BB7_6
#1:	       stm.a	r1, r8, 1       ; mallocr.c:2717
	;;
#0:	       stm.a	r2, r3, 0       ; mallocr.c:2718
	;;
	       nop	1
	;;
; BB#19:                                ; %bb16
#0:	       ldi	511 -> r0
	;;
#0:	       cmpult	r0, r2 -> c1    ; mallocr.c:2720
	;;
#0:	if  c1 br	.BB7_21         ; mallocr.c:2720
	;;                              ; mallocr.c:2720
	       nop	2               ; mallocr.c:2720
	;;
; BB#20:                                ; %bb17
#0:	       ldmg.d	___malloc_av_+4 ; mallocr.c:2720
#1:	       ldi	1 -> r0
#2:	       sr	r2, 5 -> r1
	;;
#0:	       sl	r0, r1 -> r0    ; mallocr.c:2720
#1:	       ldi	-8 -> r1
	;;
#0:	       ldx	$mem, 0 -> r3   ; mallocr.c:2720
#1:	       and	r2, r1 -> r2
	;;
#0:	       or	r3, r0 -> r0    ; mallocr.c:2720
#1:	       ldga	___malloc_av_ -> r3 ; mallocr.c:2720
	;;
#0:	       stm.a	r0, r3, 1
#1:	       add	r3, r2 -> r2
	;;
#0:	       ldm.f	r2, 8           ; mallocr.c:2720
	;;
#0:	       br	.BB7_6
#1:	       ldx	$mem, 0 -> r0   ; mallocr.c:2720
#2:	       stm.a	r2, r8, 3       ; mallocr.c:2720
	;;
#0:	       stm.a	r0, r8, 2       ; mallocr.c:2720
	;;
#0:	       stm.a	r8, r2, 2       ; mallocr.c:2720
	;;
#0:	       stm.a	r8, r0, 3       ; mallocr.c:2720
	;;
.BB7_21:                                ; %bb20
#0:	       sr	r2, 9 -> r0     ; mallocr.c:2720
#1:	       ldi	4 -> r1
	;;
#0:	       cmpult	r1, r0 -> c1    ; mallocr.c:2720
	;;
#0:	if  c1 br	.BB7_23         ; mallocr.c:2720
	;;                              ; mallocr.c:2720
	       nop	2               ; mallocr.c:2720
	;;
; BB#22:                                ; %bb21
#0:	       sr	r2, 6 -> r0     ; mallocr.c:2720
#1:	       br	.BB7_32
	;;
#0:	       s2add	r0, 14 -> r0    ; mallocr.c:2720
	;;
	       nop	1
	;;
.BB7_23:                                ; %bb22
#0:	       ldi	20 -> r1
	;;
#0:	       cmpult	r1, r0 -> c1    ; mallocr.c:2720
	;;
#0:	if  c1 br	.BB7_25         ; mallocr.c:2720
	;;                              ; mallocr.c:2720
	       nop	2               ; mallocr.c:2720
	;;
; BB#24:                                ; %bb23
#0:	       ldi	91 -> r1
#1:	       br	.BB7_32
	;;
#0:	       add	r0, r1 -> r0    ; mallocr.c:2720
	;;
	       nop	1
	;;
.BB7_25:                                ; %bb24
#0:	       ldi	84 -> r1
	;;
#0:	       cmpult	r1, r0 -> c1    ; mallocr.c:2720
	;;
#0:	if  c1 br	.BB7_27         ; mallocr.c:2720
	;;                              ; mallocr.c:2720
	       nop	2               ; mallocr.c:2720
	;;
; BB#26:                                ; %bb25
#0:	       sr	r2, 12 -> r0    ; mallocr.c:2720
#1:	       br	.BB7_32
#2:	       ldi	110 -> r1
	;;
#0:	       add	r0, r1 -> r0    ; mallocr.c:2720
	;;
	       nop	1
	;;
.BB7_27:                                ; %bb26
#0:	       ldi	340 -> r1
	;;
#0:	       cmpult	r1, r0 -> c1    ; mallocr.c:2720
	;;
#0:	if  c1 br	.BB7_29         ; mallocr.c:2720
	;;                              ; mallocr.c:2720
	       nop	2               ; mallocr.c:2720
	;;
; BB#28:                                ; %bb27
#0:	       sr	r2, 15 -> r0    ; mallocr.c:2720
#1:	       br	.BB7_32
#2:	       ldi	119 -> r1
	;;
#0:	       add	r0, r1 -> r0    ; mallocr.c:2720
	;;
	       nop	1
	;;
.BB7_29:                                ; %bb28
#0:	       ldiu	1365 -> r1
	;;
#0:	       cmpult	r0, r1 -> c1
	;;
#0:	if  c1 br	.BB7_31         ; mallocr.c:2720
	;;                              ; mallocr.c:2720
	       nop	2               ; mallocr.c:2720
	;;
; BB#30:                                ; %bb28.bb36_crit_edge
#0:	       ldi	126 -> r0
#1:	       br	.BB7_32
	;;
	       nop	2
	;;
.BB7_31:                                ; %bb29
#0:	       sr	r2, 18 -> r0    ; mallocr.c:2720
	;;
#0:	       s2add	r0, 31 -> r0    ; mallocr.c:2720
	;;
.BB7_32:                                ; %bb36
#0:	       ldga	___malloc_av_ -> r1
#1:	       sl	r0, 3 -> r3
	;;
#0:	       add	r1, r3 -> r3
	;;
#0:	       ldm.f	r3, 8           ; mallocr.c:2720
	;;
#0:	       ldx	$mem, 0 -> r4   ; mallocr.c:2720
	;;
#0:	       cmpeq	r4, r3 -> c1    ; mallocr.c:2720
	;;
#0:	if  c1 br	.BB7_34         ; mallocr.c:2720
	;;                              ; mallocr.c:2720
	       nop	2               ; mallocr.c:2720
	;;
; BB#33:                                ; %bb36.bb39_crit_edge
#0:	       ldi	-4 -> r0
#1:	       br	.BB7_36
	;;
	       nop	2
	;;
.BB7_34:                                ; %bb37
#0:	       sra	r0, 31 -> r2    ; mallocr.c:2720
#1:	       ldmg.d	___malloc_av_+4 ; mallocr.c:2720
	;;
#0:	       sr	r2, 30 -> r2    ; mallocr.c:2720
	;;
#0:	       add	r0, r2 -> r0    ; mallocr.c:2720
#1:	       ldi	1 -> r2
#2:	       ldx	$mem, 0 -> r5   ; mallocr.c:2720
	;;
#0:	       br	.BB7_39
#1:	       sra	r0, 2 -> r0     ; mallocr.c:2720
	;;
#0:	       sl	r2, r0 -> r0    ; mallocr.c:2720
	;;
#0:	       or	r0, r5 -> r0    ; mallocr.c:2720
	;;
#0:	       stm.a	r0, r1, 1
	;;
.BB7_35:                                ; %bb38
                                        ;   in Loop: Header=BB7_36 Depth=1
#0:	       ldm.f	r4, 8           ; mallocr.c:2720
	;;
#0:	       ldx	$mem, 0 -> r4   ; mallocr.c:2720
	;;
.BB7_36:                                ; %bb39
                                        ; =>This Inner Loop Header: Depth=1
#0:	       cmpeq	r4, r3 -> c1    ; mallocr.c:2720
	;;
#0:	if  c1 br	.BB7_38
	;;
	       nop	2
	;;
; BB#37:                                ; %bb40
                                        ;   in Loop: Header=BB7_36 Depth=1
#0:	       ldm.f	r4, 4           ; mallocr.c:2720
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:2720
	;;
#0:	       and	r1, r0 -> r1    ; mallocr.c:2720
	;;
#0:	       cmpult	r2, r1 -> c1    ; mallocr.c:2720
	;;
#0:	if  c1 br	.BB7_35         ; mallocr.c:2720
	;;                              ; mallocr.c:2720
	       nop	2               ; mallocr.c:2720
	;;
.BB7_38:                                ; %bb41
#0:	       ldm.f	r4, 12          ; mallocr.c:2720
	;;
#0:	       ldx	$mem, 0 -> r3   ; mallocr.c:2720
	;;
.BB7_39:                                ; %bb42
#0:	       stm.a	r3, r8, 3       ; mallocr.c:2720
	;;
#0:	       stm.a	r4, r8, 2       ; mallocr.c:2720
	;;
#0:	       stm.a	r8, r3, 2       ; mallocr.c:2720
	;;
#0:	       stm.a	r8, r4, 3       ; mallocr.c:2720
	;;
.BB7_40:                                ; %bb42
#0:	       or	r14, 0 -> r15   ; mallocr.c:2722
	;;
#0:	       ldm.s	r15, 8          ; mallocr.c:2722
	;;
#0:	       br	.BB7_7
#3:	       ldx	$mem, 0 -> r3.31 ; mallocr.c:2722
#1:	       ldm.s	r15, 4          ; mallocr.c:2722
	;;
#3:	       stx	r3.31 -> $ro    ; mallocr.c:2722
	;;
#0:	       ldx	$mem, 0 -> r0.31 ; mallocr.c:2722
	;;
#0:	       stx	r0.31 -> $rb    ; mallocr.c:2722
	;;
	.align	4
__free_r_end:

	.align	4
__malloc_trim_r:                        ; @_malloc_trim_r
	.size	__malloc_trim_r_end-__malloc_trim_r
__malloc_trim_r_start:
; BB#0:                                 ; %entry
#0:	       wb.s	r15, 8          ; mallocr.c:3319
#2:	       ldiu	32 -> r4        ; mallocr.c:3319
#1:	       ldx	$rb, 0 -> r1.31 ; mallocr.c:3319
#3:	       ldi	-4 -> r2
	;;
#0:	       sub	r15, r4 -> r15  ; mallocr.c:3319
#2:	       ldx	$ro, 0 -> r2.31 ; mallocr.c:3319
#1:	       ldiu	0 -> r3
	;;
#0:	       ldim	2046 -> r3
	;;
#0:	       stm.s	r14, r15, 0     ; mallocr.c:3319
#1:	       or	r15, 0 -> r14   ; mallocr.c:3319
	;;
#1:	       stm.s	r1.31, r15, 1   ; mallocr.c:3319
	;;
#2:	       stm.s	r2.31, r15, 2   ; mallocr.c:3319
	;;
#0:	       stm.s	r10, r14, 7     ; mallocr.c:3319
	;;
#0:	       stm.s	r11, r14, 6     ; mallocr.c:3319
	;;
#0:	       stm.s	r12, r14, 5     ; mallocr.c:3319
	;;
#0:	       stm.s	r13, r14, 4     ; mallocr.c:3319
	;;
#0:	       ldmg.d	___malloc_av_+8 ; mallocr.c:3319
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:3319
	;;
#0:	       ldm.f	r1, 4           ; mallocr.c:3319
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:3319
	;;
#0:	       and	r1, r2 -> r10   ; mallocr.c:3319
#1:	       ldiu	2047 -> r2
	;;
#0:	       sub	r10, 17 -> r1
#1:	       ldim	1 -> r2
	;;
#0:	       and	r1, r3 -> r11
	;;
#0:	       cmplt	r2, r11 -> c1   ; mallocr.c:3322
	;;
#0:	if  c1 br	.BB8_3          ; mallocr.c:3322
	;;                              ; mallocr.c:3322
	       nop	2               ; mallocr.c:3322
	;;
.BB8_1:                                 ; %bb
#0:	       ldm.s	r14, 16
#1:	       or	r14, 0 -> r15
	;;
#0:	       ldx	$mem, 0 -> r13
#1:	       ldm.s	r14, 20
	;;
#0:	       ldx	$mem, 0 -> r12
#1:	       ldm.s	r14, 24
	;;
#0:	       ldx	$mem, 0 -> r11
#1:	       ldm.s	r14, 28
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
.BB8_2:                                 ; %bb
#0:	       ldm.s	r15, 0
#1:	       s2add	r15, 8 -> r15
	;;
#0:	       ret
#1:	       ldx	$mem, 0 -> r14
	;;
	       nop	3
	;;
.BB8_3:                                 ; %bb1
#0:	       or	r0, 0 -> r12
#1:	       callg	__sbrk_r        ; mallocr.c:3331
#2:	       ldi	0 -> r13
#3:	       ldi	0 -> r1
	;;                              ; mallocr.c:3331
	       nop	3               ; mallocr.c:3331
	;;
#0:	       ldmg.d	___malloc_av_+8 ; mallocr.c:3332
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:3332
	;;
#0:	       add	r1, r10 -> r1   ; mallocr.c:3332
	;;
#0:	       cmpne	r1, r0 -> c1    ; mallocr.c:3332
	;;
#0:	if  c1 br	.BB8_1
	;;
	       nop	2
	;;
; BB#4:                                 ; %bb3
#0:	       sub	r13, r11 -> r1  ; mallocr.c:3340
#1:	       callg	__sbrk_r        ; mallocr.c:3340
#2:	       or	r12, 0 -> r0    ; mallocr.c:3340
	;;                              ; mallocr.c:3340
	       nop	3               ; mallocr.c:3340
	;;
#0:	       cmpne	r0, -1 -> c1    ; mallocr.c:3342
	;;
#0:	if  c1 br	.BB8_7          ; mallocr.c:3342
	;;                              ; mallocr.c:3342
	       nop	2               ; mallocr.c:3342
	;;
; BB#5:                                 ; %bb4
#0:	       ldi	0 -> r1
#1:	       callg	__sbrk_r        ; mallocr.c:3345
#2:	       or	r12, 0 -> r0    ; mallocr.c:3345
	;;                              ; mallocr.c:3345
	       nop	3               ; mallocr.c:3345
	;;
#0:	       ldmg.d	___malloc_av_+8 ; mallocr.c:3346
#1:	       ldi	16 -> r11
	;;
#0:	       ldx	$mem, 0 -> r10  ; mallocr.c:3346
	;;
#0:	       sub	r0, r10 -> r1   ; mallocr.c:3346
	;;
#0:	       cmplt	r1, r11 -> c1   ; mallocr.c:3347
	;;
#0:	if  c1 br	.BB8_1
	;;
	       nop	2
	;;
; BB#6:                                 ; %bb5
#0:	       ldmg.d	___malloc_sbrk_base ; mallocr.c:3349
#1:	       ldga	___malloc_current_mallinfo.0 -> r2 ; mallocr.c:3349
#2:	       or	r14, 0 -> r15
	;;
#0:	       ldx	$mem, 0 -> r11  ; mallocr.c:3349
	;;
#0:	       sub	r0, r11 -> r11  ; mallocr.c:3349
	;;
#0:	       stm.a	r11, r2, 0      ; mallocr.c:3349
#1:	       or	r1, 1 -> r11    ; mallocr.c:3350
	;;
#0:	       stm.a	r11, r10, 1     ; mallocr.c:3350
	;;
#0:	       ldm.s	r14, 16
	;;
#0:	       ldx	$mem, 0 -> r13
#1:	       ldm.s	r14, 20
	;;
#0:	       ldx	$mem, 0 -> r12
#1:	       ldm.s	r14, 24
	;;
#0:	       ldx	$mem, 0 -> r11
#1:	       ldm.s	r14, 28
	;;
#0:	       ldx	$mem, 0 -> r10
#1:	       ldm.s	r15, 8
	;;
#0:	       br	.BB8_2
#1:	       ldx	$mem, 0 -> r1.31
#2:	       ldm.s	r15, 4
	;;
#1:	       stx	r1.31 -> $ro
	;;
#2:	       ldx	$mem, 0 -> r2.31
	;;
#2:	       stx	r2.31 -> $rb
	;;
.BB8_7:                                 ; %bb7
#0:	       ldmg.d	___malloc_av_+8 ; mallocr.c:3360
#1:	       sub	r10, r11 -> r0  ; mallocr.c:3360
	;;
#0:	       or	r0, 1 -> r0     ; mallocr.c:3360
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:3360
	;;
#0:	       stm.a	r0, r1, 1       ; mallocr.c:3360
#1:	       ldga	___malloc_current_mallinfo.0 -> r1 ; mallocr.c:3361
	;;
#0:	       br	.BB8_1
#1:	       ldmg.d	___malloc_current_mallinfo.0 ; mallocr.c:3361
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:3361
	;;
#0:	       sub	r0, r11 -> r0   ; mallocr.c:3361
	;;
#0:	       stm.a	r0, r1, 0       ; mallocr.c:3361
	;;
	.align	4
__malloc_trim_r_end:

	.align	4
__malloc_r:                             ; @_malloc_r
	.size	__malloc_r_end-__malloc_r
__malloc_r_start:
; BB#0:                                 ; %entry
#0:	       wb.s	r15, 12
#2:	       ldiu	48 -> r4
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
#0:	       stm.s	r10, r14, 11
#1:	       ldi	16 -> r10
	;;
#0:	if  c1 or	r1, 0 -> r10
#1:	       stm.s	r11, r14, 10
	;;
#0:	       cmplt	r10, 0 -> c1    ; mallocr.c:2351
#1:	       stm.s	r12, r14, 9
	;;
#0:	if  c1 br	.BB9_2
#1:	       stm.s	r13, r14, 8
	;;
	       nop	2
	;;
; BB#1:                                 ; %entry
#0:	       cmpule	r0, r10 -> c1
	;;
#0:	if  c1 br	.BB9_3
	;;
	       nop	2
	;;
.BB9_2:                                 ; %bb4
#0:	       ldga	_impure_data -> r0 ; mallocr.c:2353
#1:	       br	.BB9_33
	;;
#0:	       stm.a	12, r0, 0       ; mallocr.c:2353
#1:	       ldi	0 -> r0
	;;
	       nop	1
	;;
.BB9_3:                                 ; %bb5
#0:	       ldi	503 -> r0
	;;
#0:	       cmpult	r0, r10 -> c1   ; mallocr.c:2361
	;;
#0:	if  c1 br	.BB9_10         ; mallocr.c:2361
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
#0:	if  c1 br	.BB9_6          ; mallocr.c:2378
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
#0:	       br	.BB9_104
#1:	       ldm.f	r3, 0           ; mallocr.c:2382
	;;
#0:	       ldx	$mem, 0 -> r10  ; mallocr.c:2382
	;;
#0:	       or	r10, 1 -> r10   ; mallocr.c:2382
	;;
#0:	       stm.a	r10, r3, 0      ; mallocr.c:2382
	;;
.BB9_6:                                 ; %bb10
#0:	       add	r3, 2 -> r0     ; mallocr.c:2388
	;;
.BB9_7:                                 ; %bb37
#0:	       ldmg.d	___malloc_av_+16 ; mallocr.c:2423
#1:	       ldga	___malloc_av_ -> r1 ; mallocr.c:2423
	;;
#0:	       add	r1, 8 -> r1     ; mallocr.c:2423
	;;
#0:	       ldx	$mem, 0 -> r2   ; mallocr.c:2423
	;;
#0:	       cmpeq	r2, r1 -> c1    ; mallocr.c:2423
	;;
#0:	if  c1 br	.BB9_58
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
#0:	if  c1 br	.BB9_30
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
#0:	       br	.BB9_104
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
.BB9_10:                                ; %bb11
#0:	       ldi	511 -> r0
	;;
#0:	       cmpult	r0, r10 -> c1   ; mallocr.c:2393
	;;
#0:	if  c1 br	.BB9_12         ; mallocr.c:2393
	;;                              ; mallocr.c:2393
	       nop	2               ; mallocr.c:2393
	;;
; BB#11:                                ; %bb12
#0:	       sr	r10, 3 -> r0    ; mallocr.c:2393
#1:	       br	.BB9_23
	;;
	       nop	2
	;;
.BB9_12:                                ; %bb13
#0:	       sr	r10, 9 -> r0    ; mallocr.c:2393
#1:	       ldi	4 -> r1
	;;
#0:	       cmpult	r1, r0 -> c1    ; mallocr.c:2393
	;;
#0:	if  c1 br	.BB9_14         ; mallocr.c:2393
	;;                              ; mallocr.c:2393
	       nop	2               ; mallocr.c:2393
	;;
; BB#13:                                ; %bb14
#0:	       sr	r10, 6 -> r0    ; mallocr.c:2393
#1:	       br	.BB9_23
	;;
#0:	       s2add	r0, 14 -> r0    ; mallocr.c:2393
	;;
	       nop	1
	;;
.BB9_14:                                ; %bb15
#0:	       ldi	20 -> r1
	;;
#0:	       cmpult	r1, r0 -> c1    ; mallocr.c:2393
	;;
#0:	if  c1 br	.BB9_16         ; mallocr.c:2393
	;;                              ; mallocr.c:2393
	       nop	2               ; mallocr.c:2393
	;;
; BB#15:                                ; %bb16
#0:	       ldi	91 -> r1
#1:	       br	.BB9_23
	;;
#0:	       add	r0, r1 -> r0    ; mallocr.c:2393
	;;
	       nop	1
	;;
.BB9_16:                                ; %bb17
#0:	       ldi	84 -> r1
	;;
#0:	       cmpult	r1, r0 -> c1    ; mallocr.c:2393
	;;
#0:	if  c1 br	.BB9_18         ; mallocr.c:2393
	;;                              ; mallocr.c:2393
	       nop	2               ; mallocr.c:2393
	;;
; BB#17:                                ; %bb18
#0:	       sr	r10, 12 -> r0   ; mallocr.c:2393
#1:	       br	.BB9_23
#2:	       ldi	110 -> r1
	;;
#0:	       add	r0, r1 -> r0    ; mallocr.c:2393
	;;
	       nop	1
	;;
.BB9_18:                                ; %bb19
#0:	       ldi	340 -> r1
	;;
#0:	       cmpult	r1, r0 -> c1    ; mallocr.c:2393
	;;
#0:	if  c1 br	.BB9_20         ; mallocr.c:2393
	;;                              ; mallocr.c:2393
	       nop	2               ; mallocr.c:2393
	;;
; BB#19:                                ; %bb20
#0:	       sr	r10, 15 -> r0   ; mallocr.c:2393
#1:	       br	.BB9_23
#2:	       ldi	119 -> r1
	;;
#0:	       add	r0, r1 -> r0    ; mallocr.c:2393
	;;
	       nop	1
	;;
.BB9_20:                                ; %bb21
#0:	       ldiu	1365 -> r1
	;;
#0:	       cmpult	r0, r1 -> c1
	;;
#0:	if  c1 br	.BB9_22         ; mallocr.c:2393
	;;                              ; mallocr.c:2393
	       nop	2               ; mallocr.c:2393
	;;
; BB#21:                                ; %bb21.bb29_crit_edge
#0:	       ldi	126 -> r0
#1:	       br	.BB9_23
	;;
	       nop	2
	;;
.BB9_22:                                ; %bb22
#0:	       sr	r10, 18 -> r0   ; mallocr.c:2393
	;;
#0:	       s2add	r0, 31 -> r0    ; mallocr.c:2393
	;;
.BB9_23:                                ; %bb29
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
.BB9_24:                                ; %bb35
                                        ; =>This Inner Loop Header: Depth=1
#0:	       or	r2, 0 -> r5
	;;
#0:	       cmpne	r5, r1 -> c1    ; mallocr.c:2396
	;;
#0:	if !c1 br	.BB9_27
	;;
	       nop	2
	;;
; BB#25:                                ; %bb30
                                        ;   in Loop: Header=BB9_24 Depth=1
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
#0:	if  c1 br	.BB9_28         ; mallocr.c:2401
	;;                              ; mallocr.c:2401
	       nop	2               ; mallocr.c:2401
	;;
; BB#26:                                ; %bb31
#0:	       sub	r0, 1 -> r0
	;;
.BB9_27:                                ; %bb36
#0:	       add	r0, 1 -> r0     ; mallocr.c:2417
#1:	       br	.BB9_7
	;;
	       nop	2
	;;
.BB9_28:                                ; %bb32
                                        ;   in Loop: Header=BB9_24 Depth=1
#0:	       cmplt	r7, 0 -> c1     ; mallocr.c:2407
#1:	       ldm.f	r5, 12          ; mallocr.c:2409
	;;
#0:	if  c1 br	.BB9_24
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
#0:	       br	.BB9_32
#1:	       stm.a	r0, r2, 2       ; mallocr.c:2409
#2:	       add	r5, 8 -> r0     ; mallocr.c:2409
	;;
#0:	       ldm.f	r1, 4           ; mallocr.c:2410
	;;
#0:	       ldx	$mem, 0 -> r2   ; mallocr.c:2410
	;;
#0:	       or	r2, 1 -> r2     ; mallocr.c:2410
	;;
.BB9_30:                                ; %bb40
#1:	       ldga	___malloc_av_ -> r1.16 ; mallocr.c:2440
#0:	       cmplt	r4, 0 -> c1     ; mallocr.c:2442
	;;
#0:	if  c1 br	.BB9_35         ; mallocr.c:2442
#1:	       add	r1.16, 8 -> r5  ; mallocr.c:2440
	;;
#1:	       stm.a	r5, r1.16, 5    ; mallocr.c:2440
	;;
#1:	       stm.a	r5, r1.16, 4    ; mallocr.c:2440
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
.BB9_32:                                ; %bb41
#0:	       stm.a	r2, r1, 1       ; mallocr.c:2444
	;;
.BB9_33:                                ; %bb41
#0:	       ldm.s	r14, 32         ; mallocr.c:2590
#1:	       or	r14, 0 -> r15   ; mallocr.c:2590
	;;
#0:	       ldx	$mem, 0 -> r13  ; mallocr.c:2590
#1:	       ldm.s	r14, 36         ; mallocr.c:2590
	;;
#0:	       ldx	$mem, 0 -> r12  ; mallocr.c:2590
#1:	       ldm.s	r14, 40         ; mallocr.c:2590
	;;
#0:	       ldx	$mem, 0 -> r11  ; mallocr.c:2590
#1:	       ldm.s	r14, 44         ; mallocr.c:2590
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
.BB9_34:                                ; %bb41
#0:	       ldm.s	r15, 0          ; mallocr.c:2590
#1:	       s2add	r15, 12 -> r15  ; mallocr.c:2590
	;;
#0:	       ret                      ; mallocr.c:2590
#1:	       ldx	$mem, 0 -> r14  ; mallocr.c:2590
	;;                              ; mallocr.c:2590
	       nop	3               ; mallocr.c:2590
	;;
.BB9_35:                                ; %bb42
#0:	       ldi	511 -> r4
	;;
#0:	       cmpult	r4, r3 -> c1    ; mallocr.c:2452
	;;
#0:	if  c1 br	.BB9_37         ; mallocr.c:2452
	;;                              ; mallocr.c:2452
	       nop	2               ; mallocr.c:2452
	;;
; BB#36:                                ; %bb43
#1:	       ldmg.d	___malloc_av_+4 ; mallocr.c:2452
#2:	       ldi	1 -> r3
#3:	       sr	r1, 5 -> r4
#0:	       ldga	___malloc_av_ -> r0.16 ; mallocr.c:2452
	;;
#0:	       sl	r3, r4 -> r3    ; mallocr.c:2452
#1:	       ldi	-8 -> r4
	;;
#0:	       ldx	$mem, 0 -> r5   ; mallocr.c:2452
#1:	       and	r1, r4 -> r1
	;;
#1:	       or	r5, r3 -> r3    ; mallocr.c:2452
#0:	       add	r0.16, r1 -> r1
	;;
#0:	       stm.a	r3, r0.16, 1
	;;
#0:	       ldm.f	r1, 8           ; mallocr.c:2452
	;;
#0:	       br	.BB9_58
#1:	       ldx	$mem, 0 -> r3   ; mallocr.c:2452
#2:	       stm.a	r1, r2, 3       ; mallocr.c:2452
	;;
#0:	       stm.a	r3, r2, 2       ; mallocr.c:2452
	;;
#0:	       stm.a	r2, r1, 2       ; mallocr.c:2452
	;;
#0:	       stm.a	r2, r3, 3       ; mallocr.c:2452
	;;
.BB9_37:                                ; %bb44
#0:	       cmpult	r4, r1 -> c1    ; mallocr.c:2452
	;;
#0:	if  c1 br	.BB9_39         ; mallocr.c:2452
	;;                              ; mallocr.c:2452
	       nop	2               ; mallocr.c:2452
	;;
; BB#38:                                ; %bb45
#0:	       sr	r1, 3 -> r1     ; mallocr.c:2452
#1:	       br	.BB9_50
	;;
	       nop	2
	;;
.BB9_39:                                ; %bb46
#0:	       sr	r1, 9 -> r4     ; mallocr.c:2452
#1:	       ldi	4 -> r5
	;;
#0:	       cmpult	r5, r4 -> c1    ; mallocr.c:2452
	;;
#0:	if  c1 br	.BB9_41         ; mallocr.c:2452
	;;                              ; mallocr.c:2452
	       nop	2               ; mallocr.c:2452
	;;
; BB#40:                                ; %bb47
#0:	       sr	r1, 6 -> r1     ; mallocr.c:2452
#1:	       br	.BB9_50
	;;
#0:	       s2add	r1, 14 -> r1    ; mallocr.c:2452
	;;
	       nop	1
	;;
.BB9_41:                                ; %bb48
#0:	       ldi	20 -> r5
	;;
#0:	       cmpult	r5, r4 -> c1    ; mallocr.c:2452
	;;
#0:	if  c1 br	.BB9_43         ; mallocr.c:2452
	;;                              ; mallocr.c:2452
	       nop	2               ; mallocr.c:2452
	;;
; BB#42:                                ; %bb49
#0:	       ldi	91 -> r1
#1:	       br	.BB9_50
	;;
#0:	       add	r4, r1 -> r1    ; mallocr.c:2452
	;;
	       nop	1
	;;
.BB9_43:                                ; %bb50
#0:	       ldi	84 -> r5
	;;
#0:	       cmpult	r5, r4 -> c1    ; mallocr.c:2452
	;;
#0:	if  c1 br	.BB9_45         ; mallocr.c:2452
	;;                              ; mallocr.c:2452
	       nop	2               ; mallocr.c:2452
	;;
; BB#44:                                ; %bb51
#0:	       sr	r1, 12 -> r1    ; mallocr.c:2452
#1:	       br	.BB9_50
#2:	       ldi	110 -> r4
	;;
#0:	       add	r1, r4 -> r1    ; mallocr.c:2452
	;;
	       nop	1
	;;
.BB9_45:                                ; %bb52
#0:	       ldi	340 -> r5
	;;
#0:	       cmpult	r5, r4 -> c1    ; mallocr.c:2452
	;;
#0:	if  c1 br	.BB9_47         ; mallocr.c:2452
	;;                              ; mallocr.c:2452
	       nop	2               ; mallocr.c:2452
	;;
; BB#46:                                ; %bb53
#0:	       sr	r1, 15 -> r1    ; mallocr.c:2452
#1:	       br	.BB9_50
#2:	       ldi	119 -> r4
	;;
#0:	       add	r1, r4 -> r1    ; mallocr.c:2452
	;;
	       nop	1
	;;
.BB9_47:                                ; %bb54
#0:	       ldiu	1365 -> r5
	;;
#0:	       cmpult	r4, r5 -> c1
	;;
#0:	if  c1 br	.BB9_49         ; mallocr.c:2452
	;;                              ; mallocr.c:2452
	       nop	2               ; mallocr.c:2452
	;;
; BB#48:                                ; %bb54.bb62_crit_edge
#0:	       ldi	126 -> r1
#1:	       br	.BB9_50
	;;
	       nop	2
	;;
.BB9_49:                                ; %bb55
#0:	       sr	r1, 18 -> r1    ; mallocr.c:2452
	;;
#0:	       s2add	r1, 31 -> r1    ; mallocr.c:2452
	;;
.BB9_50:                                ; %bb62
#2:	       ldga	___malloc_av_ -> r2.16
#0:	       sl	r1, 3 -> r4
	;;
#2:	       add	r2.16, r4 -> r4
	;;
#0:	       ldm.f	r4, 8           ; mallocr.c:2452
	;;
#0:	       ldx	$mem, 0 -> r5   ; mallocr.c:2452
	;;
#0:	       cmpeq	r5, r4 -> c1    ; mallocr.c:2452
	;;
#0:	if  c1 br	.BB9_52         ; mallocr.c:2452
	;;                              ; mallocr.c:2452
	       nop	2               ; mallocr.c:2452
	;;
; BB#51:                                ; %bb62.bb65_crit_edge
#0:	       ldi	-4 -> r1
#1:	       br	.BB9_54
	;;
	       nop	2
	;;
.BB9_52:                                ; %bb63
#0:	       sra	r1, 31 -> r3    ; mallocr.c:2452
#1:	       ldmg.d	___malloc_av_+4 ; mallocr.c:2452
	;;
#0:	       sr	r3, 30 -> r3    ; mallocr.c:2452
	;;
#0:	       add	r1, r3 -> r1    ; mallocr.c:2452
#1:	       ldi	1 -> r3
#2:	       ldx	$mem, 0 -> r6   ; mallocr.c:2452
	;;
#0:	       br	.BB9_57
#1:	       sra	r1, 2 -> r1     ; mallocr.c:2452
	;;
#0:	       sl	r3, r1 -> r1    ; mallocr.c:2452
	;;
#0:	       or	r1, r6 -> r1    ; mallocr.c:2452
	;;
#2:	       stm.a	r1, r2.16, 1
	;;
.BB9_53:                                ; %bb64
                                        ;   in Loop: Header=BB9_54 Depth=1
#0:	       ldm.f	r5, 8           ; mallocr.c:2452
	;;
#0:	       ldx	$mem, 0 -> r5   ; mallocr.c:2452
	;;
.BB9_54:                                ; %bb65
                                        ; =>This Inner Loop Header: Depth=1
#0:	       cmpeq	r5, r4 -> c1    ; mallocr.c:2452
	;;
#0:	if  c1 br	.BB9_56
	;;
	       nop	2
	;;
; BB#55:                                ; %bb66
                                        ;   in Loop: Header=BB9_54 Depth=1
#0:	       ldm.f	r5, 4           ; mallocr.c:2452
	;;
#0:	       ldx	$mem, 0 -> r6   ; mallocr.c:2452
	;;
#0:	       and	r6, r1 -> r6    ; mallocr.c:2452
	;;
#0:	       cmpult	r3, r6 -> c1    ; mallocr.c:2452
	;;
#0:	if  c1 br	.BB9_53         ; mallocr.c:2452
	;;                              ; mallocr.c:2452
	       nop	2               ; mallocr.c:2452
	;;
.BB9_56:                                ; %bb67
#0:	       ldm.f	r5, 12          ; mallocr.c:2452
	;;
#0:	       ldx	$mem, 0 -> r4   ; mallocr.c:2452
	;;
.BB9_57:                                ; %bb68
#0:	       stm.a	r4, r2, 3       ; mallocr.c:2452
	;;
#0:	       stm.a	r5, r2, 2       ; mallocr.c:2452
	;;
#0:	       stm.a	r2, r4, 2       ; mallocr.c:2452
	;;
#0:	       stm.a	r2, r5, 3       ; mallocr.c:2452
	;;
.BB9_58:                                ; %bb69
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
#0:	if  c1 br	.BB9_78
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
#0:	if !c1 br	.BB9_61
	;;
	       nop	2
	;;
.BB9_60:                                ; %bb72
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sl	r1, 1 -> r1
#1:	       add	r0, 4 -> r0
	;;
#0:	       and	r2, r1 -> r3    ; mallocr.c:2470
	;;
#0:	       cmpeq	r3, 0 -> c1     ; mallocr.c:2470
	;;
#0:	if  c1 br	.BB9_60         ; mallocr.c:2470
	;;                              ; mallocr.c:2470
	       nop	2               ; mallocr.c:2470
	;;
.BB9_61:                                ; %bb72.bb74_crit_edge
#0:	       or	r2, 0 -> r3
	;;
.BB9_62:                                ; %bb74
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB9_76 Depth 2
                                        ;     Child Loop BB9_71 Depth 2
                                        ;     Child Loop BB9_63 Depth 2
                                        ;       Child Loop BB9_64 Depth 3
#2:	       ldga	___malloc_av_ -> r2.16
#0:	       sl	r0, 3 -> r4
#1:	       add	r0, 1 -> r5
#3:	       ldi	-4 -> r7
	;;
#2:	       add	r2.16, r4 -> r6
#0:	       ldi	16 -> r8
	;;
.BB9_63:                                ; %bb75
                                        ;   Parent Loop BB9_62 Depth=1
                                        ; =>  This Loop Header: Depth=2
                                        ;       Child Loop BB9_64 Depth 3
#0:	       or	r6, 0 -> r9
	;;
.BB9_64:                                ; %bb81
                                        ;   Parent Loop BB9_62 Depth=1
                                        ;     Parent Loop BB9_63 Depth=2
                                        ; =>    This Inner Loop Header: Depth=3
#0:	       ldm.f	r9, 12
	;;
#0:	       ldx	$mem, 0 -> r9
	;;
#0:	       cmpne	r6, r9 -> c1    ; mallocr.c:2488
	;;
#0:	if !c1 br	.BB9_69
	;;
	       nop	2
	;;
; BB#65:                                ; %bb76
                                        ;   in Loop: Header=BB9_64 Depth=3
#0:	       ldm.f	r9, 4           ; mallocr.c:2490
	;;
#3:	       ldx	$mem, 0 -> r3.16 ; mallocr.c:2490
	;;
#3:	       and	r3.16, r7 -> r11 ; mallocr.c:2490
	;;
#0:	       sub	r11, r10 -> r12 ; mallocr.c:2491
	;;
#0:	       cmplt	r12, r8 -> c1   ; mallocr.c:2493
	;;
#0:	if  c1 br	.BB9_67         ; mallocr.c:2493
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
#0:	       br	.BB9_104
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
.BB9_67:                                ; %bb78
                                        ;   in Loop: Header=BB9_64 Depth=3
#0:	       cmplt	r12, 0 -> c1    ; mallocr.c:2506
	;;
#0:	if  c1 br	.BB9_64
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
#0:	       br	.BB9_33
#1:	       ldx	$mem, 0 -> r1   ; mallocr.c:2509
#2:	       ldm.f	r9, 12          ; mallocr.c:2509
	;;
#0:	       ldx	$mem, 0 -> r2   ; mallocr.c:2509
	;;
#0:	       stm.a	r2, r1, 3       ; mallocr.c:2509
	;;
#0:	       stm.a	r1, r2, 2       ; mallocr.c:2509
	;;
.BB9_69:                                ; %bb82
                                        ;   in Loop: Header=BB9_63 Depth=2
#0:	       add	r5, 1 -> r9
#1:	       and	r5, 3 -> r5     ; mallocr.c:2526
#2:	       add	r6, 8 -> r6
	;;
#0:	       cmpne	r5, 0 -> c1     ; mallocr.c:2526
#1:	       or	r9, 0 -> r5
	;;
#0:	if  c1 br	.BB9_63
	;;
	       nop	2
	;;
; BB#70:                                ; %bb83.loopexit
                                        ;   in Loop: Header=BB9_62 Depth=1
#2:	       ldga	___malloc_av_ -> r2.16
#0:	       sub	r9, 1 -> r5
	;;
#2:	       add	r2.16, r4 -> r4
	;;
.BB9_71:                                ; %bb83
                                        ;   Parent Loop BB9_62 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       and	r0, 3 -> r6     ; mallocr.c:2532
	;;
#0:	       cmpne	r6, 0 -> c1     ; mallocr.c:2532
	;;
#0:	if  c1 br	.BB9_73         ; mallocr.c:2532
	;;                              ; mallocr.c:2532
	       nop	2               ; mallocr.c:2532
	;;
; BB#72:                                ; %bb84
                                        ;   in Loop: Header=BB9_62 Depth=1
#0:	       xor	r1, -1 -> r0    ; mallocr.c:2534
#1:	       br	.BB9_74
	;;
#0:	       and	r3, r0 -> r2    ; mallocr.c:2534
#1:	       ldga	___malloc_av_ -> r0
	;;
#0:	       stm.a	r2, r0, 1
#1:	       or	r2, 0 -> r3
	;;
	       nop	0
	;;
.BB9_73:                                ; %bb86
                                        ;   in Loop: Header=BB9_71 Depth=2
#0:	       ldm.f	r4, 0           ; mallocr.c:2539
#1:	       sub	r4, 8 -> r6
#2:	       sub	r0, 1 -> r0
	;;
#0:	       ldx	$mem, 0 -> r4   ; mallocr.c:2539
	;;
#0:	       cmpeq	r6, r4 -> c1    ; mallocr.c:2539
#1:	       or	r6, 0 -> r4
	;;
#0:	if  c1 br	.BB9_71
	;;
	       nop	2
	;;
.BB9_74:                                ; %bb87
                                        ;   in Loop: Header=BB9_62 Depth=1
#0:	       sl	r1, 1 -> r1     ; mallocr.c:2543
	;;
#0:	       cmpult	r3, r1 -> c1    ; mallocr.c:2543
	;;
#0:	if !c1 cmpeq	r1, 0 -> c1
	;;
#0:	if  c1 br	.BB9_78
	;;
	       nop	2
	;;
; BB#75:                                ; %bb90.preheader
                                        ;   in Loop: Header=BB9_62 Depth=1
#0:	       and	r3, r1 -> r0    ; mallocr.c:2545
	;;
#0:	       cmpne	r0, 0 -> c1     ; mallocr.c:2545
#1:	       or	r5, 0 -> r0
	;;
#0:	if  c1 br	.BB9_62
	;;
	       nop	2
	;;
.BB9_76:                                ; %bb89
                                        ;   Parent Loop BB9_62 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       sl	r1, 1 -> r1     ; mallocr.c:2548
#1:	       add	r5, 4 -> r5
	;;
#0:	       and	r2, r1 -> r0    ; mallocr.c:2545
	;;
#0:	       cmpeq	r0, 0 -> c1     ; mallocr.c:2545
	;;
#0:	if  c1 br	.BB9_76
	;;
	       nop	2
	;;
; BB#77:                                ;   in Loop: Header=BB9_62 Depth=1
#0:	       or	r2, 0 -> r3
#1:	       br	.BB9_62
#2:	       or	r5, 0 -> r0
	;;
	       nop	2
	;;
.BB9_78:                                ; %bb91
#0:	       ldmg.d	___malloc_av_+8 ; mallocr.c:2560
#1:	       ldi	-4 -> r1
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2560
	;;
#0:	       stm.s	r0, r14, 7
	;;
#0:	       ldm.f	r0, 4           ; mallocr.c:2560
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2560
	;;
#0:	       and	r0, r1 -> r0    ; mallocr.c:2560
	;;
#0:	       cmpult	r0, r10 -> c1   ; mallocr.c:2561
#1:	       stm.s	r0, r14, 6      ; mallocr.c:2561
	;;
#0:	if !c1 sub	r0, r10 -> r0   ; mallocr.c:2560
#1:	if !c1 ldi	16 -> r1
	;;
#0:	if !c1 cmplt	r0, r1 -> c1
	;;
#0:	if !c1 br	.BB9_105
	;;
	       nop	2
	;;
; BB#79:                                ; %bb93
#0:	       ldmg.d	___malloc_sbrk_base ; mallocr.c:2162[ mallocr.c:2575 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2162[ mallocr.c:2575 ]
#1:	       ldm.s	r14, 28         ; mallocr.c:2151[ mallocr.c:2575 ]
	;;
#0:	       cmpne	r0, -1 -> c1    ; mallocr.c:2162[ mallocr.c:2575 ]
	;;
#0:	if  c1 br	.BB9_81         ; mallocr.c:2162[ mallocr.c:2575 ]
#1:	       ldx	$mem, 0 -> r2   ; mallocr.c:2151[ mallocr.c:2575 ]
#2:	       ldm.s	r14, 24         ; mallocr.c:2151[ mallocr.c:2575 ]
#3:	       ldx	$c1, 0 -> r0    ; mallocr.c:2162[ mallocr.c:2575 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:2151[ mallocr.c:2575 ]
#1:	       stm.s	r0, r14, 4      ; mallocr.c:2162[ mallocr.c:2575 ]
	;;
#0:	       add	r2, r1 -> r11   ; mallocr.c:2151[ mallocr.c:2575 ]
	;;                              ; mallocr.c:2162[ mallocr.c:2575 ]
	       nop	0               ; mallocr.c:2162[ mallocr.c:2575 ]
	;;
; BB#80:                                ; %bb93.bb1.i_crit_edge
#0:	       add	r10, 16 -> r0   ; mallocr.c:2155[ mallocr.c:2575 ]
#1:	       br	.BB9_82
	;;
	       nop	2
	;;
.BB9_81:                                ; %bb.i
#0:	       ldiu	15 -> r0
#1:	       ldiu	0 -> r1
	;;
#0:	       ldim	2 -> r0
#1:	       ldim	2046 -> r1
	;;
#0:	       add	r10, r0 -> r0
	;;
#0:	       and	r0, r1 -> r0    ; mallocr.c:2163[ mallocr.c:2575 ]
	;;
.BB9_82:                                ; %bb.i
#0:	       stm.s	r0, r14, 5
#1:	       ldga	_impure_data -> r0 ; mallocr.c:2165[ mallocr.c:2575 ]
	;;
#0:	       ldm.s	r14, 20         ; mallocr.c:2165[ mallocr.c:2575 ]
	;;
#0:	       callg	__sbrk_r        ; mallocr.c:2165[ mallocr.c:2575 ]
#1:	       ldx	$mem, 0 -> r1   ; mallocr.c:2165[ mallocr.c:2575 ]
	;;                              ; mallocr.c:2165[ mallocr.c:2575 ]
	       nop	3               ; mallocr.c:2165[ mallocr.c:2575 ]
	;;
#0:	       cmpeq	r0, -1 -> c1    ; mallocr.c:2168[ mallocr.c:2575 ]
	;;
#0:	if  c1 br	.BB9_102
	;;
	       nop	2
	;;
; BB#83:                                ; %bb2.i
#0:	       cmpule	r11, r0 -> c1
	;;
#0:	if  c1 br	.BB9_85
	;;
	       nop	2
	;;
; BB#84:                                ; %bb2.i
#0:	       ldm.s	r14, 28
#1:	       ldga	___malloc_av_ -> r1
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       cmpne	r2, r1 -> c1
	;;
#0:	if  c1 br	.BB9_102
	;;
	       nop	2
	;;
.BB9_85:                                ; %bb4.i
#0:	       ldmg.d	___malloc_current_mallinfo.0 ; mallocr.c:2172[ mallocr.c:2575 ]
#1:	       cmpne	r0, r11 -> c1   ; mallocr.c:2174[ mallocr.c:2575 ]
#2:	       ldga	___malloc_current_mallinfo.0 -> r2 ; mallocr.c:2172[ mallocr.c:2575 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:2172[ mallocr.c:2575 ]
#1:	       ldm.s	r14, 20         ; mallocr.c:2172[ mallocr.c:2575 ]
	;;
#0:	       ldx	$mem, 0 -> r3   ; mallocr.c:2172[ mallocr.c:2575 ]
	;;
#0:	       add	r1, r3 -> r12   ; mallocr.c:2172[ mallocr.c:2575 ]
#1:	if !c1 ldiu	2047 -> r1
	;;
#0:	if !c1 ldim	1 -> r1
#1:	       stm.a	r12, r2, 0      ; mallocr.c:2172[ mallocr.c:2575 ]
	;;
#0:	if !c1 and	r11, r1 -> r1   ; mallocr.c:2174[ mallocr.c:2575 ]
	;;
#0:	if !c1 cmpne	r1, 0 -> c1     ; mallocr.c:2174[ mallocr.c:2575 ]
	;;
#0:	if  c1 br	.BB9_87
	;;
	       nop	2
	;;
; BB#86:                                ; %bb6.i
#0:	       ldm.s	r14, 24         ; mallocr.c:2178[ mallocr.c:2575 ]
#1:	       or	r3, 0 -> r11    ; mallocr.c:2178[ mallocr.c:2575 ]
	;;
#0:	       br	.BB9_98
#1:	       ldx	$mem, 0 -> r0   ; mallocr.c:2178[ mallocr.c:2575 ]
#2:	       ldmg.d	___malloc_av_+8 ; mallocr.c:2179[ mallocr.c:2575 ]
	;;
#0:	       add	r11, r0 -> r0   ; mallocr.c:2178[ mallocr.c:2575 ]
	;;
#0:	       ldx	$mem, 0 -> r11  ; mallocr.c:2179[ mallocr.c:2575 ]
#1:	       or	r0, 1 -> r0     ; mallocr.c:2179[ mallocr.c:2575 ]
	;;
#0:	       stm.a	r0, r11, 1      ; mallocr.c:2179[ mallocr.c:2575 ]
	;;
.BB9_87:                                ; %bb7.i
#0:	       ldm.s	r14, 16         ; mallocr.c:2183[ mallocr.c:2575 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:2183[ mallocr.c:2575 ]
	;;
#0:	       stx	r1 -> $c1       ; mallocr.c:2183[ mallocr.c:2575 ]
	;;
#0:	if  c1 br	.BB9_89         ; mallocr.c:2183[ mallocr.c:2575 ]
	;;                              ; mallocr.c:2183[ mallocr.c:2575 ]
	       nop	2               ; mallocr.c:2183[ mallocr.c:2575 ]
	;;
; BB#88:                                ; %bb8.i
#0:	       ldga	___malloc_sbrk_base -> r1 ; mallocr.c:2184[ mallocr.c:2575 ]
#1:	       br	.BB9_90
	;;
#0:	       stm.a	r0, r1, 0       ; mallocr.c:2184[ mallocr.c:2575 ]
	;;
	       nop	1
	;;
.BB9_89:                                ; %bb9.i
#0:	       sub	r0, r11 -> r1
	;;
#0:	       add	r1, r12 -> r12  ; mallocr.c:2186[ mallocr.c:2575 ]
#1:	       ldga	___malloc_current_mallinfo.0 -> r1 ; mallocr.c:2186[ mallocr.c:2575 ]
	;;
#0:	       stm.a	r12, r1, 0      ; mallocr.c:2186[ mallocr.c:2575 ]
	;;
.BB9_90:                                ; %bb10.i
#0:	       add	r0, 8 -> r1     ; mallocr.c:2189[ mallocr.c:2575 ]
	;;
#0:	       and	r1, 7 -> r1     ; mallocr.c:2189[ mallocr.c:2575 ]
	;;
#0:	       cmpne	r1, 0 -> c1     ; mallocr.c:2190[ mallocr.c:2575 ]
	;;
#0:	if  c1 br	.BB9_92         ; mallocr.c:2190[ mallocr.c:2575 ]
	;;                              ; mallocr.c:2190[ mallocr.c:2575 ]
	       nop	2               ; mallocr.c:2190[ mallocr.c:2575 ]
	;;
; BB#91:                                ; %bb10.i.bb13.i_crit_edge
#0:	       ldi	0 -> r1
#1:	       br	.BB9_93
#2:	       or	r0, 0 -> r11
	;;
	       nop	2
	;;
.BB9_92:                                ; %bb11.i
#0:	       ldi	8 -> r11
	;;
#0:	       sub	r11, r1 -> r1   ; mallocr.c:2192[ mallocr.c:2575 ]
	;;
#0:	       add	r0, r1 -> r11   ; mallocr.c:2193[ mallocr.c:2575 ]
	;;
.BB9_93:                                ; %bb13.i
#0:	       ldm.s	r14, 20         ; mallocr.c:2199[ mallocr.c:2575 ]
#1:	       ldiu	2047 -> r0
#2:	       ldga	4096 -> r3
	;;
#0:	       ldim	1 -> r0
	;;
#0:	       ldx	$mem, 0 -> r2   ; mallocr.c:2199[ mallocr.c:2575 ]
	;;
#0:	       callg	__sbrk_r        ; mallocr.c:2202[ mallocr.c:2575 ]
#1:	       add	r11, r2 -> r2   ; mallocr.c:2199[ mallocr.c:2575 ]
	;;
#0:	       and	r2, r0 -> r0    ; mallocr.c:2199[ mallocr.c:2575 ]
	;;
#0:	       sub	r3, r0 -> r2    ; mallocr.c:2199[ mallocr.c:2575 ]
#1:	       ldga	_impure_data -> r0 ; mallocr.c:2202[ mallocr.c:2575 ]
	;;
#0:	       add	r2, r1 -> r13   ; mallocr.c:2199[ mallocr.c:2575 ]
	;;
#0:	       or	r13, 0 -> r1    ; mallocr.c:2202[ mallocr.c:2575 ]
	;;
#0:	       cmpeq	r0, -1 -> c1    ; mallocr.c:2203[ mallocr.c:2575 ]
#1:	       ldi	0 -> r1
#2:	       ldga	___malloc_av_ -> r2
	;;
#0:	if  c1 or	r1, 0 -> r13
#1:	       ldga	___malloc_current_mallinfo.0 -> r1 ; mallocr.c:2210[ mallocr.c:2575 ]
#2:	if  c1 or	r11, 0 -> r0
	;;
#0:	       add	r13, r12 -> r12 ; mallocr.c:2210[ mallocr.c:2575 ]
#1:	       sub	r0, r11 -> r0
	;;
#0:	       stm.a	r12, r1, 0      ; mallocr.c:2210[ mallocr.c:2575 ]
#1:	       add	r0, r13 -> r0   ; mallocr.c:2213[ mallocr.c:2575 ]
	;;
#0:	       stm.a	r11, r2, 2      ; mallocr.c:2212[ mallocr.c:2575 ]
#1:	       or	r0, 1 -> r0     ; mallocr.c:2214[ mallocr.c:2575 ]
	;;
#0:	       ldm.s	r14, 28         ; mallocr.c:2216[ mallocr.c:2575 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:2216[ mallocr.c:2575 ]
#1:	       stm.a	r0, r11, 1      ; mallocr.c:2214[ mallocr.c:2575 ]
	;;
#0:	       cmpne	r1, r2 -> c1    ; mallocr.c:2216[ mallocr.c:2575 ]
	;;
#0:	if !c1 br	.BB9_98
	;;
	       nop	2
	;;
; BB#94:                                ; %bb16.i
#0:	       ldm.s	r14, 24         ; mallocr.c:2223[ mallocr.c:2575 ]
#1:	       ldi	15 -> r0
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:2223[ mallocr.c:2575 ]
	;;
#0:	       cmpult	r0, r1 -> c1    ; mallocr.c:2223[ mallocr.c:2575 ]
	;;
#0:	if  c1 br	.BB9_96         ; mallocr.c:2223[ mallocr.c:2575 ]
	;;                              ; mallocr.c:2223[ mallocr.c:2575 ]
	       nop	2               ; mallocr.c:2223[ mallocr.c:2575 ]
	;;
; BB#95:                                ; %bb17.i
#0:	       ldmg.d	___malloc_av_+8 ; mallocr.c:2225[ mallocr.c:2575 ]
#1:	       br	.BB9_102
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2225[ mallocr.c:2575 ]
	;;
#0:	       stm.a	1, r0, 1        ; mallocr.c:2225[ mallocr.c:2575 ]
	;;
	       nop	0
	;;
.BB9_96:                                ; %bb18.i
#0:	       ldm.s	r14, 28         ; mallocr.c:2231[ mallocr.c:2575 ]
#1:	       ldi	-8 -> r3
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2231[ mallocr.c:2575 ]
	;;
#0:	       ldm.f	r0, 4           ; mallocr.c:2231[ mallocr.c:2575 ]
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:2231[ mallocr.c:2575 ]
#1:	       ldm.s	r14, 24
	;;
#0:	       and	r1, 1 -> r1     ; mallocr.c:2231[ mallocr.c:2575 ]
	;;
#0:	       ldx	$mem, 0 -> r2
	;;
#0:	       sub	r2, 12 -> r2
	;;
#0:	       and	r2, r3 -> r3    ; mallocr.c:2230[ mallocr.c:2575 ]
#1:	       or	r2, 4 -> r2
	;;
#0:	       or	r1, r3 -> r1    ; mallocr.c:2231[ mallocr.c:2575 ]
#1:	       add	r0, r2 -> r2
#2:	       cmpult	r3, 16 -> c1    ; mallocr.c:2237[ mallocr.c:2575 ]
	;;
#0:	if  c1 br	.BB9_98
#1:	       stm.a	r1, r0, 1       ; mallocr.c:2231[ mallocr.c:2575 ]
	;;
#0:	       stm.a	5, r2, 0        ; mallocr.c:2232[ mallocr.c:2575 ]
	;;
#0:	       stm.a	5, r2, 1        ; mallocr.c:2234[ mallocr.c:2575 ]
	;;
	       nop	0
	;;
; BB#97:                                ; %bb19.i
#0:	       ldm.s	r14, 28
#1:	       ldga	_impure_data -> r0 ; mallocr.c:2238[ mallocr.c:2575 ]
	;;
#0:	       callg	__free_r        ; mallocr.c:2238[ mallocr.c:2575 ]
#1:	       ldx	$mem, 0 -> r12
	;;
#0:	       add	r12, 8 -> r1
	;;                              ; mallocr.c:2238[ mallocr.c:2575 ]
	       nop	2               ; mallocr.c:2238[ mallocr.c:2575 ]
	;;
#0:	       ldmg.d	___malloc_current_mallinfo.0
	;;
#0:	       ldx	$mem, 0 -> r12
	;;
.BB9_98:                                ; %bb20.i
#0:	       ldmg.d	___malloc_max_sbrked_mem ; mallocr.c:2242[ mallocr.c:2575 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2242[ mallocr.c:2575 ]
	;;
#0:	       cmpule	r12, r0 -> c1   ; mallocr.c:2242[ mallocr.c:2575 ]
	;;
#0:	if  c1 br	.BB9_100
	;;
	       nop	2
	;;
; BB#99:                                ; %bb21.i
#0:	       ldga	___malloc_max_sbrked_mem -> r0 ; mallocr.c:2243[ mallocr.c:2575 ]
	;;
#0:	       stm.a	r12, r0, 0      ; mallocr.c:2243[ mallocr.c:2575 ]
	;;
.BB9_100:                               ; %bb22.i
#0:	       ldmg.d	___malloc_max_total_mem ; mallocr.c:2248[ mallocr.c:2575 ]
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2248[ mallocr.c:2575 ]
	;;
#0:	       cmpule	r12, r0 -> c1   ; mallocr.c:2248[ mallocr.c:2575 ]
	;;
#0:	if  c1 br	.BB9_102
	;;
	       nop	2
	;;
; BB#101:                               ; %bb23.i
#0:	       ldga	___malloc_max_total_mem -> r0 ; mallocr.c:2249[ mallocr.c:2575 ]
	;;
#0:	       stm.a	r12, r0, 0      ; mallocr.c:2249[ mallocr.c:2575 ]
	;;
.BB9_102:                               ; %malloc_extend_top.exit
#0:	       ldmg.d	___malloc_av_+8 ; mallocr.c:2576
#1:	       ldi	-4 -> r1
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2576
	;;
#0:	       stm.s	r0, r14, 7
	;;
#0:	       ldm.f	r0, 4           ; mallocr.c:2576
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2576
	;;
#0:	       and	r0, r1 -> r0    ; mallocr.c:2576
	;;
#0:	       cmpult	r0, r10 -> c1   ; mallocr.c:2577
	;;
#0:	if !c1 sub	r0, r10 -> r0   ; mallocr.c:2576
#1:	if !c1 ldi	16 -> r1
	;;
#0:	if !c1 cmplt	r0, r1 -> c1
	;;
#0:	if !c1 br	.BB9_105
	;;
	       nop	2
	;;
; BB#103:                               ; %bb95
#0:	       ldi	0 -> r0
	;;
.BB9_104:                               ; %bb95
#0:	       ldm.s	r14, 32         ; mallocr.c:2590
#1:	       or	r14, 0 -> r15   ; mallocr.c:2590
	;;
#0:	       ldx	$mem, 0 -> r13  ; mallocr.c:2590
#1:	       ldm.s	r14, 36         ; mallocr.c:2590
	;;
#0:	       ldx	$mem, 0 -> r12  ; mallocr.c:2590
#1:	       ldm.s	r14, 40         ; mallocr.c:2590
	;;
#0:	       ldx	$mem, 0 -> r11  ; mallocr.c:2590
#1:	       ldm.s	r14, 44         ; mallocr.c:2590
	;;
#0:	       ldx	$mem, 0 -> r10  ; mallocr.c:2590
#1:	       ldm.s	r15, 8          ; mallocr.c:2590
	;;
#0:	       br	.BB9_34
#1:	       ldx	$mem, 0 -> r1.31 ; mallocr.c:2590
#2:	       ldm.s	r15, 4          ; mallocr.c:2590
	;;
#1:	       stx	r1.31 -> $ro    ; mallocr.c:2590
	;;
#2:	       ldx	$mem, 0 -> r2.31 ; mallocr.c:2590
	;;
#2:	       stx	r2.31 -> $rb    ; mallocr.c:2590
	;;
.BB9_105:                               ; %bb96
#1:	       ldm.s	r14, 28         ; mallocr.c:2586
#2:	       or	r10, 1 -> r1    ; mallocr.c:2585
#0:	       ldga	___malloc_av_ -> r0.16 ; mallocr.c:2586
#3:	       or	r10, 4 -> r2
	;;
#0:	       or	r0, 1 -> r0     ; mallocr.c:2587
	;;
#0:	       br	.BB9_33
#1:	       ldx	$mem, 0 -> r3   ; mallocr.c:2586
	;;
#0:	       stm.a	r1, r3, 1       ; mallocr.c:2585
#1:	       add	r3, r10 -> r4   ; mallocr.c:2586
#2:	       add	r3, r2 -> r1
	;;
#0:	       stm.a	r4, r0.16, 2    ; mallocr.c:2586
	;;
#0:	       stm.a	r0, r1, 0       ; mallocr.c:2587
#1:	       add	r3, 8 -> r0
	;;
	.align	4
__malloc_r_end:

	.align	4
__realloc_r:                            ; @_realloc_r
	.size	__realloc_r_end-__realloc_r
__realloc_r_start:
; BB#0:                                 ; %entry
#0:	       wb.s	r15, 16         ; mallocr.c:2806
#2:	       ldiu	64 -> r2        ; mallocr.c:2806
#1:	       ldx	$rb, 0 -> r1.31 ; mallocr.c:2806
#3:	       cmpne	r0, 0 -> c1     ; mallocr.c:2806
	;;
#0:	       sub	r15, r2 -> r15  ; mallocr.c:2806
#2:	       ldx	$ro, 0 -> r2.31 ; mallocr.c:2806
	;;
#0:	       stm.s	r14, r15, 0     ; mallocr.c:2806
#1:	       or	r15, 0 -> r14   ; mallocr.c:2806
	;;
#1:	       stm.s	r1.31, r15, 1   ; mallocr.c:2806
	;;
#2:	       stm.s	r2.31, r15, 2   ; mallocr.c:2806
	;;
#0:	       stm.s	r10, r14, 15    ; mallocr.c:2806
	;;
#0:	if  c1 br	.BB10_2         ; mallocr.c:2806
#1:	       stm.s	r11, r14, 14    ; mallocr.c:2806
	;;
#0:	       stm.s	r12, r14, 13    ; mallocr.c:2806
	;;
#0:	       stm.s	r13, r14, 12    ; mallocr.c:2806
	;;
#1:	       stm.s	r1.23, r14, 11  ; mallocr.c:2806
	;;
; BB#1:                                 ; %bb
#0:	       or	r1, 0 -> r0     ; mallocr.c:2806
#1:	       callg	__malloc_r      ; mallocr.c:2806
	;;                              ; mallocr.c:2806
	       nop	3               ; mallocr.c:2806
	;;
#0:	       br	.BB10_56
	;;
	       nop	2
	;;
.BB10_2:                                ; %bb1
#0:	       ldi	22 -> r2
#1:	       add	r1, 11 -> r3    ; mallocr.c:2814
#2:	       ldi	-8 -> r4
#3:	       or	r0, 0 -> r10
	;;
#0:	       cmpult	r2, r3 -> c1    ; mallocr.c:2814
#1:	       and	r3, r4 -> r2    ; mallocr.c:2814
#2:	       ldi	16 -> r3
#3:	       ldm.f	r10, -4         ; mallocr.c:2811
	;;
#0:	if  c1 or	r2, 0 -> r3
	;;
#0:	       cmplt	r3, 0 -> c1     ; mallocr.c:2817
#1:	       ldx	$mem, 0 -> r0   ; mallocr.c:2811
#2:	       stm.s	r3, r14, 10     ; mallocr.c:2817
	;;
#0:	if  c1 br	.BB10_4
	;;
	       nop	2
	;;
; BB#3:                                 ; %bb1
#0:	       or	r3, 0 -> r2
	;;
#0:	       cmpule	r1, r2 -> c1
	;;
#0:	if  c1 br	.BB10_7
	;;
	       nop	2
	;;
.BB10_4:                                ; %bb6
#0:	       ldga	_impure_data -> r0 ; mallocr.c:2819
	;;
#0:	       stm.a	12, r0, 0       ; mallocr.c:2819
#1:	       ldi	0 -> r0
	;;
.BB10_5:                                ; %bb6
#0:	       ldm.s	r14, 44         ; mallocr.c:2996
#1:	       or	r14, 0 -> r15   ; mallocr.c:2996
	;;
#1:	       ldx	$mem, 0 -> r1.23 ; mallocr.c:2996
#0:	       ldm.s	r14, 48         ; mallocr.c:2996
	;;
#0:	       ldx	$mem, 0 -> r13  ; mallocr.c:2996
#1:	       ldm.s	r14, 52         ; mallocr.c:2996
	;;
#0:	       ldx	$mem, 0 -> r12  ; mallocr.c:2996
#1:	       ldm.s	r14, 56         ; mallocr.c:2996
	;;
#0:	       ldx	$mem, 0 -> r11  ; mallocr.c:2996
#1:	       ldm.s	r14, 60         ; mallocr.c:2996
	;;
#0:	       ldx	$mem, 0 -> r10  ; mallocr.c:2996
#1:	       ldm.s	r15, 8          ; mallocr.c:2996
	;;
#1:	       ldx	$mem, 0 -> r1.31 ; mallocr.c:2996
#0:	       ldm.s	r15, 4          ; mallocr.c:2996
	;;
#1:	       stx	r1.31 -> $ro    ; mallocr.c:2996
	;;
#2:	       ldx	$mem, 0 -> r2.31 ; mallocr.c:2996
	;;
#2:	       stx	r2.31 -> $rb    ; mallocr.c:2996
	;;
.BB10_6:                                ; %bb6
#0:	       ldm.s	r15, 0          ; mallocr.c:2996
#1:	       s2add	r15, 16 -> r15  ; mallocr.c:2996
	;;
#0:	       ret                      ; mallocr.c:2996
#1:	       ldx	$mem, 0 -> r14  ; mallocr.c:2996
	;;                              ; mallocr.c:2996
	       nop	3               ; mallocr.c:2996
	;;
.BB10_7:                                ; %bb7
#0:	       sub	r10, 8 -> r3    ; mallocr.c:2810
#1:	       ldi	-4 -> r2
	;;
#0:	       stm.s	r3, r14, 9      ; mallocr.c:2811
#1:	       and	r0, r2 -> r11   ; mallocr.c:2811
	;;
#0:	       ldm.s	r14, 40         ; mallocr.c:2856
	;;
#0:	       ldx	$mem, 0 -> r2   ; mallocr.c:2856
	;;
#0:	       cmplt	r11, r2 -> c1   ; mallocr.c:2856
	;;
#0:	if !c1 br	.BB10_22
	;;
	       nop	2
	;;
; BB#8:                                 ; %bb8
#0:	       ldmg.d	___malloc_av_+8 ; mallocr.c:2862
#1:	       add	r11, r10 -> r3  ; mallocr.c:2861
#2:	       sub	r11, 4 -> r12
	;;
#0:	       sub	r3, 8 -> r3     ; mallocr.c:2861
#1:	       add	r10, r12 -> r2
	;;
#0:	       ldx	$mem, 0 -> r4   ; mallocr.c:2862
#1:	       ldm.f	r2, 0           ; mallocr.c:2864
	;;
#0:	       cmpeq	r4, r3 -> c1    ; mallocr.c:2862
	;;
#0:	if  c1 br	.BB10_18        ; mallocr.c:2862
#1:	       ldx	$mem, 0 -> r2   ; mallocr.c:2864
	;;                              ; mallocr.c:2862
	       nop	2               ; mallocr.c:2862
	;;
; BB#9:                                 ; %bb9
#0:	       ldi	-2 -> r5
	;;
#0:	       and	r2, r5 -> r5    ; mallocr.c:2862
	;;
#0:	       add	r12, r5 -> r5
	;;
#0:	       add	r10, r5 -> r5
	;;
#0:	       ldm.f	r5, 0           ; mallocr.c:2862
	;;
#0:	       ldx	$membu, r5 -> r5 ; mallocr.c:2862
	;;
#0:	       btest	r5, 0 -> c1     ; mallocr.c:2862
	;;
#0:	if !c1 br	.BB10_20        ; mallocr.c:2862
	;;                              ; mallocr.c:2862
	       nop	2               ; mallocr.c:2862
	;;
; BB#10:                                ; %bb9.bb16_crit_edge
#0:	       ldi	0 -> r2
	;;
#0:	       stm.s	r2, r14, 8
#1:	       or	r2, 0 -> r3
	;;
.BB10_11:                               ; %bb16
#0:	       cmpne	r0, 0 -> c1     ; mallocr.c:2896
	;;
#0:	if  c1 br	.BB10_54
	;;
	       nop	2
	;;
; BB#12:                                ; %bb17
#0:	       ldm.f	r10, -8         ; mallocr.c:2898
#1:	       ldi	-4 -> r2
#2:	       cmpeq	r3, 0 -> c1     ; mallocr.c:2903
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2898
	;;
#0:	       sub	r2, r0 -> r5
	;;
#0:	       add	r10, r5 -> r13
#1:	       ldi	-8 -> r5
	;;
#0:	if  c1 br	.BB10_53
#1:	       ldm.f	r13, 0          ; mallocr.c:2899
#2:	       sub	r5, r0 -> r0
	;;
#0:	       ldx	$mem, 0 -> r6   ; mallocr.c:2899
#1:	       stm.s	r0, r14, 6      ; mallocr.c:2898
#2:	       add	r10, r0 -> r0   ; mallocr.c:2898
	;;
#0:	       stm.s	r0, r14, 7      ; mallocr.c:2899
#1:	       and	r6, r2 -> r0    ; mallocr.c:2899
	;;
#0:	       stm.s	r0, r14, 5      ; mallocr.c:2903
	;;
; BB#13:                                ; %bb18
#0:	       ldm.s	r14, 32         ; mallocr.c:2908
#1:	       cmpne	r4, r3 -> c1    ; mallocr.c:2906
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2908
#1:	       ldm.s	r14, 20         ; mallocr.c:2908
	;;
#0:	if  c1 br	.BB10_32
#1:	       add	r0, r11 -> r0   ; mallocr.c:2908
	;;
#0:	       ldx	$mem, 0 -> r2   ; mallocr.c:2908
	;;
#0:	       add	r0, r2 -> r0    ; mallocr.c:2908
	;;
#0:	       stm.s	r0, r14, 4      ; mallocr.c:2906
	;;
; BB#14:                                ; %bb19
#0:	       ldm.s	r14, 40         ; mallocr.c:2908
	;;
#0:	       ldx	$mem, 0 -> r3   ; mallocr.c:2908
	;;
#0:	       add	r3, 16 -> r3    ; mallocr.c:2908
	;;
#0:	       cmplt	r0, r3 -> c1    ; mallocr.c:2908
	;;
#0:	if  c1 br	.BB10_53
	;;
	       nop	2
	;;
; BB#15:                                ; %bb20
#0:	       ldm.s	r14, 24
#1:	       ldi	36 -> r4
	;;
#0:	       cmpult	r4, r12 -> c1   ; mallocr.c:2914
	;;
#0:	       ldx	$mem, 0 -> r3
	;;
#0:	       add	r3, 12 -> r0
#1:	       add	r3, r10 -> r3
	;;
#0:	       ldm.f	r3, 8           ; mallocr.c:2910
#2:	       add	r10, r0 -> r0
#1:	       add	r3, 8 -> r1.23
	;;
#0:	if  c1 br	.BB10_30
#1:	       ldx	$mem, 0 -> r1   ; mallocr.c:2910
#2:	       ldm.f	r0, 0           ; mallocr.c:2910
	;;
#0:	       ldx	$mem, 0 -> r2   ; mallocr.c:2910
	;;
#0:	       stm.a	r2, r1, 3       ; mallocr.c:2910
	;;
#0:	       stm.a	r1, r2, 2       ; mallocr.c:2910
	;;
; BB#16:                                ; %bb21
#0:	       ldi	19 -> r1
	;;
#0:	       cmpult	r1, r12 -> c1   ; mallocr.c:2914
	;;
#0:	if  c1 br	.BB10_24
	;;
	       nop	2
	;;
; BB#17:                                ; %bb21.bb25_crit_edge
#0:	       or	r10, 0 -> r0
#2:	       br	.BB10_29
#1:	       or	r1.23, 0 -> r1
	;;
	       nop	2
	;;
.BB10_18:                               ; %bb11
#0:	       ldi	-4 -> r5
	;;
#0:	       and	r2, r5 -> r2    ; mallocr.c:2864
	;;
#0:	       stm.s	r2, r14, 8      ; mallocr.c:2869
#1:	       add	r2, r11 -> r2   ; mallocr.c:2869
	;;
#0:	       ldm.s	r14, 40         ; mallocr.c:2869
	;;
#0:	       ldx	$mem, 0 -> r5   ; mallocr.c:2869
	;;
#0:	       add	r5, 16 -> r5    ; mallocr.c:2869
	;;
#0:	       cmple	r5, r2 -> c1    ; mallocr.c:2869
	;;
#0:	if !c1 br	.BB10_11
	;;
	       nop	2
	;;
; BB#19:                                ; %bb12
#0:	       ldm.s	r14, 40         ; mallocr.c:2872
#1:	       ldga	___malloc_av_ -> r1 ; mallocr.c:2872
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2872
#1:	       ldm.s	r14, 32
	;;
#0:	       add	r0, r10 -> r2   ; mallocr.c:2872
#1:	       sub	r11, r0 -> r3
	;;
#0:	       ldx	$mem, 0 -> r4
	;;
#0:	       add	r3, r4 -> r3
#1:	       sub	r2, 8 -> r4     ; mallocr.c:2872
#2:	       sub	r2, 4 -> r2
	;;
#0:	       stm.a	r4, r1, 2       ; mallocr.c:2872
#1:	       or	r3, 1 -> r3     ; mallocr.c:2873
	;;
#0:	       stm.a	r3, r2, 0       ; mallocr.c:2873
#1:	       sub	r10, 4 -> r3
	;;
#0:	       ldm.f	r10, -4         ; mallocr.c:2874
	;;
#0:	       br	.BB10_56
#1:	       ldx	$mem, 0 -> r2   ; mallocr.c:2874
	;;
#0:	       and	r2, 1 -> r2     ; mallocr.c:2874
	;;
#0:	       or	r2, r0 -> r0    ; mallocr.c:2874
	;;
#0:	       stm.a	r0, r3, 0       ; mallocr.c:2874
#1:	       or	r10, 0 -> r0    ; mallocr.c:2996
	;;
.BB10_20:                               ; %bb13
#0:	       ldi	-4 -> r5
	;;
#0:	       and	r2, r5 -> r2    ; mallocr.c:2864
	;;
#0:	       stm.s	r2, r14, 8      ; mallocr.c:2869
#1:	       add	r2, r11 -> r2   ; mallocr.c:2869
	;;
#0:	       ldm.s	r14, 40         ; mallocr.c:2881
	;;
#0:	       ldx	$mem, 0 -> r5   ; mallocr.c:2881
	;;
#0:	       cmple	r5, r2 -> c1    ; mallocr.c:2881
	;;
#0:	if !c1 br	.BB10_11
	;;
	       nop	2
	;;
; BB#21:                                ; %bb14
#0:	       add	r10, r11 -> r0
#1:	       or	r2, 0 -> r11
	;;
#0:	       ldm.f	r0, 0           ; mallocr.c:2883
	;;
#0:	       ldx	$mem, 0 -> r3   ; mallocr.c:2883
#1:	       ldm.f	r0, 4           ; mallocr.c:2883
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2883
	;;
#0:	       stm.a	r0, r3, 3       ; mallocr.c:2883
	;;
#0:	       stm.a	r3, r0, 2       ; mallocr.c:2883
	;;
.BB10_22:                               ; %split
#0:	       ldm.s	r14, 40         ; mallocr.c:2978
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2978
	;;
#0:	       sub	r11, r0 -> r0   ; mallocr.c:2978
	;;
#0:	       cmpult	r0, 16 -> c1    ; mallocr.c:2980
	;;
#0:	if  c1 br	.BB10_70
	;;
	       nop	2
	;;
; BB#23:                                ; %bb66
#0:	       ldm.s	r14, 36         ; mallocr.c:2983
#1:	       or	r0, 1 -> r0     ; mallocr.c:2984
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:2983
	;;
#0:	       ldm.f	r1, 4           ; mallocr.c:2983
#1:	       add	r11, r1 -> r11  ; mallocr.c:2982
	;;
#0:	       ldx	$mem, 0 -> r2   ; mallocr.c:2983
#1:	       ldm.s	r14, 40
	;;
#0:	       and	r2, 1 -> r2     ; mallocr.c:2983
	;;
#0:	       ldx	$mem, 0 -> r3
	;;
#0:	       or	r2, r3 -> r2    ; mallocr.c:2983
#1:	       or	r3, 4 -> r4
	;;
#0:	       stm.a	r2, r1, 1       ; mallocr.c:2983
#1:	       add	r1, r4 -> r4
#2:	       add	r3, r1 -> r1    ; mallocr.c:2982
	;;
#0:	       add	r1, 8 -> r1     ; mallocr.c:2986
	;;
#0:	       stm.a	r0, r4, 0       ; mallocr.c:2984
	;;
#0:	       ldm.f	r11, 4          ; mallocr.c:2985
	;;
#0:	       callg	__free_r        ; mallocr.c:2986
#1:	       ldx	$mem, 0 -> r0   ; mallocr.c:2985
	;;
#0:	       or	r0, 1 -> r0     ; mallocr.c:2985
	;;
#0:	       stm.a	r0, r11, 1      ; mallocr.c:2985
#1:	       ldga	_impure_data -> r0 ; mallocr.c:2986
	;;                              ; mallocr.c:2986
	       nop	1               ; mallocr.c:2986
	;;
#0:	       br	.BB10_71
	;;
	       nop	2
	;;
.BB10_24:                               ; %bb22
#0:	       ldm.f	r10, 0          ; mallocr.c:2914
#1:	       ldi	27 -> r4
	;;
#0:	       cmpult	r4, r12 -> c1   ; mallocr.c:2914
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:2914
	;;
#0:	if  c1 br	.BB10_26        ; mallocr.c:2914
#1:	       stm.a	r1, r1.23, 0    ; mallocr.c:2914
#2:	       add	r3, 16 -> r1
	;;
#0:	       ldm.f	r10, 4          ; mallocr.c:2914
	;;
#0:	       ldx	$mem, 0 -> r2   ; mallocr.c:2914
	;;
#0:	       stm.a	r2, r0, 0       ; mallocr.c:2914
	;;
; BB#25:                                ; %bb22.bb25_crit_edge
#0:	       add	r10, 8 -> r0
#1:	       br	.BB10_29
	;;
	       nop	2
	;;
.BB10_26:                               ; %bb23
#0:	       ldm.f	r10, 8          ; mallocr.c:2914
#1:	       ldi	35 -> r2
	;;
#0:	       cmpult	r2, r12 -> c1   ; mallocr.c:2914
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2914
	;;
#0:	if  c1 br	.BB10_28        ; mallocr.c:2914
#1:	       stm.a	r0, r1, 0       ; mallocr.c:2914
#2:	       add	r3, 24 -> r1
	;;
#0:	       ldm.f	r10, 12         ; mallocr.c:2914
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2914
	;;
#0:	       stm.a	r0, r3, 5       ; mallocr.c:2914
	;;
; BB#27:                                ; %bb23.bb25_crit_edge
#0:	       add	r10, 16 -> r0
#1:	       br	.BB10_29
	;;
	       nop	2
	;;
.BB10_28:                               ; %bb24
#0:	       ldm.f	r10, 16         ; mallocr.c:2914
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2914
	;;
#0:	       stm.a	r0, r1, 0       ; mallocr.c:2914
#1:	       s2add	r3, 8 -> r1
#2:	       add	r10, 24 -> r0
	;;
#0:	       ldm.f	r10, 20         ; mallocr.c:2914
	;;
#0:	       ldx	$mem, 0 -> r12  ; mallocr.c:2914
	;;
#0:	       stm.a	r12, r3, 7      ; mallocr.c:2914
	;;
.BB10_29:                               ; %bb25
#0:	       ldm.f	r0, 0           ; mallocr.c:2914
	;;
#0:	       ldx	$mem, 0 -> r3   ; mallocr.c:2914
	;;
#0:	       stm.a	r3, r1, 0       ; mallocr.c:2914
	;;
#0:	       ldm.f	r0, 4           ; mallocr.c:2914
	;;
#0:	       ldx	$mem, 0 -> r3   ; mallocr.c:2914
	;;
#0:	       br	.BB10_31
#1:	       stm.a	r3, r1, 1       ; mallocr.c:2914
	;;
#0:	       ldm.f	r0, 8           ; mallocr.c:2914
	;;
#0:	       ldx	$mem, 0 -> r3   ; mallocr.c:2914
	;;
#0:	       stm.a	r3, r1, 2       ; mallocr.c:2914
	;;
.BB10_30:                               ; %bb26
#1:	       or	r1.23, 0 -> r0  ; mallocr.c:2914
#0:	       callg	_memmove        ; mallocr.c:2914
#2:	       or	r10, 0 -> r1    ; mallocr.c:2914
#3:	       or	r12, 0 -> r2    ; mallocr.c:2914
	;;                              ; mallocr.c:2914
	       nop	3               ; mallocr.c:2914
	;;
.BB10_31:                               ; %bb27
#0:	       ldm.s	r14, 40
	;;
#0:	       ldx	$mem, 0 -> r3
#1:	       ldm.s	r14, 32         ; mallocr.c:2912
	;;
#0:	       sub	r11, r3 -> r11
	;;
#0:	       ldx	$mem, 0 -> r12  ; mallocr.c:2912
#1:	       ldm.s	r14, 24
	;;
#0:	       add	r11, r12 -> r11 ; mallocr.c:2912
	;;
#0:	       ldx	$mem, 0 -> r12
#1:	       ldm.s	r14, 20
	;;
#0:	       add	r12, r3 -> r12
	;;
#0:	       ldx	$mem, 0 -> r0
#1:	       add	r10, r12 -> r10 ; mallocr.c:2915
	;;
#0:	       add	r11, r0 -> r11
#1:	       ldga	___malloc_av_ -> r0 ; mallocr.c:2915
	;;
#0:	       stm.a	r10, r0, 2      ; mallocr.c:2915
#2:	       or	r11, 1 -> r11   ; mallocr.c:2916
#1:	       or	r1.23, 0 -> r0  ; mallocr.c:2996
	;;
#0:	       stm.a	r11, r10, 1     ; mallocr.c:2916
	;;
#0:	       ldm.f	r13, 0          ; mallocr.c:2917
	;;
#0:	       br	.BB10_5
#1:	       ldx	$mem, 0 -> r10  ; mallocr.c:2917
	;;
#0:	       and	r10, 1 -> r10   ; mallocr.c:2917
	;;
#0:	       or	r10, r3 -> r3   ; mallocr.c:2917
	;;
#0:	       stm.a	r3, r13, 0      ; mallocr.c:2917
	;;
.BB10_32:                               ; %bb28
#0:	       ldm.s	r14, 16         ; mallocr.c:2924
	;;
#0:	       ldx	$mem, 0 -> r2   ; mallocr.c:2924
#1:	       ldm.s	r14, 40         ; mallocr.c:2924
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2924
	;;
#0:	       cmplt	r2, r0 -> c1    ; mallocr.c:2924
	;;
#0:	if  c1 br	.BB10_53
	;;
	       nop	2
	;;
; BB#33:                                ; %bb29
#0:	       ldm.f	r3, 8           ; mallocr.c:2926
#1:	       ldi	36 -> r4
	;;
#0:	       cmpult	r4, r12 -> c1   ; mallocr.c:2931
	;;
#0:	       ldx	$mem, 0 -> r11  ; mallocr.c:2926
#1:	       ldm.f	r3, 12          ; mallocr.c:2926
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2926
#1:	       ldm.s	r14, 24
	;;
#0:	       ldx	$mem, 0 -> r1
#1:	       stm.a	r0, r11, 3      ; mallocr.c:2926
	;;
#0:	       add	r1, 12 -> r2
#1:	       add	r1, r10 -> r1
	;;
#0:	       stm.a	r11, r0, 2      ; mallocr.c:2926
#1:	       add	r10, r2 -> r11
#2:	       add	r1, 8 -> r0
	;;
#0:	       ldm.f	r1, 8           ; mallocr.c:2927
	;;
#0:	if  c1 br	.BB10_41        ; mallocr.c:2931
#1:	       ldx	$mem, 0 -> r2   ; mallocr.c:2927
#2:	       ldm.f	r11, 0          ; mallocr.c:2927
	;;
#0:	       ldx	$mem, 0 -> r3   ; mallocr.c:2927
	;;
#0:	       stm.a	r3, r2, 3       ; mallocr.c:2927
	;;
#0:	       stm.a	r2, r3, 2       ; mallocr.c:2927
	;;
; BB#34:                                ; %bb31
#0:	       ldi	19 -> r2
	;;
#0:	       cmpult	r2, r12 -> c1   ; mallocr.c:2931
	;;
#0:	if !c1 br	.BB10_40
	;;
	       nop	2
	;;
; BB#35:                                ; %bb34
#0:	       ldm.f	r10, 0          ; mallocr.c:2931
#1:	       ldi	27 -> r3
	;;
#0:	       cmpult	r3, r12 -> c1   ; mallocr.c:2931
	;;
#0:	       ldx	$mem, 0 -> r2   ; mallocr.c:2931
	;;
#0:	if  c1 br	.BB10_37        ; mallocr.c:2931
#1:	       stm.a	r2, r0, 0       ; mallocr.c:2931
#2:	       add	r1, 16 -> r0
	;;
#0:	       ldm.f	r10, 4          ; mallocr.c:2931
	;;
#0:	       ldx	$mem, 0 -> r2   ; mallocr.c:2931
	;;
#0:	       stm.a	r2, r11, 0      ; mallocr.c:2931
	;;
; BB#36:                                ; %bb34.bb37_crit_edge
#0:	       add	r10, 8 -> r10
#1:	       br	.BB10_40
	;;
	       nop	2
	;;
.BB10_37:                               ; %bb35
#0:	       ldm.f	r10, 8          ; mallocr.c:2931
#1:	       ldi	35 -> r2
	;;
#0:	       cmpult	r2, r12 -> c1   ; mallocr.c:2931
	;;
#0:	       ldx	$mem, 0 -> r11  ; mallocr.c:2931
	;;
#0:	if  c1 br	.BB10_39        ; mallocr.c:2931
#1:	       stm.a	r11, r0, 0      ; mallocr.c:2931
#2:	       add	r1, 24 -> r0
	;;
#0:	       ldm.f	r10, 12         ; mallocr.c:2931
	;;
#0:	       ldx	$mem, 0 -> r11  ; mallocr.c:2931
	;;
#0:	       stm.a	r11, r1, 5      ; mallocr.c:2931
	;;
; BB#38:                                ; %bb35.bb37_crit_edge
#0:	       add	r10, 16 -> r10
#1:	       br	.BB10_40
	;;
	       nop	2
	;;
.BB10_39:                               ; %bb36
#0:	       ldm.f	r10, 16         ; mallocr.c:2931
	;;
#0:	       ldx	$mem, 0 -> r11  ; mallocr.c:2931
	;;
#0:	       stm.a	r11, r0, 0      ; mallocr.c:2931
#1:	       s2add	r1, 8 -> r0
	;;
#0:	       ldm.f	r10, 20         ; mallocr.c:2931
#1:	       add	r10, 24 -> r10
	;;
#0:	       ldx	$mem, 0 -> r11  ; mallocr.c:2931
	;;
#0:	       stm.a	r11, r1, 7      ; mallocr.c:2931
	;;
.BB10_40:                               ; %bb37
#0:	       ldm.f	r10, 0          ; mallocr.c:2931
	;;
#0:	       ldx	$mem, 0 -> r11  ; mallocr.c:2931
	;;
#0:	       stm.a	r11, r0, 0      ; mallocr.c:2931
	;;
#0:	       ldm.f	r10, 4          ; mallocr.c:2931
	;;
#0:	       ldx	$mem, 0 -> r11  ; mallocr.c:2931
	;;
#0:	       br	.BB10_42
#1:	       stm.a	r11, r0, 1      ; mallocr.c:2931
	;;
#0:	       ldm.f	r10, 8          ; mallocr.c:2931
	;;
#0:	       ldx	$mem, 0 -> r10  ; mallocr.c:2931
	;;
#0:	       stm.a	r10, r0, 2      ; mallocr.c:2931
	;;
.BB10_41:                               ; %bb38
#0:	       or	r10, 0 -> r1    ; mallocr.c:2931
#1:	       callg	_memmove        ; mallocr.c:2931
#2:	       or	r12, 0 -> r2    ; mallocr.c:2931
	;;                              ; mallocr.c:2931
	       nop	3               ; mallocr.c:2931
	;;
.BB10_42:                               ; %bb38
#0:	       ldm.s	r14, 16
	;;
.BB10_43:                               ; %bb38
#0:	       ldx	$mem, 0 -> r11
#1:	       br	.BB10_22
#2:	       ldm.s	r14, 28
	;;
#0:	       ldx	$mem, 0 -> r10
	;;
#0:	       stm.s	r10, r14, 9     ; mallocr.c:2931
	;;
	       nop	0
	;;
.BB10_44:                               ; %bb41
#0:	       ldm.s	r14, 24
#1:	       ldi	36 -> r4
	;;
#0:	       cmpult	r4, r12 -> c1   ; mallocr.c:2943
	;;
#0:	       ldx	$mem, 0 -> r11
	;;
#0:	       add	r11, 12 -> r0
#1:	       add	r11, r10 -> r11
	;;
#0:	       ldm.f	r11, 8          ; mallocr.c:2939
#1:	       add	r10, r0 -> r1
#2:	       add	r11, 8 -> r0
	;;
#0:	if  c1 br	.BB10_52        ; mallocr.c:2943
#1:	       ldx	$mem, 0 -> r2   ; mallocr.c:2939
#2:	       ldm.f	r1, 0           ; mallocr.c:2939
	;;
#0:	       ldx	$mem, 0 -> r3   ; mallocr.c:2939
	;;
#0:	       stm.a	r3, r2, 3       ; mallocr.c:2939
	;;
#0:	       stm.a	r2, r3, 2       ; mallocr.c:2939
	;;
; BB#45:                                ; %bb43
#0:	       ldi	19 -> r2
	;;
#0:	       cmpult	r2, r12 -> c1   ; mallocr.c:2943
	;;
#0:	if !c1 br	.BB10_51
	;;
	       nop	2
	;;
; BB#46:                                ; %bb46
#0:	       ldm.f	r10, 0          ; mallocr.c:2943
#1:	       ldi	27 -> r3
	;;
#0:	       cmpult	r3, r12 -> c1   ; mallocr.c:2943
	;;
#0:	       ldx	$mem, 0 -> r2   ; mallocr.c:2943
	;;
#0:	if  c1 br	.BB10_48        ; mallocr.c:2943
#1:	       stm.a	r2, r0, 0       ; mallocr.c:2943
#2:	       add	r11, 16 -> r0
	;;
#0:	       ldm.f	r10, 4          ; mallocr.c:2943
	;;
#0:	       ldx	$mem, 0 -> r2   ; mallocr.c:2943
	;;
#0:	       stm.a	r2, r1, 0       ; mallocr.c:2943
	;;
; BB#47:                                ; %bb46.bb49_crit_edge
#0:	       add	r10, 8 -> r10
#1:	       br	.BB10_51
	;;
	       nop	2
	;;
.BB10_48:                               ; %bb47
#0:	       ldm.f	r10, 8          ; mallocr.c:2943
#1:	       ldi	35 -> r2
	;;
#0:	       cmpult	r2, r12 -> c1   ; mallocr.c:2943
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:2943
	;;
#0:	if  c1 br	.BB10_50        ; mallocr.c:2943
#1:	       stm.a	r1, r0, 0       ; mallocr.c:2943
#2:	       add	r11, 24 -> r0
	;;
#0:	       ldm.f	r10, 12         ; mallocr.c:2943
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:2943
	;;
#0:	       stm.a	r1, r11, 5      ; mallocr.c:2943
	;;
; BB#49:                                ; %bb47.bb49_crit_edge
#0:	       add	r10, 16 -> r10
#1:	       br	.BB10_51
	;;
	       nop	2
	;;
.BB10_50:                               ; %bb48
#0:	       ldm.f	r10, 16         ; mallocr.c:2943
	;;
#0:	       ldx	$mem, 0 -> r12  ; mallocr.c:2943
	;;
#0:	       stm.a	r12, r0, 0      ; mallocr.c:2943
#1:	       s2add	r11, 8 -> r0
	;;
#0:	       ldm.f	r10, 20         ; mallocr.c:2943
#1:	       add	r10, 24 -> r10
	;;
#0:	       ldx	$mem, 0 -> r12  ; mallocr.c:2943
	;;
#0:	       stm.a	r12, r11, 7     ; mallocr.c:2943
	;;
.BB10_51:                               ; %bb49
#0:	       ldm.f	r10, 0          ; mallocr.c:2943
	;;
#0:	       ldx	$mem, 0 -> r11  ; mallocr.c:2943
	;;
#0:	       stm.a	r11, r0, 0      ; mallocr.c:2943
	;;
#0:	       ldm.f	r10, 4          ; mallocr.c:2943
	;;
#0:	       ldx	$mem, 0 -> r11  ; mallocr.c:2943
	;;
#0:	       stm.a	r11, r0, 1      ; mallocr.c:2943
	;;
#0:	       br	.BB10_43
#1:	       ldm.f	r10, 8          ; mallocr.c:2943
	;;
#0:	       ldx	$mem, 0 -> r10  ; mallocr.c:2943
	;;
#0:	       stm.a	r10, r0, 2      ; mallocr.c:2943
	;;
#0:	       ldm.s	r14, 32
	;;
.BB10_52:                               ; %bb50
#0:	       or	r10, 0 -> r1    ; mallocr.c:2943
#1:	       callg	_memmove        ; mallocr.c:2943
#2:	       or	r12, 0 -> r2    ; mallocr.c:2943
	;;                              ; mallocr.c:2943
	       nop	3               ; mallocr.c:2943
	;;
#0:	       br	.BB10_43
#1:	       ldm.s	r14, 32
	;;
	       nop	2
	;;
.BB10_53:                               ; %bb39
#0:	       ldm.s	r14, 28
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       cmpeq	r0, 0 -> c1
	;;
#0:	if !c1 ldm.s	r14, 20         ; mallocr.c:2937
	;;
#0:	if !c1 ldx	$mem, 0 -> r0   ; mallocr.c:2937
	;;
#0:	if !c1 add	r0, r11 -> r0   ; mallocr.c:2937
	;;
#0:	if !c1 stm.s	r0, r14, 8      ; mallocr.c:2937
	;;
#0:	if !c1 ldm.s	r14, 40         ; mallocr.c:2937
	;;
#0:	if !c1 ldx	$mem, 0 -> r2   ; mallocr.c:2937
	;;
#0:	if !c1 cmplt	r0, r2 -> c1    ; mallocr.c:2937
	;;
#0:	if !c1 br	.BB10_44
	;;
	       nop	2
	;;
.BB10_54:                               ; %bb51
#0:	       or	r1, 0 -> r0     ; mallocr.c:2950
#1:	       callg	__malloc_r      ; mallocr.c:2950
	;;                              ; mallocr.c:2950
	       nop	3               ; mallocr.c:2950
	;;
#0:	       cmpne	r0, 0 -> c1     ; mallocr.c:2952
	;;
#0:	if  c1 br	.BB10_57        ; mallocr.c:2952
	;;                              ; mallocr.c:2952
	       nop	2               ; mallocr.c:2952
	;;
; BB#55:                                ; %bb52
#0:	       ldi	0 -> r0
	;;
.BB10_56:                               ; %bb52
#0:	       ldm.s	r14, 44         ; mallocr.c:2996
#1:	       or	r14, 0 -> r15   ; mallocr.c:2996
	;;
#1:	       ldx	$mem, 0 -> r1.23 ; mallocr.c:2996
#0:	       ldm.s	r14, 48         ; mallocr.c:2996
	;;
#0:	       ldx	$mem, 0 -> r13  ; mallocr.c:2996
#1:	       ldm.s	r14, 52         ; mallocr.c:2996
	;;
#0:	       ldx	$mem, 0 -> r12  ; mallocr.c:2996
#1:	       ldm.s	r14, 56         ; mallocr.c:2996
	;;
#0:	       ldx	$mem, 0 -> r11  ; mallocr.c:2996
#1:	       ldm.s	r14, 60         ; mallocr.c:2996
	;;
#0:	       ldx	$mem, 0 -> r10  ; mallocr.c:2996
#1:	       ldm.s	r15, 8          ; mallocr.c:2996
	;;
#0:	       br	.BB10_6
#3:	       ldx	$mem, 0 -> r3.31 ; mallocr.c:2996
#1:	       ldm.s	r15, 4          ; mallocr.c:2996
	;;
#3:	       stx	r3.31 -> $ro    ; mallocr.c:2996
	;;
#0:	       ldx	$mem, 0 -> r0.31 ; mallocr.c:2996
	;;
#0:	       stx	r0.31 -> $rb    ; mallocr.c:2996
	;;
.BB10_57:                               ; %bb53
#0:	       ldm.f	r10, -4         ; mallocr.c:2961
#1:	       or	r0, 0 -> r13    ; mallocr.c:2950
#2:	       ldi	-2 -> r1
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2961
	;;
#0:	       sub	r0, 8 -> r0
	;;
#0:	       and	r0, r1 -> r0
#1:	       sub	r13, 8 -> r1    ; mallocr.c:2961
	;;
#0:	       add	r10, r0 -> r0   ; mallocr.c:2961
	;;
#0:	       cmpne	r1, r0 -> c1    ; mallocr.c:2961
	;;
#0:	if  c1 br	.BB10_59        ; mallocr.c:2961
	;;                              ; mallocr.c:2961
	       nop	2               ; mallocr.c:2961
	;;
; BB#58:                                ; %bb54
#0:	       ldm.f	r13, -4         ; mallocr.c:2963
#1:	       br	.BB10_22
#2:	       ldi	-4 -> r12
	;;
#0:	       ldx	$mem, 0 -> r10  ; mallocr.c:2963
	;;
#0:	       and	r10, r12 -> r10 ; mallocr.c:2963
	;;
#0:	       add	r10, r11 -> r11 ; mallocr.c:2963
	;;
.BB10_59:                               ; %bb55
#0:	       ldi	36 -> r11
	;;
#0:	       cmpult	r11, r12 -> c1  ; mallocr.c:2969
	;;
#0:	if  c1 br	.BB10_68        ; mallocr.c:2969
	;;                              ; mallocr.c:2969
	       nop	2               ; mallocr.c:2969
	;;
; BB#60:                                ; %bb57
#0:	       ldi	19 -> r11
	;;
#0:	       cmpult	r11, r12 -> c1  ; mallocr.c:2969
	;;
#0:	if  c1 br	.BB10_62        ; mallocr.c:2969
	;;                              ; mallocr.c:2969
	       nop	2               ; mallocr.c:2969
	;;
; BB#61:                                ; %bb57.bb63_crit_edge
#0:	       or	r10, 0 -> r11
#1:	       br	.BB10_67
#2:	       or	r13, 0 -> r12
	;;
	       nop	2
	;;
.BB10_62:                               ; %bb60
#0:	       ldm.f	r10, 0          ; mallocr.c:2969
#1:	       ldi	27 -> r0
	;;
#0:	       cmpult	r0, r12 -> c1   ; mallocr.c:2969
	;;
#0:	       ldx	$mem, 0 -> r11  ; mallocr.c:2969
	;;
#0:	if  c1 br	.BB10_64        ; mallocr.c:2969
#1:	       stm.a	r11, r13, 0     ; mallocr.c:2969
	;;
#0:	       ldm.f	r10, 4          ; mallocr.c:2969
	;;
#0:	       ldx	$mem, 0 -> r11  ; mallocr.c:2969
	;;
#0:	       stm.a	r11, r13, 1     ; mallocr.c:2969
	;;
; BB#63:                                ; %bb60.bb63_crit_edge
#0:	       add	r13, 8 -> r12
#1:	       br	.BB10_67
#2:	       add	r10, 8 -> r11
	;;
	       nop	2
	;;
.BB10_64:                               ; %bb61
#0:	       ldm.f	r10, 8          ; mallocr.c:2969
#1:	       ldi	35 -> r0
	;;
#0:	       cmpult	r0, r12 -> c1   ; mallocr.c:2969
	;;
#0:	       ldx	$mem, 0 -> r11  ; mallocr.c:2969
	;;
#0:	if  c1 br	.BB10_66        ; mallocr.c:2969
#1:	       stm.a	r11, r13, 2     ; mallocr.c:2969
	;;
#0:	       ldm.f	r10, 12         ; mallocr.c:2969
	;;
#0:	       ldx	$mem, 0 -> r11  ; mallocr.c:2969
	;;
#0:	       stm.a	r11, r13, 3     ; mallocr.c:2969
	;;
; BB#65:                                ; %bb61.bb63_crit_edge
#0:	       add	r13, 16 -> r12
#1:	       br	.BB10_67
#2:	       add	r10, 16 -> r11
	;;
	       nop	2
	;;
.BB10_66:                               ; %bb62
#0:	       ldm.f	r10, 16         ; mallocr.c:2969
#1:	       add	r13, 24 -> r12
	;;
#0:	       ldx	$mem, 0 -> r11  ; mallocr.c:2969
	;;
#0:	       stm.a	r11, r13, 4     ; mallocr.c:2969
#1:	       add	r10, 24 -> r11
	;;
#0:	       ldm.f	r10, 20         ; mallocr.c:2969
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2969
	;;
#0:	       stm.a	r0, r13, 5      ; mallocr.c:2969
	;;
.BB10_67:                               ; %bb63
#0:	       ldm.f	r11, 0          ; mallocr.c:2969
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2969
	;;
#0:	       stm.a	r0, r12, 0      ; mallocr.c:2969
	;;
#0:	       ldm.f	r11, 4          ; mallocr.c:2969
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2969
	;;
#0:	       br	.BB10_69
#1:	       stm.a	r0, r12, 1      ; mallocr.c:2969
	;;
#0:	       ldm.f	r11, 8          ; mallocr.c:2969
	;;
#0:	       ldx	$mem, 0 -> r11  ; mallocr.c:2969
	;;
#0:	       stm.a	r11, r12, 2     ; mallocr.c:2969
	;;
.BB10_68:                               ; %bb64
#0:	       or	r13, 0 -> r0    ; mallocr.c:2969
#1:	       callg	_memmove        ; mallocr.c:2969
#2:	       or	r10, 0 -> r1    ; mallocr.c:2969
#3:	       or	r12, 0 -> r2    ; mallocr.c:2969
	;;                              ; mallocr.c:2969
	       nop	3               ; mallocr.c:2969
	;;
.BB10_69:                               ; %bb65
#0:	       ldga	_impure_data -> r0 ; mallocr.c:2970
#1:	       callg	__free_r        ; mallocr.c:2970
#2:	       or	r10, 0 -> r1    ; mallocr.c:2970
	;;                              ; mallocr.c:2970
	       nop	3               ; mallocr.c:2970
	;;
#0:	       br	.BB10_5
#1:	       or	r13, 0 -> r0    ; mallocr.c:2996
	;;
	       nop	2
	;;
.BB10_70:                               ; %bb67
#0:	       ldm.s	r14, 36         ; mallocr.c:2990
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2990
	;;
#0:	       ldm.f	r0, 4           ; mallocr.c:2990
#1:	       add	r11, r0 -> r2   ; mallocr.c:2990
	;;
#0:	       ldx	$mem, 0 -> r1   ; mallocr.c:2990
	;;
#0:	       and	r1, 1 -> r1     ; mallocr.c:2990
	;;
#0:	       or	r1, r11 -> r1   ; mallocr.c:2990
	;;
#0:	       stm.a	r1, r0, 1       ; mallocr.c:2990
	;;
#0:	       ldm.f	r2, 4           ; mallocr.c:2991
	;;
#0:	       ldx	$mem, 0 -> r0   ; mallocr.c:2991
	;;
#0:	       or	r0, 1 -> r0     ; mallocr.c:2991
	;;
#0:	       stm.a	r0, r2, 1       ; mallocr.c:2991
	;;
.BB10_71:                               ; %bb68
#0:	       ldm.s	r14, 36
#1:	       br	.BB10_56
	;;
#0:	       ldx	$mem, 0 -> r0
	;;
#0:	       add	r0, 8 -> r0
	;;
	       nop	0
	;;
	.align	4
__realloc_r_end:

	.align	4
_memchr:                                ; @memchr
	.size	_memchr_end-_memchr
_memchr_start:
; BB#0:                                 ; %entry
#0:	       ldiu	4 -> r2         ; memchr.c:78
#1:	       br	.BB11_6
#2:	       wb.s	r15, 1          ; memchr.c:78
	;;
#0:	       sub	r15, r2 -> r15  ; memchr.c:78
	;;
	       nop	1
	;;
.BB11_1:                                ; %bb
                                        ;   in Loop: Header=BB11_6 Depth=1
#0:	       cmpne	r1, 0 -> c1     ; memchr.c:87
	;;
#0:	if  c1 br	.BB11_4         ; memchr.c:87
	;;                              ; memchr.c:87
	       nop	2               ; memchr.c:87
	;;
.BB11_2:                                ; %bb.bb20_crit_edge
#0:	       ldi	0 -> r0
	;;
.BB11_3:                                ; %bb20
#0:	       s2add	r15, 1 -> r15   ; memchr.c:133
#1:	       ret                      ; memchr.c:133
	;;                              ; memchr.c:133
	       nop	3               ; memchr.c:133
	;;
.BB11_4:                                ; %bb2
                                        ;   in Loop: Header=BB11_6 Depth=1
#0:	       ldm.f	r0, 0           ; memchr.c:89
	;;
#0:	       ldx	$membu, r0 -> r2 ; memchr.c:89
	;;
#0:	       cmpne	r2, 10 -> c1    ; memchr.c:89
	;;
#0:	if !c1 br	.BB11_3
	;;
	       nop	2
	;;
; BB#5:                                 ; %bb4
                                        ;   in Loop: Header=BB11_6 Depth=1
#0:	       sub	r1, 1 -> r1
#1:	       add	r0, 1 -> r0
	;;
.BB11_6:                                ; %bb5
                                        ; =>This Inner Loop Header: Depth=1
#0:	       and	r0, 3 -> r2     ; memchr.c:85
	;;
#0:	       cmpne	r2, 0 -> c1     ; memchr.c:85
	;;
#0:	if  c1 br	.BB11_1         ; memchr.c:85
	;;                              ; memchr.c:85
	       nop	2               ; memchr.c:85
	;;
; BB#7:                                 ; %bb6
#0:	       ldi	3 -> r2
	;;
#0:	       cmpult	r2, r1 -> c1    ; memchr.c:94
	;;
#0:	if !c1 br	.BB11_14
	;;
	       nop	2
	;;
; BB#8:                                 ; %bb6.bb13_crit_edge
#0:	       ldga	32896 -> r3
#1:	       br	.BB11_11
	;;
	       nop	2
	;;
.BB11_9:                                ; %bb10
                                        ;   in Loop: Header=BB11_11 Depth=1
#0:	       ldiu	522 -> r4
#1:	       ldm.f	r0, 0           ; memchr.c:112
#2:	       or	r3, 0 -> r6
#3:	       ldiu	1791 -> r7
	;;
#0:	       ldim	321 -> r4
#1:	       ldim	991 -> r7
#2:	       ldih	1028 -> r6
	;;
#0:	       ldx	$mem, 0 -> r5   ; memchr.c:112
#1:	       ldih	80 -> r4
#2:	       ldih	2039 -> r7
	;;
#0:	       xor	r5, r4 -> r4    ; memchr.c:112
#1:	       and	r5, r6 -> r8
	;;
#0:	       xor	r8, r6 -> r5
#1:	       add	r4, r7 -> r4
	;;
#0:	       and	r5, r4 -> r4    ; memchr.c:112
	;;
#0:	       cmpeq	r4, 0 -> c1     ; memchr.c:112
	;;
#0:	if !c1 br	.BB11_14
	;;
	       nop	2
	;;
; BB#10:                                ; %bb12
                                        ;   in Loop: Header=BB11_11 Depth=1
#0:	       sub	r1, 4 -> r1
#1:	       add	r0, 4 -> r0
	;;
.BB11_11:                               ; %bb13
                                        ; =>This Inner Loop Header: Depth=1
#0:	       cmpult	r2, r1 -> c1    ; memchr.c:110
	;;
#0:	if  c1 br	.BB11_9
	;;
	       nop	2
	;;
#0:	       br	.BB11_14
	;;
	       nop	2
	;;
.BB11_12:                               ; %bb15
                                        ;   in Loop: Header=BB11_14 Depth=1
#0:	       ldm.f	r0, 0           ; memchr.c:128
	;;
#0:	       ldx	$membu, r0 -> r2 ; memchr.c:128
	;;
#0:	       cmpne	r2, 10 -> c1    ; memchr.c:128
	;;
#0:	if !c1 ret                      ; memchr.c:133
#1:	if !c1 s2add	r15, 1 -> r15   ; memchr.c:133
	;;                              ; memchr.c:133
	       nop	3               ; memchr.c:133
	;;
; BB#13:                                ; %bb17
                                        ;   in Loop: Header=BB11_14 Depth=1
#0:	       sub	r1, 1 -> r1
#1:	       add	r0, 1 -> r0
	;;
.BB11_14:                               ; %bb18
                                        ; =>This Inner Loop Header: Depth=1
#0:	       cmpeq	r1, 0 -> c1     ; memchr.c:126
	;;
#0:	if !c1 br	.BB11_12
	;;
	       nop	2
	;;
#0:	       br	.BB11_2
	;;
	       nop	2
	;;
	.align	4
_memchr_end:

	.align	4
_memcpy:                                ; @memcpy
	.size	_memcpy_end-_memcpy
_memcpy_start:
; BB#0:                                 ; %entry
#0:	       ldi	15 -> r3
#1:	       wb.s	r15, 2
#2:	       ldiu	8 -> r4
	;;
#0:	       cmpult	r3, r2 -> c1    ; memcpy.c:78
#1:	       sub	r15, r4 -> r15
	;;
#0:	if !c1 br	.BB12_9
#1:	       stm.s	r10, r15, 1
	;;
	       nop	2
	;;
; BB#1:                                 ; %bb
#0:	       or	r1, r0 -> r3    ; memcpy.c:78
	;;
#0:	       and	r3, 3 -> r3     ; memcpy.c:78
	;;
#0:	       cmpeq	r3, 0 -> c1     ; memcpy.c:78
	;;
#0:	if !c1 br	.BB12_10
	;;
	       nop	2
	;;
; BB#2:                                 ; %bb.bb2_crit_edge
#0:	       ldi	0 -> r3
#1:	       ldi	15 -> r4
	;;
.BB12_3:                                ; %bb2
                                        ; =>This Inner Loop Header: Depth=1
#0:	       or	r3, 0 -> r5
	;;
#0:	       sub	r1, r5 -> r6
#1:	       sub	r0, r5 -> r7
	;;
#0:	       ldm.f	r6, 0           ; memcpy.c:86
	;;
#0:	       ldx	$mem, 0 -> r3   ; memcpy.c:86
	;;
#0:	       stm.a	r3, r7, 0       ; memcpy.c:86
#1:	       sub	r5, 16 -> r3
	;;
#0:	       ldm.f	r6, 4           ; memcpy.c:87
	;;
#0:	       ldx	$mem, 0 -> r8   ; memcpy.c:87
	;;
#0:	       stm.a	r8, r7, 1       ; memcpy.c:87
	;;
#0:	       ldm.f	r6, 8           ; memcpy.c:88
	;;
#0:	       ldx	$mem, 0 -> r8   ; memcpy.c:88
	;;
#0:	       stm.a	r8, r7, 2       ; memcpy.c:88
#1:	       add	r2, r3 -> r8
	;;
#0:	       cmpult	r4, r8 -> c1    ; memcpy.c:84
	;;
#0:	if  c1 br	.BB12_3         ; memcpy.c:84
#1:	       ldm.f	r6, 12          ; memcpy.c:89
	;;
#0:	       ldx	$mem, 0 -> r6   ; memcpy.c:89
	;;
#0:	       stm.a	r6, r7, 3       ; memcpy.c:89
	;;                              ; memcpy.c:84
	       nop	0               ; memcpy.c:84
	;;
; BB#4:                                 ; %bb5.preheader
#0:	       ldi	3 -> r4
	;;
#0:	       cmpult	r4, r8 -> c1    ; memcpy.c:94
	;;
#0:	if  c1 br	.BB12_6         ; memcpy.c:94
	;;                              ; memcpy.c:94
	       nop	2               ; memcpy.c:94
	;;
; BB#5:                                 ; %bb5.preheader.bb6_crit_edge
#0:	       sub	r0, r3 -> r0
#1:	       br	.BB12_9
#2:	       sub	r1, r3 -> r1
#3:	       or	r8, 0 -> r2
	;;
	       nop	2
	;;
.BB12_6:                                ; %bb.nph16
#0:	       ldi	0 -> r6
#1:	       add	r2, r3 -> r2
	;;
#0:	       or	r6, 0 -> r7
	;;
.BB12_7:                                ; %bb4
                                        ; =>This Inner Loop Header: Depth=1
#1:	       sub	r2, r6 -> r1.16
#0:	       add	r1, r6 -> r8
#2:	       add	r0, r6 -> r9
#3:	       sub	r7, 4 -> r7
	;;
#1:	       sub	r1.16, 4 -> r10
#0:	       sub	r8, r5 -> r8
#2:	       sub	r9, r5 -> r9
#3:	       add	r6, 4 -> r6
	;;
#0:	       cmpult	r4, r10 -> c1   ; memcpy.c:94
#1:	       ldm.f	r8, 16          ; memcpy.c:96
	;;
#0:	if  c1 br	.BB12_7         ; memcpy.c:94
#1:	       ldx	$mem, 0 -> r8   ; memcpy.c:96
	;;
#0:	       stm.a	r8, r9, 4       ; memcpy.c:96
	;;                              ; memcpy.c:94
	       nop	1               ; memcpy.c:94
	;;
; BB#8:                                 ; %bb5.bb6_crit_edge
#0:	       add	r1, r6 -> r1
#1:	       add	r0, r6 -> r0
#2:	       sub	r2, r6 -> r2
	;;
#0:	       sub	r1, r3 -> r1
#1:	       sub	r0, r3 -> r0
	;;
.BB12_9:                                ; %bb8.preheader
#0:	       cmpeq	r2, 0 -> c1
	;;
#0:	if  c1 br	.BB12_11
	;;
	       nop	2
	;;
.BB12_10:                               ; %bb7
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sub	r2, 1 -> r2
#1:	       ldm.f	r1, 0           ; memcpy.c:106
#2:	       add	r0, 1 -> r4
	;;
#0:	       cmpne	r2, 0 -> c1     ; memcpy.c:105
	;;
#0:	if  c1 br	.BB12_10        ; memcpy.c:105
#1:	       ldx	$membu, r1 -> r3 ; memcpy.c:106
#2:	       add	r1, 1 -> r1
	;;
#0:	       stmb.a	r3, r0, 0       ; memcpy.c:106
#1:	       or	r4, 0 -> r0
	;;                              ; memcpy.c:105
	       nop	1               ; memcpy.c:105
	;;
.BB12_11:                               ; %bb9
#0:	       ldm.s	r15, 4
#1:	       s2add	r15, 2 -> r15
	;;
#0:	       ret
#1:	       ldx	$mem, 0 -> r10
	;;
	       nop	3
	;;
	.align	4
_memcpy_end:

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
#0:	if  c1 br	.BB13_4
#1:	       stm.s	r10, r15, 1     ; memmove.c:92
	;;
	       nop	2
	;;
; BB#1:                                 ; %bb1
#0:	       cmpeq	r2, 0 -> c1
	;;
#0:	if  c1 br	.BB13_15
	;;
	       nop	2
	;;
; BB#2:                                 ; %bb.nph34
#0:	       ldi	0 -> r3
	;;
#0:	       sub	r3, r2 -> r2
	;;
.BB13_3:                                ; %bb2
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sub	r1, r2 -> r3
#1:	       sub	r0, r2 -> r5
#2:	       add	r2, 1 -> r2
	;;
#0:	       cmpeq	r2, 0 -> c1
#1:	       ldm.f	r3, -1          ; memmove.c:99
#2:	       sub	r3, 1 -> r4
	;;
#0:	if !c1 br	.BB13_3
#1:	       ldx	$membu, r4 -> r3 ; memmove.c:99
#2:	       sub	r5, 1 -> r4
	;;
#0:	       stmb.a	r3, r4, 0       ; memmove.c:99
	;;
	       nop	1
	;;
#0:	       br	.BB13_15
	;;
	       nop	2
	;;
.BB13_4:                                ; %bb4
#0:	       ldi	15 -> r3
	;;
#0:	       cmpult	r3, r2 -> c1    ; memmove.c:107
	;;
#0:	if !c1 br	.BB13_13
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
#0:	if !c1 br	.BB13_14
	;;
	       nop	2
	;;
; BB#6:                                 ; %bb5.bb7_crit_edge
#0:	       ldi	0 -> r3
#1:	       ldi	15 -> r4
	;;
.BB13_7:                                ; %bb7
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
#0:	if  c1 br	.BB13_7         ; memmove.c:113
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
#0:	if  c1 br	.BB13_10        ; memmove.c:123
	;;                              ; memmove.c:123
	       nop	2               ; memmove.c:123
	;;
; BB#9:                                 ; %bb10.preheader.bb11_crit_edge
#0:	       sub	r0, r3 -> r0
#1:	       br	.BB13_13
#2:	       sub	r1, r3 -> r1
#3:	       or	r8, 0 -> r2
	;;
	       nop	2
	;;
.BB13_10:                               ; %bb.nph22
#0:	       ldi	0 -> r6
#1:	       add	r2, r3 -> r2
	;;
#0:	       or	r6, 0 -> r7
	;;
.BB13_11:                               ; %bb9
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
#0:	if  c1 br	.BB13_11        ; memmove.c:123
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
.BB13_13:                               ; %bb13.preheader
#0:	       cmpeq	r2, 0 -> c1
	;;
#0:	if  c1 br	.BB13_15
	;;
	       nop	2
	;;
.BB13_14:                               ; %bb12
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sub	r2, 1 -> r2
#1:	       ldm.f	r1, 0           ; memmove.c:136
#2:	       add	r0, 1 -> r4
	;;
#0:	       cmpne	r2, 0 -> c1     ; memmove.c:134
	;;
#0:	if  c1 br	.BB13_14        ; memmove.c:134
#1:	       ldx	$membu, r1 -> r3 ; memmove.c:136
#2:	       add	r1, 1 -> r1
	;;
#0:	       stmb.a	r3, r0, 0       ; memmove.c:136
#1:	       or	r4, 0 -> r0
	;;                              ; memmove.c:134
	       nop	1               ; memmove.c:134
	;;
.BB13_15:                               ; %bb14
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
#0:	       wb.s	r15, 4          ; findfp.c:165
#2:	       ldiu	16 -> r1        ; findfp.c:165
#1:	       ldx	$rb, 0 -> r1.31 ; findfp.c:165
	;;
#0:	       sub	r15, r1 -> r15  ; findfp.c:165
#2:	       ldx	$ro, 0 -> r2.31 ; findfp.c:165
	;;
#0:	       stm.s	r14, r15, 0     ; findfp.c:165
#1:	       or	r15, 0 -> r14   ; findfp.c:165
	;;
#1:	       stm.s	r1.31, r15, 1   ; findfp.c:165
	;;
#2:	       stm.s	r2.31, r15, 2   ; findfp.c:165
	;;
#0:	       callg	__fwalk         ; findfp.c:165
	;;                              ; findfp.c:165
	       nop	3               ; findfp.c:165
	;;
#0:	       or	r14, 0 -> r15   ; findfp.c:167
	;;
#0:	       ldm.s	r15, 8          ; findfp.c:167
	;;
#3:	       ldx	$mem, 0 -> r3.31 ; findfp.c:167
#0:	       ldm.s	r15, 4          ; findfp.c:167
	;;
#3:	       stx	r3.31 -> $ro    ; findfp.c:167
	;;
#0:	       ldx	$mem, 0 -> r0.31 ; findfp.c:167
#1:	       ldm.s	r15, 0          ; findfp.c:167
#2:	       s2add	r15, 4 -> r15   ; findfp.c:167
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
#0:	if  c1 br	.BB15_3         ; findfp.c:187
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
.BB15_2:                                ; %bb
#0:	       ldm.s	r15, 0          ; findfp.c:227
#1:	       s2add	r15, 7 -> r15   ; findfp.c:227
	;;
#0:	       ret                      ; findfp.c:227
#1:	       ldx	$mem, 0 -> r14  ; findfp.c:227
	;;                              ; findfp.c:227
	       nop	3               ; findfp.c:227
	;;
.BB15_3:                                ; %bb1
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
#0:	       br	.BB15_2
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
___smakebuf_r:                          ; @__smakebuf_r
	.size	___smakebuf_r_end-___smakebuf_r
___smakebuf_r_start:
; BB#0:                                 ; %entry
#1:	       wb.s	r15, 6          ; makebuf.c:50
#2:	       ldiu	24 -> r2        ; makebuf.c:50
#0:	       ldx	$ro, 0 -> r0.31 ; makebuf.c:50
#3:	       add	r0, 12 -> r1    ; makebuf.c:50
	;;
#0:	       sub	r15, r2 -> r15  ; makebuf.c:50
	;;
#3:	       ldx	$rb, 0 -> r3.31 ; makebuf.c:50
	;;
#0:	       stm.s	r14, r15, 0     ; makebuf.c:50
#1:	       or	r15, 0 -> r14   ; makebuf.c:50
	;;
#3:	       stm.s	r3.31, r15, 1   ; makebuf.c:50
	;;
#0:	       stm.s	r0.31, r15, 2   ; makebuf.c:50
	;;
#0:	       stm.s	r10, r14, 5     ; makebuf.c:50
#1:	       or	r0, 0 -> r10
	;;
#0:	       stm.s	r11, r14, 4     ; makebuf.c:50
	;;
#0:	       ldm.f	r0, 12          ; makebuf.c:50
	;;
#0:	       ldx	$memhu, r1 -> r1 ; makebuf.c:50
	;;
#0:	       btest	r1, 1 -> c1     ; makebuf.c:50
	;;
#0:	if !c1 br	.BB16_4         ; makebuf.c:50
	;;                              ; makebuf.c:50
	       nop	2               ; makebuf.c:50
	;;
; BB#1:                                 ; %bb
#0:	       stm.a	1, r10, 5       ; makebuf.c:53
#1:	       ldi	67 -> r1
	;;
#0:	       add	r10, r1 -> r1
	;;
#0:	       stm.a	r1, r10, 0      ; makebuf.c:52
	;;
#0:	       stm.a	r1, r10, 4      ; makebuf.c:52
	;;
.BB16_2:                                ; %bb
#0:	       ldm.s	r14, 16         ; makebuf.c:111
#1:	       or	r14, 0 -> r15   ; makebuf.c:111
	;;
#0:	       ldx	$mem, 0 -> r11  ; makebuf.c:111
#1:	       ldm.s	r14, 20         ; makebuf.c:111
	;;
#0:	       ldx	$mem, 0 -> r10  ; makebuf.c:111
#1:	       ldm.s	r15, 8          ; makebuf.c:111
	;;
#1:	       ldx	$mem, 0 -> r1.31 ; makebuf.c:111
#0:	       ldm.s	r15, 4          ; makebuf.c:111
	;;
#1:	       stx	r1.31 -> $ro    ; makebuf.c:111
	;;
#2:	       ldx	$mem, 0 -> r2.31 ; makebuf.c:111
	;;
#2:	       stx	r2.31 -> $rb    ; makebuf.c:111
	;;
.BB16_3:                                ; %bb
#0:	       ldm.s	r15, 0          ; makebuf.c:111
#1:	       s2add	r15, 6 -> r15   ; makebuf.c:111
	;;
#0:	       ret                      ; makebuf.c:111
#1:	       ldx	$mem, 0 -> r14  ; makebuf.c:111
	;;                              ; makebuf.c:111
	       nop	3               ; makebuf.c:111
	;;
.BB16_4:                                ; %bb1
#0:	       ldm.f	r10, 14         ; makebuf.c:59
#1:	       add	r10, 14 -> r0   ; makebuf.c:59
#2:	       ldi	-1 -> r2
	;;
#0:	       ldx	$memhs, r0 -> r0 ; makebuf.c:59
	;;
#0:	       cmplt	r2, r0 -> c1    ; makebuf.c:59
	;;
#0:	if !c1 br	.BB16_7
	;;
	       nop	2
	;;
; BB#5:                                 ; %bb2
#0:	       mask	r0, 12 -> r0    ; makebuf.c:59
#1:	       callg	__fstat_r
	;;
	       nop	3
	;;
#0:	       cmplt	r0, 0 -> c1     ; makebuf.c:59
#1:	       ldm.f	r10, 12
#2:	       add	r10, 12 -> r1
	;;
#0:	if  c1 br	.BB16_7
#1:	       ldx	$memhu, r1 -> r1
	;;
	       nop	2
	;;
; BB#6:                                 ; %bb2.bb11_crit_edge
#0:	       ldiu	1024 -> r11
#1:	       br	.BB16_8
	;;
	       nop	2
	;;
.BB16_7:                                ; %bb3
#0:	       btest	r1, 7 -> c1
#1:	       ldiu	1024 -> r0
#2:	       ldi	64 -> r11
	;;
#0:	if !c1 or	r0, 0 -> r11
	;;
.BB16_8:                                ; %bb11
#0:	       ldga	2048 -> r0
#1:	       callg	__malloc_r      ; makebuf.c:95
	;;
#0:	       or	r1, r0 -> r0
	;;
#0:	       stmh.a	r0, r10, 6
#1:	       or	r11, 0 -> r0    ; makebuf.c:95
	;;                              ; makebuf.c:95
	       nop	1               ; makebuf.c:95
	;;
#0:	       cmpne	r0, 0 -> c1     ; makebuf.c:95
	;;
#0:	if  c1 br	.BB16_10        ; makebuf.c:95
	;;                              ; makebuf.c:95
	       nop	2               ; makebuf.c:95
	;;
; BB#9:                                 ; %bb12
#0:	       ldm.f	r10, 12         ; makebuf.c:97
#1:	       add	r10, 12 -> r11
#2:	       or	r14, 0 -> r15   ; makebuf.c:111
	;;
#0:	       ldx	$memhu, r11 -> r11 ; makebuf.c:97
	;;
#0:	       btest	r11, 9 -> c1    ; makebuf.c:97
	;;
#0:	if !c1 ldi	67 -> r0
#1:	if !c1 or	r11, 2 -> r11   ; makebuf.c:99
	;;
#0:	if !c1 add	r10, r0 -> r0
	;;
#0:	if !c1 stm.a	r0, r10, 4      ; makebuf.c:100
	;;
#0:	if !c1 stmh.a	r11, r10, 6     ; makebuf.c:99
	;;
#0:	if !c1 stm.a	r0, r10, 0      ; makebuf.c:100
	;;
#0:	if !c1 stm.a	1, r10, 5       ; makebuf.c:101
	;;
#0:	       ldm.s	r14, 16         ; makebuf.c:111
	;;
#0:	       ldx	$mem, 0 -> r11  ; makebuf.c:111
#1:	       ldm.s	r14, 20         ; makebuf.c:111
	;;
#0:	       ldx	$mem, 0 -> r10  ; makebuf.c:111
#1:	       ldm.s	r15, 8          ; makebuf.c:111
	;;
#0:	       br	.BB16_3
#3:	       ldx	$mem, 0 -> r3.31 ; makebuf.c:111
#1:	       ldm.s	r15, 4          ; makebuf.c:111
	;;
#3:	       stx	r3.31 -> $ro    ; makebuf.c:111
	;;
#0:	       ldx	$mem, 0 -> r0.31 ; makebuf.c:111
	;;
#0:	       stx	r0.31 -> $rb    ; makebuf.c:111
	;;
.BB16_10:                               ; %bb14
#0:	       ldga	__cleanup_r -> r1 ; makebuf.c:106
#1:	       ldga	_impure_data -> r2 ; makebuf.c:106
#2:	       add	r10, 12 -> r3
	;;
#0:	       stm.a	r1, r2, 15      ; makebuf.c:106
#1:	       ldi	128 -> r2
	;;
#0:	       ldm.f	r10, 12         ; makebuf.c:107
	;;
#0:	       ldx	$memhu, r3 -> r1 ; makebuf.c:107
#1:	       stm.a	r0, r10, 4      ; makebuf.c:108
	;;
#0:	       br	.BB16_2
#1:	       or	r1, r2 -> r1    ; makebuf.c:107
	;;
#0:	       stmh.a	r1, r10, 6      ; makebuf.c:107
	;;
#0:	       stm.a	r0, r10, 0      ; makebuf.c:108
	;;
#0:	       stm.a	r11, r10, 5     ; makebuf.c:109
	;;
	.align	4
___smakebuf_r_end:

	.align	4
__fwalk:                                ; @_fwalk
	.size	__fwalk_end-__fwalk
__fwalk_start:
; BB#0:                                 ; %entry
#0:	       wb.s	r15, 7
#2:	       ldiu	28 -> r2
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
#0:	       stm.s	r10, r14, 6
#1:	       add	r0, r1 -> r10   ; fwalk.c:47
	;;
#0:	       cmpeq	r10, 0 -> c1    ; fwalk.c:47
#1:	       stm.s	r11, r14, 5
	;;
#0:	if  c1 br	.BB17_7
#1:	       stm.s	r12, r14, 4
	;;
	       nop	2
	;;
.BB17_1:                                ; %bb
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB17_3 Depth 2
#0:	       ldm.f	r10, 4          ; fwalk.c:48
	;;
#0:	       ldx	$mem, 0 -> r11  ; fwalk.c:48
	;;
#0:	       sub	r11, 1 -> r0
	;;
#0:	       cmplt	r0, 0 -> c1     ; fwalk.c:48
	;;
#0:	if  c1 br	.BB17_6
	;;
	       nop	2
	;;
; BB#2:                                 ; %bb.nph
                                        ;   in Loop: Header=BB17_1 Depth=1
#0:	       ldm.f	r10, 8          ; fwalk.c:48
	;;
#0:	       ldx	$mem, 0 -> r12  ; fwalk.c:48
	;;
.BB17_3:                                ; %bb1
                                        ;   Parent Loop BB17_1 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.f	r12, 12         ; fwalk.c:49
#1:	       add	r12, 12 -> r0
	;;
#0:	       ldx	$memhu, r0 -> r0 ; fwalk.c:49
	;;
#0:	       cmpult	r0, 2 -> c1     ; fwalk.c:49
	;;
#0:	if !c1 ldm.f	r12, 14         ; fwalk.c:51
#1:	if !c1 add	r12, 14 -> r0
#2:	if !c1 ldiu	2047 -> r1
	;;
#0:	if !c1 ldim	31 -> r1
	;;
#0:	if !c1 ldx	$memhu, r0 -> r0 ; fwalk.c:51
	;;
#0:	if !c1 cmpeq	r0, r1 -> c1    ; fwalk.c:51
	;;
#0:	if  c1 br	.BB17_5
	;;
	       nop	2
	;;
; BB#4:                                 ; %bb4
                                        ;   in Loop: Header=BB17_3 Depth=2
#0:	       or	r12, 0 -> r0    ; fwalk.c:52
#1:	       callg	_fclose         ; fwalk.c:52
	;;                              ; fwalk.c:52
	       nop	3               ; fwalk.c:52
	;;
.BB17_5:                                ; %bb5
                                        ;   in Loop: Header=BB17_3 Depth=2
#0:	       sub	r11, 1 -> r11
#1:	       s2add	r12, 26 -> r12
	;;
#0:	       cmpne	r11, 0 -> c1    ; fwalk.c:48
	;;
#0:	if  c1 br	.BB17_3
	;;
	       nop	2
	;;
.BB17_6:                                ; %bb7
                                        ;   in Loop: Header=BB17_1 Depth=1
#0:	       ldm.f	r10, 0          ; fwalk.c:47
	;;
#0:	       ldx	$mem, 0 -> r10  ; fwalk.c:47
	;;
#0:	       cmpne	r10, 0 -> c1    ; fwalk.c:47
	;;
#0:	if  c1 br	.BB17_1
	;;
	       nop	2
	;;
.BB17_7:                                ; %bb9
#0:	       ldm.s	r14, 16
#1:	       or	r14, 0 -> r15
	;;
#0:	       ldx	$mem, 0 -> r12
#1:	       ldm.s	r14, 20
	;;
#0:	       ldx	$mem, 0 -> r11
#1:	       ldm.s	r14, 24
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
#1:	       ldm.s	r15, 0
#2:	       s2add	r15, 7 -> r15
	;;
#0:	       stx	r0.31 -> $rb
	;;
#0:	       ret
#1:	       ldx	$mem, 0 -> r14
	;;
	       nop	3
	;;
	.align	4
__fwalk_end:

	.align	4
__sbrk_r:                               ; @_sbrk_r
	.size	__sbrk_r_end-__sbrk_r
__sbrk_r_start:
; BB#0:                                 ; %entry
#0:	       wb.s	r15, 4
#2:	       ldiu	16 -> r2
#1:	       ldx	$rb, 0 -> r1.31
#3:	       ldga	_errno.b -> r0
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
#0:	       stmb.a	0, r0, 0
#1:	       or	r1, 0 -> r0     ; sbrkr.c:60
	;;
#0:	       callg	__sbrk          ; sbrkr.c:60
	;;                              ; sbrkr.c:60
	       nop	3               ; sbrkr.c:60
	;;
#0:	       or	r14, 0 -> r15   ; sbrkr.c:62
	;;
#0:	       ldm.s	r15, 8          ; sbrkr.c:62
	;;
#3:	       ldx	$mem, 0 -> r3.31 ; sbrkr.c:62
#0:	       ldm.s	r15, 4          ; sbrkr.c:62
	;;
#3:	       stx	r3.31 -> $ro    ; sbrkr.c:62
	;;
#0:	       ldx	$mem, 0 -> r0.31 ; sbrkr.c:62
#1:	       ldm.s	r15, 0          ; sbrkr.c:62
#2:	       s2add	r15, 4 -> r15   ; sbrkr.c:62
	;;
#0:	       stx	r0.31 -> $rb    ; sbrkr.c:62
	;;
#0:	       ret                      ; sbrkr.c:62
#1:	       ldx	$mem, 0 -> r14  ; sbrkr.c:62
	;;                              ; sbrkr.c:62
	       nop	3               ; sbrkr.c:62
	;;
	.align	4
__sbrk_r_end:

	.align	4
___sread:                               ; @__sread
	.size	___sread_end-___sread
___sread_start:
; BB#0:                                 ; %entry
#0:	       wb.s	r15, 5
#2:	       ldiu	20 -> r5
#1:	       ldx	$rb, 0 -> r1.31
#3:	       add	r1, 14 -> r4
	;;
#0:	       sub	r15, r5 -> r15
#2:	       ldx	$ro, 0 -> r2.31
	;;
#0:	       stm.s	r14, r15, 0
#1:	       or	r15, 0 -> r14
	;;
#1:	       stm.s	r1.31, r15, 1
	;;
#2:	       stm.s	r2.31, r15, 2
	;;
#0:	       stm.s	r10, r14, 4
#1:	       or	r1, 0 -> r10
	;;
#0:	       ldm.f	r1, 14          ; stdio.c:48
	;;
#0:	       callg	__read_r        ; stdio.c:48
#1:	       ldx	$memhs, r4 -> r4 ; stdio.c:48
	;;
#0:	       or	r4, 0 -> r1     ; stdio.c:48
	;;                              ; stdio.c:48
	       nop	2               ; stdio.c:48
	;;
#0:	       cmplt	r0, 0 -> c1     ; stdio.c:57
	;;
#0:	if  c1 br	.BB19_3         ; stdio.c:57
	;;                              ; stdio.c:57
	       nop	2               ; stdio.c:57
	;;
; BB#1:                                 ; %bb
#0:	       ldm.f	r10, 80         ; stdio.c:58
#1:	       or	r14, 0 -> r15   ; stdio.c:61
	;;
#0:	       ldx	$mem, 0 -> r1   ; stdio.c:58
	;;
#0:	       add	r1, r0 -> r1    ; stdio.c:58
	;;
#0:	       stm.a	r1, r10, 20     ; stdio.c:58
	;;
#0:	       ldm.s	r14, 16         ; stdio.c:61
	;;
#0:	       ldx	$mem, 0 -> r10  ; stdio.c:61
#1:	       ldm.s	r15, 8          ; stdio.c:61
	;;
#3:	       ldx	$mem, 0 -> r3.31 ; stdio.c:61
#0:	       ldm.s	r15, 4          ; stdio.c:61
	;;
#3:	       stx	r3.31 -> $ro    ; stdio.c:61
	;;
#0:	       ldx	$mem, 0 -> r0.31 ; stdio.c:61
	;;
#0:	       stx	r0.31 -> $rb    ; stdio.c:61
	;;
.BB19_2:                                ; %bb
#0:	       ldm.s	r15, 0          ; stdio.c:61
#1:	       s2add	r15, 5 -> r15   ; stdio.c:61
	;;
#0:	       ret                      ; stdio.c:61
#1:	       ldx	$mem, 0 -> r14  ; stdio.c:61
	;;                              ; stdio.c:61
	       nop	3               ; stdio.c:61
	;;
.BB19_3:                                ; %bb1
#0:	       ldm.f	r10, 12         ; stdio.c:60
#1:	       add	r10, 12 -> r1
#2:	       ldiu	2047 -> r2
#3:	       or	r14, 0 -> r15   ; stdio.c:61
	;;
#0:	       ldim	29 -> r2
	;;
#0:	       ldx	$memhu, r1 -> r1 ; stdio.c:60
	;;
#0:	       and	r1, r2 -> r1    ; stdio.c:60
	;;
#0:	       stmh.a	r1, r10, 6      ; stdio.c:60
	;;
#0:	       ldm.s	r14, 16         ; stdio.c:61
	;;
#0:	       ldx	$mem, 0 -> r10  ; stdio.c:61
#1:	       ldm.s	r15, 8          ; stdio.c:61
	;;
#0:	       br	.BB19_2
#1:	       ldx	$mem, 0 -> r1.31 ; stdio.c:61
#2:	       ldm.s	r15, 4          ; stdio.c:61
	;;
#1:	       stx	r1.31 -> $ro    ; stdio.c:61
	;;
#2:	       ldx	$mem, 0 -> r2.31 ; stdio.c:61
	;;
#2:	       stx	r2.31 -> $rb    ; stdio.c:61
	;;
	.align	4
___sread_end:

	.align	4
___sclose:                              ; @__sclose
	.size	___sclose_end-___sclose
___sclose_start:
; BB#0:                                 ; %entry
#1:	       wb.s	r15, 4
#2:	       ldiu	16 -> r3
#0:	       ldx	$ro, 0 -> r0.31
#3:	       add	r1, 14 -> r2
	;;
#0:	       sub	r15, r3 -> r15
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
#0:	       ldm.f	r1, 14          ; stdio.c:135
	;;
#0:	       callg	__close_r       ; stdio.c:135
#1:	       ldx	$memhs, r2 -> r1 ; stdio.c:135
	;;                              ; stdio.c:135
	       nop	3               ; stdio.c:135
	;;
#0:	       or	r14, 0 -> r15   ; stdio.c:135
	;;
#0:	       ldm.s	r15, 8          ; stdio.c:135
	;;
#1:	       ldx	$mem, 0 -> r1.31 ; stdio.c:135
#0:	       ldm.s	r15, 4          ; stdio.c:135
	;;
#1:	       stx	r1.31 -> $ro    ; stdio.c:135
	;;
#2:	       ldx	$mem, 0 -> r2.31 ; stdio.c:135
#0:	       ldm.s	r15, 0          ; stdio.c:135
#1:	       s2add	r15, 4 -> r15   ; stdio.c:135
	;;
#2:	       stx	r2.31 -> $rb    ; stdio.c:135
	;;
#0:	       ret                      ; stdio.c:135
#1:	       ldx	$mem, 0 -> r14  ; stdio.c:135
	;;                              ; stdio.c:135
	       nop	3               ; stdio.c:135
	;;
	.align	4
___sclose_end:

	.align	4
___sseek:                               ; @__sseek
	.size	___sseek_end-___sseek
___sseek_start:
; BB#0:                                 ; %entry
#1:	       wb.s	r15, 6
#2:	       ldiu	24 -> r4
#0:	       ldx	$ro, 0 -> r0.31
	;;
#0:	       sub	r15, r4 -> r15
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
#0:	       stm.s	r10, r14, 5
#1:	       or	r1, 0 -> r10
	;;
#0:	       stm.s	r11, r14, 4
#1:	       add	r10, 14 -> r1
#2:	       add	r10, 12 -> r11
	;;
#0:	       ldm.f	r10, 14         ; stdio.c:117
	;;
#0:	       callg	__lseek_r       ; stdio.c:117
#1:	       ldx	$memhs, r1 -> r1 ; stdio.c:117
	;;                              ; stdio.c:117
	       nop	3               ; stdio.c:117
	;;
#0:	       cmpne	r0, -1 -> c1    ; stdio.c:118
#1:	       ldm.f	r10, 12         ; stdio.c:119
	;;
#0:	if  c1 br	.BB21_3         ; stdio.c:118
#1:	       ldx	$memhu, r11 -> r1 ; stdio.c:119
	;;                              ; stdio.c:118
	       nop	2               ; stdio.c:118
	;;
; BB#1:                                 ; %bb
#0:	       ldiu	2047 -> r2
#1:	       or	r14, 0 -> r15   ; stdio.c:125
	;;
#0:	       ldim	29 -> r2
	;;
#0:	       and	r1, r2 -> r1    ; stdio.c:119
	;;
#0:	       stmh.a	r1, r10, 6      ; stdio.c:119
	;;
#0:	       ldm.s	r14, 16         ; stdio.c:125
	;;
#0:	       ldx	$mem, 0 -> r11  ; stdio.c:125
#1:	       ldm.s	r14, 20         ; stdio.c:125
	;;
#0:	       ldx	$mem, 0 -> r10  ; stdio.c:125
#1:	       ldm.s	r15, 8          ; stdio.c:125
	;;
#1:	       ldx	$mem, 0 -> r1.31 ; stdio.c:125
#0:	       ldm.s	r15, 4          ; stdio.c:125
	;;
#1:	       stx	r1.31 -> $ro    ; stdio.c:125
	;;
#2:	       ldx	$mem, 0 -> r2.31 ; stdio.c:125
	;;
#2:	       stx	r2.31 -> $rb    ; stdio.c:125
	;;
.BB21_2:                                ; %bb
#0:	       ldm.s	r15, 0          ; stdio.c:125
#1:	       s2add	r15, 6 -> r15   ; stdio.c:125
	;;
#0:	       ret                      ; stdio.c:125
#1:	       ldx	$mem, 0 -> r14  ; stdio.c:125
	;;                              ; stdio.c:125
	       nop	3               ; stdio.c:125
	;;
.BB21_3:                                ; %bb1
#0:	       ldga	4096 -> r2
#1:	       or	r14, 0 -> r15   ; stdio.c:125
	;;
#0:	       or	r1, r2 -> r1    ; stdio.c:122
	;;
#0:	       stmh.a	r1, r10, 6      ; stdio.c:122
	;;
#0:	       stm.a	r0, r10, 20     ; stdio.c:123
	;;
#0:	       ldm.s	r14, 16         ; stdio.c:125
	;;
#0:	       ldx	$mem, 0 -> r11  ; stdio.c:125
#1:	       ldm.s	r14, 20         ; stdio.c:125
	;;
#0:	       ldx	$mem, 0 -> r10  ; stdio.c:125
#1:	       ldm.s	r15, 8          ; stdio.c:125
	;;
#0:	       br	.BB21_2
#3:	       ldx	$mem, 0 -> r3.31 ; stdio.c:125
#1:	       ldm.s	r15, 4          ; stdio.c:125
	;;
#3:	       stx	r3.31 -> $ro    ; stdio.c:125
	;;
#0:	       ldx	$mem, 0 -> r0.31 ; stdio.c:125
	;;
#0:	       stx	r0.31 -> $rb    ; stdio.c:125
	;;
	.align	4
___sseek_end:

	.align	4
___swrite:                              ; @__swrite
	.size	___swrite_end-___swrite
___swrite_start:
; BB#0:                                 ; %entry
#0:	       wb.s	r15, 9
#2:	       ldiu	36 -> r5
#1:	       ldx	$rb, 0 -> r1.31
#3:	       add	r1, 12 -> r4
	;;
#0:	       sub	r15, r5 -> r15
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
#1:	       or	r0, 0 -> r10
	;;
#0:	       stm.s	r11, r14, 7
#1:	       or	r1, 0 -> r11
	;;
#0:	       stm.s	r12, r14, 6
#1:	       or	r2, 0 -> r12
	;;
#0:	       stm.s	r13, r14, 5
#1:	       or	r3, 0 -> r13
	;;
#2:	       stm.s	r2.23, r14, 4
	;;
#0:	       ldm.f	r1, 12          ; stdio.c:88
	;;
#0:	       ldx	$memhu, r4 -> r4 ; stdio.c:88
	;;
#0:	       btest	r4, 8 -> c1     ; stdio.c:88
	;;
#0:	if !c1 br	.BB22_2
	;;
	       nop	2
	;;
; BB#1:                                 ; %bb
#0:	       ldm.f	r11, 14         ; stdio.c:89
#1:	       add	r11, 14 -> r4
#2:	       ldi	0 -> r2
#3:	       ldi	2 -> r3
	;;
#2:	       add	r11, 12 -> r2.23
#0:	       or	r10, 0 -> r0    ; stdio.c:89
	;;
#0:	       callg	__lseek_r       ; stdio.c:89
#1:	       ldx	$memhs, r4 -> r1 ; stdio.c:89
	;;                              ; stdio.c:89
	       nop	3               ; stdio.c:89
	;;
#0:	       ldm.f	r11, 12
	;;
#2:	       ldx	$memhu, r2.23 -> r4
	;;
.BB22_2:                                ; %bb1
#0:	       ldiu	2047 -> r0
#1:	       add	r11, 14 -> r1
#2:	       or	r12, 0 -> r2    ; stdio.c:97
#3:	       or	r13, 0 -> r3    ; stdio.c:97
	;;
#0:	       ldim	29 -> r0
	;;
#0:	       and	r4, r0 -> r0    ; stdio.c:90
	;;
#0:	       stmh.a	r0, r11, 6      ; stdio.c:90
#1:	       or	r10, 0 -> r0    ; stdio.c:97
	;;
#0:	       ldm.f	r11, 14         ; stdio.c:97
	;;
#0:	       callg	__write_r       ; stdio.c:97
#1:	       ldx	$memhs, r1 -> r1 ; stdio.c:97
	;;                              ; stdio.c:97
	       nop	3               ; stdio.c:97
	;;
#0:	       ldm.s	r14, 16         ; stdio.c:104
#1:	       or	r14, 0 -> r15   ; stdio.c:104
	;;
#2:	       ldx	$mem, 0 -> r2.23 ; stdio.c:104
#0:	       ldm.s	r14, 20         ; stdio.c:104
	;;
#0:	       ldx	$mem, 0 -> r13  ; stdio.c:104
#1:	       ldm.s	r14, 24         ; stdio.c:104
	;;
#0:	       ldx	$mem, 0 -> r12  ; stdio.c:104
#1:	       ldm.s	r14, 28         ; stdio.c:104
	;;
#0:	       ldx	$mem, 0 -> r11  ; stdio.c:104
#1:	       ldm.s	r14, 32         ; stdio.c:104
	;;
#0:	       ldx	$mem, 0 -> r10  ; stdio.c:104
#1:	       ldm.s	r15, 8          ; stdio.c:104
	;;
#3:	       ldx	$mem, 0 -> r3.31 ; stdio.c:104
#0:	       ldm.s	r15, 4          ; stdio.c:104
	;;
#3:	       stx	r3.31 -> $ro    ; stdio.c:104
	;;
#0:	       ldx	$mem, 0 -> r0.31 ; stdio.c:104
#1:	       ldm.s	r15, 0          ; stdio.c:104
#2:	       s2add	r15, 9 -> r15   ; stdio.c:104
	;;
#0:	       stx	r0.31 -> $rb    ; stdio.c:104
	;;
#0:	       ret                      ; stdio.c:104
#1:	       ldx	$mem, 0 -> r14  ; stdio.c:104
	;;                              ; stdio.c:104
	       nop	3               ; stdio.c:104
	;;
	.align	4
___swrite_end:

	.align	4
__fstat_r:                              ; @_fstat_r
	.size	__fstat_r_end-__fstat_r
__fstat_r_start:
; BB#0:                                 ; %entry
#0:	       wb.s	r15, 4
#2:	       ldiu	16 -> r2
#1:	       ldx	$rb, 0 -> r1.31
#3:	       ldga	_errno.b -> r1
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
#0:	       stmb.a	0, r1, 0
	;;
#0:	       callg	__fstat
	;;
	       nop	3
	;;
#0:	       cmpne	r0, -1 -> c1    ; fstatr.c:62
	;;
#0:	if  c1 br	.BB23_3
	;;
	       nop	2
	;;
; BB#1:                                 ; %bb
#0:	       ldmg.d	_errno.b
#1:	       ldga	_errno.b -> r1
	;;
#0:	       ldx	$membu, r1 -> r1
	;;
#0:	       cmpne	r1, -1 -> c1    ; fstatr.c:62
	;;
#0:	if  c1 br	.BB23_3
	;;
	       nop	2
	;;
; BB#2:                                 ; %bb1
#0:	       stx	r1 -> $c1
#1:	       ldi	88 -> r1
#2:	       ldi	0 -> r2
#3:	       or	r14, 0 -> r15   ; fstatr.c:64
	;;
#0:	if  c1 or	r1, 0 -> r2
#1:	       ldga	_impure_data -> r1 ; fstatr.c:63
	;;
#0:	       stm.a	r2, r1, 0       ; fstatr.c:63
	;;
#0:	       ldm.s	r15, 8          ; fstatr.c:64
	;;
#0:	       br	.BB23_4
#3:	       ldx	$mem, 0 -> r3.31 ; fstatr.c:64
#1:	       ldm.s	r15, 4          ; fstatr.c:64
	;;
#3:	       stx	r3.31 -> $ro    ; fstatr.c:64
	;;
#0:	       ldx	$mem, 0 -> r0.31 ; fstatr.c:64
	;;
#0:	       stx	r0.31 -> $rb    ; fstatr.c:64
	;;
.BB23_3:                                ; %bb2
#0:	       or	r14, 0 -> r15   ; fstatr.c:64
	;;
#0:	       ldm.s	r15, 8          ; fstatr.c:64
	;;
#1:	       ldx	$mem, 0 -> r1.31 ; fstatr.c:64
#0:	       ldm.s	r15, 4          ; fstatr.c:64
	;;
#1:	       stx	r1.31 -> $ro    ; fstatr.c:64
	;;
#2:	       ldx	$mem, 0 -> r2.31 ; fstatr.c:64
	;;
#2:	       stx	r2.31 -> $rb    ; fstatr.c:64
	;;
.BB23_4:                                ; %bb2
#0:	       ldm.s	r15, 0          ; fstatr.c:64
#1:	       s2add	r15, 4 -> r15   ; fstatr.c:64
	;;
#0:	       ret                      ; fstatr.c:64
#1:	       ldx	$mem, 0 -> r14  ; fstatr.c:64
	;;                              ; fstatr.c:64
	       nop	3               ; fstatr.c:64
	;;
	.align	4
__fstat_r_end:

	.align	4
__fclose_r:                             ; @_fclose_r
	.size	__fclose_r_end-__fclose_r
__fclose_r_start:
; BB#0:                                 ; %entry
#1:	       wb.s	r15, 8
#2:	       ldiu	32 -> r1
#0:	       ldx	$ro, 0 -> r0.31
	;;
#0:	       sub	r15, r1 -> r15
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
#0:	       stm.s	r10, r14, 7
#1:	       or	r0, 0 -> r10
	;;
#0:	       cmpeq	r10, 0 -> c1    ; fclose.c:74
#1:	       stm.s	r11, r14, 6
	;;
#0:	if  c1 br	.BB24_15
#1:	       stm.s	r12, r14, 5
	;;
#0:	       stm.s	r13, r14, 4
	;;
	       nop	1
	;;
; BB#1:                                 ; %bb2
#0:	       ldmg.d	_impure_data+56 ; fclose.c:77
	;;
#0:	       ldx	$mem, 0 -> r0   ; fclose.c:77
	;;
#0:	       cmpne	r0, 0 -> c1     ; fclose.c:77
	;;
#0:	if  c1 br	.BB24_3
	;;
	       nop	2
	;;
; BB#2:                                 ; %bb3
#0:	       ldga	_impure_data -> r0 ; fclose.c:77
#1:	       callg	___sinit        ; fclose.c:77
	;;                              ; fclose.c:77
	       nop	3               ; fclose.c:77
	;;
.BB24_3:                                ; %bb4
#0:	       ldm.f	r10, 12         ; fclose.c:81
#1:	       add	r10, 12 -> r11  ; fclose.c:81
	;;
#0:	       ldx	$memhu, r11 -> r0 ; fclose.c:81
	;;
#0:	       cmpeq	r0, 0 -> c1     ; fclose.c:81
	;;
#0:	if  c1 br	.BB24_15
	;;
	       nop	2
	;;
; BB#4:                                 ; %bb6
#0:	       ldga	_impure_data -> r0 ; fclose.c:89
#1:	       callg	__fflush_r      ; fclose.c:89
#2:	       or	r10, 0 -> r1    ; fclose.c:89
	;;                              ; fclose.c:89
	       nop	3               ; fclose.c:89
	;;
#0:	       ldm.f	r10, 44         ; fclose.c:90
#1:	       or	r0, 0 -> r12    ; fclose.c:89
	;;
#0:	       ldx	$mem, 0 -> r2   ; fclose.c:90
	;;
#0:	       cmpne	r2, 0 -> c1     ; fclose.c:90
	;;
#0:	if !c1 br	.BB24_6
	;;
	       nop	2
	;;
; BB#5:                                 ; %bb7
#0:	       ldm.f	r10, 28         ; fclose.c:90
#1:	       ldga	_impure_data -> r0 ; fclose.c:90
#2:	       ldi	-1 -> r13
	;;
#0:	       ldx	$mem, 0 -> r1   ; fclose.c:90
	;;
#0:	       call	r2              ; fclose.c:90
	;;                              ; fclose.c:90
	       nop	3               ; fclose.c:90
	;;
#0:	       cmplt	r13, r0 -> c1   ; fclose.c:90
	;;
#0:	if !c1 ldi	-1 -> r12
	;;
.BB24_6:                                ; %bb9
#0:	       ldm.f	r10, 12
	;;
#0:	       ldx	$memhu, r11 -> r0
	;;
#0:	       btest	r0, 7 -> c1     ; fclose.c:92
	;;
#0:	if !c1 br	.BB24_8
	;;
	       nop	2
	;;
; BB#7:                                 ; %bb10
#0:	       ldm.f	r10, 16         ; fclose.c:93
#1:	       ldga	_impure_data -> r0 ; fclose.c:93
	;;
#0:	       callg	__free_r        ; fclose.c:93
#1:	       ldx	$mem, 0 -> r1   ; fclose.c:93
	;;                              ; fclose.c:93
	       nop	3               ; fclose.c:93
	;;
.BB24_8:                                ; %bb11
#0:	       ldm.f	r10, 48         ; fclose.c:94
	;;
#0:	       ldx	$mem, 0 -> r1   ; fclose.c:94
	;;
#0:	       cmpeq	r1, 0 -> c1     ; fclose.c:94
	;;
#0:	if  c1 br	.BB24_12
	;;
	       nop	2
	;;
; BB#9:                                 ; %bb12
#0:	       s2add	r10, 16 -> r0
	;;
#0:	       cmpeq	r1, r0 -> c1    ; fclose.c:95
	;;
#0:	if  c1 br	.BB24_11
	;;
	       nop	2
	;;
; BB#10:                                ; %bb13
#0:	       ldga	_impure_data -> r0 ; fclose.c:95
#1:	       callg	__free_r        ; fclose.c:95
	;;                              ; fclose.c:95
	       nop	3               ; fclose.c:95
	;;
.BB24_11:                               ; %bb14
#0:	       stm.a	0, r10, 12      ; fclose.c:95
	;;
.BB24_12:                               ; %bb15
#0:	       ldm.f	r10, 68         ; fclose.c:96
	;;
#0:	       ldx	$mem, 0 -> r1   ; fclose.c:96
	;;
#0:	       cmpeq	r1, 0 -> c1     ; fclose.c:96
	;;
#0:	if  c1 br	.BB24_14
	;;
	       nop	2
	;;
; BB#13:                                ; %bb16
#0:	       ldga	_impure_data -> r0 ; fclose.c:97
#1:	       callg	__free_r        ; fclose.c:97
	;;                              ; fclose.c:97
	       nop	3               ; fclose.c:97
	;;
#0:	       stm.a	0, r10, 17      ; fclose.c:97
	;;
.BB24_14:                               ; %bb17
#0:	       stmh.a	0, r10, 6       ; fclose.c:99
#1:	       or	r12, 0 -> r0    ; fclose.c:107
#2:	       or	r14, 0 -> r15   ; fclose.c:107
	;;
#0:	       ldm.s	r14, 16         ; fclose.c:107
	;;
#0:	       ldx	$mem, 0 -> r13  ; fclose.c:107
#1:	       ldm.s	r14, 20         ; fclose.c:107
	;;
#0:	       ldx	$mem, 0 -> r12  ; fclose.c:107
#1:	       ldm.s	r14, 24         ; fclose.c:107
	;;
#0:	       ldx	$mem, 0 -> r11  ; fclose.c:107
#1:	       ldm.s	r14, 28         ; fclose.c:107
	;;
#0:	       ldx	$mem, 0 -> r10  ; fclose.c:107
#1:	       ldm.s	r15, 8          ; fclose.c:107
	;;
#0:	       br	.BB24_16
#1:	       ldx	$mem, 0 -> r1.31 ; fclose.c:107
#2:	       ldm.s	r15, 4          ; fclose.c:107
	;;
#1:	       stx	r1.31 -> $ro    ; fclose.c:107
	;;
#2:	       ldx	$mem, 0 -> r2.31 ; fclose.c:107
	;;
#2:	       stx	r2.31 -> $rb    ; fclose.c:107
	;;
.BB24_15:                               ; %bb18
#0:	       ldm.s	r14, 16         ; fclose.c:107
#1:	       or	r14, 0 -> r15   ; fclose.c:107
#2:	       ldi	0 -> r0
	;;
#0:	       ldx	$mem, 0 -> r13  ; fclose.c:107
#1:	       ldm.s	r14, 20         ; fclose.c:107
	;;
#0:	       ldx	$mem, 0 -> r12  ; fclose.c:107
#1:	       ldm.s	r14, 24         ; fclose.c:107
	;;
#0:	       ldx	$mem, 0 -> r11  ; fclose.c:107
#1:	       ldm.s	r14, 28         ; fclose.c:107
	;;
#0:	       ldx	$mem, 0 -> r10  ; fclose.c:107
#1:	       ldm.s	r15, 8          ; fclose.c:107
	;;
#3:	       ldx	$mem, 0 -> r3.31 ; fclose.c:107
#0:	       ldm.s	r15, 4          ; fclose.c:107
	;;
#3:	       stx	r3.31 -> $ro    ; fclose.c:107
	;;
#0:	       ldx	$mem, 0 -> r0.31 ; fclose.c:107
	;;
#0:	       stx	r0.31 -> $rb    ; fclose.c:107
	;;
.BB24_16:                               ; %bb18
#0:	       ldm.s	r15, 0          ; fclose.c:107
#1:	       s2add	r15, 8 -> r15   ; fclose.c:107
	;;
#0:	       ret                      ; fclose.c:107
#1:	       ldx	$mem, 0 -> r14  ; fclose.c:107
	;;                              ; fclose.c:107
	       nop	3               ; fclose.c:107
	;;
	.align	4
__fclose_r_end:

	.align	4
_fclose:                                ; @fclose
	.size	_fclose_end-_fclose
_fclose_start:
; BB#0:                                 ; %entry
#0:	       wb.s	r15, 4          ; fclose.c:116
#2:	       ldiu	16 -> r1        ; fclose.c:116
#1:	       ldx	$rb, 0 -> r1.31 ; fclose.c:116
	;;
#0:	       sub	r15, r1 -> r15  ; fclose.c:116
#2:	       ldx	$ro, 0 -> r2.31 ; fclose.c:116
	;;
#0:	       stm.s	r14, r15, 0     ; fclose.c:116
#1:	       or	r15, 0 -> r14   ; fclose.c:116
	;;
#1:	       stm.s	r1.31, r15, 1   ; fclose.c:116
	;;
#2:	       stm.s	r2.31, r15, 2   ; fclose.c:116
	;;
#0:	       callg	__fclose_r      ; fclose.c:116
	;;                              ; fclose.c:116
	       nop	3               ; fclose.c:116
	;;
#0:	       or	r14, 0 -> r15   ; fclose.c:116
	;;
#0:	       ldm.s	r15, 8          ; fclose.c:116
	;;
#3:	       ldx	$mem, 0 -> r3.31 ; fclose.c:116
#0:	       ldm.s	r15, 4          ; fclose.c:116
	;;
#3:	       stx	r3.31 -> $ro    ; fclose.c:116
	;;
#0:	       ldx	$mem, 0 -> r0.31 ; fclose.c:116
#1:	       ldm.s	r15, 0          ; fclose.c:116
#2:	       s2add	r15, 4 -> r15   ; fclose.c:116
	;;
#0:	       stx	r0.31 -> $rb    ; fclose.c:116
	;;
#0:	       ret                      ; fclose.c:116
#1:	       ldx	$mem, 0 -> r14  ; fclose.c:116
	;;                              ; fclose.c:116
	       nop	3               ; fclose.c:116
	;;
	.align	4
_fclose_end:

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
#0:	       br	.BB26_3
#1:	       sub	r15, r3 -> r15
	;;
	       nop	2
	;;
.BB26_1:                                ; %bb
                                        ;   in Loop: Header=BB26_3 Depth=1
#0:	       cmpeq	r1, 0 -> c1     ; memset.c:59
	;;
#0:	if  c1 br	.BB26_14
	;;
	       nop	2
	;;
; BB#2:                                 ; %bb1
                                        ;   in Loop: Header=BB26_3 Depth=1
#0:	       add	r2, 1 -> r3
#1:	       stmb.a	0, r2, 0        ; memset.c:60
#2:	       sub	r1, 1 -> r1
	;;
#0:	       or	r3, 0 -> r2
	;;
.BB26_3:                                ; %bb3
                                        ; =>This Inner Loop Header: Depth=1
#0:	       and	r2, 3 -> r3     ; memset.c:57
	;;
#0:	       cmpne	r3, 0 -> c1     ; memset.c:57
	;;
#0:	if  c1 br	.BB26_1         ; memset.c:57
	;;                              ; memset.c:57
	       nop	2               ; memset.c:57
	;;
; BB#4:                                 ; %bb4
#0:	       ldi	3 -> r3
	;;
#0:	       cmpult	r3, r1 -> c1    ; memset.c:65
	;;
#0:	if !c1 br	.BB26_12
	;;
	       nop	2
	;;
; BB#5:                                 ; %bb5
#0:	       ldi	15 -> r3
	;;
#0:	       cmpult	r3, r1 -> c1    ; memset.c:78
	;;
#0:	if !c1 br	.BB26_10
	;;
	       nop	2
	;;
.BB26_6:                                ; %bb8
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sub	r1, 16 -> r4
#1:	       sub	r0, r1 -> r1
	;;
#0:	       stm.a	0, r1, 5        ; memset.c:83
#1:	       cmpult	r3, r4 -> c1    ; memset.c:78
	;;
#0:	if  c1 br	.BB26_6         ; memset.c:78
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
#0:	if  c1 br	.BB26_9         ; memset.c:87
	;;                              ; memset.c:87
	       nop	2               ; memset.c:87
	;;
; BB#8:                                 ; %bb11.preheader.bb12_crit_edge
#0:	       or	r4, 0 -> r1
#1:	       br	.BB26_12
	;;
	       nop	2
	;;
.BB26_9:                                ; %bb11.preheader.bb10_crit_edge
#0:	       or	r4, 0 -> r1
	;;
.BB26_10:                               ; %bb10
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sub	r1, 4 -> r1
#1:	       ldi	3 -> r3
#2:	       add	r2, 4 -> r0
#3:	       stm.a	0, r2, 0        ; memset.c:89
	;;
#0:	       cmpult	r3, r1 -> c1    ; memset.c:87
#1:	       or	r0, 0 -> r2
	;;
#0:	if  c1 br	.BB26_10        ; memset.c:87
	;;                              ; memset.c:87
	       nop	2               ; memset.c:87
	;;
; BB#11:                                ; %bb10.bb12_crit_edge
#0:	       or	r0, 0 -> r2
	;;
.BB26_12:                               ; %bb14.preheader
#0:	       cmpeq	r1, 0 -> c1
	;;
#0:	if  c1 ret
#1:	if  c1 s2add	r15, 1 -> r15
	;;
	       nop	3
	;;
.BB26_13:                               ; %bb13
                                        ; =>This Inner Loop Header: Depth=1
#0:	       sub	r1, 1 -> r1
#1:	       add	r2, 1 -> r0
#2:	       stmb.a	0, r2, 0        ; memset.c:99
	;;
#0:	       cmpne	r1, 0 -> c1     ; memset.c:98
#1:	       or	r0, 0 -> r2
	;;
#0:	if  c1 br	.BB26_13        ; memset.c:98
	;;                              ; memset.c:98
	       nop	2               ; memset.c:98
	;;
.BB26_14:                               ; %bb16
#0:	       s2add	r15, 1 -> r15
#1:	       ret
	;;
	       nop	3
	;;
	.align	4
_memset_end:

	.align	4
__close_r:                              ; @_close_r
	.size	__close_r_end-__close_r
__close_r_start:
; BB#0:                                 ; %entry
#0:	       wb.s	r15, 5
#2:	       ldiu	20 -> r2
#1:	       ldx	$rb, 0 -> r1.31
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
#0:	       stm.s	r10, r14, 4
#1:	       or	r0, 0 -> r10
#2:	       ldga	_errno.b -> r0
	;;
#0:	       stmb.a	0, r0, 0
#1:	       or	r1, 0 -> r0
	;;
#0:	       callg	__close
	;;
	       nop	3
	;;
#0:	       cmpne	r0, -1 -> c1    ; closer.c:53
	;;
#0:	if  c1 br	.BB27_3
	;;
	       nop	2
	;;
; BB#1:                                 ; %bb
#0:	       ldmg.d	_errno.b
#1:	       ldga	_errno.b -> r1
	;;
#0:	       ldx	$membu, r1 -> r1
	;;
#0:	       cmpne	r1, -1 -> c1    ; closer.c:53
	;;
#0:	if  c1 br	.BB27_3
	;;
	       nop	2
	;;
; BB#2:                                 ; %bb1
#0:	       stx	r1 -> $c1
#1:	       ldi	88 -> r1
#2:	       ldi	0 -> r2
#3:	       or	r14, 0 -> r15   ; closer.c:55
	;;
#0:	if  c1 or	r1, 0 -> r2
	;;
#0:	       stm.a	r2, r10, 0      ; closer.c:54
	;;
#0:	       ldm.s	r14, 16         ; closer.c:55
	;;
#0:	       ldx	$mem, 0 -> r10  ; closer.c:55
#1:	       ldm.s	r15, 8          ; closer.c:55
	;;
#0:	       br	.BB27_4
#3:	       ldx	$mem, 0 -> r3.31 ; closer.c:55
#1:	       ldm.s	r15, 4          ; closer.c:55
	;;
#3:	       stx	r3.31 -> $ro    ; closer.c:55
	;;
#0:	       ldx	$mem, 0 -> r0.31 ; closer.c:55
	;;
#0:	       stx	r0.31 -> $rb    ; closer.c:55
	;;
.BB27_3:                                ; %bb2
#0:	       ldm.s	r14, 16         ; closer.c:55
#1:	       or	r14, 0 -> r15   ; closer.c:55
	;;
#0:	       ldx	$mem, 0 -> r10  ; closer.c:55
#1:	       ldm.s	r15, 8          ; closer.c:55
	;;
#1:	       ldx	$mem, 0 -> r1.31 ; closer.c:55
#0:	       ldm.s	r15, 4          ; closer.c:55
	;;
#1:	       stx	r1.31 -> $ro    ; closer.c:55
	;;
#2:	       ldx	$mem, 0 -> r2.31 ; closer.c:55
	;;
#2:	       stx	r2.31 -> $rb    ; closer.c:55
	;;
.BB27_4:                                ; %bb2
#0:	       ldm.s	r15, 0          ; closer.c:55
#1:	       s2add	r15, 5 -> r15   ; closer.c:55
	;;
#0:	       ret                      ; closer.c:55
#1:	       ldx	$mem, 0 -> r14  ; closer.c:55
	;;                              ; closer.c:55
	       nop	3               ; closer.c:55
	;;
	.align	4
__close_r_end:

	.align	4
__lseek_r:                              ; @_lseek_r
	.size	__lseek_r_end-__lseek_r
__lseek_r_start:
; BB#0:                                 ; %entry
#1:	       wb.s	r15, 5
#2:	       ldiu	20 -> r4
#0:	       ldx	$ro, 0 -> r0.31
	;;
#0:	       sub	r15, r4 -> r15
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
#0:	       stm.s	r10, r14, 4
#1:	       or	r0, 0 -> r10
#2:	       ldga	_errno.b -> r0
	;;
#0:	       stmb.a	0, r0, 0
#1:	       or	r1, 0 -> r0
#2:	       or	r2, 0 -> r1
#3:	       or	r3, 0 -> r2
	;;
#0:	       callg	__lseek
	;;
	       nop	3
	;;
#0:	       cmpne	r0, -1 -> c1    ; lseekr.c:58
	;;
#0:	if  c1 br	.BB28_3
	;;
	       nop	2
	;;
; BB#1:                                 ; %bb
#0:	       ldmg.d	_errno.b
#1:	       ldga	_errno.b -> r1
	;;
#0:	       ldx	$membu, r1 -> r1
	;;
#0:	       cmpne	r1, -1 -> c1    ; lseekr.c:58
	;;
#0:	if  c1 br	.BB28_3
	;;
	       nop	2
	;;
; BB#2:                                 ; %bb1
#0:	       stx	r1 -> $c1
#1:	       ldi	88 -> r1
#2:	       ldi	0 -> r2
#3:	       or	r14, 0 -> r15   ; lseekr.c:60
	;;
#0:	if  c1 or	r1, 0 -> r2
	;;
#0:	       stm.a	r2, r10, 0      ; lseekr.c:59
	;;
#0:	       ldm.s	r14, 16         ; lseekr.c:60
	;;
#0:	       ldx	$mem, 0 -> r10  ; lseekr.c:60
#1:	       ldm.s	r15, 8          ; lseekr.c:60
	;;
#0:	       br	.BB28_4
#1:	       ldx	$mem, 0 -> r1.31 ; lseekr.c:60
#2:	       ldm.s	r15, 4          ; lseekr.c:60
	;;
#1:	       stx	r1.31 -> $ro    ; lseekr.c:60
	;;
#2:	       ldx	$mem, 0 -> r2.31 ; lseekr.c:60
	;;
#2:	       stx	r2.31 -> $rb    ; lseekr.c:60
	;;
.BB28_3:                                ; %bb2
#0:	       ldm.s	r14, 16         ; lseekr.c:60
#1:	       or	r14, 0 -> r15   ; lseekr.c:60
	;;
#0:	       ldx	$mem, 0 -> r10  ; lseekr.c:60
#1:	       ldm.s	r15, 8          ; lseekr.c:60
	;;
#3:	       ldx	$mem, 0 -> r3.31 ; lseekr.c:60
#0:	       ldm.s	r15, 4          ; lseekr.c:60
	;;
#3:	       stx	r3.31 -> $ro    ; lseekr.c:60
	;;
#0:	       ldx	$mem, 0 -> r0.31 ; lseekr.c:60
	;;
#0:	       stx	r0.31 -> $rb    ; lseekr.c:60
	;;
.BB28_4:                                ; %bb2
#0:	       ldm.s	r15, 0          ; lseekr.c:60
#1:	       s2add	r15, 5 -> r15   ; lseekr.c:60
	;;
#0:	       ret                      ; lseekr.c:60
#1:	       ldx	$mem, 0 -> r14  ; lseekr.c:60
	;;                              ; lseekr.c:60
	       nop	3               ; lseekr.c:60
	;;
	.align	4
__lseek_r_end:

	.align	4
__read_r:                               ; @_read_r
	.size	__read_r_end-__read_r
__read_r_start:
; BB#0:                                 ; %entry
#0:	       wb.s	r15, 5
#2:	       ldiu	20 -> r4
#1:	       ldx	$rb, 0 -> r1.31
	;;
#0:	       sub	r15, r4 -> r15
#2:	       ldx	$ro, 0 -> r2.31
	;;
#0:	       stm.s	r14, r15, 0
#1:	       or	r15, 0 -> r14
	;;
#1:	       stm.s	r1.31, r15, 1
	;;
#2:	       stm.s	r2.31, r15, 2
	;;
#0:	       stm.s	r10, r14, 4
#1:	       or	r0, 0 -> r10
#2:	       ldga	_errno.b -> r0
	;;
#0:	       stmb.a	0, r0, 0
#1:	       or	r1, 0 -> r0
#2:	       or	r2, 0 -> r1
#3:	       or	r3, 0 -> r2
	;;
#0:	       callg	__read
	;;
	       nop	3
	;;
#0:	       cmpne	r0, -1 -> c1    ; readr.c:58
	;;
#0:	if  c1 br	.BB29_3
	;;
	       nop	2
	;;
; BB#1:                                 ; %bb
#0:	       ldmg.d	_errno.b
#1:	       ldga	_errno.b -> r1
	;;
#0:	       ldx	$membu, r1 -> r1
	;;
#0:	       cmpne	r1, -1 -> c1    ; readr.c:58
	;;
#0:	if  c1 br	.BB29_3
	;;
	       nop	2
	;;
; BB#2:                                 ; %bb1
#0:	       stx	r1 -> $c1
#1:	       ldi	88 -> r1
#2:	       ldi	0 -> r2
#3:	       or	r14, 0 -> r15   ; readr.c:60
	;;
#0:	if  c1 or	r1, 0 -> r2
	;;
#0:	       stm.a	r2, r10, 0      ; readr.c:59
	;;
#0:	       ldm.s	r14, 16         ; readr.c:60
	;;
#0:	       ldx	$mem, 0 -> r10  ; readr.c:60
#1:	       ldm.s	r15, 8          ; readr.c:60
	;;
#0:	       br	.BB29_4
#3:	       ldx	$mem, 0 -> r3.31 ; readr.c:60
#1:	       ldm.s	r15, 4          ; readr.c:60
	;;
#3:	       stx	r3.31 -> $ro    ; readr.c:60
	;;
#0:	       ldx	$mem, 0 -> r0.31 ; readr.c:60
	;;
#0:	       stx	r0.31 -> $rb    ; readr.c:60
	;;
.BB29_3:                                ; %bb2
#0:	       ldm.s	r14, 16         ; readr.c:60
#1:	       or	r14, 0 -> r15   ; readr.c:60
	;;
#0:	       ldx	$mem, 0 -> r10  ; readr.c:60
#1:	       ldm.s	r15, 8          ; readr.c:60
	;;
#1:	       ldx	$mem, 0 -> r1.31 ; readr.c:60
#0:	       ldm.s	r15, 4          ; readr.c:60
	;;
#1:	       stx	r1.31 -> $ro    ; readr.c:60
	;;
#2:	       ldx	$mem, 0 -> r2.31 ; readr.c:60
	;;
#2:	       stx	r2.31 -> $rb    ; readr.c:60
	;;
.BB29_4:                                ; %bb2
#0:	       ldm.s	r15, 0          ; readr.c:60
#1:	       s2add	r15, 5 -> r15   ; readr.c:60
	;;
#0:	       ret                      ; readr.c:60
#1:	       ldx	$mem, 0 -> r14  ; readr.c:60
	;;                              ; readr.c:60
	       nop	3               ; readr.c:60
	;;
	.align	4
__read_r_end:

	.align	4
__write_r:                              ; @_write_r
	.size	__write_r_end-__write_r
__write_r_start:
; BB#0:                                 ; %entry
#1:	       wb.s	r15, 5
#2:	       ldiu	20 -> r4
#0:	       ldx	$ro, 0 -> r0.31
	;;
#0:	       sub	r15, r4 -> r15
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
#0:	       stm.s	r10, r14, 4
#1:	       or	r0, 0 -> r10
#2:	       ldga	_errno.b -> r0
	;;
#0:	       stmb.a	0, r0, 0
#1:	       or	r1, 0 -> r0
#2:	       or	r2, 0 -> r1
#3:	       or	r3, 0 -> r2
	;;
#0:	       callg	__write
	;;
	       nop	3
	;;
#0:	       cmpne	r0, -1 -> c1    ; writer.c:58
	;;
#0:	if  c1 br	.BB30_3
	;;
	       nop	2
	;;
; BB#1:                                 ; %bb
#0:	       ldmg.d	_errno.b
#1:	       ldga	_errno.b -> r1
	;;
#0:	       ldx	$membu, r1 -> r1
	;;
#0:	       cmpne	r1, -1 -> c1    ; writer.c:58
	;;
#0:	if  c1 br	.BB30_3
	;;
	       nop	2
	;;
; BB#2:                                 ; %bb1
#0:	       stx	r1 -> $c1
#1:	       ldi	88 -> r1
#2:	       ldi	0 -> r2
#3:	       or	r14, 0 -> r15   ; writer.c:60
	;;
#0:	if  c1 or	r1, 0 -> r2
	;;
#0:	       stm.a	r2, r10, 0      ; writer.c:59
	;;
#0:	       ldm.s	r14, 16         ; writer.c:60
	;;
#0:	       ldx	$mem, 0 -> r10  ; writer.c:60
#1:	       ldm.s	r15, 8          ; writer.c:60
	;;
#0:	       br	.BB30_4
#1:	       ldx	$mem, 0 -> r1.31 ; writer.c:60
#2:	       ldm.s	r15, 4          ; writer.c:60
	;;
#1:	       stx	r1.31 -> $ro    ; writer.c:60
	;;
#2:	       ldx	$mem, 0 -> r2.31 ; writer.c:60
	;;
#2:	       stx	r2.31 -> $rb    ; writer.c:60
	;;
.BB30_3:                                ; %bb2
#0:	       ldm.s	r14, 16         ; writer.c:60
#1:	       or	r14, 0 -> r15   ; writer.c:60
	;;
#0:	       ldx	$mem, 0 -> r10  ; writer.c:60
#1:	       ldm.s	r15, 8          ; writer.c:60
	;;
#3:	       ldx	$mem, 0 -> r3.31 ; writer.c:60
#0:	       ldm.s	r15, 4          ; writer.c:60
	;;
#3:	       stx	r3.31 -> $ro    ; writer.c:60
	;;
#0:	       ldx	$mem, 0 -> r0.31 ; writer.c:60
	;;
#0:	       stx	r0.31 -> $rb    ; writer.c:60
	;;
.BB30_4:                                ; %bb2
#0:	       ldm.s	r15, 0          ; writer.c:60
#1:	       s2add	r15, 5 -> r15   ; writer.c:60
	;;
#0:	       ret                      ; writer.c:60
#1:	       ldx	$mem, 0 -> r14  ; writer.c:60
	;;                              ; writer.c:60
	       nop	3               ; writer.c:60
	;;
	.align	4
__write_r_end:

	.align	4
__write:                                ; @_write
	.size	__write_end-__write
__write_start:
; BB#0:                                 ; %entry
#0:	       ldi	1 -> r3
#1:	       sub	r0, 1 -> r0
#2:	       ldiu	4 -> r4
#3:	       wb.s	r15, 1
	;;
#0:	       cmpult	r3, r0 -> c1    ; write.c:17
#1:	       sub	r15, r4 -> r15
	;;
#0:	if  c1 br	.BB31_6         ; write.c:17
	;;                              ; write.c:17
	       nop	2               ; write.c:17
	;;
; BB#1:                                 ; %bb3.preheader
#0:	       cmplt	r2, 1 -> c1     ; write.c:20
	;;
#0:	if  c1 ret                      ; write.c:33
#1:	if  c1 or	r2, 0 -> r0     ; write.c:33
#2:	if  c1 s2add	r15, 1 -> r15   ; write.c:33
	;;                              ; write.c:33
	       nop	3               ; write.c:33
	;;
; BB#2:                                 ; %bb3.preheader.bb1.preheader_crit_edge
#0:	       ldi	-8 -> r0
#1:	       ldi	-4 -> r3
#2:	       or	r2, 0 -> r4
	;;
.BB31_3:                                ; %bb1
                                        ; =>This Inner Loop Header: Depth=1
#0:	       ldm.b	r0, 0
	;;
#0:	       ldx	$membu, r0 -> r5
	;;
#0:	       btest	r5, 0 -> c1     ; write.c:22
	;;
#0:	if !c1 br	.BB31_3         ; write.c:22
	;;                              ; write.c:22
	       nop	2               ; write.c:22
	;;
; BB#4:                                 ; %bb2
                                        ;   in Loop: Header=BB31_3 Depth=1
#0:	       sub	r4, 1 -> r4
#1:	       ldm.f	r1, 0           ; write.c:26
	;;
#0:	       cmpeq	r4, 0 -> c1
	;;
#0:	if !c1 br	.BB31_3
#1:	       ldx	$membu, r1 -> r5 ; write.c:26
#2:	       add	r1, 1 -> r1
	;;
#0:	       stmb.a	r5, r3, 0       ; write.c:26
	;;
	       nop	1
	;;
.BB31_5:                                ; %bb6
#0:	       or	r2, 0 -> r0     ; write.c:33
#1:	       ret                      ; write.c:33
#2:	       s2add	r15, 1 -> r15   ; write.c:33
	;;                              ; write.c:33
	       nop	3               ; write.c:33
	;;
.BB31_6:                                ; %bb5
#0:	       ldga	_errno.b -> r0
#1:	       ret                      ; write.c:33
#2:	       s2add	r15, 1 -> r15   ; write.c:33
	;;
#0:	       stmb.a	1, r0, 0
#1:	       ldi	-1 -> r0
	;;                              ; write.c:33
	       nop	2               ; write.c:33
	;;
	.align	4
__write_end:

	.align	4
__close:                                ; @_close
	.size	__close_end-__close
__close_start:
; BB#0:                                 ; %entry
#0:	       cmpult	r0, 3 -> c1
#1:	       ldiu	4 -> r1
#2:	       wb.s	r15, 1
	;;
#0:	if  c1 ret                      ; close.c:22
#1:	       sub	r15, r1 -> r15
#2:	if  c1 ldi	0 -> r0
	;;
#0:	if  c1 s2add	r15, 1 -> r15   ; close.c:22
	;;                              ; close.c:22
	       nop	2               ; close.c:22
	;;
; BB#1:                                 ; %bb1
#0:	       ldga	_errno.b -> r0
#1:	       ret                      ; close.c:22
#2:	       s2add	r15, 1 -> r15   ; close.c:22
	;;
#0:	       stmb.a	1, r0, 0
#1:	       ldi	-1 -> r0
	;;                              ; close.c:22
	       nop	2               ; close.c:22
	;;
.BB32_2:                                ; %bb2
	.align	4
__close_end:

	.align	4
__read:                                 ; @_read
	.size	__read_end-__read
__read_start:
; BB#0:                                 ; %entry
#0:	       cmpne	r0, 0 -> c1     ; read.c:17
#1:	       ldiu	4 -> r3         ; read.c:17
#2:	       wb.s	r15, 1          ; read.c:17
	;;
#0:	if  c1 br	.BB33_7         ; read.c:17
#1:	       sub	r15, r3 -> r15  ; read.c:17
	;;                              ; read.c:17
	       nop	2               ; read.c:17
	;;
; BB#1:                                 ; %bb3.preheader
#0:	       cmplt	r2, 1 -> c1     ; read.c:20
	;;
#0:	if  c1 ret                      ; read.c:33
#1:	if  c1 or	r2, 0 -> r0     ; read.c:33
#2:	if  c1 s2add	r15, 1 -> r15   ; read.c:33
	;;                              ; read.c:33
	       nop	3               ; read.c:33
	;;
; BB#2:                                 ; %bb3.preheader.bb1.preheader_crit_edge
#0:	       ldi	-8 -> r0
#1:	       ldi	-4 -> r3
#2:	       or	r2, 0 -> r4
	;;
.BB33_3:                                ; %bb3.preheader.bb1.preheader_crit_edge
                                        ; =>This Loop Header: Depth=1
                                        ;     Child Loop BB33_4 Depth 2
#0:	       or	r1, 0 -> r5
	;;
.BB33_4:                                ; %bb1
                                        ;   Parent Loop BB33_3 Depth=1
                                        ; =>  This Inner Loop Header: Depth=2
#0:	       ldm.b	r0, 0
	;;
#0:	       ldx	$membu, r0 -> r1
	;;
#0:	       btest	r1, 1 -> c1     ; read.c:22
	;;
#0:	if !c1 br	.BB33_4         ; read.c:22
	;;                              ; read.c:22
	       nop	2               ; read.c:22
	;;
; BB#5:                                 ; %bb2
                                        ;   in Loop: Header=BB33_3 Depth=1
#0:	       sub	r4, 1 -> r4
#1:	       ldm.b	r3, 0           ; read.c:26
#2:	       add	r5, 1 -> r1
	;;
#0:	       cmpeq	r4, 0 -> c1
	;;
#0:	if !c1 br	.BB33_3
#1:	       ldx	$membu, r3 -> r6 ; read.c:26
	;;
#0:	       stmb.a	r6, r5, 0       ; read.c:26
	;;
	       nop	1
	;;
.BB33_6:                                ; %bb6
#0:	       or	r2, 0 -> r0     ; read.c:33
#1:	       ret                      ; read.c:33
#2:	       s2add	r15, 1 -> r15   ; read.c:33
	;;                              ; read.c:33
	       nop	3               ; read.c:33
	;;
.BB33_7:                                ; %bb5
#0:	       ldga	_errno.b -> r0
#1:	       ret                      ; read.c:33
#2:	       s2add	r15, 1 -> r15   ; read.c:33
	;;
#0:	       stmb.a	1, r0, 0
#1:	       ldi	-1 -> r0
	;;                              ; read.c:33
	       nop	2               ; read.c:33
	;;
	.align	4
__read_end:

	.align	4
__sbrk:                                 ; @_sbrk
	.size	__sbrk_end-__sbrk
__sbrk_start:
; BB#0:                                 ; %entry
#0:	       wb.s	r15, 1          ; sbrk.c:14
#1:	       ldiu	4 -> r2         ; sbrk.c:14
	;;
#0:	       sub	r15, r2 -> r15  ; sbrk.c:14
	;;
#0:	       ldmg.d	_heap_end.1081  ; sbrk.c:14
	;;
#0:	       ldx	$mem, 0 -> r1   ; sbrk.c:14
	;;
#0:	       cmpeq	r1, 0 -> c1     ; sbrk.c:14
	;;
#0:	if !c1 br	.BB34_2
	;;
	       nop	2
	;;
; BB#1:                                 ; %bb
#0:	       ldga	_end -> r1      ; sbrk.c:15
#1:	       ldga	_heap_end.1081 -> r2 ; sbrk.c:15
	;;
#0:	       stm.a	r1, r2, 0       ; sbrk.c:15
	;;
.BB34_2:                                ; %bb1
#0:	       add	r1, r0 -> r0    ; sbrk.c:18
#1:	       ret                      ; sbrk.c:20
#2:	       ldga	_heap_end.1081 -> r2 ; sbrk.c:18
#3:	       s2add	r15, 1 -> r15   ; sbrk.c:20
	;;
#0:	       stm.a	r0, r2, 0       ; sbrk.c:18
#1:	       or	r1, 0 -> r0     ; sbrk.c:20
	;;                              ; sbrk.c:20
	       nop	2               ; sbrk.c:20
	;;
	.align	4
__sbrk_end:

	.align	4
__lseek:                                ; @_lseek
	.size	__lseek_end-__lseek
__lseek_start:
; BB#0:                                 ; %entry
#0:	       wb.s	r15, 1
#1:	       ldiu	4 -> r1
#2:	       ldga	_errno.b -> r0
	;;
#0:	       ret                      ; lseek.c:20
#1:	       sub	r15, r1 -> r15
	;;
#0:	       s2add	r15, 1 -> r15   ; lseek.c:20
	;;
#0:	       stmb.a	1, r0, 0
#1:	       ldi	-1 -> r0
	;;                              ; lseek.c:20
	       nop	1               ; lseek.c:20
	;;
	.align	4
__lseek_end:

	.align	4
__fstat:                                ; @_fstat
	.size	__fstat_end-__fstat
__fstat_start:
; BB#0:                                 ; %entry
#0:	       wb.s	r15, 1
#1:	       ldiu	4 -> r1
#2:	       ldga	_errno.b -> r0
	;;
#0:	       ret                      ; fstat.c:21
#1:	       sub	r15, r1 -> r15
	;;
#0:	       s2add	r15, 1 -> r15   ; fstat.c:21
	;;
#0:	       stmb.a	1, r0, 0
#1:	       ldi	-1 -> r0
	;;                              ; fstat.c:21
	       nop	1               ; fstat.c:21
	;;
	.align	4
__fstat_end:

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
