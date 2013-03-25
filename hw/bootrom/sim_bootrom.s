bootrom:
		.funsz bootrom_end@bootrom
bootrom_start:
#0:		callg 0
		;;
		nop
		;;
		nop
		;;
		nop
		;;
exit:
#0:		ldi -4 -> r0.30
		;;
#0:		ldm.b r0.30, 0
		;;
#0:		or r31, 0 -> r0.30
		;;
		nop
		;;
		nop
		;;
		nop
		;;
		.align 4
bootrom_end:
		
