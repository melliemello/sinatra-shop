class AddPermissionlevelToUser < ActiveRecord::Migration
  def change
    add_column :users, :permission_level, :integer
  end
end
