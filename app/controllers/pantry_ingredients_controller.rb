class PantryIngredientsController < ApplicationController

  before_filter :authenticate_user!

  def create
    p = PantryIngredient.create(:ingredient_id => params[:id])
    p.user_id = current_user
    current_user.pantry_ingredients << p
    redirect_to current_user
  end

  def new
  end

  def destroy
    PantryIngredient.where(:user_id => current_user, :id => params[:id]).destroy_all
    redirect_to current_user
  end
  
end
