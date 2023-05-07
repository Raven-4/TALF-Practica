moronico:	moronico.tab.c moronico.lex.c
	gcc -o moronico moronico.tab.c lex.yy.c
moronico.tab.c:	moronico.y
	win_bison -dv moronico.y
moronico.lex.c:	moronico.l
	win_flex moronico.l
clean:
	rm  moronico.tab.c moronico.tab.h moronico.output lex.yy.c moronico

