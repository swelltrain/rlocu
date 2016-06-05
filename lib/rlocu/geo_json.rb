module Rlocu
  class GeoJSON
    def initialize(geo)
      raise ArgumentError unless geo['type']
      raise ArgumentError unless geo['coordinates']
      @point = geo['type']
      @coordinates = geo['coordinates']
    end

    def longitude
      coordinates[0]
    end

    def latitude
      coordinates[1]
    end

    private

    attr_reader :coordinates
  end
end
