class AddUserIdToPantryIngredient < ActiveRecord::Migration
  def change
    add_column :pantry_ingredients, :user_id, :integer
  end
end
