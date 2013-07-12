class AddMultiplierToMeasureType < ActiveRecord::Migration
  def change
    add_column :measure_types, :multiplier, :float
    add_column :measure_types, :volumetric, :boolean
  end
end
