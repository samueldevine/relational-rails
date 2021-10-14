require 'rails_helper'

RSpec.describe 'orders index page', type: :feature do
  it 'can show a index of all orders' do
    order_1 = Order.create({
      special_instructions: 'extra olives',
      paid: true,
      number_of_items: 5,
      })
    order_2 = Order.create({
      special_instructions: 'bake with love',
      paid: true,
      number_of_items: 2,
      })
    order_3 = Order.create({
      special_instructions: 'no gluten please',
      paid: false,
      number_of_items: 4,
      })


    visit '/orders'

    expect(page).to have_content(order_1.id)
    expect(page).to have_content(order_2.id)
    expect(page).to have_content(order_3.id)
    expect(page).to_not have_content('No olives please')
  end
end
