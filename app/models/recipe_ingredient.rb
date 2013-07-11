class RecipeIngredient < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient
  belongs_to :measure_type

  attr_accessible :ingredient_id, :measure_type_id, :qty

  before_save :convert_to_grams

  def convert_to_grams
  	# Is there a valid measure conversion?
  	mc = MeasureConversion.find_by_ingredient_id_and_measure_type_id(ingredient_id, measure_type_id)
  	
  	if mc
  		self.grams = mc.to_grams(self.qty)
  	else
  		errors[:base] << 'Invalid conversion for this combination of ingredient and measure type.'
  	end

  end

end
