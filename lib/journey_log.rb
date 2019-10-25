class JourneyLog
  attr_reader :trip_records

  def initialize
    @trip_records = []

  end

  def start_journey(origin)
    @origin = origin
  end

  def end_journey(destination)
    @current_journey = {}
    @current_journey[:origin] = @origin
    @current_journey[:destination] = destination
    @trip_records << @current_journey
    @current_journey
  end
end
