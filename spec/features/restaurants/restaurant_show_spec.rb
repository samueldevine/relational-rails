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
  end
end