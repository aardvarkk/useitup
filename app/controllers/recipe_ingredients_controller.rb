class RecipeIngredientsController < ApplicationController

  before_filter :authenticate_user!
  
  # GET /recipe_ingredients/new
  # GET /recipe_ingredients/new.json
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_ingredient = RecipeIngredient.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recipe_ingredient }
    end
  end

  # POST /recipe_ingredients
  # POST /recipe_ingredients.json
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_ingredient = RecipeIngredient.new(params[:recipe_ingredient])
    @recipe_ingredient.recipe = @recipe

    respond_to do |format|
      if @recipe_ingredient.save
        format.html { redirect_to @recipe_ingredient.recipe, notice: 'Recipe ingredient was successfully created.' }
        format.json { render json: @recipe_ingredient, status: :created, location: @recipe_ingredient }
      else
        format.html { render action: "new" }
        format.json { render json: @recipe_ingredient.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_ingredients/1
  # DELETE /recipe_ingredients/1.json
  def destroy
    @recipe_ingredient = RecipeIngredient.find(params[:id])
    @recipe_ingredient.destroy

    respond_to do |format|
      format.html { redirect_to @recipe_ingredient.recipe }
      format.json { head :no_content }
    end
  end
end
