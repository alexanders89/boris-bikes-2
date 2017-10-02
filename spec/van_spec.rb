require './lib/van'
require './lib/docking_station'
require './lib/bike'

describe Van do

  it 'it initialized with a capacity of 20 broken bikes' do
    van = Van.new
    expect(van.capacity).to eq 20
  end

  it 'can accept bikes from a docking station' do
    van = Van.new
    station = DockingStation.new
    bike = Bike.new
    station.dock(bike.report_as_broken)
    van.collect_bikes(station)
    expect(van.bikes).to eq van.bikes
  end
end
