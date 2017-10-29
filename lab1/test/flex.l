%{
/* Lex program to convert uppercase to lowercase except inside comments*/
#include <stdio.h>
#ifndef FALSE
#define FALSE 0
#endif
#ifndef TRUE
#define TRUE 1
#endif
%}
notation1 ('''[^']*''')
notation2 (\"{3}[^\"]*\"{3})
notation3 #[^\n]+\n
digit [0-9]
hex_letter [a-fA-F]
hex_head 0(x|X)
%%
({notation1}|{notation2}) {
    int i = 0;
    while (i < strlen(yytext)) {
        if (yytext[i] >= 'A' && yytext[i] <= 'Z') {
            putchar(yytext[i] + 'a' - 'A');
        }
        else
            putchar(yytext[i]);
        i = i + 1;
    }
}

{notation3} {
    int i = 0;
    while (i < strlen(yytext)) {
        if (yytext[i] >= 'A' && yytext[i] <= 'Z') {
            putchar(yytext[i] + 'a' - 'A');
        }
        else
            putchar(yytext[i]);
        i = i + 1;
    }
}

%%
void main(void)
{
    yylex();
}
