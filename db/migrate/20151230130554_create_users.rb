class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.timestamps null: false
    end

    create_table :userdetails do |t|
      t.belongs_to :users, index: true

      t.string :fname
      t.string :lname
      t.string :phone
      t.string :address
      t.timestamps null: false

    end
  end
end
