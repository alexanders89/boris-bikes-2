require './lib/docking_station'

describe DockingStation do

  it 'responds to release_bike' do
    station = DockingStation.new
    expect(station).to respond_to :release_bike
  end

  it 'only releases working bikes' do
    station = DockingStation.new
    bike = double(:bike, bike_is_working?: true)
    station.dock(bike)
    released_bike = station.release_bike
    expect(released_bike.bike_is_working?).to eq true
  end

  it 'can dock bikes' do
    station = DockingStation.new
    bike = double(:bike, bike_is_working?: true)
    station.dock(bike)
    expect(station.working_bikes).to include bike
  end

  it 'will not release a bike if it is empty' do
    station = DockingStation.new
    expect {station.release_bike}.to raise_error("No bikes available")
  end

  it 'will not allow docking once it has reahced capacity' do
    station = DockingStation.new
    10.times do station.dock(double(:bike, bike_is_working?: true))
    end
    expect {station.dock(double :bike)}.to raise_error("No more space")
  end

  it 'will not release a broken bike' do
    station = DockingStation.new
    bike = double(:bike, bike_is_working?: false)
    station.dock(bike)
    expect {station.release_bike}.to raise_error("No bikes available")
  end

  # it 'can return the status of all bikes docked there' do
  #   station = DockingStation.new
  #   bike = double(:bike)
  #   6.times do station.dock(bike)
  #   end
  #   bike = double(:bike, report_as_broken: true)
  #   4.times do station.dock((bike).report_as_broken)
  #   end
  #   expect(station.bike_count).to eq "6 working bikes, 4 broken bikes"
  # end
end
