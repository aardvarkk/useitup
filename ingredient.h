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
  Ingredient(double qty, MeasureType units, FoodType type);
  Ingredient(double min_mass, double max_mass, FoodType type);
  Ingredient(double min_qty, double max_qty, MeasureType units, FoodType type);

  // Required for ordering the set
  bool operator<(Ingredient const& i) const;

protected:

  double   min_mass;
  double   max_mass;
  FoodType type;

  // Needs access to check masses
  friend class Recipe;
};

typedef std::set<Ingredient> Ingredients;

#endif