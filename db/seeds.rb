# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

restaurants = Restaurant.create([{
    name: 'Denver Pizza Company',
    liquor_license: false,
    menu_items: 10
},{
    name: "City, O' City",
    liquor_license: true,
    menu_items: 40
},{
    name: "Santiago's",
    liquor_license: false,
    menu_items: 10
}])

employees = Employee.create([{
    first_name: 'Michael',
    last_name: 'Bluth',
    currently_employed: true,
    wage: 25.54,
    restaurant_id: 1
},{
    first_name: 'Michael',
    last_name: 'Scott',
    currently_employed: false,
    wage: 20.19,
    restaurant_id: 2
},{
    first_name: 'Michael',
    last_name: 'Jordan',
    currently_employed: true,
    wage: 45.87,
    restaurant_id: 3
}])

customers = Customer.create([{
  first_name: 'Ricky',
  last_name: 'Spanish',
  address: '2424 Marina Lane, dock 12',
  over_21: false,
  rewards: 100
},{
  first_name: 'Jeanie',
  last_name: 'Gold',
  address: '657 Wedding Drive',
  over_21: true,
  rewards: 200
},{
  first_name: 'Matt',
  last_name: 'Foley',
  address: 'A van down by the river',
  over_21: true,
  rewards: 1500
},{
  first_name: 'Ruby',
  last_name: 'Zeldastein',
  address: '1313 Poltergeist St',
  over_21: false,
  rewards: 666
}])

orders = Order.create([{
  special_instructions: 'Super spicy',
  number_of_items: 5,
  paid: false,
  customer_id: 1
},{
  special_instructions: 'Crispy fries',
  number_of_items: 1,
  paid: true,
  customer_id: 2
},{
  special_instructions: 'No bun just burger',
  number_of_items: 3,
  paid: true,
  customer_id: 3
},{
  special_instructions: 'Drown it in sauce',
  number_of_items: 7,
  paid: false,
  customer_id: 4
}])
