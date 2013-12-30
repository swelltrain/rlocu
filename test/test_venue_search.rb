require 'test/unit'
require_relative '../lib/rlocu'
                        
class VenueSearchTest < Test::Unit::TestCase
  include Rlocu
  def test_bad_arg_throws_error
    assert_raise ArgumentError do Rlocu.venue_search(bad_param: 'blah') end
  end
end

