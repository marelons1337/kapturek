# frozen_string_literal: true

class Property::Property < ApplicationRecord
  has_one :sale, dependent: :nullify
  has_many :rentals, dependent: :nullify

  validates :name, :street, :street_no, :zip, :city, :country, :surface, presence: true
  validates :rooms_amount, numericality: { only_integer: true, greater_than: 0 }, allow_blank: true
  validates :buy_price, :sale_price, numericality: { greater_than: 0 }, allow_blank: true
  validates :door_no, :floor_no, :zip, length: { maximum: 10 }
  validates :surface, numericality: { greater_than: 0 }
  validate :bought_at_before_sold_at, if: -> { bought_at.present? && sold_at.present? }

  # before_save :set_status

  enum status: {
    empty: 0,
    rented: 1,
    sold: 2,
  }

  # def set_status
  #   if rentals.present? && rentals.any? { |r| r.status === 'rented' }
  #     self.status = 'rented'
  #   elsif sale.present? && sale.status === 'sold'
  #     self.status = 'sold'
  #   else
  #     self.status = 'empty'
  #   end
  # end

  def full_address(local: true)
    "#{street} #{street_no}#{door_no.present? ? "/" + door_no : nil}, #{city}, #{local ? country : nil}"
  end

  def name
    name.presence || full_address
  end

  def price
    if status == "sold"
      sale_price
    else
      buy_price
    end
  end

  def surface
    "#{surface} m2"
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
