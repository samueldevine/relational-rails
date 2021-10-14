require 'rails_helper'

RSpec.describe "Restaurant's employee index" do
  before :each do
    @restaurant = Restaurant.create!(
      name: 'Watercourse Foods',
      liquor_license: true,
      menu_items: 15,
    )
    @ee1 = @restaurant.employees.create!(
      first_name: 'Michael',
      last_name: 'Scott',
      currently_employed: true,
      wage: 15.00
    )
    @ee2 = @restaurant.employees.create!(
      first_name: 'Michael',
      last_name: 'Jordan',
      currently_employed: false,
      wage: 45.00
    )
  end
  
  it 'shows all of the names of the employees for the restaurant' do
    visit "restaurants/#{@restaurant.id}/employees"

    expect(page).to have_content(@ee1.last_name)
    expect(page).to have_content(@ee2.last_name)
  end
  
  it 'links to each employees show page' do
    visit "restaurants/#{@restaurant.id}/employees"

    click_on @ee1.last_name

    expect(current_path).to eq("/employees/#{@ee1.id}")
  end
end