require 'rails_helper'

RSpec.describe Order do
  it {should belong_to :customer}

  it 'will display orders where paid is true' do
    customer_1 = Customer.create({
      first_name: 'Chaz',
      last_name: 'Simons',
      address: '1234 Cool Guy Lane',
      over_21: true,
      rewards: 100
      })
    customer_2 = Customer.create({
      first_name: 'Rocky',
      last_name: 'Balboa',
      address: 'Them big stairs in Philly',
      over_21: true,
      rewards: 100
      })
    order_1 = customer_1.orders.create({
      special_instructions: 'No Pickles',
      number_of_items: 7,
      paid: true
      })
    order_2 = customer_2.orders.create({
      special_instructions: 'Raw eggs',
      number_of_items: 12,
      paid: true
      })
    order_3 = customer_1.orders.create({
      special_instructions: 'Lots of pepperoni',
      number_of_items: 1,
      paid: false
      })
    expect(Order.paid).to eq([order_1, order_2])
  end
end
