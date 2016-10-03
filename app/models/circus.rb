class Circus < ApplicationRecord
  has_and_belongs_to_many :fleas
  has_many :dogs, -> { distinct }, through: :fleas
  # distinct means that we don't want it to find duplicates

end
