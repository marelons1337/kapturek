class Property::Sale < ApplicationRecord
  # belongs_to :account, optional: true
  validates :bought_at, :sold_at, :buy_price, :sale_price, presence: true
  validate :bought_at_before_sold_at

  belongs_to :client, class_name: 'Customer::Client'
  belongs_to :property, class_name: 'Property::Property'

  enum status: {
    pending: 0,
    sold: 1,
  }

  def full_address(local: true)
    self.property.full_address(local: local)
  end

  def get_name
    self.name.presence || self.property.name.presence || full_address
  end

  def get_price
    self.property.get_price
  end

  def get_status
    self.status
  end

  def get_surface
    self.property.get_surface
  end

  private
  def bought_at_before_sold_at
    return unless bought_at.present? && sold_at.present?

    errors.add(:bought_at, 'must be before sold at') if bought_at > sold_at
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
