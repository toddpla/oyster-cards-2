class JourneyLog

  attr_reader :current_journey

  def initialize(station)
    start(station)
  end

  def start(station)
    @current_journey = Journey.new(station)
  end

end
