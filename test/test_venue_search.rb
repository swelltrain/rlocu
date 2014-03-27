                        
class VenueSearchTest < MiniTest::Unit::TestCase
  include Rlocu
  def test_bad_arg_throws_error
    assert_raises ArgumentError do VenueSearch.query(bad_param: 'blah') end
  end

  def test_venue_search
    params = {name: 'bamboo thai', postal_code: '90278'}
    venues = VenueSearch.query(params)
    assert_equal 'Bamboo Thai Bistro', venues[0].name
  end

  def test_venue_search_block
    params = {postal_code: '90278'}
    # the search will only return 25 so we can be pretty confident this wont change
    str = ''
    VenueSearch.query(params) do |p| 
      str << p.region
    end
    assert_equal 'CA'*25, str
  end
end

