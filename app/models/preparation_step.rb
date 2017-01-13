class PreparationStep < ApplicationRecord
  belongs_to :drink

  validates :title, :description, presence: true
end
