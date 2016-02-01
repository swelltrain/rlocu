module Rlocu
  class VenueQuery
    attr_reader :query_fields, :return_fields
    def initialize(query_fields:, return_fields:)
      raise ArgumentError, 'Query Fields Param must be a hash of fields: values.' if !query_fields.is_a?(Hash) || query_fields.empty?

      raise ArgumentError, 'Return Fields Param must be an array of fields.' if !return_fields.is_a?(Array) || return_fields.empty?
      @query_fields = query_fields
      @return_fields = return_fields
    end
  end
end
