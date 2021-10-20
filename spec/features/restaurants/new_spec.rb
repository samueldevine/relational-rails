require 'rails_helper'

RSpec.describe 'New Restaurant' do
  it 'is a link on the Restaurants index page' do
    visit '/restaurants'

    expect(page).to have_content('New Restaurant')

    click_on 'New Restaurant'

    expect(current_path).to eq("/restaurants/new")
  end

  it 'has a form that creates a new restaurant record when filled out' do
    visit '/restaurants/new'
    fill_in 'Name:', with: 'Test Restaurant'
    choose 'Yes'
    fill_in 'Number of menu items:', with: 5
    click_on 'Create Restaurant'
    new_rest = Restaurant.all.where(name: 'Test Restaurant')

    expect(current_path).to eq('/restaurants')
    expect(page).to have_content('Test Restaurant')
    expect(new_rest.count).to eq 1
  end
end
