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
digit [0-9]
hex_letter [a-fA-F]
hex_head 0(x|X)
%%
{hex_head}({digit}|{hex_letter})+ {putchar('a');}
[A-Z] {putchar(tolower(yytext[0]));}
"/*" {
        char c;
        int done = FALSE;
        do{
            while ((c=input()) != '*')
                putchar(c);
            putchar(c);
            while ((c=input()) == '*')
                putchar(c);
            putchar(c);
            if (c == '/') done = TRUE;
        }while (!done);
    }
%%
void main(void)
{
    yylex();
}
