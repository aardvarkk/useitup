class RemoveAmountFromIngredient < ActiveRecord::Migration
  def up
    remove_column :available_ingredients, :amount
    add_column :available_ingredients, :measure_type_id, :integer, :null => false
    add_column :available_ingredients, :qty, :float, :null => false
  end

  def down
  end
end
