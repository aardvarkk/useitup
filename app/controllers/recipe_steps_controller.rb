class RecipeStepsController < ApplicationController
  
  before_filter :authenticate_user!

  # GET /recipe_steps/new
  # GET /recipe_steps/new.json
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_step = @recipe.recipe_steps.build

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recipe_step }
    end
  end

  # GET /recipe_steps/1/edit
  def edit
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_step = RecipeStep.find(params[:id])
  end

  # POST /recipe_steps
  # POST /recipe_steps.json
  def create
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_step = @recipe.recipe_steps.build(params[:recipe_step])

    respond_to do |format|
      if @recipe_step.save
        format.html { redirect_to @recipe, notice: 'Recipe step was successfully created.' }
        format.json { render json: @recipe_step, status: :created, location: @recipe_step }
      else
        format.html { render action: "new" }
        format.json { render json: @recipe_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /recipe_steps/1
  # PUT /recipe_steps/1.json
  def update
    @recipe_step = RecipeStep.find(params[:id])

    respond_to do |format|
      if @recipe_step.update_attributes(params[:recipe_step])
        format.html { redirect_to @recipe_step, notice: 'Recipe step was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @recipe_step.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipe_steps/1
  # DELETE /recipe_steps/1.json
  def destroy
    @recipe_step = RecipeStep.find(params[:id])
    @recipe_step.destroy

    respond_to do |format|
      format.html { redirect_to @recipe_step.recipe }
      format.json { head :no_content }
    end
  end
end
