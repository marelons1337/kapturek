require "rails_helper"

RSpec.describe Property::PropertiesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/property/properties").to route_to("property/properties#index")
    end

    it "routes to #new" do
      expect(get: "/property/properties/new").to route_to("property/properties#new")
    end

    it "routes to #show" do
      expect(get: "/property/properties/1").to route_to("property/properties#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/property/properties/1/edit").to route_to("property/properties#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/property/properties").to route_to("property/properties#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/property/properties/1").to route_to("property/properties#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/property/properties/1").to route_to("property/properties#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/property/properties/1").to route_to("property/properties#destroy", id: "1")
    end
  end
end
