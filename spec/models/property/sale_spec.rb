require 'rails_helper'

RSpec.describe Property::Sale, type: :model do
  let(:sale) { create(:property_sale) }

  context 'after creation before changing status to pending or sold' do
    it 'should get default status' do
      expect(sale.get_status).to eq "bought"
    end

    it 'should get price with default status' do
      expect(sale.get_price).to eq 150000
    end
  end
end
