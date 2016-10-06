require 'test_helper'

class DogFlowsTest < ActionDispatch::IntegrationTest
  def setup
    # login before each
    sign_in_user
  end

  test "can create a dog" do
    # access dog form
    get "/dogs/new"
    assert_response :success
    # create new dog
    post "/dogs",
      params: { dog: { breed: "Husky" } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "p", "Breed:\n  Husky"
  end

  test "can edit a dog" do
    dog = dogs(:pug)
    # access dog form
    get "/dogs/#{dog.id}/edit"
    assert_response :success
    # update dog
    patch "/dogs/#{dog.id}",
      params: { dog: { breed: "Puggy" } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "p", "Breed:\n  Puggy"
  end

  test "can delete a dog" do
    dog = dogs(:pug)
    delete "/dogs/#{dog.id}"
    # should be redirect and do no longer viewable
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_raise ActiveRecord::RecordNotFound do
      get "/dogs/#{dog.id}"
    end
  end
end
