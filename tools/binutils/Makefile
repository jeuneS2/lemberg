CFLAGS=-ansi -pedantic -Wall -g -Wno-long-long -D_XOPEN_SOURCE=600 -O2
YFLAGS=-d
LFLAGS=

PREFIX=/usr/local/

WAYS=1way 2way 3way 4way
FPUS=none single double

WAY=
FPU=
ARCHDIR=${WAY}-${FPU}

all: as ld objcopy crts

as: parser.o lexer.o expr.tab.o expr_lexer.o code.o pile.o section.o symtab.o buffer.o elflemberg.o errors.o files.o
	gcc -o $@ $^ -ly -lfl -lelf

ld: linker.o expr.tab.o expr_lexer.o code.o pile.o symtab.o buffer.o elflemberg.o errors.o files.o
	gcc -o $@ $^ -lelf

objcopy: objcopy.o buffer.o elflemberg.o errors.o files.o
	gcc -o $@ $^ -lelf

expr.tab.c: YFLAGS += -pexpr -bexpr
expr.tab.c: expr_parser.y exprs.h
	$(YACC) $(YFLAGS) expr_parser.y
expr.tab.o: expr.tab.c exprs.h symtab.h section.h buffer.h elflemberg.h

expr_lexer.o: LFLAGS += -Pexpr
expr_lexer.o: expr.tab.c expr_lexer.c expr.tab.h exprs.h elflemberg.h  errors.h buffer.h symtab.h section.h

buffer.o: buffer.c buffer.h

code.o: code.c code.h exprs.h optab.h elflemberg.h errors.h buffer.h symtab.h section.h optab.h

elflemberg.o: elflemberg.c elflemberg.h errors.h buffer.h symtab.h exprs.h section.h

errors.o: errors.c errors.h

files.o: files.c files.h errors.h

lexer.o: parser.o lexer.l errors.h files.h optab.h code.h exprs.h

linker.o: linker.c code.h exprs.h elflemberg.h buffer.h symtab.h section.h files.h pile.h

objcopy.o: objcopy.c errors.h files.h

parser.o: parser.y errors.h files.h section.h buffer.h code.h exprs.h symtab.h optab.h elflemberg.h

pile.o: pile.c code.h exprs.h errors.h elflemberg.h buffer.h symtab.h section.h pile.h

section.o: section.c code.h exprs.h errors.h elflemberg.h buffer.h symtab.h section.h

symtab.o: symtab.c errors.h elflemberg.h buffer.h symtab.h exprs.h section.h pile.h

crts: crt0.o crtend0.o

crt0.o: crt0.s as
	./as -o $@ $<

crtend0.o: crtend0.s as
	./as -o $@ $<

install: as ld objcopy crts
	install -d ${PREFIX}/lemberg/bin/
	install as ${PREFIX}/lemberg/bin/
	install ld ${PREFIX}/lemberg/bin/
	install objcopy ${PREFIX}/lemberg/bin/
	install -d ${PREFIX}/bin/
	ln -sf ${PREFIX}/lemberg/bin/as ${PREFIX}/bin/lemberg-as
	ln -sf ${PREFIX}/lemberg/bin/ld ${PREFIX}/bin/lemberg-ld
	ln -sf ${PREFIX}/lemberg/bin/objcopy ${PREFIX}/bin/lemberg-objcopy
	$(foreach w, ${WAYS}, \
		$(foreach f, ${FPUS}, \
			${MAKE} WAY=${w} FPU=${f} subinstall;))
	ln -sf ${PREFIX}/lemberg/4way-double/lib ${PREFIX}/lemberg/lib

subinstall: crts
	install -d ${PREFIX}/lemberg/${ARCHDIR}/lib/
	install -m 0644 crt0.o crtend0.o ${PREFIX}/lemberg/${ARCHDIR}/lib/

clean:
	rm -f as ld objcopy parser.c lexer.c expr_lexer.c y.tab.h expr.tab.h expr.tab.c *.o *~
