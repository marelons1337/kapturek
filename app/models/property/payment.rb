# frozen_string_literal: true

class Property::Payment < ApplicationRecord
  PAYABLE_TYPES = ["Property::Rental", "Property::Sale"]

  belongs_to :income, class_name: "Property::Income", optional: true
  belongs_to :expense, class_name: "Property::Expense", optional: true
  belongs_to :client, class_name: "Customer::Client", optional: true
  belongs_to :payable, polymorphic: true, optional: true

  validates :date, :kind, :amount, presence: true
  validates :amount, numericality: { greater_than: 0 }
  validate :income_or_expense_presence

  enum kind: { income: 0, expense: 1 }

  before_save :find_or_create_expense_or_income

  class << self
    def kind_model_values(kind)
      if kind == "income"
        Property::Income.all.map { |i| [i.name, i.id] }
      elsif kind == "expense"
        Property::Expense.all.map { |e| [e.name, e.id] }
      end
    end

    def payable_types
      PAYABLE_TYPES.map { |type| [type.constantize.model_name.human, type] }
    end
  end

  def get_name(full: true)
    return nil if name.blank?

    if full
      name
    else
      # shorten the name to 20 characters and finish with ...
      name[0..20] + (name.length > 20 ? "..." : "")
    end
  end

  def payable_values_array
    payable_type.constantize.send("name_and_id_array_for_select")
  end

  def income_or_expense_presence
    return if income.present? || expense.present?

    errors.add(:base, "Income or expense must be present")
  end

  def find_or_create_expense_or_income
    if kind == "income"
      self.payable = income.incomable
    elsif kind == "expense"
      self.payable = expense.expensable
    end
  end
end

# == Schema Information
#
# Table name: property_payments
#
#  id           :integer          not null, primary key
#  amount       :string
#  currency     :string
#  date         :date
#  description  :string
#  kind         :integer
#  name         :string
#  payable_type :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  client_id    :integer
#  expense_id   :integer
#  income_id    :integer
#  payable_id   :integer
#
# Indexes
#
#  index_property_payments_on_client_id   (client_id)
#  index_property_payments_on_expense_id  (expense_id)
#  index_property_payments_on_income_id   (income_id)
#
