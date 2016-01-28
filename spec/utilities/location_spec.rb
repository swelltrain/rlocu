include Rlocu::Utilities

RSpec.describe Location, '#new' do
  it 'should raise ArgumentError if lat param is not a float' do
    expect{ Location.new(lat: '1', long: 2) }.to raise_error(ArgumentError)
  end
end
