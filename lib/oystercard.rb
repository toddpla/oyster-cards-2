require_relative 'journey_log'
require_relative 'journey'

class Oystercard

  MIN_FARE = 1
  MAX_BALANCE = 90


  attr_reader :balance, :journey_log

  def initialize
    @balance = 0
    @journey_log = JourneyLog.new(journey_class: Journey)
  end

  def top_up(amount)
    raise "Exceeds maximum balance (#{MAX_BALANCE})" if @balance + amount > MAX_BALANCE
    @balance += amount
  end

  def touch_in(station)
    raise "Not enough money" if @balance < MIN_FARE
    @journey_log.start(station)
  end

  def touch_out(station)
    @journey_log.finish(station)
    deduct(@journey_log.current_journey.fare)
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
