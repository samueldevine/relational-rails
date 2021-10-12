class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :first_name
      t.string :last_name
      t.string :address
      t.boolean :over_21
      t.integer :orders_placed
      t.timestamps
    end
  end
end
