module Rlocu
  class GeoJSON
    def initialize(geo)
      raise ArgumentError unless geo['type']
      raise ArgumentError unless geo['coordinates']
      @point = geo['type']
    end
  end
end
