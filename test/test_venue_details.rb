require 'test/unit'
require_relative '../lib/rlocu'

class VenueDetailsTest < Test::Unit::TestCase
  include Rlocu
  def test_reduce_ids
    venues = Set.new
    5.times {|n| venues << Venue.new(id: n)}
    assert_equal '0;1;2;3;4', Rlocu::VenueDetails.send(:reduce_ids, venues)
  end
end