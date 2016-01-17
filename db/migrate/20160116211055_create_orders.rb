class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.belongs_to :user, index: true
      t.string :fname
      t.string :lname
      t.string :address
      t.string :email
      t.string :phone
    end
  end
end
