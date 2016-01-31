class UsersAddActivationDigest < ActiveRecord::Migration
  def change
    add_column :users, :activation_digest, :string
    add_column :users, :is_active, :boolean, :default => 0
  end
end
