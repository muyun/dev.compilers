"""
efficiency in views of time and space
"""
#@count
def fib(n):
    if n == 0:
        return 0
    if n == 1:
        return 1
    return fib(n-1) + fib(n-2)

# how many times fib(n) is called
def count(f):
    def counted(*args): # optional arg
        counted.call_count += 1
        return f(*args)
    counted.call_count = 0
    return counted


def count_frames(f):
    def counted(*args):
        counted.open_count +=1 # the number of calls to f that have not yet returned
        counted.max_count = max(counted.max_count, counted.open_count)
        result = f(*args)
        counted.open_count -=1
        return result
    counted.open_count = 0
    counted.max_count = 0
    return counted

#
def trace(fn):
    def wrapped(x):
        print('-> ', fn, '(', x, ')')
        return fn(x)
    return wrapped

@trace
def triple(x):
    return 3 * x

if __name__ == "__main__":
    print("begin")
    triple(12) # the name triple is bound to the returned function value of calling trace
    #triple = trace(triple(12))
    #
    fib = count(fib)
    fib(5)
    print(f'the calling number: {fib.call_count}')
    fib1 = count_frames(fib)
    fib1(19)
    print(f'the frame number: {fib1.max_count}')
    #
    