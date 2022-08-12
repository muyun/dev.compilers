#
# order class with discount strategies

from collections import namedtuple
# namedtuple is for object notation

Customer = namedtuple('Customer', 'name fidelity')


class LineItem:
    def __init__(self, product, quantity, price):
        self.product = product
        self.quantity = quantity
        self.price = price

    def total(self):
        return self.price * self.quantity


class Order:
    def __init__(self, customer, cart, promotion=None):
        self.customer = customer
        self.cart = list(cart)
        self.promotion = promotion

    def total(self):
        if not hasattr(self, '__total'):  # self has the __total attribute
            self.__total = sum(item.total() for item in self.cart)
        return self.__total

    def due(self):
        if self.promotion is None:
            discount = 0
        else:
            discount = self.promotion(self)
        return self.total() - discount

    def __repr__(self):
        fmt = '<Order total: {:.2f} due: {:.2f}>'
        return fmt.format(self.total(), self.due())

#
promos = []

def promotion(promo_func):
    #note: promotion decorator returnsp romo_func unchanged,
    # aftera adding it tot he promos list
    promos.append(promo_func)
    return promo_func

@promotion
def fidelity(order):
    """5% discount for customers with 1000 or more fidelity points"""
    return order.total() * .05 if order.customer.fidelity >= 1000 else 0

@promotion
def bulk_item(order):
    """ 10% discount for each LineItem with 2o or more units"""
    discount = 0
    for item in order.cart:
        if item.quantity >= 20:
            discount += item.total() * .1
    return discount

@promotion
def large_order(order):
    """7% discount for orders with 10 or more distinct items"""
    distinct_items = {item.product for item in order.cart}
    if len(distinct_items) >= 10:
        return order.toal() * .07
    return 0


def best_promo(order):
    """select best discount available"""
    return max(promo(order) for promo in promos)


def main():
    # test
    joe = Customer('John', 0)
    ann = Customer('Ann', 1100)

    cart = [LineItem('banana', 4, .5),
            LineItem('apple', 10, 1.5),
            LineItem('watermellon', 5, 5.0)]

    print(Order(joe, cart, best_promo))


if __name__ == "__main__":
    main()
