class Flea < ApplicationRecord
  belongs_to :dog
  has_and_belongs_to_many :circuses
  has_many :votes, as: :votable
end
