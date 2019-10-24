class Oystercard
  attr_reader :balance, :journey_history

  LIMIT = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @journey_history = []
    @current_journey = {}
  end

  def top_up(value)
    raise "top up limit #{LIMIT} reached" if @balance + value > LIMIT

    @balance += value
  end

  def touch_in(origin)
    raise "Balance too low to touch in. Minimum balance is £#{MINIMUM_BALANCE}" if @balance < MINIMUM_BALANCE

    
  end

  def touch_out(destination)
    deduct(1)
    # TODO move to new journey class
    @current_journey[:destination] = destination
    @journey_history << @current_journey
    @current_journey = {}
  end

  # TODO move ?
  def in_journey?
    @current_journey.key?(:origin) && !@current_journey.key?(:destination)
  end

  private

  def deduct(value)
    @balance -= value
  end

end
