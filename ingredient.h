#ifndef INGREDIENT
#define INGREDIENT

#include <vector>

#include "food_types.h"
#include "measure_types.h"

class Amount
{
public:

  static const double Unlimited;
};

class Ingredient
{
public:

  Ingredient(FoodType type);
  Ingredient(double mass, FoodType type);
  Ingredient(double number, MeasureType units, FoodType type);

protected:

  double mass;
  FoodType type;
};

typedef std::vector<Ingredient> Ingredients;

#endif