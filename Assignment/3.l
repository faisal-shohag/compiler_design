%{
#include <stdio.h>
int count = 0;
%}

rule (([a-zA-Z_]+)([0-9]+)?)+
el (([0-9]+[a-zA-Z_]+)+|[0-9]+|([0-9]+?[\*\%\$\#\@\!\~\`\'\"\;\.\,\;\(\)\[\]\{\}]+[a-zA-Z0-9]+))
p ("#")

%%
{rule} {count++; printf("%s is an identifier! +1 (%d)", yytext, count);}
{p} {printf("Total identifier so far: %d", count);}
{el} {printf("%s is not an identifier.\nTotal identifier so far: %d", yytext, count);};
%%

int yywrap(){
    return 1;
}

int main() {
    yylex();
    printf("Number of identifiers: %d\n", count);
    return 0;
}
