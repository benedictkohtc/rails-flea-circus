class Dog < ApplicationRecord
  has_many :fleas, dependent: :destroy
  has_many :circuses, -> { distinct }, through: :fleas
  # distinct means that we don't want it to find duplicates

  def name
    "#{breed} #{id}"
  end

end
