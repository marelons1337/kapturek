# frozen_string_literal: true

require "rails_helper"

RSpec.describe(Property::Payment, type: :model) do
  describe ".kind_model_values" do
    it "returns an array of arrays with the name and id of the income" do
      create(:property_income)
      expect(described_class.kind_model_values("income")).to(eq(Property::Income.all.each.map { |i| [i.name, i.id] }))
    end

    it "returns an array of arrays with the name and id of the expense" do
      create(:property_expense)
      expect(described_class.kind_model_values("expense")).to(eq(Property::Expense.all.each.map do |e|
                                                                   [e.name, e.id]
                                                                 end))
    end
  end

  describe "#get_name" do
    it "returns the name of the payment" do
      payment = build(:property_payment, name: "Payment name")
      expect(payment.get_name).to(eq("Payment name"))
    end

    it "returns the name of the payment shortened to 20 characters and finished with ..." do
      payment = build(:property_payment, name: "Payment name" * 10)
      expect(payment.get_name(full: false)).to(eq("Payment namePayment n..."))
    end
  end
end
