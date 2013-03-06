#define UART_STATUS (*((volatile unsigned char *)-120))
#define UART_DATA   (*((volatile unsigned char *)-116))

#define BOOTROM ((const unsigned char *)0xffe00000)
const char * load_msg = "\nLOAD\n";
const char * boot_msg = "BOOT\n";
const char * exit_msg = "\nEXIT ";
const char * fail_msg = "FAIL @";

#define WAIT_READ() while ((UART_STATUS & 0x02) == 0)
#define WAIT_WRITE() while ((UART_STATUS & 0x01) == 0)

static void printstr(const char *str);
static void printint(unsigned val);
static unsigned readint(void);

#define PRINTSTR(STR) (((void (*)(const char *))(unsigned)&BOOTROM[(unsigned)printstr])((const char *)&BOOTROM[(unsigned)STR]))
#define PRINTINT(VAL) (((void (*)(unsigned))(unsigned)&BOOTROM[(unsigned)printint])(VAL))
#define READINT() (((unsigned (*)(void))(unsigned)&BOOTROM[(unsigned)readint])())

#define RESET_PORT (*((volatile unsigned int *)-4))
static void reset(void);
#define RESET() (((void (*)(void))(unsigned)&BOOTROM[(unsigned)reset])())

__attribute__((noreturn))
int main(void)
{
	unsigned i;
	unsigned char c;
	unsigned w;

	unsigned length;
	unsigned mainaddr;
	int (* mainfun)(void);
	volatile unsigned char *prog_dest;

	int retval;

/* loop: */
	mainaddr = 0;
	mainfun = 0;
	prog_dest = 0;
	retval = 0;

	/* send life sign */
	PRINTSTR(load_msg);

	/* receive length of program code */
	length = READINT();
	/* receive address of main function */
	mainaddr = READINT();

	mainfun = (int (*)(void))mainaddr;

	/* receive actual program data */
	for (i = 0; i < length; i++)
		{
			/* wait for UART to be ready */
			while ((UART_STATUS & 0x02) == 0); 

			c = UART_DATA;
			*prog_dest = c;
			prog_dest++;

			w >>= 8;
			w |= (c << 24);
			/* read back data from RAM */
			if ((i & 0x3) == 3 && w != ((volatile unsigned *)prog_dest)[-1]) {
				goto fail;
			}

		}

	/* send life sign */
	PRINTSTR(boot_msg);

	/* call main() */
	retval = mainfun();

 exit:
	/* say goodbye */
	PRINTSTR(exit_msg);
	/* print status */
	PRINTINT(retval);

	goto restart;

 fail:
	/* fail miserably */
	PRINTSTR(fail_msg);
	/* print status */
	PRINTINT((unsigned)prog_dest);
	PRINTINT(((volatile unsigned *)prog_dest)[-1]);
	PRINTINT(w);

 restart:
	WAIT_WRITE();
	UART_DATA = '\n';

	/* try again */
	/* goto loop; */
	RESET();

	goto exit; /* trick llvm into not keeping values alive across mainfun */
}

__attribute__((noinline))
static void printstr(const char *str)
{
	const char *p;
	for (p = str; *p != '\0'; p++)
		{
			WAIT_WRITE();
			UART_DATA = *p;
		}
}

__attribute__((noinline))
static void printint(unsigned val)
{
	unsigned i;
	for (i = 8; i > 0; --i)
		{
			int d = (val >> (4*(i-1))) & 0xf;
			if (d < 0xa) d+='0'; else d+='a'-10;

			WAIT_WRITE();
			UART_DATA = d;
		}
}

__attribute__((noinline))
static unsigned readint(void)
{
	unsigned i;
	unsigned char c;
	unsigned retval = 0;
	for (i = 0; i < 4; i++)
		{
			WAIT_READ();
			/* shift received char into word */
			retval <<= 8;
			c = UART_DATA;
			retval |= c;
		}
	return retval;
}

__attribute__((noinline))
__attribute__((noreturn))
static void reset(void)
{
	volatile unsigned i;
	for (i = 0; i < 0x8000; i++)
		{
			/* NOP */
		}
	RESET_PORT = 0;

	for(;;);
}
