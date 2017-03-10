%{
	#include <stdio.h>
	int yylex(void);
	int yyerror(char *);
%}

%token NUMBER STRING FALSE TRUE NUL
%%

jsontext:
	jsonvalue		{ printf("Accepted\n");}
	; 

jsonvalue:
	FALSE
	| TRUE
	| NUL
	| STRING
	| array
	| obj
	| NUMBER
	;

obj:
	'{' members '}'
	;

members:
	pair
	| pair ',' members 
	| /* empty */
	;

pair:
	STRING ':' jsonvalue
	;

array:
	'[' ']'
	| '[' elements ']'
	;

elements:
	jsonvalue
	| jsonvalue ',' elements
	;

%%

int yyerror(char *s) {
	fprintf(stderr, "%s\n", s);
	return 0;
}

int main(void) {
	yyparse();
	return 0;
}