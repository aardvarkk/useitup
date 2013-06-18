#ifndef CONVERSIONS
#define CONVERSIONS

#include <exception>

#include "measure_types.h"
#include "food_types.h"

class InvalidConversion : public std::exception
{

};

class Conversions
{
public:

  static double ToMass(double number, MeasureType units, FoodType type);
};

#endif