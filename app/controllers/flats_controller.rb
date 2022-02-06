# frozen_string_literal: true

class FlatsController < ApplicationController
  before_action :set_flat, only: %i[show edit update destroy]
  before_action :set_buildings
  before_action :set_tenant, only: %i[show]

  # GET /flats or /flats.json
  def index
    @flats = Flat.all
  end

  # GET /flats/1 or /flats/1.json
  def show; end

  # GET /flats/new
  def new
    @flat = Flat.new
  end

  # GET /flats/1/edit
  def edit; end

  # POST /flats or /flats.json
  def create
    @flat = Flat.new(flat_params)

    respond_to do |format|
      if @flat.save
        format.html { redirect_to flat_url(@flat), notice: 'Flat was successfully created.' }
        format.json { render :show, status: :created, location: @flat }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @flat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /flats/1 or /flats/1.json
  def update
    respond_to do |format|
      if @flat.update(flat_params)
        format.html { redirect_to flat_url(@flat), notice: 'Flat was successfully updated.' }
        format.json { render :show, status: :ok, location: @flat }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @flat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /flats/1 or /flats/1.json
  def destroy
    @flat.destroy

    respond_to do |format|
      format.html { redirect_to flats_url, notice: 'Flat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_tenants
    set_flat
    @tenants = Tenant.where(flat_id: @flat.id)
    render json: @tenants
  end

  private

  def set_buildings
    @buildings_array = Building.all.map { |building| [building.name, building.id] }
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_flat
    @flat = Flat.find(params[:id])
  end

  def set_tenant
    @tenant = Tenant.find_by(flat_id: params[:id], active: true)
  end

  # Only allow a list of trusted parameters through.
  def flat_params
    params.require(:flat).permit(:building_id, :floor_no, :surface, :rooms_amount, :door_number, :rent, :taken,
                                 :taken_until, :debt)
  end
end
