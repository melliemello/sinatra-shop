module ArtGarbage
  module Models
    class Order < ActiveRecord::Base
      has_one :user
      has_many :line_items
      has_many :products, through: :line_items

      accepts_nested_attributes_for :products
      accepts_nested_attributes_for :line_items

      validates_presence_of :email
      validates_presence_of :address
      validates_presence_of :phone
      validates_presence_of :fname
      validates_presence_of :lname

      def total_sum
        line_items.reduce(0) do |sum, item|
          sum + (item.product.price * item.quantity)
        end
      end
    end
  end
end