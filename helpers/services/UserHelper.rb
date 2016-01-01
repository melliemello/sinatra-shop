#encoding: utf-8

module Sinatra
  module UserHelper
    def find(id)
      settings.db.find(id)
    end

    def create(params)
      validate_user(params)
      user = settings.db.new
      save_user(user, params)
    end

    def update(id, params)
      validate_user(params)
      user = settings.db.find(id)
      save_user(user, params)
    end

    def login(params)
      user_found = settings.db.find_by({email: params[:email]})
      return nil unless user_found

      password_is_correct = user_found.original_password == params[:password]

      password_is_correct ? user_found : nil
    end

    def validate_user(params)
      # settings.errors = []
      # if (settings.db.find_by({email: params[:email]})) then
      #   settings.errors << 'Имейлът вече е регистриран'
      # end

      # settings.errors.length > 0 ? false : true
      true
    end

    private

    def save_user(user, params)
      user.email = params[:email]if params[:email] 
      user.original_password = params[:password] if params[:password] && params[:password] != ''
      user.user_details ||= ::ArtGarbage::Models::UserDetails.new
      user.user_details.fname = params[:fname] if params[:fname] != ''
      user.user_details.lname = params[:lname] if params[:lname]
      user.user_details.phone = params[:phone] if params[:phone]
      user.user_details.address = params[:address] if params[:address]
      user.user_details.save
      user.save
    end
  end

  helpers UserHelper
end