class User < ApplicationRecord
  devise :database_authenticatable, :registerable

  validates :password, :email, presence: true
end
