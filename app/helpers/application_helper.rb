module ApplicationHelper
  def logged_in?
     !session[:logado].nil?
   end
end
