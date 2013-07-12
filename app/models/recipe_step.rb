class RecipeStep < ActiveRecord::Base
  belongs_to :recipe
  attr_accessible :step
end
