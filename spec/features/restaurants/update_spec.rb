require 'rails_helper'

RSpec.describe 'Restaurants Update' do
  before :each do
    @restaurant = Restaurant.create!(
      name: 'Watercours Fods',
      liquor_license: false,
      menu_items: 15,
    )
    @restaurant_2 = Restaurant.create!(
      name: 'Hott Dogg Standd',
      liquor_license: true,
      menu_items: 10,
    )
  end
  
  it 'is a link on each Restaurant Show page' do
    visit "/restaurants/#{@restaurant.id}"

    expect(page).to have_content "Update #{@restaurant.name}"

    click_on "Update #{@restaurant.name}"

    expect(current_path).to eq "/restaurants/#{@restaurant.id}/edit"
  end

  it 'has a form that updates the restaurant record when filled out' do
    visit "/restaurants/#{@restaurant_2.id}/edit"
    fill_in 'restaurant[name]', with: 'Hot Dog Stand'
    choose 'restaurant[liquor_license]', option: 'No'
    fill_in 'restaurant[menu_items]', with: 1
    click_on "Update Restaurant"

    expect(current_path).to eq "/restaurants/#{@restaurant_2.id}"
    expect(page).to have_content "Hot Dog Stand"
    expect(page).to have_content "Serves Alcohol? false"
    expect(page).to have_content "Number of menu items: 1"

    visit "/restaurants/#{@restaurant.id}/edit"
    fill_in 'restaurant[name]', with: 'Watercourse Foods'
    choose 'restaurant[liquor_license]', option: 'Yes'
    fill_in 'restaurant[menu_items]', with: 16
    click_on "Update Restaurant"

    expect(current_path).to eq "/restaurants/#{@restaurant.id}"
    expect(page).to have_content "Watercourse Foods"
    expect(page).to have_content "Serves Alcohol? true"
    expect(page).to have_content "Number of menu items: 16"
  end
end