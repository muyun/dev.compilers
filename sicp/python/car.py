# -*- coding: utf-8 -*-
"""A set of classes used to represent gas and electric cars"""

class Car():
    """represent a car"""
    def __init__(self, make, model, year):
        self.make = make
        self.model = model
        self.year = year
        self.odometer_reading = 0

    def get_descriptive_name(self):
        """return a formatted descriptive name"""
        long_name = str(self.year) + " " + self.make + " " + self.model
        return long_name

    def read_odometer(self):
        """show the car's mileage"""
        print("This car has " + str(self.odometer_reading) + " miles on it.")

    def update_odometer(self, mileage):
        """set the odometer"""
        if mileage >= self.odometer_reading:
            self.odometer_reading = mileage
        else:
            print("You can't roll back an odometer!")

    def increment_odometer(self, miles):
        """Add the given amount to the odometer"""
        self.odometer_reading += miles

    def fill_gas_tank(self):
        """"""
        print("This card need a gas tank!")


#note: we could use a separate class to make an instance as an attribute in some class
class Battery():
    """model a battery for an electric car"""
    def __init__(self, battery_size=70):
        self.battery_size = battery_size


    def describe_battery(self):
        print("This car has a " + str(self.battery_size) + " -kWh battery.")


    def upgrade_battery(self):
        #import pdb; pdb.set_trace()
        if self.battery_size < 85:
            self.battery_size = 85


    def get_range(self):
        """print the range this battery provides"""
        if self.battery_size == 70:
            range = 240
        elif self.battery_size == 85:
            range = 270

        message = "This car can go " + str(range)
        message += " miles on a full charge."
        print(message)

#note: use inheritance here
class ElectricCar(Car):
    """Represent specific to electric vehicles"""
    def __init__(self, make, model, year):
        # init attributes of the parent classlist
        super().__init__(make, model, year)
        #note:create a new instance of Battery and store it in the attribute self.battery
        #self.battery_size = 70
        self.battery = Battery()  # A Battery instance as attribute

    def describe_battery(self):
        """"""
        print("This car has a " + str(self.battery.battery_size) + " -kwh battery.")

    """
    def get_range(self):
        if self.battery.battery_size == 70:
            range = 240 + 30
        elif self.battery.battery_size == 85:
            range = 270 + 30
        message = "This car can go " + str(range)
        message += " miles on a full charge."
        print(message)
    """

    # overriding methods from the parent class
    def fill_gas_tank(self): #don't use the parent's method, so
        print("This model of card doesn't need a gas tank!")


def new_car():
    my_new_car = Car("audi", 'a4', 2018)
    print(my_new_car.get_descriptive_name())
    my_new_car.update_odometer(23500)
    my_new_car.read_odometer()
    my_new_car.increment_odometer(100)
    my_new_car.read_odometer()


def new_electric_car():
    my_tesla = ElectricCar('tesla', 'model s', 2018)
    print(my_tesla.get_descriptive_name())
    #my_tesla.describe_battery()

    my_tesla.battery.describe_battery() # work through the car's battery attribute
    my_tesla.fill_gas_tank()
    my_tesla.battery.get_range()

def main():
    new_car()
    new_electric_car()

if __name__ == "__main__":
    main()
