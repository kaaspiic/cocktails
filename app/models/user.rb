class User < ApplicationRecord
  devise :database_authenticatable, :registerable

  validates :email, presence: true

  def favorites
    Drink.where(id: super)
  end
end
