all: syn analyze

syn:
	quartus_map lemberg
	quartus_fit lemberg
	quartus_asm lemberg
	quartus_cpf -c -q 10MHz -g 3.3 -n p lemberg.sof lemberg.svf

analyze:
	quartus_sta lemberg
