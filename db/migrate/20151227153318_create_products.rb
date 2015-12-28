class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :summary
      t.decimal :price
      t.text :description

      t.timestamps
    end
  end
end
