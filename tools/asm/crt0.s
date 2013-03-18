__crt0:
		.funsz __crt0_end@__crt0
		#0: ldiu 0 -> r15
		;; 
		#0: ldim 1023 -> r15
		;;
		#0: ldx $ro -> r0.30
		;; 
		#0: stm.s r0.30, r15, 0
		;; 
		#0: ldx $rb -> r0.30
		;; 
		#0: stm.s r0.30, r15, 1
		;; 
		#0: callg _main
		;; 
		#0: ldga __crt0_sp -> r0.16
		;;
		#0: stm.a r15, r0.16, 0
		;; 
		nop 0
		;;
__crt0_return:
		#0: ldm.s r15, 0
		;; 
		#0: stx r31 -> $ro
		;; 
		#0: ldm.s r15, 4		
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
		.funsz __crt0_exit_end@__crt0_exit
		#0: ldmg.d __crt0_sp
		;;
		#0: or r31, 0 -> r15
		;;
		#0: ldm.s r15, 0
		;; 
		#0: stx r31 -> $ro
		;; 
		#0: ldm.s r15, 4
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
