class Property::ExpensesController < ApplicationController
  before_action :set_property_expense, only: %i[ show edit update destroy ]

  # GET /property/expenses or /property/expenses.json
  def index
    @property_expenses = Property::Expense.all
  end

  # GET /property/expenses/1 or /property/expenses/1.json
  def show
  end

  # GET /property/expenses/new
  def new
    @property_expense = Property::Expense.new
  end

  # GET /property/expenses/1/edit
  def edit
  end

  # POST /property/expenses or /property/expenses.json
  def create
    @property_expense = Property::Expense.new(property_expense_params)

    respond_to do |format|
      if @property_expense.save
        format.html { redirect_to property_expense_url(@property_expense), notice: "Expense was successfully created." }
        format.json { render :show, status: :created, location: @property_expense }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @property_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /property/expenses/1 or /property/expenses/1.json
  def update
    respond_to do |format|
      if @property_expense.update(property_expense_params)
        format.html { redirect_to property_expense_url(@property_expense), notice: "Expense was successfully updated." }
        format.json { render :show, status: :ok, location: @property_expense }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @property_expense.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /property/expenses/1 or /property/expenses/1.json
  def destroy
    @property_expense.destroy

    respond_to do |format|
      format.html { redirect_to property_expenses_url, notice: "Expense was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_property_expense
      @property_expense = Property::Expense.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def property_expense_params
      params.fetch(:property_expense, {})
    end
end
