class RenameUserIndex < ActiveRecord::Migration
  def change
    rename_column :user_details, :users_id, :user_id
  end
end
