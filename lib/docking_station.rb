require './lib/bike'
require './lib/van'

class DockingStation

  DEFAULT_CAPACITY = 10

  attr_accessor :bikes

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @broken_bikes = []
    @capacity = capacity
  end

  def working_bikes
    @bikes
  end

  def broken_bikes
    return @broken_bikes
  end

  def release_bike
    raise "No bikes available" if empty?
    @bikes.pop
  end

  def dock(bike)
    raise "No more space" if full?
    @broken_bikes << bike if bike.bike_is_working? == false
    @bikes << bike if bike.bike_is_working? == true
  end

  def working_bikes_available
      @bikes.count == 0
  end

  def empty?
    @bikes.count == 0
  end

  def full?
    @bikes.count + @broken_bikes.count >= DEFAULT_CAPACITY
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

  def unload_bikes(van)
    raise "Not enough space on van" if @broken_bikes.count > van.space_on_van
    until van.bikes.count == van.capacity
      van.bikes << @broken_bikes.pop
  end
    van.bikes.reverse
  end

  def van_capacity(van)
    van.capacity
  end


  # @var[/extract(.*?)container_end/, 1]


  # def print_header
  #   puts '    Bike ID   |   Working?    '
  #   puts ' -----------------------------'
  # end

  def bike_count
    s = 's'
    s1 = 's'
    if @bikes.count == 1
      s = ''
    end
    if @broken_bikes.count == 1
      s1 = ''
    end
    "#{@bikes.count} working bike#{s}, #{@broken_bikes.count} broken bike#{s1}"
  end
end
