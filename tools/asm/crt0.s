__crt0:
		.funsz __crt0_end-__crt0
		#0: ldiu 0 -> r15
		#1: ldx $ro -> r1.30
		#2: ldx $rb -> r2.30
		;; 
		#0: ldim 1023 -> r15
		;;
		#1: stm.s r1.30, r15, 0
		;; 
		#2: stm.s r2.30, r15, 1
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
		#1: stx r31 -> $ro
		;; 
		#0: stx r31 -> $rb
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
		.funsz __crt0_exit_end-__crt0_exit
		#0: ldmg.d __crt0_sp
		;;
		#0: or r31, 0 -> r15
		;;
		#0: ldm.s r15, 0
		;; 
		#0: ldm.s r15, 4
		#1: stx r31 -> $ro
		;;
		#0: stx r31 -> $rb
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
