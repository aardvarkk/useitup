#ifndef INGREDIENT
#define INGREDIENT

#include <set>

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

  // Required for ordering the set
  bool operator<(Ingredient const& i) const;

protected:

  double mass;
  FoodType type;

  // Needs access to check masses
  friend class Recipe;
};

typedef std::set<Ingredient> Ingredients;

#endif