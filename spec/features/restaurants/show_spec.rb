require 'rails_helper'

RSpec.describe 'Restaurants Show Page' do
  before :each do
    @restaurant_1 = Restaurant.create!(
      name: 'Watercourse Foods',
      liquor_license: true,
      menu_items: 15,
    )
    @restaurant_2 = Restaurant.create!(
      name: 'NORTH',
      liquor_license: true,
      menu_items: 10,
    )
  end

  context 'Iteration 1' do
    it "shows a single restaurant's attributes" do
      visit "/restaurants/#{@restaurant_1.id}"

      expect(page).to have_content(@restaurant_1.name)
      expect(page).to have_content(@restaurant_1.liquor_license)
      expect(page).to have_content(@restaurant_1.menu_items)

      expect(page).to_not have_content(@restaurant_2.name)
    end

    it 'shows a count of the employees associated with each restaurant' do
      @restaurant_1.employees.create!(first_name: 'Michael', last_name: 'Scott', currently_employed: true, wage: 15.00)
      @restaurant_1.employees.create!(first_name: 'Michael', last_name: 'Jordan', currently_employed: false, wage: 45.00)
      @restaurant_1.employees.create!(first_name: 'Michael', last_name: 'Jackson', currently_employed: true, wage: 25.00)

      visit "/restaurants/#{@restaurant_1.id}"

      expect(page).to have_content("Number of employees: 3")
    end

    it 'links to the restaurant_employees index' do
      visit "/restaurants/#{@restaurant_1.id}"

      click_on "All #{@restaurant_1.name} Employees"

      expect(current_path).to eq("/restaurants/#{@restaurant_1.id}/employees")
    end
  end
end
