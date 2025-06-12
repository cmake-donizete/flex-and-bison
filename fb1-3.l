%%
"+" { printf("PLUS\n"); }
"-" { printf("MINUS\n"); }
"*" { printf("TIMES\n"); }
"/" { printf("DIVIDE\n"); }
"|" { printf("ABSOLUTE\n"); }
[0-9]+ { printf("NUMBER %d\n", atoi(yytext)); }
\n { printf("NEWLINE\n"); }
[ \t] { printf("TAB\n"); }
. { printf("MISTERY\n"); }
%%