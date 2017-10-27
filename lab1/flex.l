%option noyywrap
%{
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
%}

digit            [0-9]+

%%

{digit}           ECHO;
                     
%%

void main(void)
{
    yylex();
}



