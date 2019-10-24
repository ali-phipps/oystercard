require "oystercard"

describe Oystercard do
  subject(:card) { Oystercard.new }
  let(:origin) { double :station }
  let(:destination) { double :station }

  # context 'with balance and touch in' do
  #   before do
  #     card.top_up(50)
  #     card.touch_in(origin)
  #   end
  #


  context 'with balance, touch in and touch out' do
    before do
      card.top_up(50)
      card.touch_in(origin)
      card.touch_out(destination)
    end

    it 'touch out card reduces balance by minimum fare' do
      expect { card.touch_out(destination) }.to change{ card.balance }.by -1
    end

    it 'touch out card updates journey history' do
      expect(card.journey_history).to eq([{ origin: origin, destination: destination }])
    end

    it 'creates one journey after touch in and out' do
      expect(card.journey_history.length).to eq 1
    end
  end

  context 'without balance' do

    it 'check minimum balance on touch in' do
      expect { card.touch_in(origin) }.to raise_error("Balance too low to touch in. Minimum balance is £#{Oystercard::MINIMUM_BALANCE}")
    end
  end

  describe '#top_up' do

    it 'can top up the balance' do
      expect{  card.top_up 10 }.to change{ card.balance }.by 10
    end

    it 'throws error when trying to top up past limit' do
      expect { card.top_up 100 }.to raise_error(RuntimeError, "top up limit #{Oystercard::LIMIT} reached")
    end
  end

end
