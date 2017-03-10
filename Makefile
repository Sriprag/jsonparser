target.o: json.y json.l infile
	@yacc -dv json.y
	@lex json.l
	@cc -o $@ lex.yy.c y.tab.c
	@echo "Almost done...\nHere is the result!\n"
	@./$@ < infile
.PHONY: clean
clean:
	rm -f lex
