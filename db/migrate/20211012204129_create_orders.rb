class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :customer, foreign_key: true
      t.string :special_instructions
      t.boolean :paid
      t.integer :number_of_items
      t.timestamps
    end
  end
end
