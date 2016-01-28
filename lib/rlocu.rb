module Rlocu
  RlocuError = Class.new(StandardError)

  class << self
    def configure
      yield self
    end

    def api_version
      'v2'
    end
  end
end

require 'rlocu/version'
require 'rlocu/utilities/location'
