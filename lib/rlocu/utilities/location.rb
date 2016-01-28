module Rlocu
  module Utilities
    class Location
      attr_reader :lat, :long
      def initialize(lat:, long:)
        if !lat.is_a?(Numeric) || !long.is_a?(Numeric)
          raise ArgumentError.new "Lat and long must be numeric (floats)"
        end
        @lat = lat
        @long = long
      end
    end
  end
end
