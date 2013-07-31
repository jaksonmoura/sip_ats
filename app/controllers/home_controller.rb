class HomeController < ApplicationController
	layout "index"
  def index
  	@dptos = Dpto.all.count
  	@computers = Computer.all.count
  	@equipments = Equipment.all.count
  end
end
