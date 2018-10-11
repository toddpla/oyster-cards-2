require 'journey_log'

describe JourneyLog do

let(:journey) { double(:journey) }
subject {described_class.new(journey)}

    it 'should initialise with journey class' do
      expect(subject.current_journey).to eq journey
    end

end
