require './lib/docking_station'
require './lib/bike'

class Van

  DEFAULT_CAPACITY = 20

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
    @bikes = station.broken_bikes
  end

end

station = DockingStation.new
van = Van.new
5.times do station.dock(Bike.new)
end
5.times do station.dock((Bike.new).report_as_broken)
end
