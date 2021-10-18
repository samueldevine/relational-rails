require 'rails_helper'

RSpec.describe 'New Restaurant Employee' do
  before :each do
    @restaurant = Restaurant.create!(
      name: 'Watercourse Foods',
      liquor_license: true,
      menu_items: 15,
    )
  end

  it "is a link on the Restaurant's Employees index page" do
    visit "/restaurants/#{@restaurant.id}/employees"

    expect(page).to have_content('Create Employee')
    
    click_on 'Create Employee'
    
    expect(current_path).to eq("/restaurants/#{@restaurant.id}/employees/new")
  end

  it 'has a form that creates a new employee for the restaurant' do
    visit "/restaurants/#{@restaurant.id}/employees/new"
    fill_in 'employee[first_name]', with: 'Michael'
    fill_in 'employee[last_name]', with: 'Jackson'
    choose 'employee[currently_employed]', option: 'Yes'
    fill_in 'employee[wage]', with: 42.42
    click_on 'Create Employee'
    new_ee = Employee.all.where(last_name: 'Jackson')

    expect(current_path).to eq("/restaurants/#{@restaurant.id}/employees")
    expect(page).to have_content('Jackson')
    expect(page).to have_content('Current Employee')
    expect(page).to have_content(42.42)
    expect(new_ee.count).to eq 1

    visit "/restaurants/#{@restaurant.id}/employees/new"
    fill_in 'employee[first_name]', with: 'Michael'
    fill_in 'employee[last_name]', with: 'Tyson'
    choose 'employee[currently_employed]', option: 'No'
    fill_in 'employee[wage]', with: 40.51
    click_on 'Create Employee'
    new_ee = Employee.all.where(last_name: 'Tyson')

    expect(current_path).to eq("/restaurants/#{@restaurant.id}/employees")
    expect(page).to have_content('Tyson')
    expect(page).to have_content('Former Employee')
    expect(page).to have_content(40.51)
    expect(new_ee.count).to eq 1
  end
end