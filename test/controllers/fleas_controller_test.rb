require 'test_helper'

class FleasControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in_user
    @flea = fleas(:jumping)
    @dog = @flea.dog
  end

  test "should get index" do
    get dog_fleas_url(@dog)
    assert_response :success
  end

  test "should get new" do
    get new_dog_flea_url(@dog)
    assert_response :success
  end

  test "should create flea" do
    assert_difference('Flea.count') do
      post dog_fleas_url(@dog), params: { flea: { dog_id: @dog.id, skill: 'swinging' } }
    end

    assert_redirected_to flea_url(Flea.last)
  end

  test "should show flea" do
    get flea_url(@flea)
    assert_response :success
  end

  test "should get edit" do
    get edit_flea_url(@flea)
    assert_response :success
  end

  test "should update flea" do
    patch flea_url(@flea), params: { flea: { dog_id: @flea.dog_id, skill: @flea.skill } }
    assert_redirected_to flea_url(@flea)
  end

  test "should destroy flea" do
    assert_difference('Flea.count', -1) do
      delete flea_url(@flea)
    end

    assert_redirected_to dog_fleas_url(@dog)
  end
end
