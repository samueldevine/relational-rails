require 'rails_helper'

RSpec.describe "Restaurant's employee index" do
  before :each do
    @restaurant = Restaurant.create(
      name: 'Watercourse Foods',
      liquor_license: true,
      menu_items: 15,
    )
    @ee1 = @restaurant.employees.create(
      first_name: 'Michael',
      last_name: 'Scott',
      currently_employed: true,
      wage: 15.00
    )
    @ee2 = @restaurant.employees.create(
      first_name: 'Michael',
      last_name: 'Jordan',
      currently_employed: false,
      wage: 45.00
    )
    @ee3 = @restaurant.employees.create(
      first_name: 'Michael',
      last_name: 'A',
      currently_employed: true,
      wage: 45.00
    )
    @ee4 = @restaurant.employees.create(
      first_name: 'Michael',
      last_name: 'Z',
      currently_employed: true,
      wage: 45.00
    )
  end

  it 'shows the names of all employees for the restaurant' do
    visit "restaurants/#{@restaurant.id}/employees"

    expect(page).to have_content(@ee1.last_name)
    expect(page).to have_content(@ee2.last_name)
    expect(page).to have_content(@ee3.last_name)
    expect(page).to have_content(@ee4.last_name)
  end

  it 'links to each employees show page' do
    visit "restaurants/#{@restaurant.id}/employees"

    click_on @ee1.last_name

    expect(current_path).to eq("/employees/#{@ee1.id}")
  end

  it 'can sort employees alphabetically' do
    visit "restaurants/#{@restaurant.id}/employees"

    expect(@ee1.first_name + ' ' + @ee1.last_name).to appear_before(@ee2.first_name + ' ' + @ee2.last_name)
    expect(@ee2.first_name + ' ' + @ee2.last_name).to appear_before(@ee3.first_name + ' ' + @ee3.last_name)
    expect(@ee3.first_name + ' ' + @ee3.last_name).to appear_before(@ee4.first_name + ' ' + @ee4.last_name)
    expect(page).to have_content "Sort Employees Alphabetically"

    click_on "Sort Employees Alphabetically"

    expect(current_path).to eq "/restaurants/#{@restaurant.id}/employees/alpha_sorted"
    expect(@ee3.first_name + ' ' + @ee3.last_name).to appear_before(@ee2.first_name + ' ' + @ee2.last_name)
    expect(@ee2.first_name + ' ' + @ee2.last_name).to appear_before(@ee1.first_name + ' ' + @ee1.last_name)
    expect(@ee3.first_name + ' ' + @ee3.last_name).to appear_before(@ee4.first_name + ' ' + @ee4.last_name)
  end

  it 'can filter out employees below a certain wage' do
    visit "restaurants/#{@restaurant.id}/employees"

    fill_in :wage, with: 20.00

    click_on 'Only return employees that earn more than:'

    expect(current_path).to eq "/restaurants/#{@restaurant.id}/employees/wage_filtered"
    expect(page).to_not have_content 'Michael Scott'
    expect(page).to have_content 'Michael Jordan'
    expect(page).to have_content 'Michael A'
    expect(page).to have_content 'Michael Z'
  end
end