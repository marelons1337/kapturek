# frozen_string_literal: true

require "rails_helper"

RSpec.describe("property/payments/index", type: :view) do
  before do
    assign(:property_payments, [
      Property::Payment.create!(
        kind: 2,
        amount: "Amount",
        currency: "Currency",
        description: "Description",
        income: nil,
        expense: nil,
        client: nil,
      ),
      Property::Payment.create!(
        kind: 2,
        amount: "Amount",
        currency: "Currency",
        description: "Description",
        income: nil,
        expense: nil,
        client: nil,
      ),
    ])
  end

  it "renders a list of property/payments" do
    render
    cell_selector = Rails::VERSION::STRING >= "7" ? "div>p" : "tr>td"
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Amount".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Currency".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Description".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
