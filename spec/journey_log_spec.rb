require 'journey_log'

describe JourneyLog do

let(:station) { double(:station) }
let(:journey) { double(:journey) }
subject {described_class.new(station)}

    describe "#journeys" do
      it 'returns an array of journeys' do
        subject.instance_variable_set(:@journeys,[journey])
        expect(subject.journeys).to eq [journey]
      end
    end

end
