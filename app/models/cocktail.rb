class Cocktail < ApplicationRecord
  has_many_attached :photos
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  validates :name, uniqueness: true
  validates :name, presence: true
end
