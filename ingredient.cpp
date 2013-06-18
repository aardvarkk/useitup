#include "conversions.h"
#include "ingredient.h"

const double Amount::Unlimited = std::numeric_limits<double>::infinity();

Ingredient::Ingredient(FoodType type) :
  mass(Amount::Unlimited),
  type(type)
{
}


Ingredient::Ingredient(double mass, FoodType type) :
  mass(mass),
  type(type)
{
}

Ingredient::Ingredient(double number, MeasureType units, FoodType type) :
  mass(Conversions::ToMass(number, units, type)),
  type(type)
{
}
