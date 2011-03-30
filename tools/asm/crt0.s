__crt0:
		.size __crt0_end-__crt0
		#0: callg _main
		#1: ldiu 0 -> r15
		;;
		#0: ldim 1023 -> r15
		;;
		nop 2
		;;
__exit:	
		#0: br __exit
		;;
		nop 2
		;;
		.align 4
__crt0_end:

___mem_emergency:
		.long 0

