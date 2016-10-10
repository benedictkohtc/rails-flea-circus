require 'test_helper'

class DogTest < ActiveSupport::TestCase
  test "should not save dog without a breed" do
    dog = Dog.new
    assert_not dog.save, "Saved the dog without a breed"
  end
end
