class Restaurant < ApplicationRecord
  has_many :employees, :dependent => :destroy
end