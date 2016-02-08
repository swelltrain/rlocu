include Rlocu::Query

RSpec.describe QueryCondition, '#new' do
  context "when condition is not one of #{QueryCondition::ValidConditions}" do
    it 'should raise ArgumentError' do
      expect{ QueryCondition.new(key: 'spec', value: 'spec', condition: 'spec') }.to raise_error(ArgumentError)
    end
  end
end
