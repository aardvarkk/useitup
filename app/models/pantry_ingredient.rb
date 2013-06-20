class PantryIngredient < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :user

  attr_accessible :ingredient_id
end
