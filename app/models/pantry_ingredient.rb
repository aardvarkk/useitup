class PantryIngredient < ActiveRecord::Base
  has_one :ingredient
  has_one :user

  attr_accessible :ingredient_id
end
