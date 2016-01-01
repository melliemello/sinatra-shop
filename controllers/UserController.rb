#encoding: utf-8

module ArtGarbage
  module Controllers
    class UserController < BaseController
      helpers Sinatra::UserHelper
      set :db, Models::User

      get '/users/register' do
        erb :register, :layout => :default
      end
      
      post '/users/register' do
        is_valid_user = validate_user(params)
        if is_valid_user then
          create(params)
        else
          settings.errors.to_s
        end
      end

      get '/users/login' do
        required_unauthorized
        erb :login, :layout => :default
      end

      post '/users/login' do
        current_user = login(params)
        if current_user 
          new_session(current_user)
          'success '
        else
          'login failed'
        end
      end

      get '/users/logout' do
        end_session
        redirect to '/'
      end

      get '/users/edit' do
        @user = current_user
        erb :edit, :layout => :default
      end

      post '/users/edit' do
        is_valid_user = validate_user(params)
        if is_valid_user then
          update(current_user.id, params) ? 'user updated' : 'user update failed'
        else
          settings.errors.to_s
        end
      end
    end
  end
end