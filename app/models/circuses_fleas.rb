class CircusesFleas < ApplicationRecord
  belongs_to :circus
  belongs_to :flea

  # this model is not currently used but we could add methods to it later
end
