"""
Type dispatching  or  type coercion
"""
#note: we can implement this idea by designing coercion functions that transform an object of one type 
# into an equivalent object of another type 
# rational -> complexRI
def rational_to_complex(r):
        return ComplexRI(r.numer/r.denom, 0)

# using the type_tag attribute to distinguish types of arguments
# this is a general technique for creating generic functions over heterogeneous domains
class Number:
    def __add__(self, other):
            x, y = self.coerce(other)
            return x.add(y)
    def __mul__(self, other):
            x, y = self.coerce(other)
            return x.mul(y)
    def coerce(self, other):
            if self.type_tag == other.type_tag:
                return self, other
            elif (self.type_tag, other.type_tag) in self.coercions:
                return (self.coerce_to(other.type_tag), other)
            elif (other.type_tag, self.type_tag) in self.coercions:
                return (self, other.coerce_to(self.type_tag))
    def coerce_to(self, other_tag):
            coercion_fn = self.coercions[(self.type_tag, other_tag)]
            return coercion_fn(self)
    coercions = {('rat', 'com'): rational_to_complex}  # dictionary


class Complex(Number):
    type_tag = 'com'
    def add(self, other):
        return ComplexRI(self.real + other.real, self.imag + other.imag)
    """
    def mul(self, other):
        magnitude = self.magnitude * other.magnitude
        return ComplexMA(magnitude, self.angle + other.angle)
    """
   
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


from fractions import gcd
class Rational(Number):
    type_tag = 'rat'
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
   

def test_number():
    # the two type rational + ComplexRI
    num = Rational(3, 2)
    ri = ComplexRI(1.5, 0) 

    print(num + ri)

    return


if __name__ == "__main__":
    test_number()
    

    