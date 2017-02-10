class Vote < ApplicationRecord
  belongs_to :user
  belongs_to :votable, polymorphic: true

  # if we want to restrict voting, so a user can only vote on each thing once, we can do so with a scoped uniqueness validation
  validates :user_id, :uniqueness => { :scope => [:votable_type, :votable_id], message: 'has already voted' }

  validates :value, :inclusion => { :in => 0..5, :message => "must be between 0 and 5" }
end
