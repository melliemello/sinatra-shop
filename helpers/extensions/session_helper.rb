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
      user = User.find(session[:id]) if session[:id]
      user ? user : nil
    end

    def logged_in
      session[:authorized]
    end

    def required_registration(redirect_path = '/')
      redirect to redirect_path unless session[:authorized]
    end

    def required_admin(redirect_path = '/')
      redirect to redirect_path unless current_user && current_user.is_admin
    end

    def required_unauthorized(redirect_path = '/')
      redirect to redirect_path if session[:authorized]
    end

    def required_permission_level(level)
      redirect to redirect_path unless current_user.permission_level == level
    end
  end

  helpers SessionHelper
end
