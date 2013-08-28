class SessionsController < ApplicationController
  require 'bcrypt'
  skip_before_filter :authenticate_user
  
  def new
  end
    
  def create  
    if authenticated?  
      session[:logado] = 1  
      redirect_to root_url, notice: "Logado!"
    else
      render action: 'new', notice: 'Nome de usuário ou senha inválidos.'
    end  
  end  
  
  def destroy  
    session[:logado] = nil
    redirect_to login_path, notice: 'Você saiu.'
  end

  private

  def authenticated?
    @user, @password = params[:username], params[:password]
    @user == USER && Digest::SHA1.new.hexdigest(@password) == PASSWORD
  end

end
