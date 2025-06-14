%{
    #include <stdio.h>
    #include <stdlib.h>

    int yylex(void);
    int yyerror(char* s);
%}

%token NUMBER
%token OP CP
%token ADD SUB MUL DIV ABS
%token ANDBIT
%token EOL

%%

calc: 
| calc exp EOL { printf(" = %d\n", $2); }
;

exp: factor
| exp ADD factor { $$ = $1 + $3; }
| exp SUB factor { $$ = $1 - $3; }
;

factor: term
| factor MUL term { $$ = $1 * $3; }
| factor DIV term { $$ = $1 / $3; }
;

term: NUMBER
| ABS term { $$ = abs($2);  }
| OP exp CP { $$ = $2;      }
| NUMBER ANDBIT NUMBER { $$ = $1 & $3; }
;

%%

int main(int argc, char** argv)
{
    return yyparse();
}

int yyerror(char *s)
{
    fprintf(stderr, "error: %s\n", s);
    return 1;
}