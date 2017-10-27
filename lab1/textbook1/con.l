%{
/* Lex program to convert uppercase to lowercase except inside comments*/
#include <stdio.h>
digit [0-9]
hex_letter[a-fA-F]
#ifndef FALSE
#define FALSE 0
#endif
#ifndef TRUE
#define TRUE 1
#endif
%}
%%
(digit)+ {putchar('a');}
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
