#!/usr/bin/env python

'''main  fuction'''
def  main():
    a = (0o21 + 0x1c) * 2   # 0o21 equals 17
    b = 0b1001 * 0O37   # 0b1001 equals 9
    c = 0XA1 - 55   # 0xa1 equals 161
    d = 0101   # 0101 equals 65
    print a + b - c - d
'''end'''

if   __name__  ==  '__main__':
    """
    call
    main function
    """
    main()


