class CreateRecipeIngredients < ActiveRecord::Migration
  def change
    create_table :recipe_ingredients do |t|
      t.integer :recipe_id, :null => false
      t.integer :ingredient_id, :null => false
      t.integer :measure_type_id, :null => false
      t.float :qty, :null => false

      t.timestamps
    end
  end
end
