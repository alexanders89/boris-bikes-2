require './lib/bike'

describe Bike do
  it 'responds to is working' do
    expect(subject).to respond_to :working?
  end

  it 'can be reported as broken' do
    bike = Bike.new
    expect(bike).to respond_to :report_as_broken
  end
end
