class Restaurant < ApplicationRecord
  has_many :employees, :dependent => :destroy

  def self.sort_by_created_at
    order(created_at: :desc)
  end

  def employee_count
    employees.count
  end

  def sort_employees_alphabetically
    employees.order(:last_name)
  end

  def wage_filter(wage)
    employees.where('wage > ?', wage)
  end
end
