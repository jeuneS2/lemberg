target datalayout = "e-p:32:32:32-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:32:64-f32:32:32-f64:32:64-v64:64:64-v128:128:128-a0:0:64-f80:32:32-n8:16:32-S128"
target triple = "i386-unknown-none"

define void @intr_mnml() nounwind naked noinline {
	call void asm sideeffect "
		; save r0 and $$itmp
		#0: wb.s r15, 2
		;;
		#0: addi -8 -> r15
		;;
		#0: stm.s r0, r15, 0
		;;
		#0: ldx $$itmp -> r0
		;;
		#0: stm.s r0, r15, 1
		;;
		; restore r0, load $$itmp to restore r31
		#0: ldm.s r15, 0
		;;
		#0: or r31, 0 -> r0
		;;
		#0: jop iret
		;;
		#0: ldm.s r15, 4
		;;
		#0: addi 8 -> r15
		;;
		nop 0
		;;
		",""()
	unreachable
}

@intr_userfun = common global [16 x void ()*] zeroinitializer, align 4
		
define void @intr() nounwind naked noinline {
	call void asm sideeffect "
.save_global:
		#0: wb.s r15, 19
		;; 
		#0: addi -76 -> r15
		;;
		#0: stm.s r0, r15, 0
		;; 
		#0: stm.s r1, r15, 1
		;;
		#0: stm.s r2, r15, 2
		;;
		#0: stm.s r3, r15, 3
		;;
		#0: stm.s r4, r15, 4
		;;
		#0: stm.s r5, r15, 5
		;;
		#0: stm.s r6, r15, 6
		;; 
		#0: stm.s r7, r15, 7
		;;
		#0: stm.s r8, r15, 8
		;;
		#0: stm.s r9, r15, 9
		;; 
		#0: ldx $$c1 -> r0
		;;
		#0: stm.s r0, r15, 10
		;;
		#0: ldx $$c2 -> r0
		;;
		#0: stm.s r0, r15, 11
		;;
		#0: ldx $$c3 -> r0
		;;
		#0: stm.s r0, r15, 12
		;;
		#0: ldx $$ro -> r0
		;;
		#0: stm.s r0, r15, 13
		;;
		#0: ldx $$rb -> r0
		;;
		#0: stm.s r0, r15, 14
		;;
		#0: ldx $$iro -> r0
		;;
		#0: stm.s r0, r15, 15
		;;
		#0: ldx $$irb -> r0
		;;
		#0: stm.s r0, r15, 16
		;;
		#0: ldx $$itmp -> r0
		;;
		#0: stm.s r0, r15, 17
		;;
		#0: ldi -8 -> r0
		;; 
		#0: ldm.b r0, 0
		;;
		#0: stm.s r31, r15, 18
		;;

.check_save_float:
		#0: ldi -56 -> r0
		;; 
		#0: ldm.b r0, 0
		;;
		#0: or r31, 0 -> r1
		;;
		#0: and r1, 3 -> r2
		;;
		#0: brz eq @ r2, .save_local0
		;;

.save_float:
		#0: wb.s r15, 16
		;;
		#0: addi -64 -> r15
		;; 
		#0: ldx $$f0 -> r0
		;;
		#0: stm.s r0, r15, 0
		;; 
		#0: ldx $$f1 -> r0
		;;
		#0: stm.s r0, r15, 1
		;; 
		#0: ldx $$f2 -> r0
		;;
		#0: stm.s r0, r15, 2
		;; 
		#0: ldx $$f3 -> r0
		;;
		#0: stm.s r0, r15, 3
		;; 
		#0: ldx $$f4 -> r0
		;;
		#0: stm.s r0, r15, 4
		;; 
		#0: ldx $$f5 -> r0
		;;
		#0: stm.s r0, r15, 5
		;; 
		#0: ldx $$f6 -> r0
		;;
		#0: stm.s r0, r15, 6
		;; 
		#0: ldx $$f7 -> r0
		;;
		#0: stm.s r0, r15, 7
		;; 
		#0: ldx $$f8 -> r0
		;;
		#0: stm.s r0, r15, 8
		;; 
		#0: ldx $$f9 -> r0
		;;
		#0: stm.s r0, r15, 9
		;; 
		#0: ldx $$f10 -> r0
		;;
		#0: stm.s r0, r15, 10
		;; 
		#0: ldx $$f11 -> r0
		;;
		#0: stm.s r0, r15, 11
		;; 
		#0: ldx $$f12 -> r0
		;;
		#0: stm.s r0, r15, 12
		;; 
		#0: ldx $$f13 -> r0
		;;
		#0: stm.s r0, r15, 13
		;; 
		#0: ldx $$f14 -> r0
		;;
		#0: stm.s r0, r15, 14
		;;
		#0: ldx $$f15 -> r0
		;;
		#0: stm.s r0, r15, 15
		;;
		
.save_local0:
		#0: wb.s r15, 10
		;; 
		#0: addi -40 -> r15
		;;
		#0: stm.s r0.16, r15, 0
		;; 
		#0: stm.s r0.17, r15, 1
		;;
		#0: stm.s r0.18, r15, 2
		;;
		#0: stm.s r0.19, r15, 3
		;;
		#0: stm.s r0.20, r15, 4
		;;
		#0: stm.s r0.21, r15, 5
		;;
		#0: stm.s r0.22, r15, 6
		;; 
		#0: stm.s r0.30, r15, 7
		;;
		#0: ldx $$mul0.0 -> r0
		;; 
		#0: stm.s r0, r15, 8
		;;
		#0: ldx $$mul0.1 -> r0
		;; 
		#0: stm.s r0, r15, 9
		;;

.check_save_local1:
		#0: sr r1, 2 -> r2
		;;
		#0: and r2, 3 -> r2
		;;
		#0: cmp lt r2, 1 -> c1
		;;
		#0: if c1 br @ .call_userfun
		;; 

.save_local1:
		#0: wb.s r15, 10
		#1: addi -40 -> r15
		;;
		#1: stm.s r1.16, r15, 0
		;; 
		#1: stm.s r1.17, r15, 1
		;;
		#1: stm.s r1.18, r15, 2
		;;
		#1: stm.s r1.19, r15, 3
		;;
		#1: stm.s r1.20, r15, 4
		;;
		#1: stm.s r1.21, r15, 5
		;;
		#1: stm.s r1.22, r15, 6
		;; 
		#1: stm.s r1.30, r15, 7
		;;
		#1: ldx $$mul1.0 -> r0
		;;
		#1: ldx $$mul1.1 -> r0
		#0: stm.s r0, r15, 8
		;;
		#0: stm.s r0, r15, 9
		;;

.check_save_local2:
		#0: cmp lt r2, 2 -> c1
		;;
		#0: if c1 br @ .call_userfun
		;; 

.save_local2:
		#0: wb.s r15, 10
		#1: addi -40 -> r15
		;;
		#2: stm.s r2.16, r15, 0
		;; 
		#2: stm.s r2.17, r15, 1
		;;
		#2: stm.s r2.18, r15, 2
		;;
		#2: stm.s r2.19, r15, 3
		;;
		#2: stm.s r2.20, r15, 4
		;;
		#2: stm.s r2.21, r15, 5
		;;
		#2: stm.s r2.22, r15, 6
		;; 
		#2: stm.s r2.30, r15, 7
		;;
		#2: ldx $$mul2.0 -> r0
		;;
		#2: ldx $$mul2.1 -> r0
		#0: stm.s r0, r15, 8
		;;
		#0: stm.s r0, r15, 9
		;;

.check_save_local3:
		#0: cmp lt r2, 3 -> c1
		;;
		#0: if c1 br @ .call_userfun
		;; 

.save_local3:
		#0: wb.s r15, 10
		#1: addi -40 -> r15
		;;
		#3: stm.s r3.16, r15, 0
		;; 
		#3: stm.s r3.17, r15, 1
		;;
		#3: stm.s r3.18, r15, 2
		;;
		#3: stm.s r3.19, r15, 3
		;;
		#3: stm.s r3.20, r15, 4
		;;
		#3: stm.s r3.21, r15, 5
		;;
		#3: stm.s r3.22, r15, 6
		;; 
		#3: stm.s r3.30, r15, 7
		;;
		#3: ldx $$mul3.0 -> r0
		;;
		#3: ldx $$mul3.1 -> r0
		#0: stm.s r0, r15, 8
		;;
		#0: stm.s r0, r15, 9
		;;

.call_userfun:",""()

		%1 = load volatile i32* inttoptr (i32 -244 to i32*), align 4
		%2 = getelementptr inbounds [16 x void ()*]* @intr_userfun, i32 0, i32 %1
		%3 = load volatile void ()** %2, align 4
		call void %3() nounwind

	call void asm sideeffect "
.check_load_local3:
		#0: ldi -56 -> r0
		;; 
		#0: ldm.b r0, 0
		;;
		#0: or r31, 0 -> r1
		;;
		#0: sr r1, 2 -> r2
		;;		
		#0: and r2, 3 -> r2
		;;
		#0: cmp lt r2, 3 -> c1
		;; 
		#0: if c1 br @ .load_local2
		;;

.load_local3:
		#0: ldm.s r15, 36
		;;
		#3: stx r31 -> $$mul3.1
		#0: ldm.s r15, 32
		;;
		#3: stx r31 -> $$mul3.0
		#0: ldm.s r15, 28
		;;
		#3: or r31, 0 -> r3.30
		#0: ldm.s r15, 24
		;;
		#3: or r31, 0 -> r3.22
		#0: ldm.s r15, 20
		;;
		#3: or r31, 0 -> r3.21
		#0: ldm.s r15, 16
		;;
		#3: or r31, 0 -> r3.20
		#0: ldm.s r15, 12
		;;
		#3: or r31, 0 -> r3.19
		#0: ldm.s r15, 8
		;;
		#3: or r31, 0 -> r3.18
		#0: ldm.s r15, 4
		;;
		#3: or r31, 0 -> r3.17
		#0: ldm.s r15, 0
		;;
		#3: or r31, 0 -> r3.16
		#0: addi 40 -> r15
		;;

.check_load_local2:
		#0: cmp lt r2, 2 -> c1
		;; 
		#0: if c1 br @ .load_local1
		;;

.load_local2:
		#0: ldm.s r15, 36
		;;
		#2: stx r31 -> $$mul2.1
		#0: ldm.s r15, 32
		;;
		#2: stx r31 -> $$mul2.0
		#0: ldm.s r15, 28
		;;
		#2: or r31, 0 -> r2.30
		#0: ldm.s r15, 24
		;;
		#2: or r31, 0 -> r2.22
		#0: ldm.s r15, 20
		;;
		#2: or r31, 0 -> r2.21
		#0: ldm.s r15, 16
		;;
		#2: or r31, 0 -> r2.20
		#0: ldm.s r15, 12
		;;
		#2: or r31, 0 -> r2.19
		#0: ldm.s r15, 8
		;;
		#2: or r31, 0 -> r2.18
		#0: ldm.s r15, 4
		;;
		#2: or r31, 0 -> r2.17
		#0: ldm.s r15, 0
		;;
		#2: or r31, 0 -> r2.16
		#0: addi 40 -> r15
		;;

.check_load_local1:
		#0: cmp lt r2, 1 -> c1
		;; 
		#0: if c1 br @ .load_local0
		;;

.load_local1:
		#0: ldm.s r15, 36
		;;
		#1: stx r31 -> $$mul1.1
		#0: ldm.s r15, 32
		;;
		#1: stx r31 -> $$mul1.0
		#0: ldm.s r15, 28
		;;
		#1: or r31, 0 -> r1.30
		#0: ldm.s r15, 24
		;;
		#1: or r31, 0 -> r1.22
		#0: ldm.s r15, 20
		;;
		#1: or r31, 0 -> r1.21
		#0: ldm.s r15, 16
		;;
		#1: or r31, 0 -> r1.20
		#0: ldm.s r15, 12
		;;
		#1: or r31, 0 -> r1.19
		#0: ldm.s r15, 8
		;;
		#1: or r31, 0 -> r1.18
		#0: ldm.s r15, 4
		;;
		#1: or r31, 0 -> r1.17
		#0: ldm.s r15, 0
		;;
		#1: or r31, 0 -> r1.16
		#0: addi 40 -> r15
		;; 
		
.load_local0:
		#0: ldm.s r15, 36
		;;
		#0: stx r31 -> $$mul0.1
		;; 
		#0: ldm.s r15, 32
		;;
		#0: stx r31 -> $$mul0.0
		;; 
		#0: ldm.s r15, 28
		;;
		#0: or r31, 0 -> r0.30
		;; 
		#0: ldm.s r15, 24
		;;
		#0: or r31, 0 -> r0.22
		;; 
		#0: ldm.s r15, 20
		;;
		#0: or r31, 0 -> r0.21
		;; 
		#0: ldm.s r15, 16
		;;
		#0: or r31, 0 -> r0.20
		;; 
		#0: ldm.s r15, 12
		;;
		#0: or r31, 0 -> r0.19
		;; 
		#0: ldm.s r15, 8
		;;
		#0: or r31, 0 -> r0.18
		;; 
		#0: ldm.s r15, 4
		;;
		#0: or r31, 0 -> r0.17
		;; 
		#0: ldm.s r15, 0
		;;
		#0: or r31, 0 -> r0.16
		;; 
		#0: addi 40 -> r15
		;;
		
.check_load_float:
		#0: and r1, 3 -> r2
		;; 
		#0: brz eq @ r2, .load_global
		;;

.load_float:
		#0: ldm.s r15, 60
		;;
		#0: stx r31 -> $$f15
		;; 
		#0: ldm.s r15, 56
		;;
		#0: stx r31 -> $$f14
		;; 
		#0: ldm.s r15, 52
		;;
		#0: stx r31 -> $$f13
		;; 
		#0: ldm.s r15, 48
		;;
		#0: stx r31 -> $$f12
		;; 
		#0: ldm.s r15, 44
		;;
		#0: stx r31 -> $$f11
		;; 
		#0: ldm.s r15, 40
		;;
		#0: stx r31 -> $$f10
		;; 
		#0: ldm.s r15, 36
		;;
		#0: stx r31 -> $$f9
		;; 
		#0: ldm.s r15, 32
		;;
		#0: stx r31 -> $$f8
		;; 
		#0: ldm.s r15, 28
		;;
		#0: stx r31 -> $$f7
		;; 
		#0: ldm.s r15, 24
		;;
		#0: stx r31 -> $$f6
		;; 
		#0: ldm.s r15, 20
		;;
		#0: stx r31 -> $$f5
		;; 
		#0: ldm.s r15, 16
		;;
		#0: stx r31 -> $$f4
		;; 
		#0: ldm.s r15, 12
		;;
		#0: stx r31 -> $$f3
		;; 
		#0: ldm.s r15, 8
		;;
		#0: stx r31 -> $$f2
		;; 
		#0: ldm.s r15, 4
		;;
		#0: stx r31 -> $$f1
		;; 
		#0: ldm.s r15, 0
		;;
		#0: stx r31 -> $$f0
		;; 
		#0: addi 64 -> r15
		;;

.load_global:
		#0: ldm.s r15, 72
		;; 
		#0: ldi -8 -> r0
		;;
		#0: stm.a r31, r0, 0
		;;
		#0: ldm.s r15, 64
		;;
		#0: stx r31 -> $$irb
		;; 
		#0: ldm.s r15, 60
		;;
		#0: stx r31 -> $$iro
		;; 
		#0: ldm.s r15, 56
		;;
		#0: stx r31 -> $$rb
		;; 
		#0: ldm.s r15, 52
		;;
		#0: stx r31 -> $$ro
		;; 
		#0: ldm.s r15, 48
		;;
		#0: stx r31 -> $$c3
		;; 
		#0: ldm.s r15, 44
		;;
		#0: stx r31 -> $$c2
		;; 
		#0: ldm.s r15, 40
		;;
		#0: stx r31 -> $$c1
		;; 
		#0: ldm.s r15, 36
		;;
		#0: or r31, 0 -> r9
		;; 
		#0: ldm.s r15, 32
		;;
		#0: or r31, 0 -> r8
		;; 
		#0: ldm.s r15, 28
		;;
		#0: or r31, 0 -> r7
		;; 
		#0: ldm.s r15, 24
		;;
		#0: or r31, 0 -> r6
		;; 
		#0: ldm.s r15, 20
		;;
		#0: or r31, 0 -> r5
		;; 
		#0: ldm.s r15, 16
		;;
		#0: or r31, 0 -> r4
		;; 
		#0: ldm.s r15, 12
		;;
		#0: or r31, 0 -> r3
		;; 
		#0: ldm.s r15, 8
		;;
		#0: or r31, 0 -> r2
		;; 
		#0: ldm.s r15, 4
		;;
		#0: or r31, 0 -> r1
		;; 
		#0: ldm.s r15, 0
		;;
		#0: or r31, 0 -> r0
		;; 
		#0: jop iret
		;;
		; Restore r31 and stack pointer in delay slot
		#0: ldm.s r15, 68
		;; 
		#0: addi 76 -> r15
		;;
		nop 0
		;;
		",""()
	unreachable
}