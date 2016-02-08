include Rlocu::Utilities

RSpec.describe LatLongRadius, '#new' do
  it 'should raise ArgumentError if lat param is not a float' do
    expect{ LatLongRadius.new(lat: '1', long: 2) }.to raise_error(ArgumentError)
  end
end
