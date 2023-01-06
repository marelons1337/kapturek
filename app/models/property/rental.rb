# frozen_string_literal: true

class Property::Rental < ApplicationRecord
  # belongs_to :account, optional: true
  validates :taken_from, :taken_until, :rent, presence: true
  validate :taken_from_before_taken_until

  belongs_to :client, class_name: "Customer::Client"
  belongs_to :property, class_name: "Property::Property"

  has_many :expenses, class_name: "Property::Expense", as: :expensable, dependent: :destroy
  has_many :incomes, class_name: "Property::Income", as: :incomable, dependent: :destroy

  before_save :update_property_status

  enum status: {
    empty: 0,
    pending: 1,
    rented: 2,
  }

  delegate :surface, to: :property

  def full_address(local: true)
    property.full_address(local: local)
  end

  def get_name(full: true)
    name.presence || property.name.presence || full_address
  end

  def current_price
    rent
  end

  private

  def taken_from_before_taken_until
    return unless taken_from.present? && taken_until.present?

    errors.add(:taken_from, "must be before taken until") if taken_from > taken_until
  end

  def update_property_status
    property.status = if status == "rented"
      "rented"
    else
      "empty"
    end
    property.save!
  end
end

# == Schema Information
#
# Table name: property_rentals
#
#  id          :integer          not null, primary key
#  description :text
#  name        :string
#  rent        :float
#  status      :integer          default("empty")
#  taken_from  :date
#  taken_until :date
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  account_id  :integer
#  client_id   :integer
#  property_id :integer
#
# Indexes
#
#  index_property_rentals_on_account_id   (account_id)
#  index_property_rentals_on_client_id    (client_id)
#  index_property_rentals_on_property_id  (property_id)
#
