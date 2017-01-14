class Drink < ApplicationRecord
  has_many :comments
  has_many :ratings
  has_many :preparation_steps
  belongs_to :user

  accepts_nested_attributes_for :preparation_steps, allow_destroy: true, reject_if: :all_blank

  validates :name, :description, presence: true

  def to_s
    name
  end
end
