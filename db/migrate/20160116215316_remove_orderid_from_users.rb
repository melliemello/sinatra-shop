class RemoveOrderidFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :order_id
  end
end
