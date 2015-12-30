module ArtGarbage
  module Models
    class Picture < ActiveRecord::Base
      validates_presence_of :file

      mount_uploader :file, ArtGarbage::Helpers::Uploader
    end
  end
end