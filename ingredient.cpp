#include "conversions.h"
#include "ingredient.h"

const double Amount::Unlimited = std::numeric_limits<double>::infinity();

// For pantry items -- unlimited amount
Ingredient::Ingredient(FoodType type) :
  min_mass(Amount::Unlimited),
  max_mass(Amount::Unlimited),
  type(type)
{
}

Ingredient::Ingredient(double mass, FoodType type) :
  min_mass(mass),
  max_mass(mass),
  type(type)
{
}

Ingredient::Ingredient(double qty, MeasureType units, FoodType type) :
  min_mass(Conversions::ToMass(qty, units, type)),
  max_mass(Conversions::ToMass(qty, units, type)),
  type(type)
{
}

Ingredient::Ingredient(double min_mass, double max_mass, FoodType type) :
  min_mass(min_mass),
  max_mass(max_mass),
  type(type)
{
}

Ingredient::Ingredient(double min_qty, double max_qty, MeasureType units, FoodType type) :
  min_mass(Conversions::ToMass(min_qty, units, type)),
  max_mass(Conversions::ToMass(max_qty, units, type)),
  type(type)
{
}

bool Ingredient::operator<(Ingredient const& i) const
{
  return type < i.type;
}
