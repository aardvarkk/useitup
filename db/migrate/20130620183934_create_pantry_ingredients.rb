class CreatePantryIngredients < ActiveRecord::Migration
  def change
    create_table :pantry_ingredients do |t|
      t.integer :ingredient_id

      t.timestamps
    end
  end
end
