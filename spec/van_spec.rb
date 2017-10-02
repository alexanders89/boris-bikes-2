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
    expect(van.bikes[0]).to eq bike
  end

  it 'will only accept broken bikes' do
    van = Van.new
    station = DockingStation.new
    station.dock(Bike.new)
    expect {van.collect_bikes(station)}.to raise_error("No broken bikes in selected station")
  end

end
