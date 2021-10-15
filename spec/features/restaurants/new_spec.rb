require 'rails_helper'

RSpec.describe 'New Restaurant' do
  it 'is a link on the Restaurants index page' do
    visit '/restaurants'

    expect(page).to have_content('New Restaurant')
    
    click_on 'New Restaurant'
    
    expect(current_path).to eq("/restaurants/new")
  end

  it 'has a form that can be filled out' do
    visit '/restaurants/new'
    fill_in 'restaurant[name]', with: 'Test Restaurant'
    choose 'restaurant[liquor_license]', option: 'Yes'
    fill_in 'restaurant[menu_items]', with: 5
    click_on 'Create Restaurant'
    new_rest = Restaurant.all.where(name: 'Test Restaurant').count

    expect(current_path).to eq('/restaurants')
    expect(page).to have_content('Test Restaurant')
    expect(new_rest).to eq 1
  end
end