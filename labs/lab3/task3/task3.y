%{
    #include <stdio.h>
%}

%token NUMBER
%token PLUS MINUS MULTIPLY DEVIDE

%left PLUS MINUS
%left MULTIPLY DEVIDE

%%
exp:  NUMBER            {printf("%d ", $1);}
    | '(' exp ')'       {}
    | exp PLUS exp      {printf("+ ", $1);}
    | exp MINUS exp     {printf("- ", $1);}
    | exp MULTIPLY exp  {printf("* ", $1);}
    | exp DEVIDE exp    {printf("/ ", $1);}
    ;
%%

  
int main()
{
        printf("Enter expression: ");
        yyparse();
        return 0;
} 

void yyerror(const char *str)
{
        printf("Oшибка: %s\n",str);
        return 1;
} 