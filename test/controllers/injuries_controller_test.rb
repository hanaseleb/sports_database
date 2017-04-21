require 'test_helper'

class InjuriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @injury = injuries(:one)
  end

  test "should get index" do
    get injuries_url
    assert_response :success
  end

  test "should get new" do
    get new_injury_url
    assert_response :success
  end

  test "should create injury" do
    assert_difference('Injury.count') do
      post injuries_url, params: { injury: { name: @injury.name, part: @injury.part, place: @injury.place, timing: @injury.timing, user_id: @injury.user_id } }
    end

    assert_redirected_to injury_url(Injury.last)
  end

  test "should show injury" do
    get injury_url(@injury)
    assert_response :success
  end

  test "should get edit" do
    get edit_injury_url(@injury)
    assert_response :success
  end

  test "should update injury" do
    patch injury_url(@injury), params: { injury: { name: @injury.name, part: @injury.part, place: @injury.place, timing: @injury.timing, user_id: @injury.user_id } }
    assert_redirected_to injury_url(@injury)
  end

  test "should destroy injury" do
    assert_difference('Injury.count', -1) do
      delete injury_url(@injury)
    end

    assert_redirected_to injuries_url
  end
end
