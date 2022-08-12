"""

"""

# object-oriented


class Averager():
    def __init__(self):
        self.series = []

    def __call__(self, new_value):
        self.series.append(new_value)
        total = sum(self.series)
        return total / len(self.series)

# higehr-order function


def make_averager():
    # note: Closures can avoid the use of global values and
    # provides some form of daa hiding
    #
    # note: a closure is function that retains the bindings of the free variables that (like count and total)
    # exist when the function (like averager) is defined
    count = 0
    total = 0

    def averager(new_value):
        # note: nonlocal flag a variable as a free varialbe
        # the binding stored in the closure is changed
        nonlocal count, total

        # note: the count is a number, a immutable type
        # the assign operations here make the variable count, total local variables
        count = count + 1
        total = total + new_value
        return total / count

    return averager


def main():
    """
    avg = Averager()
    print(avg(10))
    print(avg(11))
    """

    avg1 = make_averager()
    print(avg1(10))
    print(avg1(11))


if __name__ == "__main__":
    main()
