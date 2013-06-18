#ifndef RECIPE
#define RECIPE

#include <string>
#include <vector>

#include "ingredient.h"

typedef std::string Step;
typedef std::vector<Step> Steps;

class Recipe
{
public:

  void Add(Ingredient ingredient);
  bool Possible(Ingredients supplied) const;

protected:

  std::string name;
  Ingredients ingredients;
  Steps       steps;
};

typedef std::vector<Recipe> Recipes;

#endif