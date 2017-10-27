%{
#include <stdio.h>
#include <stdio.h>
int nDigitNumber = 0;
%}
digit[0-9]
number{digit}+
%%
{digit} {nDigitNumber++;}
%%
int main()
{
    yylex();
    fprintf(stderr, "\n number of digits = %d", nDigitNumber);
    return 0;
}
