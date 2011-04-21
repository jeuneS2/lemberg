CFLAGS=-ansi -pedantic -Wall -g -Wno-long-long -D_XOPEN_SOURCE=600
YFLAGS=-d
LFLAGS=

PREFIX=/usr/local/lemberg

all: as

as: parser.o lexer.o expr.tab.o expr_lexer.o code.o symtab.o
	gcc -o $@ $^ -ly -lfl

expr.tab.c: YFLAGS += -pexpr -bexpr
expr.tab.c: expr_parser.y exprs.h
	$(YACC) $(YFLAGS) expr_parser.y

expr_lexer.o: LFLAGS += -Pexpr
expr_lexer.o: expr.tab.o expr_lexer.l exprs.h symtab.h

parser.o: parser.y code.h symtab.h exprs.h files.h vhdstrings.h

lexer.o: parser.o lexer.l optab.h code.h exprs.h files.h

code.o: code.c code.h exprs.h optab.h

symtab.o: symtab.c symtab.h

install: as
	install -d ${PREFIX}/bin/
	install as ${PREFIX}/bin/
	install -d ${PREFIX}/lib/
	install -m 0644 crt0.s crtend0.s ${PREFIX}/lib/

clean:
	rm -f y.tab.h expr.tab.h expr.tab.c *.o *~