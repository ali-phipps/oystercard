require 'journey'

describe Journey do
  subject(:journey) { Journey.new }
  let(:entry_station) { double(:station)}
  let(:exit_station) { double(:station)}


  describe '#start_station' do
    it 'set start station' do

      expect(journey.start_station(entry_station)).to eq({origin: entry_station})
    end
  end

  describe '#end_station' do
    it 'set end station' do
      expect(journey.end_station(exit_station)).to eq ({destination: exit_station})
    end
  end

  describe '#fare' do


    it 'minimum fare for complete journey' do
      journey.start_station(entry_station)
      journey.end_station(exit_station)
      expect(journey.fare).to eq 1
    end

    it 'penalty fare is charged for touch in without touch out' do
      journey.start_station(entry_station)
      expect(journey.fare).to eq 6
    end

    it 'penalty fare is charged for touch out without touch in' do
      journey.end_station(exit_station)
      expect(journey.fare).to eq 6
    end

  end
  # # move
  # it 'touch out card sets journey status' do
  #   expect(card).not_to be_in_journey
  # end
  #
  # # move to journey class
  # it 'sets journey status' do
  #   expect(card).to be_in_journey
  # end
end
