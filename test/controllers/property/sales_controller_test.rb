require "test_helper"

class Property::SalesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @property_sale = property_sales(:one)
  end

  test "should get index" do
    get property_sales_url
    assert_response :success
  end

  test "should get new" do
    get new_property_sale_url
    assert_response :success
  end

  test "should create property_sale" do
    assert_difference("Property::Sale.count") do
      post property_sales_url, params: { property_sale: { bought_at: @property_sale.bought_at, buy_price: @property_sale.buy_price, city: @property_sale.city, country: @property_sale.country, door_no: @property_sale.door_no, floor_no: @property_sale.floor_no, name: @property_sale.name, rooms_amount: @property_sale.rooms_amount, sale_price: @property_sale.sale_price, sold_at: @property_sale.sold_at, street: @property_sale.street, street_no: @property_sale.street_no, surface: @property_sale.surface } }
    end

    assert_redirected_to property_sale_url(Property::Sale.last)
  end

  test "should show property_sale" do
    get property_sale_url(@property_sale)
    assert_response :success
  end

  test "should get edit" do
    get edit_property_sale_url(@property_sale)
    assert_response :success
  end

  test "should update property_sale" do
    patch property_sale_url(@property_sale), params: { property_sale: { bought_at: @property_sale.bought_at, buy_price: @property_sale.buy_price, city: @property_sale.city, country: @property_sale.country, door_no: @property_sale.door_no, floor_no: @property_sale.floor_no, name: @property_sale.name, rooms_amount: @property_sale.rooms_amount, sale_price: @property_sale.sale_price, sold_at: @property_sale.sold_at, street: @property_sale.street, street_no: @property_sale.street_no, surface: @property_sale.surface } }
    assert_redirected_to property_sale_url(@property_sale)
  end

  test "should destroy property_sale" do
    assert_difference("Property::Sale.count", -1) do
      delete property_sale_url(@property_sale)
    end

    assert_redirected_to property_sales_url
  end
end
