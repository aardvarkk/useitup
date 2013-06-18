#include <algorithm>
#include <cstdlib>

#include "ingredient.h"
#include "recipe.h"

typedef std::pair<Recipe, double> ScoredRecipe;
typedef std::vector<ScoredRecipe> ScoredRecipes;

int main(int argc, char* argv[])
{
  // Generate a set of on-hand ingredients
  Ingredients on_hand;
  on_hand.insert(Ingredient(5, Large, Potato));

  // Generate stuff that's in the pantry
  Ingredients pantry;
  pantry.insert(Ingredient(Egg));
  pantry.insert(Ingredient(Water));

  // Compare against a big list of recipes
  Recipes recipes;
  
  // Create some test recipes

  Recipe r1;
  r1.Add(Ingredient(4, Large, Potato));
  r1.Add(Ingredient(5, Large, Egg));
  r1.Add(Ingredient(1, Tablespoon, Water));
  recipes.push_back(r1);

  Recipe r2;
  r2.Add(Ingredient(2, Large, Potato));
  recipes.push_back(r2);

  Recipe r3;
  r3.Add(Ingredient(5, Large, Potato));
  recipes.push_back(r3);

  // Go through all recipes and eliminate anything that's impossible
  // Also, store the scores of anything possible
  ScoredRecipes possible;
  for (auto i = recipes.cbegin(); i != recipes.cend(); ++i) {
    double s = i->Possible(on_hand, pantry);
    if (s > 0) {
      possible.push_back(std::make_pair(*i, s));;
    }
  }

  // Sort the recipes by score
  std::sort(
    possible.begin(), 
    possible.end(), 
    [](ScoredRecipe const& r1, ScoredRecipe const& r2) { return r1.second > r2.second; }
  );

  return EXIT_SUCCESS;
}