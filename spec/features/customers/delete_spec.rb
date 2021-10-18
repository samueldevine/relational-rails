require 'rails_helper'
#   As a visitor
# When I visit a parent show page
# Then I see a link to delete the parent
# When I click the link "Delete Parent"
# Then a 'DELETE' request is sent to '/parents/:id',
# the parent is deleted, and all child records are deleted
# and I am redirected to the parent index page where I no longer see this parent

RSpec.describe 'customer delete' do
  before(:each) do
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

  it 'has a link to delete a customer' do
    visit "/customers/#{@customer.id}"
    click_link 'Delete Customer'

    expect(current_path).to eq("/customers")
    expect(page).to_not have_content("Chaz")
    expect(page).to_not have_link("Delete Customer")
  end

  it 'deletes all orders associated with customer' do
    visit "/customers/#{@customer.id}/orders"
    expect(page).to have_content(@order_1.special_instructions)
    expect(page).to have_content(@order_2.special_instructions)

    visit "/customers/#{@customer.id}"
    click_link 'Delete Customer'

    expect(current_path).to eq('/customers')
    visit "/orders"
    expect(page).to_not have_content(@order_1.special_instructions)
    expect(page).to_not have_content(@order_2.special_instructions)
  end
end
