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
hex_head 0(x|X)
hex_letter [0-9a-fA-F]
octal_head 0|(0o)|(0O)
octal_letter [0-7]
binary 0b[01]+
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

({hex_head}{hex_letter}+) {
    int i = 2;
    int sum = 0;
    void convert(int n) {
        int i;
        if ((i=n/10)!=0)
            convert(i);
        putchar(n%10+'0');
    }
    while (i < yyleng) {
        if (yytext[i] >= '0' && yytext[i] <= '9')
            sum = sum * 16 + yytext[i] - '0';
        else if (yytext[i] >= 'A' && yytext[i] <='F')
            sum = sum * 16 + yytext[i] - 'A' + 10;
        else if (yytext[i] >= 'a' && yytext[i] <='f')
            sum = sum * 16 + yytext[i] - 'a' + 10;
        i = i + 1;
    }
    convert(sum);
}

({octal_head}{octal_letter}+) {
    int i = 2;
    int sum = 0;
    void convert(int n) {
        int i;
        if ((i=n/10)!=0)
            convert(i);
        putchar(n%10 + '0');
    }

    if (yytext[1] >= '0' && yytext[1] <= '7')
        sum = yytext[1] - '0';
    while (i < yyleng) {
        if (yytext[i] >= '0' && yytext[i] <= '7')
            sum = sum * 8 + yytext[i] - '0';
        i = i + 1;
    }
    convert(sum);
}

{binary} {
    int i = 2;
    int sum = 0;
    void convert(int n) {
        int i;
        if ((i=n/10)!=0)
            convert(i);
        putchar(n%10+'0');
    }
    while (i < yyleng) {
        if (yytext[i] >= '0' && yytext[i] <= '1')
            sum = sum * 2 + yytext[i] - '0';
        i = i + 1;
    }
    convert(sum);
}



%%
void main(void)
{
    yylex();
}
