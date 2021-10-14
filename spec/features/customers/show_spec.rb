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

  it 'will display a count of orders associated with a customers id' do
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
    order_1 = customer_1.orders.create({
      special_instructions: 'no pickles',
      paid: true,
      number_of_items: 3
      })
    order_2 = customer_2.orders.create({
      special_instructions: 'extra pickles',
      paid: true,
      number_of_items: 3
      })
    order_3 = customer_1.orders.create({
      special_instructions: 'extra crispy fries',
      paid: true,
      number_of_items: 3
      })

    visit "/customers/#{customer_1.id}"
    save_and_open_page
    expect(page).to have_content(customer_1.first_name)
    expect(page).to have_content("Total Orders: 2")
    expect(page).to_not have_content("extra pickles")
  end

  it 'will have a link to the orders page' do
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
    order_1 = customer_1.orders.create({
      special_instructions: 'no pickles',
      paid: true,
      number_of_items: 3
      })
    order_2 = customer_2.orders.create({
      special_instructions: 'extra pickles',
      paid: true,
      number_of_items: 3
      })

    visit "/customers/#{customer_1.id}"
    save_and_open_page
    click_link "View Orders"
  end
end
