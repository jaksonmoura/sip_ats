class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.

  # Form select for subdptos
  def get_subdptos
    @dpto = Dpto.find(params[:id])
    @subdptos = @dpto.subdptos.to_a
    render :partial => "layouts/subdptos"
  end
  
  protect_from_forgery with: :exception
end
