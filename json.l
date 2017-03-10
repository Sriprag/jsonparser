%{
	#include <stdlib.h>
	void yyerror(char *);
	#include "y.tab.h"
%}

letter  [a-zA-Z]
digit  [0-9]


%%

\"(\\.|[^\"])*\"		{
	return STRING;
};

"false"	{
	return FALSE;
};

"true" 	{
	return TRUE;
};

"null"	{
	return NUL;
};

{digit}+	{
	yylval = atoi(yytext);
	return NUMBER;
};

[{}\[\]:,]	return *yytext;

[ \t\n\r]+ ; /* skip whitespace */

. ;
%%


int yywrap(void) {
	return 1;
}	