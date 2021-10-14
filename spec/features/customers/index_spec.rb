require 'rails_helper'

RSpec.describe 'customer index page', type: :feature do
  it 'can show a index of customers' do
    customer_1 = Customer.create({
      first_name: 'Chaz',
      last_name: 'Simons',
      address: '1600 Pennsylvania Ave',
      over_21: true
      })

    visit '/customers'

    expect(page).to have_content(customer_1.first_name)
    expect(page).to_not have_content('Jeremy')
  end
end
