class Customer::ClientProperty < ApplicationRecord
  belongs_to :client, class_name: "Customer::Client", foreign_key: "client_id"
  belongs_to :property_sale, class_name: "Property::Sale", foreign_key: "property_sale_id"
  belongs_to :property_rental, class_name: "Property::Rental", foreign_key: "property_rental_id"
end

# == Schema Information
#
# Table name: customer_client_properties
#
#  id                 :integer          not null, primary key
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  account_id         :integer
#  client_id          :integer
#  property_rental_id :integer
#  property_sale_id   :integer
#
# Indexes
#
#  index_customer_client_properties_on_account_id          (account_id)
#  index_customer_client_properties_on_client_id           (client_id)
#  index_customer_client_properties_on_property_rental_id  (property_rental_id)
#  index_customer_client_properties_on_property_sale_id    (property_sale_id)
#
