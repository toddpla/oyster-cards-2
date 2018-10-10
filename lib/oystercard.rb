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
    deduct(MIN_FARE)
    @journeys << @journey.finish(station)
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
