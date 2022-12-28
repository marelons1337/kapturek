# frozen_string_literal: true

require "rails_helper"

RSpec.describe(Property::Rental, type: :model) do
  let(:rental) { create(:property_rental) }

  context "when created" do
    it "gets default status" do
      expect(rental.get_status).to(eq("empty"))
    end

    it "gets price with default status" do
      expect(rental.get_price).to(eq(1500))
    end
  end
end
