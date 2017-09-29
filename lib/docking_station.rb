require './lib/bike'

class DockingStation

  DEFAULT_CAPACITY = 10

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def bikes
    @bikes
  end

  def release_bike
    raise "No bikes available" if empty?
    raise "No bikes available" if !working_bikes_available
    @bikes.pop
  end

  def dock(bike)
    raise "No more space" if full?
    @bikes << bike
    return @bikes[-1]
  end

  def working_bikes_available
      @bikes.any? { |bike| bike.bike_is_working?}
  end

  def empty?
    @bikes.count == 0
  end

  def full?
    @bikes.count >= DEFAULT_CAPACITY
  end



end
