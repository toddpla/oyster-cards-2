require 'journey_log'

describe JourneyLog do

let(:station) { double(:station) }
subject {described_class.new(station)}

    it 'should record current journey' do
      expect(subject.current_journey.entry_station).to eq station
    end

end


# allow(subject).to receive(:conditionally_reduce_quality)
# subject.instance_updates
# expect(subject).to have_received(:conditionally_reduce_quality).with({0 =>2})
