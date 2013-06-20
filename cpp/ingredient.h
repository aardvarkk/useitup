#ifndef INGREDIENT
#define INGREDIENT

#include <set>

#include "food_types.h"
#include "measure_types.h"

typedef std::set<class AvailableIngredient> AvailableIngredients;
typedef std::set<class RecipeIngredient>    RecipeIngredients;

class Amount
{
public:

  static const double Unlimited;
};

class Ingredient
{
public:

  // Required for ordering the set
  bool operator<(Ingredient const& i) const;

protected:

  Ingredient(FoodType type);

  // The type of food
  FoodType type;
};

// A physical ingredient
// Only have a certain amount on-hand
class AvailableIngredient : public Ingredient
{
public:

  AvailableIngredient(FoodType type);
  AvailableIngredient(double mass, FoodType type);
  AvailableIngredient(double qty, MeasureType units, FoodType type);

protected:

  double mass;

  // Needs access to check masses
  friend class Recipe;
};

// A recipe ingredient
// Has min-max amounts
// May be optional
class RecipeIngredient : public Ingredient
{
public:

  RecipeIngredient(double min_mass, double max_mass, FoodType type, bool optional = false);
  RecipeIngredient(double min_qty, double max_qty, MeasureType units, FoodType type, bool optional = false);

protected:

  double            min_mass;
  double            max_mass;
  bool              optional;
  RecipeIngredients substitutes;

  // Needs access to check masses
  friend class Recipe;
};

#endif