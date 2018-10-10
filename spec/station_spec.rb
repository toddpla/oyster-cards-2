require 'station'

describe Station do
  describe '#zone' do
    it 'should initialize with zone' do
      station = Station.new(1, "name")
      expect(station.zone).to eq 1
    end
  end

  describe '#name' do
    it 'should initialize with name' do
      station = Station.new(1, "name")
      expect(station.name).to eq "name"
    end
  end
end
