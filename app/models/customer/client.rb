# frozen_string_literal: true

# each month based on day in rent_from we'll add debt to client, debt will have to be paid
# upon payment, we'll add paid to client, debt and paid will have to balance each other
class Customer::Client < ApplicationRecord
  has_many :rentals, class_name: "Property::Rental", dependent: :nullify
  has_many :sales, class_name: "Property::Sale", dependent: :nullify
  has_many :expenses, class_name: "Property::Expense", dependent: :destroy
  has_many :incomes, class_name: "Property::Income", dependent: :destroy

  validates :email, :rent_from, :name, presence: true
  validate :rent_from_before_rent_to

  before_save :set_status

  enum status: { balanced: 0, paid: 1, debt: 2 }

  def get_name(full: true)
    if company
      name
    else
      "#{name} #{surname}"
    end
  end

  def set_status
    self.status = if paid.present? && debt.present? && paid > debt
      "paid"
    elsif paid == debt
      "balanced"
    else
      "debt"
    end
    true
  end

  def full_email
    "#{name} <#{email}>"
  end

  def total_payments_amount
    expenses.where(paid: true).sum(:amount) + incomes.where(paid: true).sum(:amount)
  end

  def total_debt
    debt
  end

  # what if client rents more than once?
  def total_rent
    # rentals.each do |rental|
    #   DateService.months_between_dates(rent_from, rent_to) * rental.rent
    #   rental.rent
    # end
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
#  status     :integer          default("balanced")
#  surname    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  account_id :integer
#
# Indexes
#
#  index_customer_clients_on_account_id  (account_id)
#
