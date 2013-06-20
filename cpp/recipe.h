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

  void   Add(RecipeIngredient const& ingredient);
  double Possible(AvailableIngredients const& on_hand, AvailableIngredients const& pantry) const;
  static double GetAvailableAmount(RecipeIngredient const& r, AvailableIngredients const& ai);

protected:

  std::string       name;
  RecipeIngredients ingredients;
  Steps             steps;
};

typedef std::vector<Recipe> Recipes;

#endif