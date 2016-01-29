require 'open-uri'

module Rlocu
  RlocuError = Class.new(StandardError)
  class << self
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

require 'rlocu/version'
require 'rlocu/utilities/location'
