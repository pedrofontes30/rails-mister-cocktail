class Review < ApplicationRecord
  belongs_to :cocktail

  validates :rating, presence: true
  validates :rating, inclusion: { in: (0..5) }, numericality: { only_integer: true }
end
