#ifndef INGREDIENT
#define INGREDIENT

#include <vector>

#include "food_types.h"

class Ingredient
{
public:

  Ingredient(FoodType type, double amount);

protected:

  FoodType type;
  double amount; // should always? be mass
};

typedef std::vector<Ingredient> Ingredients;

#endif