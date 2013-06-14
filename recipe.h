#ifndef RECIPE
#define RECIPE

#include <string>

#include "ingredient.h"

typedef std::string Step;
typedef std::vector<Step> Steps;

class Recipe
{
protected:

  std::string name;
  Ingredients ingredients;
  Steps       steps;
};

typedef std::vector<Recipe> Recipes;

#endif