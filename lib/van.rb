require './lib/docking_station'

class Van

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity
  end

  def capacity
    @capacity
  end

end
