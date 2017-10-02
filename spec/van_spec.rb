require './lib/van'
require './lib/docking_station'
require './lib/bike'

describe Van do

  it 'it initialized with a capacity of 20 broken bikes' do
    van = Van.new
    expect(van.capacity).to eq 5
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

  it 'will not accept more bikes than its capacity' do
    van = Van.new
    station = DockingStation.new
    6.times do station.dock((Bike.new).report_as_broken)
    end
    van.collect_bikes(station)
    expect(van.bikes.count).to eq 5

  end

end
