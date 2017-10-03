require './lib/van'
require './lib/docking_station'
require './lib/bike'
require './lib/garage'


describe Van do

  it 'it initialized with a capacity of 5 broken bikes' do
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

  it 'will only accpet broken bikes' do
    station = DockingStation.new
    bike = Bike.new
    station.dock(bike.report_as_broken)
    van = Van.new
    station.unload_bikes(van)
    expect(van.bikes[0].bike_is_working?).to be false
  end

  it 'will give an error notice if there is no space on the van' do
    station = DockingStation.new
    bike = Bike.new
    6.times do station.dock(bike.report_as_broken)
    end
    van = Van.new
    expect { station.unload_bikes(van) }.to raise_error("Not enough space on van")
  end

  it 'clears all broken bikes to the garage' do
    station = DockingStation.new
    bike = Bike.new
    5.times do station.dock(bike.report_as_broken)
    end
    van = Van.new
    station.unload_bikes(van)
    garage = Garage.new
    van.deposit_bikes(garage)
    expect(van.bikes.count).to eq 0
  end





end
