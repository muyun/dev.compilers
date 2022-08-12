"""
sequence in python
#
note: the use of conventional interfaces 
  - a conventional interface is **a data format that is shared across many modular components**,
  which can be mixed and matched to perform data processing   
  - For example, if several functions all take a sequence as an input and output, then we can create a complex process by 
  chaining together a pipeline of functions, each of which is simple and focused
  - **the idea of organizing a program around a conventional interface**  
"""
# note1: computation over sequences
# example 1: sum the even members of the first n Fibonacci numbers  
"""
enumerate |  map  | filter  | accumalate
 -------     ---    ------    -------
             fib    iseven    sum
"""

def fib(k):
    """ compute the kth Fibonacci number
    """
    prev, curr = 1, 0
    for _ in range(k-1):
        prev, curr = curr, prev+curr
    return curr

def iseven(n):
    return n % 2 == 0


def sum_even_fib(n):
    """ sum the even members of the first n Fibonacci numbers
    """
    return sum(filter(iseven, map(fib, range(1,n+1))))


# exp2: List the letters in the acronym for a name, which includes the first letter of each capitalized word.
#  note2: this could **be decomposed as a pipeline of sequence operations that include map ,filter and accumalate**
# the designs are constructed by **combining relatively independent pieces, each of which transforms a sequence**.
"""
enumerate |     filter    |   map    | accumalate
---------       ---          ------    ----------
  words         iscap        first      tuple     
"""

def iscap(s):
    return s[0].isupper()

def first(s):
    return len(s) > 0 and s[0]

def acronym(name):
    if len(name) > 0:
        return  tuple(filter(iscap, map(first, name.split())))

    return ""


if __name__ == "__main__":
    #print(sum_even_fib(10))
    print(acronym('University of California Berkeley Undergraduate Graphics Group'))