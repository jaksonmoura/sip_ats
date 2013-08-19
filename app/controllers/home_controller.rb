class HomeController < ApplicationController
  before_filter :authenticate_user
	layout "index"
  def index
  	@dptos = Dpto.all.count
  	@computers = Computer.all.count
  	@equipments = Equipment.all.count
  end
end
