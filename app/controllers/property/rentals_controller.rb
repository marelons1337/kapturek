# frozen_string_literal: true

class Property::RentalsController < ApplicationController
  before_action :set_property_rental, only: [:show, :edit, :update, :destroy]

  # GET /property/rentals or /property/rentals.json
  def index
    @property_rentals = Property::Rental.all
    @property_rentals = @property_rentals.where(status: params[:status]) if params[:status].present?
    @property_rentals = @property_rentals.order(params[:sort]) if params[:sort].presence.in?(VIEW_SORT_METHODS)
  end

  # GET /property/rentals/1 or /property/rentals/1.json
  def show
  end

  # GET /property/rentals/new
  def new
    @property_rental = Property::Rental.new
  end

  # GET /property/rentals/1/edit
  def edit
  end

  # POST /property/rentals or /property/rentals.json
  def create
    @property_rental = Property::Rental.new(property_rental_params)

    respond_to do |format|
      if @property_rental.save
        format.html { redirect_to(property_rental_url(@property_rental), notice: "Rental was successfully created.") }
        format.json { render(:show, status: :created, location: @property_rental) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @property_rental.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /property/rentals/1 or /property/rentals/1.json
  def update
    respond_to do |format|
      if @property_rental.update(property_rental_params)
        format.html { redirect_to(property_rental_url(@property_rental), notice: "Rental was successfully updated.") }
        format.json { render(:show, status: :ok, location: @property_rental) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @property_rental.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /property/rentals/1 or /property/rentals/1.json
  def destroy
    @property_rental.destroy

    respond_to do |format|
      format.html { redirect_to(property_rentals_url, notice: "Rental was successfully destroyed.") }
      format.json { head(:no_content) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_property_rental
    @property_rental = Property::Rental.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def property_rental_params
    params.require(:property_rental).permit(:name, :description, :status, :taken_from, :taken_until, :rent,
      :property_id, :client_id)
  end
end
