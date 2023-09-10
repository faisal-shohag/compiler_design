%option noyywrap

rule ([-+]?[a-zA-Z0-9]+[+-]?"i"[+-]?[0-9a-zA-Z])+
rule2 ([-+]?[a-zA-Z0-9]+[+-]?[+-]?[0-9a-zA-Z]"i")+
rule3 ([-+]?"i"[a-zA-Z0-9]+[+-]?[+-]?[0-9a-zA-Z])+

%%
{rule}|{rule2}|{rule3} { printf("✅ Complex number is Matched!\n"); }
.* { printf("❌ Not Matched\n");}
%%


int main() {
    yylex();
    return 0;
}
