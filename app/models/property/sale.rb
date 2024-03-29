# frozen_string_literal: true

class Property::Sale < ApplicationRecord
  # belongs_to :account, optional: true
  validates :bought_at, :sold_at, :buy_price, :sale_price, presence: true
  validate :bought_at_before_sold_at

  belongs_to :client, class_name: "Customer::Client"
  belongs_to :property, class_name: "Property::Property"

  has_many :expenses, class_name: "Property::Expense", as: :expensable, dependent: :destroy
  has_many :incomes, class_name: "Property::Income", as: :incomable, dependent: :destroy

  before_save :update_property_status

  enum status: {
    pending: 0,
    sold: 1,
  }

  delegate :current_price, to: :property
  delegate :surface, to: :property

  def full_address(local: true)
    property.full_address(local: local)
  end

  def get_name(full: true)
    property.name.presence || property.full_address
  end

  private

  def bought_at_before_sold_at
    return unless bought_at.present? && sold_at.present?

    errors.add(:bought_at, "must be before sold at") if bought_at > sold_at
  end

  def update_property_status
    new_status = if status == "sold"
      "sold"
    else
      "empty"
    end
    property.update(status: new_status)
  end
end

# == Schema Information
#
# Table name: property_sales
#
#  id          :integer          not null, primary key
#  bought_at   :date
#  buy_price   :float
#  description :text
#  name        :string
#  sale_price  :float
#  sold_at     :date
#  status      :integer          default("pending")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  account_id  :integer
#  client_id   :integer
#  property_id :integer
#
# Indexes
#
#  index_property_sales_on_account_id   (account_id)
#  index_property_sales_on_client_id    (client_id)
#  index_property_sales_on_property_id  (property_id)
#
