class Cocktail < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validate :attached_photo, on: :create
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  has_one_attached :photo

  def attached_photo
    errors.add(:photo, "missing") unless photo.attached?
  end
end
