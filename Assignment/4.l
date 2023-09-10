%{
#include <stdio.h>
int word_count = 0;
int char_count = 0;
int space_count = 0;
int lines_count = 0;
%}


%%
\n {lines_count++;}
[a-zA-Z]+ { word_count++; char_count += yyleng; }
[ \t] { space_count++; }
"#" {printf("Count so far:\nChar: %d\nWord: %d\nSpace: %d\nLine: %d\n", char_count, word_count, space_count, lines_count);}
%%

int yywrap(){
    return 1;
}

int main() {
    yylex();
    return 0;
}
