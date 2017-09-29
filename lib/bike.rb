class Bike

  def initialize
    @working = true
  end

  def working?
    true
  end

  def report_as_broken
    @working = false
  end
end
