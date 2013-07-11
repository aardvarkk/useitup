class MeasureConversion < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :measure_type
  attr_accessible :ingredient_id, :measure_type_id, :multiplier

  def to_grams(qty)
  	# Try to select a valid conversion
  	multiplier = MeasureConversion.find_by_ingredient_id_and_measure_type_id(ingredient_id, measure_type_id).multiplier
  	return qty * multiplier
  end

end
