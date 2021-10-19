require 'rails_helper'

RSpec.describe 'Delete Restaurants' do
  before :each do
    restaurant = Restaurant.create!(
      name: 'Watercourse Foods',
      liquor_license: true,
      menu_items: 15
    )
    @ee = restaurant.employees.create!(
      first_name: 'Michael',
      last_name: 'Bluth',
      currently_employed: true,
      wage: 120.00
    )
  end

  describe 'As a visitor' do
    it 'I can delete an employee from the EE show page' do
      visit "/employees/#{@ee.id}"

      click_on 'Delete Employee'

      expect(current_path).to eq '/employees'
      expect(page).to_not have_content 'Michael Bluth'
      expect(page).to_not have_content 'Delete'
    end

    it 'I can also delete an employee from the EE index page' do
      visit '/employees'

      click_on 'Delete'

      expect(current_path).to eq '/employees'
      expect(page).to_not have_content 'Michael Bluth'
      expect(page).to_not have_content 'Delete'
    end
  end
end