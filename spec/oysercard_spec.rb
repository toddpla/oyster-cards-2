require 'oystercard'
describe Oystercard do

  let (:station) {double :station}
  let (:journey_log) {double :journey_log}

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
      subject.instance_variable_set(:@journey_log, journey_log)
      allow(journey_log).to receive(:start)
      expect(journey_log).to receive(:start)
      subject.touch_in(station)
    end

    it 'raise error if balance is below min' do
      expect { subject.touch_in(station) }.to raise_error "Not enough money"
    end

    # this test relies on the Journey Class  X X X X X
    it 'should start journey log' do
      subject.instance_variable_set(:@balance, 10)
      subject.instance_variable_set(:@journey_log, journey_log)
      allow(journey_log).to receive(:start)
      expect(subject.journey_log).to receive(:start)
      subject.touch_in(station)
    end

  end

  describe '#touch_out' do
    it 'deducts the minimum fare' do
      allow(journey_log).to receive(:finish)
      current_journey = double :current_journey, fare: 1
      allow(current_journey).to receive(:fare).and_return(1)
      allow(journey_log).to receive(:current_journey).and_return(current_journey)#.and_return(Oystercard::MIN_FARE)
      subject.instance_variable_set(:@journey_log, journey_log)
      expect { subject.touch_out(station) }.to change{ subject.balance }.by(-Oystercard::MIN_FARE)
    end
  end

end
