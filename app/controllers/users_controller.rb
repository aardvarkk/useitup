class UsersController < ApplicationController

  before_filter :authenticate_user!

  # How many search results to generate (maximum)
  SEARCH_RESULTS = 10

  # How many IDs to generate randomly
  SEARCH_SIZE = SEARCH_RESULTS * 2

  def show
    @available = current_user.available_ingredients
    @pantry = current_user.pantry_ingredients
  end

  def search
  	# Search some random subset of the recipes!

  	# Truly random, but probably very slow if there's lots of recipes
  	# @to_score = Recipe.order('random()').limit(10)

  	# Assuming nothing is deleted, we can use this method
  	# If records start being deleted, we need to start "oversampling"
  	# in order to get a decent number of returned records
  	@to_score = Recipe.where(:id => make_rand_ids(Recipe.first.id..Recipe.last.id, SEARCH_SIZE)).order('random()').limit(SEARCH_RESULTS)

  	# Score them all, and then sort by the scores
  	@scores = score_recipes(@to_score)

  	# Order the recipes based on the score
  	@scored = @scores.sort.each_with_index.map{ |s,i| @to_score[i] }

  end

private

  def make_rand_ids(range, count)
  	ids = []
  	count.times do 
  		ids << rand(range)
  	end
  	return ids
  end

  def score_recipes(recipes)
  	scores = []
  	recipes.each do |r|
  		scores << rand()
  	end
  	return scores
  end

end
