# frozen_string_literal: true

class Property::Property < ApplicationRecord
  has_one :sale, dependent: :nullify
  has_many :rentals, dependent: :nullify
  has_many :expenses, class_name: "Property::Expense", dependent: :destroy
  has_many :incomes, class_name: "Property::Income", dependent: :destroy

  validates :street, :street_no, :zip, :city, :country, :surface, presence: true
  validates :rooms_amount, numericality: { only_integer: true, greater_than: 0 }, allow_blank: true
  validates :buy_price, :sale_price, numericality: { greater_than: 0 }, allow_blank: true
  validates :door_no, :floor_no, :zip, length: { maximum: 10 }
  validates :surface, numericality: { greater_than: 0 }
  validate :bought_at_before_sold_at, if: -> { bought_at.present? && sold_at.present? }

  enum status: {
    empty: 0,
    rented: 1,
    sold: 2,
  }

  def full_address(local: true)
    "#{street} #{street_no}#{door_no.present? ? "/" + door_no : nil}, #{city}#{local ? ", " + country : nil}".strip
  end

  def get_name(full: true)
    name.presence || full_address
  end

  def current_price
    if status == "sold"
      sale_price
    else
      buy_price
    end
  end

  def clients
    ids = rentals&.map(&:client_id)&.+ [sale&.client_id]
    Customer::Client.where(id: ids)
  end

  def expenses
    Property::Expense.where(expensable_id: all_child_ids)
  end

  def incomes
    Property::Income.where(incomable_id: all_child_ids)
  end

  def all_child_ids
    rental_ids + [self&.sale&.id]
  end

  private

  def bought_at_before_sold_at
    return unless bought_at.present? && sold_at.present?

    errors.add(:bought_at, "must be before taken from") if bought_at > sold_at
  end
end

# == Schema Information
#
# Table name: property_properties
#
#  id           :integer          not null, primary key
#  bought_at    :date
#  buy_price    :float
#  city         :string
#  country      :string
#  description  :text
#  door_no      :string
#  floor_no     :string
#  name         :string
#  rooms_amount :integer
#  sale_price   :float
#  sold_at      :date
#  status       :integer          default("empty")
#  street       :string
#  street_no    :string
#  surface      :float
#  zip          :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
