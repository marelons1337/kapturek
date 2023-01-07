# frozen_string_literal: true

require "rails_helper"

RSpec.describe("property/payments/edit", type: :view) do
  let(:property_payment) do
    Property::Payment.create!(
      kind: 1,
      amount: "MyString",
      currency: "MyString",
      description: "MyString",
      income: nil,
      expense: nil,
      client: nil,
    )
  end

  before do
    assign(:property_payment, property_payment)
  end

  it "renders the edit property_payment form" do
    render

    assert_select "form[action=?][method=?]", property_payment_path(property_payment), "post" do
      assert_select "input[name=?]", "property_payment[kind]"

      assert_select "input[name=?]", "property_payment[amount]"

      assert_select "input[name=?]", "property_payment[currency]"

      assert_select "input[name=?]", "property_payment[description]"

      assert_select "input[name=?]", "property_payment[income_id]"

      assert_select "input[name=?]", "property_payment[expense_id]"

      assert_select "input[name=?]", "property_payment[client_id]"
    end
  end
end
