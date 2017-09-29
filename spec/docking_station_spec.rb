require './lib/docking_station'

describe DockingStation do
  
  it 'responds to release_bike' do
    station = DockingStation.new(0,10)
    expect(station).to respond_to :release_bike
  end

  it 'only releases working bikes' do
    bike = Bike.new
    station = DockingStation.new(0,10)
    station.dock(bike)
    released_bike = station.release_bike
    expect(released_bike).to be_working
  end

  it 'can dock bikes' do
    bike = Bike.new
    station = DockingStation.new(0,10)
    station.dock(bike)
    expect(station.bikes).to include bike
  end

  it 'will not release a bike if it is empty' do
    station = DockingStation.new(0,10)
    expect {station.release_bike}.to raise_error("No bikes available")
  end

end
