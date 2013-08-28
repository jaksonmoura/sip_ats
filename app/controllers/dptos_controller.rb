class DptosController < ApplicationController
  before_action :set_dpto, only: [:show, :edit, :update, :destroy]

  # GET /dptos
  # GET /dptos.json
  def index
    @dptos = Dpto.all
    @dpto = Dpto.new
  end

  # POST /dptos
  # POST /dptos.json
  def create
    @dpto = Dpto.new(dpto_params)
    @dpto.abbr = "Jakson"

    # Formatting values
    @dpto.name.capitalize!
    @dpto.abbr.upcase!

    respond_to do |format|
      if @dpto.save
        format.js
        format.html { redirect_to @dpto, notice: 'Dpto was successfully created.' }
        format.json { render action: 'show', status: :created, location: @dpto }
      else
        format.js { render 'error' }
        format.html { render action: 'new' }
        format.json { render json: @dpto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dptos/1
  # PATCH/PUT /dptos/1.json
  def update
    @dpto = Dpto.find_by_id(params[:id])
    respond_to do |format|
      if @dpto.update(dpto_params)
        # Formatting values
        @dpto.name.capitalize!
        @dpto.abbr.upcase
        format.js { render 'update.js.erb' }
        format.html { redirect_to @dpto, notice: 'Dpto was successfully updated.' }
        format.json { head :no_content }
      else
        format.js { render 'error' }
        format.html { render action: 'edit' }
        format.json { render json: @dpto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dptos/1
  # DELETE /dptos/1.json
  def destroy
    @dpto.destroy
    respond_to do |format|
      format.html { redirect_to dptos_url }
      format.json { head :no_content }
      format.js
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dpto
      @dpto = Dpto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dpto_params
      params.require(:dpto).permit(:name, :abbr)
    end
end
