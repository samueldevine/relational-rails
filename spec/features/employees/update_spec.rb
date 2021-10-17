require 'rails_helper'

RSpec.describe 'Employee Update' do
  before :each do
    @restaurant = Restaurant.create!(
      name: 'Watercourse Foods',
      liquor_license: true,
      menu_items: 15,
    )
    @employee = @restaurant.employees.create!(
      first_name: 'Michael',
      last_name: 'Thompson',
      currently_employed: true,
      wage: 20.00
    )
  end

  it 'is linked on each employee show page' do
    visit "/employees/#{@employee.id}"

    expect(page).to have_content "Update Employee"

    click_on "Update Employee"

    expect(current_path).to eq "/employees/#{@employee.id}/edit"
  end

  it 'updates the employee record' do
    visit "/employees/#{@employee.id}/edit"
    fill_in 'employee[first_name]', with: 'Pichael'
    fill_in 'employee[last_name]', with: 'Thompson'
    choose 'employee[currently_employed]', option: 'Yes'
    fill_in 'employee[wage]', with: 23.65
    click_on 'Update Employee'

    expect(current_path).to eq "/employees/#{@employee.id}"
    expect(page).to have_content 'Pichael'
    expect(page).to have_content 23.65
    expect(Employee.all.where(first_name: 'Michael').count).to eq 0
    expect(Employee.all.where(first_name: 'Pichael').count).to eq 1
    expect(Employee.all.where(last_name: 'Thompson').count).to eq 1
  end
end