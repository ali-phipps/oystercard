class Journey

  attr_reader :current_journey
   def initialize
     @current_journey = {}
  end

  def start_station(entry_station)
    @current_journey[:origin] = entry_station
    @current_journey
  end

  def end_station(exit_station)
    @current_journey[:destination] = exit_station
    @current_journey
  end

  def fare
    return Oystercard::PENALTY_FARE unless complete?
    return Oystercard::MINIMUM_FARE

  end

  def complete?
    !(@current_journey[:destination].nil? or @current_journey[:origin].nil?)
  end

end
