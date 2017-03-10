target.o: json.y json.l infile
	@yacc -dv json.y
	@lex json.l
	@cc -o $@ lex.yy.c y.tab.c
	./$@ < infile

.PHONY: clean
clean:
	rm -f lex
