class AvailableIngredient < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :measure_type
  belongs_to :user

  attr_accessible :qty, :ingredient_id, :measure_type_id

  def in_grams
	(measure_type.volumetric ? ingredient.density : 1) * measure_type.multiplier * qty
  end

end
