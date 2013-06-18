#include <cstdlib>

#include "ingredient.h"
#include "recipe.h"

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
  
  // Create a recipe
  Recipe r;
  r.Add(Ingredient(4, Large, Potato));
  r.Add(Ingredient(5, Large, Egg));
  r.Add(Ingredient(1, Tablespoon, Water));
  recipes.push_back(r);

  // Go through all recipes and eliminate anything that's impossible
  // Also, store the scores of anything possible
  Recipes possible;
  std::vector<double> scores;
  for (auto i = recipes.cbegin(); i != recipes.cend(); ++i) {
    double s = i->Possible(on_hand, pantry);
    if (s > 0) {
      scores.push_back(s);
      possible.push_back(*i);
    }
  }

  return EXIT_SUCCESS;
}