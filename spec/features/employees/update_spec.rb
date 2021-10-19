require 'rails_helper'

RSpec.describe 'Employee Update' do
  before :each do
    @restaurant = Restaurant.create!(
      name: 'Watercourse Foods',
      liquor_license: true,
      menu_items: 15,
    )
    @employee_1 = @restaurant.employees.create!(
      first_name: 'Michael',
      last_name: 'Thompso',
      currently_employed: false,
      wage: 20.00
    )
    @employee_2 = @restaurant.employees.create!(
      first_name: 'Mikel',
      last_name: 'Jakson',
      currently_employed: true,
      wage: 40.00
    )
  end

  it 'is linked on each employee show page' do
    visit "/employees/#{@employee_1.id}"

    expect(page).to have_content "Update Employee"

    click_on "Update Employee"

    expect(current_path).to eq "/employees/#{@employee_1.id}/edit"
  end

  it 'updates the employee record' do
    visit "/employees/#{@employee_1.id}/edit"
    fill_in 'employee[first_name]', with: 'Pichael'
    fill_in 'employee[last_name]', with: 'Thompson'
    choose 'employee[currently_employed]', option: 'Yes'
    fill_in 'employee[wage]', with: 23.65
    click_on 'Update Employee'

    expect(current_path).to eq "/employees/#{@employee_1.id}"
    expect(page).to have_content 'Pichael'
    expect(page).to have_content 'Thompson'
    expect(page).to have_content 'Current Employee'
    expect(page).to have_content 23.65

    visit "/employees/#{@employee_2.id}/edit"
    fill_in 'employee[first_name]', with: 'Michael'
    fill_in 'employee[last_name]', with: 'Jackson'
    choose 'employee[currently_employed]', option: 'No'
    fill_in 'employee[wage]', with: 30.00
    click_on 'Update Employee'

    expect(current_path).to eq "/employees/#{@employee_2.id}"
    expect(page).to have_content 'Michael'
    expect(page).to have_content 'Jackson'
    expect(page).to have_content 'Former Employee'
    expect(page).to have_content 30.00
  end
end