module Rlocu
  class VenueSearch
    def initialize(return_fields: [])
      @return_fields = return_fields.empty? ? %w{locu_id name location description menus} : return_fields
      @key_value_conditions = []
      @venue_query = nil
    end

    def with_menus
      @key_value_conditions << QueryBuilder::KeyValueCondition.new(key: 'menus', value: true, condition: '$present')
      self
    end

    def in_lat_long_radius(lat:, long:, radius:)
      lat_long_radius = Utilities::LatLongRadius.new(lat: lat, long: long, radius: radius)
      @key_value_conditions << QueryBuilder::KeyValueCondition.new(key: 'location', value: lat_long_radius, condition: '$in_lat_lng_radius')
      self
    end

    def locu_id(locu_id)
      @key_value_conditions << QueryBuilder::KeyValueCondition.new(key: 'locu_id', value: locu_id)
      self
    end

    def search
      conditions = [QueryBuilder::QueryCondition.new(key_value_conditions: key_value_conditions)]
      venue_query = VenueQuery.new(query_conditions: conditions, return_fields: return_fields)
      venue_query.query
    end

    private
    attr_reader :return_fields, :key_value_conditions
  end
end
