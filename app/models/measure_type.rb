class MeasureType < ActiveRecord::Base
  has_many :measure_conversions
  attr_accessible :name
end
