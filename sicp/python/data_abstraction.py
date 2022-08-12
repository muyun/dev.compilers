"""
data abstraction pattern in python  
-> a collection of selectors and constructors, together with some behavior conditions  

the part that **operates on abstract data** and the part that **defines a concrete representations** are **connected by a small set of functions**
 that implement abstract data in terms of the concrete representation.  

Note: the underlying idea of data abstraction is to **identify a basic set of operations** in terms of which all manipulations of values 
of some kind will be expressed, and then to **use only those operations in manipulating the data**. By **restricting the use of operations in
this way**, it is much **easier to change the representation of abstract data** without changing the behavior of a program.  

We can express abstract data using a collection of selectors and constructors, together
with some behavior conditons.  

As long as the behavior conditions are met, the selectors and constructors constitute a valide repreesentation of a kind of data.  

The implementation details below an abstraction barrier may change, but **if the behavior does not change**, then the data abstraction remains valid,
and any program written using this data abstraction will remain correct.  
"""

# 1. use rational numbers to perform computation  like add, mul, equal, print  
# operates on abstract data  
def add_rational(x, y):
    """
    x = nx / dx, y = ny / dy
    """
    nx, dx = numer(x), denom(x)
    ny, dy = numer(y), denom(y)
    return rational(nx*dy + ny*dx, dx*dy)

def mul_rational(x, y):
    return rational(numer(x)*numer(y), denom(x)*denom(y))
    

def rationals_are_equal(x, y):
    return numer(x) * denom(y) == numer(y) * denom(x)
    

def print_rational(x):
    print(numer(x), '/', denom(x))
    

# 2. represent rational numbers  
# create rationals or implement rational operations  
# a rational number as a pair of two integers: a numerator and a denominator  
# r = n / d  
# **define operations in terms of a constructor rational(), and selectors numer and denom** in the example   
# 
def rational(n, d):
    """
    return the rational number with numerator n and denominator d
    """
    return [n, d] # one kind of implementation

def numer(x):
    """
    return the numerator of the rational number x
    """
    return x[0]

def denom(x):
    """
    return the denominator of the rational number x
    """
    return x[1]



if __name__ == "__main__":
    half = rational(1, 2)
    third = rational(1, 3)
    print_rational(add_rational(half, third))