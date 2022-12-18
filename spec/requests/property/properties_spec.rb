require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe "/property/properties", type: :request do
  
  # This should return the minimal set of attributes required to create a valid
  # Property::Property. As you add validations to Property::Property, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Property::Property.create! valid_attributes
      get property_properties_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      property = Property::Property.create! valid_attributes
      get property_property_url(property)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_property_property_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      property = Property::Property.create! valid_attributes
      get edit_property_property_url(property)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Property::Property" do
        expect {
          post property_properties_url, params: { property_property: valid_attributes }
        }.to change(Property::Property, :count).by(1)
      end

      it "redirects to the created property_property" do
        post property_properties_url, params: { property_property: valid_attributes }
        expect(response).to redirect_to(property_property_url(Property::Property.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Property::Property" do
        expect {
          post property_properties_url, params: { property_property: invalid_attributes }
        }.to change(Property::Property, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post property_properties_url, params: { property_property: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested property_property" do
        property = Property::Property.create! valid_attributes
        patch property_property_url(property), params: { property_property: new_attributes }
        property.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the property_property" do
        property = Property::Property.create! valid_attributes
        patch property_property_url(property), params: { property_property: new_attributes }
        property.reload
        expect(response).to redirect_to(property_property_url(property))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        property = Property::Property.create! valid_attributes
        patch property_property_url(property), params: { property_property: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested property_property" do
      property = Property::Property.create! valid_attributes
      expect {
        delete property_property_url(property)
      }.to change(Property::Property, :count).by(-1)
    end

    it "redirects to the property_properties list" do
      property = Property::Property.create! valid_attributes
      delete property_property_url(property)
      expect(response).to redirect_to(property_properties_url)
    end
  end
end
