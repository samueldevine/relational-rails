require 'rails_helper'

RSpec.describe 'customer index page', type: :feature do
  it 'can show a index of customers' do
    customer_1 = Customer.create({
      first_name: 'Chaz',
      last_name: 'Simons',
      address: '1600 Pennsylvania Ave',
      over_21: true,
      rewards: 100
      })
    customer_2 = Customer.create({
      first_name: 'Roger',
      last_name: 'Smith',
      address: '123 Cherry St',
      over_21: true,
      rewards: 25
      })

    visit '/customers'

    expect(page).to have_content(customer_1.first_name)
    expect(page).to have_content(customer_2.first_name)
    expect(page).to_not have_content('Jeremy')
  end

  it 'will display customers by the date they were created' do
    customer_1 = Customer.create({
      first_name: 'Chaz',
      last_name: 'Simons',
      address: '1600 Pennsylvania Ave',
      over_21: true,
      rewards: 100
      })
    customer_2 = Customer.create({
      first_name: 'Roger',
      last_name: 'Smith',
      address: '123 Cherry St',
      over_21: true,
      rewards: 25
      })

    visit "/customers"

    expect(customer_2.first_name).to appear_before(customer_1.first_name)

    expect(page).to have_content(customer_1.created_at)
    expect(page).to have_content(customer_2.created_at)
  end
end
