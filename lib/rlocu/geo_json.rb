module Rlocu
  class GeoJSON
    def initialize(geo)
      raise ArgumentError unless geo['type']
      @point = geo
    end
  end
end
