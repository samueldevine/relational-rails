class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.references :restaurant, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.boolean :currently_employed
      t.float :wage
      t.timestamps
    end
  end
end
