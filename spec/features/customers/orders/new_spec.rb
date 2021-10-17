require 'rails_helper'

RSpec.describe 'Customer Orders Index' do
  before (:each) do
    @customer = Customer.create!({
      first_name: 'Chaz',
      last_name: 'Simons',
      address: '123 Cool Guy Street',
      over_21: true,
      rewards: 1000
      })
  end

  it 'shows a link to create a new order' do
    visit "/customers/#{@customer.id}/orders"
    click_link 'Create Order'
    expect(current_path).to eq "/customers/#{@customer.id}/orders/new"
  end

  it 'provides a form for entering a new order' do
    visit "/customers/#{@customer.id}/orders/new"
    fill_in 'order[special_instructions]', with: 'extra onions'
    fill_in 'order[number_of_items]', with: '5'
    select "Yes", :from => "order[paid]"
    click_button "Create Order"
    new_order = Order.all.where(special_instructions: 'extra onions')

    expect(current_path).to eq "/customers/#{@customer.id}/orders"
    expect(page).to have_content('extra onions')
    expect(new_order.count).to eq 1
  end

  it 'returns the user to the index after creating a new order' do
    order_1 = @customer.orders.create!({
      special_instructions: 'Super spicy',
      number_of_items: 2,
      paid: true
      })
    visit "/customers/#{@customer.id}/orders"

    expect(page).to have_content("Super spicy")
    click_link 'Create Order'
    fill_in 'order[special_instructions]', with: 'extra onions'
    fill_in 'order[number_of_items]', with: '5'
    select "Yes", :from => "order[paid]"

    click_button "Create Order"

    expect(page).to have_content('extra onions')
    expect(current_path).to eq "/customers/#{@customer.id}/orders"
  end

end
