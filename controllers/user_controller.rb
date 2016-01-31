#encoding: utf-8

module ArtGarbage
  module Controllers
    class UserController < BaseController
      get '/users/register' do
        required_unauthorized
        render_template 'register'
      end
      
      post '/users/register' do
        required_unauthorized
        activation_salt = BCrypt::Engine.generate_salt
        activation_hash = BCrypt::Engine.hash_secret(params[:name], activation_salt)
        params[:permission_level] = 2
        params[:activation_digest] = activation_hash
        @user = User.create(params).user_details
        @activation_link = "#{settings.base_url}/users/activation/#{CGI::escape(activation_hash)}"
        @mailer = Models::Mail.new(binding)

        if @user then
          activation_mail = {
            receiver: 'drenskam@gmail.com',
            subject: 'Your activation link for ArtGarbage Atelier',
            template: 'activation_link'
          }

          @mailer.deliver activation_mail #when I used the send method, in purchase controller send was ok, here I got a type error (symbol expected).
          redirect to '/users/login'
        else
          settings.errors.to_s
        end
      end

      get '/users/login' do
        required_unauthorized
        render_template 'login'
      end

      post '/users/login' do
        password_is_correct = false
        current_user = User.find_by({email: params[:email]})
        if current_user then
          password_is_correct = current_user.password == params[:password]
        end

        if current_user.is_active && password_is_correct 
          new_session(current_user)
          redirect ('/products')
        else
          'login failed'
        end
      end

      get '/users/activation/:activation_digest' do
        activation_digest = CGI::unescape(params[:activation_digest])
        user_found = User.find_by({activation_digest: activation_digest})

        if user_found && user_found.is_active then
          'user already activated'
        elsif user_found && !user_found.is_active then
          user_found.update({is_active: true})
          'user activated'
        else
          'user not found'
        end
      end


      get '/users/logout' do
        required_registration
        end_session
        cookies.delete('ag_card')
        redirect to '/'
      end

      get '/users/edit' do
        required_registration
        @user = current_user
        @orders = Models::Order.where(user_id: current_user.id )
        render_template 'edit'
      end

      post '/users/edit' do
        required_registration
        is_updated = User.find(current_user.id).update(params)
        if is_updated then
           'user updated'
        else
          'user update failed'
        end
      end

      get '/users/delete' do
        required_registration
        current_user.destroy
        end_session
        redirect to '/'
      end
    end
  end
end