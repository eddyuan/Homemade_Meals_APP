class Ingredient < ApplicationRecord
    before_save :downcase_name
    has_many :ingredientings, dependent: :destroy
    has_many :meals, through: :ingredientings, source: :meal

    validates :name, presence: true, uniqueness: {case_sensitive: false}

    private
    def downcase_name
        self.name = self.name&.downcase
    end
    
end
