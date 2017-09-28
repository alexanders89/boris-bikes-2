require './lib/bike'

class DockingStation

  def initialize(bikes, capacity)
    @bikes = []
    @capacity = 10
  end

  def release_bike
    @bikes.pop
  end

  def dock(bike)
    @bikes << bike
  end

end
