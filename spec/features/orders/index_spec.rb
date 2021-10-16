require 'rails_helper'

RSpec.describe 'orders index page', type: :feature do
  it 'can show a index of all orders' do
    customer_1 = Customer.create({
      first_name: 'Chaz',
      last_name: 'Simons',
      address: '1234 Cool Guy Lane',
      over_21: true,
      rewards: 1000
      })
    customer_2 = Customer.create({
      first_name: 'Roger',
      last_name: 'Smith',
      address: '123 Cherry St',
      over_21: true,
      rewards: 100
      })
    order_1 = customer_1.orders.create({
      special_instructions: 'extra olives',
      paid: true,
      number_of_items: 5,
      })
    order_2 = customer_2.orders.create({
      special_instructions: 'bake with love',
      paid: true,
      number_of_items: 2,
      })
    order_3 = customer_2.orders.create({
      special_instructions: 'no gluten please',
      paid: false,
      number_of_items: 4,
      })

    visit '/orders'

    expect(page).to have_content("extra olives")
    expect(page).to have_content("bake with love")
    expect(page).to_not have_content("no gluten please")
    expect(page).to_not have_content('No olives please')
  end

  it 'displays only the orders that are paid' do
    customer_1 = Customer.create({
      first_name: 'Chaz',
      last_name: 'Simons',
      address: '1234 Cool Guy Lane',
      over_21: true,
      rewards: 1000
      })
    customer_2 = Customer.create({
      first_name: 'Roger',
      last_name: 'Smith',
      address: '123 Cherry St',
      over_21: true,
      rewards: 100
      })
    order_1 = customer_1.orders.create({
      special_instructions: 'extra olives',
      paid: true,
      number_of_items: 5,
      })
    order_2 = customer_2.orders.create({
      special_instructions: 'bake with love',
      paid: true,
      number_of_items: 2,
      })
    order_3 = customer_2.orders.create({
      special_instructions: 'no gluten please',
      paid: false,
      number_of_items: 4,
      })

      visit '/orders'

      expect(page).to have_content('extra olives')
      expect(page).to have_content('bake with love')
      expect(page).to_not have_content('no gluten please')
    end
end
