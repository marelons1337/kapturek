class Property::Rental < ApplicationRecord
  # belongs_to :account, optional: true
  validates :taken_from, :taken_until, :rent, presence: true
  validate :taken_from_before_taken_until

  belongs_to :client, class_name: 'Customer::Client'
  belongs_to :property, class_name: 'Property::Property'

  enum status: {
    empty: 0,
    pending: 1,
    rented: 2,
  }

  def full_address(local: true)
    self.property.full_address(local: local)
  end

  def get_name
    self.name.presence || self.property.name.presence || full_address
  end

  def get_price
    rent
  end

  def get_status
    self.status
  end

  def get_surface
    self.property.get_surface
  end

  private
  def taken_from_before_taken_until
    return unless taken_from.present? && taken_until.present?

    errors.add(:taken_from, 'must be before taken until') if taken_from > taken_until
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
#  status      :integer          default("pending")
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
