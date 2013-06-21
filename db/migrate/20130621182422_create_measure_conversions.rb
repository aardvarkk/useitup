class CreateMeasureConversions < ActiveRecord::Migration
  def change
    create_table :measure_conversions do |t|
      t.integer :measure_type_id
      t.integer :ingredient_id
      t.float :multiplier

      t.timestamps
    end
  end
end
