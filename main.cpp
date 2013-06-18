#include <cstdlib>

#include "ingredient.h"
#include "recipe.h"

int main(int argc, char* argv[])
{
  // Generate a set of on-hand ingredients
  Ingredients on_hand;
  on_hand.push_back(Ingredient(3, Large, Potato));

  // Generate stuff that's in the pantry
  Ingredients pantry;
  pantry.push_back(Ingredient(Egg));
  pantry.push_back(Ingredient(Water));

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

  return EXIT_SUCCESS;
}