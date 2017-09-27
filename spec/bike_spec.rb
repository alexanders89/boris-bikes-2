require './lib/bike'

describe Bike do
  it 'responds to is working' do
    expect(subject).to respond_to :working?
  end
end
