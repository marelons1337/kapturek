class Property::ClientProperty < ApplicationRecord
  belongs_to :client, class_name: 'Customer::Client'
  belongs_to :property, polymorphic: true
  belongs_to :account, optional: true
end

# == Schema Information
#
# Table name: property_client_properties
#
#  id            :integer          not null, primary key
#  property_type :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  account_id    :integer
#  client_id     :integer
#  property_id   :integer
#
# Indexes
#
#  index_property_client_properties_on_account_id  (account_id)
#  index_property_client_properties_on_client_id   (client_id)
#
