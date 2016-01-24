class RenameBuyings < ActiveRecord::Migration
  def self.up
    rename_table :buyings, :line_items
  end
end
