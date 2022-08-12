"""
#An Abstract Data Type (or ADT) consists of 
   - a set of possible values 
   - a set of operations on those values

#programmers can choose to organize their programs as collections of ADTs in any case

#An example of an ADT - Rational Numbers:
   - representing rationals
   - implementing
"""

# representing rationals
#by using numer and denom in add_rat and mul_rat, the abstraction,
#we have avoided having to touch them after this change in representation
def add_rat(x, y):
    """ The sum of rational numbers x and y. """
    return make_rat( numer(x) * denom(y) + numer(y) * denom(x),  denom(x) * denom(y) ) 


def mul_rat(x, y):
    """ The product of rational numbers x and y. """
    return make_rat( numer(x) * numer(y), denom(x) * denom(y) )


# implementing numer and denom


    def result(key):
         if key == 0:
             return n
         else:
             return d
    return result


def numer(r):
    """ The numerator of rational number r in lowest terms. """
    return r(0)


def denom(r):
    """ The denominator of rational number r in lowest terms. Always positive. """
    return r(1)


def main():
    print(add_rat(2/4, 2/3));
    print(mul_rat(2/4, 2/3));

if __name__ == "__main__":
    main()
