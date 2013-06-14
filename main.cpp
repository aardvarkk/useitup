#include <cstdlib>

#include "ingredient.h"
#include "recipe.h"

int main(int argc, char* argv[])
{
  // Generate a set of on-hand ingredients
  Ingredients on_hand;
  on_hand.push_back(Ingredient(Rhubarb, 0.2));

  // Compare against a big list of recipes
  Recipes recipes;

  return EXIT_SUCCESS;
}