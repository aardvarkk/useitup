class AvailableIngredientsController < ApplicationController
  
  before_filter :authenticate_user!

  def create
    @available_ingredient = current_user.available_ingredients.build(params[:available_ingredient])

    respond_to do |format|
      if @available_ingredient.save
        format.html { redirect_to current_user, notice: 'Recipe ingredient was successfully created.' }
        format.json { render json: @available_ingredient, status: :created, location: @recipe_ingredient }
      else
        format.html { render action: "new" }
        format.json { render json: @available_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  def new
    @available_ingredient = current_user.available_ingredients.build
  end

  def destroy
    @available_ingredient = AvailableIngredient.find(params[:id])
    @available_ingredient.destroy
    redirect_to current_user
  end

end
