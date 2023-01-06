# frozen_string_literal: true

require "rails_helper"

RSpec.describe(Property::Income, type: :model) do
  describe "validations" do
    it "is valid with valid attributes" do
      expect(build(:property_income)).to(be_valid)
    end

    it "is not valid without a name" do
      expect(build(:property_income, name: nil)).not_to(be_valid)
    end

    it "is not valid without an amount" do
      expect(build(:property_income, amount: nil)).not_to(be_valid)
    end

    it "is not valid without a due date" do
      expect(build(:property_income, due_date: nil)).not_to(be_valid)
    end

    it "is not valid with a received date after due date" do
      expect(build(:property_income, received_date: 1.day.ago, due_date: 2.days.ago)).not_to(be_valid)
    end

    it "is not valid with an amount less than 0" do
      expect(build(:property_income, amount: -1)).not_to(be_valid)
    end
  end

  describe "methods" do
    it "returns the name" do
      expect(build(:property_income).get_name).to(eq("MyString"))
    end
  end
end
