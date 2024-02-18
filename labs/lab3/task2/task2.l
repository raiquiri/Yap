%{
#include "y.tab.h"
%}

%%
[0-9]+              {yylval=atoi(yytext);return NUMBER;}
"+"                 return PLUS;
"-"                 return MINUS;
"\n"                return END;
.                   {};
%%

int yywrap()
{
    return 1;
}