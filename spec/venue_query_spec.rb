include Rlocu

RSpec.describe VenueQuery, '#new' do
  it 'should raise ArgumentError unless query_fields is a hash' do
    expect{ VenueQuery.new(query_fields: 'spec', return_fields: ['spec']) }.to raise_error(ArgumentError)
  end

  it 'should raise ArgumentError unless return_fields is an array' do
    expect{ VenueQuery.new(query_fields: {field: 'spec'}, return_fields: 'spec') }.to raise_error(ArgumentError)
  end

  it 'should raise ArgumentError if return_fields is empty' do
    expect{ VenueQuery.new(query_fields: {field: 'spec'}, return_fields: []) }.to raise_error(ArgumentError)
  end

  it 'should raise ArgumentError if query_fields is empty' do
    expect{ VenueQuery.new(query_fields: {}, return_fields: ['spec']) }.to raise_error(ArgumentError)
  end
end
