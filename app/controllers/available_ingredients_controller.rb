class AvailableIngredientsController < ApplicationController
  
  before_filter :authenticate_user!

  def create
    a = AvailableIngredient.create(params[:available_ingredient])
    a.user_id = current_user
    current_user.available_ingredients << a
    redirect_to current_user
  end

  def new
    @available_ingredient = AvailableIngredient.new
  end

  def destroy
    @available_ingredient = AvailableIngredient.find(params[:id])
    @available_ingredient.destroy
    redirect_to current_user
  end

end
