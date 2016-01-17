class AddQuantityBuyings < ActiveRecord::Migration
  def change
    add_column :buyings, :quantity, :integer
  end
end
