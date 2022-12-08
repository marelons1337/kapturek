require 'rails_helper'

RSpec.describe Property::Rental, type: :model do
  let(:rental) { create(:property_rental) }

  context 'after creation before changing status to pending or sold' do
    it 'should get default status' do
      expect(rental.get_status).to eq "empty"
    end

    it 'should get price with default status' do
      expect(rental.get_price).to eq 150000
    end
  end
end
