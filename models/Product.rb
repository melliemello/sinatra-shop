module ArtGarbage
  module Models
    class Product < ActiveRecord::Base
      validates_presence_of :title
      validates_presence_of :summary

      has_many :pictures
      has_many :categoryassignments
      has_many :categorys, :through => :categoryassignments
      has_many :buyings
      has_many :orders, through: :buyings

      accepts_nested_attributes_for :pictures
      accepts_nested_attributes_for :categorys

      def has_category?(id)
        categorys.include?(Category.find(id))
      end
    end
  end
end