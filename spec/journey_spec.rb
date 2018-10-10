require 'journey'

describe Journey do

  let (:station) {double :station}

    context 'given an entry station' do
    subject {described_class.new(station)}

    describe '#in_journey?' do
      it 'is true when journey started but not finished' do
        expect(subject).to be_in_journey
      end
      it 'is false when journey started and finished' do
        subject.finish(station)
        expect(subject).not_to be_in_journey
      end
    end

    context 'and an exit station' do
      before(:each) do
        subject.instance_variable_set(:@exit_station, station)
      end
      describe '#fare' do
        it 'should return minimum fare' do
          expect(subject.fare).to eq Journey::MIN_FARE
        end
      end
    end
  end
end
