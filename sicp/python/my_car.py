#from car import Car, ElectricCar
import car


def new_electric_car():
    my_tesla = car.ElectricCar('tesla', 'model s', 2018)
    print(my_tesla.get_descriptive_name())
    # my_tesla.describe_battery()

    my_tesla.battery.describe_battery()  # work through the car's battery attribute
    my_tesla.fill_gas_tank()
    my_tesla.battery.get_range()

    my_tesla1 = car.ElectricCar('tesla1', 'model s', 2018)
    print(my_tesla1.get_descriptive_name())

    my_tesla1.battery.get_range()

    #import pdb; pdb.set_trace()
    my_tesla1.battery.upgrade_battery()
    my_tesla1.battery.get_range()


def main():
    new_electric_car()


if __name__ == "__main__":
    main()
