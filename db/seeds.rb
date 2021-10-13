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

employees = Employee.create({
    first_name: 'Michael',
    last_name: 'Bluth',
    currently_employed: true,
    wage: 25.00,
    restaurant_id: 1
},{
    first_name: 'Michael',
    last_name: 'Scott',
    currently_employed: false,
    wage: 20.00,
    restaurant_id: 2
},{
    first_name: 'Michael',
    last_name: 'Jordan',
    currently_employed: true,
    wage: 45.00,
    restaurant_id: 3
})