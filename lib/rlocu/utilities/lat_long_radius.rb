module Rlocu
  module Utilities
    class LatLongRadius
      attr_reader :lat, :long, :radius
      def initialize(lat:, long:, radius: 5000)
        if !lat.is_a?(Numeric) || !long.is_a?(Numeric) || !radius.is_a?(Numeric)
          raise ArgumentError.new "Parameters must be numeric (floats)"
        end
        @lat = lat
        @long = long
        @radius = radius
      end

      def self.bounds(lat_lng1, lat_lng2)
        "#{@lat_lng1.to_s}|#{@lat_lng2.to_s}"
      end

      def to_s
        "#{lat},#{long}"
      end

      def to_h
        {'geo' => {'$in_lat_lng_radius' => [lat, long, radius]}}
      end
    end
  end
end
