# frozen_string_literal: true

class Property::PaymentsController < ApplicationController
  before_action :set_property_payment, only: [:show, :edit, :update, :destroy]

  # GET /property/payments or /property/payments.json
  def index
    @property_payments = Property::Payment.all
  end

  # GET /property/payments/1 or /property/payments/1.json
  def show
  end

  # GET /property/payments/new
  def new
    @property_payment = Property::Payment.new
  end

  # GET /property/payments/1/edit
  def edit
  end

  # POST /property/payments or /property/payments.json
  def create
    @property_payment = Property::Payment.new(property_payment_params)

    respond_to do |format|
      if @property_payment.save
        format.html do
          redirect_to(property_payment_url(@property_payment), notice: "Payment was successfully created.")
        end
        format.json { render(:show, status: :created, location: @property_payment) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @property_payment.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /property/payments/1 or /property/payments/1.json
  def update
    respond_to do |format|
      if @property_payment.update(property_payment_params)
        format.html do
          redirect_to(property_payment_url(@property_payment), notice: "Payment was successfully updated.")
        end
        format.json { render(:show, status: :ok, location: @property_payment) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @property_payment.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /property/payments/1 or /property/payments/1.json
  def destroy
    @property_payment.destroy

    respond_to do |format|
      format.html { redirect_to(property_payments_url, notice: "Payment was successfully destroyed.") }
      format.json { head(:no_content) }
    end
  end

  def fetch_payment_kind_model_values
    kind = Property::Payment.kinds.key(params[:type].to_i)
    values = if params[:type].present?
      Property::Payment.kind_model_values(kind)
    else
      []
    end
    respond_to do |format|
      format.html { render("property/payments/frames/payment_kinds_select", locals: { kind: kind, values: values }) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_property_payment
    @property_payment = Property::Payment.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def property_payment_params
    params.require(:property_payment).permit(
      :date,
      :kind,
      :amount,
      :currency,
      :description,
      :income_id,
      :expense_id,
      :client_id,
    )
  end
end
