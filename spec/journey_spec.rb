require 'journey'

describe Journey do
  subject(:journey) { Journey.new }
  let(:entry_station) { double(:station)}
  let(:exit_station) { double(:station)}

  context 'start_station set' do
    before { journey.start_station(entry_station) }

    it 'penalty fare is charged for touch in without touch out' do
      expect(journey.fare).to eq Oystercard::PENALTY_FARE
    end

    it 'start station set, end station not set = not complete' do
      expect(journey).not_to be_complete
    end
  end

  context 'end_station set' do
    before { journey.end_station(exit_station) }

    it 'penalty fare is charged for touch out without touch in' do
      expect(journey.fare).to eq Oystercard::PENALTY_FARE
    end

    it 'start station not set, end station set = not complete' do
      expect(journey).not_to be_complete
    end
  end

  context 'both stations set' do
    before do
      journey.start_station(entry_station)
      journey.end_station(exit_station)
    end

    it 'minimum fare for complete journey' do
      expect(journey.fare).to eq Oystercard::MINIMUM_FARE
    end

    it 'start station set, end station set = complete' do
      expect(journey).to be_complete
    end
  end

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

end
