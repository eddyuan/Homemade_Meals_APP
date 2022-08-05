class IngredientsController < ApplicationController

    def show
        @ingredient = Ingredient.find(params[:id])
        @meals = @ingredient.meals
    end

end
