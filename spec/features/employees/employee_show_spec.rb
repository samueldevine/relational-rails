require 'rails_helper'

RSpec.describe 'Employees Show Page' do
    context 'Iteration 1' do
        it "shows all employees and their attributes"
        employee_1 = Employee.create!(
            first_name: 'Michael',
            last_name: 'Scott'
            currently_employed: true,
            wage: 15.00,
        )
        employee_2 = Employee.create!(
            first_name: 'Michael',
            last_name: 'Jordan'
            currently_employed: true,
            wage: 45.00,
        )
        visit "/employees/#{employee_1.id}"

        expect(page).to have_content(employee_1.first_name)
        expect(page).to have_content(employee_1.last_name)
        expect(page).to have_content(employee_1.currently_employed)
        expect(page).to have_content(employee_1.wage)

        expect(page).to_not have_content(employee_2.first_name)
    end
end