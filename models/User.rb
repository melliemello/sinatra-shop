module ArtGarbage
  module Models
    class User < ActiveRecord::Base
      include BCrypt

      has_one :user_details
      validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
      validates :email, uniqueness: true
      validates_presence_of :password

      def original_password
        @original_password ||= Password.new(self.password)
      end

      def original_password=(new_password)
        @original_password = Password.create(new_password)
        self.password = @original_password
      end
    end
  end
end