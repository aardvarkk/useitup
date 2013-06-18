#include <set>

#include "recipe.h"

// Add an ingredient to a recipe
void Recipe::Add(Ingredient ingredient)
{
  ingredients.insert(ingredient);
}

// See if a given recipe is possible with the supplied ingredients
bool Recipe::Possible(Ingredients supplied) const
{
  // Go through each item in the recipe and see if we have enough in our supplied set
  for (auto i = ingredients.cbegin(); i != ingredients.cend(); ++i) {
    auto s = supplied.find(*i);
    
    // Ingredient not available
    if (s == supplied.cend()) {
      return false;
    }

    // Ingredient has inadequate supply
    if (s->mass < i->mass) {
      return false;
    }
  }

  return true;
}
