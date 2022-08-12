"""
OOP is well-suited to programs that model systems that have **separate but interacting parts** 

like, different users interact in a social network, diff characters interact in a game, and diff shapes interact in a physical simulation

When representing such system, the objects in a program often **map naturally onto objects** in the system being modeled, 
and **classes represent their types and relationships**    

"""

"""
adding state to data is an essential ingredient
"""

class Account:
    """
    a bank account that has a non-negative balance
    """
    interest = 0.02
    def __init__(self, account_holder):
        self.balance = 0
        self.holder = account_holder
    def deposit(self, amount):
        self.balance = self.balance + amount
        return self.balance
    def withdraw(self, amount):
        if amount > self.balance:
            return 'Insufficient funds'
        self.balance = self.balance - amount
        return self.balance

class CheckingAccount(Account):
    """ a bank account that charges for withdrawals. """
    withdraw_charge = 1
    interest = 0.01
    def withdraw(self, amount): #new withdraw method to override the behavior defined in the Account class
        return Account.withdraw(self, amount + self.withdraw_charge)


if __name__ == "__main__":
    a = Account('Kirk')
    a.balance = a.deposit(100)

    print(a.balance)
    print(a.holder)
    