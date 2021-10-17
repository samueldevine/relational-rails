require 'rails_helper'

RSpec.describe 'Restaurants Index' do
  before :each do
    @restaurant_1 = Restaurant.create(
      name: 'Watercourse Foods',
      liquor_license: true,
      menu_items: 15,
    )
    @restaurant_2 = Restaurant.create(
      name: 'NORTH',
      liquor_license: true,
      menu_items: 10,
    )
    @restaurant_3 = Restaurant.create(
      name: 'Snooze A.M. Eatery',
      liquor_license: true,
      menu_items: 50,
    )
  end

  it 'lists all resturant names' do
    visit '/restaurants'

    expect(page).to have_content(@restaurant_1.name)
    expect(page).to have_content(@restaurant_2.name)
    expect(page).to have_content(@restaurant_3.name)
    expect(page).to_not have_content("Serves Alcohol?")
    expect(page).to_not have_content("Number of menu items:")
  end

  it 'restaurant names are in reverse chronological order' do
    visit '/restaurants'

    expect(@restaurant_3.name).to appear_before(@restaurant_2.name)
    expect(@restaurant_2.name).to appear_before(@restaurant_1.name)
  end
end