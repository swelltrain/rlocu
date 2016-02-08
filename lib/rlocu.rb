
module Rlocu
  RlocuError = Class.new(StandardError)
  class << self
    attr_accessor :api_key
    def configure
      yield self
    end

    def api_version
      'v2'
    end
  end
end

require_relative 'rlocu/version'
require_relative 'rlocu/utilities/lat_long_radius'
require_relative 'rlocu/menu'
require_relative 'rlocu/venue'
require_relative 'rlocu/query'
require_relative 'rlocu/venue_query'
