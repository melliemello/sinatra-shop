module ArtGarbage
  module Models
    class LineItem < ActiveRecord::Base
      belongs_to :order
      belongs_to :product

      accepts_nested_attributes_for :product
    end
  end
end