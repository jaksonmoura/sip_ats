class SessionsController < ApplicationController
  skip_before_filter :authenticate_user
  
  def new
  end
    
  def create  
    if authenticated?  
      session[:user_id] = @user.id  
      redirect_to root_url, notice: "Logado!"
    else
      render action: 'new', notice: 'Nome de usuário ou senha inválidos.'
    end  
  end  
  
  def destroy  
    session[:user_id] = nil
    redirect_to root_url, notice: 'Você saiu.'
  end

  private

  def authenticated?
    @user = User.find_by_username(params[:username])
    @user && @user.authenticate(params[:password])
  end

end
