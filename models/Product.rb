class Product < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :summary

  has_many :pictures

  has_many :categoryassignments
  has_many :categorys, :through => :categoryassignments
end