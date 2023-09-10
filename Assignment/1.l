//Identifying an integer number and a floating point number
%option noyywrap

rule (([0-9]+)|([0-9]+\.[0-9]+))

%%
{rule} { printf("✅ Matched!\n"); }
.* { printf("❌ Not Matched\n"); }
%%

int main() {
    yylex();
}
