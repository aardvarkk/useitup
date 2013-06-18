#include <set>

#include "recipe.h"

// Add an ingredient to a recipe
void Recipe::Add(RecipeIngredient const& ingredient)
{
  ingredients.insert(ingredient);
}

double Recipe::GetAvailableAmount(RecipeIngredient const& r, AvailableIngredients const& ai)
{
  for (auto a = ai.cbegin(); a != ai.cend(); ++a) {
    if (r.type == a->type) {
      return a->mass;
    }
  }
  return 0;
}

// See if a given recipe is possible with the supplied ingredients
double Recipe::Possible(AvailableIngredients const& on_hand, AvailableIngredients const& pantry) const
{
  double score = 0;

  // Go through each item in the recipe and see if we have enough in our supplied set
  for (auto i = ingredients.cbegin(); i != ingredients.cend(); ++i) {
    
    // Search both on hand and pantry
    double amt_on_hand   = GetAvailableAmount(*i, on_hand);
    double amt_in_pantry = GetAvailableAmount(*i, pantry);
    
    // Ingredient should be either on hand or in pantry -- not both!
    if (amt_on_hand && amt_in_pantry) {
      throw IngredientMembership();
    }

    // Ingredient not available at all
    if (!amt_on_hand && !amt_in_pantry) {
      return 0;
    }

    // Ingredient is in pantry
    // Pantry items are always unlimited
    if (amt_in_pantry) {
      // Don't add to score
      continue;
    } 
    // Ingredient is on hand
    else {
      
      // Ingredient has inadequate supply on hand
      if (amt_on_hand < i->min_mass) {
        return 0;
      }

      // Add to score because we're using up our on-hand ingredients
      // We can use up to the max amount of the recipe ingredient
      score += std::min(amt_on_hand, i->max_mass);
    }
  }

  return score;
}
