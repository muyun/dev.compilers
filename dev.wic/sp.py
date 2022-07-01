"""sp.py - simple parser on a context-free grammar

Grammar:
    <S> -> <A><C>
    <A> -> 'a''b'
    <C> -> ('c')* 'd'
"""
import sys

def parser():
    return

def main():
    try:
        parser()
    except RuntimeError as emsg:
        print(emsg)
    

if __name__ == "__main__":
    main()