class CreateIngredientings < ActiveRecord::Migration[7.0]
  def change
    create_table :ingredientings do |t|
      t.references :ingredient, null: false, foreign_key: true
      t.references :meal, null: false, foreign_key: true

      t.timestamps
    end
  end
end
