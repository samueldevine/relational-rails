require 'rails_helper'

RSpec.describe 'Customer Orders Index' do
  it 'shows a link to create a new order' do
    customer = Customer.create!({
      first_name: 'Chaz',
      last_name: 'Simons',
      address: '123 Cool Guy Street',
      over_21: true,
      rewards: 1000
      })
    order_1 = customer.orders.create!({
      special_instructions: 'Super spicy',
      number_of_items: 2,
      paid: true
      })

    visit "/customers/#{customer.id}/orders"
    click_link 'Create Order'
    expect(current_path).to eq "/customers/#{customer.id}/orders/new"
  end

  it 'provides a form for entering a new order' do
    customer = Customer.create!({
      first_name: 'Chaz',
      last_name: 'Simons',
      address: '123 Cool Guy Street',
      over_21: true,
      rewards: 1000
      })
    order_1 = customer.orders.create!({
      special_instructions: 'Super spicy',
      number_of_items: 2,
      paid: true
      })

    visit "/customers/#{customer.id}/orders"
    click_link 'Create Order'

    fill_in 'special_instructions', with: 'extra onions'
    fill_in 'number_of_items', with: '5'
    select "Yes", :from => "paid"

    click_button "Create Order"
    expect(current_path).to eq "/orders"
  end

  it 'returns the user to the index after creating a new order' do
    customer = Customer.create!({
      first_name: 'Chaz',
      last_name: 'Simons',
      address: '123 Cool Guy Street',
      over_21: true,
      rewards: 1000
      })
    order_1 = customer.orders.create!({
      special_instructions: 'Super spicy',
      number_of_items: 2,
      paid: true
      })
    visit "/customers/#{customer.id}/orders"

    expect(page).to have_content("Super spicy")

    # save_and_open_page
    click_link 'Create Order'
    fill_in 'special_instructions', with: 'extra onions'
    fill_in 'number_of_items', with: '5'
    select "Yes", :from => "paid"

    click_button "Create Order"

    expect(current_path).to eq "/customers/#{customer.id}/orders"
  end

end
