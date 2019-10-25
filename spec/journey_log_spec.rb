require 'journey_log'

describe JourneyLog do
  subject(:log) {JourneyLog.new}
  let(:origin) {double :station}
  let(:destination) {double :station}
    context "First time card used" do
      it "on start journey" do
        log.start_journey(origin)
        expect(log.trip_records).to be_empty
      end
      it "on end journey"  do
        log.start_journey(origin)
        log.end_journey(destination)
        expect(log.trip_records).to eq ([{ origin: origin, destination: destination }])
      end
    end
describe "Start Journey" do
  it 'sets origin' do
    expect(log.start_journey(origin)).to eq(origin)
  end
end
describe 'End journey' do
  it 'sets destination and updates log' do
    log.start_journey(origin)
    expect(log.end_journey(destination)).to eq({origin: origin, destination: destination})
  end
end
end
