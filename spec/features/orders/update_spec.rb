require 'rails_helper'

RSpec.describe 'orders update' do
  it 'can provide a link to update an order' do
    customer = Customer.create!({
      first_name: 'Chaz',
      last_name: 'Simons',
      address: '1234 Cool Guy Lane',
      over_21: true,
      rewards: 1000
      })
    order_1 = customer.orders.create!({
      special_instructions: 'extra onions',
      number_of_items: 2,
      paid: true
      })

    visit "/orders/#{order_1.id}"

    click_link "Update Order"
  end
end
