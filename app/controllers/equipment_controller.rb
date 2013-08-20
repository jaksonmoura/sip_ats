class EquipmentController < ApplicationController
  before_action :set_equipment, only: [:show, :edit, :update, :destroy]
  
  # GET /equipment
  # GET /equipment.json
  def index
    @equipments = Equipment.all
    @equipment = Equipment.new
    @dptos = Dpto.all
    @subdptos = Subdpto.all
  end

  # GET /equipment/1/edit
  def edit
    @dptos = Dpto.all
    @subdptos = Subdpto.all
  end

  # POST /equipment
  # POST /equipment.json
  def create
    @equipment = Equipment.new(equipment_params)
    @dptos = Dpto.all
    @subdptos = Subdpto.all

    # Formatting values
    @equipment.sort.capitalize!

    respond_to do |format|
      if @equipment.save
        format.js
        format.html { redirect_to @equipment, notice: 'Equipment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @equipment }
      else
        format.js { render 'error' }
        format.html { render action: 'new' }
        format.json { render json: @equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /equipment/1
  # PATCH/PUT /equipment/1.json
  def update
    @dptos = Dpto.all
    @subdptos = Subdpto.all
    respond_to do |format|
      if @equipment.update(equipment_params)
        # Formatting values
        @equipment.sort.capitalize!
        format.js { render 'update.js.erb'}
        format.html { redirect_to @equipment, notice: 'Equipment was successfully updated.' }
        format.json { head :no_content }
      else
        format.js { render 'error' }
        format.html { render action: 'edit' }
        format.json { render json: @equipment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /equipment/1
  # DELETE /equipment/1.json
  def destroy
    @equipment.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to equipment_index_url }
      format.json { head :no_content }
    end
  end

  # Form select for subdptos
  def get_subdptos
    @dpto = Dpto.find(params[:id])
    @subdptos = @dpto.subdptos.to_a
    render :partial => "subdptos"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_equipment
      @equipment = Equipment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def equipment_params
      params.require(:equipment).permit(:dpto_id, :subdpto_id, :sort, :ip)
    end
end
