class ComputersController < ApplicationController
  before_action :set_computer, only: [:show, :edit, :update, :destroy]
  
  # GET /computers
  # GET /computers.json
  def index
    @computers = Computer.all
    @computer = Computer.new
    @dptos = Dpto.all # Load Dptos
    @subdptos = Subdpto.all # Load Dptos
  end

  # GET /computers/1/edit
  def edit
    @dptos = Dpto.all
    @subdptos = Subdpto.all
  end

  # POST /computers
  # POST /computers.json
  def create
    @computer = Computer.new(computer_params)
    @dptos = Dpto.all
    @subdptos = Subdpto.all

    # Formatting values
    @computer.sort.capitalize!
    @computer.name.capitalize!

    respond_to do |format|
      if @computer.save
        format.js
        format.html { redirect_to @computer, notice: 'Computer was successfully created.' }
        format.json { render action: 'show', status: :created, location: @computer }
      else
        format.js { render 'error' }
        format.html { render action: 'new' }
        format.json { render json: @computer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /computers/1
  # PATCH/PUT /computers/1.json
  def update
    @dptos = Dpto.all
    @subdptos = Subdpto.all
    respond_to do |format|
      if @computer.update(computer_params)
        # Formatting values
        @computer.sort.capitalize!
        @computer.name.capitalize!
        format.js
        format.html { redirect_to @computer, notice: 'Computer was successfully updated.' }
        format.json { head :no_content }
      else
        format.js { render 'error' }
        format.html { render action: 'edit' }
        format.json { render json: @computer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /computers/1
  # DELETE /computers/1.json
  def destroy
    @computer.destroy
    respond_to do |format|
      format.js
      format.html { redirect_to computers_url }
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
    def set_computer
      @computer = Computer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def computer_params
      params.require(:computer).permit(:dpto_id, :subdpto_id, :sort, :name, :ip)
    end

end
