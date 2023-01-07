# frozen_string_literal: true

require "rails_helper"

RSpec.describe(Property::PaymentsController, type: :routing) do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/property/payments").to(route_to("property/payments#index"))
    end

    it "routes to #new" do
      expect(get: "/property/payments/new").to(route_to("property/payments#new"))
    end

    it "routes to #show" do
      expect(get: "/property/payments/1").to(route_to("property/payments#show", id: "1"))
    end

    it "routes to #edit" do
      expect(get: "/property/payments/1/edit").to(route_to("property/payments#edit", id: "1"))
    end

    it "routes to #create" do
      expect(post: "/property/payments").to(route_to("property/payments#create"))
    end

    it "routes to #update via PUT" do
      expect(put: "/property/payments/1").to(route_to("property/payments#update", id: "1"))
    end

    it "routes to #update via PATCH" do
      expect(patch: "/property/payments/1").to(route_to("property/payments#update", id: "1"))
    end

    it "routes to #destroy" do
      expect(delete: "/property/payments/1").to(route_to("property/payments#destroy", id: "1"))
    end
  end
end
