class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.boolean :liquor_license
      t.integer :menu_items
      t.timestamps
    end
  end
end
