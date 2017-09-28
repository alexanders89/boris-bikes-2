require './lib/bike'

class DockingStation

  def initialize(bikes, capacity)
    @bikes = []
    @capacity = 10
  end

  def bikes
    @bikes
  end

  def release_bike
    raise "No bikes available" if empty?
    @bikes.pop
  end

  def dock(bike)
    @bikes << bike
    return @bikes[-1]
  end

  def empty?
    @bikes.count == 0
  end

end
