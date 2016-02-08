require 'rest-client'
require 'json'

module Rlocu
  class VenueQuery
    include Rlocu::Query

    attr_reader :return_fields
    def initialize(query_conditions:, return_fields:)
      raise ArgumentError, 'Query Conditions Param must be an array of QueryConditions.' if !query_conditions.is_a?(Array) || !query_conditions.first.is_a?(QueryCondition)

      raise ArgumentError, 'Return Fields Param must be an array of fields.' if !return_fields.is_a?(Array) || return_fields.empty?
      @query_conditions = query_conditions
      @return_fields = return_fields
    end

    def query_conditions
      @query_conditions.map(&:to_h)
    end

    def query
      form_data = {api_key: Rlocu.api_key, fields: return_fields, query_conditions: query_conditions }.to_json
      result = JSON.parse(RestClient.post(base_url, form_data))
      # TODO handle failure gracefully
      result['venues'].each.reduce([]) { |accum, venue| accum << Rlocu::Venue.new(venue) }
    end

    def query_by_location
    end
  end
end
