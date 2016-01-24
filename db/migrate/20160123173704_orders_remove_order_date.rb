class OrdersRemoveOrderDate < ActiveRecord::Migration
  def change
    remove_column :line_items, :order_date
  end
end
