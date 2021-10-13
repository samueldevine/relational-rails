require 'rails_helper'

RSpec.describe 'orders index page', type: :feature do
  it 'can show a index of all orders' do
    order_1 = Order.create({
      special_instructions: 'extra olives',
      paid: true,
      number_of_items: 5,
      })

    visit '/orders'

    expect(page).to have_content(order_1.special_instructions)
    expect(page).to_not have_content('No olives please')
  end
end
