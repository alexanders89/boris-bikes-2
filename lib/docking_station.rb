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

  def count_working_bikes
    working_bikes = []
    @bikes.each { |bike| working_bikes << bike if bike.bike_is_working?}
    working_bikes.count
  end

  def count_broken_bikes
    broken_bikes = []
    @bikes.each { |bike| broken_bikes << bike if !bike.bike_is_working?}
    broken_bikes.count
  end

  def list_bikes
    bike_id = []
    @bikes.each { |bike| bike_id << bike.to_s}
  end


  # @var[/extract(.*?)container_end/, 1]


  # def print_header
  #   puts '    Bike ID   |   Working?    '
  #   puts ' -----------------------------'
  # end

  # def bike_count
  #   s = 's'
  #   s1 = 's'
  #   if count_working_bikes == 1
  #     s = ''
  #   end
  #   if count_broken_bikes == 1
  #     s1 = ''
  #   end
  #   "#{count_working_bikes} working bike#{s}, #{count_broken_bikes} broken bike#{s1}"
  # end
end
