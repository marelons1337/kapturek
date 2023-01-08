# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def self.name_and_id_array_for_select
    all.map { |object| [object.get_name, object.id] }
  end

  def transactions
    (expenses + incomes).sort_by(&:id).reverse
  end

  def total_incomes
    incomes.sum(:amount).to_f
  end

  def total_expenses
    expenses.sum(:amount).to_f
  end

  def total_incomes_paid
    incomes.where(paid: true).sum(:amount)
  end

  def total_expenses_paid
    expenses.where(paid: true).sum(:amount)
  end

  def incomes_and_expenses_percentage_structure
    # get the amount from total_incomes and total_expenses and return an array that contains the percentage of each
    sum = total_incomes + total_expenses
    return [0, 0] if sum == 0

    incomes_percentage = (total_incomes == 0 ? 0 : total_incomes / sum) * 100
    expenses_percentage = (total_expenses == 0 ? 0 : total_expenses / sum) * 100
    [incomes_percentage.to_i, expenses_percentage.to_i]
  end

  def incomes_percentage
    "#{incomes_and_expenses_percentage_structure.first}%"
  end

  def expenses_percentage
    "#{incomes_and_expenses_percentage_structure.second}%"
  end
end
