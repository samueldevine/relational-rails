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

  def filter(params)
    if params[:sorted] == 'true'
      sort_by_alphabet
    elsif params[:threshold]
      orders.where('number_of_items > ?', params[:threshold])
    else
      orders
    end
  end
end
