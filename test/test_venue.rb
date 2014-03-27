require 'minitest/autorun'
require_relative '../lib/rlocu'
require 'JSON'

class VenueTest < MiniTest::Unit::TestCase
  include Rlocu
  def test_menu_setter

    # params = {name: 'bamboo thai', postal_code: '90278'}
    # venues = Rlocu::VenueSearch.query(params)
  
    # deets = Rlocu::VenueDetails.query(venues)
    
    skip "what would be a good way to test this when the deets could change?"    

  end
end