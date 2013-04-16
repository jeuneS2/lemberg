CFLAGS=-ansi -pedantic -Wall -g -Wno-long-long -D_XOPEN_SOURCE=600 -O2
YFLAGS=-d
LFLAGS=

PREFIX=/usr/local/lemberg

all: as ld objcopy

as: parser.o lexer.o expr.tab.o expr_lexer.o code.o pile.o section.o symtab.o buffer.o elflemberg.o files.o
	gcc -o $@ $^ -ly -lfl -lelf

ld: linker.o expr.tab.o expr_lexer.o code.o pile.o symtab.o buffer.o elflemberg.o files.o
	gcc -o $@ $^ -lelf

objcopy: objcopy.o buffer.o elflemberg.o files.o
	gcc -o $@ $^ -lelf

expr.tab.c: YFLAGS += -pexpr -bexpr
expr.tab.c: expr_parser.y exprs.h
	$(YACC) $(YFLAGS) expr_parser.y
expr.tab.o: expr.tab.c exprs.h symtab.h section.h buffer.h elflemberg.h

expr_lexer.o: LFLAGS += -Pexpr
expr_lexer.o: expr.tab.c expr_lexer.c expr.tab.h exprs.h elflemberg.h buffer.h symtab.h section.h

buffer.o: buffer.c buffer.h

code.o: code.c code.h exprs.h optab.h elflemberg.h  buffer.h symtab.h section.h optab.h

elflemberg.o: elflemberg.c elflemberg.h buffer.h symtab.h exprs.h section.h

files.o: files.c files.h

lexer.o: parser.o lexer.l files.h optab.h code.h exprs.h

linker.o: linker.c code.h exprs.h elflemberg.h buffer.h symtab.h section.h files.h pile.h

objcopy.o: objcopy.c files.h

parser.o: parser.y files.h section.h buffer.h code.h exprs.h symtab.h optab.h elflemberg.h

pile.o: pile.c code.h exprs.h elflemberg.h buffer.h symtab.h section.h pile.h

section.o: section.c code.h exprs.h elflemberg.h buffer.h symtab.h section.h

symtab.o: symtab.c elflemberg.h buffer.h symtab.h exprs.h section.h pile.h

crts: crt0.o crtend0.o

crt0.o: as crt0.s
	./as -o $@ $^

crtend0.o: as crtend0.s
	./as -o $@ $^

install: as ld objcopy
	install -d ${PREFIX}/bin/
	install as ${PREFIX}/bin/
	install ld ${PREFIX}/bin/
	install objcopy ${PREFIX}/bin/
	install -d ${PREFIX}/lib/
	install -m 0644 crt0.o crtend0.o ${PREFIX}/lib/

clean:
	rm -f parser.c lexer.c expr_lexer.c y.tab.h expr.tab.h expr.tab.c *.o *~
