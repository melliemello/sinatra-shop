class Picture < ActiveRecord::Base
  validates_presence_of :file

  mount_uploader :file, Uploader
end