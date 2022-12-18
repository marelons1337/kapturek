require 'rails_helper'

RSpec.describe "property/properties/show", type: :view do
  before(:each) do
    assign(:property_property, Property::Property.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
