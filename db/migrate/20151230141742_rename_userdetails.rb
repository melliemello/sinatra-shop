class RenameUserdetails < ActiveRecord::Migration
  def self.up
    rename_table :userdetails, :user_details
  end

  def self.down
    rename_table :user_details, :userdetails
  end
end
