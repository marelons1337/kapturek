# frozen_string_literal: true

class Property::TransactionsController < ApplicationController
  def index
    @transactions = Property::Expense.includes(:property).all.or(Property::Income.includes(:property).all)
    @transactions = @transactions.where(paid: params[:paid]) if params[:paid].present?
    @transactions = @transactions.order(params[:sort]) if params[:sort].presence.in?(VIEW_SORT_METHODS)

    @pagy, @transactions = pagy(@transactions)
  end
end
