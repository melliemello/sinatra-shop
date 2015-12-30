class AddPictureToProduct < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.string :picture
    end
  end
end
