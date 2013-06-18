#include <set>

#include "recipe.h"

// Add an ingredient to a recipe
void Recipe::Add(Ingredient const& ingredient)
{
  ingredients.insert(ingredient);
}

// See if a given recipe is possible with the supplied ingredients
double Recipe::Possible(Ingredients const& on_hand, Ingredients const& pantry) const
{
  double score = 0;

  // Go through each item in the recipe and see if we have enough in our supplied set
  for (auto i = ingredients.cbegin(); i != ingredients.cend(); ++i) {
    
    // Search both on hand and pantry
    auto o = on_hand.find(*i);
    auto p = pantry.find(*i);
    
    // Ingredient should be either on hand or in pantry -- not both!
    if (o != on_hand.cend() && p != pantry.cend()) {
      throw IngredientMembership();
    }

    // Ingredient not available at all
    if (o == on_hand.cend() && p == pantry.cend()) {
      return 0;
    }

    // Ingredient is in pantry
    if (p != pantry.cend()) {
      // Don't add to score
      continue;
    } 
    // Ingredient is on hand
    else {
      
      // Ingredient has inadequate supply on hand
      if (o->mass < i->mass) {
        return 0;
      }

      // Add to score because we're using up our on-hand ingredients
      score += std::min(o->mass, i->mass);
    }
  }

  return score;
}
