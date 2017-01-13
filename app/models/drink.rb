class Drink < ApplicationRecord
  has_many :comments
  has_many :ratings
  belongs_to :user

  validates :name, :description, presence: true

  def to_s
    name
  end
end
