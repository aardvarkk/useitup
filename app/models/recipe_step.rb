class RecipeStep < ActiveRecord::Base
  belongs_to :recipe
  attr_accessible :recipe_id, :step
end
