class Ingredient < ActiveRecord::Base
  has_many :available_ingredients
  has_many :pantry_ingredients
  attr_accessible :name
end
