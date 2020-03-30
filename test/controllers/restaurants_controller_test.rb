require 'test_helper'

class RestaurantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @restaurant = restaurants(:one)
  end

  test "should get index" do
    get restaurants_url
    assert_response :success
  end

  test "should get new" do
    get new_restaurant_url
    assert_response :success
  end

  test "should create restaurant" do
    assert_difference('Restaurant.count') do
      post restaurants_url, params: { restaurant: { city: @restaurant.city, state: @restaurant.state, name: @restaurant.name, nosplit: @restaurant.nosplit, split: @restaurant.split } }
    end

    assert_redirected_to restaurants_url
  end

  test "should show restaurant" do
    get restaurant_url(@restaurant)
    assert_response :success
  end

  test "should get edit" do
    get edit_restaurant_url(@restaurant)
    assert_response :success
  end

  test "should update restaurant" do
    patch restaurant_url(@restaurant), params: { restaurant: { city: @restaurant.city, state: @restaurant.state, name: @restaurant.name, nosplit: @restaurant.nosplit, split: @restaurant.split } }
    assert_redirected_to restaurant_url(@restaurant)
  end

  test "should destroy restaurant" do
    assert_difference('Restaurant.count', -1) do
      delete restaurant_url(@restaurant)
    end

    assert_redirected_to restaurants_url
  end

  test "should search name" do
    get restaurants_search_url, params: {name: "Olive Garden"}
    assert_response :success    
  end

  test "should search city" do
    get restaurants_search_url, params: {city: "Baltimore"}
    assert_response :success
  end

  test "should search state" do
    get restaurants_search_url, params: {state: "Idaho"}
    assert_response :success
  end

  test "should search name and city" do
    get restaurants_search_url, params: {name: "Olive Garden", city: "Baltimore"}
    assert_response :success
  end

  test "should search city and state" do
    get restaurants_search_url, params: {city: "Baltimore", state: "Maryland"}
    assert_response :success
  end

  test "should search name and state" do
    get restaurants_search_url, params: {name: "Olive Garden", state: "Idaho"}
    assert_response :success
  end

  test "should search name city and state" do
    get restaurants_search_url, params: {name: "Olive Garden", city: "Baltimore", state: "Maryland"}
    assert_response :success
  end  

  test "should add to split" do
  original_split = @restaurant.split
  post restaurants_split_url(@restaurant)
  assert_response :success
  assert_equal @restaurant.reload.split, original_split + 1
  end

  test "should add to nosplit" do
  original_nosplit = @restaurant.nosplit
  post restaurants_nosplit_url(@restaurant)
  assert_response :success
  assert_equal @restaurant.reload.nosplit, original_nosplit + 1
  end

  

end
