require 'rails_helper'

RSpec.describe 'Restaurants Update' do
  before :each do
    @restaurant = Restaurant.create!(
      name: 'Watercourse Foods',
      liquor_license: true,
      menu_items: 15,
    )
  end
  
  it 'is a link on each Restaurant Show page' do
    visit "/restaurants/#{@restaurant.id}"

    expect(page).to have_content "Update #{@restaurant.name}"

    click_on "Update #{@restaurant.name}"

    expect(current_path).to eq "/restaurants/#{@restaurant.id}/edit"
  end

  it 'has a form that updates the restaurant record when filled out' do
    visit "/restaurants/#{@restaurant.id}/edit"
    fill_in 'restaurant[name]', with: 'Test Restaurant'
    choose 'restaurant[liquor_license]', option: 'No'
    fill_in 'restaurant[menu_items]', with: 5
    click_on "Update Restaurant"

    expect(current_path).to eq "/restaurants/#{@restaurant.id}"
    expect(page).to have_content "Test Restaurant"
  end
end