class AddGramsToRecipeIngredient < ActiveRecord::Migration
  def change
    add_column :recipe_ingredients, :grams, :float
  end
end
