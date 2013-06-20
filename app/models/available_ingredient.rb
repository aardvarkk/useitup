class AvailableIngredient < ActiveRecord::Base
  belongs_to :ingredient
  belongs_to :user

  attr_accessible :amount, :ingredient_id
end
