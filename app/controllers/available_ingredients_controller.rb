class AvailableIngredientsController < ApplicationController
  
  before_filter :authenticate_user!

  def create
    a = AvailableIngredient.create(:ingredient_id => params[:id], :amount => params[:amount])
    a.user_id = current_user
    current_user.available_ingredients << a
    redirect_to current_user
  end

  def new
  end

  def destroy
    AvailableIngredient.where(:user_id => current_user, :id => params[:id]).destroy_all
    redirect_to current_user
  end

end
