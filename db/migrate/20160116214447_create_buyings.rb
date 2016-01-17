class CreateBuyings < ActiveRecord::Migration
  def change
    create_table :buyings do |t|
      t.belongs_to :order, index: true
      t.belongs_to :product, index: true
      t.datetime :order_date
      t.timestamps null: false
    end
  end
end
