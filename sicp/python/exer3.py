# -*- coding: utf-8 -*-
"""
"""
from array import array
from random import random

colors = ['black', 'white']
sizes = ['S', 'M', 'L']


def listcomp():
    # ordered by color, then size using a list comprehension
    # note: list comprehension is used to build a new list
    tshirts = [(color, size) for color in colors
               for size in sizes]
    print("tshirts using list comprehension:", tshirts)
    #


def genexp():
    # note: a genexp saves memory because it yields items one by one using the iterator protocol instead of building a whole list just to feed another constructor
    tshirts = ((color, size) for color in colors
               for size in sizes)

    print("tshirts using generator expression:")
    for tshirt in tshirts:
        print(tshirt)


def array_demo():
    """
      creating, savign and loading a large array of looats
    """
    floats = array('d', (random() for i in range(10 * 7)))
    #
    fp = open('floats.bin', 'wb')
    floats.tofile(fp)
    fp.close()


def main():
    # list
    listcomp()
    genexp()

    # tuple as record

    # Arrays - if the list are numbers
    array_demo()


if __name__ == "__main__":
    main()
