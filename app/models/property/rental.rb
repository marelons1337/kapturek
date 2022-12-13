class Property::Rental < ApplicationRecord
  # belongs_to :account, optional: true
  validates :bought_at, :buy_price, :surface, :country, :city, :street, :street_no, :rent, presence: true
  validate :taken_from_before_taken_until, :bought_at_before_taken_from

  has_many :client_properties, as: :property
  has_many :clients, through: :client_properties

  enum status: {
    empty: 0,
    pending: 1,
    rented: 2,
  }

  def full_address(local: true)
    "#{street} #{street_no}#{door_no.present? ? '/' + door_no : nil }, #{city}, #{local ? country : nil}"
  end

  def get_name
    self.name.presence || full_address
  end

  def get_price
    buy_price
  end

  def get_status
    self.status
  end

  def get_surface
    "#{self.surface} m2"
  end

  private
  def taken_from_before_taken_until
    return unless taken_from.present? && taken_until.present?

    errors.add(:taken_from, 'must be before taken until') if taken_from > taken_until
  end

  def bought_at_before_taken_from
    return unless bought_at.present? && taken_from.present?

    errors.add(:bought_at, 'must be before taken from') if bought_at > taken_from
  end
end

# == Schema Information
#
# Table name: property_rentals
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
#  rent         :float
#  rooms_amount :integer
#  sale_price   :float
#  status       :integer          default("empty")
#  street       :string
#  street_no    :string
#  surface      :float
#  taken_from   :date
#  taken_until  :date
#  zip          :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  account_id   :integer
#
# Indexes
#
#  index_property_rentals_on_account_id  (account_id)
#
