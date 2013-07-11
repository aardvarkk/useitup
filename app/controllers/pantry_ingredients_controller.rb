class PantryIngredientsController < ApplicationController

  before_filter :authenticate_user!

  def create
    p = PantryIngredient.create(params[:pantry_ingredient])
    p.user_id = current_user
    current_user.pantry_ingredients << p
    redirect_to current_user
  end

  def new
    @pantry_ingredient = PantryIngredient.new
  end

  def destroy
    @pantry_ingredient = PantryIngredient.find(params[:id])
    @pantry_ingredient.destroy
    redirect_to current_user
  end
  
end
