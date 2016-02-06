include Rlocu::Utilities

RSpec.describe LatLong, '#new' do
  it 'should raise ArgumentError if lat param is not a float' do
    expect{ LatLong.new(lat: '1', long: 2) }.to raise_error(ArgumentError)
  end
end
