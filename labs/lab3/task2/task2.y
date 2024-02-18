%{
#include <stdio.h>
extern int yylex();
extern int yyerror(const char *str);
%}

%token NUMBER
%token PLUS
%token MINUS
%token END

%left PLUS MINUS

%%
program :
    |  program exp END {printf("Answer: %d\n", $2);}
    ;

exp :  NUMBER           {$$ = $1;}
    |  exp PLUS exp     {$$ = $1 + $3;}
    |  exp MINUS exp    {$$ = $1 - $3;}
    ;
%%
  
int main()
{
        printf("Enter expression: ");
        yyparse();
        return 0;
} 

int yyerror(const char *str)
{
        printf("Oшибка: %s\n",str);
        return 1;
} 