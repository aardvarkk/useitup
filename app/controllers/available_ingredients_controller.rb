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
    AvailableIngredient.where(params[:available_ingredient]).destroy_all
    redirect_to current_user
  end

end
