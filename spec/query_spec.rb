include Rlocu::Query
include Rlocu::Utilities

RSpec.describe KeyValueCondition, '#new' do
  context "when condition is not one of #{KeyValueCondition::ValidConditions}" do
    it 'should raise ArgumentError' do
      expect{ KeyValueCondition.new(key: 'spec', value: 'spec', condition: 'spec') }.to raise_error(ArgumentError)
    end
  end

  context 'when condition is $in_lat_lng_radius' do
    context 'when value is not a LatLongRadius' do
      it 'should raise an ArgumentError' do
        expect{ KeyValueCondition.new(key: 'location', value: 'spec', condition: '$in_lat_lng_radius') }.to raise_error(ArgumentError)
      end
    end
  end
end

RSpec.describe QueryCondition, '#to_h' do
  let(:value) { LatLongRadius.new(lat: 1, long: 1) }

  let!(:query_condition) {QueryCondition.new(key: 'location', value: value, condition: '$in_lat_lng_radius')}

  context 'when condition is specified' do
    context 'when value is a LatLongRadius' do
      it 'should call to_a on the value' do
        expect(value).to receive(:to_a)
        query_condition.to_h
      end
    end
  end

  it 'should return a hash' do
    expect(query_condition.to_h).to be_a_kind_of(Hash)
  end
end
