class CreateMeasureTypes < ActiveRecord::Migration
  def change
    create_table :measure_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
