class Customer::Client < ApplicationRecord
  belongs_to :account, optional: true
  has_many :client_properties, class_name: 'Property::ClientProperty', dependent: :destroy
  has_many :sales, through: :client_properties, source: :property, source_type: 'Property::Sale', class_name: 'Property::Sale', as: :sale
  has_many :rentals, through: :client_properties, source: :property, source_type: 'Property::Rental', class_name: 'Property::Rental', as: :rental

  validates :email, :rent_from, :name, presence: true
  validate :rent_from_before_rent_to

  def get_name
    if company
      name
    else
      "#{name} #{surname}"
    end
  end

  def get_email
    "#{get_name} <#{email}>"
  end

  private

  def rent_from_before_rent_to
    if rent_from.present? && rent_to.present? && rent_from > rent_to
      errors.add(:rent_from, "must be before rent_to")
    end
  end
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
#
# Indexes
#
#  index_customer_clients_on_account_id  (account_id)
#
