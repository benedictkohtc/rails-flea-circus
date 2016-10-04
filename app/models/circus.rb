class Circus < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :fleas
  has_many :dogs, -> { distinct }, through: :fleas
  # distinct means that we don't want it to find duplicates

  # we add a custom instance method to easily check if a circus belongs to a particular user
  def belongs_to_user?(test_user)
    user && user.id == test_user.id
  end
end
