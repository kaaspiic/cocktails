class Drink < ApplicationRecord
  has_many :comments
  has_many :ratings

  validates :name, :description, presence: true

  def to_s
    name
  end
end
