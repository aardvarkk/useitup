class Recipe < ActiveRecord::Base
  belongs_to :user
  has_many :recipe_ingredients
  attr_accessible :name
end
