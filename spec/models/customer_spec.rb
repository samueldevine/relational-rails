require 'rails_helper'

RSpec.describe Customer do
  it {should have_many :orders}
  before :each do
    @customer_1 = Customer.create({
      first_name: 'Chaz',
      last_name: 'Simons',
      address: '1234 Cool Guy Lane',
      over_21: true,
      rewards: 100
      })
    @customer_2 = Customer.create({
      first_name: 'Rocky',
      last_name: 'Balboa',
      address: 'Them big stairs in Philly',
      over_21: true,
      rewards: 100
      })
    @order_1 = @customer_1.orders.create({
      special_instructions: 'No Pickles',
      number_of_items: 7,
      paid: true
      })
    @order_2 = @customer_2.orders.create({
      special_instructions: 'Raw eggs',
      number_of_items: 12,
      paid: true
      })
    @order_3 = @customer_1.orders.create({
      special_instructions: 'Lots of pepperoni',
      number_of_items: 1,
      paid: false
      })
    @order_4 = @customer_2.orders.create({
      special_instructions: 'Big beef slab',
      number_of_items: 1,
      paid: true
      })
  end

  it 'can display a count of orders' do
    expect(@customer_1.number_of_orders).to eq(2)
    expect(@customer_2.number_of_orders).to eq(2)
  end

  it 'displays the newest customer first' do
    customer_3 = Customer.create({
      first_name: 'Ricky',
      last_name: 'Spanish',
      address: '123 Cherry St',
      over_21: true,
      rewards: 100
      })

    expect(Customer.sort_by_created_at).to eq([customer_3, @customer_2, @customer_1])
  end

  it 'can sort the orders alphabetically' do
    expect(@customer_1.sort_by_alphabet).to eq([@order_3, @order_1])
    expect(@customer_2.sort_by_alphabet).to eq([@order_4, @order_2])
  end

  it 'can filter results', type: :feature do

    visit "/customers/#{@customer_1.id}/orders"

    expect(page).to have_content(@order_1.special_instructions)
    expect(page).to have_content(@order_3.special_instructions)

    fill_in :threshold, with: 3
    click_button "Filter Results"
    expect(page).to have_content(@order_1.special_instructions)
  end
end
