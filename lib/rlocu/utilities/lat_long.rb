module Rlocu
  module Utilities
    class LatLong
      attr_reader :lat, :long
      def initialize(lat:, long:)
        if !lat.is_a?(Numeric) || !long.is_a?(Numeric)
          raise ArgumentError.new "Lat and long must be numeric (floats)"
        end
        @lat = lat
        @long = long
      end

      def self.bounds(lat_lng1, lat_lng2)
        "#{@lat_lng1.to_s}|#{@lat_lng2.to_s}"
      end

      def to_s
        "#{lat},#{long}"
      end
    end
  end
end
