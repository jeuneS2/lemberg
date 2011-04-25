#define UART_STATUS (*((volatile unsigned char *)-120))
#define UART_DATA   (*((volatile unsigned char *)-116))

#define BOOTROM ((const unsigned char *)0xffe00000)
const char * load_msg = "\nLOAD\n";
const char * boot_msg = "BOOT\n";
const char * exit_msg = "\nEXIT ";

__attribute__((noreturn))
int main(void)
{
	int i;
	const char *p;

	int length;
	int m;
	int (* mainfun)(void);
	volatile unsigned char *prog_dest;

 loop:
	length = 0;
	m = 0;
	mainfun = 0;
	prog_dest = 0;

	/* send life sign */
	p = &BOOTROM[(unsigned)load_msg];
	for (; *p != '\0'; p++)
		{
			/* wait for UART to be ready */
			while ((UART_STATUS & 0x01) == 0); 

			UART_DATA = *p;
		} 

	/* receive length of program code */
	for (i = 0; i < 4; i++)
		{
			unsigned char c;

			/* wait for UART to be ready */
			while ((UART_STATUS & 0x02) == 0); 

			/* shift received data into length */
			length <<= 8;
			c = UART_DATA;
			length |= c;
		}

	/* receive address of main function */
	for (i = 0; i < 4; i++)
		{
			unsigned char c;

			/* wait for UART to be ready */
			while ((UART_STATUS & 0x02) == 0); 

			/* shift received data into pointer to main function */
			m <<= 8;
			c = UART_DATA;
			m |= c;
		}

	mainfun = (int (*)(void))m;

	/* receive actual program data */
	for (i = 0; i < length; i++)
		{
			unsigned char c;

			/* wait for UART to be ready */
			while ((UART_STATUS & 0x02) == 0); 

			c = UART_DATA;
			*prog_dest++ = c;
		}

	/* send life sign */
	p = &BOOTROM[(unsigned)boot_msg];
	for (; *p != '\0'; p++)
		{
			/* wait for UART to be ready */
			while ((UART_STATUS & 0x01) == 0); 

			UART_DATA = *p;
		} 

	/* call main() */
	m = mainfun();

	/* say goodbye */
	p = &BOOTROM[(unsigned)exit_msg];
	for (; *p != '\0'; p++)
		{
			/* wait for UART to be ready */
			while ((UART_STATUS & 0x01) == 0);

			UART_DATA = *p;
		}
	/* print status */
	for (i = 0; i < 8; i++)
		{
			int d;

			/* wait for UART to be ready */
			while ((UART_STATUS & 0x01) == 0); 

			d = (m >> (4*i)) & 0xf;
			if (d < 0xa) d+='0'; else d+='a';

			UART_DATA = d;
		}

	/* wait for UART to be ready */
	while ((UART_STATUS & 0x01) == 0); 

	UART_DATA = '\n';

	/* start over again */
	goto loop;
}
