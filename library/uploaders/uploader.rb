module ArtGarbage
  module Helpers
    class Uploader < CarrierWave::Uploader::Base
      storage :file

      def store_dir
        'product_images'
      end
    end
  end
end