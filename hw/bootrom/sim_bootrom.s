		.funsz bootrom_end-bootrom_start
bootrom_start:
#0:		callg 0
		;;
		nop 0
		;;
		nop 0
		;;
		nop 0
		;;
exit:
#0:		ldi -4 -> r0
		;;
#0:		ldm.b r0, 0
		;;
#0:		or r31, 0 -> r0
		;;
		nop 0
		;;
		nop 0
		;;
		nop 0
		;;
		.align 4
bootrom_end:
		