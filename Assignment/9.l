%{
#include "y.tab.h"
%}



%%
[a-zA-Z_][a-zA-Z_0-9]* return letter;
[0-9] return digit;
\n|. {return 0;}
%%

int yywrap() {
    return 1;
}
