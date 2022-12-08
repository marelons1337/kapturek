require "rails_helper"

RSpec.describe Property::SalesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/property/sales").to route_to("property/sales#index")
    end

    it "routes to #new" do
      expect(get: "/property/sales/new").to route_to("property/sales#new")
    end

    it "routes to #show" do
      expect(get: "/property/sales/1").to route_to("property/sales#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/property/sales/1/edit").to route_to("property/sales#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/property/sales").to route_to("property/sales#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/property/sales/1").to route_to("property/sales#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/property/sales/1").to route_to("property/sales#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/property/sales/1").to route_to("property/sales#destroy", id: "1")
    end
  end
end
