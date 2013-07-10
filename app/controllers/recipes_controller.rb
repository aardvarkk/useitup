class RecipesController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show]

  # How many search results to generate (maximum)
  SEARCH_RESULTS = 10

  # How many IDs to generate randomly
  SEARCH_SIZE = SEARCH_RESULTS * 2

  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recipes }
    end
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @recipe }
    end
  end

  # GET /recipes/new
  # GET /recipes/new.json
  def new
    @recipe = Recipe.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recipe }
    end
  end

  # GET /recipes/1/edit
  def edit
    @recipe = Recipe.find(params[:id])
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(params[:recipe])
    @recipe.user_id = current_user.id

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render json: @recipe, status: :created, location: @recipe }
      else
        format.html { render action: "new" }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /recipes/1
  # PUT /recipes/1.json
  def update
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
      if @recipe.update_attributes(params[:recipe])
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url }
      format.json { head :no_content }
    end
  end

  def suggest

    # Search some random subset of the recipes!

    # Truly random, but probably very slow if there's lots of recipes
    # @to_score = Recipe.order('random()').limit(10)

    # Assuming nothing is deleted, we can use this method
    # If records start being deleted, we need to start "oversampling"
    # in order to get a decent number of returned records
    @to_score = Recipe.where(:id => make_rand_ids(Recipe.first.id..Recipe.last.id, SEARCH_SIZE)).order('random()').limit(SEARCH_RESULTS)

    # Score them all, and then sort by the scores
    @scores = score_recipes(@to_score, current_user.available_ingredients, current_user.pantry_ingredients)

    # Order the recipes based on the score
    @scored = @scores.sort.each_with_index.map{ |s,i| @to_score[i] if s > 0 }.reverse

  end

private

  def make_rand_ids(range, count)
    ids = []
    count.times do 
      ids << rand(range)
    end
    return ids
  end

  def score_recipes(recipes, available, pantry)
    scores = []

    # Generate a score based on how much of our available ingredients we use
    recipes.each do |r|

      # Go through each of the ingredients in the recipe
      r.recipe_ingredients.each do |ri|

        # If we don't have enough available and it's not in the pantry, we can'd make it!
        if true
          scores << rand()
          break
        end
      end

    end

    return scores
  end

end
