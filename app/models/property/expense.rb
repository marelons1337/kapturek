# frozen_string_literal: true

class Property::Expense < ApplicationRecord
  EXPENSABLE_TYPES = ["Property::Rental", "Property::Sale"]

  belongs_to :expensable, polymorphic: true
  belongs_to :client, class_name: "Customer::Client", optional: true
  belongs_to :property, class_name: "Property::Property"

  validates :name, :amount, :due_date, presence: true
  validates :amount, numericality: { greater_than: 0 }
  validate :received_date_before_due_date
  validates :expensable_type, inclusion: { in: EXPENSABLE_TYPES }

  before_validation :set_property

  class << self
    def expensable_types
      EXPENSABLE_TYPES.map { |type| [type.constantize.model_name.human, type] }
    end
  end

  def total_paid
    amount
  end

  def get_name(full: true)
    name
  end

  def overdue?
    due_date < Time.zone.today
  end

  def expensable_values_array
    expensable_type.constantize.send("name_and_id_array_for_select")
  end

  def set_property
    self.property = expensable.property
  end

  def received_date_before_due_date
    return unless received_date.present? && due_date.present?

    errors.add(:received_date, "must be before due date") if received_date > due_date
  end
end

# == Schema Information
#
# Table name: property_expenses
#
#  id              :integer          not null, primary key
#  amount          :string
#  description     :string
#  due_date        :date
#  expensable_type :string
#  kind            :string
#  name            :string
#  paid            :boolean          default(FALSE)
#  received_date   :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  client_id       :integer
#  expensable_id   :integer
#  property_id     :integer
#
# Indexes
#
#  index_property_expenses_on_client_id    (client_id)
#  index_property_expenses_on_property_id  (property_id)
#
