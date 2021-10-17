require 'rails_helper'

RSpec.describe 'customer update' do
  it 'can provide a link to update the customers attributes' do
    customer_1 = Customer.create({
      first_name: 'Chaz',
      last_name: 'Simons',
      address: '1234 Cool Guy Lane',
      over_21: true,
      rewards: 100
      })

    visit "/customers/#{customer_1.id}"
    click_link "Update Customer"
    expect(current_path).to eq "/customers/#{customer_1.id}/edit"
  end

  it 'provides a form to update customers attributes' do
    customer_1 = Customer.create({
      first_name: 'Chaz',
      last_name: 'Simons',
      address: '1234 Cool Guy Lane',
      over_21: true,
      rewards: 100
      })

    visit "/customers/#{customer_1.id}"
    click_link "Update Customer"

    fill_in 'customer[first_name]', with: 'King'
    fill_in 'customer[last_name]', with: 'Cool'
    fill_in 'customer[address]', with: '42 Super Cool Guy Rd'
    select "Yes", :from => "over_21"
    fill_in 'customer[rewards]', with: '300'
    expect(current_path).to eq "/customers/#{customer_1.id}/edit"
  end

  it 'can submit updates to customer attributes' do
    customer_1 = Customer.create({
      first_name: 'Chaz',
      last_name: 'Simons',
      address: '1234 Cool Guy Lane',
      over_21: true,
      rewards: 100
      })

    visit "/customers/#{customer_1.id}/edit"

    fill_in 'customer[first_name]', with: 'King'
    fill_in 'customer[last_name]', with: 'Cool'
    fill_in 'customer[address]', with: '42 Super Cool Guy Rd'
    fill_in 'customer[rewards]', with: '300'

    click_button "Update Customer"

    expect(page).to have_content("King Cool")
    expect(page).to_not have_content("Chaz Simons")
  end
end
