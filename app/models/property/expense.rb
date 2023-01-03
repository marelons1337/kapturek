class Property::Expense < ApplicationRecord
  belongs_to :expensable, polymorphic: true

  validates :name, :amount, :due_date, presence: true
  validate :received_date_before_due_date

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
#  due_date        :date
#  expensable_type :string
#  kind            :string
#  name            :string
#  received_date   :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  expensable_id   :integer
#
