include Rlocu::Query

RSpec.describe QueryCondition, '#new' do
  context "when condition is not one of #{QueryCondition::ValidConditions}" do
    it 'should raise ArgumentError' do
      expect{ QueryCondition.new(key: 'spec', value: 'spec', condition: 'spec') }.to raise_error(ArgumentError)
    end
  end

  context 'when condition is in lat long radius' do
    context 'when value is not a LatLongRadius' do
      it 'should raise an ArgumentError' do
        expect{ QueryCondition.new(key: 'location', value: 'spec', condition: '$in_lat_lng_radius') }.to raise_error(ArgumentError)
      end
    end
  end
end
