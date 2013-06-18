#ifndef RECIPE
#define RECIPE

#include <exception>
#include <string>
#include <vector>

#include "ingredient.h"

typedef std::string Step;
typedef std::vector<Step> Steps;

class IngredientMembership : public std::exception {};

class Recipe
{
public:

  void   Add(Ingredient const& ingredient);
  double Possible(Ingredients const& on_hand, Ingredients const& pantry) const;

protected:

  std::string name;
  Ingredients ingredients;
  Steps       steps;
};

typedef std::vector<Recipe> Recipes;

#endif