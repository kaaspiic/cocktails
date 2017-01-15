class Drink < ApplicationRecord
  has_many :comments
  has_many :ratings
  has_many :preparation_steps
  belongs_to :user

  accepts_nested_attributes_for :preparation_steps, allow_destroy: true, reject_if: :all_blank

  validates :name, :description, presence: true

  def ingredients=(ingredients)
    super(ingredients.reject(&:blank?).map(&:downcase))
  end

  def average_rating
    if ratings.any?
      ratings.pluck(:score).sum.to_d / ratings.count
    else
      0
    end
  end

  def to_s
    name
  end
end
