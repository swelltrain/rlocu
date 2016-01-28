module Rlocu
  module Utilities
    class Bounds
      def initialize(loc1, loc2)
        @loc1 = loc1
        @loc2 = loc2
      end

      def to_s
        "#{@loc1.to_lat_long}|#{@loc2.to_lat_long}"
      end
    end
  end
end
