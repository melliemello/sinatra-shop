#encoding: utf-8

module Sinatra
  module UserHelper
    def find(id)
      settings.db.find(id)
    end

    def create_user(params)
      User.create(params)
    end

    def update_user(id, params)
      params.delete_if { |key, value| value == '' }
      user = settings.db.find(id)
      user.update(params)
    end

    def delete_user(id)
      settings.db.find(id).destroy
    end

    def login_user(params)
      user_found = settings.db.find_by({email: params[:email]})
      return nil unless user_found

      password_is_correct = user_found.password == params[:password]
      password_is_correct ? user_found : nil
    end
  end

  helpers UserHelper
end