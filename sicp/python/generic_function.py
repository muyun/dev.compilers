"""
"""
#
# A Complex number is a Number 
# The purpose of Number is not be instantiated directly, but instead to
#  **serve as a superclass of various specific number classes** 
#
# an interface is **a set of shared attribute names, along with a specification of their behavior**
# 1. Number objects have add and mul methods, but does not define them
class Number:
    def __add__(self, other):
        return self.add(other)
    def __mul__(self, other):
        return self.mul(other)

# 2. Complex class inherits from Number and describes arithmetic for complex numbers
# notes: The complex class **defines this interface by determining how the attributes** (real, imag, magnitude, and angles) 
# are used to add and mul complex numbers  

# notes:  Using interfaces and message passing is only one of several methods used to implement generic functions.
# in this example, the interface needed to implement arithmetic consists of four attributes: real, imag, magnitude, and angle.
# 
# A complex number can be as a point in 2-dim space 
# two coordinates (real, imag) or (magnitude, angle) 
# c = real + imag * i(i*i = -1) or
#
# Also, we have to store attribute values for only one representation and compute the other representation 
# whenever it is needed
#
# complexRI constructs a complex number from real and imaginary parts
# complexMA constructs a complex number from a magnitude and angle
class Complex(Number):
    def add(self, other):
        return ComplexRI(self.real + other.real, self.imag + other.imag)
    def mul(self, other):
        magnitude = self.magnitude * other.magnitude
        return ComplexMA(magnitude, self.angle + other.angle)
   
#
from math import atan2
# The ComplexRI stores real and imag attributes and computes magnitude and angle on demand
class ComplexRI(Complex):
    def __init__(self, real, imag):
        self.real = real
        self.imag = imag

    @property
    def magnitude(self):
        return (self.real ** 2 + self.imag ** 2) ** 0.5
    @property
    def angle(self):
        return atan2(self.imag, self.real)
    
    def __repr__(self):
        return 'ComplexRI ({0:g}, {1:g})'.format(self.real, self.imag)


from math import sin, cos, pi
class ComplexMA(Complex):
    def __init__(self, magnitude, angle):
        self.magnitude = magnitude
        self.angle = angle

    @property
    def real(self):
        return self.magnitude * cos(self.angle)
    @property
    def imag(self):
        return self.magnitude * sin(self.angle)

    def __repr__(self):
            return 'ComplexMA({0:g}, {1:g} * pi)'.format(self.magnitude, self.angle/pi)
    


def test_complexRI():
    ri = ComplexRI(5,12)
    return

#3. Rational number like (2.1, 3)
from fractions import gcd
class Rational(Number):
    def __init__(self, numer, denom):
        g = gcd(numer, denom)
        self.numer = numer // g
        self.denom = denom // g
    def __repr__(self):
        return 'Rational ({0}, {1})'.format(self.numer, self.denom)

    def add(self, other):
        nx, dx = self.numer, self.denom
        ny, dy = other.numer, other.denom
        return Rational(nx * dy + ny * dx, dx * dy)
    def mul(self, other):
        numer = self.numer * other.numer
        denom = self.denom * other.denom
        return Rational(numer, denom)

def test_Rational():
    r = Rational(2, 5)

    return

# 4. using type_tag attribute in Number to distinguish types of arguments
#TODO



if __name__ == "__main__":
    #test_complexRI()
    test_Rational()