class CreateRecipeSteps < ActiveRecord::Migration
  def change
    create_table :recipe_steps do |t|
      t.integer :recipe_id, :null => false
      t.text :step

      t.timestamps
    end
  end
end
