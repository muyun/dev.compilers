"""
A stream is a lazily computed linked list
"""

# this stream stores a function that computes the rest of the stream
# whenever the function is called, its returned value is cached as part of the stream in anattribute called _rest
class Stream:
    """ A lazily computed linked list"""
    class empty:
        def __repr__(self):
            return 'Stream.empty'
    empty = empty()

    def __init__(self, first, compute_rest=lambda: empty):
        assert callable(compute_rest), 'compute_rest must be callable.'
        self.first = first
        self._compute_rest = compute_rest  #computing function
    
    @property
    def rest(self):
        """ return the rest of the stream, computing it if necessary"""
        if self._compute_rest is not None:
            self._rest = self._compute_rest()  # execute the lambda function
            self._compute_rest = None
        return self._rest

    def __repr__(self):
        return 'Stream({0}, <...>)'.format(repr(self.first))

def integer_stream(first):
    def compute_rest():
        return integer_stream(first+1)
    return Stream(first, compute_rest)

# map a function to the stream
def map_stream(fn, s):
    if s is Stream.empty:
        return s
    def compute_rest():
        return map_stream(fn, s.rest)
    return Stream(fn(s.first), compute_rest)

# inspect the contents of a stream 
# coerce up to the first k element in Stream s to a list
def first_k_as_list(s, k):
    first_k = []
    while s is not Stream.empty and k>0:
        first_k.append(s.first)
        s, k = s.rest, k-1

    return first_k

def test_first_k_as_list():
    s = integer_stream(3)
    print(s)
    # use function x*x in the stream
    m = map_stream(lambda x: x*x, s)
    print(m)
    # check some 
    lst = first_k_as_list(m, 10)
    print(lst)


def test_stream():
    s = Stream(1, lambda: Stream(2+3, lambda: Stream(9)))
    print(s.first)
    print

if __name__ == "__main__":
    #test_stream()
    test_first_k_as_list()
