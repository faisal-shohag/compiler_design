//Identifying a valid number of Bangladesh
%option noyywrap

rule ((\+88)?((017)|(019)|(013)|(015)|(016)|(018)|(014))([0-9]{8}))

%%
{rule} { printf("✅ Valid!\n"); }
.* { printf("❌ Unvalid\n"); }
%%

int main() {
    yylex();
}
