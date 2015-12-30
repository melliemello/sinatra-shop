#encoding: utf-8

module ArtGarbage
  module Controllers
    class UserController < BaseController
      enable :sessions

      db = Models::User
      user_service = ArtGarbage::Helpers::UserService.new(db)

      get '/users/register' do
        erb :register, :layout => :default
      end
      
      post '/users/register' do
        is_valid_user = user_service.validate_user(params)
        if is_valid_user then
          user_service.create(params)
        else
          user_service.errors.to_s
          'failed'
        end
      end

      get '/users/login' do
        erb :login, :layout => :default
      end

      post '/users/login' do
        user_found = db.find_by({email: params[:email]})

        if user_found.original_password == params[:password] then
          session[:id] = 'user_found.id'
          'success'
        else
          "user not found"
        end
      end
    end
  end
end