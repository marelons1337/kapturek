class Property::SalesController < ApplicationController
  before_action :set_property_sale, only: %i[ show edit update destroy ]

  # GET /property/sales or /property/sales.json
  def index
    @property_sales = Property::Sale.all
    @property_sales = @property_sales.where(status: params[:status]) if params[:status].present?
  end

  # GET /property/sales/1 or /property/sales/1.json
  def show
  end

  # GET /property/sales/new
  def new
    @property_sale = Property::Sale.new
  end

  # GET /property/sales/1/edit
  def edit
  end

  # POST /property/sales or /property/sales.json
  def create
    @property_sale = Property::Sale.new(property_sale_params)

    respond_to do |format|
      if @property_sale.save
        format.html { redirect_to property_sale_url(@property_sale), notice: "Sale was successfully created." }
        format.json { render :show, status: :created, location: @property_sale }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @property_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /property/sales/1 or /property/sales/1.json
  def update
    respond_to do |format|
      if @property_sale.update(property_sale_params)
        format.html { redirect_to property_sale_url(@property_sale), notice: "Sale was successfully updated." }
        format.json { render :show, status: :ok, location: @property_sale }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @property_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /property/sales/1 or /property/sales/1.json
  def destroy
    @property_sale.destroy

    respond_to do |format|
      format.html { redirect_to property_sales_url, notice: "Sale was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property_sale
      @property_sale = Property::Sale.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def property_sale_params
      params.require(:property_sale).permit(:name, :surface, :rooms_amount, :door_no, :country, :city, :street, :street_no,
        :floor_no, :bought_at, :sold_at, :buy_price, :sale_price, :status, :zip)
    end
end
