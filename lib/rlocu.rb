require 'open-uri'

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

    def encode(params={})
      s = params.reduce("api_key=#{Rlocu.api_key}&") {|memo,(key,val)| memo << "#{key.to_s}=#{val}&"}
      URI::encode(s.chop)
    end
  end
end

require_relative 'rlocu/version'
require_relative 'rlocu/utilities/location'
require_relative 'rlocu/utilities/bounds'
require_relative 'rlocu/query'
require_relative 'rlocu/venue_query'
require_relative 'rlocu/menu_item_query'
