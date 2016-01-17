module ArtGarbage
  module Models
    class User < ActiveRecord::Base
      include BCrypt

      has_one :user_details
      validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
      validates :email, uniqueness: true
      validates_presence_of :password
      validates_presence_of :permission_level

      accepts_nested_attributes_for :user_details

      def password
        @password ||= Password.new(password_digest)
      end

      def password=(new_password)
        @password = Password.create(new_password)
        self.password_digest = @password
      end

      def is_admin
        self.permission_level == 1
      end
    end
  end
end