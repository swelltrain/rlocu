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

      def to_s
        "#{lat},#{long}"
      end
    end
  end
end
