# frozen_string_literal: true

require "rails_helper"

RSpec.describe(Customer::ClientsController, type: :routing) do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/customer/clients").to(route_to("customer/clients#index"))
    end

    it "routes to #new" do
      expect(get: "/customer/clients/new").to(route_to("customer/clients#new"))
    end

    it "routes to #show" do
      expect(get: "/customer/clients/1").to(route_to("customer/clients#show", id: "1"))
    end

    it "routes to #edit" do
      expect(get: "/customer/clients/1/edit").to(route_to("customer/clients#edit", id: "1"))
    end

    it "routes to #create" do
      expect(post: "/customer/clients").to(route_to("customer/clients#create"))
    end

    it "routes to #update via PUT" do
      expect(put: "/customer/clients/1").to(route_to("customer/clients#update", id: "1"))
    end

    it "routes to #update via PATCH" do
      expect(patch: "/customer/clients/1").to(route_to("customer/clients#update", id: "1"))
    end

    it "routes to #destroy" do
      expect(delete: "/customer/clients/1").to(route_to("customer/clients#destroy", id: "1"))
    end
  end
end
