include Rlocu
require 'config_rlocu_spec_helper'

RSpec.describe VenueSearch, '#with_menus' do
  it 'returns itself' do
    venue_search = VenueSearch.new
    expect(venue_search.with_menus).to eq(venue_search)
  end
end


RSpec.describe VenueSearch, '#in_lat_long_radius' do
  it 'returns itself' do
    venue_search = VenueSearch.new
    expect(venue_search.in_lat_long_radius(lat: 1, long: 1, radius: 1)).to eq(venue_search)
  end
end

RSpec.describe VenueSearch, '#locu_id' do
  it 'returns itself' do
    venue_search = VenueSearch.new
    expect(venue_search.locu_id('spec')).to eq(venue_search)
  end
end

RSpec.describe VenueSearch, '#name' do
  it 'returns itself' do
    venue_search = VenueSearch.new
    expect(venue_search.name('spec')).to eq(venue_search)
  end
end
