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
    DEFAULT_CAPACITY - @bikes.count
  end

end

# station = DockingStation.new
# van = Van.new
# 3.times do station.dock(Bike.new)
# end
# 7.times do station.dock((Bike.new).report_as_broken)
# end
