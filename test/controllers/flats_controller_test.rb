require "test_helper"

class FlatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @flat = flats(:one)
  end

  test "should get index" do
    get flats_url
    assert_response :success
  end

  test "should get new" do
    get new_flat_url
    assert_response :success
  end

  test "should create flat" do
    assert_difference('Flat.count') do
      post flats_url, params: { flat: { building_id: @flat.building_id, debt: @flat.debt, door_number: @flat.door_number, floor_no: @flat.floor_no, rent: @flat.rent, rooms_amount: @flat.rooms_amount, surface: @flat.surface, taken: @flat.taken, taken_until: @flat.taken_until } }
    end

    assert_redirected_to flat_url(Flat.last)
  end

  test "should show flat" do
    get flat_url(@flat)
    assert_response :success
  end

  test "should get edit" do
    get edit_flat_url(@flat)
    assert_response :success
  end

  test "should update flat" do
    patch flat_url(@flat), params: { flat: { building_id: @flat.building_id, debt: @flat.debt, door_number: @flat.door_number, floor_no: @flat.floor_no, rent: @flat.rent, rooms_amount: @flat.rooms_amount, surface: @flat.surface, taken: @flat.taken, taken_until: @flat.taken_until } }
    assert_redirected_to flat_url(@flat)
  end

  test "should destroy flat" do
    assert_difference('Flat.count', -1) do
      delete flat_url(@flat)
    end

    assert_redirected_to flats_url
  end

  test "should get tenants" do
    tenants_ids = @flat.tenants.ids
    get get_tenants_url(@flat.id)

    resp = JSON.parse(response.body)
    resp_ids = resp.map {|r| r['id']}

    assert_equal tenants_ids, resp_ids
  end
end
