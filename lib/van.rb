require './lib/docking_station'

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
    station.bikes.each { |bike| @bikes << bike if bike.bike_is_working?}
    @bikes
  end

end
