require './lib/van'
require './lib/docking_station'
require './lib/bike'

describe Van do

  it 'it initialized with a capacity of 20 broken bikes' do
    van = Van.new
    expect(van.capacity).to eq 5
  end

  it 'can accept broken bikes from the docking station' do
    station = DockingStation.new
    bike = Bike.new
    station.dock(bike.report_as_broken)
    van = Van.new
    station.unload_bikes(van)
    expect(van.bikes[0]).to eq bike
  end


end
