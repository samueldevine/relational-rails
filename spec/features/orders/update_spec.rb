require 'rails_helper'

RSpec.describe 'orders update' do
  it 'can provide a link to update an order' do
    customer = Customer.create!({
      first_name: 'Chaz',
      last_name: 'Simons',
      address: '1234 Cool Guy Lane',
      over_21: true,
      rewards: 1000
      })
    order_1 = customer.orders.create!({
      special_instructions: 'extra onions',
      number_of_items: 2,
      paid: true
      })

    visit "/orders/#{order_1.id}"

    click_link "Update Order"
    expect(current_path).to eq "/orders/#{order_1.id}/edit"
  end

  it 'provides a form to update attributes' do
    customer = Customer.create!({
      first_name: 'Chaz',
      last_name: 'Simons',
      address: '1234 Cool Guy Lane',
      over_21: true,
      rewards: 1000
      })
    order_1 = customer.orders.create!({
      special_instructions: 'extra onions',
      number_of_items: 2,
      paid: true
      })

    visit "/orders/#{order_1.id}"
    click_link "Update Order"

    fill_in 'order[special_instructions]', with: 'NO onions'
    fill_in 'order[number_of_items]', with: '5'
    select "No", :from => "order[paid]"

    click_button "Update Order"
    expect(current_path).to eq "/orders/#{order_1.id}"
  end

  it 'displays the updated information after submission' do
    customer = Customer.create!({
      first_name: 'Chaz',
      last_name: 'Simons',
      address: '1234 Cool Guy Lane',
      over_21: true,
      rewards: 1000
      })
    order_1 = customer.orders.create!({
      special_instructions: 'extra onions',
      number_of_items: 2,
      paid: true
      })

    visit "/orders/#{order_1.id}/edit"

    fill_in 'order[special_instructions]', with: 'NO onions'
    fill_in 'order[number_of_items]', with: '5'
    select "No", :from => "order[paid]"

    click_button "Update Order"
    save_and_open_page
    expect(page).to have_content("Special Instructions: NO onions")
    expect(page).to_not have_content("extra onions")
  end
end
