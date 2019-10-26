require 'journey_log'

describe JourneyLog do

  let(:origin) {double :station}
  let(:destination) {double :station}
  let(:journey) { double :journey}
  subject(:log) {JourneyLog.new(journey)}

    context "First time card used" do
    before do
      allow(journey).to receive(:start_station) {{origin: origin} }
    end
      it "on start journey" do

        log.start_journey(origin)
        expect(log.trip_records).to be_empty
      end
      it "on end journey"  do
        allow(journey).to receive(:end_station) {{destination: destination} }
        log.start_journey(origin)
        log.end_journey(destination)
        expect(log.trip_records).to eq ([journey])
      end
    end

describe "Start Journey" do
  it 'sets origin' do
    allow(journey).to receive(:start_station) {{origin: origin} }
    expect(log.start_journey(origin)).to eq({origin: origin})
  end
end

describe 'End journey' do
  it 'sets destination and updates log' do
    allow(journey).to receive(:start_station) {{origin: origin} }
    allow(journey).to receive(:end_station) {{destination: destination} }
    log.start_journey(origin)
    expect(log.end_journey(destination)).to eq(journey)
  end
end

  # describe 'update journey log' do
  #   it 'writes' do
  #     expect(log.update_log(origin, destination)).to eq ([{ origin: origin, destination: destination }])
  #   end

end
