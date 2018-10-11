class Journey

  MIN_FARE = 1
  PENALTY_FARE = 6

  attr_reader :entry_station, :exit_station

  def initialize(entry_station:)
    @entry_station = entry_station
  end

  def finish(station)
    @exit_station = station
    self
  end

  def in_journey?
    @exit_station == nil
  end

  def complete?
    @exit_station != nil && @entry_station != nil
  end

  def fare
    complete? ? MIN_FARE : PENALTY_FARE
  end

end
