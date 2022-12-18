require 'rails_helper'

RSpec.describe "property/properties/index", type: :view do
  before(:each) do
    assign(:property_properties, [
      Property::Property.create!(),
      Property::Property.create!()
    ])
  end

  it "renders a list of property/properties" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
