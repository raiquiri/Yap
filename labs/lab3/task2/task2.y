%{
    #include <stdio.h>
%}

%token NUMBER

%%
start:exp '=' {printf("Answer = %d", $1);};

exp:  exp '+' exp    {$$ = $1 + $3;}
    | exp '-' exp    {$$ = $1 - $3;}
    | NUMBER         {$$ = $1;}
    ;
%%

  
int main()
{
        yyparse();
        return 1;
} 

void yyerror(const char *str)
{
        printf("Oшибка: %s\n",str);
        return 1;
} 