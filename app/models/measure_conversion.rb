class MeasureConversion < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :measure_type
  attr_accessible :ingredient_id, :measure_type_id, :multiplier
end
