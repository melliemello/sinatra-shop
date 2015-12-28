class Product < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :summary
end