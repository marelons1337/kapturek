# frozen_string_literal: true

require "rails_helper"

RSpec.describe(Property::Property, type: :model) do
  context "when created" do
    let(:property) { create(:property_property) }

    it "gets default status" do
      expect(property.status).to(eq("empty"))
    end

    it "gets default price" do
      expect(property.current_price).to(eq(150000))
    end

    it "gets default buy_price" do
      expect(property.buy_price).to(eq(150000))
    end

    it "gets default sale_price" do
      expect(property.sale_price).to(eq(nil))
    end
  end

  context "when requested a full_address" do
    let(:property) do
      create(:property_property, street: "Ratke Haven", street_no: "63", city: "South Alphatown", country: "Costa Rica")
    end

    it "returns full address" do
      expect(property.full_address).to(eq("Ratke Haven 63, South Alphatown, Costa Rica"))
    end
  end

  context "when requested a full_address without country" do
    let(:property) do
      create(:property_property, street: "Ratke Haven", street_no: "63", city: "South Alphatown", country: "Costa Rica")
    end

    it "returns full address without country" do
      expect(property.full_address(local: false)).to(eq("Ratke Haven 63, South Alphatown"))
    end
  end

  context "when requested a name" do
    let(:property) do
      create(:property_property, name: "Test property")
    end

    it "returns name" do
      expect(property.get_name).to(eq("Test property"))
    end
  end

  context "when requested a name without name" do
    let(:property) do
      create(
        :property_property,
        name: nil,
        street: "Ratke Haven",
        street_no: "63",
        city: "South Alphatown",
        country: "Costa Rica",
      )
    end

    it "returns full address" do
      expect(property.get_name).to(eq("Ratke Haven 63, South Alphatown, Costa Rica"))
    end
  end

  context "when requested payments" do
    let(:property) { create(:property_property) }
    let(:sale) { create(:property_sale, property: property) }
    let(:income) { create(:property_income, incomable: sale) }
    let(:expense) { create(:property_expense, expensable: sale) }

    it "returns payments" do
      create(:property_payment, kind: "income", income: income)
      create(:property_payment, kind: "expense", expense: expense)
      expect(property.payments.count).to(eq(2))
    end
  end

  context "when requested clients" do
    let(:property) { create(:property_property) }
    let(:sale) { create(:property_sale, property: property) }
    let(:rental) { create(:property_rental, property: property) }

    it "returns clients" do
      create(:customer_client, sales: [sale])
      create(:customer_client, rentals: [rental])
      expect(property.clients.count).to(eq(2))
    end
  end
end
