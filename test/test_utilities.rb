require 'minitest/autorun'
require_relative '../lib/rlocu'

class UtilitiesTest < MiniTest::Unit::TestCase
  include Rlocu
  def test_location_raises
    assert_raises ArgumentError do Location.new('some','silliness') end
  end

  def test_location_to_s
    l = Location.new(123.4,678)
    assert_equal '123.4,678', l.to_s
  end

  def test_encode
    #params = {name: 'bamboo thai', postal_code: '90278'}
    skip "insert your api into .config"
    #assert_equal 'api_key=YOUR_API_HERE&name=bamboo%20thai&postal_code=90278', Rlocu.encode(params)
  end

end