#include <cstdlib>

#include "ingredient.h"
#include "recipe.h"

int main(int argc, char* argv[])
{
  // Generate a set of on-hand ingredients
  Ingredients on_hand;
  on_hand.insert(Ingredient(4, Large, Potato));

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

  // SCORE recipes in the search results, and sort by the score
  // Some recipes may not have a score, because we don't have the ingredients for them?

  // Combine the ingredients with the pantry
  Ingredients combined;
  combined.insert(on_hand.begin(), on_hand.end());
  combined.insert(pantry.begin(), pantry.end());

  // Go through all recipes and eliminate anything that's impossible
  Recipes possible;
  for (auto i = recipes.cbegin(); i != recipes.cend(); ++i) {
    if (i->Possible(combined)) {
      possible.push_back(*i);
    }
  }

  return EXIT_SUCCESS;
}