module Rlocu

  class Location
    attr_accessor :lat, :long
    def initialize(lat, long)
      if !lat.is_a?(Numeric) || !long.is_a?(Numeric)
        raise ArgumentError.new "Lat and long must be numeric (floats)" 
      end
      @lat = lat
      @long = long
    end

    def to_str
      "#{lat},#{long}"
    end
  end

  class Bounds
    def initialize(loc1, loc2)
      @loc1 = loc1
      @loc2 = loc2
    end

    def to_str
      "#{@loc1.to_str}|#{@loc2.to_str}"
    end
  end

end