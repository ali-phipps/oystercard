class Oystercard
  attr_reader :balance, :journey_history

  LIMIT = 90
  MINIMUM_FARE = 1
  PENALTY_FARE = 6

  def initialize
    @balance = 0
    @journey_history = [] # this needs to move to journey_log
  end

  def top_up(value)
    raise "top up limit #{LIMIT} reached" if @balance + value > LIMIT

    @balance += value
  end

  def touch_in(origin) # some functionality needs to move i.e. journey started
    raise "Balance too low to touch in. Minimum balance is £#{ MINIMUM_FARE }" if @balance < MINIMUM_FARE

    if @journey.nil?
      start_journey(origin)
    else
      if @journey.complete?
        start_journey(origin)
      else
        deduct(@journey.fare)
      end
    end
  end

  def touch_out(destination) # some functionality needs to move to journey finish
    if @journey.complete?
      @journey = Journey.new
    end

      @journey.end_station(destination) # anything which involves writing to journey history needs to move.
      @journey_history << @journey.current_journey
      deduct(@journey.fare)
  end

  private

  def start_journey(origin) # this needs to move
    @journey = Journey.new
    @journey.start_station(origin)
  end

  def deduct(value)
    @balance -= value
  end

end
