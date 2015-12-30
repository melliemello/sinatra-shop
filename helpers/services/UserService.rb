#encoding: utf-8

module ArtGarbage
  module Helpers
    class UserService
      attr_reader :errors

      def initialize(db_table)
        @db_table = db_table
      end

      def create(params)
        validate_user(params)
        user = @db_table.new
        
        user.email = params[:email]
        user.original_password = params[:password]
        user.user_details = Models::UserDetails.new
        user.user_details.fname = params[:fname]
        user.user_details.lname = params[:lname]
        user.user_details.phone = params[:phone]
        user.user_details.address = params[:address]
        user.save ? user : nil
      end

      def validate_user(params)
        @errors = []
        if (@db_table.find_by({email: params[:email]})) then
          @errors << 'Имейлът вече е регистриран'
        end

        @errors.length > 0 ? false : true
      end
    end
  end
end