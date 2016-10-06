require 'test_helper'

class DogTest < ActiveSupport::TestCase
  test "should not save dog without a breed" do
    dog = Dog.new
    assert_not dog.save, "Saved the dog without a breed"
  end

  test "should have a breed" do
    pug = dogs(:pug)
    assert_equal pug.breed, "Pug", "Saved the dog without a breed"
  end

  # deleting a dog should delete it's fleas

  # dog name should work
end
