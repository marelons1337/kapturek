class Customer::ClientsController < ApplicationController
  before_action :set_customer_client, only: %i[ show edit update destroy ]

  # GET /customer/clients or /customer/clients.json
  def index
    @customer_clients = Customer::Client.all
  end

  # GET /customer/clients/1 or /customer/clients/1.json
  def show
  end

  # GET /customer/clients/new
  def new
    @customer_client = Customer::Client.new
  end

  # GET /customer/clients/1/edit
  def edit
  end

  # POST /customer/clients or /customer/clients.json
  def create
    @customer_client = Customer::Client.new(customer_client_params)

    respond_to do |format|
      if @customer_client.save
        format.html { redirect_to customer_client_url(@customer_client), notice: "Client was successfully created." }
        format.json { render :show, status: :created, location: @customer_client }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @customer_client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customer/clients/1 or /customer/clients/1.json
  def update
    respond_to do |format|
      if @customer_client.update(customer_client_params)
        format.html { redirect_to customer_client_url(@customer_client), notice: "Client was successfully updated." }
        format.json { render :show, status: :ok, location: @customer_client }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @customer_client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customer/clients/1 or /customer/clients/1.json
  def destroy
    @customer_client.destroy

    respond_to do |format|
      format.html { redirect_to customer_clients_url, notice: "Client was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer_client
      @customer_client = Customer::Client.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def customer_client_params
      params.require(:customer_client).permit(:name, :surname, :phone, :email, :rent_from, :rent_to, :paid, :debt, :account_id, :rental_id, :sale_id, :company, :status, :note)
    end
end
