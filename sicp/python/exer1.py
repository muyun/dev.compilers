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


class Battery():
    """model a battery for an electric car"""

    def __init__(self, battery_size=70):
        self.battery_size = battery_size

    def describe_battery(self):
        print("This car has a " + str(self.battery_size) + "-kWh battery.")

    def get_range(self):
        """print the range this battery provides"""
        if self.battery_size == 70:
            range = 240
        elif self.battery_size == 85:
            range = 270

        message = "This car can go " + str(range)
        message += " miles on a full charge."
        print(message)


class ElectricCar(Car):
    """electric vehicles"""

    def __init__(self, make, model, year):
        super().__init__(make, model, year)
        #self.battery_size = 70
        self.battery = Battery()  # A Battery instance

    def describe_battery(self):
        """"""
        print("This car has a " + str(self.battery_size) + "-kwh battry.")

    def fill_gas_tank(self):  # don't use the parent's method, os
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
    # my_tesla.describe_battery()

    import pdb
    pdb.set_trace()
    my_tesla.battery.describe_battery()  # work through the car's battery attribute
    my_tesla.fill_gas_tank()
    my_tesla.battery.get_range()


def main():
    new_car()
    new_electric_car()


if __name__ == "__main__":
    main()
