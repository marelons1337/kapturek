require "test_helper"

class Property::RentalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @property_rental = property_rentals(:one)
  end

  test "should get index" do
    get property_rentals_url
    assert_response :success
  end

  test "should get new" do
    get new_property_rental_url
    assert_response :success
  end

  test "should create property_rental" do
    assert_difference("Property::Rental.count") do
      post property_rentals_url, params: { property_rental: { account_id: @property_rental.account_id, bought_at: @property_rental.bought_at, building_id: @property_rental.building_id, buy_price: @property_rental.buy_price, city: @property_rental.city, country: @property_rental.country, door_no: @property_rental.door_no, floor_no: @property_rental.floor_no, name: @property_rental.name, rent: @property_rental.rent, rooms_amount: @property_rental.rooms_amount, sale_price: @property_rental.sale_price, street: @property_rental.street, street_no: @property_rental.street_no, surface: @property_rental.surface, taken_from: @property_rental.taken_from, taken_until: @property_rental.taken_until } }
    end

    assert_redirected_to property_rental_url(Property::Rental.last)
  end

  test "should show property_rental" do
    get property_rental_url(@property_rental)
    assert_response :success
  end

  test "should get edit" do
    get edit_property_rental_url(@property_rental)
    assert_response :success
  end

  test "should update property_rental" do
    patch property_rental_url(@property_rental), params: { property_rental: { account_id: @property_rental.account_id, bought_at: @property_rental.bought_at, building_id: @property_rental.building_id, buy_price: @property_rental.buy_price, city: @property_rental.city, country: @property_rental.country, door_no: @property_rental.door_no, floor_no: @property_rental.floor_no, name: @property_rental.name, rent: @property_rental.rent, rooms_amount: @property_rental.rooms_amount, sale_price: @property_rental.sale_price, street: @property_rental.street, street_no: @property_rental.street_no, surface: @property_rental.surface, taken_from: @property_rental.taken_from, taken_until: @property_rental.taken_until } }
    assert_redirected_to property_rental_url(@property_rental)
  end

  test "should destroy property_rental" do
    assert_difference("Property::Rental.count", -1) do
      delete property_rental_url(@property_rental)
    end

    assert_redirected_to property_rentals_url
  end
end
