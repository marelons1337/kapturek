# frozen_string_literal: true

require 'test_helper'

class BuildingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @building = buildings(:one)
  end

  test 'should get index' do
    get buildings_url
    assert_response :success
  end

  test 'should get new' do
    get new_building_url
    assert_response :success
  end

  test 'should create building' do
    assert_difference('Building.count') do
      post buildings_url,
           params: { building: { address: @building.address, flats_amount: @building.flats_amount, floors: @building.floors,
                                 name: @building.name } }
    end

    assert_redirected_to building_url(Building.last)
  end

  test 'should show building' do
    get building_url(@building)
    assert_response :success
  end

  test 'should get edit' do
    get edit_building_url(@building)
    assert_response :success
  end

  test 'should update building' do
    patch building_url(@building),
          params: { building: { address: @building.address, flats_amount: @building.flats_amount, floors: @building.floors,
                                name: @building.name } }
    assert_redirected_to building_url(@building)
  end

  test 'should destroy building' do
    assert_difference('Building.count', -1) do
      delete building_url(@building)
    end

    assert_redirected_to buildings_url
  end

  test 'should find belonging flats' do
    flats_ids = @building.flats.ids
    get find_flats_url(id: @building.id)

    resp = JSON.parse(response.body)
    resp_ids = resp.map { |r| r['id'] }

    assert_equal flats_ids, resp_ids
  end
end
