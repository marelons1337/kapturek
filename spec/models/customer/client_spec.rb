# frozen_string_literal: true

require "rails_helper"

RSpec.describe(Customer::Client, type: :model) do
  context "when created" do
    let(:client) { create(:customer_client) }

    it "gets default status" do
      expect(client.status).to(eq("balanced"))
    end

    it "gets default rent_from" do
      expect(client.rent_from).to(eq(Time.zone.today))
    end

    it "gets default rent_to" do
      expect(client.rent_to).to(eq(Time.zone.today + 1.year))
    end
  end
end
