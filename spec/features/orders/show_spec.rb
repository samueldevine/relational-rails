require 'rails_helper'

RSpec.describe 'orders show page', type: :feature do
  it 'can show a single order' do
    customer = Customer.create!({
      first_name: 'Chaz',
      last_name: 'Simons',
      over_21: true,
      address: '1600 Pennsylvania'
      })

    order_1 = customer.orders.create!({
      special_instructions: 'extra olives',
      paid: true,
      number_of_items: 5,
      })

    order_2 = customer.orders.create!({
      special_instructions: 'no buns',
      paid: false,
      number_of_items: 2,
      })


    visit "/orders/#{order_1.id}"

    save_and_open_page

    expect(page).to have_content(order_1.special_instructions)
    expect(page).to have_content(order_1.paid)
    expect(page).to_not have_content(order_2.special_instructions)
  end
end
