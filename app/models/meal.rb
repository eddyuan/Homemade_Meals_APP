class Meal < ApplicationRecord
    
    belongs_to :user
    has_many :reviews, dependent: :destroy
    has_many :orders, dependent: :destroy
    has_many :ingredientings, dependent: :destroy
    has_many :ingredients, through: :ingredientings, source: :ingredient
    
    validates :title, presence: true
    # validates :ingredients, presence: true
    validates :price, presence: true, numericality: { :greater_than_or_equal_to => 0 }


    def ingredient_names
        self.ingredients.map(&:name).join(", ")
    end

    def ingredient_names=(rhs)
        self.ingredients = rhs.strip.split(/\s*,\s*/).map do |ingredient_name|
            Ingredient.find_or_create_by(name: ingredient_name.downcase)
        end
    end


end
