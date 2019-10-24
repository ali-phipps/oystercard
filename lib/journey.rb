class Journey
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
    if @current_journey[:destination].nil? or @current_journey[:origin].nil? 
      6
    else
      1
    end
  end

end
