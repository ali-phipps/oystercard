class JourneyLog
  attr_reader :trip_records

  def initialize(journey = Journey.new)
    @trip_records = []
    @journey = journey

  end

  def start_journey(origin)
    # @journey = @journey_class.n
    @journey.start_station(origin)
    # @origin = origin
  end

  def end_journey(destination)
    # @current_journey = {}
    # @current_journey[:origin] = origin
    # @current_journey[:destination] = destination
    @journey.end_station(destination)
    @trip_records << @journey
    @journey
  end

end
