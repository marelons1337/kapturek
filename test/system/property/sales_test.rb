require "application_system_test_case"

class Property::SalesTest < ApplicationSystemTestCase
  setup do
    @property_sale = property_sales(:one)
  end

  test "visiting the index" do
    visit property_sales_url
    assert_selector "h1", text: "Sales"
  end

  test "should create sale" do
    visit property_sales_url
    click_on "New sale"

    fill_in "Bought at", with: @property_sale.bought_at
    fill_in "Buy price", with: @property_sale.buy_price
    fill_in "City", with: @property_sale.city
    fill_in "Country", with: @property_sale.country
    fill_in "Door numer", with: @property_sale.door_numer
    fill_in "Floor no", with: @property_sale.floor_no
    fill_in "Name", with: @property_sale.name
    fill_in "Rooms amount", with: @property_sale.rooms_amount
    fill_in "Sale price", with: @property_sale.sale_price
    fill_in "Sold at", with: @property_sale.sold_at
    fill_in "Street", with: @property_sale.street
    fill_in "Street no", with: @property_sale.street_no
    fill_in "Surface", with: @property_sale.surface
    click_on "Create Sale"

    assert_text "Sale was successfully created"
    click_on "Back"
  end

  test "should update Sale" do
    visit property_sale_url(@property_sale)
    click_on "Edit this sale", match: :first

    fill_in "Bought at", with: @property_sale.bought_at
    fill_in "Buy price", with: @property_sale.buy_price
    fill_in "City", with: @property_sale.city
    fill_in "Country", with: @property_sale.country
    fill_in "Door numer", with: @property_sale.door_numer
    fill_in "Floor no", with: @property_sale.floor_no
    fill_in "Name", with: @property_sale.name
    fill_in "Rooms amount", with: @property_sale.rooms_amount
    fill_in "Sale price", with: @property_sale.sale_price
    fill_in "Sold at", with: @property_sale.sold_at
    fill_in "Street", with: @property_sale.street
    fill_in "Street no", with: @property_sale.street_no
    fill_in "Surface", with: @property_sale.surface
    click_on "Update Sale"

    assert_text "Sale was successfully updated"
    click_on "Back"
  end

  test "should destroy Sale" do
    visit property_sale_url(@property_sale)
    click_on "Destroy this sale", match: :first

    assert_text "Sale was successfully destroyed"
  end
end
