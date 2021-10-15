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
    visit "/customers/#{customer.id}/orders"
    click_link 'Create Order'
  end

  it 'provides a form for entering a new order' do
    customer = Customer.create!({
      first_name: 'Chaz',
      last_name: 'Simons',
      address: '123 Cool Guy Street',
      over_21: true,
      rewards: 1000
      })
    visit "/customers/#{customer.id}/orders"
    click_link 'Create Order'

    fill_in 'special_instructions', with: 'extra onions'
    fill_in 'number_of_items', with: '5'
    select "Yes", :from => "paid"

    click_button "Create Order"
  end

  it 'returns the user to the index after creating a new order' do
    customer = Customer.create!({
      first_name: 'Chaz',
      last_name: 'Simons',
      address: '123 Cool Guy Street',
      over_21: true,
      rewards: 1000
      })
    visit "/customers/#{customer.id}/orders"
    click_link 'Create Order'

    fill_in 'special_instructions', with: 'extra onions'
    fill_in 'number_of_items', with: '5'
    select "Yes", :from => "paid"

    click_button "Create Order"

    visit "/customers/#{customer.id}/orders"

    expect(page).to have_content("extra onions")
  end

end
