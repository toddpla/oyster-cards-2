class JourneyLog

  attr_reader :current_journey, :journeys

  def initialize(journey_class:)
    @journey_class = journey_class
    @journeys = []
  end

  def start(station)
    @current_journey = journey_class.new(entry_station: station)
  end

  def finish(station)
    @journeys << @current_journey.finish(station)
    @current_journey = nil
  end

  private

  def current_journey
    @current_journey ||= journey_class.new
  end

end
