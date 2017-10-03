require './lib/bike'

class Garage

  DEFAULT_CAPACITY = 50

  def initialize(capacity = DEFAULT_CAPACITY)
    @broken_bikes = []
    @fixed_bikes = []
    @capacity = capacity
  end

  def broken_bikes
    @broken_bikes
  end

  def fixed_bikes
    @fixed_bikes
  end

  def recieve_bike(bike)
    @broken_bikes << bike
  end

  def fix_bikes
    @broken_bikes.each do |bike|
      bike.repair_bike
      @fixed_bikes << bike
    end
    @broken_bikes.clear
  end

end
