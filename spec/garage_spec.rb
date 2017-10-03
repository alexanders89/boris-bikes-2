require './lib/garage'
require './lib/bike'

describe Garage do

  context 'recieving bikes' do

  it 'responds to recieve bike' do
    garage = Garage.new
    expect(garage).to respond_to :recieve_bike
  end

  it 'can store broken bikes' do
    garage = Garage.new
    bike = (Bike.new).report_as_broken
    garage.recieve_bike(bike)
    expect(garage.broken_bikes[0]).to eq bike
  end

  it 'can recieve multiple bikes from a van' do
    garage = Garage.new
    station = DockingStation.new
    van = Van.new
    5.times do station.dock((Bike.new).report_as_broken)
    end
    station.unload_bikes(van)
    van.deposit_bikes(garage)
    expect(garage.broken_bikes.count).to eq 5
  end


  # it 'can fix bikes' do
  #   garage = Garage.new
  #   bike = (Bike.new).report_as_broken
  #   garage.repair_bike(bike)
  #   expect(bike.bike_is_working?).to eq true
  # end
end
end
