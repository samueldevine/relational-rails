require 'rails_helper'

RSpec.describe 'customer orders' do
  it 'can display an index of customer orders' do
    customer = Customer.create!({
      first_name: 'Chaz',
      last_name: 'Simons',
      over_21: true,
      address: '1600 Pennsylvania'
      })
    customer_2 = Customer.create!({
      first_name: 'Roger',
      last_name: 'Smith',
      over_21: true,
      address: '123 Cherry St'
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
    order_3 = customer_2.orders.create!({
      special_instructions: 'Utensils please',
      paid: true,
      number_of_items: 25,
      })

    visit "/customers/#{customer.id}/orders"
    expect(page).to have_content(order_1.special_instructions)
    expect(page).to have_content(order_2.special_instructions)
    expect(page).to_not have_content(order_3.id)
  end

  it 'does not display another customers orders' do
    customer = Customer.create!({
      first_name: 'Chaz',
      last_name: 'Simons',
      over_21: true,
      address: '1600 Pennsylvania'
      })
    customer_2 = Customer.create!({
      first_name: 'Roger',
      last_name: 'Smith',
      over_21: true,
      address: '123 Cherry St'
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
    order_3 = customer_2.orders.create!({
      special_instructions: 'Utensils please',
      paid: true,
      number_of_items: 25,
      })

    visit "/customers/#{customer_2.id}/orders"

    expect(page).to have_content(customer_2.first_name)
    expect(page).to have_content(order_3.special_instructions)
    expect(page).to_not have_content(customer.first_name)
  end

  it 'can sort orders alphabetically by special_instructions' do
    customer = Customer.create!({
      first_name: 'Chaz',
      last_name: 'Simons',
      over_21: true,
      address: '1600 Pennsylvania'
      })
    customer_2 = Customer.create!({
      first_name: 'Roger',
      last_name: 'Smith',
      over_21: true,
      address: '123 Cherry St'
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
    order_3 = customer_2.orders.create!({
      special_instructions: 'Utensils please',
      paid: true,
      number_of_items: 25,
      })

    visit "/customers/#{customer.id}/orders"
    expect(page).to have_content("Sort Alphabetically by Special Instructions")
    click_link 'Sort Alphabetically by Special Instructions'

    expect(order_1.special_instructions).to appear_before(order_2.special_instructions)

    expect(page).to have_content(order_1.special_instructions)
    expect(page).to_not have_content(order_3.special_instructions)
  end
end
