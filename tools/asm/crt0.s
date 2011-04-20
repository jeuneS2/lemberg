__crt0:
		.size __crt0_end-__crt0
		#0: ldiu 0 -> r15
		#1: ldx $ro -> r1.31
		#2: ldx $rb -> r2.31
		;; 
		#0: ldih 1 -> r15
		;;
		#1: stm.s r1.31, r15, 0
		;; 
		#2: stm.s r2.31, r15, 1
		;; 
		#0: callg _main
		;;
		nop 3
		;;
__exit:	
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
		#0: ret
		;; 
		nop 3
		;;
		.align 4
__crt0_end:

___mem_emergency:
		.long 0

