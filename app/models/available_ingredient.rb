class AvailableIngredient < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :measure_type
  belongs_to :user

  attr_accessible :qty, :ingredient_id, :measure_type_id
end
