require './lib/van'
require './lib/docking_station'
require './lib/bike'

describe Van do

  it 'it initialized with a capacity of 20 broken bikes' do
    van = Van.new
    expect(van.capacity).to eq 5
  end


end
