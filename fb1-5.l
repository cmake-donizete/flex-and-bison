%{
    #include "fb1-5.y.h"
%}

%%

"(" { return OP;  }
")" { return CP;  }
"+" { return ADD; }
"-" { return SUB; }
"*" { return MUL; }
"/" { return DIV; }
"|" { return ABS; }
"&" { return ANDBIT; }
[0-9]+ { yylval = atoi(yytext); return NUMBER; }
0x[a-fA-F0-9]+ { yylval = strtol(yytext, 0, 16); return NUMBER; }
\n { return EOL; }
[ \t] {  }
. { printf("MISTERY: %s\n", yytext); }

%%