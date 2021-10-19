require 'rails_helper'

RSpec.describe 'Delete Restaurants' do
  before :each do
    @restaurant = Restaurant.create!(
      name: 'Watercourse Foods',
      liquor_license: true,
      menu_items: 15
    )
    @ee1 = @restaurant.employees.create!(
      first_name: 'Michael',
      last_name: 'Bluth',
      currently_employed: true,
      wage: 120.00
    )
    @ee2 = @restaurant.employees.create!(
      first_name: 'Michael',
      last_name: 'Scott',
      currently_employed: true,
      wage: 200.00
    )
  end

  describe 'As a visitor' do
    it 'I can delete a restaurant and all of its employees' do
      visit "/restaurants/#{@restaurant.id}"
      save_and_open_page
      click_on "Delete #{@restaurant.name}"

      expect(current_path).to eq '/restaurants'
      expect(page).to_not have_content 'Watercourse Foods'
      expect(page).to_not have_content 'Delete'

      visit "/employees"

      expect(page).to_not have_content 'Michael Bluth'
      expect(page).to_not have_content 'Michael Scott'
    end
  end
end