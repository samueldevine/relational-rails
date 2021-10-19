class Order < ApplicationRecord
  belongs_to :customer

  def self.paid
    where(paid: true)
  end
end
