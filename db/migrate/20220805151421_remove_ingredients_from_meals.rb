class RemoveIngredientsFromMeals < ActiveRecord::Migration[7.0]
  def change
    remove_column :meals, :ingredients
  end
end
