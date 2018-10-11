class JourneyLog

  attr_reader :current_journey, :journeys

  def initialize(station)
    start(station)
  end

  def start(station)
    current_journey(station)
  end

  def finish(station)
    @journeys << @current_journey.finish(station)
    @current_journey = nil
  end

  private

  def current_journey(station)
    if @current_journey == nil
      @current_journey = Journey.new(station)
    else
      @current_journey
    end  
  end

end
