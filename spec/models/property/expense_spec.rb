# frozen_string_literal: true

require "rails_helper"

RSpec.describe(Property::Expense, type: :model) do
  describe "validations" do
    it "is valid with valid attributes" do
      expect(build(:property_expense)).to(be_valid)
    end

    it "is not valid without a name" do
      expect(build(:property_expense, name: nil)).not_to(be_valid)
    end

    it "is not valid without an amount" do
      expect(build(:property_expense, amount: nil)).not_to(be_valid)
    end

    it "is not valid without a due date" do
      expect(build(:property_expense, due_date: nil)).not_to(be_valid)
    end

    it "is not valid with a received date after due date" do
      expect(build(:property_expense, received_date: 1.day.ago, due_date: 2.days.ago)).not_to(be_valid)
    end

    it "is not valid with an amount less than 0" do
      expect(build(:property_expense, amount: -1)).not_to(be_valid)
    end

    it "is not valid with an invalid kind" do
      expect(build(:property_expense, kind: "invalid")).not_to(be_valid)
    end
  end

  describe "methods" do
    it "returns the name" do
      expect(build(:property_expense).get_name).to(eq("MyString"))
    end
  end
end
