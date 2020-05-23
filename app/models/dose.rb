class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  validates :quantity, presence: true
  validates :ingredient, uniqueness: { scope: :cocktail }
end
