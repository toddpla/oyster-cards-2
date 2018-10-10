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


end
