# frozen_string_literal: true

require "rails_helper"

RSpec.describe(Property::Sale, type: :model) do
  let(:sale) { create(:property_sale) }

  context "when created" do
    it "gets default status" do
      expect(sale.status).to(eq("pending"))
    end

    it "gets price with default status" do
      expect(sale.price).to(eq(150000))
    end
  end
end
