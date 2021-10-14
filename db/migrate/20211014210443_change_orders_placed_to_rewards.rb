class ChangeOrdersPlacedToRewards < ActiveRecord::Migration[5.2]
  def change
    rename_column :customers, :orders_placed, :rewards
  end
end
