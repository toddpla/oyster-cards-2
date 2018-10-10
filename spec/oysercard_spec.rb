require 'oystercard'
describe Oystercard do

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

  describe '#deduct' do
    it 'should deduct money from balance' do
      subject.instance_variable_set(:@balance, 10)
      subject.deduct(1)
      expect(subject.balance).to eq 9
    end
  end

  describe '#in_journey?' do
    it 'is false' do
      expect(subject).not_to be_in_journey
    end
    it 'is true' do
      subject.instance_variable_set(:@in_journey, true)
      expect(subject).to be_in_journey
    end
  end

  describe '#touch_in' do
    it 'start journey' do
      subject.touch_in
      expect(subject).to be_in_journey
    end
  end

  describe '#touch_out' do
    it 'ends journey' do
      subject.touch_out
      expect(subject).not_to be_in_journey
    end
  end

end
