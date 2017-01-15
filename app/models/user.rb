class User < ApplicationRecord
  devise :database_authenticatable, :registerable

  validates :email, presence: true
	has_many :drinks
  def favorites
    Drink.where(id: super)
  end

  def to_s
    "#{first_name} #{last_name}"
  end
end
