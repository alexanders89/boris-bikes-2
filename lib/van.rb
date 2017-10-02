require './lib/docking_station'
require './lib/bike'

class Van

  DEFAULT_CAPACITY = 5

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def bikes
    @bikes
  end

  def capacity
    @capacity
  end

  def collect_bikes(station)
    raise "No broken bikes in selected station" if station.broken_bikes.count == 0
    @bikes = station.broken_bikes[0...DEFAULT_CAPACITY]
    station.unload_broken_bikes
  end

end

# station = DockingStation.new
# van = Van.new
# 3.times do station.dock(Bike.new)
# end
# 7.times do station.dock((Bike.new).report_as_broken)
# end
