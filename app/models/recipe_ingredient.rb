class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient
  belongs_to :measure_type

  attr_accessible :ingredient_id, :measure_type_id, :qty

  def in_grams
    (measure_type.volumetric ? ingredient.density : 1) * measure_type.multiplier * qty
  end

end
