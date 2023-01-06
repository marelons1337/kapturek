# frozen_string_literal: true

class Property::IncomesController < ApplicationController
  before_action :set_property_income, only: [:show, :edit, :update, :destroy]

  # GET /property/incomes or /property/incomes.json
  def index
    @property_incomes = Property::Income.all
    @property_incomes = @property_incomes.order(params[:sort]) if params[:sort].presence.in?(VIEW_SORT_METHODS)

    @pagy, @property_incomes = pagy(@property_incomes)
  end

  # GET /property/incomes/1 or /property/incomes/1.json
  def show
  end

  # GET /property/incomes/new
  def new
    @property_income = Property::Income.new
  end

  # GET /property/incomes/1/edit
  def edit
  end

  # POST /property/incomes or /property/incomes.json
  def create
    @property_income = Property::Income.new(property_income_params)

    respond_to do |format|
      if @property_income.save
        format.html { redirect_to(property_income_url(@property_income), notice: "Income was successfully created.") }
        format.json { render(:show, status: :created, location: @property_income) }
      else
        format.html { render(:new, status: :unprocessable_entity) }
        format.json { render(json: @property_income.errors, status: :unprocessable_entity) }
      end
    end
  end

  # PATCH/PUT /property/incomes/1 or /property/incomes/1.json
  def update
    respond_to do |format|
      if @property_income.update(property_income_params)
        format.html { redirect_to(property_income_url(@property_income), notice: "Income was successfully updated.") }
        format.json { render(:show, status: :ok, location: @property_income) }
      else
        format.html { render(:edit, status: :unprocessable_entity) }
        format.json { render(json: @property_income.errors, status: :unprocessable_entity) }
      end
    end
  end

  # DELETE /property/incomes/1 or /property/incomes/1.json
  def destroy
    @property_income.destroy

    respond_to do |format|
      format.html { redirect_to(property_incomes_url, notice: "Income was successfully destroyed.") }
      format.json { head(:no_content) }
    end
  end

  def fetch_incomables
    incomables = if params[:type].present?
      params[:type].constantize.all.map { |exp| [exp.get_name, exp.id] }
    else
      []
    end
    respond_to do |format|
      format.html { render("property/incomes/frames/incomables_select", locals: { incomables: incomables }) }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_property_income
    @property_income = Property::Income.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def property_income_params
    params.require(:property_income).permit(
      :name,
      :amount,
      :description,
      :due_date,
      :incomable_type,
      :incomable_id,
      :kind,
      :received_date,
    )
  end
end
