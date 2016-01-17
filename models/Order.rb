module ArtGarbage
  module Models
    class Order < ActiveRecord::Base
      has_one :user
      has_many :buyings
      has_many :products, through: :buyings

      accepts_nested_attributes_for :products
      accepts_nested_attributes_for :buyings

      # validates_presence_of :email
      # validates_presence_of :address
      # validates_presence_of :phone
      # validates_presence_of :fname
      # validates_presence_of :lname

    end
  end
end