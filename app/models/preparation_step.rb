class PreparationStep < ApplicationRecord
  belongs_to :drink, optional: true

  validates :title, :description, presence: true
end
