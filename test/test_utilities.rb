require 'test/unit'
require_relative '../lib/utilities.rb'

class UtilitiesTest < Test::Unit::TestCase
  include Rlocu
  def test_location_raises
    assert_raise ArgumentError do Location.new('some','silliness') end
  end

  def test_location_to_s
    l = Location.new(123.4,678)
    assert_equal '123.4,678', l.to_s
  end
end