%option noyywrap

rule ([0-9]+)
rule2 ([0-9]+\.[0-9]+)|(\.[0-9]+)

%%
{rule} { printf("✅ Integer Number Matched!\n"); }
{rule2} { printf("✅ Floating point Number Matched!\n"); }
.* { printf("❌ Not a number[NaN]!\n"); }
%%

int main() {
    yylex();
}
