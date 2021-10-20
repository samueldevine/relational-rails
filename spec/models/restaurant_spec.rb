require 'rails_helper'

RSpec.describe Restaurant do
  it {should have_many :employees}

  before :each do
    @r1 = Restaurant.create(
      name: 'Michaels Kitchen',
      liquor_license: true,
      menu_items: 3
    )
    @r2 = Restaurant.create(
      name: 'A True Michael Experience',
      liquor_license: false,
      menu_items: 35
    )
    @r3 = Restaurant.create(
      name: 'The Michael Bar',
      liquor_license: true,
      menu_items: 10
    )
  end

  describe 'class methods' do
    describe '::sort_by_created_at' do
      it 'orders restaurants by created_at (most recent first)' do
        restaurants = Restaurant.all

        expect(restaurants).to eq [@r1, @r2, @r3]
        expect(restaurants.sort_by_created_at).to eq [@r3, @r2, @r1]
      end
    end
  end

  describe 'instance methods' do
    before :each do
      @ee1 = @r1.employees.create({
        first_name: 'Michael',
        last_name: 'A',
        currently_employed: true,
        wage: 15.00
      })
      @ee2 = @r1.employees.create({
        first_name: 'Michael',
        last_name: 'B',
        currently_employed: true,
        wage: 15.15
      })
      @ee3 = @r2.employees.create({
        first_name: 'Michael',
        last_name: 'C',
        currently_employed: true,
        wage: 30.00
      })
    end

    describe '#employee_count' do
      it 'counts all employees for a given restaurant' do
        expect(@r1.employee_count).to eq 2
        expect(@r2.employee_count).to eq 1
        expect(@r3.employee_count).to eq 0
      end
    end

    describe '#sort_employees_alphabetically' do
      it 'sorts employees by last name' do
        expect(@r1.sort_employees_alphabetically).to eq [@ee1, @ee2]
      end
    end

    describe '#wage_filter' do
      it 'only returns employees earning more than the specified wage' do
        expect(@r1.wage_filter(15.01)).to eq [@ee2]
        expect(@r1.wage_filter(15)).to eq [@ee2]
        expect(@r1.wage_filter(14.99)).to eq [@ee1, @ee2]
      end
    end
  end
end
