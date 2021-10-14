require 'rails_helper'

RSpec.describe 'Restaurants Show Page' do
    context 'Iteration 1' do
        it "shows a single restaurant's attributes" do
            restaurant_1 = Restaurant.create!(
                name: 'Watercourse Foods',
                liquor_license: true,
                menu_items: 15,
            )
            restaurant_2 = Restaurant.create!(
                name: 'NORTH',
                liquor_license: true,
                menu_items: 10,
            )
            visit "/restaurants/#{restaurant_1.id}"

            expect(page).to have_content(restaurant_1.name)
            expect(page).to have_content(restaurant_1.liquor_license)
            expect(page).to have_content(restaurant_1.menu_items)

            expect(page).to_not have_content(restaurant_2.name)
        end

        it 'shows all employees associated with the restaurant' do
            restaurant = Restaurant.create!(
                name: 'Watercourse Foods',
                liquor_license: true,
                menu_items: 15,
            )
            ee1 = restaurant.employees.create!(
                first_name: 'Michael',
                last_name: 'Scott',
                currently_employed: true,
                wage: 15.00
            )
            ee2 = restaurant.employees.create!(
                first_name: 'Michael',
                last_name: 'Jordan',
                currently_employed: false,
                wage: 45.00
            )
            visit "/restaurants/#{restaurant.id}/employees"

            expect(page).to have_content(ee1.last_name)
            expect(page).to have_content(ee2.last_name)
        end
    end
end