#include "conversions.h"

double Conversions::ToMass(double number, MeasureType units, FoodType type)
{
  switch (type) {
  case Egg:
    switch (units) {
    case Large: return number * 60;
    }
    break;
  case Potato:
    switch (units) {
    case Large: return number * 300;
    }
    break;
  case Water:
    switch (units) {
    case Tablespoon: return number * 15;
    }
    break;
  }

  throw InvalidConversion();
}
