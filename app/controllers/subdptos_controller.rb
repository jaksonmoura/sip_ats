class SubdptosController < ApplicationController
  before_action :set_subdpto, only: [:show, :edit, :update, :destroy]

  # GET /subdptos
  # GET /subdptos.json
  def index
    @dpto = Dpto.find_by_id(params[:dpto_id])
    @subdptos = Subdpto.to_a
    @subdpto = @dpto.subdptos.new
  end

  # GET /subdptos/1
  # GET /subdptos/1.json
  def show
  end

  # GET /subdptos/new
  def new
    @dpto = Dpto.find_by_id(params[:dpto_id])
    @subdpto = @dpto.subdptos.new
    @subdptos = @dpto.subdptos.to_a
  end

  # GET /subdptos/1/edit
  def edit
    @dpto = Dpto.find_by_id(params[:dpto_id])
    @subdpto = Subdpto.find_by_id(params[:id])
  end

  # POST /subdptos
  # POST /subdptos.json
  def create
    @dpto = Dpto.find_by_id(params[:dpto_id])
    @subdpto = @dpto.subdptos.new(subdpto_params)

    respond_to do |format|
      if @subdpto.save
        format.js
        format.html { redirect_to @subdpto, notice: 'Subdpto was successfully created.' }
        format.json { render action: 'show', status: :created, location: @subdpto }
      else
        format.js
        format.html { render action: 'new' }
        format.json { render json: @subdpto.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subdptos/1
  # PATCH/PUT /subdptos/1.json
  def update
    respond_to do |format|
      if @subdpto.update(subdpto_params)
        format.js
        format.html { redirect_to @subdpto, notice: 'Subdpto was successfully updated.' }
        format.json { head :no_content }
      else
        format.js
        format.html { render action: 'edit' }
        format.json { render json: @subdpto.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subdptos/1
  # DELETE /subdptos/1.json
  def destroy
    @subdpto.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to subdptos_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subdpto
      @subdpto = Subdpto.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subdpto_params
      params.require(:subdpto).permit(:name, :dpto_id, :abbr)
    end
end
