class Property::Sale < ApplicationRecord
  # belongs_to :account, optional: true
  validates :bought_at, :buy_price, :surface, :country, :city, :street, :street_no, presence: true

  enum status: {
    bought: 0,
    pending: 1,
    sold: 2,
  }

  def full_address(local: true)
    "#{street} #{street_no}#{door_no.present? ? '/' + door_no : nil }, #{city}, #{local ? country : nil}"
  end

  def get_name
    self.name.presence || full_address
  end

  def get_price
    if status === 'sold'
      sale_price
    else
      buy_price
    end
  end

  def get_status
    self.status
  end

  def get_surface
    "#{self.surface} m2"
  end
end

# == Schema Information
#
# Table name: property_sales
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
#  status       :integer          default("bought")
#  street       :string
#  street_no    :string
#  surface      :float
#  zip          :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  account_id   :integer
#
# Indexes
#
#  index_property_sales_on_account_id  (account_id)
#
