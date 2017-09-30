require './lib/van'

describe Van do

  it 'it initialized with a capacity of 20 broken bikes' do
    van = Van.new
    expect(van.capacity).to eq 20
  end
end
