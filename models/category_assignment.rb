module ArtGarbage
  module Models
    class Categoryassignment < ActiveRecord::Base
      belongs_to :product
      belongs_to :category
    end
  end
end