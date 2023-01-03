require 'rails_helper'

RSpec.describe "property/expenses/show", type: :view do
  before(:each) do
    assign(:property_expense, Property::Expense.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
