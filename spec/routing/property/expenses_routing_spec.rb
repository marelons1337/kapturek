require "rails_helper"

RSpec.describe Property::ExpensesController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/property/expenses").to route_to("property/expenses#index")
    end

    it "routes to #new" do
      expect(get: "/property/expenses/new").to route_to("property/expenses#new")
    end

    it "routes to #show" do
      expect(get: "/property/expenses/1").to route_to("property/expenses#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/property/expenses/1/edit").to route_to("property/expenses#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/property/expenses").to route_to("property/expenses#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/property/expenses/1").to route_to("property/expenses#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/property/expenses/1").to route_to("property/expenses#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/property/expenses/1").to route_to("property/expenses#destroy", id: "1")
    end
  end
end
