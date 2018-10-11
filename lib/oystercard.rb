class Oystercard

  MIN_FARE = 1
  MAX_BALANCE = 90


  attr_reader :balance, :entry_station, :journeys, :journey, :journey_log

  def initialize
    @balance = 0
    @journeys = []
    @journey_log = nil
  end

  def top_up(amount)
    raise "Exceeds maximum balance (#{MAX_BALANCE})" if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def touch_in(station)
    raise "Not enough money" if @balance < MIN_FARE
    if @journey_log == nil
      @journey_log = JourneyLog.new(station)
    else
      @journey_log.start(station)
    end
  end

  def touch_out(station)
    @journeys << @journey.finish(station)
    deduct(@journey.fare)
    @journey = nil
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
