#include "conversions.h"
#include "ingredient.h"

const double Amount::Unlimited = std::numeric_limits<double>::infinity();

bool Ingredient::operator<(Ingredient const& i) const
{
  return type < i.type;
}

Ingredient::Ingredient(FoodType type) :
  type(type)
{
}

AvailableIngredient::AvailableIngredient(FoodType type) :
  Ingredient(type),
  mass(Amount::Unlimited)
{
}

AvailableIngredient::AvailableIngredient(double mass, FoodType type) :
  Ingredient(type),
  mass(mass)
{
}

AvailableIngredient::AvailableIngredient(double qty, MeasureType units, FoodType type) :
  Ingredient(type),
  mass(Conversions::ToMass(qty, units, type))
{
}

RecipeIngredient::RecipeIngredient(double min_mass, double max_mass, FoodType type, bool optional) :
  Ingredient(type),
  min_mass(min_mass),
  max_mass(max_mass),
  optional(optional)
{
}

RecipeIngredient::RecipeIngredient(double min_qty, double max_qty, MeasureType units, FoodType type, bool optional) :
  Ingredient(type),
  min_mass(Conversions::ToMass(min_qty, units, type)),
  max_mass(Conversions::ToMass(max_qty, units, type)),
  optional(optional)
{
}