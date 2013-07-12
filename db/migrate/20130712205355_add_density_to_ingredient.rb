class AddDensityToIngredient < ActiveRecord::Migration
  def change
    add_column :ingredients, :density, :float
  end
end
