class AddCorrectassociationToPictures < ActiveRecord::Migration
  def change
    remove_column :pictures, :customer_id
    add_reference :pictures, :product, index: true
  end
end
