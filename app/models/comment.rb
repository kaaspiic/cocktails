class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :drink

  validates :text, presence: true
end
