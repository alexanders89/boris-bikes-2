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
    working_bike = @bikes.detect { |bike| bike.bike_is_working?  }
    @bikes.delete working_bike
    working_bike
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

  def bike_count
    working_bikes = []
    broken_bikes = []
    @bikes.each { |bike| working_bikes << bike if bike.bike_is_working?}
    @bikes.each { |bike| broken_bikes << bike if !bike.bike_is_working?}
    s = 's'
    s1 = 's'
    if working_bikes.count == 1
      s = ''
    end
    if broken_bikes.count == 1
      s1 = ''
    end
    "#{working_bikes.count} working bike#{s}, #{broken_bikes.count} broken bike#{s1}"
  end
end
