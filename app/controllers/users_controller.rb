class UsersController < ApplicationController

  before_filter :authenticate_user!

  def show
    @pantry = Ingredient.where(:id => current_user.pantry_ingredients.pluck(:ingredient_id))
  end

end
