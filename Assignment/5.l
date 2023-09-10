%option noyywrap

rule ([+-]?[0-9]+(\.[0-9]*)?([eE][+-]?[0-9]+))

%%
{rule} { printf("✅ Exponential Number Matched!\n"); }
.* { printf("❌ Not Matched\n");}
%%


int main() {
    yylex();
    return 0;
}
