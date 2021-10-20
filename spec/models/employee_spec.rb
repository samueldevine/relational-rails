require 'rails_helper'

RSpec.describe Employee, type: :model do
  it {should belong_to :restaurant}

  before :each do
    restaurant = Restaurant.create(
      name: 'Michaels Kitchen',
      liquor_license: true,
      menu_items: 3
    )
    @ee1 = restaurant.employees.create({
      first_name: 'Michael',
      last_name: 'A',
      currently_employed: true,
      wage: 15.00
    })
    @ee2 = restaurant.employees.create({
      first_name: 'Michael',
      last_name: 'B',
      currently_employed: false,
      wage: 15.15
    })
  end

  describe 'class methods' do
    describe '::curently_employed' do
      it 'only returns employees that are currently_employed' do
        expect(Employee.all).to eq [@ee1, @ee2]
        expect(Employee.currently_employed).to eq [@ee1]
      end
    end
  end
end
