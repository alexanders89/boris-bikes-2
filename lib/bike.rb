class Bike

  attr_accessor :broken

  def initialize(broken = false)
    @broken = broken
  end

  def bike_is_working?
    !@broken
  end

  def report_as_broken
    @broken = true
  end
end
