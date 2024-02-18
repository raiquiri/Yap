%{
#include <stdio.h>
extern int yylex();
extern int yyerror(const char *str);
%}

%code requires
    {
        #define YYSTYPE double
    }

%token NUMBER INTEGER FLOAT
%token PLUS MINUS MULTIPLY DEVIDE
%token LEFTP RIGHTP
%token END

%left PLUS MINUS
%left MULTIPLY DEVIDE

%%
program :
        |program exp END    {printf("\nEnter expression: \n");}
        ;

exp : number            
    | LEFTP exp RIGHTP  {}
    | exp PLUS exp      {printf("+ ");}
    | exp MINUS exp     {printf("- ");}
    | exp MULTIPLY exp  {printf("* ");}
    | exp DEVIDE exp    {printf("/ ");}
    ;

number  : INTEGER         {printf("%d ", $1);}
        | FLOAT           {printf("%f ", $1);}
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