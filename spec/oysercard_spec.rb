require 'oystercard'
describe Oystercard do

  let (:station) {double :station}
  let (:journey) {double :journey}

  describe '#balance' do
    it 'new card should have zero balance' do
      expect(subject.balance).to eq 0
    end
  end

  describe '#top_up' do
    it 'should increase balance' do
      subject.top_up(1)
      expect(subject.balance).to eq 1
    end

    it 'should raise error if exceeds maximum balance' do
      message = "Exceeds maximum balance (#{Oystercard::MAX_BALANCE})"
      expect { subject.top_up(91) }.to raise_error(message)
    end
  end

  describe '#touch_in' do
    it 'start journey' do
      subject.instance_variable_set(:@balance, 10)
      subject.touch_in(station)
      expect(subject.journey_log.current_journey).to be_in_journey
    end

    it 'raise error if balance is below min' do
      expect { subject.touch_in(station) }.to raise_error "Not enough money"
    end

    # this test relies on the Journey Class  X X X X X
    it 'should record entry station' do
      subject.instance_variable_set(:@balance, 10)
      subject.touch_in(station)
      # expect(subject.journey.entry_station).to eq station
      expect(subject.journey_log.current_journey.entry_station).to eq station
    end

  end

  describe '#touch_out' do
    it 'adds one journey to history' do
      allow(journey).to receive(:finish)
      allow(journey).to receive(:in_journey?).and_return(false)
      allow(journey).to receive(:fare).and_return(1)
      subject.instance_variable_set(:@journey, journey)
      subject.touch_out(station)
      expect(subject.journeys.length).to eq 1
    end

    it 'deducts the minimum fare' do
      allow(journey).to receive(:finish)
      allow(journey).to receive(:in_journey?).and_return(false)
      allow(journey).to receive(:fare).and_return(Oystercard::MIN_FARE)
      subject.instance_variable_set(:@journey, journey)
      expect { subject.touch_out(station) }.to change{ subject.balance }.by(-Oystercard::MIN_FARE)
    end

    it 'creates one journey after touching out' do
      allow(journey).to receive(:finish).and_return(journey)
      allow(journey).to receive(:in_journey?).and_return(false)
      allow(journey).to receive(:fare).and_return(1)
      subject.instance_variable_set(:@journey, journey)
      subject.touch_out(station)
      expect(subject.journeys[0]).to be journey
    end
  end

  describe '#journeys' do
    it 'should be empty array by default' do
      expect(subject.journeys).to eq []
    end
  end



end
