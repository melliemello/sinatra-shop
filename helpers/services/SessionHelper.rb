module Sinatra
  module SessionHelper
    def new_session(user)
      session[:id] = user.id
      session[:authorized] = true
    end

    def end_session
      session[:id] = nil
      session[:authorized] = false
    end

    def current_user
      settings.db.find(session[:id])
    end

    def logged_in
      session[:authorized]
    end

    def required_registration(redirect_path = '/')
      redirect to redirect_path unless session[:authorized]
    end

    def required_admin(redirect_path = '/')
      # return false unless current_user.is_admin
    end

    def required_unauthorized(redirect_path = '/')
      redirect to redirect_path if session[:authorized]
    end
  end

  helpers SessionHelper
end
