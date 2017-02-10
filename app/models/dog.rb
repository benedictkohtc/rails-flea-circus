class Dog < ApplicationRecord
  has_many :fleas #, dependent: :destroy
  has_many :circuses, -> { distinct }, through: :fleas
  # distinct means that we don't want it to find duplicates
  has_many :votes, as: :votable

  before_destroy :re_home

  validates :breed, presence: true

  def name
    "#{breed} #{id}"
  end

  private

  def re_home
    # randomly pick another dog, whose is not this one, if not found then destroy the fleas
    new_owner = Dog.where.not(id: id).sample(1).first
    if new_owner
      fleas.update_all(dog_id: new_owner.id)
    else
      fleas.destroy_all
    end
  end

end
