class Customer::Client < ApplicationRecord
  belongs_to :account, optional: true
  belongs_to :rental, optional: true
  belongs_to :sale, optional: true

  validates :email, :rent_from, presence: true
end

# == Schema Information
#
# Table name: customer_clients
#
#  id         :integer          not null, primary key
#  company    :boolean          default(FALSE)
#  debt       :float
#  email      :string
#  name       :string
#  note       :text
#  paid       :float
#  phone      :string
#  rent_from  :date
#  rent_to    :date
#  surname    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :integer
#  rental_id  :integer
#  sale_id    :integer
#
# Indexes
#
#  index_customer_clients_on_account_id  (account_id)
#  index_customer_clients_on_rental_id   (rental_id)
#  index_customer_clients_on_sale_id     (sale_id)
#
