		.size bootrom_end-bootrom_start
bootrom_start:
#0:		callg 0
		;;
		nop 3
		;;
exit:
#0:		br exit
		;;
		nop 2
		;;
		.align 4
bootrom_end:
		