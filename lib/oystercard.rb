class Oystercard

  MAX_BALANCE = 90
  MIN_FARE = 1

  attr_reader :balance, :entry_station, :journeys, :journey

  def initialize
    @balance = 0
    @journeys = []
  end

  def top_up(amount)
    raise "Exceeds maximum balance (#{MAX_BALANCE})" if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def touch_in(station)
    raise "Not enough money" if @balance < MIN_FARE
    @journey = Journey.new(station)
  end

  def touch_out(station)
    @journeys << @journey.finish(station)
    deduct(fare)
    @journey = nil
  end

  def fare
    return 6 if @journey == nil
    return 6 if @journey.in_journey?
    MIN_FARE
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
