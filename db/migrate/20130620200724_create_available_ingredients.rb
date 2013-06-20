class CreateAvailableIngredients < ActiveRecord::Migration
  def change
    create_table :available_ingredients do |t|
      t.integer :user_id
      t.integer :ingredient_id
      t.float :amount

      t.timestamps
    end
  end
end
