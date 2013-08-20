class ApplicationController < ActionController::Base
  before_filter :authenticate_user
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private  
    
    def current_user  
      @current_user ||= User.find(session[:user_id]) if session[:user_id]  
    end 

    def authenticate_user
      if session[:user_id].nil?
        redirect_to login_path, notice: 'Você precisa logar!'
      end
    end
end
