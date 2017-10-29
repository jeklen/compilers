#! /bin/bash
flex flex.l
gcc lex.yy.c -lfl
./a.out <test.py >result.py
