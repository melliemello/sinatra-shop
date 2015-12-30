class AddPriorityToProduct < ActiveRecord::Migration
  def change
    add_column :products, :featured, :boolean, :default => 0
  end
end
