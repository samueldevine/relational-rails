require 'rails_helper'

RSpec.describe 'orders show page', type: :feature do
  it 'can show a single order' do
    order_1 = Order.create({
      special_instructions: 'extra olives',
      paid: true,
      number_of_items: 5,
      })

    order_2 = Order.create({
      special_instructions: 'no buns',
      paid: false,
      number_of_items: 2,
      })


    visit "/orders/#{order_1.id}"

    expect(page).to have_content(order_1.special_instructions)
    expect(page).to have_content(order_1.paid)
    expect(page).to_not have_content(order_2.special_instructions)
  end
end
