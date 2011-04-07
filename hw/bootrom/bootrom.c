#define UART_STATUS (*((volatile unsigned char *)-8))
#define UART_DATA   (*((volatile unsigned char *)-4))

#define BOOTROM ((const unsigned char *)0xffe00000)
const char * boot_msg = "load program\n";
const char * exit_msg = "bye ";

__attribute__((noreturn))
int main(void)
{
	int i;
	const char *p;

	int length = 0;
	int m = 0;
	int (* mainfun)(void) = 0;
	volatile unsigned char *prog_dest = 0;

	/* send life sign */
	p = &BOOTROM[(unsigned)boot_msg];
	for (; *p != '\0'; p++)
		{
			/* wait for UART to be ready */
			while ((UART_STATUS & 0x01) == 0); 

			UART_DATA = *p;
		} 

	/* receive length of program code */
	for (i = 0; i < 4; i++)
		{
			/* wait for UART to be ready */
			while ((UART_STATUS & 0x02) == 0); 

			/* shift received data into length */
			length <<= 8;
			length |= UART_DATA;
		} 

	/* receive address of main function */
	for (i = 0; i < 4; i++)
		{
			/* wait for UART to be ready */
			while ((UART_STATUS & 0x02) == 0); 

			/* shift received data into pointer to main function */
			m <<= 8;
			m |= UART_DATA;
		}
	mainfun = (int (*)(void))m;

	/* receive actual program data */
	for (i = 0; i < length; i++)
		{
			/* wait for UART to be ready */
			while ((UART_STATUS & 0x02) == 0); 
			
			*prog_dest++ = UART_DATA;
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

	/* stop working */
	for (;;);
}
