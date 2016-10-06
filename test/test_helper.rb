ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
# add code coverage
require 'simplecov'
SimpleCov.start 'rails'

# add helpers for signing in
module SignInHelper
  def sign_in_user
    post login_url(user: { email: users(:normal).email, password: 'password'})
  end
  def sign_in_admin
    post login_url(user: { email: users(:admin).email, password: 'password'})
  end
end

class ActionDispatch::IntegrationTest
  include SignInHelper
end
class ActionDispatch::ControllerTest
  include SignInHelper
end

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
