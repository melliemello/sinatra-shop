class Category < ActiveRecord::Base
  validates_presence_of :title

  has_many :categoryassignments
  has_many :products, :through => :categoryassignments
end