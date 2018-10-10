require 'journey'

describe Journey do

  let (:station) {double :station}

  describe '#in_journey?' do
    it 'is true when journey started but not finished' do
      journey = Journey.new(station)
      expect(journey).to be_in_journey
    end
    it 'is false when journey started and finished' do
      journey = Journey.new(station)
      journey.finish(station)
      expect(journey).not_to be_in_journey
    end
  end
end
