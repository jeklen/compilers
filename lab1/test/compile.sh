#! /bin/bash
flex flex.l
gcc lex.yy.c -lfl
./a.out <test.py >result.py
cat result.py
python test.py
python result.py
