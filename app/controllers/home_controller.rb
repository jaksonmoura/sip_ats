class HomeController < ApplicationController
	layout "index"
  def index
  	@computers = Computer.all.count
  	@equipments = Equipment.all.count
  end
end
