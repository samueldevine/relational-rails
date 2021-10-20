class Customer < ApplicationRecord
  has_many :orders, :dependent => :destroy

  def self.sort_by_created_at
    order(created_at: :desc)
  end

  def number_of_orders
    orders.count
  end

  def sort_by_alphabet
    orders.order(special_instructions: :asc)
  end
end
