module Rlocu
  class VenueQuery
    def initialize(query_fields:, return_fields:)
      raise ArgumentError, 'Query Fields Param must be a hash of fields: values.' unless query_fields.is_a? Hash

      raise ArgumentError, 'Return Fields Param must be an array of fields.' if !return_fields.is_a?(Array) || return_fields.empty?
    end
  end
end
