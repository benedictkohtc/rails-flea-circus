require 'test_helper'

class AuthenticationFlowsTest < ActionDispatch::IntegrationTest
  test "can login with correct Credentials" do
    user = users(:normal)
    post "/login",
      params: { user: { email: user.email, password: 'password' } }
    # should be redirected and shown a success alert on the new page
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "div.alert", "User Logged In!"
    assert_select "a.nav-link:first-of-type", "#{user.name}"
  end

  test "cannot login with incorrect Credentials" do
    user = users(:normal)
    post "/login",
      params: { user: { email: user.email, password: 'wrongpassword' } }
    # should be redirected and shown a failure alert on the new page
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "div.alert", "Credentials Invalid!"
    assert_select "a.nav-link:first-of-type", {count: 0, text: "#{user.name}"}
  end

  test "normal user can register and login but not manage users" do
    post "/register",
      params: { user: { first_name: 'john', family_name: 'doe', admin: true, email: "john@doe.com", password: 'johndoe1', password_confirmation: 'johndoe1' } }
    assert_response :redirect
    # should be redirected and shown a success alert
    follow_redirect!
    assert_response :success
    assert_select "div.alert", "Account Created. Please Login"
    # should be redirected and shown a success alert
    post "/login",
      params: { user: { email: "john@doe.com", password: 'johndoe1' } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "div.alert", "User Logged In!"
    assert_select "a.nav-link:first-of-type", "John Doe"
    # should not be able to manage users
    get "/users"
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "div.alert", "Admin Only Access!"
  end

  test "admin user can login and manage users" do
    user = users(:admin)
    post "/login",
      params: { user: { email: user.email, password: 'password' } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    assert_select "div.alert", "User Logged In!"
    assert_select "a.nav-link:first-of-type", "#{user.name}"
    # should be able to manage users
    get "/users"
    assert_response :success
  end
end
