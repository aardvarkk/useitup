class MeasureType < ActiveRecord::Base
  has_many :measure_conversions
  attr_accessible :name, :multiplier, :volumetric

  # Return measure types in alphabetical order, but with grams first
  def self.in_order
  	@measure_types = MeasureType.where('name != ?', 'Gram')
  	@measure_types.sort_by!{ |m| m[:name] }
  	@measure_types.unshift(MeasureType.where(name: 'Gram').first)
  end

end
