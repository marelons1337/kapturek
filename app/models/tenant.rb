# frozen_string_literal: true

class Tenant < ApplicationRecord
  belongs_to :flat
  belongs_to :building
  has_many :payments, dependent: :destroy

  validates :email, format: { with: ApplicationHelper::EMAIL_REGEX, message: I18n.t('forms.invalid_format') }
  validates :phone, format: { with: ApplicationHelper::PHONE_REGEX, message: I18n.t('forms.invalid_format') }
  validates :rent_from, :rent_to, :name, :surname, presence: true
  validate :date_range, :force_one_active
  validates_with FlatBelongingValidator

  before_save :occupy_flat, :set_debt
  before_create :set_initial_paid

  attr_accessor :rent

  PAYMENT_FREQUENCY = {
    'monthly' => 'monthly',
    'biweekly' => 'biweekly',
    'bimonthly' => 'bimonthly',
  }.freeze


  def rent
    @rent ||= self.flat.rent
  end

  # validations begin
  def date_range
    errors.add(:rent_to, I18n.t('forms.wrong_range')) if rent_from >= rent_to
  end

  def force_one_active
    flat = Flat.find_by(id: flat_id)
    determine_active
    other_tenants = Tenant.where(flat_id: flat_id, active: true).where('rent_to >= ? ', Date.today).where.not(id: self.id) if active?
    errors.add(:flat_id, I18n.t('forms.too_many_active')) if other_tenants.present? && flat.taken_until > Date.today
  end
  # validations end

  def full_name
    "#{name} #{surname}"
  end

  def occupy_flat
    flat = Flat.find_by(id: flat_id)
    flat.taken = if active?
      true
    else
      false
    end
    flat.taken_until = rent_to
    flat.save!
  end

  def determine_active
    self.active = if rent_from <= Date.today && rent_to >= Date.today
      true
    else
      false
    end
  end

  def total_paid
    Payment.where(tenant: self).pluck(:amount).reduce(:+)
  end

  def total_rent
    rent_length * self.rent
  end

  def rent_length(option = 'month')
    length = (rent_to-rent_from).to_f
    if option == 'month'
      length = (length/30.4375).to_i
    else
      length
    end
  end

  def set_debt
    today = Date.today
    self.debt += self.rent if today >= payment_due
    case self.payment_frequency
    when 'biweekly'
      payment_due = today + 2.weeks
    when 'monthly'
      payment_due = today + 1.month
    when 'bimonthly'
      payment_due = today + 2.months
    else
      false
    end
  end

  def set_initial_paid
    self.paid_to = self.payment_due
  end
end

# == Schema Information
#
# Table name: tenants
#
#  id                :bigint           not null, primary key
#  account_no        :string
#  active            :boolean
#  debt              :float            default(0.0)
#  email             :string
#  name              :string           not null
#  paid              :boolean          default(FALSE)
#  paid_to           :date
#  payment_due       :date
#  payment_frequency :string
#  phone             :string           not null
#  rent_from         :date             not null
#  rent_to           :date
#  surname           :string           not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  building_id       :bigint           not null
#  flat_id           :bigint           not null
#
# Indexes
#
#  index_tenants_on_building_id  (building_id)
#  index_tenants_on_flat_id      (flat_id)
#
# Foreign Keys
#
#  fk_rails_...  (building_id => buildings.id)
#  fk_rails_...  (flat_id => flats.id)
#
