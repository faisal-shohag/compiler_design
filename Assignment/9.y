 %{
    #include<stdio.h>
    int valid=1;
%}

%token digit letter

%%
start : letter s
s :     letter s
      | digit s
      |
      ;
%%

int yyerror() {
    printf("\n❌ Its not a identifier!\n");
    valid=0;
    return 0;
}

int main() {
    printf("\nEnter a indentifier:  ");
    yyparse();
    
	if(valid) {
    	printf("\n✅ It is a identifier!\n");
    }
}
