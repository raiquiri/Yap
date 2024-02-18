%{
#include "y.tab.h"
%}

%%
[0-9]+              {yylval=atoi(yytext);return NUMBER;}
"+"                 return PLUS;
"-"                 return MINUS;
"*"                 return MULTIPLY;
"/"                 return DEVIDE;
"("                 return LEFTP;
")"                 return RIGHTP;
"\n"                return END;
.                   {};
%%

int yywrap()
{
    return 1;
}