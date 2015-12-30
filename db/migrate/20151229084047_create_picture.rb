class CreatePicture < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :file
      t.string :alt
    end
  end
end
