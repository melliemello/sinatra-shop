#encoding: utf-8

module ArtGarbage
  module Controllers
    class UserController < BaseController
      helpers Sinatra::UserHelper
      set :db, Models::User

      get '/users/register' do
        required_unauthorized
        erb :register, :layout => :default
      end
      
      post '/users/register' do
        required_unauthorized
        params[:permission_level] = 2
        if create_product(params) then
          redirect to '/users/login'
        else
          settings.errors.to_s
        end
      end

      get '/users/login' do
        required_unauthorized
        erb :login, :layout => :default
      end

      post '/users/login' do
        current_user = login_user(params)
        if current_user 
          new_session(current_user)
          redirect ('/products')
        else
          'login failed'
        end

      end

      get '/users/logout' do
        required_registration
        end_session
        redirect to '/'
      end

      get '/users/edit' do
        required_registration
        @user = current_user
        erb :edit, :layout => :default
      end

      post '/users/edit' do
        required_registration
        if update_user(current_user.id, params) then
           'user updated'
        else
          'user update failed'
        end
      end

      get '/users/delete' do
        required_registration
        delete_user(session[:id])
        end_session
        redirect to '/'
      end
    end
  end
end