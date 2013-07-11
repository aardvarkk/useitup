class AddGramsToAvailableIngredient < ActiveRecord::Migration
  def change
    add_column :available_ingredients, :grams, :float
  end
end
