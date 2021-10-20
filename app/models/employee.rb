class Employee < ApplicationRecord
  belongs_to :restaurant

  def self.currently_employed
    all.where(currently_employed: true)
  end
end
