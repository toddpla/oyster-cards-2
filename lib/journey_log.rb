class JourneyLog

  attr_reader :current_journey

  def initialize(journey = Journey.new)
    start(journey)
  end

  def start(journey)
    @current_journey = journey
  end

end
