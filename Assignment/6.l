%option noyywrap

rule ((am)|(is)|(are)|(was)|(were)|(been)|(being))

%%
{rule} { printf("✅ To be verb is Identified!\n"); }
.* { printf("❌ Not a to be verb!\n"); }
%%


int main() {
    yylex();
    return 0;
}
