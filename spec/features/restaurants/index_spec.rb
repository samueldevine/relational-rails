require 'rails_helper'

RSpec.describe 'Restaurants Index' do
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

  it 'lists all resturant names' do
    visit '/restaurants'

    expect(page).to have_content(@restaurant_1.name)
    expect(page).to have_content(@restaurant_2.name)
    expect(page).to_not have_content(@restaurant_1.liquor_license)
    expect(page).to_not have_content(@restaurant_1.menu_items)
  end

  it 'restaurant names are in reverse chronological order'
end