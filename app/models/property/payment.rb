# frozen_string_literal: true

class Property::Payment < ApplicationRecord
  belongs_to :income, class_name: "Property::Income", optional: true
  belongs_to :expense, class_name: "Property::Expense", optional: true
  belongs_to :client, class_name: "Customer::Client", optional: true
  belongs_to :property, class_name: "Property::Property"

  validates :date, :kind, :amount, presence: true
  validates :amount, numericality: { greater_than: 0 }

  enum kind: { income: 0, expense: 1 }

  validate :income_or_expense_presence

  class << self
    def kind_model_values(kind)
      if kind == 'income'
        Property::Income.all.map { |i| [i.name, i.id] }
      elsif kind == 'expense'
        Property::Expense.all.map { |e| [e.name, e.id] }
      end
    end
  end

  def get_name(full: true)
    name
  end

  def income_or_expense_presence
    return if income.present? || expense.present?

    errors.add(:base, "Income or expense must be present")
  end
end

# == Schema Information
#
# Table name: property_payments
#
#  id          :integer          not null, primary key
#  amount      :string
#  currency    :string
#  date        :date
#  description :string
#  kind        :integer
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  client_id   :integer
#  expense_id  :integer
#  income_id   :integer
#  property_id :integer
#
# Indexes
#
#  index_property_payments_on_client_id    (client_id)
#  index_property_payments_on_expense_id   (expense_id)
#  index_property_payments_on_income_id    (income_id)
#  index_property_payments_on_property_id  (property_id)
#
