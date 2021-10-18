require 'rails_helper'
# As a visitor
# When I visit a child show page
# Then I see a link to delete the child "Delete Child"
# When I click the link
# Then a 'DELETE' request is sent to '/child_table_name/:id',
# the child is deleted,
# and I am redirected to the child index page where I no longer see this child

RSpec.describe 'orders delete' do
  before :each do
    @customer = Customer.create!({
      first_name: 'Chaz',
      last_name: 'Simons',
      address: '1234 Cool Guy Lane',
      over_21: true,
      rewards: 15 })
    @order_1 = @customer.orders.create({
      special_instructions: 'No pickles',
      paid: true,
      number_of_items: 3
      })
    @order_2 = @customer.orders.create({
      special_instructions: 'A ton of pickles',
      paid: false,
      number_of_items: 1
      })
  end

  it 'has a link to delete an order' do
    visit "/orders/#{@order_1.id}"
    click_link "Delete Order"

    expect(current_path).to eq('/orders')
    expect(page).to_not have_content(@order_1.special_instructions)
  end
end
