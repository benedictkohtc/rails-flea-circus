require 'test_helper'

class CircusesControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in_user
    @circus = circuses(:paris)
  end

  test "should get index" do
    get circuses_url
    assert_response :success
  end

  test "should get new" do
    get new_circus_url
    assert_response :success
  end

  test "should create circus" do
    assert_difference('Circus.count') do
      post circuses_url, params: { circus: { name: @circus.name } }
    end

    assert_redirected_to circus_url(Circus.last)
  end

  test "should show circus" do
    get circus_url(@circus)
    assert_response :success
  end

  test "should get edit" do
    get edit_circus_url(@circus)
    assert_response :success
  end

  test "should update circus" do
    patch circus_url(@circus), params: { circus: { name: @circus.name } }
    assert_redirected_to circus_url(@circus)
  end

  test "should destroy circus" do
    assert_difference('Circus.count', -1) do
      delete circus_url(@circus)
    end

    assert_redirected_to circuses_url
  end
end
