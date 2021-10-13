require 'rails_helper'

RSpec.describe 'Employees Index' do
    it 'lists all employee names' do
        employee_1 = Employee.create!(
            first_name: 'Michael',
            last_name: 'Scott',
            currently_employed: true,
            wage: 15.00
        )
        employee_2 = Employee.create!(
            first_name: 'Michael',
            last_name: 'Jordan',
            currently_employed: true,
            wage: 45.00
        )
        visit '/employees'

        expect(page).to have_content(employee_1.first_name)
        expect(page).to have_content(employee_1.last_name)
        expect(page).to have_content(employee_1.currently_employed)
        expect(page).to have_content(employee_1.wage)
        expect(page).to have_content(employee_2.last_name)
    end
end