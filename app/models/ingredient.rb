class Ingredient < ActiveRecord::Base
  has_many :available_ingredients
  has_many :pantry_ingredients
  has_many :measure_conversions
  attr_accessible :name
end
