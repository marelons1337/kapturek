class Customer::Client < ApplicationRecord
  belongs_to :account, optional: true
  has_many :sales, through: :client_sales, class_name: "Customer::ClientProperty", foreign_key: "property_sale_id"
  has_many :rentals, through: :client_rentals, class_name: "Customer::ClientProperty", foreign_key: "property_rental_id"

  validates :email, :rent_from, :name, presence: true
  validate :rental_or_sale, :rent_from_before_rent_to, :rental_or_sale_not_both

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
  def rental_or_sale
    if rental_id.nil? && sale_id.nil?
      errors.add(:rental_id, "or sale_id must be present")
    end
  end

  def rental_or_sale_not_both
    if rental_id.present? && sale_id.present?
      errors.add(:rental_id, "and sale_id cannot be both present")
    end
  end

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
#  rental_id  :integer
#  sale_id    :integer
#
# Indexes
#
#  index_customer_clients_on_account_id  (account_id)
#  index_customer_clients_on_rental_id   (rental_id)
#  index_customer_clients_on_sale_id     (sale_id)
#
