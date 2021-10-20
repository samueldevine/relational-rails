require 'rails_helper'

RSpec.describe 'Employees Index' do
  before :each do
    @restaurant = Restaurant.create!(
      name: 'Watercourse',
      liquor_license: true,
      menu_items: 10
    )
    @employee_1 = Employee.create!(
      first_name: 'Michael',
      last_name: 'Scott',
      currently_employed: true,
      wage: 15.00,
      restaurant_id: @restaurant.id
    )
    @employee_2 = Employee.create!(
      first_name: 'Michael',
      last_name: 'Jordan',
      currently_employed: true,
      wage: 45.00,
      restaurant_id: @restaurant.id
    )
  end

  it 'lists all employee names' do
    visit '/employees'

    expect(page).to have_content(@employee_1.first_name)
    expect(page).to have_content(@employee_1.last_name)
    expect(page).to have_content(@employee_1.wage)
    expect(page).to have_content(@employee_2.last_name)
  end

  it 'only shows current employees' do
    @employee_2.update!(currently_employed: false)

    visit '/employees'

    expect(page).to have_content(@employee_1.last_name)
    expect(page).to_not have_content(@employee_2.last_name)
  end
end
