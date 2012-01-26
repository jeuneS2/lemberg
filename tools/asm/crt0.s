__crt0:
		.size __crt0_end-__crt0
		#0: ldiu 0 -> r15
		#1: ldx $ro -> r1.31
		#2: ldx $rb -> r2.31
		;; 
		#0: ldim 1023 -> r15
		;;
		#1: stm.s r1.31, r15, 0
		;; 
		#2: stm.s r2.31, r15, 1
		;; 
		#0: callg _main
		#1: ldga __crt0_sp -> r1.16
		;;
		#1: stm.a r15, r1.16, 0
		;; 
		nop 0
		;;
		nop 0
		;;
__crt0_return:
		#0: ldm.s r15, 0
		;; 
		#0: ldm.s r15, 4
		#1: ldx $mem, 0 -> r1.31
		;;
		#1: stx r1.31 -> $ro
		#2: ldx $mem, 0 -> r2.31		
		;;
		#2: stx r2.31 -> $rb
		;;
		#0: jop ret
		;; 
		nop 0
		;;
		nop 0
		;;
		nop 0
		;;
		.align 4
__crt0_end:
		
__crt0_exit:
		.size __crt0_exit_end-__crt0_exit
		#0: ldmg.d __crt0_sp
		;;
		#0: ldx $mem -> r15
		;;
		#0: ldm.s r15, 0
		;; 
		#0: ldm.s r15, 4
		#1: ldx $mem, 0 -> r1.31
		;;
		#1: stx r1.31 -> $ro
		#2: ldx $mem, 0 -> r2.31		
		;;
		#2: stx r2.31 -> $rb
		;;
		#0: jop ret
		;; 
		nop 0
		;;
		nop 0
		;;
		nop 0
		;;
		.align 4
__crt0_exit_end:

__crt0_sp:
		.long 0
		
___mem_emergency:
		.long 0

