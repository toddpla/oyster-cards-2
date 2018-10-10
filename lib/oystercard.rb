class Oystercard

  MAX_BALANCE = 90
  MIN_FARE = 1

  attr_reader :balance, :entry_station, :journeys

  def initialize
    @balance = 0
    @journeys = []
  end

  def top_up(amount)
    raise "Exceeds maximum balance (#{MAX_BALANCE})" if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def in_journey?
    @entry_station != nil
  end

  def touch_in(station)

    raise "Not enough money" if @balance < MIN_FARE
    @entry_station = station
  end

  def touch_out(station)
    deduct(MIN_FARE)
    @journeys << { 'Entry Station' => @entry_station, 'Exit Station' => station }
    @entry_station = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
