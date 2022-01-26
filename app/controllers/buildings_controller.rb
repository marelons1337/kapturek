class BuildingsController < ApplicationController
  before_action :set_building, only: %i[ show edit update destroy ]
  before_action :set_flats, only: %i[ show ]
  before_action :set_payments, only: %i[ show index ]


  # GET /buildings or /buildings.json
  def index
    @buildings = Building.all
  end

  # GET /buildings/1 or /buildings/1.json
  def show
  end

  # GET /buildings/new
  def new
    @building = Building.new
  end

  # GET /buildings/1/edit
  def edit
  end

  # POST /buildings or /buildings.json
  def create
    @building = Building.new(building_params)

    respond_to do |format|
      if @building.save
        format.html { redirect_to building_url(@building), notice: "Building was successfully created." }
        format.json { render :show, status: :created, location: @building }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buildings/1 or /buildings/1.json
  def update
    respond_to do |format|
      if @building.update(building_params)
        format.html { redirect_to building_url(@building), notice: "Building was successfully updated." }
        format.json { render :show, status: :ok, location: @building }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buildings/1 or /buildings/1.json
  def destroy
    @building.destroy

    respond_to do |format|
      format.html { redirect_to buildings_url, notice: "Building was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def find_belonging_flats
    set_building
    set_flats
    return render json: @flats, only: [:id, :door_number]
  end

  private
    def set_flats
      @flats = Flat.where(building_id: @building.id)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_building
      @building = Building.find(params[:id])
    end

    def set_payments
      @payments = Payment.where(building_id: params[:id])
    end

    # Only allow a list of trusted parameters through.
    def building_params
      params.require(:building).permit(:name, :address, :flats_amount, :floors)
    end
end
