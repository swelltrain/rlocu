require 'rest-client'
require 'json'

module Rlocu
  class VenueQuery
    include Rlocu::Query
    attr_reader :query_fields, :return_fields
    def initialize(query_fields:, return_fields:)
      raise ArgumentError, 'Query Fields Param must be a hash of fields: values.' if !query_fields.is_a?(Hash) || query_fields.empty?

      raise ArgumentError, 'Return Fields Param must be an array of fields.' if !return_fields.is_a?(Array) || return_fields.empty?
      @query_fields = query_fields
      @return_fields = return_fields
    end

    def query
      form_data = {api_key: Rlocu.api_key, fields: return_fields, venue_queries: [query_fields] }.to_json
      result = JSON.parse(RestClient.post(base_url, form_data))
      # TODO handle failure gracefully
      result['venues'].each.reduce([]) { |accum, venue| accum << Rlocu::Venue.new(venue) }
    end
  end
end
