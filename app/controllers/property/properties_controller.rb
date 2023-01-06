# frozen_string_literal: true

class Property::PropertiesController < ApplicationController
  before_action :set_property_property, only: [:show, :edit, :update, :destroy]

  # GET /property/properties or /property/properties.json
  def index
    @property_properties = Property::Property.all
    @property_properties = @property_properties.where(status: params[:status]) if params[:status].present?
    @property_properties = @property_properties.order(params[:sort]) if params[:sort].presence.in?(VIEW_SORT_METHODS)

    @pagy, @property_properties = pagy(@property_properties)
  end

  # GET /property/properties/1 or /property/properties/1.json
  def show
  end

  # GET /property/properties/new
  def new
    @property_property = Property::Property.new
  end

  # GET /property/properties/1/edit
  def edit
  end

  # POST /property/properties or /property/properties.json
  def create
    @property_property = Property::Property.new(property_property_params)

    respond_to do |format|
      if @property_property.save
        format.html do
          redirect_to(property_property_url(@property_property), notice: "Property was successfully created.")
        end
        format.json { render(:show, status: :created, location: @property_property) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @property_property.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /property/properties/1 or /property/properties/1.json
  def update
    respond_to do |format|
      if @property_property.update(property_property_params)
        format.html do
          redirect_to(property_property_url(@property_property), notice: "Property was successfully updated.")
        end
        format.json { render(:show, status: :ok, location: @property_property) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @property_property.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /property/properties/1 or /property/properties/1.json
  def destroy
    @property_property.destroy

    respond_to do |format|
      format.html { redirect_to(property_properties_url, notice: "Property was successfully destroyed.") }
      format.json { head(:no_content) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_property_property
    @property_property = Property::Property.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def property_property_params
    params.require(:property_property).permit(
      :name,
      :status,
      :description,
      :city,
      :zip,
      :country,
      :street,
      :street_no,
      :door_no,
      :floor_no,
      :rooms_amount,
      :bought_at,
      :sold_at,
      :buy_price,
      :sale_price,
      :surface,
    )
  end
end
