class Ingredienting < ApplicationRecord
  belongs_to :ingredient
  belongs_to :meal


  validates :meal_id, uniqueness: {scope: :ingredient_id}
end
