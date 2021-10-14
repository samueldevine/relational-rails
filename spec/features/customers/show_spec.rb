require 'rails_helper'

RSpec.describe 'customer show page', type: :feature do
  it 'can show a single customer' do
    customer_1 = Customer.create!({
      first_name: 'Chaz',
      last_name: 'Simons',
      address: '1600 Pennsylvania',
      over_21: true
      })
    customer_2 = Customer.create!({
      first_name: 'Michael',
      last_name: 'Jackson',
      address: '1234 Neverland',
      over_21: true
      })

    visit "/customers/#{customer_1.id}"

    expect(page).to have_content(customer_1.address)
    expect(page).to have_content(customer_1.last_name)
    expect(page).to_not have_content(customer_2.first_name)
  end
end
