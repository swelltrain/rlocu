require 'test/unit'
require_relative '../lib/rlocu'
require 'JSON'

class VenueTest < Test::Unit::TestCase
  include Rlocu
  def test_menu_setter
    params = {name: 'bamboo thai', postal_code: '90278'}
    venues = Rlocu::VenueSearch.query(params)
  
    deets = Rlocu::VenueDetails.query(venues)
    

  end
end