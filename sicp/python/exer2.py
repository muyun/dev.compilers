"""
exercise
"""


def deco(func):
    def inner():
        print('running inner()')
    return inner  # return inner function object


@deco
def target():  # target is decorated by deco
    print('running target()')


def make_averager():
    series = []

    def averager(new_value):
        series.append(new_value)
        total = sum(series)
        return total / len(series)

    return averager


def update_make_averager():
    count = 0
    total = 0

    def averager(new_value):
        nonlocal count, total  # store the variables the inner functions need to change
        count += 1
        total += new_value
        return total / count

    return averager


def main():
    # note: decorator
    target()

    # note: a closures is function that retains the bindings of the free variables
    avg = make_averager()
    print(avg(10))

    # note: nonlocal
    avg1 = update_make_averager()
    print(avg1(11))


if __name__ == "__main__":
    main()
